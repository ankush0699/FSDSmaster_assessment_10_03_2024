CREATE DATABASE SQL_ASSESSMENT10032024;

USE SQL_ASSESSMENT10032024;

CREATE TABLE Employee (
  Emp_Id INT,
  Emp_name VARCHAR(50),
  Salary INT,
  Manager_Id INT
);

INSERT INTO Employee VALUES
(10, 'Anil', 50000, 18),
(11, 'Vikas', 75000, 16),
(12, 'Nisha', 40000, 18),
(13, 'Nidhi', 60000, 17),
(14, 'Priya', 80000, 18),
(15, 'Mohit', 45000, 18),
(16, 'Rajesh', 90000, NULL),
(17, 'Raman', 55000, 16),
(18, 'Santosh', 65000, 17);

SELECT
  Manager_Id,
  Manager,
  AVG(Salary) AS Average_Salary_Under_Manager
FROM
  (
    SELECT
      e.Manager_Id,
      m.Emp_name AS Manager,
      e.Salary
    FROM
      Employee e
      JOIN Employee m ON e.Manager_Id = m.Emp_Id
  ) AS Subquery
GROUP BY
  Manager_Id, Manager;