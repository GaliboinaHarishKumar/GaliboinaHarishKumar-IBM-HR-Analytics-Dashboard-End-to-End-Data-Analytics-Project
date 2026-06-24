# 🧠 HR Analytics Dashboard — Employee Attrition & Workforce Intelligence

> **End-to-end HR analytics project** covering SQL analysis, Python EDA, and a Power BI dashboard built on IBM's HR Analytics dataset (1,470 employees).

---

## 📌 Project Overview

Employee attrition is one of the costliest challenges for organizations. This project dives deep into workforce data to uncover **who is leaving, why, and what can be done about it** — combining structured SQL querying, Python-based exploratory analysis, and an interactive Power BI dashboard.

| Layer | Tool | Output |
|---|---|---|
| Data Extraction & Analysis | SQL (MySQL) | Attrition metrics, salary rankings, risk segments |
| Exploratory Data Analysis | Python (Pandas, Seaborn, Matplotlib) | Statistical insights, visual patterns |
| Business Intelligence Dashboard | Power BI + DAX | Interactive KPI dashboard |

---

## 📂 Repository Structure

```
hr-analytics/
│
├── hr_analytics.csv              # Source dataset (1,470 employees, 35 features)
├── HR_SQL.sql                    # SQL queries — attrition, salary, risk segments
├── hr_analytics.py               # Python EDA script
├── hr_analytics_EDA.ipynb        # Jupyter Notebook — full EDA walkthrough
├── Hr_Analytic_Dashboard.pbix    # Power BI dashboard file
└── README.md
```

---

## 🔍 Dataset

- **Source:** IBM HR Analytics Employee Attrition & Performance (Kaggle)
- **Size:** 1,470 employees × 35 features
- **Key Fields:** `Attrition`, `Department`, `JobRole`, `MonthlyIncome`, `OverTime`, `JobLevel`, `YearsSinceLastPromotion`, `WorkLifeBalance`, `Gender`

---

## 🗄️ SQL Analysis (`HR_SQL.sql`)

Queries cover the full analytics pipeline from basic profiling to advanced window functions and CTEs:

| Query | Insight |
|---|---|
| Attrition Split | 237 employees left (16.12% overall attrition rate) |
| Department-wise Attrition | Sales: **20.63%** → highest attrition |
| OverTime Impact | Employees working overtime show significantly higher attrition |
| Salary by Department | Sales: $6,959 avg \| R&D: $6,281 avg |
| Attrition by Job Role | Sales Representatives: **39.76%** attrition rate |
| High-Risk Segments | CTE combining OverTime + WorkLifeBalance + Department |
| Salary Rank (Window Function) | `RANK() OVER` to identify top-paying roles |
| Above-Average Salary Depts | CTE filtering departments above company-wide salary avg |

---

## 🐍 Python EDA (`hr_analytics_EDA.ipynb` / `hr_analytics.py`)

### Key Analyses Performed

**1. Attrition Analysis**
- Attrition rate computed per department and per job role
- Sales Representatives flagged at **39.76% attrition** — highest across all roles
- Human Resources (23.08%) and Lab Technicians (23.94%) also high-risk

**2. Compensation Analysis**
- Average Monthly Income by Job Role → Managers and Research Directors top earners
- Senior employees (JobLevel 4–5) income distribution plotted with KDE
- Department-level salary comparison: Sales leads at ~$6,959/month avg

**3. Diversity & Inclusion**
- Gender distribution across departments (stacked bar charts)
- Seniority breakdown by gender:
  - Fresher: 344M / 199F
  - Mid-level: 438M / 314F
  - Senior: 100M / 75F
- Highlights potential gender representation gap at senior levels

### Libraries Used
```python
pandas | matplotlib | seaborn
```

---

## 📊 Power BI Dashboard (`Hr_Analytic_Dashboard.pbix`)

An interactive dashboard built in Power BI with DAX-driven KPIs:

### KPIs Tracked
- **Overall Attrition Rate** — 16.12%
- **Average Employee Age** — 36.9 years
- **Average Monthly Income** — $6,502
- **Attrition by Department** — Sales vs R&D vs HR
- **OverTime vs Attrition** — side-by-side comparison
- **Job Role Attrition Heatmap**
- **Work-Life Balance Distribution**
- **Gender & Seniority Breakdown**

### DAX Measures Used
```dax
Attrition Rate = 
DIVIDE(
    COUNTROWS(FILTER('hr_analytics', 'hr_analytics'[Attrition] = "Yes")),
    COUNTROWS('hr_analytics')
) * 100

Avg Monthly Income = AVERAGE('hr_analytics'[MonthlyIncome])
```

---

## 📈 Key Insights

### 🔴 Attrition Red Flags
- **Sales Representatives** have the highest attrition at **39.76%** — nearly 2.5× the company average
- Employees working **OverTime** churn at a significantly higher rate
- **Low Work-Life Balance (score = 1)** correlates strongly with attrition

### 💰 Compensation Patterns
- **Sales** department has the highest average salary ($6,959) yet also the highest attrition — suggesting compensation alone isn't retaining talent
- **Lab Technicians** are both low-paid and high-attrition — a critical retention risk

### ♀️ Diversity Signals
- Male-to-female ratio widens from Fresher (1.7:1) to Senior (1.33:1) — the pipeline narrows for women at senior levels
- HR and R&D departments show better gender balance than Sales

---

## 🚀 How to Use

1. **SQL** — Run `HR_SQL.sql` in MySQL Workbench or any SQL client against the `hr_analytics` table
2. **Python** — Open `hr_analytics_EDA.ipynb` in Jupyter or Google Colab; ensure `hr_analytics.csv` is in the same directory
3. **Power BI** — Open `Hr_Analytic_Dashboard.pbix` in Power BI Desktop (free); refresh data source if needed

---

## 🛠️ Tech Stack

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange?logo=mysql)
![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Pandas](https://img.shields.io/badge/Pandas-EDA-green?logo=pandas)
![Seaborn](https://img.shields.io/badge/Seaborn-Visualization-lightblue)

---

## 👤 Author

**Galiboina Harish Kumar**
📧 Data Analyst | Power BI | SQL | Python
🔗 [LinkedIn](https://linkedin.com/in/galiboina-harish-data-analyst) | [GitHub](https://github.com/GaliboinaHarishKumar)

---

> ⭐ If this project helped you, consider starring the repository!

