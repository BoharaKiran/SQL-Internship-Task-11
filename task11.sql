USE intern_training_db;
CREATE DATABASE task11_indexing;
use task11_indexing;

CREATE TABLE emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
);


INSERT INTO emp (emp_name, department, salary, joining_date) VALUES
('Anita', 'IT', 50000, '2022-01-10'),
('Ravina', 'HR', 40000, '2021-03-15'),
('Nirav', 'IT', 60000, '2020-06-20'),
('Kiran', 'Finance', 45000, '2021-09-05'),
('Purva', 'IT', 55000, '2023-02-01');


#Query WITHOUT Index (Slow Query)
SELECT * FROM emp WHERE department = 'IT';


#Using EXPLAIN
EXPLAIN SELECT * FROM emp WHERE department = 'IT';


#Index on Frequently Searched Column
create index idx_department on emp(department);


#Query WITH Index
SELECT * FROM emp where department='IT';


explain select * from emp where department='IT';


#Index on Multiple Column
CREATE INDEX idx_dept_salary on emp(department,salary);


explain select * from emp
where department='IT' and salary>50000;


#Clustered vs Non-Clustered Index
/*| Type            | Explanation                                           |
  | ----------------|------------------------------------------------------ |
  | Clustered       | Data stored in index order (Primary Key in MySQL)     |
  | Non-Clustered   | Separate structure pointing to data (Secondary index) |*/


#where indexes hurt performance
/*-On small tables
  -On columns with frequent updates
  -On columns with low uniqueness
   -Too many indexes slow INSERT / UPDATE / DELETE*/