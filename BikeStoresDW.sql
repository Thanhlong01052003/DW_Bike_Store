create database BikeStoresDW
go
USE BikeStoresDW
go

/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [ProductKey]  int IDENTITY NOT  NULL
,  [ProductID]  int   NOT NULL
,  [ProductName] varchar(255) not null
,  [BrandName]  varchar(255)   NOT NULL
,  [CategoryName]  varchar(255)   NOT NULL
,  [ModelYear]  smallint   NULL
,  [ListPrice]  decimal(10, 2)   NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

/* Drop table dbo.DimStore */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimStore') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimStore 
;

/* Create table dbo.DimStore */
CREATE TABLE dbo.DimStore (
   [StoreKey]  int IDENTITY not NULL
,  [StoreID]  int   NOT NULL
,  [StoreName] varchar(255)   NOT NULL
,  [Phone]  varchar(255)   NOT NULL
,  [Email]  varchar(255)   NULL
,  [Street]  varchar(255)   NULL
,  [City]  varchar(255)   NULL
,  [State]  varchar(10)   NULL
,  [ZipCode]  varchar(5)   NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_dbo.DimStore] PRIMARY KEY CLUSTERED 
( [StoreKey] )
) ON [PRIMARY]
;

/* Drop table dbo.DimCustomers */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomers 
;

/* Create table dbo.DimCustomers */
CREATE TABLE dbo.DimCustomers (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerID]  int   NOT NULL
,  [CustomerName]  varchar(255)   NOT NULL
,  [CustomerCity]  varchar(50)   NOT NULL
,  [CustomerZipCode]  varchar(5)   NOT NULL
,  [RowIsCurrent]   bit  DEFAULT 1    NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)    NULL
, CONSTRAINT [PK_dbo.DimCustomers] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

/* Drop table dbo.DimStaff */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimStaff') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimStaff 
;

/* Create table dbo.DimStaff */
CREATE TABLE dbo.DimStaff (
   [StaffKey]  int IDENTITY  NOT NULL
,  [StaffID]  int   NOT NULL
,  [StaffName]  varchar(255)   NOT NULL
,  [StoreName]  varchar(255)   NOT NULL
,  [ManagerName]  varchar(255)   NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)    NULL
, CONSTRAINT [PK_dbo.DimStaff] PRIMARY KEY CLUSTERED 
( [StaffKey] )
) ON [PRIMARY]
;

/* Drop table dbo.DimStock */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimStock') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimStock 
;

/* Create table dbo.DimStock */
CREATE TABLE dbo.DimStock (
  [store_id] int NOT NULL
,  [store_name]  varchar(255)   NOT NULL
, [product_id] int not null
,  [product_name]  varchar(255)   NOT NULL
,  [quantity]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimStock] PRIMARY KEY CLUSTERED 
( [store_id],[product_id] )
) ON [PRIMARY]
;

/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int   NOT NULL
,  [Date]  datetime   NOT NULL
,  [DayOfWeek]  tinyint   NULL
,  [DayName]  varchar(9)   NOT NULL
,  [DayOfMonth]  tinyint   NOT NULL
,  [DayOfYear]  smallint   NOT NULL
,  [WeekOfYear]  tinyint   NOT NULL
,  [MonthName]  varchar(9)   NOT NULL
,  [MonthOfYear]  tinyint   NOT NULL
,  [Quarter]  tinyint   NOT NULL
,  [Year]  smallint   NOT NULL
,  [IsAWeekday]  varchar(15)   NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

/* Drop table dbo.InventoryFact */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.InventoryFact') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.InventoryFact 
;

CREATE TABLE dbo.InventoryFact (
   [OrderDateKey]  int   not NULL
,  [ProductKey]  int  not  NULL
,  [store_id] int NOT NULL
,  [product_id]  int   NOT NULL
,  [quantity_stock]  int   NULL
,  [quantity_order]  int   NULL
,  [quantity_in_stock]  int   NULL
,  [list_price]  decimal(10, 2)   NULL
,  [stock_value]  int   NULL
, CONSTRAINT [PK_dbo.InventoryFact] PRIMARY KEY NONCLUSTERED 
( [OrderDateKey], [ProductKey], [store_id] )
) ON [PRIMARY]
;

/* Drop table dbo.SalesFact */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.SalesFact') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.SalesFact 
;

/* Create table dbo.SalesFact */
CREATE TABLE dbo.SalesFact (
   [OrderID]  int  NOT NULL
,  [OrderDateKey]  int   NOT NULL
,  [ShippedDateKey]  int   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [CustomerKey]  int  NOT NULL
,  [StaffKey]  int NOT NULL
,  [StoreKey]  int   NULL
,  [Quanity]  float   NULL
,  [UnitPrice]  float   NULL
,  [SoldAmount]  money   NULL
, CONSTRAINT [PK_dbo.SalesFact] PRIMARY KEY NONCLUSTERED 
( [OrderID], [ProductKey] )
) ON [PRIMARY]
;

/* Define Foreign Key Constraints */
ALTER TABLE dbo.InventoryFact ADD CONSTRAINT FK_InventoryFact_OrderDateKey FOREIGN KEY ([OrderDateKey]) REFERENCES dbo.DimDate([DateKey]);
ALTER TABLE dbo.InventoryFact ADD CONSTRAINT FK_InventoryFact_ProductKey FOREIGN KEY ([ProductKey]) REFERENCES dbo.DimProduct([ProductKey]);
ALTER TABLE dbo.InventoryFact ADD CONSTRAINT FK_InventoryFact_Stock FOREIGN KEY ([store_id],[product_id]) REFERENCES dbo.DimStock([store_id],[product_id]);

ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_OrderDateKey FOREIGN KEY ([OrderDateKey]) REFERENCES dbo.DimDate([DateKey]);
ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_ShippedDateKey FOREIGN KEY ([ShippedDateKey]) REFERENCES dbo.DimDate([DateKey]);
ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_ProductKey FOREIGN KEY ([ProductKey]) REFERENCES dbo.DimProduct([ProductKey]);
ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_CustomerKey FOREIGN KEY ([CustomerKey]) REFERENCES dbo.DimCustomers([CustomerKey]);
ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_StaffKey FOREIGN KEY ([StaffKey]) REFERENCES dbo.DimStaff([StaffKey]);
ALTER TABLE dbo.SalesFact ADD CONSTRAINT FK_SalesFact_StoreKey FOREIGN KEY ([StoreKey]) REFERENCES dbo.DimStore([StoreKey]);
GO
 

