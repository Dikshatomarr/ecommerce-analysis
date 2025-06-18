## Executive Summary

**Business Problem**: The e-commerce firm was offering heavy discounts without clarity on whether they improved profits or customer retention.

**Approach**: Performed data cleaning (Excel), SQL-based analysis, and Power BI visualization on 15K+ transactions covering demographics, product categories, and discount types.

**Key Impact**:
- Identified 3 discount campaigns causing financial loss
- Pinpointed 25–44 age group as high-value customers
- Suggested strategy to improve profit margins during low seasons (Feb, Jul)

## Tech Stack

| Tool       | Purpose                             |
|------------|-------------------------------------|
| Excel      | Data cleaning and transformation    |
| SQL Server | Exploratory data analysis (EDA)     |
| Power BI   | Interactive dashboard development   |


## Business Case

An e-commerce company seeks to better understand customer purchasing behavior across demographics, regions, and product categories to improve revenue and profitability. The marketing team aims to evaluate:

- Which discount campaigns are most effective in driving revenue?
- How customer behavior varies by age group, gender, and city?
- Which product categories contribute the most to overall revenue?

## Objective

- Analyze customer purchase patterns across different demographic segments and regions
- Measure the effectiveness of discount strategies on revenue and profitability
- Identify high-value customer segments to enable personalized targeting
- Provide data-driven recommendations for optimizing discounts and marketing strategies

## Dataset Overview

The dataset contains anonymized transaction-level sales data.

**Key Columns:**

| Column                | Description                                               |
|------------------------|-----------------------------------------------------------|
| CID                 | Customer ID                                               |
| TID                 | Transaction ID                                            |
| Gender              | Customer gender                                           |
| Age_Group           | Age category of customer                                  |
| Purchase_Date       | Date of transaction                                       |
| Purchase_Month / Year | Extracted from Purchase_Date                          |
| Product_Category    | Category of purchased product                             |
| Discount_Availed    | 1 if discount used, 0 if not                              |
| Discount_Name       | Type of discount used (e.g., Flash Sale, Diwali Offer)    |
| Discount_Amount_INR | Discount value applied                                    |
| Gross_Amount        | Price before discount                                     |
| Net_Amount          | Final billed amount after discount                        |
| Profit_Impact       | Profit margin impact from transaction                     |
| Purchase_Method     | Channel used (Online, Offline, Call Center, etc.)         |
| Location            | Customer location                                         |

## Process Summary

### 1. Excel – Data Cleaning

- Verified column formats and ensured correct data types for date, numeric, and categorical fields
- Handled blanks and missing values for Gender, Location, and Age_Group
- Created derived columns like Purchase_Year/Month for time-series analysis

### 2. SQL – Exploratory Data Analysis (EDA)

Performed extensive SQL queries to derive:

**Key Metrics:**
- Total Transactions: 15,000+
- Unique Customers: ~9,000
- Net Revenue Range: ₹100M+ over one year

**Demographic Insights:**
- Age group 25–34 and 35–44 showed highest spending
- Gender split was balanced with a slight revenue skew toward female customers
- Delhi, Bangalore, and Mumbai were top-performing cities by revenue

**Product Category Insights:**
- Electronics and Clothing were the top two revenue-generating categories
- Home Decor had low volume but higher profit margins

**Discount Analysis:**
- Discounts used in over 60% of transactions
- Higher discounts did not always correlate with higher profits
- Campaigns like "Flash Sale" showed reduced profitability

**Purchase Channel Performance:**
- Online contributed the majority of revenue
- Offline purchases showed slightly higher average profit per order

**Seasonality:**
- Peak months: November and December (year-end surge)
- Slow months: February and July
- Q4 contributed over 35% of annual revenue

**Data Quality Checks:**
- Identified transactions with unusually high Net Amounts as potential outliers
- Detected negative values in Net Amount and Profit Impact in several transactions
  - Root cause: Discount amounts were greater than the Gross Amount
  - This indicates potentially misconfigured or excessive discounting logic
- Recommendation: Review discount strategy and pricing rules to prevent transactions resulting in financial loss


### 3. Power BI – Dashboard Creation

Created an interactive dashboard featuring:

**Visuals:**
- KPI Cards for Total Revenue, Unique Customers, Transactions, Avg. Profit
- Line Chart for Monthly Revenue Trends
- Bar Chart for Product Category Performance
- Stacked Column for Discounted vs Non-discounted Revenue
- Pie Chart for Purchase Channel Share
- Map showing Revenue by Region
- Matrix comparing Discount Name vs Profitability by Category


## Key Insights

| Area               | Finding |
|--------------------|---------|
| Product Strategy   | Electronics had highest revenue but lower profit margins; Home Decor had better profit margins but lower volume |
| Discount Strategy  | Not all discounts contributed positively to profit; some high-usage discounts hurt profitability |
| Customer Segments  | Age group 25–44 generated the most revenue; marketing can be targeted toward this segment |
| Regional Sales     | Delhi, Mumbai, and Bangalore dominated revenue; smaller cities had higher profit per transaction |
| Channel Mix        | Online had highest volume; offline showed higher per-order profit |
| Seasonality        | Q4 (Oct–Dec) had the strongest sales; February had the lowest |

## Business Recommendations

- Refine discount strategy by identifying and eliminating high-cost/low-return campaigns
- Focus marketing on high-value age segments (25–44) and top-performing regions
- Upsell or bundle high-margin products like Home Decor with Electronics
- Boost campaigns during slow months (February, July) to stabilize revenue
- Enhance offline channel with personalized promotions, given higher average profit


## Dashboard Preview

![image](https://github.com/user-attachments/assets/8878370e-e151-4d4d-b8da-95b7647b4180)
![image](https://github.com/user-attachments/assets/bbaf9f4a-0e8c-4990-9598-29beb65a288a)


https://github.com/user-attachments/assets/a26386cf-300f-489e-92d9-dc96bacd5742



https://github.com/user-attachments/assets/4324e72e-42fa-4841-b71d-e4590ff7adb0



## 📈 Business Impact (What This Analysis Enables)

- Prevented profit leakage by flagging 3 unprofitable discount campaigns
- Identified high-value customer segments (25–44 yrs in Tier 1 cities) for marketing focus
- Revealed seasonal demand trends for better inventory planning
- Recommended bundling strategies to lift profit margins in low-volume categories


