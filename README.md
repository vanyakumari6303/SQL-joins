# SQL-joins
In this task, I learned how to combine data from multiple tables using different types of SQL joins. Joins are essential for retrieving related information stored across different tables in a relational database.

Key points:
INNER JOIN → returns rows with matching values in both tables
LEFT JOIN → returns all rows from the left table and matched rows from the right table
RIGHT JOIN → returns all rows from the right table and matched rows from the left table
FULL OUTER JOIN → returns all rows when there is a match in one of the tables (not supported in MySQL, but can be simulated with UNION)

Example queries:
-- 1. INNER JOIN: Students with their enrolled courses
SELECT s.student_id, s.name, c.title
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- 2. LEFT JOIN: Show all students and their courses (if any)
SELECT s.student_id, s.name, c.title
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;

-- 3. RIGHT JOIN: Show all courses and students enrolled
SELECT s.student_id, s.name, c.title
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

-- 4. FULL OUTER JOIN (simulated using UNION in MySQL)
SELECT s.student_id, s.name, c.title
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id
UNION
SELECT s.student_id, s.name, c.title
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

Outcome:
Gained confidence in using joins to merge related data
Learned differences between INNER, LEFT, RIGHT, and FULL joins
Practiced creating meaningful reports by combining Students, Courses, Enrollments, and Instructors
