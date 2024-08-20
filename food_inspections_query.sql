/*********************************************** 
** File: food_inspections_query.sql
** Desc: Final Project
** Author: Linda Fung
** Date: 4/28/2024
************************************************/

USE Food_Inspections;

-- What are the overall average risk, overall passing and failing rates? 
-- 84.07, 68.06%, 19.72%
SELECT
	AVG(CASE
		WHEN risk_id = 1 THEN 100
		WHEN risk_id = 2 THEN 50
		WHEN risk_id = 3 THEN 0
	END) AS avg_risk,
	AVG(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) * 100
	AS avg_pass_rate,
	AVG(CASE WHEN inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) * 100
	AS avg_fail_rate
FROM
	inspection;

-- Are higher risk restaurants more prone to failing? 
-- Is there a correlation between risk and fail rate?
SELECT
    r.risk,
    COUNT(*) AS total_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) AS failed_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS failure_rate
FROM
    risk r
JOIN
    inspection i ON r.risk_id = i.risk_id
GROUP BY risk;

-- Are certain facility types more prone to failing? Let's look at facility 
	-- types with a decent amount of inspections (200+).
-- Also, how high is their respective risk?
SELECT
    f.facility_type,
    COUNT(*) AS total_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) AS failed_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS failure_rate,
	AVG(CASE
		WHEN r.risk_id = 1 THEN 100
		WHEN r.risk_id = 2 THEN 50
		WHEN r.risk_id = 3 THEN 0
	END) AS risk_scale
FROM
    facility f
JOIN
	inspection i
    ON f.facility_id = i.facility_id
JOIN
	risk r
	ON i.risk_id = r.risk_id
GROUP BY facility_type
HAVING total_inspections >= 200
ORDER BY failure_rate DESC;

-- Are certain zip codes more prone to failing? Let's look at facility types with 
	-- a decent amount of inspections (200+).
-- Also, how high is their respective risk?
SELECT
    a.zip,
    COUNT(*) AS total_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) AS failed_inspections,
    SUM(CASE WHEN i.inspection_results = 'FAIL' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS failure_rate,
	AVG(CASE
		WHEN r.risk_id = 1 THEN 100
		WHEN r.risk_id = 2 THEN 50
		WHEN r.risk_id = 3 THEN 0
	END) AS risk_scale
FROM
    address a
JOIN
    inspection i 
    ON a.address_id = i.address_id
JOIN
	risk r
    ON i.risk_id = r.risk_id
GROUP BY zip
HAVING total_inspections >= 200
ORDER BY failure_rate DESC;

-- Are there any trends in the amount of inspections over the years?
-- How about the pass rates?
SELECT 
	YEAR(inspection_date) AS inspection_year, 
    COUNT(*) AS total_inspections,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) AS pass_count,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS pass_rate
FROM 
	inspection
WHERE YEAR(inspection_date) < 2024
GROUP BY inspection_year
ORDER BY inspection_year;

-- Which days of the week are busiest for inspections?
-- Also, what are their pass rates?
SELECT 
	DAYNAME(inspection_date) AS day_of_week, 
    COUNT(*) AS total_inspections,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) AS pass_count,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS pass_rate
FROM 
	inspection
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 
	'Monday', 'Tuesday', 'Wednesday', 'Thursday', 
	'Friday', 'Saturday', 'Sunday');

-- What are the number of businesses with violations by facility type and their passing rate?
SELECT 
	f.facility_type, 
    COUNT(*) AS count_with_violations,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS pass_rate    
FROM 
	facility f
JOIN 
	inspection i
	ON f.facility_id = i.facility_id
WHERE i.inspection_violations = "YES"
GROUP BY facility_type
ORDER BY count_with_violations DESC;

-- Which zip codes had the most violations?
SELECT 
	a.zip, 
    COUNT(*) AS count_with_violations,
    SUM(CASE WHEN inspection_results LIKE 'PASS%' 
		THEN 1 ELSE 0 END) / COUNT(*) * 100 AS pass_rate    
FROM 
	address a
JOIN 
	inspection i
	ON a.address_id = i.address_id
WHERE inspection_violations = "YES"
GROUP BY a.zip
ORDER BY count_with_violations DESC;

