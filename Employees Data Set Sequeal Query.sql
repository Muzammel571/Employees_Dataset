
---Employee Data Analysis ----

--Checking All Table in Database
SELECT
*
FROM [Employees' Data].[dbo].[Employees$];

--1.How many departments are there in organization ?

Select
Count (Distinct (Department)) AS No_of_Dept
FROM [Employees' Data].[dbo].[Employees$]; 

--2.We need to find  County wise segregation which employees work in which departments 
SELECT
[First Name],
[Last Name],
Department,
Country
FROM [Employees' Data].[dbo].[Employees$]
WHERE Country IN (
SELECT DISTINCT Country
FROM [Employees' Data].[dbo].[Employees$])
ORDER BY Country, Department ;

--3.Which countries have the highest employee count ?
SELECT
Country,
COUNT(*) AS Employee_Count
FROM[Employees' Data].[dbo].[Employees$]
GROUP BY Country
ORDER BY Employee_Count DESC ;

--4.Which centers do employees work at in the organization in Percentage?
Select
Center,
(COUNT(*) * 100/ ROUND((SELECT COUNT(*) FROM [Employees' Data].[dbo].[Employees$]), 2)) AS Employee_Percent
FROM[Employees' Data].[dbo].[Employees$]
GROUP by Center
ORDER BY Employee_Percent DESC ;

--5.Which departments have the most employees by gender? (Top 5 departments)
SELECT
Top 5
Department,
Gender,
COUNT(*) AS Employee_Count
FROM [Employees' Data].[dbo].[Employees$]
GROUP BY Department,Gender
ORDER BY Employee_Count DESC;

--6.Which employee earns the highest monthly salary 
Select
Top 1
[First Name],
[Last Name],
[Monthly Salary] AS Highest_Salary
FROM [Employees' Data].[dbo].[Employees$]
ORDER By Highest_Salary Desc;

--7.What is the average annual salary of employees?
Select
ROUND (AVG ([Monthly Salary]) ,2) AS Average_Salary
FROM [Employees' Data].[dbo].[Employees$]

--8.Which top 5 department has the highest job rate?
Select
Top 5
Department,
MAX ([Job Rate]) As Highest_Job_Rate
FROM [Employees' Data].[dbo].[Employees$]
Group by Department
ORDER by Highest_Job_Rate Desc;

--9.Which  top 3 department has the lowest job rate?
Select
Top 3
Department,
MIN ([Job Rate]) As lowest_Job_Rate
FROM [Employees' Data].[dbo].[Employees$]
Group by Department
ORDER by lowest_Job_Rate Desc;

--10.Which employee has taken the highest number of sick leaves?
SELECT 
TOP 1
[First Name],
[Last Name],
[Sick Leaves]
FROM [Employees' Data].[dbo].[Employees$]
ORDER BY [Sick Leaves] DESC;

--11.What is the average number of sick leaves taken by employees?
SELECT 
ROUND (AVG  ([Sick Leaves]),0)  As No_of_Average
FROM [Employees' Data].[dbo].[Employees$]

--12.Which employee has taken the most unpaid leaves?
SELECT
Top 1
[First Name],
[Last Name],
MAX ([Unpaid Leaves]) AS Most_Unpaid
FROM [Employees' Data].[dbo].[Employees$]
GROUP BY [First Name],[Last Name]
ORDER BY Most_Unpaid Desc;

--13.Which employee has logged the most overtime hours?
Select
Top 1
[First Name],
[Last Name],
MAX ([Overtime Hours]) AS Most_Overtime
FROM [Employees' Data].[dbo].[Employees$]
GROUP BY [First Name],[Last Name]
ORDER BY Most_Overtime Desc;

--14.What is the average overtime logged by employees?
Select
ROUND (AVG ([Overtime Hours]),0) AS Avg_Overtime
FROM [Employees' Data].[dbo].[Employees$];

--15.How many employees have been working with the organization since each year?
Select
Years,
Count (*) As No_of_Employee
FROM [Employees' Data].[dbo].[Employees$]
Group By Years
ORDER By No_of_Employee Desc;






