# 📊 Loan Portfolio & Customer Risk Analysis

## Overview

This project analyzes a **loan portfolio and customer financial profile** to understand lending patterns, customer segments, loan characteristics, and default risk.

The project demonstrates an end-to-end **Data Analytics workflow**, starting from dataset loading and data cleaning in SQL Server, followed by SQL-based business analysis and an interactive Power BI dashboard.

The objective is to transform raw loan data into **meaningful business insights that can support data-driven lending and risk-management decisions**.

---

## Dataset

**Dataset:** Loan Portfolio / Customer Risk Dataset

**Records:** 255,347
**Columns:** 18

The dataset contains information related to:

* Customer demographics
* Income
* Employment type
* Education
* Marital status
* Credit score
* Loan amount
* Loan purpose
* Interest rate
* DTI ratio
* Mortgage status
* Dependents
* Co-signer
* Loan default status

---

## 🛠️ Tools & Technologies

* **SQL Server** – Data loading, cleaning & analysis
* **SQL** – Business queries and aggregations
* **Power BI** – Interactive dashboard & visualization
* **Excel** – Initial data validation
* **DAX** – Power BI calculations and KPIs
* **GitHub** – Project documentation & portfolio

---

## 🔄 Project Workflow

### 1. Data Loading

* Imported the raw CSV dataset into **SQL Server**
* Created a dedicated database for the project
* Created the `Loan_data` table
* Loaded approximately **255K loan records**

### 2. Data Cleaning & Validation

Performed data-quality checks including:

* Duplicate record checks
* NULL/missing-value checks
* Data-type validation
* Column validation
* Text/category consistency
* Numeric field validation
* Loan amount and financial-field validation

The dataset was validated before performing business analysis.

### 3. SQL Analysis

Used SQL Server to answer business questions such as:

* What is the total loan portfolio?
* What is the overall default rate?
* What is the average loan amount?
* How are customers distributed by age?
* What are the major income groups?
* How are customers distributed by employment type?
* Which loan purposes have higher loan amounts?
* How does interest rate vary by loan purpose?
* How does default rate vary across customer segments?
* How does credit score relate to default behavior?
* How does DTI ratio relate to default behavior?

SQL techniques used include:

* `GROUP BY`
* `CASE WHEN`
* `CTE`
* Aggregate functions
* `COUNT`
* `SUM`
* `AVG`
* `ROUND`
* Conditional aggregation
* Data segmentation

---

## 📊 Power BI Dashboard

The project includes multiple Power BI analysis pages.

### Portfolio Overview

Key metrics include:

* Total Loans
* Total Loan Amount
* Default Rate
* Average Loan Amount
* Average Interest Rate
* Average Credit Score

Visualizations include:

* Loans by Loan Purpose
* Total Loan Amount by Loan Purpose
* Loans by Employment Type
* Loans by Income Group
* Average Interest Rate by Loan Purpose

### Customer Profile Analysis

This page focuses on understanding the customer base through:

* Total Customers
* Average Income
* Average Age
* Married Customer %
* Customer by Age Group
* Customer by Education
* Customer by Income Group
* Customer by Employment Type

Interactive slicers allow users to analyze the data by:

* Loan Purpose
* Employment Type
* Education
* Marital Status

### Risk Analysis

The risk analysis examines default behavior across important customer and loan characteristics, including:

* Overall Default Rate
* Default Rate by Age Group
* Default Rate by Income Group
* Default Rate by Credit Score
* Default Rate by Employment Type
* Default Rate by Loan Purpose
* Default Rate by DTI Group
* Mortgage / Dependents / Co-signer analysis

---

## 📈 Key Results

The analysis provides a clear view of:

* Overall loan portfolio size and composition
* Customer demographic distribution
* Customer financial characteristics
* Loan-purpose distribution
* Employment and income patterns
* Interest-rate differences across loan categories
* Default patterns across customer segments
* Relationship between credit profile, DTI and loan risk

The Power BI dashboard converts these findings into an **interactive business-reporting experience** that allows users to explore the portfolio using filters and visualizations.

---

## 💡 Business Value

This project demonstrates how data analytics can help lending businesses:

* Monitor portfolio performance
* Identify customer segments
* Understand loan demand
* Analyze credit-risk patterns
* Monitor default behavior
* Support data-driven lending decisions
* Improve customer segmentation and portfolio monitoring

---

## ▶️ How to Run

### SQL Server

1. Install SQL Server and SQL Server Management Studio (SSMS).
2. Create a database named:

```sql
Loan_Risk_Analysis
```

3. Import the dataset into SQL Server.
4. Create/load the `Loan_data` table.
5. Run the SQL analysis queries provided in the project.
6. Review the resulting metrics and business insights.

### Power BI

1. Open the `.pbix` file.
2. Connect/refresh the `Loan_data` source.
3. Refresh the dataset.
4. Navigate through the dashboard pages.
5. Use the available slicers to perform interactive analysis.

---

## 📁 Project Structure

```text
Loan-Portfolio-Customer-Risk-Analysis/
│
├── Dataset/
│   └── Loan_default.csv
│
├── SQL/
│   └── Loan_Risk_Analysis.sql
│
├── PowerBI/
│   └── Loan_Portfolio_Risk_Analysis.pbix
│
├── Dashboard/
│   ├── Portfolio_Overview.png
│   ├── Customer_Profile_Analysis.png
│   └── Risk_Analysis.png
│
├── Report/
│   └── Loan_Portfolio_Analysis_Report.pdf
│
└── README.md
```

---

## 🎯 Skills Demonstrated

**SQL Server | SQL | Data Cleaning | Data Analysis | CTE | CASE Statements | Aggregations | Power BI | DAX | Data Visualization | Business Intelligence | Risk Analysis | Customer Segmentation**

---

## 👩‍💻 Project Type

**End-to-End Data Analytics Portfolio Project**

**Domain:** Banking & Financial Services
**Focus:** Loan Portfolio, Customer Analysis & Credit Risk

> **Note:** The findings in this project are based on the provided dataset and are intended for analytical and portfolio demonstration purposes.
