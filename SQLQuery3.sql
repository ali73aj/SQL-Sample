/*
CREATE TABLE SaleTable (
    SalesID INT,
    OrderID INT,
    Customer VARCHAR(10),
    Product VARCHAR(10),
    Date INT,
    Quantity INT,
    UnitPrice INT
);

INSERT INTO SaleTable (SalesID, OrderID, Customer, Product, Date, Quantity, UnitPrice) VALUES
(1, 1, 'C1', 'P1', 1, 2, 100),
(2, 1, 'C1', 'P2', 1, 4, 150),
(3, 2, 'C2', 'P2', 1, 5, 150),
(4, 3, 'C3', 'P4', 1, 3, 550),
(5, 4, 'C4', 'P3', 1, 1, 300),
(6, 4, 'C4', 'P6', 1, 6, 150),
(7, 4, 'C4', 'P4', 1, 6, 550),
(8, 5, 'C5', 'P2', 1, 3, 150),
(9, 5, 'C5', 'P1', 1, 6, 100),
(10, 6, 'C1', 'P6', 1, 3, 150),
(11, 6, 'C1', 'P3', 1, 2, 300),
(12, 7, 'C3', 'P5', 1, 4, 400),
(13, 7, 'C3', 'P1', 1, 6, 100),
(14, 7, 'C3', 'P3', 1, 1, 300),
(15, 8, 'C5', 'P2', 1, 3, 150),
(16, 8, 'C5', 'P5', 1, 4, 400),
(17, 8, 'C5', 'P1', 1, 2, 100),
(18, 9, 'C2', 'P3', 2, 1, 300),
(19, 9, 'C2', 'P4', 2, 3, 550),
(20, 9, 'C2', 'P5', 2, 6, 400),
(21, 9, 'C2', 'P1', 2, 4, 100),
(22, 10, 'C4', 'P6', 2, 3, 150),
(23, 11, 'C6', 'P3', 2, 2, 300),
(24, 11, 'C6', 'P4', 2, 3, 550),
(25, 12, 'C7', 'P1', 2, 5, 100),
(26, 12, 'C7', 'P2', 2, 3, 150),
(27, 12, 'C7', 'P3', 2, 1, 300),
(28, 13, 'C2', 'P1', 2, 4, 100),
(29, 13, 'C2', 'P3', 2, 2, 300),
(30, 14, 'C6', 'P2', 2, 6, 150),
(31, 15, 'C4', 'P6', 2, 1, 150),
(32, 16, 'C1', 'P4', 3, 6, 550),
(33, 17, 'C2', 'P5', 3, 3, 400),
(34, 18, 'C8', 'P1', 3, 6, 100),
(35, 18, 'C8', 'P3', 3, 3, 300),
(36, 18, 'C8', 'P5', 3, 5, 400),
(37, 19, 'C9', 'P2', 3, 2, 150),
(38, 20, 'C2', 'P3', 3, 3, 300),
(39, 20, 'C2', 'P1', 3, 4, 100),
(40, 20, 'C2', 'P2', 3, 1, 150);


CREATE TABLE SaleProfit
(
  Product VARCHAR(100),
  ProfitRatio DECIMAL(5, 2)
);
INSERT INTO SaleProfit (Product, ProfitRatio)
VALUES ('P1', 0.05),
       ('P2', 0.25),
       ('P3', 0.10),
       ('P4', 0.20),
       ('P5', 0.10);

-- ایجاد جدول چارت سازمانی
CREATE TABLE OrganizationChart (
    Id INT,
    Name NVARCHAR(50),
    Manager NVARCHAR(50),
    ManagerId INT
);

-- وارد کردن اطلاعات به جدول چارت سازمانی
INSERT INTO OrganizationChart (Id, Name, Manager, ManagerId)
VALUES
    (1, 'Ken', NULL, NULL),
    (2, 'Hugo', NULL, NULL),
    (3, 'James', 'Carol', 5),
    (4, 'Mark', 'Morgan', 13),
    (5, 'Carol', 'Alex', 12),
    (6, 'David', 'Rose', 21),
    (7, 'Michael', 'Markos', 11),
    (8, 'Brad', 'Alex', 12),
    (9, 'Rob', 'Matt', 15),
    (10, 'Dylan', 'Alex', 12),
    (11, 'Markos', 'Carol', 5),
    (12, 'Alex', 'Ken', 1),
    (13, 'Morgan', 'Matt', 15),
    (14, 'Jennifer', 'Morgan', 13),
    (15, 'Matt', 'Hugo', 2),
    (16, 'Tom', 'Brad', 8),
    (17, 'Oliver', 'Dylan', 10),
    (18, 'Daniel', 'Rob', 9),
    (19, 'Amanda', 'Markos', 11),
    (20, 'Ana', 'Dylan', 10),
    (21, 'Rose', 'Rob', 9),
    (22, 'Robert', 'Rob', 9),
    (23, 'Fill', 'Morgan', 13),
    (24, 'Antoan', 'David', 6),
    (25, 'Eddie', 'Mark', 4);
*/
--1-      کل فروش شرکت چه مقدار است
SELECT SUM(UnitPrice * Quantity) AS TotalSales
FROM SaleTable;
--2-      تعداد متمایز مشتریانی که از این شرکت خرید داشته اند، چند تاست؟
SELECT COUNT(DISTINCT Customer) AS TotalCustomers
FROM SaleTable;
--3-      این شرکت از هر محصول چه مقدار فروخته است؟
SELECT Product, SUM(Quantity) AS TotalSales
FROM SaleTable
GROUP BY Product;
/*4- یک کوئری بنویسید که در آن مشتریانی نمایش داده شوند که حداقل یک فاکتور بیش
از مبلغ 1500 دارند و به ازای هر کدام از این مشتریان، مبلغ خرید، تعداد فاکتور و
تعداد آیتم خریداری شده نمایش داده شود.*/
SELECT Customer, 
       SUM(Quantity * UnitPrice) AS TotalAmount, 
       COUNT(DISTINCT OrderID) AS InvoiceCount, 
       SUM(Quantity) AS TotalItemCount
FROM SaleTable
WHERE OrderID IN (
    SELECT DISTINCT OrderID
    FROM SaleTable
    WHERE Quantity * UnitPrice > 1500
)
GROUP BY Customer
ORDER BY TotalAmount;
--5-      مبلغ سود و درصد سود حاصل از فروش کل را محاسبه نمایید.
-- محاسبه مبلغ سود کل
SELECT SUM(ST.Quantity * ST.UnitPrice * SP.ProfitRatio) AS TotalProfit
FROM SaleTable ST
JOIN SaleProfit SP ON ST.Product = SP.Product;

-- محاسبه درصد سود
SELECT (SUM(ST.Quantity * ST.UnitPrice * SP.ProfitRatio) / SUM(ST.Quantity * ST.UnitPrice)) * 100 AS ProfitPercentage
FROM SaleTable ST
JOIN SaleProfit SP ON ST.Product = SP.Product;
/*6-با فرض اینکه خریدهای هر مشتری در هر روز فقط 1 بار شمرده شود، در مجموع چند
مشتری از شرکت خرید داشته اند*/
SELECT DISTINCT Customer,Date
FROM SaleTable
Group By Customer,Date

/*ب – جدول چارت سازمانی که در لینک زیر نیز قابل مشاهده است، مربوط به چارت
سازمانی شرکت پخش مذکور می باشد که نام و آی دی هر کارشناس به همراه مدیر مستقیم
بالادستی و آیدی مدیر بالادستی را نمایش می دهد

علاوه بر ساخت این جدول با استفاده از کوئری، در کنار نام هر کارشناس، لول آن کارشناس در چارت سازمانی و بالاترین مدیر
مربوط به آن کارشناس در چارت سازمانی را با استفاده از کوئری ثبت کنید

*  بالاترین مدیران سازمان لول 1، زیردستان آنها
لول 2 و به همین ترتیب تا پایین ترین لایه چارت ادامه می یابد
* بالاترین مدیران سازمان کسانی هستند که مدیر
بالادستی ندارند و در فیلد Manager عبارت Null درج شده است*/

WITH RecursiveChart AS (
    SELECT Id, Name, Manager, ManagerId, 1 AS Level
    FROM OrganizationChart
    WHERE ManagerId IS NULL

    UNION ALL

    SELECT o.Id, o.Name, o.Manager, o.ManagerId, rc.Level + 1 AS Level
    FROM OrganizationChart o
    INNER JOIN RecursiveChart rc ON o.ManagerId = rc.Id
)
SELECT rc.Name, rc.Level, m.Name AS Manager, m.Level AS ManagerLevel
FROM RecursiveChart rc
LEFT JOIN RecursiveChart m ON rc.ManagerId = m.Id
ORDER BY rc.Level, rc.Id;





