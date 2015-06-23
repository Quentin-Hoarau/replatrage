package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Partenaire;

public interface PartenaireService
{
	public void addPartenaire(Partenaire p);
    public void updatePartenaire(Partenaire p);
    public List<Partenaire> listPartenaires();
    public Partenaire getPartenaireById(int id);
    public void removePartenaire(int id);
}
