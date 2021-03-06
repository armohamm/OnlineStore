USE [master]
GO
/****** Object:  Database [BalloonShop]    Script Date: 12/05/2013 22:53:41 ******/
CREATE DATABASE [BalloonShop] ON  PRIMARY 
( NAME = N'BalloonShop', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BalloonShop.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BalloonShop_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BalloonShop_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BalloonShop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BalloonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BalloonShop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BalloonShop] SET ARITHABORT OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BalloonShop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BalloonShop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BalloonShop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BalloonShop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BalloonShop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BalloonShop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BalloonShop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BalloonShop] SET  ENABLE_BROKER
GO
ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BalloonShop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BalloonShop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BalloonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BalloonShop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BalloonShop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BalloonShop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BalloonShop] SET  READ_WRITE
GO
ALTER DATABASE [BalloonShop] SET RECOVERY FULL
GO
ALTER DATABASE [BalloonShop] SET  MULTI_USER
GO
ALTER DATABASE [BalloonShop] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BalloonShop] SET DB_CHAINING OFF
GO
USE [BalloonShop]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [FK_ShoppingCart_Product]
GO
/****** Object:  ForeignKey [FK_Category_Department]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_Category_Department]
GO
/****** Object:  ForeignKey [FK_AttributeValue_Attribute]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[AttributeValue] DROP CONSTRAINT [FK_AttributeValue_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Category]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Category]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Product]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_AttributeValue]    Script Date: 12/05/2013 22:53:47 ******/
ALTER TABLE [dbo].[ProductAttributeValue] DROP CONSTRAINT [FK_ProductAttributeValue_AttributeValue]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_Product]    Script Date: 12/05/2013 22:53:47 ******/
ALTER TABLE [dbo].[ProductAttributeValue] DROP CONSTRAINT [FK_ProductAttributeValue_Product]
GO
/****** Object:  StoredProcedure [dbo].[CatalogAssignProductToCategory]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogAssignProductToCategory]
GO
/****** Object:  StoredProcedure [dbo].[CatalogCreateProduct]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogCreateProduct]
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteProduct]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogDeleteProduct]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetAllProductsInCategory]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetAllProductsInCategory]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithoutProduct]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetCategoriesWithoutProduct]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithProduct]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetCategoriesWithProduct]
GO
/****** Object:  StoredProcedure [dbo].[CatalogMoveProductToCategory]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogMoveProductToCategory]
GO
/****** Object:  StoredProcedure [dbo].[CatalogRemoveProductFromCategory]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogRemoveProductFromCategory]
GO
/****** Object:  View [dbo].[ProdsInCats]    Script Date: 12/05/2013 22:53:47 ******/
DROP VIEW [dbo].[ProdsInCats]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductAttributeValues]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetProductAttributeValues]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsInCategory]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetProductsInCategory]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnDeptPromo]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetProductsOnDeptPromo]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartUpdateItem]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductRecommendations]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[CatalogGetProductRecommendations]
GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCartRecommendations]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[GetShoppingCartRecommendations]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartAddItem]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartCountOldCarts]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartCountOldCarts]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartDeleteOldCarts]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartDeleteOldCarts]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartGetItems]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 12/05/2013 22:53:47 ******/
DROP PROCEDURE [dbo].[ShoppingCartRemoveItem]
GO
/****** Object:  Table [dbo].[ProductAttributeValue]    Script Date: 12/05/2013 22:53:47 ******/
ALTER TABLE [dbo].[ProductAttributeValue] DROP CONSTRAINT [FK_ProductAttributeValue_AttributeValue]
GO
ALTER TABLE [dbo].[ProductAttributeValue] DROP CONSTRAINT [FK_ProductAttributeValue_Product]
GO
DROP TABLE [dbo].[ProductAttributeValue]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Product]
GO
DROP TABLE [dbo].[ProductCategory]
GO
/****** Object:  StoredProcedure [dbo].[SearchCatalog]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[SearchCatalog]
GO
/****** Object:  StoredProcedure [dbo].[OrderGetDetails]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderGetDetails]
GO
/****** Object:  StoredProcedure [dbo].[OrderGetInfo]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderGetInfo]
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateCategory]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogUpdateCategory]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CreateOrder]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoryDetails]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetCategoryDetails]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesInDepartment]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetCategoriesInDepartment]
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteCategory]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogDeleteCategory]
GO
/****** Object:  StoredProcedure [dbo].[CatalogCreateCategory]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogCreateCategory]
GO
/****** Object:  Table [dbo].[AttributeValue]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[AttributeValue] DROP CONSTRAINT [FK_AttributeValue_Attribute]
GO
DROP TABLE [dbo].[AttributeValue]
GO
/****** Object:  StoredProcedure [dbo].[CatalogAddDepartment]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogAddDepartment]
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteDepartment]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogDeleteDepartment]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartmentDetails]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetDepartmentDetails]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartments]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetDepartments]
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateDepartment]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogUpdateDepartment]
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateProduct]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogUpdateProduct]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_Category_Department]
GO
DROP TABLE [dbo].[Category]
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCanceled]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderMarkCanceled]
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCompleted]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderMarkCompleted]
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkVerified]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderMarkVerified]
GO
/****** Object:  StoredProcedure [dbo].[SearchWord]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[SearchWord]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [FK_ShoppingCart_Product]
GO
DROP TABLE [dbo].[ShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByDate]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrdersGetByDate]
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByRecent]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrdersGetByRecent]
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetUnverifiedUncanceled]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrdersGetUnverifiedUncanceled]
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetVerifiedUncompleted]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrdersGetVerifiedUncompleted]
GO
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[OrderUpdate]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Orders]
GO
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnFrontPromo]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetProductsOnFrontPromo]
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductDetails]    Script Date: 12/05/2013 22:53:46 ******/
DROP PROCEDURE [dbo].[CatalogGetProductDetails]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/05/2013 22:53:44 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/05/2013 22:53:44 ******/
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_DateCreated]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_Verified]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_Completed]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_Canceled]
GO
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/05/2013 22:53:44 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/05/2013 22:53:44 ******/
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 12/05/2013 22:53:44 ******/
DROP TABLE [dbo].[Attribute]
GO
/****** Object:  FullTextCatalog [BalloonShopFullText]    Script Date: 12/05/2013 22:53:41 ******/
EXEC dbo.sp_fulltext_catalog @ftcat=N'BalloonShopFullText', @action=N'drop'
GO
/****** Object:  FullTextCatalog [BalloonShopFullText]    Script Date: 12/05/2013 22:53:41 ******/
CREATE FULLTEXT CATALOG [BalloonShopFullText]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 12/05/2013 22:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attribute] ON
INSERT [dbo].[Attribute] ([AttributeID], [Name]) VALUES (1, N'Color')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
/****** Object:  Table [dbo].[Department]    Script Date: 12/05/2013 22:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (3, N'Women', N'Women Department')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (4, N'Men', N'Men Department')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (5, N'Boys', N'Boys Department')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (6, N'Girls', N'Girls Department')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (7, N'New', N'New Arrivals Department')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (8, N'Sale', N'Clearance Department')
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 12/05/2013 22:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Thumbnail] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[PromoFront] [bit] NOT NULL,
	[PromoDept] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (64, N'Fabric & Care ', N'Description', 44.9900, N'wtop1.jpg', N'wtop1.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (65, N'Fabric & Care Black', N'Fabric & Care Black', 49.9500, N'wtop2.jpg', N'wtop2.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (66, N'Metropolian', N'Metropolian', 59.9500, N'wtop3.jpg', N'wtop3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (67, N'Leather Look Top', N'Leather Look Top', 89.9500, N'wtop4.jpg', N'wtop4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (68, N'Jean', N'Women Jean Black', 79.9500, N'wbottom1.jpg', N'wbottom1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (69, N'Pants', N'Women Pants Fit', 49.9500, N'wbottom2.jpg', N'wbottom2.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (70, N'Pants Red', N'Women Pants Red', 59.9500, N'wbottom3.jpg', N'wbottom3.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (71, N'Skirt', N'Women Skirt', 99.9500, N'wbottom4.jpg', N'wbottom4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (72, N'Tuxedo Jacket', N'Women Suit - Tuxedo Jacket', 179.9500, N'wsuit1.jpg', N'wsuit1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (73, N'Blazer', N'Women Suit - Blazer', 139.9900, N'wsuit2.jpg', N'wsuit2.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (74, N'Blazer Black', N'Women Suit - Blazer Black', 129.9500, N'wsuit3.jpg', N'wsuit3.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (75, N'Blazer Suit', N'Women Suit - Blazer Suit', 199.9500, N'wsuit4.jpg', N'wsuit4.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (76, N'Mexx Coat', N'Women''s Mexx Coat', 174.9700, N'wout1.jpg', N'wout1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (77, N'Leopard Print Blouse', N'Leopard Print Blouse', 69.9500, N'wout2.jpg', N'wout2.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (78, N'Tweed Coat', N'Women''s Tweed Coat', 299.9500, N'wout3.jpg', N'wout3.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (79, N'Outware Black', N'Outerware in Black', 125.9700, N'wout4.jpg', N'wout4.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (80, N'Ear Drops', N'Ear Drops Silver', 15.9500, N'wacc1.jpg', N'wacc1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (81, N'Bracelet', N'Women''s Bracelet', 24.9900, N'wacc2.jpg', N'wacc2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (82, N'Necklace', N'Women''s Necklace', 19.9900, N'wacc31.jpg', N'wacc32.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (83, N'Buttons', N'Women''s Buttons', 12.9900, N'wacc41.jpg', N'wacc42.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (84, N'T-Shirt', N'Men''s T-Shirt', 19.9900, N'mtop1.jpg', N'mtop1.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (85, N'Longsleeve', N'Men''s Longsleeve', 49.9900, N'mtop2.jpg', N'mtop2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (86, N'Sweater', N'Men''s Sweater', 89.9500, N'mtop3.jpg', N'mtop3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (87, N'Cardigan', N'Men''s Cardigan', 79.9900, N'mtop4.jpg', N'mtop4.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (88, N'Jean', N'Men''s Jean', 79.9500, N'mbottom1.jpg', N'mtottom1.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (89, N'Jean II', N'Men''s Jean II', 89.9500, N'mbottom2.jpg', N'mtottom2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (90, N'Pants', N'Men''s Pants', 69.9500, N'mbottom3.jpg', N'mtottom3.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (91, N'Pants', N'Men''s Pants II', 79.9500, N'mbottom4.jpg', N'mtottom4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (92, N'Suit', N'Men''s Suit', 149.9900, N'msuit1.jpg', N'msuit1.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (93, N'Suit', N'Men''s Suit I', 159.9900, N'msuit2.jpg', N'msuit2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (94, N'Vest', N'Men''s Vest', 564.9900, N'msuit3.jpg', N'msuit3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (95, N'Suit - Blazer', N'Men''s Blazer', 159.9900, N'msuit4.jpg', N'msuit4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (96, N'Outerwear', N'Men''s Outerwear', 279.9500, N'mout1.jpg', N'mout1', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (97, N'Coat', N'Men''s Coat', 229.9500, N'mout3.jpg', N'mout3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (98, N'Outerwear', N'Men''s Outerwear II', 299.9500, N'mout2.jpg', N'mout2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (99, N'Mexx Coat', N'Men''s Coat Mexx', 279.9500, N'mout4.jpg', N'mout4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (100, N'Tie', N'Men''s Tie', 49.9500, N'macc1.jpg', N'macc1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (101, N'Tie Clip', N'Men''s Tie Clip', 19.9500, N'macc2.jpg', N'macc2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (102, N'Belt', N'Men''s Belt', 39.9500, N'macc3.jpg', N'macc3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (103, N'Gloves', N'Men''s Gloves', 20.9700, N'macc4.jpg', N'macc4.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (104, N'Wallet', N'Men''s Wallet', 69.9500, N'macc5.jpg', N'macc5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (105, N'Coat', N'Boy''s Coat', 39.9500, N'btop1.jpg', N'botp1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (106, N'Bodysuit', N'Boy''s Bodysuit', 44.9500, N'btop2.jpg', N'botp2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (107, N'Top', N'Boy''s Top', 29.9500, N'btop3.jpg', N'botp3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (108, N'Sleepware', N'Boy''s Sleepware', 28.9500, N'btop4.jpg', N'botp4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (109, N'Boy''s Blue Jean', N'Boy''s Blue Jean', 36.9500, N'bbottom1.jpg', N'bbottom1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (110, N'Boy''s Black Pants', N'Boy''s Black Pants', 39.9500, N'bbottom2.jpg', N'bbottom2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (111, N'BOYS'' FREEDOM INSULATED PANTS', N'BOYS'' FREEDOM INSULATED PANTS', 120.0000, N'bbottom4.png', N'bbottom4.png', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (112, N'BOYS'' FREEDOM INSULATED PANTS Black', N'BOYS'' FREEDOM INSULATED PANTS', 140.0000, N'bbottom3.png', N'bbottom3.png', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (113, N'Snow Suit', N'Boy''s snow suit', 34.9700, N'bsuit1.jpg', N'bsuit1.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (114, N'Boy''s Socks', N'Boy''s Socks', 9.9500, N'bacc1.jpg', N'bacc1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (115, N'Boy''s Hat', N'Boy''s Hat', 16.0700, N'bacc2.jpg', N'bacc2.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (116, N'Boy''s Cutie', N'Boy''s Cutie', 19.9500, N'bacc3.jpg', N'bacc3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (117, N'Boy''s Shoes', N'Boy''s Shoes', 14.9500, N'bacc4.jpg', N'bacc4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (118, N'Girls Top Pink', N'Girls Top Pink', 36.9500, N'gtop1.jpg', N'gtop1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (119, N'Girls Top Flowers', N'Girls Top Flowers', 32.9500, N'gtop2.jpg', N'gtop2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (120, N'Girls Top Sweater', N'Girls Top Sweater', 39.9500, N'gtop3.jpg', N'gtop3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (121, N'Girls Top Sweater Gray', N'Girls Top Sweater Gray', 39.9500, N'gtop4.jpg', N'gtop4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (122, N'Girls Top Sweater Orange', N'Girls Top Sweater Orange', 29.9500, N'gtop5.jpg', N'gtop5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (123, N'Girls Top Sweater White', N'Girls Top Sweater White', 24.9500, N'gtop6.jpg', N'gtop6.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (124, N'Girls'' Legging White', N'Girls'' Legging White', 26.9500, N'gbottom1.jpg', N'gbottom1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (125, N'Girls'' Legging Orange', N'Girls'' Legging Orange', 14.9500, N'gbottom2.jpg', N'gbottom2.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (126, N'Girls'' Snow Suit', N'Girls'' Snow Suit', 59.9500, N'gsuit1.jpg', N'gsuit1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (127, N'Girls'' Legging with Socks', N'Girls'' Legging with Socks', 12.9500, N'gacc1.jpg', N'gacc1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (128, N'Girls'' Legging with Socks Pink', N'Girls'' Legging with Socks Pink', 12.9500, N'gacc2.jpg', N'gacc2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (129, N'Girls'' Socks White', N'Girls'' Socks White', 5.9500, N'gacc3.jpg', N'gacc3.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (130, N'Girls'' Princess Shoes', N'Girls'' Princess Shoes', 22.9500, N'gacc4.jpg', N'gacc4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (131, N'Girls'' Princess Shoes Pink', N'Girls'' Princess Shoes Pink', 22.9500, N'gacc5.jpg', N'gacc5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (132, N'Girls'' Dashing Down Coat', N'Girls'' Dashing Down Coat', 119.0000, N'gsuit2.jpg', N'gsuit2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (133, N'Kids'' Trail Model Rain Jacket', N'Kids'' Trail Model Rain Jacket', 44.9500, N'gsuit3.jpg', N'gsuit3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (134, N'Kids'' Fleece Flame Hat', N'Kids'' Fleece Flame Hat', 3.9900, N'sitem1.jpg', N'sitem1.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (135, N'Kids'' Superstretch Titanium Shorty Wet Suit', N'Kids'' Superstretch Titanium Shorty Wet Suit', 59.0000, N'nitem1.jpg', N'nitem1.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (136, N'Gift Card', N'Best Gift for the Season!', 100.0000, N'nitem2.jpg', N'nitem2.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (137, N'Wonder Bra Black', N'Wonder Bra Black (not include the model)', 36.0000, N'nitem3.jpg', N'nitem3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (138, N'B. TEMPT''D BY WACOAL Ciao Bella Tanga Panty', N'B. TEMPT''D BY WACOAL Ciao Bella Tanga Panty', 24.0000, N'nitem4.jpg', N'nitem4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (139, N'JESSICA SIMPSON', N'Welcome to the Jungle Collection', 29.9900, N'nitem5.jpg', N'nitem5.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Orders]    Script Date: 12/05/2013 22:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL CONSTRAINT [DF_Orders_DateCreated]  DEFAULT (getdate()),
	[DateShipped] [smalldatetime] NULL,
	[Verified] [bit] NOT NULL CONSTRAINT [DF_Orders_Verified]  DEFAULT ((0)),
	[Completed] [bit] NOT NULL CONSTRAINT [DF_Orders_Completed]  DEFAULT ((0)),
	[Canceled] [bit] NOT NULL CONSTRAINT [DF_Orders_Canceled]  DEFAULT ((0)),
	[Comments] [nvarchar](1000) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (1, CAST(0x9E3903F0 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (2, CAST(0x9E3A01A9 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (3, CAST(0x9E3A0206 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (4, CAST(0x9E3A02CF AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (5, CAST(0x9E3E01B3 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (6, CAST(0x9E3E01B5 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (7, CAST(0x9E3E01B9 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (8, CAST(0x9E3E02A6 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (9, CAST(0x9E3E02A8 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (10, CAST(0x9E3E02BB AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (11, CAST(0x9EAA03D5 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (12, CAST(0x9EAA03D7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (13, CAST(0xA01503E6 AS SmallDateTime), CAST(0x9EE40202 AS SmallDateTime), 0, 0, 1, N'', N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (14, CAST(0xA01D02F7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (15, CAST(0xA01D02F7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (16, CAST(0xA01D02F8 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (17, CAST(0xA01D02FB AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (18, CAST(0xA2740565 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (19, CAST(0xA2740566 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (20, CAST(0xA2750027 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (21, CAST(0xA2830528 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (22, CAST(0xA28703A5 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (23, CAST(0xA28703A6 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (24, CAST(0xA28703A6 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (25, CAST(0xA28703AA AS SmallDateTime), NULL, 0, 0, 0, NULL, N'69f98eee-a832-4675-b4d2-db3c922e8b0b', N'69f98eee-a832-4675-b4d2-db3c922e8b0b', N'69f98eee-a832-4675-b4d2-db3c922e8b0b')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (26, CAST(0xA28703C6 AS SmallDateTime), NULL, 0, 0, 0, NULL, N'aaa@aa.com', N'aaa@aa.com', N'44444')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (27, CAST(0xA28703CA AS SmallDateTime), NULL, 0, 0, 0, NULL, N'aaa@aa.com', N'aaa@aa.com', N'44444')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (28, CAST(0xA28703CB AS SmallDateTime), NULL, 0, 0, 0, NULL, N'aaa@aa.com', N'aaa@aa.com', N'44444')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (29, CAST(0xA28703CC AS SmallDateTime), NULL, 0, 0, 0, NULL, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 12/05/2013 22:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](250) NOT NULL,
	[last_name] [varchar](250) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[register_time] [datetime] NOT NULL,
	[role_type] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [address], [email], [password], [register_time], [role_type]) VALUES (1, N'sdfsfsdf', N'4444', N'44444', N'aaa@aa.com', N'2', CAST(0x0000A28301450B1D AS DateTime), 0)
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [address], [email], [password], [register_time], [role_type]) VALUES (2, N'sdfsfsdf', N'4444', N'44444', N'admin@admin.com', N'2', CAST(0x0000A283014A0BA2 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[CatalogGetProductDetails]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductDetails]
(@ProductID INT)
AS
SELECT Name, Description, Price, Thumbnail, Image, PromoFront, PromoDept
FROM Product
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnFrontPromo]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsOnFrontPromo]
(@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)


-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept
FROM Product
WHERE PromoFront = 1

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Subtotal]  AS ([Quantity]*[UnitCost]),
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (1, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (2, 1, N'I Love You (Simon Elvin)', 2, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (2, 5, N'Smiley Heart Red Balloon', 5, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (3, 1, N'I Love You (Simon Elvin)', 2, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (3, 24, N'Birthday Star Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 2, N'Elvis Hunka Burning Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 4, N'Today, Tomorrow & Forever', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 5, N'Smiley Heart Red Balloon', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (5, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (5, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (6, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (6, 24, N'Birthday Star Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 2, N'Elvis Hunka Burning Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 25, N'Tweety Stars', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 40, N'Rugrats Tommy & Chucky', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (8, 14, N'Love Rose', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (8, 22, N'I''m Younger Than You', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (9, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 10, N'I Can''t Get Enough of You Baby', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (11, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 3, N'Funny Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 57, N'Crystal Rose Silver', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 58, N'Crystal Rose Gold', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (13, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (13, 23, N'Birthday Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 2, N'Elvis Hunka Burning Love', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 5, N'Smiley Heart Red Balloon', 31, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 63, N'Joanne''s birthday balloon', 1, 23.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 7, N'Smiley Kiss Red Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 10, N'I Can''t Get Enough of You Baby', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (18, 64, N'Fabric & Care ', 1, 44.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (18, 65, N'Fabric & Care Black', 1, 49.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (18, 67, N'Leather Look Top', 1, 89.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (18, 75, N'Blazer Suit', 1, 199.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 64, N'Fabric & Care ', 1, 44.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 70, N'Pants Red', 3, 59.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 74, N'Blazer Black', 1, 129.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 80, N'Ear Drops', 1, 15.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 84, N'T-Shirt', 1, 19.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 87, N'Cardigan', 1, 79.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 88, N'Jean', 3, 79.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 89, N'Jean II', 1, 89.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 90, N'Pants', 1, 69.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 91, N'Pants', 2, 79.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 92, N'Suit', 1, 149.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 93, N'Suit', 2, 159.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 94, N'Vest', 5, 564.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 95, N'Suit - Blazer', 1, 159.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (20, 103, N'Gloves', 1, 20.9700)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (21, 7, N'Smiley Kiss Red Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (22, 64, N'Fabric & Care ', 1, 44.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (23, 70, N'Pants Red', 1, 59.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (24, 134, N'Kids'' Fleece Flame Hat', 2, 3.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (25, 84, N'T-Shirt', 1, 19.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (25, 90, N'Pants', 1, 69.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (25, 123, N'Girls Top Sweater White', 2, 24.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (26, 90, N'Pants', 1, 69.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (26, 113, N'Snow Suit', 1, 34.9700)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (27, 70, N'Pants Red', 1, 59.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (28, 90, N'Pants', 1, 69.9500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (29, 113, N'Snow Suit', 1, 34.9700)
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderUpdate]
(@OrderID INT,
 @DateCreated SMALLDATETIME,
 @DateShipped SMALLDATETIME = NULL,
 @Verified BIT,
 @Completed BIT,
 @Canceled BIT,
 @Comments VARCHAR(200),
 @CustomerName VARCHAR(50),
 @ShippingAddress VARCHAR(200),
 @CustomerEmail VARCHAR(50))
AS
UPDATE Orders
SET DateCreated=@DateCreated,
    DateShipped=@DateShipped,
    Verified=@Verified,
    Completed=@Completed,
    Canceled=@Canceled,
    Comments=@Comments,
    CustomerName=@CustomerName,
    ShippingAddress=@ShippingAddress,
    CustomerEmail=@CustomerEmail
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetVerifiedUncompleted]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetVerifiedUncompleted]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=1 AND Completed=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetUnverifiedUncanceled]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetUnverifiedUncanceled]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=0 AND Canceled=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByRecent]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByRecent] 
(@Count smallINT)
AS
-- Set the number of rows to be returned
SET ROWCOUNT @Count
-- Get list of orders
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
ORDER BY DateCreated DESC
-- Reset rowcount value
SET ROWCOUNT 0
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByDate]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByDate] 
(@StartDate SMALLDATETIME,
 @EndDate SMALLDATETIME)
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE DateCreated BETWEEN @StartDate AND @EndDate
ORDER BY DateCreated DESC
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [char](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Attributes] [nvarchar](1000) NULL,
	[DateAdded] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SearchWord]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchWord]
(@pame varchar(40))
AS
SELECT Product.ProductID, Product.price
FROM Product
WHERE Name like '%'+IsNull(@pame,Name)+'%'
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkVerified]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkVerified]
(@OrderID INT)
AS
UPDATE Orders
SET Verified = 1
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCompleted]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCompleted]
(@OrderID INT)
AS
UPDATE Orders
SET Completed = 1,
    DateShipped = GETDATE()
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCanceled]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCanceled]
(@OrderID INT)
AS
UPDATE Orders
SET Canceled = 1
WHERE OrderID = @OrderID
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (7, 3, N'Tops', N'Women''s Tops')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (8, 3, N'Bottoms', N'Women''s Bottoms')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (9, 3, N'Suits', N'Women''s Suits')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (10, 3, N'Outerwear', N'Women''s Outerwear')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (11, 3, N'Accessories', N'Women''s Accessories')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (12, 4, N'Tops', N'Men''s Tops')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (13, 4, N'Bottoms', N'Men''s Bottoms')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (14, 4, N'Suits', N'Men''s Suits')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (15, 4, N'Outerwear', N'Men''s Outerwear')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (16, 4, N'Accessories', N'Men''s Accessories')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (17, 5, N'Tops', N'Kid''s Tops')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (18, 5, N'Bottoms', N'Kid''s Bottoms')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (19, 5, N'Outerwear', N'Kid''s Outerwear')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (20, 5, N'Accessories', N'Kid''s Accessories')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (21, 6, N'Tops', N'Girls''s Tops')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (22, 6, N'Bottoms', N'Girls''s Bottoms')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (23, 6, N'Outerwear', N'Girls''s Outerwear')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (24, 6, N'Accessories', N'Girls''s Accessories')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (25, 8, N'Tops', N'Tops on sale!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (26, 8, N'Bottoms', N'Bottoms on sale!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (27, 8, N'Suits', N'Suits on sale!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (28, 8, N'Outerwear', N'Outwear on sale!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (29, 8, N'Accessories', N'Accessories on sale!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (30, 7, N'Tops', N'New arrived Tops!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (31, 7, N'Bottoms', N'New arrived Bottoms!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (32, 7, N'Suits', N'New arrived Suits!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (33, 7, N'Outwear', N'New arrived Outwear!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (34, 7, N'Accessories', N'New arrived Accessories!')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (36, 8, N'Clearance - Everything must GO!', N'Sale Items')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  StoredProcedure [dbo].[CatalogUpdateProduct]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateProduct]
(@ProductID INT,
 @ProductName VARCHAR(50),
 @ProductDescription VARCHAR(5000),
 @Price MONEY,
 @Thumbnail VARCHAR(50),
 @Image VARCHAR(50),
 @PromoFront BIT,
 @PromoDept BIT)
AS
UPDATE Product
SET Name = @ProductName,
    Description = @ProductDescription,
    Price = @Price,
    Thumbnail = @Thumbnail,
    Image = @Image,
    PromoFront = @PromoFront,
    PromoDept = @PromoDept
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateDepartment]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateDepartment]
(@DepartmentID int,
@DepartmentName nvarchar(50),
@DepartmentDescription nvarchar(1000))
AS
UPDATE Department
SET Name = @DepartmentName, Description = @DepartmentDescription
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartments]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetDepartments] AS
SELECT DepartmentID, Name, Description
FROM Department
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartmentDetails]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetDepartmentDetails]
(@DepartmentID INT)
AS
SELECT Name, Description
FROM Department
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteDepartment]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteDepartment]
(@DepartmentID int)
AS
DELETE FROM Department
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogAddDepartment]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogAddDepartment]
(@DepartmentName nvarchar(50),
@DepartmentDescription nvarchar(1000))
AS
INSERT INTO Department (Name, Description)
VALUES (@DepartmentName, @DepartmentDescription)
GO
/****** Object:  Table [dbo].[AttributeValue]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValue](
	[AttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeValue] ON
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (1, 1, N'White')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (2, 1, N'Black')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (3, 1, N'Red')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (4, 1, N'Orange')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (5, 1, N'Yellow')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (6, 1, N'Green')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (7, 1, N'Blue')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (8, 1, N'Indigo')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (9, 1, N'Purple')
SET IDENTITY_INSERT [dbo].[AttributeValue] OFF
/****** Object:  StoredProcedure [dbo].[CatalogCreateCategory]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogCreateCategory]
(@DepartmentID int,
@CategoryName nvarchar(50),
@CategoryDescription nvarchar(50))
AS
INSERT INTO Category (DepartmentID, Name, Description)
VALUES (@DepartmentID, @CategoryName, @CategoryDescription)
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteCategory]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteCategory]
(@CategoryID int)
AS
DELETE FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesInDepartment]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--missing procedures from 05-07


CREATE PROCEDURE [dbo].[CatalogGetCategoriesInDepartment]
(@DepartmentID INT)
AS
SELECT CategoryID, Name, Description
FROM Category
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoryDetails]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoryDetails]
(@CategoryID INT)
AS
SELECT DepartmentID, Name, Description
FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder] 
(@CartID char(36),
@CustomerName nvarchar(50),
@CustomerEmail nvarchar(50),
@ShippingAddress nvarchar(500))
AS
/* Insert a new record INTo Orders */
DECLARE @OrderID INT
INSERT INTO Orders 
(DateCreated
      ,DateShipped
      ,Verified
      ,Completed
      ,Canceled
      ,Comments
      ,CustomerName
      ,CustomerEmail
      ,ShippingAddress)
 values
(default
      ,default
      ,default
      ,default
      ,default
      ,default
      ,@CustomerName
      ,@CustomerEmail
      ,@ShippingAddress)
 select @OrderID = @@IDENTITY
/* Save the new Order ID */
/* SET @OrderID = @@IDENTITY */
/* Add the order details to OrderDetail */
INSERT INTO OrderDetail 
     (OrderID, ProductID, ProductName, Quantity, UnitCost)
SELECT 
     @OrderID, Product.ProductID, Product.Name, 
     ShoppingCart.Quantity, Product.Price
FROM Product JOIN ShoppingCart
ON Product.ProductID = ShoppingCart.ProductID
WHERE ShoppingCart.CartID = @CartID
/* Clear the shopping cart */
DELETE FROM ShoppingCart
WHERE CartID = @CartID
/* Return the Order ID */
SELECT @OrderID
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateCategory]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateCategory]
(@CategoryID int,
@CategoryName nvarchar(50),
@CategoryDescription nvarchar(1000))
AS
UPDATE Category
SET Name = @CategoryName, Description = @CategoryDescription
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetInfo]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetInfo]
(@OrderID INT)
AS
SELECT OrderID, 
      (SELECT ISNULL(SUM(Subtotal), 0) FROM OrderDetail WHERE OrderID = @OrderID)        
       AS TotalAmount, 
       DateCreated, 
       DateShipped, 
       Verified, 
       Completed, 
       Canceled, 
       Comments, 
       CustomerName, 
       ShippingAddress, 
       CustomerEmail
FROM Orders
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetDetails]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetDetails]
(@OrderID INT)
AS
SELECT Orders.OrderID, 
       ProductID, 
       ProductName, 
       Quantity, 
       UnitCost, 
       Subtotal
FROM OrderDetail JOIN Orders
ON Orders.OrderID = OrderDetail.OrderID
WHERE Orders.OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[SearchCatalog]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCatalog] 
(@DescriptionLength INT,
 @PageNumber TINYINT,
 @ProductsPerPage TINYINT,
 @HowManyResults INT OUTPUT,
 @AllWords BIT,
 @Word1 NVARCHAR(15) = NULL,
 @Word2 NVARCHAR(15) = NULL,
 @Word3 NVARCHAR(15) = NULL,
 @Word4 NVARCHAR(15) = NULL,
 @Word5 NVARCHAR(15) = NULL)
AS

/* @NecessaryMatches needs to be 1 for any-word searches and
   the number of words for all-words searches */
DECLARE @NecessaryMatches INT
SET @NecessaryMatches = 1
IF @AllWords = 1 
  SET @NecessaryMatches =
    CASE WHEN @Word1 IS NULL THEN 0 ELSE 1 END + 
    CASE WHEN @Word2 IS NULL THEN 0 ELSE 1 END + 
    CASE WHEN @Word3 IS NULL THEN 0 ELSE 1 END +
    CASE WHEN @Word4 IS NULL THEN 0 ELSE 1 END +
    CASE WHEN @Word5 IS NULL THEN 0 ELSE 1 END;

/* Create the table variable that will contain the search results */
DECLARE @Matches TABLE
([Key] INT NOT NULL,
 Rank INT NOT NULL)

-- Save matches for the first word
IF @Word1 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word1

-- Save the matches for the second word
IF @Word2 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word2

-- Save the matches for the third word
IF @Word3 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word3

-- Save the matches for the fourth word
IF @Word4 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word4

-- Save the matches for the fifth word
IF @Word5 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word5

-- Calculate the IDs of the matching products
DECLARE @Results TABLE
(RowNumber INT,
 [KEY] INT NOT NULL,
 Rank INT NOT NULL)

-- Obtain the matching products 
INSERT INTO @Results
SELECT ROW_NUMBER() OVER (ORDER BY COUNT(M.Rank) DESC),
       M.[KEY], SUM(M.Rank) AS TotalRank
FROM @Matches M
GROUP BY M.[KEY]
HAVING COUNT(M.Rank) >= @NecessaryMatches

-- return the total number of results using an OUTPUT variable
SELECT @HowManyResults = COUNT(*) FROM @Results

-- populate the table variable with the complete list of products
SELECT Product.ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
FROM Product 
INNER JOIN @Results R
ON Product.ProductID = R.[KEY]
WHERE R.RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND R.RowNumber <= @PageNumber * @ProductsPerPage
ORDER BY R.Rank DESC
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/05/2013 22:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (64, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (65, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (66, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (67, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (68, 8)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (69, 8)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (70, 8)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (71, 8)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (72, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (73, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (74, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (75, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (76, 10)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (77, 10)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (78, 10)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (79, 10)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (80, 11)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (81, 11)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (82, 11)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (83, 11)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (84, 12)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (85, 12)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (86, 12)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (87, 12)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (88, 13)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (89, 13)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (90, 13)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (91, 13)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (92, 14)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (93, 14)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (94, 14)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (95, 14)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (96, 15)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (97, 15)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (98, 15)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (99, 15)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (100, 16)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (101, 16)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (102, 16)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (103, 16)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (104, 16)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (105, 17)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (106, 17)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (107, 17)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (108, 17)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (109, 18)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (110, 18)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (111, 18)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (112, 18)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (113, 19)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (114, 20)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (115, 20)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (116, 20)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (117, 20)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (118, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (119, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (120, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (121, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (122, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (123, 21)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (124, 22)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (125, 22)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (126, 23)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (127, 24)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (128, 24)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (129, 24)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (130, 24)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (131, 24)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (132, 23)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (133, 23)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (134, 36)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (135, 32)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (136, 34)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (137, 30)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (138, 31)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (139, 33)
/****** Object:  Table [dbo].[ProductAttributeValue]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributeValue](
	[ProductID] [int] NOT NULL,
	[AttributeValueID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[AttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartRemoveItem]
(@CartID char(36),
 @ProductID int)
AS
DELETE FROM ShoppingCart
WHERE CartID = @CartID and ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
(@CartID char(36))
AS
SELECT ISNULL(SUM(Product.Price * ShoppingCart.Quantity), 0)
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetItems]
(@CartID char(36))
AS
SELECT Product.ProductID, Product.Name, ShoppingCart.Attributes, Product.Price, ShoppingCart.Quantity,Product.Price * ShoppingCart.Quantity AS Subtotal
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartDeleteOldCarts]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartDeleteOldCarts]
(@Days smallint)
AS
DELETE FROM ShoppingCart
WHERE CartID IN
(SELECT CartID
FROM ShoppingCart
GROUP BY CartID
HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartCountOldCarts]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartCountOldCarts]
(@Days smallint)
AS
SELECT COUNT(CartID)
FROM ShoppingCart
WHERE CartID IN
(SELECT CartID
FROM ShoppingCart
GROUP BY CartID
HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ShoppingCartAddItem]
(@CartID char(36),
 @ProductID int,
 @Attributes nvarchar(1000))
AS
IF EXISTS
        (SELECT CartID
         FROM ShoppingCart
         WHERE ProductID = @ProductID AND CartID = @CartID)
    UPDATE ShoppingCart
    SET Quantity = Quantity + 1
    WHERE ProductID = @ProductID AND CartID = @CartID
ELSE
    IF EXISTS (SELECT Name FROM Product WHERE ProductID=@ProductID)
        INSERT INTO ShoppingCart (CartID, ProductID, Attributes, Quantity, DateAdded)
        VALUES (@CartID, @ProductID, @Attributes, 1, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCartRecommendations]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetShoppingCartRecommendations]
(@CartID CHAR(36),
 @DescriptionLength INT)
AS
--- Returns the product recommendations
SELECT ProductID,
       Name,
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description
FROM Product
WHERE ProductID IN
   (
   -- Returns the products that exist in a list of orders
   SELECT TOP 5 od1.ProductID AS Rank
   FROM OrderDetail od1 
     JOIN OrderDetail od2
       ON od1.OrderID=od2.OrderID
     JOIN ShoppingCart sp
       ON od2.ProductID = sp.ProductID
   WHERE sp.CartID = @CartID
        -- Must not include products that already exist in the visitor''s cart
      AND od1.ProductID NOT IN
      (
      -- Returns the products in the specified shopping cart
      SELECT ProductID 
      FROM ShoppingCart
      WHERE CartID = @CartID
      )
   -- Group the ProductID so we can calculate the rank
   GROUP BY od1.ProductID
   -- Order descending by rank
   ORDER BY COUNT(od1.ProductID) DESC
   )
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductRecommendations]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogGetProductRecommendations]
(@ProductID INT,
@DescriptionLength INT)
AS
SELECT ProductID,
Name,
CASE WHEN LEN(Description) <= @DescriptionLength THEN Description
ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END
AS Description
FROM Product
WHERE ProductID IN
(
SELECT TOP 5 od2.ProductID
FROM OrderDetail od1
JOIN OrderDetail od2 ON od1.OrderID = od2.OrderID
WHERE od1.ProductID = @ProductID AND od2.ProductID != @ProductID
GROUP BY od2.ProductID
ORDER BY COUNT(od2.ProductID) DESC
)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ShoppingCartUpdateItem]
(@CartID char(36),
 @ProductID int,
 @Quantity int)
AS
IF @Quantity <= 0
  EXEC ShoppingCartRemoveItem @CartID, @ProductID
ELSE
  UPDATE ShoppingCart
  SET Quantity = @Quantity, DateAdded = GETDATE()
  WHERE ProductID = @ProductID AND CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnDeptPromo]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsOnDeptPromo]
(@DepartmentID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT,
@ord int)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)

if(@ord <= 0)
begin
-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY ProductID) AS Row,
       ProductID, Name, SUBSTRING(Description, 1, @DescriptionLength)
+ '...' AS Description,
       Price, Thumbnail, Image, PromoFront, PromoDept
FROM
(SELECT DISTINCT top 500 Product.ProductID, Product.Name,
       CASE WHEN LEN(Product.Description) <= @DescriptionLength 
            THEN Product.Description 
            ELSE SUBSTRING(Product.Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
  FROM Product INNER JOIN ProductCategory
                      ON Product.ProductID = ProductCategory.ProductID
              INNER JOIN Category
                      ON ProductCategory.CategoryID = Category.CategoryID
  WHERE Product.PromoDept = 1
   AND Category.DepartmentID = @DepartmentID
   order by price asc
) AS ProductOnDepPr

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
  order by price asc
end
else
begin
-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY ProductID) AS Row,
       ProductID, Name, SUBSTRING(Description, 1, @DescriptionLength)
+ '...' AS Description,
       Price, Thumbnail, Image, PromoFront, PromoDept
FROM
(SELECT DISTINCT top 500 Product.ProductID, Product.Name,
       CASE WHEN LEN(Product.Description) <= @DescriptionLength 
            THEN Product.Description 
            ELSE SUBSTRING(Product.Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
  FROM Product INNER JOIN ProductCategory
                      ON Product.ProductID = ProductCategory.ProductID
              INNER JOIN Category
                      ON ProductCategory.CategoryID = Category.CategoryID
  WHERE Product.PromoDept = 1
   AND Category.DepartmentID = @DepartmentID
   order by price desc
) AS ProductOnDepPr

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
  order by price desc
end
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsInCategory]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsInCategory]
(@CategoryID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT,
@orb int)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)

if(@orb <= 0 )
begin
-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       Product.ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID
ORDER BY Product.Price asc

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
ORDER BY Price asc

end
else
begin 
-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       Product.ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID
ORDER BY Product.Price desc

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
ORDER BY Price desc
end
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductAttributeValues]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create CatalogGetProductAttributeValues stored procedure
CREATE PROCEDURE [dbo].[CatalogGetProductAttributeValues]
(@ProductId INT)
AS
SELECT a.Name AS AttributeName,
       av.AttributeValueID, 
       av.Value AS AttributeValue
FROM AttributeValue av
INNER JOIN attribute a ON av.AttributeID = a.AttributeID
WHERE av.AttributeValueID IN
  (SELECT AttributeValueID
   FROM ProductAttributeValue
   WHERE ProductID = @ProductID)
ORDER BY a.Name;
GO
/****** Object:  View [dbo].[ProdsInCats]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProdsInCats]
AS
SELECT dbo.Product.ProductID, dbo.Product.Name, dbo.Product.Description, dbo.Product.Price, dbo.Product.Thumbnail, dbo.ProductCategory.CategoryID
FROM   dbo.Product INNER JOIN
            dbo.ProductCategory ON dbo.Product.ProductID = dbo.ProductCategory.ProductID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 156
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ProductCategory"
            Begin Extent = 
               Top = 9
               Left = 307
               Bottom = 114
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdsInCats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdsInCats'
GO
/****** Object:  StoredProcedure [dbo].[CatalogRemoveProductFromCategory]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogRemoveProductFromCategory]
(@ProductID int, @CategoryID int)
AS
DELETE FROM ProductCategory
WHERE CategoryID = @CategoryID AND ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogMoveProductToCategory]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogMoveProductToCategory]
(@ProductID int, @OldCategoryID int, @NewCategoryID int)
AS
UPDATE ProductCategory
SET CategoryID = @NewCategoryID
WHERE CategoryID = @OldCategoryID
  AND ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithProduct]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoriesWithProduct]
(@ProductID int)
AS
SELECT Category.CategoryID, Name
FROM Category INNER JOIN ProductCategory
ON Category.CategoryID = ProductCategory.CategoryID
WHERE ProductCategory.ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithoutProduct]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoriesWithoutProduct]
(@ProductID int)
AS
SELECT CategoryID, Name
FROM Category
WHERE CategoryID NOT IN
   (SELECT Category.CategoryID
    FROM Category INNER JOIN ProductCategory
    ON Category.CategoryID = ProductCategory.CategoryID
    WHERE ProductCategory.ProductID = @ProductID)
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetAllProductsInCategory]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetAllProductsInCategory]
(@CategoryID INT)
AS
SELECT Product.ProductID, Name, Description, Price, Thumbnail, 
       Image, PromoDept, PromoFront
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteProduct]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteProduct]
(@ProductID int)
AS
DELETE FROM ShoppingCart WHERE ProductID=@ProductID
DELETE FROM ProductCategory WHERE ProductID=@ProductID
DELETE FROM Product where ProductID=@ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogCreateProduct]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogCreateProduct]
(@CategoryID INT,
 @ProductName NVARCHAR(50),
 @ProductDescription NVARCHAR(MAX),
 @Price MONEY,
 @Thumbnail NVARCHAR(50),
 @Image NVARCHAR(50),
 @PromoFront BIT,
 @PromoDept BIT)
AS
-- Declare a variable to hold the generated product ID
DECLARE @ProductID int
-- Create the new product entry

INSERT INTO Product 
    (Name, 
     Description, 
     Price, 
     Thumbnail, 
     Image,
     PromoFront, 
     PromoDept)
VALUES 
    (@ProductName, 
     @ProductDescription, 
     @Price, 
     @Thumbnail, 
     @Image,
     @PromoFront, 
     @PromoDept)
-- Save the generated product ID to a variable
SELECT @ProductID = @@Identity
-- Associate the product with a category
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[CatalogAssignProductToCategory]    Script Date: 12/05/2013 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogAssignProductToCategory]
(@ProductID int, @CategoryID int)
AS
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
/****** Object:  ForeignKey [FK_Category_Department]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Department]
GO
/****** Object:  ForeignKey [FK_AttributeValue_Attribute]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[AttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_AttributeValue_Attribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attribute] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributeValue] CHECK CONSTRAINT [FK_AttributeValue_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Category]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Product]    Script Date: 12/05/2013 22:53:46 ******/
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_AttributeValue]    Script Date: 12/05/2013 22:53:47 ******/
ALTER TABLE [dbo].[ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeValue_AttributeValue] FOREIGN KEY([AttributeValueID])
REFERENCES [dbo].[AttributeValue] ([AttributeValueID])
GO
ALTER TABLE [dbo].[ProductAttributeValue] CHECK CONSTRAINT [FK_ProductAttributeValue_AttributeValue]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_Product]    Script Date: 12/05/2013 22:53:47 ******/
ALTER TABLE [dbo].[ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeValue_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductAttributeValue] CHECK CONSTRAINT [FK_ProductAttributeValue_Product]
GO
