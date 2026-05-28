CREATE DATABASE University;
USE University;

CREATE TABLE university (
    UID INT PRIMARY KEY,
    NAME VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE student (
    PRN INT PRIMARY KEY,
    NAME VARCHAR(50),
    Address VARCHAR(100),
    UID INT,
    FOREIGN KEY (UID) REFERENCES university(UID)
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    NAME VARCHAR(50),
    Address VARCHAR(100),
    subject VARCHAR(50)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    faculty_id INT,
    subject VARCHAR(50),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);
CREATE TABLE alumini(
ID INT PRIMARY KEY,
NAME varchar(39)
);

INSERT INTO university VALUES
(1, 'Mumbai University', 'Mumbai'),
(2, 'Pune University', 'Pune');

INSERT INTO student VALUES
(25, 'Disha', 'Ram Nagar', 1),
(34, 'Alisha', 'Shivaji Nagar', 1),
(26, 'Karan', 'Mumbai', 1),
(27, 'Rahul', 'Pune', 2),
(28, 'Aman', 'Mumbai', 1);

INSERT INTO faculty VALUES
(1234, 'Harsha', 'Lonere', 'DBMS'),
(1235, 'Kareena', 'Goregaon', 'Physics'),
(1236, 'Meena', 'Pune', 'Maths'),
(1237, 'Riya', 'Mumbai', 'DBMS');

INSERT INTO course (course_name, faculty_id, subject) VALUES
('Database Systems', 1234, 'DBMS'),
('Mechanics', 1235, 'Physics'),
('Algebra', 1236, 'Maths'),
('Advanced DBMS', 1237, 'DBMS');

INSERT INTO instructor VALUES
(10211, 'A', 'Biology', 66000),
(10212, 'B', 'Physics', 50000),
(10213, 'C', 'Biology', 72000),
(10214, 'D', 'Maths', 48000);
INSERT INTO   alumini
VALUES
(1,'SANVI'),
(2,'SAI'),
(3,'PRIYA'),
(4,'SHREE');
SHOW TABLES;

DELETE FROM student
WHERE PRN = 25;

ALTER TABLE student ADD age INT;
ALTER TABLE student DROP COLUMN age;

-- SELECT examples
SELECT NAME FROM instructor;

SELECT DISTINCT dept_name FROM instructor;

SELECT ALL dept_name FROM instructor;

SELECT DISTINCT subject FROM faculty;

SELECT ALL subject FROM faculty;

SELECT DISTINCT Address 
FROM student
WHERE Address = 'Mumbai';

SELECT DISTINCT course_name FROM course
WHERE faculty_id = 1234;
-------
SELECT NAME  
FROM student
WHERE NAME LIKE 'A%';

SELECT NAME
FROM student
WHERE NAME LIKE '%l';

SELECT NAME 
FROM student
WHERE NAME LIKE '%li%';

SELECT NAME
FROM instructor
ORDER BY NAME; 

SELECT NAME
FROM student
ORDER BY NAME DESC; 

SELECT NAME
FROM student
ORDER BY NAME ASC; 

SELECT NAME, prn
FROM student
WHERE prn BETWEEN 25 AND 30;

(SELECT NAME 
FROM student
WHERE Address = 'Mumbai')
UNION
(SELECT NAME 
FROM student
WHERE Address = 'Pune'); 

(SELECT NAME 
FROM student
WHERE Address = 'Pune')
INTERSECT
(SELECT NAME 
FROM student
WHERE Address = 'Shivaji Nagar');

(SELECT NAME 
FROM student
WHERE Address = 'Pune')
EXCEPT
(SELECT NAME 
FROM student
WHERE Address = 'Shivaji Nagar');
ALTER TABLE student 
ADD pointer FLOAT;
UPDATE student
SET pointer = 7.4
WHERE PRN = 26;
UPDATE student
SET pointer = 8.4
WHERE PRN = 27;
UPDATE student
SET pointer = 7.4
WHERE PRN = 26;
UPDATE student
SET pointer = 6.9
WHERE PRN = 34;
(SELECT name
FROM student )
union
(SELECT name 
FROM alumini);
(SELECT name
FROM student )
INTERSECT
(SELECT name 
FROM alumini);
SELECT name 
from student
WHERE 
ADDRESS = 'Mumbai' and UID is not NULL;
SELECT name 
from student
WHERE  UID is not NULL;
SELECT avg(salary)
from instructor
WHERE  dept_name='biology';
SELECT count(PRN)
from student
WHERE  ADDRESS='Mumbai';
SELECT count(*)
from student;
SELECT name 
from instructor
WHERE salary > 50000 and DEPT_name ='CSE';
SELECT name 
from instructor
WHERE salary > 50000 or DEPT_name ='CSE';
SELECT * FROM university;
SELECT * FROM student;


SELECT * FROM faculty;
SELECT * FROM course;
SELECT * FROM instructor;
SELECT * FROM alumini;