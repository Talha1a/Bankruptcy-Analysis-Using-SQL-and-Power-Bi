# Bankruptcy Analysis Using SQL and Power BI
![Dashboard](Dashboard%20picture.png)

## Overview

This project aims to analyze the factors contributing to the bankruptcy of restaurants using SQL and Power BI. It involves cleaning, preprocessing, transforming data, and ultimately visualizing the insights to identify patterns, trends, and actionable recommendations.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Tech Stack](#tech-stack)
3. [Data Preparation](#data-preparation)
4. [Steps and Workflow](#steps-and-workflow)
   - [1. Data Cleaning](#1-data-cleaning)
   - [2. Data Preprocessing](#2-data-preprocessing)
   - [3. Data Transformation](#3-data-transformation)
   - [4. Analysis in SQL](#4-analysis-in-sql)
   - [5. Visualization in Power BI](#5-visualization-in-power-bi)
5. [Conclusion](#conclusion)
6. [Future Enhancements](#future-enhancements)
7. [How to Run the Project](#how-to-run-the-project)
  

---

## Introduction

Restaurant businesses often face financial challenges leading to bankruptcy. Understanding the key factors can help business owners make informed decisions. This project leverages SQL for data manipulation and Power BI for data visualization to uncover insights into restaurant bankruptcies.

---

## Tech Stack

- **SQL**: For querying and data manipulation.
- **Power BI**: For creating interactive dashboards and visualizations.
- **Tools**: Power Query, DAX (Data Analysis Expressions).

---

## Data Preparation

The dataset used in this analysis contains details such as:
- Financial metrics (e.g., profit margins, expenses, revenue).
- Operational details (e.g., number of employees, locations).
- External factors (e.g., market trends, competition).

### Dataset Source:
- Available in the repository files and Kaggle(https://www.kaggle.com/datasets/wondermahembe/swedish-restaurant-industry-bankruptcy-dataset)


---

## Steps and Workflow

### 1. Data Cleaning
- Removed duplicates and irrelevant columns.
- Handled missing values using appropriate techniques:
  - **Imputation**: For numerical data, used mean/median.
  - **Categorical data**: Used mode or domain knowledge.
- Standardized column names and data formats.

### 2. Data Preprocessing
- Converted textual data into numerical formats for analysis.
- Created derived columns, such as profitability ratios and expense percentages.
- Ensured data normalization and consistency.

### 3. Data Transformation
- Aggregated data to analyze trends over time.
- Created calculated fields, such as:
  - Monthly revenue growth.
  - Expense-to-revenue ratios.
- Merged datasets to include external factors like market conditions.

### 4. Analysis in SQL
Key SQL operations performed:
- **Joins**: To combine multiple tables (e.g., financial data with external factors).
- **Window Functions**: To calculate running totals and moving averages.
- **Group By**: For trend analysis across time periods and regions.
- **Case Statements**: For creating categorized metrics, such as bankruptcy risk levels.

### 5. Visualization in Power BI
Key Power BI elements:
- **Interactive Dashboards**: Visualizing revenue, expenses, and bankruptcy trends.
- **KPIs**: Highlighting critical metrics like average profit margins and expense ratios.
- **Drill-Down Features**: To explore details by region, time, or type of restaurant.
- **Heatmaps and Charts**: To identify high-risk zones and critical trends.


---

## Conclusion

This analysis provides a data-driven approach to understanding restaurant bankruptcies. By identifying key risk factors and trends, stakeholders can proactively address challenges and optimize operations for better financial health.

---

## Future Enhancements

- Include predictive modeling using machine learning for bankruptcy risk.
- Expand the dataset to incorporate more external variables, such as competitor data.
- Automate the data pipeline from SQL to Power BI for real-time updates.

---

## How to Run the Project

### Prerequisites
- SQL Database Management System (e.g., MySQL, PostgreSQL).
- Power BI Desktop installed on your system.

