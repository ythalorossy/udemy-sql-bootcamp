-- CREATE TABLE students(
-- 	student_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(150) NOT NULL,
-- 	last_name VARCHAR(150) NOT NULL,
-- 	homeroom_number INTEGER NOT NULL,
-- 	phone VARCHAR(50) UNIQUE NOT NULL, 
-- 	email VARCHAR(150) UNIQUE NOT NULL, 
-- 	graduation_year INTEGER CHECK (graduation_year > 1900)
-- );

-- CREATE TABLE teachers(
-- 	tearcher_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(150) NOT NULL,
-- 	last_name VARCHAR(150) NOT NULL,
-- 	homeroom_number INTEGER NOT NULL,
-- 	department VARCHAR(100) NOT NULL,
-- 	phone VARCHAR(50) UNIQUE NOT NULL, 
-- 	email VARCHAR(150) UNIQUE NOT NULL
-- );

ALTER TABLE students
ALTER COLUMN email DROP NOT NULL; 

ALTER TABLE students
ADD CHECK (graduation_year <= date_part('year', CURRENT_DATE))
;

INSERT INTO students (
	first_name,
	last_name,
	homeroom_number,
	phone, 
	email,
	graduation_year
) 
VALUES
(
	'Mark',
	'Watney',
	5,
	'777-555-1234',
	null,
	2035
)
;

SELECT * FROM students;

INSERT INTO teachers (
	first_name,
	last_name,
	homeroom_number,
	department,
	phone,
	email
)
VALUES (
	'Jonas',
	'Salk',
	5, 
	'Biology',
	'777-555-4321',
	'jsalk@school.org'
)
;

ALTER TABLE teachers
ALTER COLUMN email DROP NOT NULL; 

SELECT * FROM teachers;

