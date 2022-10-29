
CREATE DATABASE [MidtermDataModelingCSCI381]
CONTAINMENT = NONE
ON PRIMARY
( 
	NAME = 'MidtermDataModelingCSCI381', 
	FILENAME = '/var/opt/mssql/data/MidtermDataModelingCSCI381.mdf', 
	SIZE = 8192, 
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 65536
) 
LOG ON 
( 
	NAME = 'MidtermDataModelingCSCI381_log', 
	FILENAME = '/var/opt/mssql/log/MidtermDataModelingCSCI381_log.ldf', 
	SIZE = 204800, 
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 65536
) 
COLLATE SQL_Latin1_General_CP1_CI_AS
WITH 
	TRUSTWORTHY OFF,
	DB_CHAINING OFF,
	FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
go

EXEC sp_db_vardecimal_storage_format [MidtermDataModelingCSCI381],'ON'
go

USE [MidtermDataModelingCSCI381]
go

EXECUTE sys.sp_cdc_disable_db 
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET
ONLINE,
MULTI_USER ,
READ_WRITE,
PARAMETERIZATION SIMPLE,
DATE_CORRELATION_OPTIMIZATION OFF,
DELAYED_DURABILITY = DISABLED,
MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET CURSOR_CLOSE_ON_COMMIT OFF,
CURSOR_DEFAULT GLOBAL,
AUTO_CLOSE OFF,
AUTO_CREATE_STATISTICS ON,
AUTO_SHRINK OFF,
AUTO_UPDATE_STATISTICS ON,
AUTO_UPDATE_STATISTICS_ASYNC OFF,
ANSI_NULL_DEFAULT OFF,
ANSI_NULLS OFF,
ANSI_PADDING OFF,
ANSI_WARNINGS OFF,
ARITHABORT OFF,
CONCAT_NULL_YIELDS_NULL OFF,
NUMERIC_ROUNDABORT OFF,
QUOTED_IDENTIFIER OFF,
RECURSIVE_TRIGGERS OFF,
RECOVERY FULL,
TORN_PAGE_DETECTION OFF
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET ALLOW_SNAPSHOT_ISOLATION OFF
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET READ_COMMITTED_SNAPSHOT OFF
go

CREATE SCHEMA [Audit]
go

CREATE SCHEMA [HumanResources]
go

CREATE SCHEMA [Production]
go

CREATE SCHEMA [Sales]
go

CREATE SCHEMA [SystemVersioned]
go

CREATE SCHEMA [Triggered]
go

CREATE SCHEMA [Udt]
go

CREATE SCHEMA [DbSecurity]
go

CREATE TYPE [Udt].[Address]
	FROM NVARCHAR(60) NULL
go

CREATE TYPE [Udt].[CategoryName]
	FROM NVARCHAR(15) NULL
go

CREATE TYPE [Udt].[City]
	FROM NVARCHAR(15) NULL
go

CREATE TYPE [Udt].[CompanyName]
	FROM NVARCHAR(40) NULL
go

CREATE TYPE [Udt].[ContactName]
	FROM NVARCHAR(30) NULL
go

CREATE TYPE [Udt].[ContactTitle]
	FROM NVARCHAR(30) NULL
go

CREATE TYPE [Udt].[Country]
	FROM NVARCHAR(15) NULL
go

CREATE TYPE [Udt].[Currency]
	FROM MONEY NULL
go

CREATE TYPE [Udt].[DateYYYYMMDD]
	FROM DATE NOT NULL
go

CREATE TYPE [Udt].[Description]
	FROM NVARCHAR(200) NULL
go

CREATE TYPE [Udt].[FirstName]
	FROM NVARCHAR(25) NULL
go

CREATE TYPE [Udt].[FlagBit]
	FROM BIT NULL
go

CREATE TYPE [Udt].[LastName]
	FROM NVARCHAR(25) NULL
go

CREATE TYPE [Udt].[Name]
	FROM NVARCHAR(40) NULL
go

CREATE TYPE [Udt].[Note]
	FROM NVARCHAR(200) NULL
go

CREATE TYPE [Udt].[Percentage]
	FROM NUMERIC(4,3) NULL
go

CREATE TYPE [Udt].[PostalCode]
	FROM NVARCHAR(10) NULL
go

CREATE TYPE [Udt].[ProductName]
	FROM NVARCHAR(40) NULL
go

CREATE TYPE [Udt].[QuantitySmall]
	FROM SMALLINT NULL
go

CREATE TYPE [Udt].[Region]
	FROM NVARCHAR(15) NULL
go

CREATE TYPE [Udt].[SequenceNo]
	FROM INT NULL
go

CREATE TYPE [Udt].[SurrogateKeyInt]
	FROM INT NULL
go

CREATE TYPE [Udt].[TelephoneNumber]
	FROM NVARCHAR(24) NULL
go

CREATE TYPE [Udt].[Title]
	FROM NVARCHAR(30) NOT NULL
go

CREATE TYPE [Udt].[TitleOfCourtesy]
	FROM NVARCHAR(5) NOT NULL
go

CREATE TYPE [Udt].[TimeStampNow]
	FROM DATETIME2(7) NOT NULL
go

CREATE TYPE [Udt].[FlagChar]
	FROM CHAR(1) NOT NULL
go

CREATE TYPE [dReversedMidterm]
	FROM CHAR(18) NULL
go

CREATE TYPE [dDateTime]
	FROM DATETIME NULL
go

CREATE TYPE [dString]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [sdClassTime]
	FROM DATETIME NULL
go

CREATE TYPE [sdGM_LastName]
	FROM VARCHAR(20) NOT NULL
go

CREATE TYPE [sdIndividualProject]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [sdGroupName]
	FROM VARCHAR(20) NOT NULL
go

CREATE TYPE [sdDatetime2_Default]
	FROM DATETIME NULL
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET ENCRYPTION OFF
go

ALTER DATABASE [MidtermDataModelingCSCI381]
SET CHANGE_TRACKING = OFF
go

ALTER DATABASE [MidtermDataModelingCSCI381]
 MODIFY FILEGROUP [PRIMARY] ReadWrite 
go

CREATE TABLE [Production].[Category]
( 
	[CategoryId]         [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[CategoryName]       [Udt].[CategoryName]  NOT NULL ,
	[Description]        [Udt].[Description]  NOT NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1045219773]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1986415118]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [HumanResources].[Employee]
( 
	[EmployeeId]         [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[EmployeeLastName]   [Udt].[LastName]  NOT NULL ,
	[EmployeeFirstName]  [Udt].[FirstName]  NOT NULL ,
	[EmployeeTitle]      [Udt].[Title]  NOT NULL ,
	[EmployeeTitleOfCourtesy] [Udt].[TitleOfCourtesy]  NULL ,
	[BirthDate]          [Udt].[DateYYYYMMDD]  NOT NULL ,
	[HireDate]           [Udt].[DateYYYYMMDD]  NOT NULL ,
	[EmployeeAddress]    [Udt].[Address]  NOT NULL ,
	[EmployeeCity]       [Udt].[City]  NOT NULL ,
	[EmployeeRegion]     [Udt].[Region]  NULL ,
	[EmployeePostalCode] [Udt].[PostalCode]  NOT NULL ,
	[EmployeeCountry]    [Udt].[Country]  NOT NULL ,
	[EmployeePhoneNumber] [Udt].[TelephoneNumber]  NOT NULL ,
	[EmployeeManagerId]  [Udt].[SurrogateKeyInt]  NULL ,
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1262662606]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2022490120]
		 DEFAULT  sysdatetime()
)
go

ALTER TABLE [HumanResources].[Employee]
	 WITH CHECK ADD CONSTRAINT [CHK_birthdate] CHECK  ( BirthDate <= CONVERT([date],sysdatetime )
go

CREATE TABLE [Triggered].[Employee]
( 
	[EmployeeId]         [Udt].[SurrogateKeyInt]  NOT NULL ,
	[EmployeeFullName]   [Udt].[Name]  NOT NULL ,
	[Department]         [Udt].[Name]  NOT NULL ,
	[Salary]             [Udt].[Currency]  NOT NULL ,
	[Notes]              [Udt].[Note]  NOT NULL ,
	[IsDeleted]          [Udt].[FlagChar]  NULL 
	CONSTRAINT [DF__Employee__IsDele__6B24EA82]
		 DEFAULT  'N',
	[TransactionNumber]  [Udt].[SequenceNo]  NULL 
	CONSTRAINT [DF__Employee__Transa__6C190EBB]
		 DEFAULT  1,
	[UserAuthenticatedKey] [Udt].[SurrogateKeyInt]  NULL 
	CONSTRAINT [DF__Employee__UserAu__6D0D32F4]
		 DEFAULT  37,
	[SysStartTime]       [Udt].[TimeStampNow]  NOT NULL 
	CONSTRAINT [DF__Employee__SysSta__6E01572D]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [Udt].[TimeStampNow]  NOT NULL 
	CONSTRAINT [DF__Employee__SysEnd__6EF57B66]
		 DEFAULT  '99991231 23:59:59',
	[TimestampRowChanged] [Udt].[TimeStampNow]  NULL 
	CONSTRAINT [DF__Employee__Timest__6FE99F9F]
		 DEFAULT  sysdatetime(),
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1262662606]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2022490120]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [dbo].[Nums]
( 
	[N]                  [Udt].[SurrogateKeyInt]  NOT NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1448532682]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_271473047]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Sales].[Order]
( 
	[OrderId]            [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[EmployeeId]         [Udt].[SurrogateKeyInt]  NOT NULL ,
	[ShipperId]          [Udt].[SurrogateKeyInt]  NOT NULL ,
	[OrderDate]          [Udt].[DateYYYYMMDD]  NOT NULL ,
	[RequiredDate]       [Udt].[DateYYYYMMDD]  NOT NULL ,
	[ShipToDate]         [Udt].[DateYYYYMMDD]  NULL ,
	[Freight]            [Udt].[Currency]  NOT NULL 
	CONSTRAINT [DFT_Orders_freight]
		 DEFAULT  0,
	[ShipToName]         [Udt].[ContactName]  NOT NULL ,
	[ShipToAddress]      [Udt].[Address]  NOT NULL ,
	[ShipToCity]         [Udt].[City]  NOT NULL ,
	[ShipToRegion]       [Udt].[Region]  NULL ,
	[ShipToPostalCode]   [Udt].[PostalCode]  NULL ,
	[ShipToCountry]      [Udt].[Country]  NOT NULL ,
	[UserAuthenticationId] int  NULL ,
	[DateAdded]          [sdDatetime2_Default]  NULL 
	CONSTRAINT [DF_SysDatetime_1535456830]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default]  NULL 
	CONSTRAINT [DF_SysDatetime_142376326]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Sales].[OrderDetail]
( 
	[OrderId]            [Udt].[SurrogateKeyInt]  NOT NULL ,
	[ProductId]          [Udt].[SurrogateKeyInt]  NOT NULL ,
	[UnitPrice]          [Udt].[Currency]  NOT NULL 
	CONSTRAINT [DFT_OrderDetails_UnitPrice]
		 DEFAULT  0,
	[Quantity]           [Udt].[QuantitySmall]  NOT NULL 
	CONSTRAINT [DFT_OrderDetails_Quantity]
		 DEFAULT  1,
	[DiscountPercentage] [Udt].[Percentage]  NOT NULL 
	CONSTRAINT [DFT_OrderDetails_DiscountPercentage]
		 DEFAULT  0,
	[DateAdded]          [sdDatetime2_Default]  NULL 
	CONSTRAINT [DF_SysDatetime_417499261]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default]  NULL 
	CONSTRAINT [DF_SysDatetime_1024400060]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

ALTER TABLE [Sales].[OrderDetail]
	 WITH CHECK ADD CONSTRAINT [CHK_Quantity] CHECK  ( [Quantity]>(0) )
go

ALTER TABLE [Sales].[OrderDetail]
	 WITH CHECK ADD CONSTRAINT [CHK_DiscountPercentage] CHECK  ( DiscountPercentage BETWEEN 0 AND 1 )
go

CREATE TABLE [Production].[Product]
( 
	[ProductId]          [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[ProductName]        [Udt].[ProductName]  NOT NULL ,
	[SupplierId]         [Udt].[SurrogateKeyInt]  NOT NULL ,
	[CategoryId]         [Udt].[SurrogateKeyInt]  NOT NULL ,
	[UnitPrice]          [Udt].[Currency]  NOT NULL 
	CONSTRAINT [DFT_Products_unitprice]
		 DEFAULT  0,
	[Discontinued]       [Udt].[FlagBit]  NOT NULL 
	CONSTRAINT [DFT_Products_discontinued]
		 DEFAULT  0,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_965924046]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2023649255]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

ALTER TABLE [Production].[Product]
	 WITH CHECK ADD CONSTRAINT [CHK_Products_unitprice] CHECK  ( UnitPrice >= 0 )
go

CREATE TABLE [Sales].[Shipper]
( 
	[ShipperId]          [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[ShipperCompanyName] [Udt].[CompanyName]  NOT NULL ,
	[PhoneNumber]        [Udt].[TelephoneNumber]  NOT NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1099355862]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1888910309]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Production].[Supplier]
( 
	[SupplierId]         [Udt].[SurrogateKeyInt]  IDENTITY ( 1,1 )  NOT NULL ,
	[SupplierCompanyName] [Udt].[CompanyName]  NOT NULL ,
	[SupplierContactName] [Udt].[ContactName]  NOT NULL ,
	[SupplierContactTitle] [Udt].[ContactTitle]  NOT NULL ,
	[SupplierAddress]    [Udt].[Address]  NOT NULL ,
	[SupplierCity]       [Udt].[City]  NOT NULL ,
	[SupplierRegion]     [Udt].[Region]  NULL ,
	[SupplierPostalCode] [Udt].[PostalCode]  NULL ,
	[SupplierCountry]    [Udt].[Country]  NOT NULL ,
	[SupplierPhoneNumber] [Udt].[TelephoneNumber]  NOT NULL ,
	[SupplierFaxNumber]  [Udt].[TelephoneNumber]  NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_976731086]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2023607040]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [DbSecurity].[UserAuthorization]
( 
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL ,
	[ClassTime]          [sdClassTime] 
	CONSTRAINT [DF_classTime_1923151655]
		 DEFAULT  9:15,
	[Individual_project] [sdIndividualProject]  NOT NULL 
	CONSTRAINT [DF_IndividualProject_1246747353]
		 DEFAULT  CSCI381 Midterm Project,
	[GroupMemberLastName] [sdGM_LastName] ,
	[GroupMemberFirstName] [Udt].[FirstName] ,
	[GroupName]          [sdGroupName] ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1193799135]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1737546446]
		 DEFAULT  sysdatetime()
)
go

CREATE TABLE [Audit].[VersionedEmployeeHistory]
( 
	[EmployeeId]         int  NOT NULL ,
	[EmployeeFullName]   varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Department]         varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Salary]             money  NOT NULL ,
	[Notes]              varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[SysStart]           datetime2  NOT NULL ,
	[SysEnd]             datetime2  NOT NULL ,
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2121443072]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1180071267]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL 
)
go

ALTER TABLE [Production].[Category]
	ADD CONSTRAINT [PK_Categories] PRIMARY KEY  CLUSTERED ([CategoryId] ASC)
go

ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [PK_Employees] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC)
go

CREATE TABLE [SystemVersioned].[Employee]
( 
	[EmployeeId]         int  NOT NULL ,
	[EmployeeFullName]   varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Department]         varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Salary]             money  NOT NULL ,
	[Notes]              varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[SysStart]           datetime2  GENERATED ALWAYS AS ROW START HIDDEN  NOT NULL 
	CONSTRAINT [DFT_Employees_SysStart]
		 DEFAULT  '19000101',
	[SysEnd]             datetime2  GENERATED ALWAYS AS ROW END HIDDEN  NOT NULL 
	CONSTRAINT [DFT_Employees_SysEnd]
		 DEFAULT  '99991231 23:59:59',
	[DateAdded]          [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_1262662606]
		 DEFAULT  sysdatetime(),
	[DateOfLastUpdate]   [sdDatetime2_Default] 
	CONSTRAINT [DF_SysDatetime_2022490120]
		 DEFAULT  sysdatetime(),
	[UserAuthorizationId] [Udt].[SurrogateKeyInt]  NOT NULL ,
	CONSTRAINT [PK_EmployeeVersioned] PRIMARY KEY  NONCLUSTERED ([EmployeeId] ASC),
	PERIOD FOR SYSTEM_TIME (SysStart,SysEnd)
)
WITH 
(
	SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audit].[VersionedEmployeeHistory], DATA_CONSISTENCY_CHECK = OFF)
)
go

ALTER TABLE [Triggered].[Employee]
	ADD CONSTRAINT [PK_TriggeredEmployee] PRIMARY KEY  NONCLUSTERED ([EmployeeId] ASC)
go

CREATE CLUSTERED INDEX [ix_Employees] ON [Triggered].[Employee]
( 
	[EmployeeId]          ASC,
	[SysStartTime]        ASC,
	[SysEndTime]          ASC
)
go

ALTER TABLE [dbo].[Nums]
	ADD CONSTRAINT [PK_Nums] PRIMARY KEY  CLUSTERED ([N] ASC)
go

ALTER TABLE [Sales].[Order]
	ADD CONSTRAINT [PK_Orders] PRIMARY KEY  CLUSTERED ([OrderId] ASC)
go

ALTER TABLE [Sales].[OrderDetail]
	ADD CONSTRAINT [PK_OrderDetails] PRIMARY KEY  CLUSTERED ([OrderId] ASC,[ProductId] ASC)
go

ALTER TABLE [Production].[Product]
	ADD CONSTRAINT [PK_Products] PRIMARY KEY  CLUSTERED ([ProductId] ASC)
go

ALTER TABLE [Sales].[Shipper]
	ADD CONSTRAINT [PK_Shippers] PRIMARY KEY  CLUSTERED ([ShipperId] ASC)
go

ALTER TABLE [Production].[Supplier]
	ADD CONSTRAINT [PK_Suppliers] PRIMARY KEY  CLUSTERED ([SupplierId] ASC)
go

ALTER TABLE [DbSecurity].[UserAuthorization]
	ADD CONSTRAINT [XPKUserAuthorization] PRIMARY KEY  CLUSTERED ([UserAuthorizationId] ASC)
go

CREATE CLUSTERED INDEX [ix_VersionedEmployeeHistory] ON [Audit].[VersionedEmployeeHistory]
( 
	[SysEnd]              ASC,
	[SysStart]            ASC
)
go


ALTER TABLE [HumanResources].[Employee] WITH CHECK 
	ADD CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([EmployeeManagerId]) REFERENCES [HumanResources].[Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [HumanResources].[Employee]
	  WITH CHECK CHECK CONSTRAINT [FK_Employees_Employees]
go


ALTER TABLE [Sales].[Order] WITH CHECK 
	ADD CONSTRAINT [FK_Order_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HumanResources].[Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Sales].[Order]
	  WITH CHECK CHECK CONSTRAINT [FK_Order_Employee]
go

ALTER TABLE [Sales].[Order] WITH CHECK 
	ADD CONSTRAINT [FK_Order_Shipper] FOREIGN KEY ([ShipperId]) REFERENCES [Sales].[Shipper]([ShipperId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Sales].[Order]
	  WITH CHECK CHECK CONSTRAINT [FK_Order_Shipper]
go


ALTER TABLE [Sales].[OrderDetail] WITH CHECK 
	ADD CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY ([OrderId]) REFERENCES [Sales].[Order]([OrderId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Sales].[OrderDetail]
	  WITH CHECK CHECK CONSTRAINT [FK_OrderDetail_Order]
go

ALTER TABLE [Sales].[OrderDetail] WITH CHECK 
	ADD CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY ([ProductId]) REFERENCES [Production].[Product]([ProductId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Sales].[OrderDetail]
	  WITH CHECK CHECK CONSTRAINT [FK_OrderDetail_Product]
go


ALTER TABLE [Production].[Product] WITH CHECK 
	ADD CONSTRAINT [FK_Product_Category] FOREIGN KEY ([CategoryId]) REFERENCES [Production].[Category]([CategoryId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Production].[Product]
	  WITH CHECK CHECK CONSTRAINT [FK_Product_Category]
go

ALTER TABLE [Production].[Product] WITH CHECK 
	ADD CONSTRAINT [FK_product_supplier] FOREIGN KEY ([SupplierId]) REFERENCES [Production].[Supplier]([SupplierId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Production].[Product]
	  WITH CHECK CHECK CONSTRAINT [FK_product_supplier]
go

CREATE TRIGGER Triggered.[uTdu_AuditTriggeredEmployeeHistory] ON Triggered.Employee
   WITH 
 EXECUTE AS CALLER  AFTER DELETE,UPDATE 
  
  AS

begin
			declare @action char(1) = 'I';
			declare @IsDeleted char(1) = 'N';
			declare @DeletedMessage char(25) = 'Rows has been deleted';
			declare @SysStartTimeAsSysEnd datetime2;
		   --
			if (exists (select * from inserted) and exists (select * from deleted))
			begin
				set @action = 'U';
				SELECT @SysStartTimeAsSysEnd = Inserted.SysStartTime FROM Inserted
			end;
			else if (exists (select * from deleted))
			begin
				set @action = 'D';
				set @IsDeleted = 'Y';
			end;
			else
				set @action = 'I';

			if (@action <> 'I')
				insert into Triggered.AuditTriggeredEmployeeHistory
				(
					AuditTriggeredEmployeeHistoryTimestamp
				  , TriggerOption
				  , EmployeeId
				  , EmployeeFullName
				  , Department
				  , Salary
				  , Notes
				  , IsDeleted
				  , TransactionNumber
				  , UserAuthenticatedKey
				  , TimestampRowChanged
				  , SysStartTime
				  , SysEndTime
				)
				select sysdatetime()       as AuditTriggeredEmployeeHistoryTimestamp
					 , @action             as TriggerOption
					 , EmployeeId
					 , EmployeeFullName
					 , Department
					 , Salary
					 , case
						   when @action <> 'D' then
							   Deleted.Notes
						   else
							   @DeletedMessage
					   end
					 , @IsDeleted          as IsDeleted
					 , Deleted.TransactionNumber
					 , UserAuthenticatedKey
					 , TimestampRowChanged
					 , Deleted.SysStartTime
					 , case
						   when @action <> 'D' then
							  @SysStartTimeAsSysEnd
						   else
							   sysdatetime()
					   end as SysEndTime
				from Deleted;
		end;

 
go


ENABLE TRIGGER [Triggered].[uTdu_AuditTriggeredEmployeeHistory] ON [Triggered].Employee
go


CREATE TRIGGER Production.tD_Category ON Production.Category FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Category */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.Category  Production.Product on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000135d0", PARENT_OWNER="Production", PARENT_TABLE="Category"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Product_Category", FK_COLUMNS="CategoryId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.Product
      WHERE
        /*  %JoinFKPK(Production.Product,deleted," = "," AND") */
        Production.Product.CategoryId = deleted.CategoryId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.Category because Production.Product exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Production.tU_Category ON Production.Category FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Category */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCategoryId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.Category  Production.Product on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00015552", PARENT_OWNER="Production", PARENT_TABLE="Category"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Product_Category", FK_COLUMNS="CategoryId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CategoryId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.Product
      WHERE
        /*  %JoinFKPK(Production.Product,deleted," = "," AND") */
        Production.Product.CategoryId = deleted.CategoryId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.Category because Production.Product exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER HumanResources.tD_Employee ON HumanResources.Employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* HumanResources.Employee  Sales.Order on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003fd32", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Employee", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.Order
      WHERE
        /*  %JoinFKPK(Sales.Order,deleted," = "," AND") */
        Sales.Order.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Employee because Sales.Order exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employees_Employees", FK_COLUMNS="EmployeeManagerId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeeManagerId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Employee because HumanResources.Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employees_Employees", FK_COLUMNS="EmployeeManagerId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Employee," = "," AND") */
        deleted.EmployeeManagerId = HumanResources.Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Employee
          WHERE
            /* %JoinFKPK(HumanResources.Employee,HumanResources.Employee," = "," AND") */
            HumanResources.Employee.EmployeeManagerId = HumanResources.Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Employee because HumanResources.Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER HumanResources.tU_Employee ON HumanResources.Employee FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Employee */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* HumanResources.Employee  Sales.Order on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004602d", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Employee", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.Order
      WHERE
        /*  %JoinFKPK(Sales.Order,deleted," = "," AND") */
        Sales.Order.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Employee because Sales.Order exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  HumanResources.Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employees_Employees", FK_COLUMNS="EmployeeManagerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeeManagerId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  HumanResources.Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employees_Employees", FK_COLUMNS="EmployeeManagerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeManagerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Employee
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Employee) */
          inserted.EmployeeManagerId = HumanResources.Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeManagerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_Order ON Sales.Order FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Order */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Sales.Order  Sales.OrderDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003deee", PARENT_OWNER="Sales", PARENT_TABLE="Order"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Order", FK_COLUMNS="OrderId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.OrderDetail
      WHERE
        /*  %JoinFKPK(Sales.OrderDetail,deleted," = "," AND") */
        Sales.OrderDetail.OrderId = deleted.OrderId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Sales.Order because Sales.OrderDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Sales.Shipper  Sales.Order on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Shipper"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Shipper", FK_COLUMNS="ShipperId" */
    IF EXISTS (SELECT * FROM deleted,Sales.Shipper
      WHERE
        /* %JoinFKPK(deleted,Sales.Shipper," = "," AND") */
        deleted.ShipperId = Sales.Shipper.ShipperId AND
        NOT EXISTS (
          SELECT * FROM Sales.Order
          WHERE
            /* %JoinFKPK(Sales.Order,Sales.Shipper," = "," AND") */
            Sales.Order.ShipperId = Sales.Shipper.ShipperId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.Order because Sales.Shipper exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  Sales.Order on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Employee", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Employee," = "," AND") */
        deleted.EmployeeId = HumanResources.Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM Sales.Order
          WHERE
            /* %JoinFKPK(Sales.Order,HumanResources.Employee," = "," AND") */
            Sales.Order.EmployeeId = HumanResources.Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.Order because HumanResources.Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Sales.tU_Order ON Sales.Order FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Order */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrderId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Sales.Order  Sales.OrderDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00042363", PARENT_OWNER="Sales", PARENT_TABLE="Order"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Order", FK_COLUMNS="OrderId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(OrderId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.OrderDetail
      WHERE
        /*  %JoinFKPK(Sales.OrderDetail,deleted," = "," AND") */
        Sales.OrderDetail.OrderId = deleted.OrderId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Sales.Order because Sales.OrderDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Sales.Shipper  Sales.Order on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Shipper"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Shipper", FK_COLUMNS="ShipperId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ShipperId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Sales.Shipper
        WHERE
          /* %JoinFKPK(inserted,Sales.Shipper) */
          inserted.ShipperId = Sales.Shipper.ShipperId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.Order because Sales.Shipper does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  Sales.Order on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Employee", FK_COLUMNS="EmployeeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Employee
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Employee) */
          inserted.EmployeeId = HumanResources.Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.Order because HumanResources.Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_OrderDetail ON Sales.OrderDetail FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on OrderDetail */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.Product  Sales.OrderDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d352", PARENT_OWNER="Production", PARENT_TABLE="Product"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Product", FK_COLUMNS="ProductId" */
    IF EXISTS (SELECT * FROM deleted,Production.Product
      WHERE
        /* %JoinFKPK(deleted,Production.Product," = "," AND") */
        deleted.ProductId = Production.Product.ProductId AND
        NOT EXISTS (
          SELECT * FROM Sales.OrderDetail
          WHERE
            /* %JoinFKPK(Sales.OrderDetail,Production.Product," = "," AND") */
            Sales.OrderDetail.ProductId = Production.Product.ProductId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.OrderDetail because Production.Product exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Sales.Order  Sales.OrderDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Order"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Order", FK_COLUMNS="OrderId" */
    IF EXISTS (SELECT * FROM deleted,Sales.Order
      WHERE
        /* %JoinFKPK(deleted,Sales.Order," = "," AND") */
        deleted.OrderId = Sales.Order.OrderId AND
        NOT EXISTS (
          SELECT * FROM Sales.OrderDetail
          WHERE
            /* %JoinFKPK(Sales.OrderDetail,Sales.Order," = "," AND") */
            Sales.OrderDetail.OrderId = Sales.Order.OrderId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.OrderDetail because Sales.Order exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Sales.tU_OrderDetail ON Sales.OrderDetail FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on OrderDetail */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrderId Udt.SurrogateKeyInt, 
           @insProductId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.Product  Sales.OrderDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f2c5", PARENT_OWNER="Production", PARENT_TABLE="Product"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Product", FK_COLUMNS="ProductId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ProductId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.Product
        WHERE
          /* %JoinFKPK(inserted,Production.Product) */
          inserted.ProductId = Production.Product.ProductId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.OrderDetail because Production.Product does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Sales.Order  Sales.OrderDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Order"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Order", FK_COLUMNS="OrderId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(OrderId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Sales.Order
        WHERE
          /* %JoinFKPK(inserted,Sales.Order) */
          inserted.OrderId = Sales.Order.OrderId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.OrderDetail because Sales.Order does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tD_Product ON Production.Product FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Product */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.Product  Sales.OrderDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00040d95", PARENT_OWNER="Production", PARENT_TABLE="Product"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Product", FK_COLUMNS="ProductId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.OrderDetail
      WHERE
        /*  %JoinFKPK(Sales.OrderDetail,deleted," = "," AND") */
        Sales.OrderDetail.ProductId = deleted.ProductId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.Product because Sales.OrderDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Production.Supplier  Production.Product on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="Supplier"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_product_supplier", FK_COLUMNS="SupplierId" */
    IF EXISTS (SELECT * FROM deleted,Production.Supplier
      WHERE
        /* %JoinFKPK(deleted,Production.Supplier," = "," AND") */
        deleted.SupplierId = Production.Supplier.SupplierId AND
        NOT EXISTS (
          SELECT * FROM Production.Product
          WHERE
            /* %JoinFKPK(Production.Product,Production.Supplier," = "," AND") */
            Production.Product.SupplierId = Production.Supplier.SupplierId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.Product because Production.Supplier exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Production.Category  Production.Product on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="Category"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Product_Category", FK_COLUMNS="CategoryId" */
    IF EXISTS (SELECT * FROM deleted,Production.Category
      WHERE
        /* %JoinFKPK(deleted,Production.Category," = "," AND") */
        deleted.CategoryId = Production.Category.CategoryId AND
        NOT EXISTS (
          SELECT * FROM Production.Product
          WHERE
            /* %JoinFKPK(Production.Product,Production.Category," = "," AND") */
            Production.Product.CategoryId = Production.Category.CategoryId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.Product because Production.Category exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Production.tU_Product ON Production.Product FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Product */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.Product  Sales.OrderDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000450c5", PARENT_OWNER="Production", PARENT_TABLE="Product"
    CHILD_OWNER="Sales", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_OrderDetail_Product", FK_COLUMNS="ProductId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ProductId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.OrderDetail
      WHERE
        /*  %JoinFKPK(Sales.OrderDetail,deleted," = "," AND") */
        Sales.OrderDetail.ProductId = deleted.ProductId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.Product because Sales.OrderDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Production.Supplier  Production.Product on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="Supplier"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_product_supplier", FK_COLUMNS="SupplierId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SupplierId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.Supplier
        WHERE
          /* %JoinFKPK(inserted,Production.Supplier) */
          inserted.SupplierId = Production.Supplier.SupplierId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.Product because Production.Supplier does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Production.Category  Production.Product on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="Category"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Product_Category", FK_COLUMNS="CategoryId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CategoryId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.Category
        WHERE
          /* %JoinFKPK(inserted,Production.Category) */
          inserted.CategoryId = Production.Category.CategoryId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.Product because Production.Category does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_Shipper ON Sales.Shipper FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Shipper */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Sales.Shipper  Sales.Order on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011722", PARENT_OWNER="Sales", PARENT_TABLE="Shipper"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Shipper", FK_COLUMNS="ShipperId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.Order
      WHERE
        /*  %JoinFKPK(Sales.Order,deleted," = "," AND") */
        Sales.Order.ShipperId = deleted.ShipperId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Sales.Shipper because Sales.Order exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Sales.tU_Shipper ON Sales.Shipper FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Shipper */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insShipperId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Sales.Shipper  Sales.Order on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000139a3", PARENT_OWNER="Sales", PARENT_TABLE="Shipper"
    CHILD_OWNER="Sales", CHILD_TABLE="Order"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Order_Shipper", FK_COLUMNS="ShipperId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ShipperId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.Order
      WHERE
        /*  %JoinFKPK(Sales.Order,deleted," = "," AND") */
        Sales.Order.ShipperId = deleted.ShipperId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Sales.Shipper because Sales.Order exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tD_Supplier ON Production.Supplier FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Supplier */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.Supplier  Production.Product on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000136d7", PARENT_OWNER="Production", PARENT_TABLE="Supplier"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_product_supplier", FK_COLUMNS="SupplierId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.Product
      WHERE
        /*  %JoinFKPK(Production.Product,deleted," = "," AND") */
        Production.Product.SupplierId = deleted.SupplierId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.Supplier because Production.Product exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER Production.tU_Supplier ON Production.Supplier FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Supplier */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSupplierId Udt.SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.Supplier  Production.Product on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00014e39", PARENT_OWNER="Production", PARENT_TABLE="Supplier"
    CHILD_OWNER="Production", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_product_supplier", FK_COLUMNS="SupplierId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SupplierId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.Product
      WHERE
        /*  %JoinFKPK(Production.Product,deleted," = "," AND") */
        Production.Product.SupplierId = deleted.SupplierId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.Supplier because Production.Product exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


