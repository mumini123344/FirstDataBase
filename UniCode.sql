-- MySQL Script generated by MySQL Workbench
-- Thu Jan 26 03:07:39 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Salary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Salary` (
  `idSalary` INT NOT NULL AUTO_INCREMENT,
  `salary_amount` INT NULL,
  PRIMARY KEY (`idSalary`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gender` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gender` (
  `idGender` INT NOT NULL AUTO_INCREMENT,
  `gender_identity` VARCHAR(45) NULL,
  PRIMARY KEY (`idGender`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Teacher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Teacher` (
  `idTeacher` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `age` INT NULL,
  `mail` VARCHAR(225) NULL,
  `Salary_idSalary` INT NOT NULL,
  `Gender_idGender` INT NOT NULL,
  PRIMARY KEY (`idTeacher`),
  INDEX `fk_Teacher_Salary1_idx` (`Salary_idSalary` ASC) VISIBLE,
  INDEX `fk_Teacher_Gender1_idx` (`Gender_idGender` ASC) VISIBLE,
  CONSTRAINT `fk_Teacher_Salary1`
    FOREIGN KEY (`Salary_idSalary`)
    REFERENCES `mydb`.`Salary` (`idSalary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_Gender1`
    FOREIGN KEY (`Gender_idGender`)
    REFERENCES `mydb`.`Gender` (`idGender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syllabus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Syllabus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Syllabus` (
  `idSyllabus` INT NOT NULL AUTO_INCREMENT,
  `syllabus_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idSyllabus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `idCourse` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NULL,
  `course_description` VARCHAR(45) NULL,
  `Syllabus_idSyllabus` INT NOT NULL,
  PRIMARY KEY (`idCourse`),
  INDEX `fk_Course_Syllabus1_idx` (`Syllabus_idSyllabus` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Syllabus1`
    FOREIGN KEY (`Syllabus_idSyllabus`)
    REFERENCES `mydb`.`Syllabus` (`idSyllabus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lecture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Lecture` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Lecture` (
  `idLecture` INT NOT NULL AUTO_INCREMENT,
  `lecture_name` VARCHAR(100) NULL,
  `lenght` INT NULL,
  PRIMARY KEY (`idLecture`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Score` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Score` (
  `idScore` INT NOT NULL AUTO_INCREMENT,
  `student_score` FLOAT NULL,
  PRIMARY KEY (`idScore`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UniClubs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UniClubs` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UniClubs` (
  `idClubs` INT NOT NULL AUTO_INCREMENT,
  `club_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idClubs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Student` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `age` INT NULL,
  `mail` VARCHAR(225) NULL,
  `Teacher_idTeacher` INT NOT NULL,
  `Course_idCourse` INT NOT NULL,
  `Lecture_idLecture` INT NOT NULL,
  `Score_idScore` INT NOT NULL,
  `Clubs_idClubs` INT NOT NULL,
  `Gender_idGender` INT NOT NULL,
  PRIMARY KEY (`idStudent`),
  INDEX `fk_Student_Teacher1_idx` (`Teacher_idTeacher` ASC) VISIBLE,
  INDEX `fk_Student_Course1_idx` (`Course_idCourse` ASC) VISIBLE,
  INDEX `fk_Student_Lecture1_idx` (`Lecture_idLecture` ASC) VISIBLE,
  INDEX `fk_Student_Score1_idx` (`Score_idScore` ASC) VISIBLE,
  INDEX `fk_Student_Clubs1_idx` (`Clubs_idClubs` ASC) VISIBLE,
  INDEX `fk_Student_Gender1_idx` (`Gender_idGender` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Teacher1`
    FOREIGN KEY (`Teacher_idTeacher`)
    REFERENCES `mydb`.`Teacher` (`idTeacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Course1`
    FOREIGN KEY (`Course_idCourse`)
    REFERENCES `mydb`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Lecture1`
    FOREIGN KEY (`Lecture_idLecture`)
    REFERENCES `mydb`.`Lecture` (`idLecture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Score1`
    FOREIGN KEY (`Score_idScore`)
    REFERENCES `mydb`.`Score` (`idScore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Clubs1`
    FOREIGN KEY (`Clubs_idClubs`)
    REFERENCES `mydb`.`UniClubs` (`idClubs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Gender1`
    FOREIGN KEY (`Gender_idGender`)
    REFERENCES `mydb`.`Gender` (`idGender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rector`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Rector` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Rector` (
  `idRector` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `age` INT NULL,
  `mail` VARCHAR(225) NULL,
  `Gender_idGender` INT NOT NULL,
  `Salary_idSalary` INT NOT NULL,
  PRIMARY KEY (`idRector`),
  INDEX `fk_Rector_Gender1_idx` (`Gender_idGender` ASC) VISIBLE,
  INDEX `fk_Rector_Salary1_idx` (`Salary_idSalary` ASC) VISIBLE,
  CONSTRAINT `fk_Rector_Gender1`
    FOREIGN KEY (`Gender_idGender`)
    REFERENCES `mydb`.`Gender` (`idGender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rector_Salary1`
    FOREIGN KEY (`Salary_idSalary`)
    REFERENCES `mydb`.`Salary` (`idSalary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UniversitySite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UniversitySite` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UniversitySite` (
  `idUniversitySite` INT NOT NULL AUTO_INCREMENT,
  `site_name` VARCHAR(255) NULL,
  PRIMARY KEY (`idUniversitySite`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Campus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Campus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Campus` (
  `idCampus` INT NOT NULL AUTO_INCREMENT,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idCampus`),
  INDEX `fk_Campus_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Campus_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Term` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Term` (
  `idTerm` INT NOT NULL AUTO_INCREMENT,
  `Enrollement_idEnrollement` INT NOT NULL,
  PRIMARY KEY (`idTerm`, `Enrollement_idEnrollement`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`University`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`University` ;

CREATE TABLE IF NOT EXISTS `mydb`.`University` (
  `idUniversity` INT NOT NULL AUTO_INCREMENT,
  `university_name` VARCHAR(45) NULL,
  `Student_idStudent` INT NOT NULL,
  `Rector_idRector` INT NOT NULL,
  `UniversitySite_idUniversitySite` INT NOT NULL,
  `Campus_idCampus` INT NOT NULL,
  `Term_idTerm` INT NOT NULL,
  `Term_Enrollement_idEnrollement` INT NOT NULL,
  `Teacher_idTeacher` INT NOT NULL,
  `Course_idCourse` INT NOT NULL,
  `Lecture_idLecture` INT NOT NULL,
  PRIMARY KEY (`idUniversity`),
  INDEX `fk_University_Student_idx` (`Student_idStudent` ASC) VISIBLE,
  INDEX `fk_University_Rector1_idx` (`Rector_idRector` ASC) VISIBLE,
  INDEX `fk_University_UniversitySite1_idx` (`UniversitySite_idUniversitySite` ASC) VISIBLE,
  INDEX `fk_University_Campus1_idx` (`Campus_idCampus` ASC) VISIBLE,
  INDEX `fk_University_Term1_idx` (`Term_idTerm` ASC, `Term_Enrollement_idEnrollement` ASC) VISIBLE,
  INDEX `fk_University_Teacher1_idx` (`Teacher_idTeacher` ASC) VISIBLE,
  INDEX `fk_University_Course1_idx` (`Course_idCourse` ASC) VISIBLE,
  INDEX `fk_University_Lecture1_idx` (`Lecture_idLecture` ASC) VISIBLE,
  CONSTRAINT `fk_University_Student`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Rector1`
    FOREIGN KEY (`Rector_idRector`)
    REFERENCES `mydb`.`Rector` (`idRector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_UniversitySite1`
    FOREIGN KEY (`UniversitySite_idUniversitySite`)
    REFERENCES `mydb`.`UniversitySite` (`idUniversitySite`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Campus1`
    FOREIGN KEY (`Campus_idCampus`)
    REFERENCES `mydb`.`Campus` (`idCampus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Term1`
    FOREIGN KEY (`Term_idTerm` , `Term_Enrollement_idEnrollement`)
    REFERENCES `mydb`.`Term` (`idTerm` , `Enrollement_idEnrollement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Teacher1`
    FOREIGN KEY (`Teacher_idTeacher`)
    REFERENCES `mydb`.`Teacher` (`idTeacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Course1`
    FOREIGN KEY (`Course_idCourse`)
    REFERENCES `mydb`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_Lecture1`
    FOREIGN KEY (`Lecture_idLecture`)
    REFERENCES `mydb`.`Lecture` (`idLecture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Price` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Price` (
  `idPrice` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idPrice`),
  INDEX `fk_Price_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Price_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;