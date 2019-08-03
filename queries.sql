--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no

-----------------------------------------------------------------------------------------

--2. List employees who were hired in 1986.
SELECT e.emp_no, e.first_name,e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
LIMIT 10

-----------------------------------------------------------------------------------------

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON e.emp_no = dm.emp_no
LIMIT 10

-----------------------------------------------------------------------------------------
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
FULL JOIN dept_manager dm ON e.emp_no = dm.emp_no
FULL JOIN dept_emp de ON e.emp_no = de.emp_no
FULL JOIN departments d ON de.dept_no = d.dept_no
LIMIT 10

-- Otherwise for just employees:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
LIMIT 10
-----------------------------------------------------------------------------------------

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
-----------------------------------------------------------------------------------------

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Instructions state to list all employees in Sales. Managers are employees so they are also listed. The full joins worked in this instance. Is there a better way?
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
FULL JOIN dept_manager dm ON e.emp_no = dm.emp_no
FULL JOIN dept_emp de ON e.emp_no = de.emp_no
FULL JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
-- Otherwise for just employees:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

-----------------------------------------------------------------------------------------

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Instructions state to list all employees. Managers are employees so they are also listed. The full joins worked in this instance. Is there a better way?
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
FULL JOIN dept_manager dm ON e.emp_no = dm.emp_no
FULL JOIN dept_emp de ON e.emp_no = de.emp_no
FULL JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')
-- Otherwise for just employees:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')

-----------------------------------------------------------------------------------------

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) Count
FROM employees
GROUP BY last_name
ORDER BY  Count desc
