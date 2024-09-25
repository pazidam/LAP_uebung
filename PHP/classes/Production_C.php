<?php

namespace classes;

class Production_C
{
    public string $search_value;
    public string $query;

    public function __construct(string $search_value)
    {
        $this->search_value = $search_value;
        $this->query = $this->setQuery();
    }

    public function setQuery()
    {
        return "select film.titel as 'Titel', film.release_date as 'Erscheinungs-Datum', company.names as 'Produktionsfirma'
                from film, company where film.company_id = company.company_id and company.names like ?";
    }
}