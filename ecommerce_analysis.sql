-- TASK 3: SQL for Data Analysis
 use  ecommerce_db;
-- 1.  SELECT and WHERE
SELECT * FROM transactions WHERE Country = 'United Kingdom' LIMIT 10;

-- 2. ORDER BY: Most expensive products
SELECT Description, UnitPrice FROM transactions 
WHERE UnitPrice > 0 
ORDER BY UnitPrice DESC 
LIMIT 10;

-- 3. GROUP BY: Total revenue per country
SELECT Country, ROUND(SUM(Quantity * UnitPrice), 2) AS TotalRevenue
FROM transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- 4. Aggregation: Average order value
SELECT ROUND(AVG(Quantity * UnitPrice), 2) AS AvgOrderValue
FROM transactions;

-- 5. HAVING vs WHERE
SELECT CustomerID, SUM(Quantity * UnitPrice) AS CustomerRevenue
FROM transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING CustomerRevenue > 1000
ORDER BY CustomerRevenue DESC;

-- 6. Subquery: Customers who placed orders above average revenue
SELECT DISTINCT CustomerID
FROM transactions
WHERE CustomerID IS NOT NULL
AND CustomerID IN (
    SELECT CustomerID
    FROM transactions
    GROUP BY CustomerID
    HAVING SUM(Quantity * UnitPrice) > (
        SELECT AVG(Total)
        FROM (
            SELECT SUM(Quantity * UnitPrice) AS Total
            FROM transactions
            GROUP BY CustomerID
        ) AS SubTotals
    )
);

-- 7. View:
CREATE OR REPLACE VIEW customer_summary AS
SELECT CustomerID, Country, SUM(Quantity * UnitPrice) AS TotalSpent
FROM transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country;

-- 8. Optimization suggestion: Create index for faster filtering
CREATE INDEX idx_country ON transactions (Country);
CREATE INDEX idx_customer ON transactions (CustomerID);

-- 9. Join example (Simulated): Let's pretend we have a products table
SELECT t.InvoiceNo, t.Description, p.Category
FROM transactions t
JOIN products p ON t.StockCode = p.StockCode;
