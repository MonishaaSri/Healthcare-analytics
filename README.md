# Healthcare Claims Analytics Dashboard

## 🏥 Business Problem
How can a healthcare payer reduce claim 
costs while identifying patients who need 
proactive support?

## 📊 Dataset
- Source: Alex The Analyst GitHub
- File: claims_data.csv
- Records: 1,000 patient claims
- Period: May 2024 – September 2024
- Columns: 15 original + 8 engineered

## 🛠️ Tools Used
- Python (pandas, numpy, matplotlib)
  → Data cleaning and EDA
- MySQL
  → Data storage and SQL analysis
- Power BI
  → Interactive dashboard

## 📁 Project Structure
healthcare-analytics/
├── notebooks/
│   ├── 01_cleaning.ipynb
│   └── claims_clean.csv
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_table.sql
│   └── 03_analysis.sql
├── screenshots/
│   └── dashboard.png
└── README.md

## 🔍 Key Findings
1. Average reimbursement rate is only
   67.56% — below industry target of 80%
2. Total revenue leakage of $96,437
   across 1000 claims
3. Tuberculosis related diseases account
   for 28.9% of all claims
4. Self-Pay patients have highest
   revenue leakage
5. Authorization not obtained is the
   top denial reason

## 💡 Recommendations
1. Implement pre-authorization checks
   to reduce claim denials
2. Focus on Tuberculosis patient care
   coordination to reduce costs
3. Create Self-Pay payment plans
   to improve revenue collection
## Dashboard 

## ⚙️ Setup Instructions
1. Clone this repository
2. Install Python libraries:
   pip install pandas numpy matplotlib
3. Run notebooks/01_cleaning.ipynb
4. Import claims_clean.csv into MySQL
5. Run SQL scripts in order
6. Open Power BI and connect to MySQL
