// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.idealo.mapping.content.web;

import de.idealo.mapping.content.domain.Mapping;
import de.idealo.mapping.content.web.MappingController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MappingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MappingController.create(@Valid Mapping mapping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mapping);
            return "mappings/create";
        }
        uiModel.asMap().clear();
        mapping.persist();
        return "redirect:/mappings/" + encodeUrlPathSegment(mapping.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MappingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Mapping());
        return "mappings/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String MappingController.show(@PathVariable("id_") Long id_, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("mapping", Mapping.findMapping(id_));
        uiModel.addAttribute("itemId", id_);
        return "mappings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MappingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("mappings", Mapping.findMappingEntries(firstResult, sizeNo));
            float nrOfPages = (float) Mapping.countMappings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("mappings", Mapping.findAllMappings());
        }
        addDateTimeFormatPatterns(uiModel);
        return "mappings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MappingController.update(@Valid Mapping mapping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mapping);
            return "mappings/update";
        }
        uiModel.asMap().clear();
        mapping.merge();
        return "redirect:/mappings/" + encodeUrlPathSegment(mapping.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String MappingController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, Mapping.findMapping(id_));
        return "mappings/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String MappingController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Mapping mapping = Mapping.findMapping(id_);
        mapping.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/mappings";
    }
    
    void MappingController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("mapping_created_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void MappingController.populateEditForm(Model uiModel, Mapping mapping) {
        uiModel.addAttribute("mapping", mapping);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String MappingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
