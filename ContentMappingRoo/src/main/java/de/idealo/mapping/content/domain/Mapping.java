package de.idealo.mapping.content.domain;
import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.validation.constraints.NotNull;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Mapping {

    /**
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @NotNull
    @Column(name = "id", unique = true)
    private Long id;

    /**
     */
    @NotNull
    private String source;

    /**
     */
    @NotNull
    private String target;

    /**
     */
    @NotNull
    @Column(updatable = false)
    @DateTimeFormat(style = "M-")
    private Date created = new Date();

    /**
     */
    @NotNull
    private String country;

}
