/* 
1. Listing employee details: emloyee number, last name, first name, sex, and salary 
*/
-------------------------------------------------------------------------------------

select em.emp_no, em.last_name, em.first_name, em.sex, sa.salary
from employees as em
inner join salaries as sa
on sa.emp_no = em.emp_no
order by em.last_name
;

/*
2. List the first name, last name, and hire date for the employees who were hired in 1986.
*/
-------------------------------------------------------------------------------------

select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986
;

/*
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
*/
-------------------------------------------------------------------------------------

select distinct on (dm.dept_no) dm.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name
from dept_manager as dm
inner join departments as dp
on dm.dept_no= dp.dept_no
inner join employees as em
on dm.emp_no = em.emp_no
order by dm.dept_no
;

/*
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
*/
-------------------------------------------------------------------------------------

select distinct on (em.emp_no) em.emp_no, em.last_name, em.first_name, dp.dept_name
from employees as em
left join dept_emp as de
on em.emp_no = de.emp_no
inner join departments as dp
on de.dept_no = dp.dept_no
order by em.emp_no
;

/*
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
*/
-------------------------------------------------------------------------------------

select em.last_name, em.first_name
from employees as em
where (em.first_name = 'Hercules') and (lower(em.last_name) like 'b%')
order by em.last_name;

/*
6. List each employee in the Sales department, including their employee number, last name, and first name.
*/
-------------------------------------------------------------------------------------

select em.emp_no, em.last_name, em.first_name, dp.dept_name
from employees as em
inner join dept_emp as de
on em.emp_no = de.emp_no
inner join departments as dp
on de.dept_no = de.dept_no
where lower(dp.dept_name) = 'sales';

/*
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/
-------------------------------------------------------------------------------------

select em.emp_no, em.last_name, em.first_name, dp.dept_name
from employees as em
inner join dept_emp as de
on em.emp_no = de.emp_no
inner join departments as dp
on de.dept_no = de.dept_no
where lower(dp.dept_name) = 'sales' or (lower(dp.dept_name) = 'development');

/*
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
*/
-------------------------------------------------------------------------------------

select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;