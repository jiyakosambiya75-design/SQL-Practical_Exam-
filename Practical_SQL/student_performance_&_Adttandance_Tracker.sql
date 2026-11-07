
CREATE DATABASE IF NOT EXISTS Student_performance_Attandence_Tracker;

USE Student_performance_Attandence_Tracker;

DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS attendances;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- 1. DEPARTMENTS TABLE
CREATE TABLE departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50));

INSERT INTO departments VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Mechanical Engineering'),
(104, 'Civil Engineering'),
(105, 'Electrical Engineering');

DESC departments;


-- 2. STUDENTS TABLE
CREATE TABLE students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    Address VARCHAR(100),
    Admission_Date DATE,
    Department_ID INT,
    FOREIGN KEY (Department_ID) 
    REFERENCES departments(Department_ID)
);

INSERT INTO students VALUES
(1, 'Rahul', '2003-05-12', 'Male', 'rahul@gmail.com', '9876543210', 'Surat', '2022-07-10', 101),
(2, 'Priya', '2004-02-18', 'Female', 'priya@gmail.com', '9876543211', 'Ahmedabad', '2022-07-12', 102),
(3, 'Amit', '2003-09-25', 'Male', 'amit@gmail.com', '9876543212', 'Vadodara', '2022-07-15', 103),
(4, 'Neha', '2004-11-10', 'Female', 'neha@gmail.com', '9876543213', 'Rajkot', '2022-07-18', 104),
(5, 'Karan', '2003-03-20', 'Male', NULL, '9876543214', 'Surat', '2022-07-20', 105); -- NULL ईमेल (Section 10 के लिए)

DESC students;


-- 3. FACULTY TABLE
CREATE TABLE faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone_Number VARCHAR(15),
    Department_ID INT,
    Experience_Years INT, 
    FOREIGN KEY (Department_ID)
    REFERENCES departments(Department_ID)
);

INSERT INTO faculty VALUES
(201, 'Rajesh', 'rajesh@gmail.com', '9876500011', 101, 6),
(202, 'Meena', 'meena@gmail.com', '9876500012', 102, 7),
(203, 'Suresh', 'suresh@gmail.com', '9876500013', 103, 4),
(204, 'Kavita', 'kavita@gmail.com', '9876500014', 104, 8),
(205, 'Amit', 'amitj@gmail.com', '9876500015', 105, 3);

DESC faculty;


-- 4. COURSES TABLE
CREATE TABLE courses (
    Courses_ID INT PRIMARY KEY,
    Courses_Name VARCHAR(50),
    Department_ID INT,
    Faculty_ID INT 
    FOREIGN KEY (Department_ID)
    REFERENCES departments(Department_ID)
);

INSERT INTO courses VALUES
(301, 'Python Programming', 101, 201),
(302, 'Database Management', 102, 202),
(303, 'Thermodynamics', 103, 203),
(304, 'Structural Engineering', 104, 204),
(305, 'Electrical Circuits', 105, 205);

DESC courses;


-- 5. ENROLLMENTS TABLE
CREATE TABLE enrollments (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    FOREIGN KEY (Student_ID)
    REFERENCES students(Student_ID),
    FOREIGN KEY (Course_ID) 
    REFERENCES courses(Courses_ID)
);

INSERT INTO enrollments VALUES
(401, 1, 301, '2023-01-10'),
(402, 2, 302, '2023-01-11'),
(403, 3, 303, '2023-01-12'),
(404, 4, 304, '2023-01-13'),
(405, 5, 305, '2023-01-14');

DESC enrollments;


-- 6. ATTENDANCES TABLE
CREATE TABLE attendances (
    Attendance_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Attendance_Date DATE,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent', 'Late')),
    FOREIGN KEY (Student_ID)
    REFERENCES students(Student_ID),
    FOREIGN KEY (Course_ID) 
    REFERENCES courses(Courses_ID)
);

INSERT INTO attendances VALUES
(501, 1, 301, '2023-02-01', 'Present'),
(502, 2, 302, '2023-02-01', 'Absent'),
(503, 3, 303, '2023-02-01', 'Late'),
(504, 4, 304, '2023-02-01', 'Present'),
(505, 5, 305, '2023-02-01', 'Absent');

DESC attendances;


-- 7. GRADES TABLE
CREATE TABLE grades (
    Grade_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Mark_Obtain INT,
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D')),
    FOREIGN KEY (Student_ID) 
    REFERENCES students(Student_ID),
    FOREIGN KEY (Course_ID)
    REFERENCES courses(Courses_ID)
);

INSERT INTO grades VALUES
(601, 1, 301, 92, 'A'),
(602, 2, 302, 75, 'B'),
(603, 3, 303, 65, 'C'),
(604, 4, 304, 55, 'D'),
(605, 5, 305, 88, 'A');


-- DISPLAY ALL TABLES
SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM faculty;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM attendances;
SELECT * FROM grades;


-- TASK AND FUNCTIONALITY 

-- ###### 1.CURD

-- CREATE 
INSERT INTO students VALUES 
(6, 'Jiya', '2008-06-22', 'Female', NULL, '9876543614', 'Surat', '2022-07-20', 105); -- NULL ईमेल (Section 10 के लिए)

-- UPDATE 
UPDATE students 
SET Phone_Number = '9925827827'
WHERE Student_ID = 6 ;

-- READ 
SELECT * FROM students ;

-- DELETE

DELETE FROM students
WHERE Student_ID = 6 ;


-- #### 2. USE SQL Clauses

SELECT s.* FROM students s
JOIN departments d 
ON s.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Computer Science';

SELECT s.Name AS Student_Name, g.Mark_Obtain AS "Highest Scoring Students"
FROM students s
LEFT JOIN grades g 
ON s.Student_ID = g.Student_ID
ORDER BY g.Mark_Obtain DESC 
LIMIT 10;

SELECT Student_ID, 
(SUM(CASE
        WHEN Status = 'Present' THEN 1 
        ELSE 0
     END) * 100.0 / COUNT(*)) AS Attendance_Rate
FROM attendances
GROUP BY Student_ID
HAVING Attendance_Rate < 75;


-- #### 3. Apply SQL Oparators 

SELECT s.Name
FROM students s
JOIN grades g 
ON s.Student_ID = g.Student_ID
JOIN (
    SELECT Student_ID,
    (SUM(CASE 
             WHEN Status = 'Present' THEN 1 
             ELSE 0 
         END) * 100.0 / COUNT(*)) AS Att_Rate 
FROM attendances 
GROUP BY Student_ID) a 
ON s.Student_ID = a.Student_ID
WHERE a.Att_Rate < 50 AND g.Mark_Obtain < 40;

SELECT DISTINCT s.Name
FROM students s
LEFT JOIN grades g 
ON s.Student_ID = g.Student_ID
LEFT JOIN (
    SELECT Student_ID,
    (SUM(CASE 
            WHEN Status = 'Present' THEN 1 
            ELSE 0 
            END) * 100.0 / COUNT(*)) AS Att_Rate 
FROM attendances 
GROUP BY Student_ID) a 
ON s.Student_ID = a.Student_ID
WHERE g.Mark_Obtain > 90 OR a.Att_Rate = 100;

SELECT *
FROM faculty
WHERE Faculty_ID NOT IN (SELECT Faculty_ID
    FROM courses
    WHERE Faculty_ID IS NOT NULL
);


-- ##### 4. Sorting & Groupping DATA 

SELECT * FROM students 
ORDER BY Name ASC ;

SELECT d.Department_Name,
COUNT(s.Student_ID) AS Total_Students
FROM departments AS d
LEFT JOIN students s 
ON d.Department_ID = s.Department_ID 
GROUP BY d.Department_ID, d.Department_Name;

SELECT c.Courses_Name,
AVG(g.Mark_Obtain) AS Average_Marks
FROM courses c
JOIN grades g 
ON c.Courses_ID = g.Course_ID
GROUP BY c.Courses_ID, c.Courses_Name;


-- #### 5.Use aggregate Function 

SELECT AVG(Attendance_Rate) AS Average_Attendance
FROM (SELECT (SUM(CASE
                      WHEN Status = 'Present' THEN 1 
                      ELSE 0 
                  END) * 100.0 / COUNT(*)) AS Attendance_Rate 
FROM attendances 
GROUP BY Student_ID) AS Sub;

SELECT c.Courses_Name,
MAX(g.Mark_Obtain) AS Highest_marks,
MIN(g.Mark_Obtain) AS Lowest_marks
FROM courses c
JOIN grades g 
ON c.Courses_ID = g.Course_ID
GROUP BY c.Courses_ID, c.Courses_Name;


-- #### 6. Establish primary key and Foreign key relationship

ALTER TABLE enrollments
ADD CONSTRAINT unique_enrollment 
UNIQUE (student_id, course_id);

ALTER TABLE courses
ADD CONSTRAINT fk_faculty
FOREIGN KEY (Faculty_ID) 
REFERENCES faculty(Faculty_ID);


-- #### 7.Impliment Join 

SELECT s.Student_ID, 
s.Name, 
s.Email,
d.Department_Name
FROM students s
INNER JOIN departments d 
ON s.Department_ID = d.Department_ID;

SELECT s.Student_ID, s.Name
FROM students s
LEFT JOIN enrollments e
ON s.Student_ID = e.Student_ID
WHERE e.Student_ID IS NULL;

-- Image Requirement 7.3 (RIGHT JOIN)
SELECT c.Courses_Name,
c.Courses_ID, 
f.Faculty_ID, 
f.Name
FROM faculty f
RIGHT JOIN courses c
ON f.Faculty_ID = c.Faculty_ID
WHERE f.Faculty_ID IS NULL;

-- Image Requirement 7.4 (FULL OUTER JOIN Simulation)
SELECT s.Name 
FROM students s 
LEFT JOIN grades g 
ON s.Student_ID = g.Student_ID 
WHERE g.Grade_ID IS NULL
    
UNION
SELECT s.Name 
FROM students s 
RIGHT JOIN grades g
ON s.Student_ID = g.Student_ID 
WHERE s.Student_ID IS NULL;


-- #### 8. USE subquery

-- #8.1
SELECT s.Student_ID, 
s.Name,
g.Mark_Obtain
FROM students s
JOIN grades g 
ON s.Student_ID = g.Student_ID
WHERE g.Mark_Obtain > ( SELECT AVG(Mark_Obtain) 
FROM grades
);

-- #8.2
SELECT c.Courses_ID, c.Courses_Name
FROM courses c
WHERE c.Faculty_ID IN (
    SELECT Faculty_ID 
    FROM faculty 
    WHERE Experience_Years >= 5
);

-- #8.3
SELECT s.Student_ID, 
s.Name, 
COUNT(a.Attendance_ID) AS Total_Absent
FROM students s
JOIN attendances a 
ON s.Student_ID = a.Student_ID
WHERE a.Status = 'Absent'
GROUP BY s.Student_ID, s.Name
HAVING COUNT(a.Attendance_ID) > 10;


-- #### 9. Impliment DATE & TIME Functin
SELECT
MONTH(Attendance_Date) AS Attendance_Month,
COUNT(*) AS Total_Records
FROM attendances
GROUP BY MONTH(Attendance_Date);

SELECT Student_ID,
Name, 
TIMESTAMPDIFF(YEAR, Admission_Date, CURDATE()) AS Years_Since_Admission
FROM students;

SELECT Student_ID, 
Attendance_Date,
DATE_FORMAT(Attendance_Date, '%d-%m-%Y') AS Formatted_Date
FROM attendances;


-- #### 10. Use String Manipulation Functions (इमेज से नया जोड़ा गया)
SELECT UPPER(Name) AS Faculty_Uppercase_Name 
FROM faculty;
SELECT TRIM(Name) AS Cleaned_Student_Name 
FROM students;
SELECT Name, COALESCE(Email, 'Email Not Provided') AS Contact_Email
FROM students;


-- #### 11. IMPLIMENT WINDOW FUNCTION
SELECT s.Student_ID,
s.Name,
SUM(g.Mark_Obtain) AS Overall_Marks,
RANK() OVER (ORDER BY SUM(g.Mark_Obtain) DESC) AS Student_Rank
FROM students s
JOIN grades g
ON s.Student_ID = g.Student_ID
GROUP BY s.Student_ID, s.Name;

-- कोमा एरर को ठीक किया गया
SELECT
Course_ID,
Student_ID,
Attendance_Percentage,
SUM(Attendance_Percentage) OVER (PARTITION BY Course_ID ORDER BY Student_ID) AS Cumulative_Attendance
FROM (
    SELECT Course_ID, 
    Student_ID,
(SUM(CASE
        WHEN Status = 'Present' THEN 1
        ELSE 0 
     END) * 100.0 / COUNT(*)) AS Attendance_Percentage
FROM attendances
GROUP BY Course_ID, Student_ID) AS Attendance_Data;

SELECT Enrollment_Month, Monthly_Students,
SUM(Monthly_Students) OVER (ORDER BY Enrollment_Month) AS Running_Total
FROM (
SELECT DATE_FORMAT(Enrollment_Date, '%Y-%m') AS Enrollment_Month,
COUNT(Student_ID) AS Monthly_Students
FROM enrollments
GROUP BY DATE_FORMAT(Enrollment_Date, '%Y-%m')
) AS Monthly_Data;

-- #### 12.APPLY SQL CASE EXPRESSIONS

SELECT s.Student_ID, s.Name, g.Mark_Obtain,
CASE
   WHEN g.Mark_Obtain > 90 THEN 'Excellent' -- लॉजिक ठीक किया गया (>90)
   WHEN g.Mark_Obtain BETWEEN 75 AND 90 THEN 'Good'
   ELSE 'Needs Improvement'
END AS Performance_Level
FROM students s
JOIN grades g 
ON s.Student_ID = g.Student_ID;
SELECT s.Student_ID, s.Name,
ROUND(SUM(CASE 
              WHEN a.Status = 'Present' THEN 1 
              ELSE 0 
          END) * 100.0 / COUNT(a.Attendance_ID), 2) AS Attendance_Percentage,
CASE
   WHEN SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.Attendance_ID) > 80 THEN 'Regular'
   WHEN SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.Attendance_ID) BETWEEN 50 AND 80 THEN 'Irregular'
   ELSE 'Defaulter'
END AS Attendance_Category
FROM students s
JOIN attendances a 
ON s.Student_ID = a.Student_ID
GROUP BY s.Student_ID, s.Name;
