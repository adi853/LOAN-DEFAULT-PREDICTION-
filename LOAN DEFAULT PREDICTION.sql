-- 1.Creating Dashboards --
CREATE DATABASE LOAN_DEFAULT_PREDICTION;
USE LOAN_DEFAULT_PREDICTION;
Select*from data;

-- 2.LOAN PURPOSE VS AGE GROUP --
SELECT 
    `LoanPurpose`,
    SUM(`LoanAmount`) AS total_loan_amount,
    CASE
        WHEN `Age` > 25 THEN ' early age '
        WHEN age BETWEEN 25 AND 45 THEN 'mid-age'
        ELSE 'old age'
    END AS age_status
FROM
    data
GROUP BY 3 , 1
ORDER BY total_loan_amount DESC;

-- 3.LOAN PURPOSE VS AVERAGE INTEREST RATE --
SELECT 
    `LoanPurpose`,
    COUNT(LoanID) AS TOTAL_LOAN_ID,
    AVG(InterestRate) AS AVG_INTEREST_RATE,
    SUM(`Default`) AS TOTAL_DEFAULT,
    (SUM(`Default`) * 100 / COUNT(LoanID)) AS DEFAULT_PERCENTAGE
FROM
    DATA
GROUP BY `loanPurpose`
ORDER BY DEFAULT_PERCENTAGE DESC;

-- 4.loan purpose vs default rate --
SELECT 
    `LoanPurpose`,
    COUNT(`LoanID`) AS TOTAL_LOAN_ID,
    SUM(`Default`) AS TOTAL_DEFAULT,
    ROUND(SUM(`Default`) * 100 / COUNT(LoanID), 2) AS DEFAULT_PERCENTAGE
FROM
    DATA
GROUP BY `LoanPurpose`
ORDER BY DEFAULT_PERCENTAGE DESC;

-- 5.AVG DTI RATIO WITH INTEREST AND DEFAULT PERCENTAGE --
SELECT 
    CASE
        WHEN `Age` > 25 THEN ' early age '
        WHEN age BETWEEN 25 AND 45 THEN 'mid-age'
        ELSE 'old age'
    END AS age_status,
    `LoanPurpose`,
    ROUND(AVG(`DTIRatio`), 2) AS average_DTI_Ratio,
    ROUND(AVG(InterestRate), 0) AS AVG_INTEREST_RATE,
    SUM(`Default`) AS TOTAL_DEFAULT,
    ROUND(SUM(`Default`) * 100 / COUNT(LoanID), 2) AS DEFAULT_PERCENTAGE
FROM
    DATA
GROUP BY 1 , 2;




