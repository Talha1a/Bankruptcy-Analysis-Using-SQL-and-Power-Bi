 CREATE TABLE Company_dataa (
    Org_ID BIGSERIAL PRIMARY KEY,               -- Unique identifier for each organization
    Year INT NOT NULL,                       -- Year of the financial data
    ZipCode VARCHAR(10),                     -- Zip Code of the company location
    Municipality VARCHAR(100),               -- Municipality of the company
    Bankrupt BOOLEAN NOT NULL,               -- Bankruptcy status: True or False
    Business_Category VARCHAR(100),          -- Business category or industry type
    Financial_Income NUMERIC(15, 2),         -- Financial income in currency format
    Financial_Expenses NUMERIC(15, 2),       -- Financial expenses in currency format
    NetProfit NUMERIC(15, 2),                -- Net profit in currency format
    Total_Current_Assets NUMERIC(15, 2),     -- Total current assets
    Total_Assets NUMERIC(15, 2),             -- Total assets
    Total_Equity NUMERIC(15, 2),             -- Total equity
    Curr_Liabilities NUMERIC(15, 2),         -- Current liabilities
    Total_Curr_Liabilities NUMERIC(15, 2),   -- Total current liabilities
    Non_Curr_Liabilities NUMERIC(15, 2),     -- Non-current liabilities
    Net_Sales NUMERIC(15, 2),                -- Net sales
    ROA NUMERIC(10, 4),                      -- Return on Assets (percentage or ratio)
    Debt_to_Equity NUMERIC(10, 4),           -- Debt-to-Equity ratio
    Equity_to_Assets NUMERIC(10, 4),         -- Equity-to-Assets ratio
    ROE NUMERIC(10, 4),                      -- Return on Equity (percentage or ratio)
    WC_to_Sales NUMERIC(10, 4),              -- Working Capital to Sales ratio
    Quick_ratio NUMERIC(10, 4),              -- Quick ratio (liquidity)
    Operating_Margin NUMERIC(10, 4),         -- Operating margin (percentage or ratio)
    Net_Margin NUMERIC(10, 4),               -- Net margin (percentage or ratio)
    Profit_Margin NUMERIC(10, 4)             -- Profit margin (percentage or ratio)
);

COPY Company_Dataa (
    Org_ID, Year, ZipCode, Municipality, Bankrupt, Business_Category, Financial_Income, 
    Financial_Expenses, NetProfit, Total_Current_Assets, Total_Assets, Total_Equity, 
    Curr_Liabilities, Total_Curr_Liabilities, Non_Curr_Liabilities, Net_Sales, ROA, 
    Debt_to_Equity, Equity_to_Assets, ROE, WC_to_Sales, Quick_ratio, Operating_Margin, 
    Net_Margin, Profit_Margin
)
FROM 'D:\OneDrive - University of Engineering and Technology Taxila\Desktop\Bankruptcy Project\Swedish restaurants bankruptcy data.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Company_Dataa;


SELECT ORG_ID, YEAR , ROA , ROE , DEBT_TO_EQUITY,QUICK_RATIO
FROM Company_Dataa 
WHERE BANKRUPT = 'yes';


SELECT COUNT (BANKRUPT),YEAR
FROM Company_Dataa 
WHERE BANKRUPT = 'yes'
GROUP BY YEAR;

SELECT 
    Municipality,
    COUNT(CASE WHEN Bankrupt = 'Yes' THEN 1 END) AS Bankrupt_Companies,
    COUNT(*) AS Total_Companies,
    ROUND(COUNT(CASE WHEN Bankrupt = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Bankruptcy_Rate
FROM 
    Company_Dataa
GROUP BY 
    Municipality
ORDER BY 
    Bankruptcy_Rate DESC;

SELECT 
    Bankrupt,
    AVG(Debt_to_Equity) AS Avg_Debt_to_Equity,
    AVG(Quick_Ratio) AS Avg_Quick_Ratio,
    AVG(Operating_Margin) AS Avg_Operating_Margin,
    AVG(NetProfit) AS Avg_Net_Profit
FROM 
    Company_Dataa
GROUP BY 
    Bankrupt;

SELECT 
    Business_Category,
    Municipality,
    ROUND(AVG(CASE WHEN Bankrupt = 'Yes' THEN Debt_to_Equity END), 2) AS Avg_Debt_to_Equity_Bankrupt,
    ROUND(AVG(CASE WHEN Bankrupt = 'Yes' THEN ROA END), 2) AS Avg_ROA_Bankrupt,
    COUNT(CASE WHEN Bankrupt = 'Yes' THEN 1 END) AS Bankrupt_Companies,
    COUNT(*) AS Total_Companies,
    ROUND(COUNT(CASE WHEN Bankrupt = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Bankruptcy_Rate
FROM 
    Company_Dataa
GROUP BY 
    Business_Category, Municipality
HAVING 
    COUNT(*) > 10 -- Filter out categories with less than 10 companies for significance
ORDER BY 
    Bankruptcy_Rate DESC, Avg_Debt_to_Equity_Bankrupt DESC;
