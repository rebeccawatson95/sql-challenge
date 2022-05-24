--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no,
        employees.last_name,
        employees.first_name,
        employees.sex,
        salaries.salary
from employees 
    left join salaries 
    on (employees.emp_no = salaries.emp_no)
order by employees.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_data
FROM employees
WHERE hire_data BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT  department_manager.dept_no,
        departments.dept_name,
        department_manager.emp_no,
        employees.last_name,
        employees.first_name
FROM department_manager 
    INNER JOIN departments 
        ON (department_manager.dept_no = departments.dept_no)
    INNER JOIN employees 
        ON (department_manager.emp_no = employees.emp_no);

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN department_employees 
        ON (employees.emp_no = department_employees.emp_no)
    INNER JOIN departments 
        ON (department_employees.dept_no = departments.dept_no)
ORDER BY employees.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN department_employees
        ON (employees.emp_no = department_employees.emp_no)
    INNER JOIN departments 
        ON (department_employees.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        departments.dept_name
FROM employees 
    INNER JOIN department_employees 
        ON (employees.emp_no = department_employees.emp_no)
    INNER JOIN departments 
        ON (department_employees.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

--List the frequency count of employee last names (i.e., how many employees share each last name) 
--in descending order.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;




