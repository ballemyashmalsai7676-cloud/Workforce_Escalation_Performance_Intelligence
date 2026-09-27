USE workforce_analysis;

#1. Total Employees
SELECT COUNT(*) AS total_employees
FROM workforce_escalation_data;

#2. Total Escalations
SELECT
    SUM(escalations) AS total_escalations
FROM workforce_escalation_data;


#3. Total Recurring Escalations
SELECT
    SUM(recurring_escalations) AS total_recurring_escalations
FROM workforce_escalation_data;



#4. Escalations by Department
SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(escalations) AS total_escalations,
    ROUND(AVG(escalations), 2) AS avg_escalations
FROM workforce_escalation_data
GROUP BY department
ORDER BY total_escalations DESC;


#5. Escalations by Reason
SELECT
    escalation_reason,
    COUNT(*) AS employee_count,
    SUM(escalations) AS total_escalations,
    ROUND(AVG(escalations), 2) AS avg_escalations
FROM workforce_escalation_data
GROUP BY escalation_reason
ORDER BY total_escalations DESC;


#6. Employee Escalation Rate by Department
SELECT department, COUNT(*) AS employee_count,
    SUM(CASE
        WHEN escalations > 0 THEN 1
        ELSE 0
    END) AS employees_with_escalations,
    ROUND(
        100.0 * SUM(CASE
            WHEN escalations > 0 THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS escalation_rate_percent
FROM workforce_escalation_data
GROUP BY department
ORDER BY escalation_rate_percent DESC;



#7. Escalations by Severity
SELECT
    severity,
    COUNT(*) AS employee_count,
    SUM(escalations) AS total_escalations,
    ROUND(AVG(escalations), 2) AS avg_escalations
FROM workforce_escalation_data
GROUP BY severity
ORDER BY total_escalations DESC;


#8. Resolution Time and Customer Satisfaction by Department
SELECT
    department,
    COUNT(*) AS employee_count,
    ROUND(AVG(avg_resolution_time), 2) AS avg_resolution_time,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM workforce_escalation_data
GROUP BY department
ORDER BY avg_resolution_time DESC;



#9. Training vs Productivity and Satisfaction
SELECT
    CASE
        WHEN training_hours <= 17.725 THEN 'Low'
        WHEN training_hours <= 33.45 THEN 'Medium'
        ELSE 'High'
    END AS training_group,
    COUNT(*) AS employee_count,
    ROUND(AVG(productivity_score), 2) AS avg_productivity,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM workforce_escalation_data
GROUP BY
    CASE
        WHEN training_hours <= 17.725 THEN 'Low'
        WHEN training_hours <= 33.45 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY avg_productivity DESC;

#10. High-Risk Employees
SELECT
    employee_id,
    employee_name,
    department,
    escalations,
    recurring_escalations,
    avg_resolution_time,
    customer_satisfaction
FROM workforce_escalation_data
WHERE escalations >= 5
  AND recurring_escalations >= 2
ORDER BY escalations DESC;


#11. High-Risk Employees by Department
SELECT
    department,
    COUNT(*) AS high_risk_employees
FROM workforce_escalation_data
WHERE escalations >= 5
  AND recurring_escalations >= 2
GROUP BY department
ORDER BY high_risk_employees DESC;


# 12.High-Risk vs Normal Employees
SELECT
    CASE
        WHEN escalations >= 5 AND recurring_escalations >= 2
        THEN 'High Risk'
        ELSE 'Normal'
    END AS risk_group,
    COUNT(*) AS employee_count,
    ROUND(AVG(overtime_hours), 2) AS avg_overtime_hours,
    ROUND(AVG(avg_resolution_time), 2) AS avg_resolution_time,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM workforce_escalation_data
GROUP BY
    CASE
        WHEN escalations >= 5 AND recurring_escalations >= 2
        THEN 'High Risk'
        ELSE 'Normal'
    END;
    



#13. Department Analysis using CTE
WITH department_metrics AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        SUM(escalations) AS total_escalations,
        AVG(avg_resolution_time) AS avg_resolution_time
    FROM workforce_escalation_data
    GROUP BY department
)
SELECT
    department,
    employee_count,
    total_escalations,
    ROUND(avg_resolution_time, 2) AS avg_resolution_time
FROM department_metrics
ORDER BY total_escalations DESC;


#14. Rank Employees by Escalations Within Each Department
SELECT
    employee_id,
    employee_name,
    department,
    escalations,
    RANK() OVER (
        PARTITION BY department
        ORDER BY escalations DESC
    ) AS escalation_rank
FROM workforce_escalation_data
ORDER BY department, escalation_rank;


#15. High and Critical Escalations by Department
SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(escalations) AS total_escalations,
    ROUND(AVG(escalations), 2) AS avg_escalations
FROM workforce_escalation_data
WHERE severity IN ('High', 'Critical')
GROUP BY department
ORDER BY total_escalations DESC;