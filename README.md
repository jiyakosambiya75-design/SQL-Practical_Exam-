::: {align="center"}
# 🎓 Student Performance & Attendance Tracker

### 📚 A SQL Database Management Project for Student Records, Academic Performance & Attendance Monitoring

## 🌟 About the Project

The **Student Performance & Attendance Tracker** is a relational
database project built with **SQL**. It is designed to organize
important academic information in one structured database, including
student details, departments, faculty members, courses, enrollments,
attendance records, and grades.

The project demonstrates how a relational database can store connected
information and how SQL can be used to retrieve, update, filter,
summarize, and analyze that information.

It also serves as a practical exercise in core and intermediate SQL
concepts, from creating tables and defining relationships to writing
joins, subqueries, aggregate queries, date calculations, window
functions, and conditional expressions.

> 💡 **Project idea:** Bring student, course, attendance, and result
> information together in a structured database so that academic records
> can be queried and analyzed efficiently.

## 🎯 Project Objectives

The main objectives of this project are to:

-   🧑‍🎓 Store student information, including contact details and
    admission dates.
-   🏢 Organize students and faculty members by department.
-   👩‍🏫 Maintain faculty records and associate faculty members with
    courses.
-   📖 Maintain course information and student enrollment records.
-   🗓️ Record attendance with `Present`, `Absent`, and `Late` statuses.
-   📝 Store marks and letter grades for students.
-   🔗 Establish relationships between tables using primary and foreign
    keys.
-   📊 Practice SQL queries to summarize and examine academic data.
-   🚀 Build confidence with SQL features used in relational database
    management.

## 🧰 Technology Stack

  -----------------------------------------------------------------------
  Technology                          Usage
  ----------------------------------- -----------------------------------
  🐬 MySQL-compatible SQL             Database creation, data management,
                                      and queries

  🗃️ Relational database design       Organizing records into related
                                      tables

  🔑 Primary and foreign keys         Identifying records and connecting
                                      tables

  📊 SQL analytical features          Aggregations, subqueries, and
                                      window functions
  -----------------------------------------------------------------------

**Database name:** `Student_performance_Attandence_Tracker`

The supplied script uses MySQL-style syntax and functions such as
`CURDATE()`, `TIMESTAMPDIFF()`, and `DATE_FORMAT()`.

## 🗂️ Database Structure

The database begins with seven main tables. Each table stores a
different category of academic information.

  ------------------------------------------------------------------------
                           No. Table                 Description
  ---------------------------- --------------------- ---------------------
                             1 `departments`         Stores department IDs
                                                     and department names.

                             2 `students`            Stores student
                                                     details, contact
                                                     information,
                                                     admission date, and
                                                     department reference.

                             3 `faculty`             Stores faculty names,
                                                     contact information,
                                                     and department
                                                     reference.

                             4 `courses`             Stores course IDs,
                                                     course names, and
                                                     department
                                                     references.

                             5 `enrollments`         Connects students to
                                                     courses and records
                                                     enrollment dates.

                             6 `attendances`         Stores student
                                                     attendance records,
                                                     dates, courses, and
                                                     attendance status.

                             7 `grades`              Stores marks obtained
                                                     and letter grades for
                                                     students in courses.
  ------------------------------------------------------------------------

### 🧩 Table Details

#### 🏢 1. Departments --- `departments`

Contains the academic departments available in the sample database.

  Column              Description
  ------------------- ----------------------------------------
  `Department_ID`     Primary key identifying the department
  `Department_Name`   Name of the department

Sample departments include Computer Science, Information Technology,
Mechanical Engineering, Civil Engineering, and Electrical Engineering.

#### 🧑‍🎓 2. Students --- `students`

Stores the personal and academic admission details of students.

  Column             Description
  ------------------ ---------------------------------------
  `Student_ID`       Primary key identifying the student
  `Name`             Student name
  `DOB`              Date of birth
  `Gender`           Student gender
  `Email`            Email address
  `Phone_Number`     Contact number
  `Address`          Address
  `Admission_Date`   Date of admission
  `Department_ID`    Foreign key referencing `departments`

#### 👩‍🏫 3. Faculty --- `faculty`

Stores faculty details and their department assignments.

  -----------------------------------------------------------------------
  Column                              Description
  ----------------------------------- -----------------------------------
  `Faculty_ID`                        Primary key identifying the faculty
                                      member

  `Name`                              Faculty member's name

  `Email`                             Email address

  `Phone_Number`                      Contact number

  `Department_ID`                     Foreign key referencing
                                      `departments`

  `Experience_Years`                  Added later in the script to store
                                      years of experience
  -----------------------------------------------------------------------

#### 📘 4. Courses --- `courses`

Stores the courses offered by departments.

  Column            Description
  ----------------- --------------------------------------------------
  `Courses_ID`      Primary key identifying the course
  `Courses_Name`    Course name
  `Department_ID`   Foreign key referencing `departments`
  `Faculty_ID`      Added later in the script to reference `faculty`

#### 📝 5. Enrollments --- `enrollments`

Connects students with courses.

  Column              Description
  ------------------- ----------------------------------------
  `Enrollment_ID`     Primary key identifying the enrollment
  `Student_ID`        Foreign key referencing `students`
  `Course_ID`         Foreign key referencing `courses`
  `Enrollment_Date`   Date of enrollment

The script also attempts to add a unique constraint on
`(student_id, course_id)` so that the same student-course combination
cannot be entered more than once.

#### 📅 6. Attendances --- `attendances`

Stores attendance information for students and courses.

  Column              Description
  ------------------- ---------------------------------------------------
  `Attendance_ID`     Primary key identifying the attendance record
  `Student_ID`        Foreign key referencing `students`
  `Course_ID`         Foreign key referencing `courses`
  `Attendance_Date`   Date of attendance
  `Status`            Attendance status: `Present`, `Absent`, or `Late`

A `CHECK` constraint is used to restrict the status to the three listed
values.

#### 🏆 7. Grades --- `grades`

Stores student marks and letter grades.

  Column          Description
  --------------- ------------------------------------------
  `Grade_ID`      Primary key identifying the grade record
  `Student_ID`    Foreign key referencing `students`
  `Course_ID`     Foreign key referencing `courses`
  `Mark_Obtain`   Marks obtained
  `Grade`         Letter grade: `A`, `B`, `C`, or `D`

A `CHECK` constraint is used to restrict the letter grade to `A`, `B`,
`C`, or `D`.

## 🔗 Database Relationships

The project uses primary keys and foreign keys to connect related
records.

-   🏢 One department can be associated with multiple students.
-   🏢 One department can be associated with multiple faculty members.
-   🏢 One department can offer multiple courses.
-   🧑‍🎓 A student can have enrollment records for courses.
-   📘 A course can have enrollment records for students.
-   📅 Attendance records connect a student with a course and date.
-   🏆 Grade records connect a student with a course.
-   👩‍🏫 The later `Faculty_ID` addition connects a course with a faculty
    member.

These relationships help keep information organized and reduce the need
to repeat department, student, course, and faculty details in every
record.

## ⚙️ SQL Concepts Covered

This project is designed as hands-on practice for a range of SQL topics.

### 1️⃣ Database & Table Creation

The script creates the database and selects it for use.

``` sql
CREATE DATABASE IF NOT EXISTS Student_performance_Attandence_Tracker;

USE Student_performance_Attandence_Tracker;
```

It then creates the seven core tables with their columns, primary keys,
and foreign keys.

### 2️⃣ CRUD Operations --- Create, Read, Update & Delete

CRUD represents the four basic operations used to manage database
records.

  Operation   SQL command   Purpose
  ----------- ------------- ---------------------------
  ➕ Create   `INSERT`      Add new records
  👀 Read     `SELECT`      Retrieve existing records
  ✏️ Update   `UPDATE`      Modify existing records
  🗑️ Delete   `DELETE`      Remove records

The script includes examples that insert student, faculty, course, and
enrollment records, retrieve student data, and demonstrate update and
delete operations.

### 3️⃣ SQL Clauses

The examples explore clauses used to filter, sort, group, and limit
query results.

-   `WHERE` --- filters records based on a condition.
-   `ORDER BY` --- sorts query results.
-   `GROUP BY` --- groups records for calculations.
-   `HAVING` --- filters grouped results.
-   `LIMIT` --- restricts the number of returned rows.
-   `DISTINCT` --- removes duplicate rows from a result.

### 4️⃣ SQL Operators

The practice queries demonstrate operators used to define conditions.

-   `=` --- checks equality.
-   `<` and `>` --- compare values.
-   `AND` --- requires multiple conditions to be true.
-   `OR` --- accepts either of the specified conditions.
-   `IN` / `NOT IN` --- checks whether a value is or is not in a set of
    values.

### 5️⃣ Sorting & Grouping Data

The script includes examples for:

-   Sorting student records by name.
-   Counting students in each department.
-   Grouping courses to calculate average marks.

These queries demonstrate how to turn individual records into useful
summaries.

### 6️⃣ Aggregate Functions

Aggregate functions calculate a result from multiple rows.

  Function    Purpose
  ----------- -------------------------
  `COUNT()`   Counts records
  `AVG()`     Calculates an average
  `SUM()`     Adds values
  `MAX()`     Finds the highest value
  `MIN()`     Finds the lowest value

Examples in the script include counting students by department,
calculating average marks, and finding the highest and lowest marks by
course.

### 7️⃣ Primary Keys, Foreign Keys & Constraints

The project demonstrates relational integrity through:

-   `PRIMARY KEY` --- uniquely identifies each row.
-   `FOREIGN KEY` --- links records between related tables.
-   `UNIQUE` --- prevents duplicate values in the constrained column or
    column combination.
-   `CHECK` --- restricts values according to a condition.

The script includes a unique constraint for student-course enrollments
and check constraints for attendance status and letter grades.

### 8️⃣ SQL Joins

Joins combine related records from multiple tables.

  -----------------------------------------------------------------------
  Join                                What it does
  ----------------------------------- -----------------------------------
  `INNER JOIN`                        Returns rows with matching values
                                      in both tables.

  `LEFT JOIN`                         Returns all rows from the left
                                      table and matching rows from the
                                      right table, if available.
  -----------------------------------------------------------------------

The supplied examples aim to combine student and department details,
identify students without enrollment records, and associate courses with
faculty members.

### 9️⃣ Subqueries

A subquery is a query nested inside another SQL query.

The script includes examples intended to:

-   Find students whose marks are greater than the average marks.
-   Find courses assigned to faculty members with at least five years of
    experience.
-   Count absent attendance records for each student and filter grouped
    results.

### 🔟 Date & Time Functions

Date functions help retrieve and format information based on dates.

  -----------------------------------------------------------------------
  Function                            Purpose
  ----------------------------------- -----------------------------------
  `MONTH()`                           Extracts the month from a date

  `CURDATE()`                         Returns the current date

  `TIMESTAMPDIFF()`                   Calculates the difference between
                                      two dates or times in a chosen unit

  `DATE_FORMAT()`                     Formats a date as a string
  -----------------------------------------------------------------------

The examples include monthly attendance record counts, years since
admission, and formatted attendance dates.

### 1️⃣1️⃣ Window Functions

Window functions perform calculations across related rows while
retaining individual result rows.

The script demonstrates:

-   `RANK()` --- ranks students based on overall marks.
-   `SUM() OVER (...)` --- calculates cumulative attendance or running
    enrollment totals.
-   `PARTITION BY` --- divides rows into groups for window calculations.
-   `ORDER BY` inside a window --- defines the order in which cumulative
    calculations are performed.

These functions are useful for ranking and trend analysis.

### 1️⃣2️⃣ CASE Expressions

`CASE` expressions apply conditional logic inside SQL queries.

The supplied examples aim to:

-   Classify academic performance based on marks.
-   Calculate attendance percentages.
-   Categorize attendance as `Regular`, `Irregular`, or `Defaulter`.

This makes it possible to return meaningful labels alongside calculated
values.

## 📊 Analysis & Reporting Examples

The SQL script includes examples intended to answer questions such as:

  -----------------------------------------------------------------------
  🔍 Question                         SQL concepts involved
  ----------------------------------- -----------------------------------
  Which students belong to each       `JOIN`, `WHERE`
  department?                         

  How many students are in each       `LEFT JOIN`, `COUNT`, `GROUP BY`
  department?                         

  What is the average mark for each   `AVG`, `JOIN`, `GROUP BY`
  course?                             

  Which students scored above the     Subquery, `AVG`
  overall average?                    

  Which courses are assigned to       `JOIN`, `WHERE`
  experienced faculty?                

  How many absent records does each   `COUNT`, `GROUP BY`, `HAVING`
  student have?                       

  What is the attendance percentage   `CASE`, `SUM`, `COUNT`
  for each student?                   

  How can students be ranked by their `RANK()`
  marks?                              

  How can monthly enrollment totals   `DATE_FORMAT`, `COUNT`, window
  be accumulated?                     `SUM()`
  -----------------------------------------------------------------------

> 📌 These are the analytical goals represented by the supplied
> examples. Some queries need corrections before they will execute
> successfully; see the notes below.

## 🚀 Getting Started

Follow these steps to set up the project in a MySQL-compatible
environment.

### 📋 Prerequisites

Before running the SQL script, make sure you have:

-   🐬 MySQL Server installed and running.
-   💻 A SQL client, such as MySQL Workbench or the MySQL command-line
    client.
-   🔐 Permission to create databases, tables, constraints, and records.
-   📄 The project `.sql` file.

### 🛠️ Installation & Execution

**Step 1 --- Open your SQL environment**

Launch MySQL Workbench or your preferred MySQL-compatible SQL client and
connect to your database server.

**Step 2 --- Open the SQL file**

Open the project SQL script in the editor.

**Step 3 --- Create and select the database**

Run the database creation and `USE` statements:

``` sql
CREATE DATABASE IF NOT EXISTS Student_performance_Attandence_Tracker;
USE Student_performance_Attandence_Tracker;
```

**Step 4 --- Create the tables**

Execute the table creation statements in order. The department table is
created before the tables that reference it.

**Step 5 --- Insert sample data**

Run the `INSERT` statements to populate the tables with the sample
departments, students, faculty, courses, enrollments, attendance
records, and grades.

**Step 6 --- Check the records**

Use `SELECT` statements to inspect the data in each table.

``` sql
SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM faculty;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM attendances;
SELECT * FROM grades;
```

**Step 7 --- Apply later schema changes**

The script later adds faculty experience and a faculty reference to
courses. Apply these schema changes and related updates in the intended
order, after checking for duplicate constraint names and existing
columns.

**Step 8 --- Practice the queries**

Review and run the CRUD, joins, subqueries, date functions, window
functions, and `CASE` examples individually after correcting the issues
described below.

## ⚠️ Important Notes & Known Issues

This README describes the SQL file as supplied. The file contains
several practice statements that do not fully match the initial table
definitions or have syntax problems. It should be treated as a learning
script that needs review, rather than a fully validated, one-click
setup.

Before running the entire script, check these points:

1.  **Column-name differences:** The initial `students` table defines
    `Name`, but some later queries use `Student_Name`.
2.  **Marks are stored in `grades`:** The initial `enrollments` table
    does not define a `Marks` column. Marks are stored in
    `grades.Mark_Obtain`, so queries that select `e.Marks` need to be
    redesigned.
3.  **Attendance fields:** The initial `students` table does not contain
    an `Attendance` column. Attendance is stored in the separate
    `attendances` table.
4.  **Faculty assignment:** `Faculty_ID` is added to `courses` later in
    the script. Queries using it must run after the column and its
    foreign key have been added.
5.  **Update syntax:** The example `UPDATE Phone_Number SET ...` is not
    valid MySQL syntax. An update should name the table after `UPDATE`
    and assign a column in `SET`.
6.  **Join aliases:** Some later join examples use aliases that are not
    defined consistently, or refer to tables that are not included in
    the `FROM` clause.
7.  **Subquery references:** One example attempts to find faculty IDs in
    `courses` before the supplied initial course definition contains
    that column. The later schema change needs to be applied first.
8.  **Window-function query:** The cumulative attendance query has a
    missing comma in its derived table's `SELECT` list and should be
    checked before execution.
9.  **Constraint duplication:** The script appears to add the
    `fk_faculty` constraint in more than one place. Avoid adding the
    same constraint twice.
10. **Performance threshold:** The `CASE` expression uses
    `Mark_Obtain > 9` for the `Excellent` label. Confirm whether this is
    the intended threshold.
11. **Sample data limitations:** The supplied data contains only a small
    number of sample records. For example, the absent-record query uses
    `HAVING COUNT(...) > 10`, which will not return a student from the
    five sample attendance records.
12. **Delete and foreign-key dependencies:** Deleting a student who is
    referenced by enrollment, attendance, or grade records may fail
    unless dependent records are handled first or an appropriate delete
    rule is defined.

✅ **Recommended approach:** First run and verify the database schema
and sample-data section. Then fix and execute each practice query
separately. This makes errors easier to locate and helps preserve the
sample data.

## 🧪 Suggested Testing Checklist

After setup and after correcting the relevant queries, use this
checklist to review the project:

-   [ ] Database is created and selected successfully.
-   [ ] All seven initial tables are created.
-   [ ] Primary keys are present.
-   [ ] Foreign-key relationships are valid.
-   [ ] Sample data is inserted successfully.
-   [ ] `SELECT` statements return the expected sample records.
-   [ ] CRUD examples are corrected and tested safely.
-   [ ] Sorting, filtering, and grouping queries execute.
-   [ ] Aggregate functions return expected results.
-   [ ] Join queries use valid table and column names.
-   [ ] Subqueries execute with the correct schema.
-   [ ] Date and time functions return valid results.
-   [ ] Window functions execute and produce the intended calculations.
-   [ ] `CASE` expressions use the intended thresholds and categories.

## 📁 Suggested Repository Structure

A simple GitHub repository layout could look like this:

``` text
Student-Performance-Attendance-Tracker/
│
├── 📄 README.md
├── 🗄️ student_performance_attendance_tracker.sql
└── 📁 screenshots/
    ├── database_tables.png
    ├── sample_records.png
    └── query_results.png
```

Rename the SQL file in this example to match the actual filename in your
repository. The screenshots folder is optional and can be added if you
want to show database tables or query outputs.

## 🔮 Future Enhancements

The current project focuses on relational database design and SQL
practice. It could be extended in several ways:

-   📈 Add more student, faculty, course, attendance, and grade records
    for richer analysis.
-   📊 Create views for frequently used student-performance and
    attendance reports.
-   ⚡ Add indexes to columns that are frequently searched or used in
    joins.
-   🧾 Add a semester or academic-year table to organize records by
    term.
-   📚 Add a dedicated assessments table to store exam names, dates,
    maximum marks, and assessment types.
-   📉 Create more detailed attendance and academic-performance reports.
-   🔐 Add user roles and permissions for controlled database access.
-   🖥️ Build a front-end application to make the database easier to use.
-   🔄 Add stored procedures or triggers for selected repetitive
    database operations.

These are possible extensions, not features already implemented in the
supplied SQL file.

## 🎓 Learning Outcomes

By working through this project, a learner can practice:

-   Understanding relational database structure.
-   Creating tables with primary and foreign keys.
-   Inserting, retrieving, updating, and deleting records.
-   Combining related information with joins.
-   Filtering and grouping data.
-   Using aggregate functions for summaries.
-   Writing nested queries with subqueries.
-   Working with dates and time calculations.
-   Applying window functions for rankings and cumulative totals.
-   Using conditional logic through `CASE` expressions.
-   Identifying and debugging SQL syntax and schema errors.

## 👨‍💻 Project Information

  Detail         Information
  -------------- --------------------------------------------------
  Project        Student Performance & Attendance Tracker
  Category       Database Management / SQL
  Database       `Student_performance_Attandence_Tracker`
  SQL style      MySQL-compatible SQL
  Main focus     Student records, courses, attendance, and grades
  Project type   SQL learning and practice project

## 💬 Final Words

The **Student Performance & Attendance Tracker** brings together several
important database concepts in one practical SQL project. From designing
related tables to writing analytical queries, it offers a useful
foundation for learning how structured data can be managed and explored.

Keep experimenting, keep querying, and keep learning! 🚀

::: {align="center"}
### ⭐ If you find this project useful, feel free to star the repository!

**Made with 💙, SQL, and a passion for learning.**
:::
