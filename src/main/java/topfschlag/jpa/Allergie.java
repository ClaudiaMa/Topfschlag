package topfschlag.jpa;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Allergie implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToMany
    List<Rezept> rezepten = new ArrayList<>();
    
    private String name = "";

    //<editor-fold defaultstate="collapsed" desc="Konstruktoren">
    public Allergie() {
    }
    
    public Allergie(Long id, String name) {
        this.id = id;
        this.name = name;
    }
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Getter und Setter">
    public Long getId() {
        return id;
    }
    
    public List<Rezept> getRezepten() {
        return rezepten;
    }
    
    public String getName() {
        return name;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public void setRezepten(List<Rezept> rezepten) {
        this.rezepten = rezepten;
    }
    
    public void setName(String name) {
        this.name = name;
    }
//</editor-fold>    
}
