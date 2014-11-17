package de.idealo.mapping.content.web;
import de.idealo.mapping.content.domain.Mapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mappings")
@Controller
@RooWebScaffold(path = "mappings", formBackingObject = Mapping.class)
public class MappingController {
}
