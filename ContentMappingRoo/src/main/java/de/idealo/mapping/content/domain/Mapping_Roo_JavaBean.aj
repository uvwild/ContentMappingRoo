// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.idealo.mapping.content.domain;

import de.idealo.mapping.content.domain.Mapping;
import java.util.Date;

privileged aspect Mapping_Roo_JavaBean {
    
    public Long Mapping.getId() {
        return this.id;
    }
    
    public void Mapping.setId(Long id) {
        this.id = id;
    }
    
    public String Mapping.getSource() {
        return this.source;
    }
    
    public void Mapping.setSource(String source) {
        this.source = source;
    }
    
    public String Mapping.getTarget() {
        return this.target;
    }
    
    public void Mapping.setTarget(String target) {
        this.target = target;
    }
    
    public Date Mapping.getCreated() {
        return this.created;
    }
    
    public void Mapping.setCreated(Date created) {
        this.created = created;
    }
    
    public String Mapping.getCountry() {
        return this.country;
    }
    
    public void Mapping.setCountry(String country) {
        this.country = country;
    }
    
}