<?php

namespace classes;

use PDO;
use PDOException;

class DB
{
    private string $host = "localhost";
    private string $username = "root";
    private string $password = "root";
    private string $database = "filmverwaltung";
    public PDO $connection;
    private $resultLike;
    public int $rowCount;
    public string $company;

    public function __construct(){
        try {
            $this->connection = new PDO("mysql:host=".$this->host.";dbname=".$this->database, $this->username, $this->password);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }catch(PDOException $e){
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function createStatement($query, $values = null)
    {
        $statement = $this->connection->prepare($query);
        $statement->execute($values);
        return $statement;
    }

    public function selectLikeProduction($search)
    {
        $value = array($search);
        $select = "select film.titel as 'Titel', film.release_date as 'Erscheinungs-Datum', company.names as 'Produktionsfirma'
                    from film, company where film.company_id = company.company_id and company.names like ?";
        $select = $this->createStatement($select, $value);
        $this->rowCount = $select->rowCount();

        if($this->rowCount > 0){
            $this->resultLike = $select->fetchAll(PDO::FETCH_ASSOC);
            $this->setCompany();
        } else {
            $this->company = "Es wurde keine Produktionsfirma gefunden!";
            $this->resultLike = "Produktionsfirma nicht gefunden!";
        }
    }

    public function printContent()
    {
        if($this->rowCount > 0)
        {

            $this->printTable();
        }
        else
        {

            $this->printError();
        }
    }

    public function printTable() {

        echo '<div class="container pt-4">';
        echo '<table class="table is-bordered is-narrow is-hoverable">';
        echo '<thead><tr>';

        // Table headers
        foreach ($this->resultLike[0] as $key => $value) {
            echo '<th>' . $key . '</th>';
        }

        echo '</tr></thead>';
        echo '<tbody>';

        // Table rows
        foreach ($this->resultLike as $row) {
            echo '<tr>';

            foreach ($row as $value) {
                echo '<td>' . $value . '</td>';
            }

            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';
        echo '</div>';
    }

    public function printError()
    {
        echo '<div class="container pt-4">';
        echo '<div class="alert alert-danger" role="alert">';
        echo $this->resultLike;
        echo '</div>';
        echo '</div>';
    }

    public function setCompany()
    {
        $arr_company = array();
        foreach ($this->resultLike as $film)
        {
            $arr_company[] = $film['Produktionsfirma'];
        }
        $arr_company = array_unique($arr_company);

        $i = 1;
        foreach ($arr_company as $value)
        {
            if($i == 1)
            {
                $this->company = $value;
                $i++;
            }
            else
            {
                $this->company .= ", ".$value;
            }
        }
    }
}