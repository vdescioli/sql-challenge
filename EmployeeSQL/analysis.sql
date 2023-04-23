-- List the employee number, last name, first name, sex, and 
-- salary of each employee.

SELECT e.emp_no, 
  e.last_name, 
  e.first_name, 
  e.sex, 
  s.salary
FROM Employees as e
INNER JOIN salaries as s on
e.emp_no = s.emp_no;

-- List the first name, last name, and 
-- hire date for the employees who were hired in 1986

SELECT e.first_name,
e.last_name,
e.hire_date
FROM employees as e
WHERE DATE_PART('year',hire_date) = 1986;

-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name

SELECT d.dept_no, 
  d.dept_name, 
  m.emp_no, 
  e.last_name, 
  e.first_name
FROM Departments as d
INNER JOIN dept_managers as m on
d.dept_no = m.dept_no
INNER JOIN employees as e on
m.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s
-- employee number, last name, first name, and department name

SELECT dept_emp.dept_no,
dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
INNER JOIN employees on 
dept_emp.emp_no = employees.emp_no
INNER JOIN departments on 
dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B

SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee
-- number, last name, and first name

SELECT departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
FROM departments
INNER JOIN dept_emp on
departments.dept_no = dept_emp.dept_no
INNER JOIN employees on 
dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

SELECT departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
FROM departments
INNER JOIN dept_emp on
departments.dept_no = dept_emp.dept_no
INNER JOIN employees on 
dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee
-- last names (that is, how many employees share each last name)

SELECT last_name,COUNT(last_name) as "same name #"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

