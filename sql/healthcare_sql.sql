CREATE DATABASE healthcare_db;
USE healthcare_db;
CREATE TABLE claims (
    claim_id  VARCHAR(20) PRIMARY KEY,
    provider_id BIGINT,
    patient_id  BIGINT,
    date_of_service DATETIME,
    billed_amount   INT,
    procedure_code  INT,
    diagnosis_code  VARCHAR(10),
    allowed_amount  INT,
    paid_amount     INT,
    insurance_type  VARCHAR(50),
    claim_status    VARCHAR(50),
    reason_code     VARCHAR(100),
    follow_up_required  VARCHAR(5),
    ar_status  VARCHAR(50),
    outcome    VARCHAR(50),
    year       INT,
    month      INT,
    month_name  VARCHAR(20),
    diag_prefix VARCHAR(5),
    disease_name VARCHAR(100),
    revenue_leakage INT,
    reimbursement_rate DECIMAL(5,2),
    is_denied INT
);
SELECT COUNT(*) AS total_rows 
FROM claims;
SELECT 
    COUNT(*) AS total_claims,
    COUNT(DISTINCT patient_id) AS unique_patients,
    COUNT(DISTINCT provider_id) AS unique_providers,
    SUM(billed_amount) AS total_billed,
    SUM(paid_amount) AS total_paid,
    SUM(revenue_leakage) AS total_leakage,
    ROUND(AVG(reimbursement_rate),2) AS avg_reimbursement_pct
FROM claims;
SELECT outcome,
COUNT(*)  AS claim_count,
ROUND(COUNT(*) * 100.0 / 
(SELECT COUNT(*) FROM claims), 2) AS percentage
FROM claims
GROUP BY outcome
ORDER BY claim_count DESC;
SELECT insurance_type,
COUNT(*) AS total_claims,
SUM(billed_amount) AS total_billed,
SUM(paid_amount) AS total_paid,
ROUND(AVG(reimbursement_rate),2) AS avg_reimbursement_pct
FROM claims
GROUP BY insurance_type
ORDER BY total_billed DESC;
SELECT 
disease_name,
COUNT(*) AS claim_count,
SUM(billed_amount) AS total_billed,
SUM(paid_amount) AS total_paid,
ROUND(AVG(billed_amount),2) AS avg_claim_cost
FROM claims
GROUP BY disease_name
ORDER BY total_billed DESC;
SELECT 
    year,
    month,
    month_name,
    COUNT(*)           AS total_claims,
    SUM(billed_amount) AS monthly_billed,
    SUM(paid_amount)   AS monthly_paid
FROM claims
GROUP BY year, month, month_name
ORDER BY year, month;
SELECT 
    reason_code,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN outcome = 'Denied' 
        THEN 1 ELSE 0 END) AS denied_count
FROM claims
GROUP BY reason_code
ORDER BY denied_count DESC;
SELECT 
    provider_id,
    COUNT(*)           AS total_claims,
    SUM(billed_amount) AS total_billed,
    SUM(is_denied)     AS denied_claims,
    ROUND(SUM(is_denied) * 100.0 / 
    COUNT(*), 2)       AS denial_rate_pct
FROM claims
GROUP BY provider_id
ORDER BY denial_rate_pct DESC
LIMIT 10;
SELECT 
    insurance_type,
    SUM(billed_amount)   AS total_billed,
    SUM(paid_amount)     AS total_paid,
    SUM(revenue_leakage) AS total_leakage,
    ROUND(SUM(revenue_leakage) * 100.0 / 
    SUM(billed_amount), 2) AS leakage_pct
FROM claims
GROUP BY insurance_type
ORDER BY total_leakage DESC;
SELECT 
    claim_id,
    patient_id,
    disease_name,
    billed_amount,
    reason_code,
    insurance_type
FROM claims
WHERE outcome = 'Denied'
ORDER BY billed_amount DESC
LIMIT 20;
SELECT 
    patient_id,
    diagnosis_code,
    billed_amount,
    COUNT(*) AS claim_count
FROM claims
GROUP BY patient_id, diagnosis_code, billed_amount
HAVING claim_count > 1
ORDER BY claim_count DESC;
