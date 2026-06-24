SELECT * FROM hr_analytics.hr_analytics;
/*limit 5*/
SELECT * FROM hr_analytics limit 5;
/*CHECK ATTRITION SPLLIT*/
SELECT Attrition, COUNT(*) AS TOTAL
FROM hr_analytics
GROUP BY Attrition;
/*  TOTAL EMPLOYYES*/
SELECT 
COUNT(*) AS TOTAL_EMPLYEES
FROM hr_analytics;
/*EMPLOYYE ATTRITION RSTE*/
SELECT 
ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*),
2) AS Attrition_Rate
FROM hr_analytics;
/*DEPARTMENT WISE ATTRITION*/
SELECT 
Department,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2) AS Attrition_Rate
FROM hr_analytics
GROUP BY Department
ORDER BY Attrition_Rate DESC;
/*OVER TIME IMPACT ANALYSIS*/
SELECT 
OverTime,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2) AS Attrition_Rate
FROM hr_analytics
GROUP BY OverTime;
/*AVAREGE SALAREY BY DEPARTMENT*/
SELECT 
Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_analytics
GROUP BY Department
ORDER BY Avg_Salary DESC;
/*ATTRITION BY  JOB ROLE*/
SELECT 
JobRole,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_analytics
GROUP BY JobRole
ORDER BY Attrition_Count DESC;
/*YEAR WISE LAST PROMOTION*/SELECT 
YearsSinceLastPromotion,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_analytics
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;
/*HINGH RISK EMPLOYEE SEGMENTS*/
SELECT 
Department,
OverTime,
WorkLifeBalance,
ROUND(AVG(MonthlyIncome),2) AS Avg_Salary,
ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2) AS Attrition_Rate
FROM hr_analytics
GROUP BY Department, OverTime, WorkLifeBalance
ORDER BY Attrition_Rate DESC;
/*JOB ROLE BY NOUMBER OF MALES ANDD FEMALES */
SELECT
Gender,
JobRole,
count(*) EMPLOYEEE_COUNT
FROM hr_analytics
group by Gender , JobRole
order by JobRole;
/* DEPARTMENT BY AVAREGE SALAREY*/
SELECT
Department,AVG (MonthlyIncome) AS AVG_SALAREY
FROM hr_analytics
GROUP BY Department
ORDER BY AVG_SALAREY;
/* TOP HINGEST SALAREY IN JOB ROLES */
SELECT
JobRole,
SUM(MonthlyIncome) as SUM_SALAREY
FROM hr_analytics
GROUP BY JobRole
ORDER BY SUM_SALAREY
LIMIT 10;
/*AVAREGE MONTHLY RATE BY SALAREY*/
SELECT
JobRole,
 AVG(MonthlyRate) AS AVG_MONTHLY
 from hr_analytics
 group by JobRole
 order by AVG_MONTHLY
 limit 5;
 /*OVER TIME BY HIKE*/
SELECT
    Department,
    COUNT(*) AS OT_Employees,
    ROUND(AVG(PercentSalaryHike),2) AS Avg_Hike
FROM hr_analytics
WHERE OverTime = 'Yes'
GROUP BY Department
ORDER BY Avg_Hike DESC;
 /*RANK WWISE HINGEST SALAREY*/
 SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary,
    RANK() OVER (
        ORDER BY AVG(MonthlyIncome) DESC
    ) AS Salary_Rank
FROM hr_analytics
GROUP BY JobRole
LIMIT 5;
 /*ATTRITION BY THE JOB ROLE*/
SELECT
    JobRole,
    SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) AS Attrition_Count,
    COUNT(*) AS Employee_Count,
    ROUND(
        SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_analytics
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;
/* CTE Departments with Above Average Salary*/
WITH Dept_salarey as (
select 
Department,
avg (MonthlyIncome) as AVAreage_Salarey
from hr_analytics
group by Department
)
select*
from Dept_salarey
where  AVAreage_Salarey>(
select avg(MonthlyIncome)
from hr_analytics
);
/*Hingh attrition RATE BY DEPARTMENT*/
WITH attrition_stats AS (
    SELECT
        Department,
        ROUND(
            SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
            *100.0/COUNT(*),
            2
        ) AS Attrition_Rate
    FROM hr_analytics
    GROUP BY Department
)
SELECT *
FROM attrition_stats
WHERE Attrition_Rate > 15;