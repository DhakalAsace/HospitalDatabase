USE [master]
GO
/****** Object:  Database [MajorProject]    Script Date: 01-Dec-23 6:40:42 PM ******/
CREATE DATABASE [MajorProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MajorProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MajorProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MajorProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MajorProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MajorProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MajorProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MajorProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MajorProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MajorProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MajorProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MajorProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [MajorProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MajorProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MajorProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MajorProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MajorProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MajorProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MajorProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MajorProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MajorProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MajorProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MajorProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MajorProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MajorProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MajorProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MajorProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MajorProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MajorProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MajorProject] SET RECOVERY FULL 
GO
ALTER DATABASE [MajorProject] SET  MULTI_USER 
GO
ALTER DATABASE [MajorProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MajorProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MajorProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MajorProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MajorProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MajorProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MajorProject', N'ON'
GO
ALTER DATABASE [MajorProject] SET QUERY_STORE = OFF
GO
USE [MajorProject]
GO
/****** Object:  Table [dbo].[CostItem]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostItem](
	[CostItemID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CostCenterID] [int] NOT NULL,
	[Charge] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CostItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[FirstName] [varchar](16) NOT NULL,
	[MiddleName] [varchar](16) NULL,
	[LastName] [varchar](16) NOT NULL,
	[FinCode] [int] NOT NULL,
	[AddressLine1] [varchar](30) NOT NULL,
	[AddressLine2] [varchar](30) NULL,
	[City] [varchar](30) NOT NULL,
	[Province] [varchar](16) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Telephone] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientAdmission]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAdmission](
	[AdmissionDate] [date] NOT NULL,
	[PatientID] [int] NOT NULL,
	[PhysicianID] [int] NOT NULL,
	[BedLocation] [varchar](10) NOT NULL,
	[DischargeDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC,
	[AdmissionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[FinCode] [int] NOT NULL,
	[TreatmentNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Daily_Revenue_Report]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Daily_Revenue_Report] AS
SELECT 
    Transactions.[PatientID] AS "PATIENT-NO",
    CONCAT(Patient.[FirstName], ' ', Patient.[LastName]) AS "PATIENT-NAME",
    PatientAdmission.[BedLocation],
    Patient.[FinCode] AS "FIN. SOURCE",
    Transactions.[Date],
    SUM(CostItem.[Charge]) AS "TOTAL-CHARGE"
FROM 
    [MajorProject].[dbo].[Transactions] AS Transactions
LEFT JOIN 
    [MajorProject].[dbo].[Patient] AS Patient ON Patient.[PatientID] = Transactions.[PatientID]
LEFT JOIN
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON PatientAdmission.[PatientID] = Patient.[PatientID]
INNER JOIN 
    [MajorProject].[dbo].[CostItem] AS CostItem ON CostItem.[CostItemID] = Transactions.[ItemCode]
GROUP BY 
    Transactions.[PatientID],
    Patient.[FirstName],
    Patient.[LastName],
    PatientAdmission.[BedLocation],
    Patient.[FinCode],
    Transactions.[Date];
GO
/****** Object:  Table [dbo].[FinancialStatus]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialStatus](
	[Code] [int] NOT NULL,
	[InsurProvider] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostCenter]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostCenter](
	[CostCenterID] [int] NOT NULL,
	[Name] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CostCenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Revenue_Analysis]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Revenue_Analysis] AS
SELECT 
    CostCenter.[CostCenterID] AS "CostCenter-NO",
    CostCenter.[Name] AS "COSTCENTRE NAME",
    COUNT(*) AS "NO-OFTRANS",
    SUM(CostItem.[Charge]) AS "TOTAL",
    SUM(CASE WHEN Transactions.[FinCode] = 1 THEN CostItem.[Charge] ELSE 0 END) AS "ASSURE",
    SUM(CASE WHEN Transactions.[FinCode] = 2 THEN CostItem.[Charge] ELSE 0 END) AS "ESI",
    SUM(CASE WHEN Transactions.[FinCode] = 3 THEN CostItem.[Charge] ELSE 0 END) AS "SELF",
    SUM(CASE WHEN Transactions.[FinCode] = 4 THEN CostItem.[Charge] ELSE 0 END) AS "PAY",
    SUM(CASE WHEN Transactions.[FinCode] = 5 THEN CostItem.[Charge] ELSE 0 END) AS "OTHER"
FROM 
    [MajorProject].[dbo].[CostCenter] AS CostCenter
LEFT JOIN
    [MajorProject].[dbo].[CostItem] AS CostItem ON CostItem.[CostCenterID] = CostCenter.[CostCenterID]
LEFT JOIN 
    [MajorProject].[dbo].[Transactions] AS Transactions ON CostItem.[CostItemID] = Transactions.[ItemCode]
LEFT JOIN 
    [MajorProject].[dbo].[Patient] AS Patient ON Patient.[PatientID] = Transactions.[PatientID]
LEFT JOIN 
    [MajorProject].[dbo].[FinancialStatus] AS FinancialStatus ON FinancialStatus.[Code] = Patient.[FinCode]
LEFT JOIN
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON PatientAdmission.[PatientID] = Patient.[PatientID]
GROUP BY
    CostCenter.[CostCenterID], CostCenter.[Name], Transactions.[FinCode];
GO
/****** Object:  Table [dbo].[Physician]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Physician](
	[PhysicianID] [int] NOT NULL,
	[FirstName] [varchar](16) NOT NULL,
	[LastName] [varchar](16) NOT NULL,
	[Telephone] [varchar](16) NOT NULL,
	[Specialty] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhysicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Physician_Patient]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Physician_Patient] AS
SELECT 
    Patient.[PatientID] AS "PATIENT-NO",
    CONCAT(Patient.[FirstName], ' ', Patient.[LastName]) AS "PATIENT-NAME",
    PatientAdmission.[BedLocation] AS "LOCATION",
    PatientAdmission.[AdmissionDate] AS "DATE-ADMITTED",
    Physician.[PhysicianID] AS "PHYSICIAN-NO",
    CONCAT(Physician.[LastName], ', ', Physician.[FirstName]) AS "PHYSICIAN-NAME"
FROM 
    [MajorProject].[dbo].[Patient] AS Patient
INNER JOIN 
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON Patient.[PatientID] = PatientAdmission.[PatientID]
LEFT JOIN 
    [MajorProject].[dbo].[Physician] AS Physician ON PatientAdmission.[PhysicianID] = Physician.[PhysicianID];
GO
/****** Object:  View [dbo].[patient_display]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[patient_display] AS
SELECT
    Patient.[PatientID] AS "PATIENT-NO",
    CONCAT(COALESCE(Patient.[FirstName], ''), ' ', COALESCE(Patient.[MiddleName], ''), ' ', COALESCE(Patient.[LastName], '')) AS "PATIENT-NAME",
    Patient.[AddressLine1],
    Patient.[AddressLine2],
    CONCAT(COALESCE(Patient.[City], ''), ' ', COALESCE(Patient.[Province], ''), ' ', COALESCE(Patient.[PostalCode], '')) AS "CITY_PROV_PC",
    Patient.[Telephone],
    PatientAdmission.[BedLocation],
    PatientAdmission.[AdmissionDate],
    PatientAdmission.[DischargeDate],
    FinancialStatus.[InsurProvider] AS "INSURANCE-PROVIDER"
FROM
    [MajorProject].[dbo].[Patient] AS Patient
LEFT JOIN
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON Patient.[PatientID] = PatientAdmission.[PatientID]
LEFT JOIN
    [MajorProject].[dbo].[FinancialStatus] AS FinancialStatus ON FinancialStatus.[Code] = Patient.[FinCode];
GO
/****** Object:  Table [dbo].[Room]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [varchar](10) NOT NULL,
	[TypeCode] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bed]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bed](
	[BedLocation] [varchar](10) NOT NULL,
	[RoomID] [varchar](10) NOT NULL,
	[Extension] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BedLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Room_Utilization_Report]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Room_Utilization_Report] AS
SELECT 
    Room.[RoomID] AS "Room-No",
    Room.[TypeCode] AS "Room-Type",
    Bed.[BedLocation] AS "Bed-Location",
    CONCAT(COALESCE(Patient.[FirstName], ''), ' ', COALESCE(Patient.[MiddleName], ''), ' ', COALESCE(Patient.[LastName], '')) AS "PATIENT-NAME",
    PatientAdmission.[AdmissionDate] AS "Admission-Date"
FROM 
    [MajorProject].[dbo].[Room] AS Room
INNER JOIN 
    [MajorProject].[dbo].[Bed] AS Bed ON Bed.[RoomID] = Room.[RoomID]
LEFT JOIN 
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON PatientAdmission.[BedLocation] = Bed.[BedLocation]
LEFT JOIN 
    [MajorProject].[dbo].[Patient] AS Patient ON Patient.[PatientID] = PatientAdmission.[PatientID];
GO
/****** Object:  View [dbo].[patient_Bill]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[patient_Bill] AS
SELECT TOP 100 PERCENT
    CostCenter.[Name] AS "COSTCENTRE NAME",
    Transactions.[Date] AS "DATE",
    CostItem.[Description] AS "ITEMCODE DESCRIPTION",
    CostItem.[Charge] AS "CHARGE",
    SUM(CostItem.[Charge]) OVER (PARTITION BY CostCenter.[Name], Transactions.[Date], CostItem.[Description]) AS "Balance Due"
FROM 
    [MajorProject].[dbo].[Transactions] AS Transactions
INNER JOIN 
    [MajorProject].[dbo].[CostItem] AS CostItem ON CostItem.[CostItemID] = Transactions.[ItemCode]
LEFT JOIN 
    [MajorProject].[dbo].[CostCenter] AS CostCenter ON CostCenter.[CostCenterID] = CostItem.[CostCenterID]
GROUP BY 
    CostCenter.[Name],
    Transactions.[Date],
    CostItem.[Description],
    CostItem.[Charge]
ORDER BY 
    CostCenter.[Name],
    Transactions.[Date],
    CostItem.[Description];
GO
/****** Object:  View [dbo].[patient_display_updated]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Patient Display
CREATE VIEW [dbo].[patient_display_updated] AS
SELECT
    Patient.[PatientID] AS "PATIENT-NO",
    CONCAT(COALESCE(Patient.[FirstName], ''), ' ', COALESCE(Patient.[MiddleName], ''), ' ', COALESCE(Patient.[LastName], '')) AS "PATIENT-NAME",
    Patient.[AddressLine1],
    Patient.[AddressLine2],
    Patient.[City],
    Patient.[Province],
    Patient.[PostalCode],
    Patient.[Telephone],
    PatientAdmission.[BedLocation],
    PatientAdmission.[AdmissionDate],
    PatientAdmission.[DischargeDate]
FROM
    [MajorProject].[dbo].[Patient] AS Patient
LEFT JOIN
    [MajorProject].[dbo].[PatientAdmission] AS PatientAdmission ON Patient.[PatientID] = PatientAdmission.[PatientID];
GO
/****** Object:  View [dbo].[physician_display]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Physician Display
CREATE VIEW [dbo].[physician_display] AS
SELECT
   [PhysicianID],
    [FirstName] + ' '  + [LastName] AS "PHYSICIAN-NAME", 
	[Telephone], 
	[Specialty]
FROM
   [MajorProject].[dbo].[Physician];
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[PhysicianID] [int] NOT NULL,
	[ApptDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PrescriptionID] [int] NOT NULL,
	[Note] [varchar](50) NOT NULL,
	[AppointmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment](
	[TreatmentID] [int] NOT NULL,
	[PrescriptionID] [int] NOT NULL,
	[CostItemID] [int] NOT NULL,
	[TreatmentDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (101, 1, 4321, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (102, 2, 1234, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (103, 3, 5678, CAST(N'2023-12-03' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (104, 4, 8765, CAST(N'2023-12-04' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (105, 5, 4322, CAST(N'2023-12-05' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (106, 6, 4321, CAST(N'2023-12-06' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (107, 7, 1234, CAST(N'2023-12-07' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (108, 8, 5678, CAST(N'2023-12-08' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (109, 9, 8765, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (110, 10, 4322, CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (111, 11, 4321, CAST(N'2023-12-11' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (112, 12, 1234, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (113, 13, 5678, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (114, 14, 8765, CAST(N'2023-12-14' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (115, 15, 4322, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (116, 16, 4321, CAST(N'2023-12-16' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (117, 17, 1234, CAST(N'2023-12-17' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (118, 18, 5678, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (119, 19, 8765, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (120, 20, 4322, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (121, 21, 4321, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (122, 22, 1234, CAST(N'2023-12-22' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (123, 23, 5678, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (124, 24, 8765, CAST(N'2023-12-24' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (125, 25, 4322, CAST(N'2023-12-25' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (126, 26, 4321, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (127, 27, 1234, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (128, 28, 5678, CAST(N'2023-12-28' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (129, 29, 8765, CAST(N'2023-12-29' AS Date))
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [PhysicianID], [ApptDate]) VALUES (130, 30, 4322, CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'101A-1', N'101A', 623)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'101A-2', N'101A', 624)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'102A-1', N'102A', 725)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'102A-2', N'102A', 726)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'103A-1', N'103A', 827)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'103A-2', N'103A', 828)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'104A-1', N'104A', 929)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'104A-2', N'104A', 930)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'105A-1', N'105A', 1031)
INSERT [dbo].[Bed] ([BedLocation], [RoomID], [Extension]) VALUES (N'105A-2', N'105A', 1032)
GO
INSERT [dbo].[CostCenter] ([CostCenterID], [Name]) VALUES (100, N'Room & Board')
INSERT [dbo].[CostCenter] ([CostCenterID], [Name]) VALUES (110, N'Laboratory')
INSERT [dbo].[CostCenter] ([CostCenterID], [Name]) VALUES (125, N'Radiology')
INSERT [dbo].[CostCenter] ([CostCenterID], [Name]) VALUES (130, N'Pharmacy')
INSERT [dbo].[CostCenter] ([CostCenterID], [Name]) VALUES (140, N'Medical Supplies')
GO
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (1580, N'Glucose', 110, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (1585, N'Culture', 110, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2000, N'Semiprivate Room', 100, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2005, N'Television', 100, CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2010, N'Prescription Medications', 130, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2015, N'Over-the-Counter Drugs', 130, CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2020, N'Disposable Syringes', 140, CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (2025, N'Bandages', 140, CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[CostItem] ([CostItemID], [Description], [CostCenterID], [Charge]) VALUES (3010, N'Chest X-ray', 125, CAST(30.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[FinancialStatus] ([Code], [InsurProvider]) VALUES (323, N'Self-Pay')
INSERT [dbo].[FinancialStatus] ([Code], [InsurProvider]) VALUES (324, N'Assure')
INSERT [dbo].[FinancialStatus] ([Code], [InsurProvider]) VALUES (325, N'ESI')
GO
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (1, N'John', N'A.', N'Doe', 323, N'123 Main St', N'Apt 101', N'Cityville', N'Stateville', N'12345', N'555-1234')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (2, N'Jane', N'B.', N'Smith', 324, N'456 Oak St', N'Suite 202', N'Townsville', N'Countyville', N'67890', N'555-5678')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (3, N'Robert', N'C.', N'Johnson', 325, N'789 Pine St', N'Unit 303', N'Villageville', N'Regionville', N'23456', N'555-9876')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (4, N'Emily', N'D.', N'Williams', 323, N'987 Elm St', N'Apt 404', N'Hamletville', N'Districtville', N'34567', N'555-5432')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (5, N'Michael', N'E.', N'Anderson', 324, N'654 Birch St', N'Suite 505', N'Citytown', N'Provincetown', N'87654', N'555-8765')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (6, N'Samantha', N'F.', N'Miller', 325, N'321 Cedar St', N'Unit 606', N'Countryside', N'Territoryville', N'98765', N'555-2345')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (7, N'Daniel', N'G.', N'Wilson', 323, N'876 Maple St', N'Apt 707', N'Villagetown', N'Stateville', N'65432', N'555-7654')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (8, N'Olivia', N'H.', N'Davis', 324, N'543 Pine St', N'Suite 808', N'Hamletsville', N'Countyville', N'34567', N'555-2345')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (9, N'Matthew', N'I.', N'Brown', 325, N'210 Oak St', N'Unit 909', N'Cityville', N'Districtville', N'87654', N'555-8765')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (10, N'Isabella', N'J.', N'Moore', 323, N'789 Elm St', N'Apt 1010', N'Townsville', N'Provincetown', N'23456', N'555-1234')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (11, N'William', N'K.', N'Taylor', 324, N'876 Birch St', N'Suite 1111', N'Villageville', N'Territoryville', N'56789', N'555-5678')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (12, N'Sophia', N'L.', N'Jackson', 325, N'543 Cedar St', N'Unit 1212', N'Countryside', N'Stateville', N'12345', N'555-9876')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (13, N'James', N'M.', N'White', 323, N'210 Maple St', N'Apt 1313', N'Citytown', N'Countyville', N'67890', N'555-5432')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (14, N'Emma', N'N.', N'Miller', 324, N'987 Pine St', N'Suite 1414', N'Villagetown', N'Districtville', N'23456', N'555-8765')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (15, N'Benjamin', N'O.', N'Anderson', 325, N'654 Oak St', N'Unit 1515', N'Hamletville', N'Provincetown', N'87654', N'555-2345')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (16, N'Ava', N'P.', N'Harris', 323, N'321 Cedar St', N'Apt 1616', N'Countryside', N'Territoryville', N'34567', N'555-7654')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (17, N'Logan', N'Q.', N'Thomas', 324, N'876 Elm St', N'Suite 1717', N'Cityville', N'Stateville', N'98765', N'555-1234')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (18, N'Mia', N'R.', N'Martin', 325, N'543 Maple St', N'Unit 1818', N'Townsville', N'Countyville', N'23456', N'555-9876')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (19, N'Elijah', N'S.', N'Jackson', 323, N'210 Pine St', N'Apt 1919', N'Villageville', N'Districtville', N'67890', N'555-5432')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (20, N'Abigail', N'T.', N'Cooper', 324, N'789 Birch St', N'Suite 2020', N'Hamletsville', N'Provincetown', N'12345', N'555-8765')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (21, N'Daniel', N'U.', N'Fisher', 325, N'876 Cedar St', N'Unit 2121', N'Citytown', N'Territoryville', N'56789', N'555-2345')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (22, N'Grace', N'V.', N'Ward', 323, N'543 Oak St', N'Apt 2222', N'Villagetown', N'Stateville', N'87654', N'555-7654')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (23, N'Carter', N'W.', N'Baker', 324, N'210 Elm St', N'Suite 2323', N'Countryside', N'Countyville', N'23456', N'555-1234')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (24, N'Chloe', N'X.', N'Hill', 325, N'987 Maple St', N'Unit 2424', N'Cityville', N'Districtville', N'34567', N'555-9876')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (25, N'Liam', N'Y.', N'Perez', 323, N'654 Pine St', N'Apt 2525', N'Townsville', N'Provincetown', N'67890', N'555-5432')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (26, N'Avery', N'Z.', N'Russell', 324, N'321 Birch St', N'Suite 2626', N'Hamletville', N'Territoryville', N'12345', N'555-8765')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (27, N'Ella', N'A.', N'Ferguson', 325, N'876 Cedar St', N'Unit 2727', N'Citytown', N'Stateville', N'56789', N'555-2345')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (28, N'Noah', N'B.', N'Barnes', 323, N'543 Oak St', N'Apt 2828', N'Villagetown', N'Countyville', N'87654', N'555-7654')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (29, N'Madison', N'C.', N'Turner', 324, N'210 Elm St', N'Suite 2929', N'Countryside', N'Districtville', N'23456', N'555-1234')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [MiddleName], [LastName], [FinCode], [AddressLine1], [AddressLine2], [City], [Province], [PostalCode], [Telephone]) VALUES (30, N'Jackson', N'D.', N'Wells', 325, N'987 Maple St', N'Unit 3030', N'Cityville', N'Provincetown', N'34567', N'555-9876')
GO
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-01' AS Date), 1, 4321, N'101A-1', CAST(N'2023-12-03' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-02' AS Date), 2, 1234, N'102A-2', CAST(N'2023-12-05' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-03' AS Date), 3, 5678, N'103A-1', CAST(N'2023-12-07' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-04' AS Date), 4, 8765, N'104A-2', CAST(N'2023-12-09' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-05' AS Date), 5, 4322, N'105A-1', CAST(N'2023-12-11' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-06' AS Date), 6, 4321, N'101A-2', CAST(N'2023-12-13' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-07' AS Date), 7, 1234, N'102A-1', CAST(N'2023-12-15' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-08' AS Date), 8, 5678, N'103A-2', CAST(N'2023-12-17' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-09' AS Date), 9, 8765, N'104A-1', CAST(N'2023-12-19' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-10' AS Date), 10, 4322, N'105A-2', CAST(N'2023-12-21' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-11' AS Date), 11, 4321, N'101A-1', CAST(N'2023-12-23' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-12' AS Date), 12, 1234, N'102A-2', CAST(N'2023-12-25' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-13' AS Date), 13, 5678, N'103A-1', CAST(N'2023-12-27' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-14' AS Date), 14, 8765, N'104A-2', CAST(N'2023-12-29' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-15' AS Date), 15, 4322, N'105A-1', CAST(N'2023-12-31' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-16' AS Date), 16, 4321, N'101A-2', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-17' AS Date), 17, 1234, N'102A-1', CAST(N'2024-01-04' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-18' AS Date), 18, 5678, N'103A-2', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-19' AS Date), 19, 8765, N'104A-1', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-20' AS Date), 20, 4322, N'105A-2', CAST(N'2024-01-10' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-21' AS Date), 21, 4321, N'101A-1', CAST(N'2024-01-12' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-22' AS Date), 22, 1234, N'102A-2', CAST(N'2024-01-14' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-23' AS Date), 23, 5678, N'103A-1', CAST(N'2024-01-16' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-24' AS Date), 24, 8765, N'104A-2', CAST(N'2024-01-18' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-25' AS Date), 25, 4322, N'105A-1', CAST(N'2024-01-20' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-26' AS Date), 26, 4321, N'101A-2', CAST(N'2024-01-22' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-27' AS Date), 27, 1234, N'102A-1', CAST(N'2024-01-24' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-28' AS Date), 28, 5678, N'103A-2', CAST(N'2024-01-26' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-29' AS Date), 29, 8765, N'104A-1', CAST(N'2024-01-28' AS Date))
INSERT [dbo].[PatientAdmission] ([AdmissionDate], [PatientID], [PhysicianID], [BedLocation], [DischargeDate]) VALUES (CAST(N'2023-12-30' AS Date), 30, 4322, N'105A-2', CAST(N'2024-01-30' AS Date))
GO
INSERT [dbo].[Physician] ([PhysicianID], [FirstName], [LastName], [Telephone], [Specialty]) VALUES (1234, N'E. L.', N'Johnson', N'416 555-6789', N'Cardiology')
INSERT [dbo].[Physician] ([PhysicianID], [FirstName], [LastName], [Telephone], [Specialty]) VALUES (4321, N'A. J.', N'Dunn', N'250 555-4444', N'Paediatrics')
INSERT [dbo].[Physician] ([PhysicianID], [FirstName], [LastName], [Telephone], [Specialty]) VALUES (4322, N'H. R.', N'Smith', N'905 555-1234', N'Neurology')
INSERT [dbo].[Physician] ([PhysicianID], [FirstName], [LastName], [Telephone], [Specialty]) VALUES (5678, N'G. M.', N'Clark', N'604 555-7890', N'Orthopedics')
INSERT [dbo].[Physician] ([PhysicianID], [FirstName], [LastName], [Telephone], [Specialty]) VALUES (8765, N'F. K.', N'Miller', N'403 555-9876', N'Dermatology')
GO
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (501, N'Prescription one', 101)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (502, N'Prescription two', 102)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (503, N'Prescription three', 103)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (504, N'Prescription four', 104)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (505, N'Prescription five', 105)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (506, N'Prescription six', 106)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (507, N'Prescription seven', 107)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (508, N'Prescription eight', 108)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (509, N'Prescription nine', 109)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (510, N'Prescription ten', 110)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (511, N'Prescription eleven', 111)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (512, N'Prescription twelve', 112)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (513, N'Prescription thirteen', 113)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (514, N'Prescription fourteen', 114)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (515, N'Prescription fifteen', 115)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (516, N'Prescription sixteen', 116)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (517, N'Prescription seventeen', 117)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (518, N'Prescription eighteen', 118)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (519, N'Prescription nineteen', 119)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (520, N'Prescription twenty', 120)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (521, N'Prescription twenty-one', 121)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (522, N'Prescription twenty-two', 122)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (523, N'Prescription twenty-three', 123)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (524, N'Prescription twenty-four', 124)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (525, N'Prescription twenty-five', 125)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (526, N'Prescription twenty-six', 126)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (527, N'Prescription twenty-seven', 127)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (528, N'Prescription twenty-eight', 128)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (529, N'Prescription twenty-nine', 129)
INSERT [dbo].[Prescription] ([PrescriptionID], [Note], [AppointmentID]) VALUES (530, N'Prescription thirty', 130)
GO
INSERT [dbo].[Room] ([RoomID], [TypeCode]) VALUES (N'101A', N'SP')
INSERT [dbo].[Room] ([RoomID], [TypeCode]) VALUES (N'102A', N'SP')
INSERT [dbo].[Room] ([RoomID], [TypeCode]) VALUES (N'103A', N'SP')
INSERT [dbo].[Room] ([RoomID], [TypeCode]) VALUES (N'104A', N'ICU')
INSERT [dbo].[Room] ([RoomID], [TypeCode]) VALUES (N'105A', N'ICU')
GO
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20001, 1, 2000, CAST(N'2023-12-01' AS Date), 323, 10001)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20002, 2, 2005, CAST(N'2023-12-02' AS Date), 324, 10002)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20003, 3, 1580, CAST(N'2023-12-03' AS Date), 325, 10003)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20004, 4, 1585, CAST(N'2023-12-04' AS Date), 323, 10004)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20005, 5, 3010, CAST(N'2023-12-05' AS Date), 324, 10005)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20006, 6, 2010, CAST(N'2023-12-06' AS Date), 325, 10006)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20007, 7, 2015, CAST(N'2023-12-07' AS Date), 323, 10007)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20008, 8, 2020, CAST(N'2023-12-08' AS Date), 324, 10008)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20009, 9, 2025, CAST(N'2023-12-09' AS Date), 325, 10009)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20010, 10, 2000, CAST(N'2023-12-10' AS Date), 323, 10010)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20011, 11, 2005, CAST(N'2023-12-11' AS Date), 324, 10011)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20012, 12, 1580, CAST(N'2023-12-12' AS Date), 325, 10012)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20013, 13, 1585, CAST(N'2023-12-13' AS Date), 323, 10013)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20014, 14, 3010, CAST(N'2023-12-14' AS Date), 324, 10014)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20015, 15, 2010, CAST(N'2023-12-15' AS Date), 325, 10015)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20016, 16, 2015, CAST(N'2023-12-16' AS Date), 323, 10016)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20017, 17, 2020, CAST(N'2023-12-17' AS Date), 324, 10017)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20018, 18, 2025, CAST(N'2023-12-18' AS Date), 325, 10018)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20019, 19, 2000, CAST(N'2023-12-19' AS Date), 323, 10019)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20020, 20, 2005, CAST(N'2023-12-20' AS Date), 324, 10020)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20021, 21, 1580, CAST(N'2023-12-21' AS Date), 325, 10021)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20022, 22, 1585, CAST(N'2023-12-22' AS Date), 323, 10022)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20023, 23, 3010, CAST(N'2023-12-23' AS Date), 324, 10023)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20024, 24, 2010, CAST(N'2023-12-24' AS Date), 325, 10024)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20025, 25, 2015, CAST(N'2023-12-25' AS Date), 323, 10025)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20026, 26, 2020, CAST(N'2023-12-26' AS Date), 324, 10026)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20027, 27, 2025, CAST(N'2023-12-27' AS Date), 325, 10027)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20028, 28, 2000, CAST(N'2023-12-28' AS Date), 323, 10028)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20029, 29, 2005, CAST(N'2023-12-29' AS Date), 324, 10029)
INSERT [dbo].[Transactions] ([TransactionID], [PatientID], [ItemCode], [Date], [FinCode], [TreatmentNo]) VALUES (20030, 30, 1580, CAST(N'2023-12-30' AS Date), 325, 10030)
GO
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10001, 501, 2000, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10002, 502, 2005, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10003, 503, 1580, CAST(N'2023-12-03' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10004, 504, 1585, CAST(N'2023-12-04' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10005, 505, 3010, CAST(N'2023-12-05' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10006, 506, 2010, CAST(N'2023-12-06' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10007, 507, 2015, CAST(N'2023-12-07' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10008, 508, 2020, CAST(N'2023-12-08' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10009, 509, 2025, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10010, 510, 2000, CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10011, 511, 2005, CAST(N'2023-12-11' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10012, 512, 1580, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10013, 513, 1585, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10014, 514, 3010, CAST(N'2023-12-14' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10015, 515, 2010, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10016, 516, 2015, CAST(N'2023-12-16' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10017, 517, 2020, CAST(N'2023-12-17' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10018, 518, 2025, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10019, 519, 2000, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10020, 520, 2005, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10021, 521, 1580, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10022, 522, 1585, CAST(N'2023-12-22' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10023, 523, 3010, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10024, 524, 2010, CAST(N'2023-12-24' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10025, 525, 2015, CAST(N'2023-12-25' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10026, 526, 2020, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10027, 527, 2025, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10028, 528, 2000, CAST(N'2023-12-28' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10029, 529, 2005, CAST(N'2023-12-29' AS Date))
INSERT [dbo].[Treatment] ([TreatmentID], [PrescriptionID], [CostItemID], [TreatmentDate]) VALUES (10030, 530, 1580, CAST(N'2023-12-30' AS Date))
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([PhysicianID])
REFERENCES [dbo].[Physician] ([PhysicianID])
GO
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[CostItem]  WITH CHECK ADD FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[CostCenter] ([CostCenterID])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([FinCode])
REFERENCES [dbo].[FinancialStatus] ([Code])
GO
ALTER TABLE [dbo].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([BedLocation])
REFERENCES [dbo].[Bed] ([BedLocation])
GO
ALTER TABLE [dbo].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([PhysicianID])
REFERENCES [dbo].[Physician] ([PhysicianID])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([FinCode])
REFERENCES [dbo].[FinancialStatus] ([Code])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([ItemCode])
REFERENCES [dbo].[CostItem] ([CostItemID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([TreatmentNo])
REFERENCES [dbo].[Treatment] ([TreatmentID])
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD FOREIGN KEY([CostItemID])
REFERENCES [dbo].[CostItem] ([CostItemID])
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescription] ([PrescriptionID])
GO
/****** Object:  StoredProcedure [dbo].[CalculateTotalCharges]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateTotalCharges]
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        SUM(C.Charge) AS TotalCharges
    FROM
        Treatment T
    INNER JOIN
        CostItem C ON T.CostItemID = C.CostItemID
    INNER JOIN
        Prescription P ON T.PrescriptionID = P.PrescriptionID
    INNER JOIN
        Appointment A ON P.AppointmentID = A.AppointmentID
    WHERE
        A.PatientID = @PatientID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentPatients]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentPatients]
    @PhysicianID smallint,
	@BedLocation varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM PatientAdmission
    WHERE PatientAdmission.BedLocation = @BedLocation
	AND	PatientAdmission.PhysicianID = @PhysicianID
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPatientAppointments]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientAppointments]
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        A.AppointmentID,
        A.ApptDate,
        P.FirstName + ' ' + P.LastName AS PhysicianName
    FROM
        Appointment A
    INNER JOIN
        Physician P ON A.PhysicianID = P.PhysicianID
    WHERE
        A.PatientID = @PatientID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPatientPrescriptions]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientPrescriptions]
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        P.PrescriptionID,
        P.Note,
        A.ApptDate,
        PHY.FirstName + ' ' + PHY.LastName AS PhysicianName
    FROM
        Prescription P
    INNER JOIN
        Appointment A ON P.AppointmentID = A.AppointmentID
    INNER JOIN
        Physician PHY ON A.PhysicianID = PHY.PhysicianID
    WHERE
        A.PatientID = @PatientID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPatientTreatmentHistory]    Script Date: 01-Dec-23 6:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientTreatmentHistory]
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        T.TreatmentID,
        T.TreatmentDate,
        C.Description AS CostItemDescription
    FROM
        Treatment T
    INNER JOIN
        Prescription P ON T.PrescriptionID = P.PrescriptionID
    INNER JOIN
        CostItem C ON T.CostItemID = C.CostItemID
    INNER JOIN
        Appointment A ON P.AppointmentID = A.AppointmentID
    WHERE
        A.PatientID = @PatientID;
END;
GO
USE [master]
GO
ALTER DATABASE [MajorProject] SET  READ_WRITE 
GO
