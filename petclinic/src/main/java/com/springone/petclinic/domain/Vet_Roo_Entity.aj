// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springone.petclinic.domain;

import com.springone.petclinic.domain.Vet;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Vet_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Vet.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Vet.id;
    
    @Version
    @Column(name = "version")
    private Integer Vet.version;
    
    public Long Vet.getId() {
        return this.id;
    }
    
    public void Vet.setId(Long id) {
        this.id = id;
    }
    
    public Integer Vet.getVersion() {
        return this.version;
    }
    
    public void Vet.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Vet.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Vet.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Vet attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Vet.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Vet Vet.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Vet merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Vet.entityManager() {
        EntityManager em = new Vet().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Vet.countVets() {
        return entityManager().createQuery("select count(o) from Vet o", Long.class).getSingleResult();
    }
    
    public static List<Vet> Vet.findAllVets() {
        return entityManager().createQuery("select o from Vet o", Vet.class).getResultList();
    }
    
    public static Vet Vet.findVet(Long id) {
        if (id == null) return null;
        return entityManager().find(Vet.class, id);
    }
    
    public static List<Vet> Vet.findVetEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Vet o", Vet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}