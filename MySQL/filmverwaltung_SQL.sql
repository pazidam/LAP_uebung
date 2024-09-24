-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema filmverwaltung
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `filmverwaltung` ;

-- -----------------------------------------------------
-- Schema filmverwaltung
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `filmverwaltung` DEFAULT CHARACTER SET utf8 ;
USE `filmverwaltung` ;

-- -----------------------------------------------------
-- Table `filmverwaltung`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmverwaltung`.`company` (
  `company_id` INT NOT NULL AUTO_INCREMENT,
  `names` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `filmverwaltung`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmverwaltung`.`film` (
  `film_id` INT NOT NULL AUTO_INCREMENT,
  `titel` VARCHAR(100) NOT NULL,
  `release_date` DATE NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`film_id`),
  UNIQUE INDEX `film_id_UNIQUE` (`film_id` ASC) VISIBLE,
  INDEX `fk_film_company_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_company`
    FOREIGN KEY (`company_id`)
    REFERENCES `filmverwaltung`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `filmverwaltung`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmverwaltung`.`actor` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE INDEX `actor_id_UNIQUE` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `filmverwaltung`.`film_has_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmverwaltung`.`film_has_actor` (
  `film_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `actor_id`),
  INDEX `fk_film_has_actor_actor1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_film_has_actor_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_actor_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `filmverwaltung`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_has_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `filmverwaltung`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `filmverwaltung`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `filmverwaltung`;
INSERT INTO `filmverwaltung`.`company` (`company_id`, `names`) VALUES (1, 'Bavaria Filmstudios');
INSERT INTO `filmverwaltung`.`company` (`company_id`, `names`) VALUES (2, 'Great American Films');
INSERT INTO `filmverwaltung`.`company` (`company_id`, `names`) VALUES (3, 'Touchstone Pictures');
INSERT INTO `filmverwaltung`.`company` (`company_id`, `names`) VALUES (4, 'Warner Brothers Pictures');

COMMIT;


-- -----------------------------------------------------
-- Data for table `filmverwaltung`.`film`
-- -----------------------------------------------------
START TRANSACTION;
USE `filmverwaltung`;
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3000, 'Dirty Dancing', '1987-08-21', 2);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3001, 'Sister Act', '1992-05-29', 3);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3002, 'Harry Potter u. der Stein der Weisen', '2001-11-23', 4);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3003, 'Casanova', '2006-02-09', 3);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3004, 'Die unendliche Geschichte', '1984-05-20', 1);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3005, 'Die Welle', '2008-03-13', 1);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3006, 'Krieg in Chinatown', '1987-09-25', 2);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3007, 'I Am Legend', '2008-01-10', 4);
INSERT INTO `filmverwaltung`.`film` (`film_id`, `titel`, `release_date`, `company_id`) VALUES (3008, 'Transcendence', '2014-04-18', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `filmverwaltung`.`actor`
-- -----------------------------------------------------
START TRANSACTION;
USE `filmverwaltung`;
INSERT INTO `filmverwaltung`.`actor` (`actor_id`, `firstname`, `lastname`, `country`) VALUES (1, 'Jennifer', 'Grey', 'USA');
INSERT INTO `filmverwaltung`.`actor` (`actor_id`, `firstname`, `lastname`, `country`) VALUES (2, 'Jane', 'Brucker', 'USA');
INSERT INTO `filmverwaltung`.`actor` (`actor_id`, `firstname`, `lastname`, `country`) VALUES (3, 'Maggie', 'Smith', 'England');

COMMIT;


-- -----------------------------------------------------
-- Data for table `filmverwaltung`.`film_has_actor`
-- -----------------------------------------------------
START TRANSACTION;
USE `filmverwaltung`;
INSERT INTO `filmverwaltung`.`film_has_actor` (`film_id`, `actor_id`) VALUES (3000, 1);
INSERT INTO `filmverwaltung`.`film_has_actor` (`film_id`, `actor_id`) VALUES (3000, 2);
INSERT INTO `filmverwaltung`.`film_has_actor` (`film_id`, `actor_id`) VALUES (3001, 3);

COMMIT;

