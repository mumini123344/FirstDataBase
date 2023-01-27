Use mydb;

-- 10 statements --insert
INSERT INTO Salary(salary_amount) VALUES (4000); 

INSERT INTO Gender(gender_identity) VALUES ('male'), ('female'); 	

INSERT INTO Teacher(fname, lname, age, mail) VALUES ('Ketevan', 'Korkashvili', 30, 'ketevankorkashvili@gmail.com'), 
('Revaz', 'Tsitskishvili', 50, 'revastsitskishvili@gmail.com'), ('Nona', 'Otxozoria', 40, 'nonaotxozoria@gmail.com');

INSERT INTO Course(course_name, course_description) VALUES ('Informational Technologies', 'Gives you knowladge about IT'),
('Business', 'You will teach how to manage business');

INSERT INTO Lecture(lecture_name, lenght) VALUES ('Informational Technologies', '2 hours'), 
('Business Administration', '3 hours'), ('Digital Marketing', '2 hours');

INSERT INTO UniClubs(club_name) VALUES ('Sports club'), ('Mysteris club'), ('Music club'), ('Dance club');

INSERT INTO Student(fname, lname, age, mail) VALUES ('Giorgi', 'Giorgobiani', 21, 'giorgi.giorgobiani@gmail.com'),
('Davit', 'Papunashvili', 23, 'davitpapunashvili@gmail.com'), ('Mirza', 'razmadze', 22, 'mirzarazmadze@gmail.com');

INSERT INTO Rector(fname, lname, age, mail) VALUES ('Nino', 'Enukidze', 31, 'nino.enukidze@gmail.com');

INSERT INTO University(university_name) VALUES ('Business and Technology university'), ('Ilia'), ('Javakhishvili'),
('Teknikuri');

INSERT INTO Price(amount) VALUES (2250);

-- 10 statements update

UPDATE University
SET university_name = 'Bendzukidze'
WHERE idUniversity = 2;

UPDATE University
SET university_name = 'grigol robaqidze'
WHERE university_name = 'Javakhishvili';

UPDATE Student
SET fname = 'Anzori'
WHERE age = 21;

UPDATE Student
SET fname = 'Tornkine'
WHERE idStudent = 2;

UPDATE UniClubs
SET club_name = 'Gaming club'
WHERE idclubs = 3;

UPDATE Teacher
SET mail = 'nonaotxozoria@btu.edu.ge'
WHERE idTeacher = 3;

UPDATE Lecture
SET lenght = '5 hours'
WHERE idLecture = 2;

UPDATE Salary
SET salary_amount = 2500
WHERE idSalary = 1;

UPDATE Student
SET fname = 'Mamuka', lname = 'kuranovi', mail = 'mamukakuranovi@gmail.com'
WHERE idStudent = 1;

UPDATE University
SET university_name = 'Teqnikuri Universiteti'
WHERE idUniversity = 1;

-- 5 statements alter

ALTER TABLE Teacher
DROP mail;

ALTER TABLE Student
ADD phone_number INT;

ALTER TABLE Rector
ADD experience VARCHAR(300);

ALTER TABLE Student
RENAME TO Students;

ALTER TABLE Teacher
RENAME TO Lecturers;

ALTER TABLE University
ADD found_year YEAR;

-- 7 statements with aggregate functions and group by and without having.

SELECT COUNT(idStudents)
FROM Students;

SELECT AVG(age)
FROM Students;

SELECT COUNT(idTeacher)
FROM Lecturers
GROUP BY lname;

SELECT DISTINCT(Students.age), fname
FROM Students
GROUP BY fname;

SELECT COUNT(idStudents)
FROM Students
WHERE fname LIKE 'g%'
GROUP BY fname;

SELECT MIN(age), lname
FROM Lecturers
GROUP BY lname;

SELECT MAX(age), fname
FROM Lectureres
GROUP BY fname;



--  5 statements with left, right, inner, outer joins. 
SELECT * FROM Students
LEFT JOIN Lecturers ON Students.idStudent = Lecturers.idTeacher
UNION
SELECT * FROM Students
RIGHT JOIN Lecturers ON Students.idStudent = Lecturers.idTeacher;

SELECT * FROM Students
FULL JOIN Price ON Students.idStudent = Price.idPrice;

SELECT * FROM UniClubs
INNER JOIN Students ON UniClubs.idClubs = Students.idStudent;

SELECT * FROM Lecturers
LEFT JOIN Lecture ON Lecturers.idTeacher = Lecture.idLecture;

SELECT * FROM Course
RIGHT JOIN Lecture ON Course.idCourse = Lecture.idLecture;

SELECT * FROM Rector
LEFT JOIN Lecturers ON Rector.idRector = Lecturers.idTeacher;


-- 1 big statement to join all tables in the database.

SELECT * FROM University
JOIN Salay ON idUniversity = idSalary
JOIN Lecturers ON idsalary = idTeacher
JOIN Rector ON idTeacher = idRector
JOIN Gender ON idRector = idGender
JOIN Students ON idUniversity = idStudent
JOIN UniClubs ON idStudent = idClubs
JOIN Course ON idTeacher = idCourse
JOIN Lecture ON idStudents = idLecture
JOIN Price ON idStudents = idPrice
JOIN University ON idPrice = idUniversity
JOIN Salary ON idRector AND idTeacher = idSalary
JOIN Students on idGender = idStudents;

-- 10 Delete Statment

DELETE FROM Students WHERE fname = 'Giorgi';
DELETE FROM Lecturers WHERE idTeacher = (1, 2);
DELETE FROM Course WHERE idCourse = 2;
DELETE FROM Gender WHERE idGender IN (1,2,3);
DELETE FROM Lecturers WHERE age = 50 AND fname = 'Revaz';
DELETE FROM UniClubs WHERE club_name = 'Sports' OR club_name = 'music club';
DELETE FROM University WHERE university_name = 'Ilia';
DELETE FROM University WHERE idUniversity = 4;
DELETE FROM Students WHERE idStudent IN (2,3);
DELETE FROM Students WHERE age BETWEEN 21 AND 22;







 








