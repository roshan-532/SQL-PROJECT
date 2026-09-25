DROP TABLE IF EXISTS HOSPITAL;
CREATE TABLE hospital (
	Hospital_name VARCHAR(100),
	Location VARCHAR(100),
	Department VARCHAR(100),
	Doctor_count INT,
	Patients_count INT,
	Admission_date DATE,
	Discharge_date DATE,
	Medical_expenses NUMERIC(10, 2)
);

SELECT * FROM Hospital;

-- 1) Find the total number of patients across all hospitals.

SELECT SUM(patients_count) AS total_patients
FROM Hospital;

-- 2) Retrieve the average count of doctors available in each hospitals.

SELECT AVG(doctor_count) AS avg_doctor
FROM Hospital;

-- 3) Find the top 3 hospital departments that have the highest number of patients.

SELECT * FROM Hospital
ORDER BY patients_count
DESC LIMIT 3;

-- 4) Identify the hospital that recorded the highest medical expenses.

SELECT * FROM Hospital
ORDER BY medical_expenses
DESC LIMIT 1;

-- 5) Calculate the average medical expenses per day for each hospital.

SELECT Hospital_name, AVG(medical_expenses) AS avg_medical_expenses
FROM Hospital
GROUP BY hospital_name;

-- 6) Find the patient with the longest stay by calculating the difference between discharge date and admission date.

SELECT Discharge_date - Admission_date AS longest_stay
FROM hospital
ORDER BY longest_stay
DESC LIMIT 1;

-- 7) Count the total number of patients treated in each city.

SELECT DISTINCT location, COUNT(patients_count) AS total_patients
FROM Hospital
GROUP BY Location
ORDER BY Total_patients DESC;

-- 8) Calculate the average number of days patients spend in each department.

SELECT DISTINCT department, AVG(discharge_date - admission_date) AS avg_spend_day
FROM Hospital
GROUP BY department
ORDER BY avg_spend_day DESC;

-- 9) Find the department with the least number of patients.
SELECT * FROM Hospital;

SELECT DISTINCT department, COUNT(patients_count) AS least_patients
FROM Hospital
GROUP BY department
ORDER BY least_patients ASC;

-- 10) Group the data by month and calculate the medical expenses for each month.

SELECT EXTRACT(MONTH FROM admission_date) AS group_month,
	SUM(medical_expenses) AS total_medical_expenses
FROM Hospital
GROUP BY EXTRACT(MONTH FROM admission_date)
ORDER BY group_month;
