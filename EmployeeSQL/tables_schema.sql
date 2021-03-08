----Create tables & read csv files

CREATE TABLE departments (
	id VARCHAR(10) NOT NULL PRIMARY KEY,
	department_name VARCHAR(30));

CREATE TABLE titles (
	id VARCHAR(10) NOT NULL PRIMARY KEY,
	title_name VARCHAR (20));

CREATE TABLE employees (
	id INT NOT NULL PRIMARY KEY,
	title_id VARCHAR (10),
	birthday DATE,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	sex VARCHAR (1),
	hire_data DATE,
	FOREIGN KEY (title_id) REFERENCES titles(id));
	
CREATE TABLE salaries(
	employee_id INT NOT NULL,
	amount INT,
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

--Create tables with composite keys

CREATE TABLE dept_manager(
	department_id VARCHAR (10) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments(id),
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	PRIMARY KEY (department_id, employee_id)
);

CREATE TABLE dept_emp(
	employee_id INT NOT NULL,
	department_id VARCHAR (10) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (department_id) REFERENCES departments(id),
	PRIMARY KEY (employee_id, department_id)
);



