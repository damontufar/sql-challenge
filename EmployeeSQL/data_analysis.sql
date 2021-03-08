---1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
id AS employee_id,
last_name,
first_name,
sex,
amount AS salary_amount
FROM employees em
INNER JOIN salaries s ON s.employee_id=em.id
ORDER BY 1 ASC;

---2. List first name, last name, and hire date for employees who were hired in 1986.
---Change "hire_data" column name to "hire_date" (typo made)
ALTER TABLE employees
RENAME column hire_data TO hire_date;

SELECT
first_name,
last_name,
hire_date
FROM employees em
WHERE date_trunc('year', hire_date) = '1986-01-01'
ORDER BY 3 ASC;

---3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT
dp.id AS department_id,
department_name,
em.id AS employee_id,
last_name,
first_name
FROM dept_manager dm
LEFT JOIN departments dp ON dp.id=dm.department_id
LEFT JOIN employees em ON em.id=dm.employee_id;


---4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
employee_id,
last_name,
first_name,
department_name
FROM dept_emp de
LEFT JOIN employees em ON em.id=de.employee_id
LEFT JOIN departments dp ON dp.id=de.department_id
ORDER BY 1 ASC;

---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
em.id AS employee_id,
last_name,
first_name,
department_name
FROM employees em
LEFT JOIN dept_emp de ON de.employee_id=em.id
LEFT JOIN departments dp ON dp.id=de.department_id
WHERE department_name = 'Sales'
ORDER BY 1 ASC;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
em.id AS employee_id,
last_name,
first_name,
department_name
FROM employees em
LEFT JOIN dept_emp de ON de.employee_id=em.id
LEFT JOIN departments dp ON dp.id=de.department_id
WHERE department_name = 'Sales'
OR department_name = 'Development'
ORDER BY 1 ASC;


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
last_name,
count(id) AS nr_of_employees
FROM employees
GROUP BY 1
ORDER BY 2 DESC;
