/* Create Departments Table */
-------------------------------------------

drop table departments

create table departments (
	dept_no VARCHAR(40) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

/* Create Titles Table */
-------------------------------------------

drop table titles 

create table titles (
	title_id VARCHAR(35) PRIMARY KEY NOT NULL,
	title VARCHAR(40) NOT NULL
);

/* Creating Employee Tables */
------------------------------------------
drop table employees;

create table employees (
	 emp_no INT PRIMARY KEY NOT NULL,
	 emp_title VARCHAR(35) NOT NULL,
	 birth_date DATE NOT NULL,
	 first_name VARCHAR(35) NOT NULL,
	 last_name VARCHAR(35) NOT NULL,
	 sex VARCHAR(1) NOT NULL,
	 hire_date DATE NOT NULL
);

/* Create Department Employee Table */
-------------------------------------------

drop table dept_emp;

create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(40) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

/* Create Salaries Table */
-------------------------------------------

drop table salaries 

create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

/* Create Department Manager Table */
-------------------------------------------

drop table dept_manager

create table dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);


