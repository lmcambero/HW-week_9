SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;

--1.List the following details of each employee: employee number, last name, first name, gender, and salary.

--Option 1
SELECT employees.emp_no,
  employees.first_name,
  employees.last_name,
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--Option 2
SELECT a.emp_no,a.last_name,a.first_name,a.gender,b.salary
FROM employees a, salaries b
WHERE a.emp_no=b.emp_no;


--2.List employees who were hired in 1986.
SELECT employees.emp_no,
  employees.first_name,
  employees.last_name
FROM employees
WHERE hire_date between '01/01/1986' and '12/31/1986';


--3.List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name,
--and start and end employment dates.
SELECT a.dept_no,b.dept_name,a.emp_no,c.last_name,c.first_name,a.from_date,a.to_date
FROM dept_manager a, departments b, employees c
WHERE a.emp_no=c.emp_no AND a.dept_no=b.dept_no;

--4.List the department of each employee with the following information: employee number, last name,
--first name, and department name.
SELECT a.emp_no,a.last_name,a.first_name,c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no=b.emp_no AND b.dept_no=c.dept_no
ORDER BY a.emp_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name,
--and department name.
SELECT a.emp_no,a.last_name,a.first_name,c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no=b.emp_no AND b.dept_no=c.dept_no AND c.dept_no = 'd007';

--7.List all employees in the Sales and Development departments, including their employee number, last name,
--first name, and department name.
SELECT a.emp_no,a.last_name,a.first_name,c.dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no=b.emp_no AND b.dept_no=c.dept_no AND (c.dept_no = 'd007' OR c.dept_no = 'd005');

--8.In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
ORDER BY first_name DESC;

