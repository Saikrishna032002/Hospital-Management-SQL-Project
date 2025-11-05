CREATE database Hospital;
use Hospital;
select * from dailyactivity_merged_cleaned;
set sql_safe_updates =0 ;
UPDATE appointments
SET
  appointment_date = STR_TO_DATE(appointment_date, '%Y-%m-%d'),
  appointment_time = STR_TO_DATE(appointment_time, '%H:%i:%s'); 

SELECT * FROM appointments ;
SELECT * FROM billing;
select * from doctors;
SELECT * FROM patients;
SELECT * FROM treatments;

UPDATE billing
SET
  bill_date = str_to_DATE(bill_date, '%Y-%m-%d');

UPDATE patients
SET
  date_of_birth = str_to_DATE(date_of_birth, '%Y-%m-%d');
  
-- 1.Find the average age of patients who have had an appointment with a doctor whose specialization is 'Pediatrics', and group the results by insurance provider, including only groups with more than 2 patients.
SELECT
  p.insurance_provider,
  AVG(DATEDIFF(CURDATE(), p.date_of_birth) / 365.25) AS avg_age_pediatrics_patients
FROM patients p
JOIN appointments a
  ON p.patient_id = a.patient_id
JOIN doctors d
  ON a.doctor_id = d.doctor_id
WHERE
  d.specialization = 'Pediatrics'
GROUP BY
  p.insurance_provider
HAVING
  COUNT(DISTINCT p.patient_id) > 2;
  
 -- 2Identify the top 3 busiest doctors (by the count of scheduled appointments, status='Scheduled') for the year 2023, including their total appointment count and specialization.
SELECT
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
  d.specialization,
  COUNT(a.appointment_id) AS total_scheduled_appointments
FROM doctors d
JOIN appointments a
  ON d.doctor_id = a.doctor_id
WHERE
  a.status = 'Scheduled' AND YEAR(a.appointment_date) = 2023
GROUP BY
  doctor_name, d.specialization
ORDER BY
  total_scheduled_appointments DESC
LIMIT 3;

-- 3. Find all patients who had same-day follow-up appointments. List the patient full name, doctor full name, and appointment date for patients who had two or more distinct appointments on the same date.
SELECT
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
  a.appointment_date
FROM appointments a
JOIN patients p
  ON a.patient_id = p.patient_id
JOIN doctors d
  ON a.doctor_id = d.doctor_id
WHERE
  (a.patient_id, a.appointment_date) IN (
    SELECT
      patient_id, appointment_date
    FROM appointments
    GROUP BY
      patient_id, appointment_date
    HAVING
      COUNT(*) >= 2
  )
ORDER BY
  a.appointment_date, patient_name;

-- 4. Determine the percentage of appointments that were a 'No-show' compared to the total number of appointments
SELECT
  (SUM(CASE WHEN status = 'No-show' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_no_show
FROM appointments;

-- 5. Calculate the cumulative sum of revenue (amount in billing) over time, partitioned by payment_method.
SELECT
  bill_date,
  payment_method,
  amount,
  SUM(amount) OVER (PARTITION BY payment_method ORDER BY bill_date) AS cumulative_revenue
FROM billing
ORDER BY
  payment_method, bill_date;
  
  -- 6. List the month and year with the highest total revenue, and the corresponding revenue amount.
  
  SELECT
  YEAR(bill_date) AS bill_year,
  MONTH(bill_date) AS bill_month,
  SUM(amount) AS monthly_revenue
FROM billing
GROUP BY
  bill_year, bill_month
ORDER BY
  monthly_revenue DESC
LIMIT 1;

-- 7 . Determine the average cost of treatments that have a 'Basic screening' description, compared to those with an 'Advanced protocol' description.
SELECT
  description,
  AVG(cost) AS average_cost
FROM treatments
WHERE
  description IN ('Basic screening', 'Advanced protocol')
GROUP BY
  description;
  
  -- 8. Find the absolute difference (ABS) between the maximum and minimum treatment cost for each treatment_type
  SELECT
  treatment_type,
  MAX(cost) AS max_cost,
  MIN(cost) AS min_cost,
  ABS(MAX(cost) - MIN(cost)) AS cost_range
FROM treatments
GROUP BY
  treatment_type
ORDER BY
  cost_range DESC;
  
  -- 9. List patients whose date of birth falls in a weekend (Saturday or Sunday).
  SELECT
  CONCAT(first_name, ' ', last_name) AS patient_name,
  date_of_birth
FROM patients
WHERE
  DAYOFWEEK(date_of_birth) IN (1, 7)
ORDER BY
  date_of_birth;
  
  -- 10 . Find the hospital_branch where the maximum difference between the highest and lowest doctor's years_experience is greatest.
  SELECT
  hospital_branch,
  MAX(years_experience) AS max_experience,
  MIN(years_experience) AS min_experience,
  (MAX(years_experience) - MIN(years_experience)) AS experience_range
FROM doctors
GROUP BY
  hospital_branch
ORDER BY
  experience_range DESC
LIMIT 1;