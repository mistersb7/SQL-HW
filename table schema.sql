CREATE TABLE departments(
	dept_no VARCHAR(5),
	dept_name VARCHAR(25)
)

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(5),
	from_date DATE,
	to_date DATE
)
CREATE TABLE dept_manager(
	dept_no VARCHAR(5),
	emp_no INT,
	from_date DATE,
	to_date DATE
)

CREATE TABLE employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(5),
	hire_date DATE
)
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
)
CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
)
SELECT * FROM titles lIMIT 5