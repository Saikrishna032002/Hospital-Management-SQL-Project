# 🏥 Hospital Management & Analytics SQL Project

## 🩺 Project Overview
Healthcare organizations manage vast amounts of patient, appointment, and billing data every day.  
This **Hospital Management SQL Project** is designed to simulate a real-world hospital database and perform **advanced data analysis** using SQL.  

It focuses on improving **data accuracy**, **operational efficiency**, and **decision-making** through well-structured queries and healthcare insights.  
The project covers everything from **data cleaning and transformation** to **complex analytical queries** across multiple relational tables.

---

## 🎯 Objectives
- Design and manage a structured hospital database using SQL.  
- Perform **data cleaning** and ensure consistent date/time formatting.  
- Derive **meaningful insights** about patients, doctors, appointments, billing, and treatments.  
- Analyze **revenue patterns**, **appointment trends**, and **treatment costs**.  
- Demonstrate use of **joins, subqueries, window functions, and aggregations**.

---

## 🗂 Data Model & Structure

The database used in this project is named **`Hospital`**, and consists of five main tables:

| Table Name | Description |
|-------------|-------------|
| **patients** | Contains personal details, insurance information, and date of birth of each patient |
| **doctors** | Holds information about doctors, including specialization, experience, and branch |
| **appointments** | Records appointment details like date, time, status, and doctor-patient mapping |
| **billing** | Stores billing data such as payment method, amount, and billing dates |
| **treatments** | Lists treatment types, costs, and detailed descriptions |

---

## ⚙ Tools & Technologies
- 🗄 **MySQL / SQL Workbench** – Database management and execution  
- 💾 **SQL Language** – Data analysis, cleaning, and reporting  
- 📊 **Data Modeling** – Relationship management and schema design  
- 🧹 **Data Cleaning** – Ensuring date/time consistency and integrity  

---

## 🧹 Data Preparation & Cleaning
Before analysis, the dataset undergoes cleaning and transformation to ensure data consistency.  
Example commands:
```sql
UPDATE appointments
SET appointment_date = STR_TO_DATE(appointment_date, '%Y-%m-%d'),
    appointment_time = STR_TO_DATE(appointment_time, '%H:%i:%s');

UPDATE billing
SET bill_date = STR_TO_DATE(bill_date, '%Y-%m-%d');

UPDATE patients
SET date_of_birth = STR_TO_DATE(date_of_birth, '%Y-%m-%d');
````

These operations ensure all dates and times follow standard MySQL formats.

---

## 📈 Key Analytical Queries & Insights

| #   | Query Title                                                 | Description                                                                                       |
| --- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| 1️⃣ | **Average Age of Pediatric Patients by Insurance Provider** | Calculates the average age of patients visiting pediatric doctors, grouped by insurance provider. |
| 2️⃣ | **Top 3 Busiest Doctors (2023)**                            | Identifies doctors with the highest number of scheduled appointments in 2023.                     |
| 3️⃣ | **Same-Day Follow-Up Appointments**                         | Finds patients who had multiple appointments on the same date.                                    |
| 4️⃣ | **No-Show Appointment Rate**                                | Computes the percentage of appointments where patients did not show up.                           |
| 5️⃣ | **Cumulative Revenue by Payment Method**                    | Tracks cumulative revenue growth over time for each payment method using window functions.        |
| 6️⃣ | **Highest Revenue Month**                                   | Determines the month and year with the maximum total revenue.                                     |
| 7️⃣ | **Treatment Cost Comparison**                               | Compares average costs between “Basic screening” and “Advanced protocol” treatments.              |
| 8️⃣ | **Treatment Cost Range per Type**                           | Calculates the difference between the highest and lowest treatment costs for each treatment type. |
| 9️⃣ | **Patients Born on Weekends**                               | Lists patients whose date of birth falls on a Saturday or Sunday.                                 |
| 🔟  | **Hospital Branch with Highest Experience Range**           | Finds the branch with the widest difference between senior and junior doctors’ experience levels. |

---

## 💡 Example Insights

* Patients with **Pediatric appointments** under certain insurance providers tend to be younger.
* The **Cardiology** department shows a higher rate of *no-shows* compared to others.
* **Revenue increases steadily** with card payments compared to cash.
* **Advanced protocol treatments** are significantly more expensive than basic screenings.
* **Branch A** shows the largest doctor experience gap, indicating staffing diversity.

*(These insights can be customized based on actual database results.)*

---

## 🧠 SQL Concepts Demonstrated

This project covers a wide range of SQL operations and concepts, including:

* `JOIN` (Inner/Implicit)
* `GROUP BY`, `HAVING`, and `ORDER BY`
* `Window Functions` (`OVER PARTITION BY`)
* `DATE` and `TIME` conversion functions
* `Conditional Aggregation` using `CASE WHEN`
* `Subqueries` and correlated subqueries
* `Aggregate Functions` (`AVG`, `SUM`, `COUNT`, `MAX`, `MIN`)

---

## 🚀 How to Use

1. **Download the SQL File**
   Clone or download this repository and open `Project.sql` in your SQL environment.
2. **Create the Database**

   ```sql
   CREATE DATABASE Hospital;
   USE Hospital;
   ```
3. **Import or Create Tables**
   Add the required tables — `patients`, `doctors`, `appointments`, `billing`, and `treatments`.
4. **Run the Queries**
   Execute the script step-by-step to view and analyze results.
5. **Modify and Extend**
   Customize queries or add more analytical logic as per your data.

---

## 🧾 Example Outputs

> *(Replace with actual screenshots or query outputs if available)*

* ![Average Age by Insurance Provider](images/avg_age_insurance.png)
* ![Top Busiest Doctors](images/top_doctors.png)
* ![Cumulative Revenue Trend](images/revenue_trend.png)

---

## 🌐 Use Cases

* Healthcare data management and analytics
* SQL learning and portfolio enhancement
* Business intelligence and performance tracking
* Real-world case study for data analysts and students

---

## 🧠 Learning Outcomes

By completing this project, you will learn how to:

* Clean and prepare healthcare datasets using SQL
* Write analytical queries to derive KPIs
* Use **window functions** for cumulative metrics
* Build **data-driven insights** for hospital management systems
* Apply SQL to real-world domains like healthcare and operations

---

## 👤 Author

**M .SAI KRISHNA REDDY** 
💼 Data Analyst | SQL Developer | Data Enthusiast
📧 mallangisaikrishna20@gmail.com


---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

---

## ⭐ Acknowledgements

* Inspired by real-world healthcare data management systems
* Thanks to the open-source SQL and MySQL communities for learning support
