SELECT * --Retorna todas as colunas de uma tabela 
FROM AdventureWorksDW2022.dbo.FactInternetSales;

SELECT OrderDate, SalesTerritoryKey, CustomerKey, ProductKey, OrderQuantity, UnitPrice, SalesAmount, DueDate,ShipDate
FROM AdventureWorksDW2022.dbo.FactInternetSales;

SELECT OrderDate, SalesTerritoryKey, CustomerKey, ProductKey, OrderQuantity, UnitPrice, SalesAmount, DueDate,ShipDate
FROM AdventureWorksDW2022.dbo.FactInternetSales
--WHERE SalesTerritoryKey = 6 OR SalesTerritoryKey = 7
--WHERE UnitPrice < 3000
--WHERE UnitPrice > 0  AND UnitPrice < 1000
WHERE UnitPrice > 0  AND UnitPrice < 1000 AND SalesTerritoryKey = 6;

SELECT *
FROM FactInternetSales
WHERE UnitPrice BETWEEN 100 AND 300;

SELECT *
FROM DimEmployee
where Hiredate BETWEEN '2011/01/01' and '2012/12/31';

SELECT *
FROM FactInternetSales
--WHERE SalesTerritoryKey = 6 OR SalesTerritoryKey = 7 or SalesTerritoryKey = 5
WHERE SalesTerritoryKey in (6,7,5);
--WHERE SalesTerritoryKey NOT IN (6,7,5)

SELECT DISTINCT SalesTerritoryKey
FROM FactInternetSales;

SELECT DISTINCT CustomerKey
FROM FactInternetSales;

SELECT * 
FROM DimEmployee
WHERE FirstName LIKE 'Jo%';

SELECT * 
FROM DimEmployee
WHERE FirstName LIKE '%EY';

SELECT *
FROM DimEmployee
WHERE LastName  LIKE '%RT%';

SELECT * 
FROM DimEmployee
WHERE FirstName LIKE ' J__';

SELECT ProductKey, CustomerKey, SalesOrderNumber, OrderQuantity, SalesAmount, OrderDate
FROM FactInternetSales
ORDER BY OrderDate DESC,  SalesAmount DESC;

SELECT TOP 20 ProductKey, CustomerKey, SalesOrderNumber, OrderQuantity, SalesAmount, OrderDate
FROM FactInternetSales
ORDER BY SalesAmount DESC;

SELECT TOP 10 *
FROM FactInternetSales;

SELECT COUNT (*)
FROM FactInternetSales;

SELECT COUNT (SalesOrderNumber)
FROM FactInternetSales;

SELECT COUNT (Distinct (SalesOrderNumber)) AS "Pedidos entre 100 e 300"
FROM FactInternetSales
WHERE UnitPrice BETWEEN 100 and 300;

SELECT SUM (SalesAmount) AS "Soma Total"
FROM FactInternetSales;

SELECT AVG (SalesAmount) AS "Média"
FROM FactInternetSales;

SELECT MIN (SalesAmount) AS "Mínimo" , MAX (SalesAmount) AS "Máximo"
FROM FactInternetSales;

SELECT SalesTerritoryKey , SUM (SalesAmount) as "Total Vendas"
FROM FactInternetSales
GROUP BY SalesTerritoryKey;

SELECT ProductKey , AVG (SalesAmount) AS "Média"
FROM FactInternetSales
GROUP BY ProductKey
ORDER BY AVG (SalesAmount) DESC;

SELECT ProductKey , AVG (SalesAmount) AS "Média"
FROM FactInternetSales
GROUP BY ProductKey
HAVING AVG (SalesAmount) >3500;

SELECT SalesTerritoryKey, SUM (OrderQuantity) AS "QTD Vendida"
FROM SalesTerritoryKey
GROUP BY SalesTerritoryKey
HAVING SUM (OrderQuantity) BETWEEN 8000 and 15000;


SELECT 
EnglishProductName, 
P.ProductSubcategoryKey, 
S.ProductSubcategoryKey, 
S.EnglishProductName
FROM Dimproduct P
INNER JOIN DimproductSubcategory S ON S.ProductSubcategoryKey = P.ProductSubcategoryKey;

SELECT SalesTerritoryRegion, SalesTerritoryCountry, SUM (OrderQuantity) as "Quantidade"
FROM FactInternetSales S
INNER JOIN DimSalesterritory T ON T.SalesTerritoryKey = S.SalesTerritoryKey
GROUP BY SalesTerritoryKey, SalesTerritoryRegion, SalesTerritoryCountry

CREATE VIEW MinhaQuery AS
SELECT 
SalesOrderNumber, 
SalesTerritoryKey,
ProductKey, 
OrderQuantity,
SalesAmount,
OrderDate,
ShipDate
FROM FactInternetSales
INNER  JOIN Dimproduct P ON P.ProductKey = S.ProductKey
INNER  JOIN DimSalesTerritory T ON T.SalesTerritoryKey  = S.SalesTerritoryKey
INNER JOIN DimproductSubcategory SP ON SP.ProductSubcategoryKey = P.ProductSubcategoryKey










