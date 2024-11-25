
**EMPLOYEES DATA ANALYSIS**

**Project Overview**

1.This project leverages an extensive HR dataset to analyze employee performance, salary trends, leave patterns, and retention metrics across various departments and countries.

2.The analysis uncovers insights into salary disparities, the relationship between leave and productivity, and key factors influencing employee turnover. 

3.These findings aim to support data-driven decision-making for improved workforce management and retention strategies.

Datasource : from Kaggle 

**Description:**

1.	This dataset contains detailed information on employees across various departments and countries, capturing key aspects of their employment and performance metrics.
  

2.	It can be used for various HR analytics tasks, such as analysing salary trends, studying the impact of leaves on productivity, or predicting employee turnover.


**Objective**

1.To explore and analyze employee data for uncovering salary trends, performance drivers, and leave patterns across departments and countries. 

2.Leverage predictive analytics to identify factors influencing employee turnover and retention. 

3.Deliver actionable insights to enhance workforce productivity and optimize HR strategies.


**Project Structure**


I). The dataset, originally downloaded from Kaggle in CSV format, has been uploaded to the database as Employees_Dataset.


II).Data Analysis And Finding

1.	How many departments are there in the organization?

2.	Count-wise employee segregation: Which employees work in which department ?

3.	Which countries have the highest employee count (Top 3)?

4.	Which centers do employees work at in the organization?

5.	Which departments have the most employees by gender? (Top 5 departments)

6.	Which employee earns the highest monthly salary?
  
7.	Which employee earns the lowest monthly salary?

8.	What is the average annual salary of employees?

9.	Which department has the highest job rate?

10.	Which department has the lowest job rate?

11.	Which employee has taken the highest number of sick leaves?

12.	What is the average number of sick leaves taken by employees?

13.	Which employee has taken the most unpaid leaves?

14.	Which employee has logged the most overtime hours?

15.What is the average overtime logged by employees?

16.	How many employees have been working with the organization since each year?

**The following SQL queries were developed to answer specific business questions:**

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







