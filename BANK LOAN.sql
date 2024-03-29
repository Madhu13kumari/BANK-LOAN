USE [Bank Loan DB]
SELECT * FROM bank_loan_DATA

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data

SELECT COUNT(id) as MTD_Total_Loan_aplications from bank_loan_data 
WHERE MONTH(issue_date)= 12 AND YEAR (issue_date) =2021

SELECT COUNT(id) as Total_Loan_aplications from bank_loan_data 
WHERE MONTH(issue_date)= 11

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) =12

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11

SELECT AVG(int_rate) * 100 AS AVG_ADI FROM bank_loan_data

SELECT ROUND(AVG(int_rate),4)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(ISSUE_DATE) = 2021

SELECT ROUND(AVG(int_rate),4)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(ISSUE_DATE) = 2021

SELECT ROUND(AVG(DTI),4)*100 AS AVG_DTI FROM bank_loan_data

SELECT ROUND(AVG(DTI),4)*100 AS MTD_AVG_DTI FROM bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

SELECT ROUND(AVG(DTI),4)*100 AS PMTD_AVG_DTI FROM bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

SELECT 
(COUNT(CASE WHEN LOAN_STATUS = 'Fully paid' or LOAN_STATUS = 'CURRENT' THEN ID END) * 100.0)
/
COUNT(ID) AS Good_loan_percentage
from bank_loan_data


select count(id) as Good_loan_applications from bank_loan_data
where loan_status = 'fully paid' or loan_status = 'current'

select sum(total_payment) as Good_Loan_Amount_Received from bank_loan_data
where loan_status = 'fully paid' or loan_status = 'current'


SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

select count(id) as bad_loan_application from bank_loan_data
where loan_status='charged off'

select sum(loan_amount) as bad_loan_funded_amount from bank_loan_data
where loan_status='charged off'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'


SELECT
        loan_status,
        COUNT(id) AS total_loan_applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS Month_Nunber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) desc

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term


SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY count(id) desc

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY count(id) desc


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY count(id) desc

	SELECT 
		home_ownership AS Home_Ownership, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
	FROM bank_loan_data
	where grade = 'a' and address_state = 'ca'
	GROUP BY home_ownership
	ORDER BY count(id) desc





SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
