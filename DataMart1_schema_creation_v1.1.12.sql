-- MySQL Script for sws_datamart2

-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
-- Created by: George Gu
-- Created at: 02/24/16 15:20:19
-- Version: 1.1.10
-- updated at: 02/29/16 15:00:00
-- Version: 1.1.11
-- updated at: 03/04/16
-- Version: 1.1.12: copy ID as the same from the source



SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema sws_datamart2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sws_datamart2` ;

-- -----------------------------------------------------
-- Schema sws_datamart2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sws_datamart2` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `sws_datamart2` ;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_location`;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_location` (
  `location_id` int NOT NULL,  
  `location_name` VARCHAR(50) NULL,
  `patient_room` INT(2) NULL,
  `unit` VARCHAR(20) NULL,
  `department` VARCHAR(50) NULL,
  `facility` VARCHAR(50) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = INNODB;
SHOW WARNINGS;

  -- note: cannot set all ids as Auto_increment = 1


-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_facility_shift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_facility_shift` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_facility_shift` (
  `facility_shift_id` INT NOT NULL,
  `facility` VARCHAR(50) NULL,
  `shift_name` VARCHAR(50) NULL,
  `start_time` TIME(6) NULL,
  `end_time` TIME(6) NULL,
  `shift_id` INT NULL,
  PRIMARY KEY (`facility_shift_id`))
ENGINE = InnoDB;


SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_dispenser_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_dispenser_type` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_dispenser_type` (
  `dispenser_id` INT NOT NULL,
  `dispenser_type` VARCHAR(50) NULL,
  `portable_flag` TINYINT(1) NULL,
  PRIMARY KEY (`dispenser_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_hour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_hour` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_hour` (
  `hour_id` INT NOT NULL,
  `hour` TIME(6) NULL,
  PRIMARY KEY (`hour_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_date` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_date` (
  `date_id` INT NOT NULL,
  `date` DATE NULL,
  `week` INT NULL,
  `month` INT NULL,
  `quarter` INT NULL,
  `year` INT NULL,
  `holiday_flag` TINYINT(1) NULL,
  `holiday_name` VARCHAR(50) NULL,
  `weekday_number` INT NULL,
  `weekday_flag` TINYINT(1) NULL,
  PRIMARY KEY (`date_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_second`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_second` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_second` (
  `second_id` INT NOT NULL,
  `second` TIME(6) NULL,
  PRIMARY KEY (`second_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_isolation_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_isolation_type` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_isolation_type` (
  `isolation_type_id` INT NOT NULL, 
  `sensitivity_level` TINYINT(2) NULL,
  `isolation_type` VARCHAR(50) NULL,
  `comment` VARCHAR(100) NULL,
  PRIMARY KEY (`isolation_type_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_facility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_facility` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_facility` (
  `facility_id` INT NOT NULL,
  `facility_name` VARCHAR(50) NULL,
  `address` VARCHAR(100) NULL,
  `city` VARCHAR(20) NULL,
  `state` VARCHAR(10) NULL,
  `zipcode` INT(10) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `compliance_window` TINYINT NULL,
  `time_zone_id` TINYINT NULL,
  `time_zone_name` VARCHAR(50) NULL,
  `shift_from_UTC` TINYINT NULL,
  PRIMARY KEY (`facility_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_time_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_time_zone` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_time_zone` (
  `time_zone_id` INT NOT NULL,
  `shift_from_UTC` TIME(6) NULL,
  `shift_hour_number_from_UTC` TINYINT NULL,
  PRIMARY KEY (`time_zone_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_user` ;

SHOW WARNINGS;



SHOW WARNINGS;
-- -----------------------------------------------------
-- Table `sws_datamart2`.`dim_shift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`dim_shift` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`dim_shift` (
  `shift_id` INT NOT NULL,
  `shift_name` VARCHAR(50) NULL,
  `start_time` TIME(6) NULL,
  `end_time` TIME(6) NULL,
  PRIMARY KEY (`shift_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sws_datamart2`.`fact_compliance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sws_datamart2`.`fact_compliance` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`fact_compliance` (
  `fact_compliance_id` INT NOT NULL AUTO_INCREMENT,
  `year_number` INT NULL,
  `quarter_number` INT NULL,
  `entry_date_id` INT NULL,
  `exit_date_id` INT NULL,
  `entry_hour_id` INT NULL,
  `exit_hour_id` INT NULL,
  `entry_time_id` INT NULL,
  `exit_time_id` INT NULL,
  `time_diff_from_UTC` TIME(6) NULL,
  `time_zone_id` INT NULL,
  `entry_facility_shift_id` INT NULL,
  `exit_facility_shift_id` INT NULL,
  `user_id` INT NULL,
  `location_id` INT NULL,
  `entry_wash_opportunity` INT NULL,
  `exit_wash_opportunity` INT NULL,
  `entry_compliance` INT NULL,
  `exit_compliance` INT NULL,
  `entry_date` DATE NULL,
  `exit_date` DATE NULL,
  `entry_time` TIME(6) NULL,
  `exit_time` TIME(6) NULL,
  `record_creation_time` DATETIME NULL,
  `record_update_time` DATETIME NULL,
  `facility_id` INT NULL,
  `isolation_type_id` INT NULL,
  `dispenser_id` INT NULL,
  `dispenser_department` VARCHAR(50) NULL,
  `user_department` VARCHAR(50) NULL,
  `duration_in_room` TIME(6) NULL,
  `room_hub_id` INT NULL,
  `badge_id` INT NULL,
  PRIMARY KEY (`fact_compliance_id`),
  CONSTRAINT `fk_FactCompliance_DimLocation1`
    FOREIGN KEY (`location_id`)
    REFERENCES `sws_datamart2`.`dim_location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimWorkTimeWindow1`
    FOREIGN KEY (`entry_facility_shift_id`)
    REFERENCES `sws_datamart2`.`dim_facility_shift` (`facility_shift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimDispenserType1`
    FOREIGN KEY (`dispenser_id`)
    REFERENCES `sws_datamart2`.`dim_dispenser_type` (`dispenser_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimWorkTimeWindow2`
    FOREIGN KEY (`exit_facility_shift_id`)
    REFERENCES `sws_datamart2`.`dim_facility_shift` (`facility_shift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimHour1`
    FOREIGN KEY (`entry_hour_id`)
    REFERENCES `sws_datamart2`.`dim_hour` (`hour_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimHour2`
    FOREIGN KEY (`exit_hour_id`)
    REFERENCES `sws_datamart2`.`dim_hour` (`hour_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimDate1`
    FOREIGN KEY (`entry_date_id`)
    REFERENCES `sws_datamart2`.`dim_date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimDate2`
    FOREIGN KEY (`exit_date_id`)
    REFERENCES `sws_datamart2`.`dim_date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimSecond1`
    FOREIGN KEY (`entry_time_id`)
    REFERENCES `sws_datamart2`.`dim_second` (`second_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimSecond2`
    FOREIGN KEY (`exit_time_id`)
    REFERENCES `sws_datamart2`.`dim_second` (`second_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactCompliance_DimIsolationType1`
    FOREIGN KEY (`isolation_type_id`)
    REFERENCES `sws_datamart2`.`dim_isolation_type` (`isolation_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_compliance_dim_facility1`
    FOREIGN KEY (`facility_id`)
    REFERENCES `sws_datamart2`.`dim_facility` (`facility_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_compliance_dim_timezone1`
    FOREIGN KEY (`time_zone_id`)
    REFERENCES `sws_datamart2`.`dim_time_zone` (`time_zone_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_compliance_dim_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `sws_datamart2`.`dim_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimLocation1_idx` ON `sws_datamart2`.`fact_compliance` (`location_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimWorkTimeWindow1_idx` ON `sws_datamart2`.`fact_compliance` (`entry_facility_shift_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimDispenserType1_idx` ON `sws_datamart2`.`fact_compliance` (`dispenser_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimWorkTimeWindow2_idx` ON `sws_datamart2`.`fact_compliance` (`exit_facility_shift_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimHour1_idx` ON `sws_datamart2`.`fact_compliance` (`entry_hour_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimHour2_idx` ON `sws_datamart2`.`fact_compliance` (`exit_hour_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimDate1_idx` ON `sws_datamart2`.`fact_compliance` (`entry_date_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimDate2_idx` ON `sws_datamart2`.`fact_compliance` (`exit_date_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimSecond1_idx` ON `sws_datamart2`.`fact_compliance` (`entry_time_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimSecond2_idx` ON `sws_datamart2`.`fact_compliance` (`exit_time_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_FactCompliance_DimIsolationType1_idx` ON `sws_datamart2`.`fact_compliance` (`isolation_type_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_fact_compliance_dim_facility1_idx` ON `sws_datamart2`.`fact_compliance` (`facility_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_fact_compliance_dim_user1_idx` ON `sws_datamart2`.`fact_compliance` (`user_id` ASC);


SHOW WARNINGS;
USE `sws_datamart2` ;

-- -----------------------------------------------------
-- Placeholder table for view `sws_datamart2`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sws_datamart2`.`view1` (`id` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `sws_datamart2`.`view1`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sws_datamart2`.`view1` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `sws_datamart2`.`view1`;
SHOW WARNINGS;
USE `sws_datamart2`;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
