USE CollegeDB;

---------------------------------------------------
-- 1. INNER JOIN (students with their enrollments)
---------------------------------------------------
SELECT s.student_id, s.first_name, s.last_name, c.course_name, e.enrollment_date
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

---------------------------------------------------
-- 2. LEFT JOIN (all students, even if not enrolled)
---------------------------------------------------
SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;

---------------------------------------------------
-- 3. RIGHT JOIN (all courses, even if no students enrolled)
---------------------------------------------------
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

---------------------------------------------------
-- 4. FULL OUTER JOIN (all students + all courses)
-- MySQL workaround: UNION of LEFT + RIGHT
---------------------------------------------------
SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id

UNION

SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

---------------------------------------------------
-- 5. Join with Instructors (who teaches which course)
---------------------------------------------------
SELECT c.course_name, i.first_name AS instructor_name, i.department
FROM Courses c
INNER JOIN Instructors i ON c.instructor_id = i.instructor_id;

---------------------------------------------------
-- 6. Complex Join: Students with their courses & instructors
---------------------------------------------------
SELECT s.first_name AS student_name, c.course_name, i.first_name AS instructor_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
LEFT JOIN Instructors i ON c.instructor_id = i.instructor_id;
