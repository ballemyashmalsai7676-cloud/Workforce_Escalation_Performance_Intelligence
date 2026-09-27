# Workforce Escalation & Performance Intelligence System

## Project Overview

The Workforce Escalation & Performance Intelligence System is an end-to-end data analytics project designed to analyze employee escalations, recurring issues, workforce performance, resolution time, customer satisfaction, and employee risk patterns.

The project combines SQL, Python, Excel, and Power BI to transform workforce data into actionable business insights and management dashboards.

> **Dataset Note:** This project uses a synthetic dataset created for portfolio and learning purposes. It does not represent real company or employee data.

## Business Problem

Organizations may face recurring customer escalations, delayed issue resolution, employee workload challenges, and declining customer satisfaction.

The objective of this project is to analyze these patterns and identify areas that may require management attention.

## Objectives

- Analyze employee escalation patterns
- Identify departments with higher escalation activity
- Analyze escalation reasons and severity
- Identify recurring escalation patterns
- Compare high-risk and normal employees
- Analyze training and productivity patterns
- Analyze resolution time and customer satisfaction
- Build an employee early-warning screening approach
- Create an interactive Power BI dashboard


## Dataset

The dataset contains 2,000 simulated employee records with information related to:

- Employee and department details
- Experience and salary
- Work mode and working hours
- Attendance and productivity
- Customer interactions
- Escalations and recurring escalations
- Escalation reasons and severity
- Resolution time
- Customer satisfaction
- Training and overtime
- Performance rating
- Attrition risk

## Tools & Technologies

- **SQL (MySQL)** — Data querying and business analysis
- **Python** — Data cleaning, analysis, visualization, and insights
- **Pandas & NumPy** — Data manipulation and analysis
- **Matplotlib & Seaborn** — Data visualization
- **Excel** — KPI analysis and PivotTables
- **Power BI** — Interactive dashboard and business reporting
- **Jupyter Notebook** — Python analysis environment

## SQL Analysis

MySQL was used to perform business-focused analysis on the workforce dataset.

Key SQL analyses included:

- Total employees and escalation counts
- Total recurring escalations
- Escalations by department
- Escalations by escalation reason
- Employee escalation rate by department
- Escalations by severity
- Resolution time and customer satisfaction by department
- Training vs productivity and customer satisfaction
- Identification of high-risk employees
- High-risk employees by department
- High-risk vs normal employee comparison
- Department analysis using CTEs
- Employee ranking using SQL window functions
- High and Critical severity analysis by department

### Advanced SQL Concepts Used

- `GROUP BY`
- Aggregate functions
- `CASE`
- `WHERE`
- `ORDER BY`
- Common Table Expressions (CTEs)
- Window functions
- `RANK()`
- `PARTITION BY`

## Python Analysis

Python was used to perform data cleaning, exploratory analysis, correlation analysis, and employee risk analysis.

### Key Analysis

- Loaded and inspected the workforce dataset
- Checked data types, missing values, and duplicates
- Analyzed escalations by department
- Analyzed escalation reasons and severity
- Studied relationships between workload and escalations
- Analyzed training and productivity
- Analyzed resolution time and customer satisfaction
- Created correlation analysis and visualizations
- Identified high-risk employees using a project-defined screening rule
- Compared high-risk and normal employee groups
- Generated executive-level KPI summaries

### High-Risk Employee Screening

For this portfolio project, an employee was classified as high-risk when:

- Escalations >= 5
- Recurring escalations >= 2

This is a project-defined screening rule and is not a validated industry standard.

## Excel Analysis

Excel was used to create a management-oriented analysis layer and KPI summary.

### Excel Work Completed

- Converted the dataset into an Excel Table
- Created KPI calculations
- Calculated employee escalation rate
- Calculated recurring escalation rate
- Created a high-risk employee flag
- Created training groups
- Built PivotTables for:
  - Department analysis
  - Escalation reason analysis
  - High-risk employee analysis
  - Training analysis
  - High/Critical severity analysis
  - Resolution time analysis

### Key KPIs

| KPI | Value |
|---|---:|
| Total Employees | 2,000 |
| Total Escalations | 4,356 |
| Total Recurring Escalations | 1,936 |
| Employee Escalation Rate | 70.10% |
| Recurring Escalation Rate | 47.15% |
| Average Resolution Time | 12.33 |
| Average Customer Satisfaction | 4.25 |
| High-Risk Employees | 250 |
| High-Risk Employee Rate | 12.50% |


## Power BI Dashboard

An interactive Power BI dashboard was created to provide a management-level view of workforce escalations and performance.

### Dashboard KPIs

- Total Employees
- Total Escalations
- Recurring Escalations
- High-Risk Employees
- Employee Escalation Rate
- Average Customer Satisfaction
- Average Resolution Time
- Recurring Escalation Rate

### Dashboard Visuals

- Escalations by Department
- Escalations by Reason
- High-Risk Employees by Department
- Escalation Severity Distribution
- Training vs Productivity
- High-Risk Employees by Training Group

The dashboard allows managers to identify escalation patterns, departments requiring attention, and employee groups that may benefit from additional support or intervention.

## Key Findings

The analysis of the simulated workforce dataset produced the following observations:

- 70.10% of employees had at least one escalation.
- 47.15% of employees had at least one recurring escalation.
- Customer Support had the highest total escalation volume.
- Finance had the highest average escalations per employee and the highest employee escalation rate.
- Customer Complaint was the most frequent escalation reason.
- Delayed Resolution had one of the highest average escalation levels.
- High and Critical severity cases were concentrated across several departments, with Sales having the highest total escalation volume within this subset.
- High-risk employees represented 12.50% of the workforce using the project-defined screening rule.
- High-risk employees showed higher average overtime and substantially higher average resolution time than the normal-risk group in this simulated dataset.
- Higher training levels were associated with higher average productivity and customer satisfaction in the simulated data.
- Resolution time showed a strong negative association with customer satisfaction in the correlation analysis.

> These findings describe patterns within the simulated dataset and should not be interpreted as evidence of causation or as conclusions about a real organization.


## Business Recommendations

Based on the patterns identified in the simulated dataset, the following actions could be considered:

1. **Monitor recurring escalations**
   - Create regular reviews for employees with repeated escalations.
   - Investigate whether the same issues are occurring repeatedly.

2. **Focus on resolution time**
   - Analyze the causes of prolonged resolution times.
   - Review processes that contribute to delayed issue resolution.

3. **Strengthen employee training**
   - Provide targeted training where productivity or customer satisfaction metrics indicate a potential need.
   - Track training outcomes over time.

4. **Monitor workload and overtime**
   - Review employees or teams with consistently high overtime.
   - Evaluate whether workload distribution can be improved.

5. **Use early-warning monitoring**
   - Track escalation and recurring-escalation patterns regularly.
   - Use the high-risk screening rule as a starting point for further investigation rather than as a final employee assessment.

6. **Improve departmental monitoring**
   - Compare departments using escalation volume, escalation rate, resolution time, and customer satisfaction together rather than relying on a single KPI.

   ## Project Structure

```
Workforce_Escalation_Performance_Intelligence/
│
├── data/
│   └── workforce_escalation_data.csv
│
├── sql/
│   └── workforce_analysis.sql
│
├── python/
│   └── workforce_analysis.ipynb
│
├── powerbi/
│   └── Workforce_Escalation_Performance_Intelligence.pbix
│
├── excel/
│   └── workforce_analysis.xlsx
│
├── images/
│
└── README.md