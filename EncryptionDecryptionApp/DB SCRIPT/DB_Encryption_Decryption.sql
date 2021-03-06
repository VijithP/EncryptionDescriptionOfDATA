USE [master]
GO
/****** Object:  Database [DB_EncryptionDecryption]    Script Date: 3/9/2020 9:59:46 PM ******/
CREATE DATABASE [DB_EncryptionDecryption]
GO
USE [DB_EncryptionDecryption]
GO
/****** Object:  UserDefinedTableType [dbo].[UTypeHRData]    Script Date: 3/9/2020 9:59:47 PM ******/
CREATE TYPE [dbo].[UTypeHRData] AS TABLE(
	[HRData_ID] [int] NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[Emp_Name] [varchar](255) NOT NULL,
	[Current_CTC] [varchar](max) NOT NULL,
	[Created_By] [varchar](255) NULL,
	[Created_Dt] [datetime] NULL,
	[Updated_By] [varchar](255) NULL,
	[Updated_Dt] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[HR_Data_Master]    Script Date: 3/9/2020 9:59:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_Data_Master](
	[HRData_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[Emp_Name] [varchar](255) NOT NULL,
	[Current_CTC] [varbinary](max) NULL,
	[Created_By] [varchar](255) NULL,
	[Created_Dt] [datetime] NULL,
	[Updated_By] [varchar](255) NULL,
	[Updated_Dt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HRData_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[HR_Data_Master] ON 

INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (57, 300100, N'Employee -100', 0x0046849366046E41ABC4D72E5D648177010000004E81038DDCC5EB7E443AEC76A7CE902C2C02C22D69785AA7C8AD68D6BAA9EFEE615EFAF50BAEF6A938FE97FD53C90B756C280443A31C44C650F77AB1E90CB7E1, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (58, 300101, N'Employee -101', 0x0046849366046E41ABC4D72E5D6481770100000044DA5BB0D3276BD72CC22FB795B29554ADBDB825244CDABBA5F130346C236F07B1DD3E8693035FFC343191BAC954F2C7D7FF2866D4A9E05A37ADD0961225182D, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (59, 300102, N'Employee -102', 0x0046849366046E41ABC4D72E5D6481770100000020BAEC74339E43ADF7877258E80C0F6EBC93BFB44C8D6766FFDAD6883570CF30741844B9E083EC878861817F7E3CFEB90F671E58A7FA6212FB910460646BB17C, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (60, 300103, N'Employee -103', 0x0046849366046E41ABC4D72E5D64817701000000CBC86D4545CA275153F91A24E5D9B6260A089503C18D64B12E78D6E3429BE29B309C460A20C5DE541FB4C8D5041E8F58A116A0787B485BD091E145078C960532, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (61, 300104, N'Employee -104', 0x0046849366046E41ABC4D72E5D64817701000000A0A1DF7AD4A5F3E4B4E1DBD0AB12646052DEF8C254AEE187A18A00F2C0230D0E82BD847457A676A803E567531B51C5A9F2E1C9FB2382C88B96ACEABE4CDD28C0, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (62, 300105, N'Employee -105', 0x0046849366046E41ABC4D72E5D64817701000000A71B3FC25EB055F98308E70B53927676032C95C7DC7FAD2CDB0620641C9349636E3942B5FFD1E228251C3201EE42C12F0E3EDC91A83A10F2AF23A17F10330D81, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
INSERT [dbo].[HR_Data_Master] ([HRData_ID], [Emp_ID], [Emp_Name], [Current_CTC], [Created_By], [Created_Dt], [Updated_By], [Updated_Dt]) VALUES (63, 300106, N'Employee -106', 0x0046849366046E41ABC4D72E5D64817701000000E910254D2EB2E795AA9DD86D8E09F949A5E3EFBC6F42B3BD1C66538B041ACF04D0EF8D53F9029455A12F6456872EB87AB7CBDA1E84956C95A1167E22D02EC179, N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime), N'dbo', CAST(N'2020-03-09T21:55:55.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[HR_Data_Master] OFF
ALTER TABLE [dbo].[HR_Data_Master] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [dbo].[HR_Data_Master] ADD  DEFAULT (getdate()) FOR [Updated_Dt]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetConfidentialData]    Script Date: 3/9/2020 9:59:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetConfidentialData]

AS
BEGIN

	SET NOCOUNT ON;

		OPEN SYMMETRIC KEY APPSymmetricKey  
DECRYPTION BY CERTIFICATE APPSelfSignedCertificate;

SELECT [HRData_ID]
      ,[Emp_ID]
      ,[Emp_Name]
      
	  ,CONVERT(VARCHAR,DECRYPTBYKEY(Current_CTC)) as  Current_CTC

      ,[Created_By]
      ,[Created_Dt]
      ,[Updated_By]
      ,[Updated_Dt]
  FROM [dbo].[HR_Data_Master]

      CLOSE SYMMETRIC KEY APPSymmetricKey;



END

GO
/****** Object:  StoredProcedure [dbo].[usp_UploadHRData]    Script Date: 3/9/2020 9:59:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UploadHRData](
@UtypeExcelData UTypeHRData READONLY
)
AS
BEGIN

  delete from dbo.[HR_Data_Master]

	OPEN SYMMETRIC KEY APPSymmetricKey  
	DECRYPTION BY CERTIFICATE APPSelfSignedCertificate;

	declare @CurrentUser  nvarchar(255)='dbo'
	
  INSERT INTO [dbo].[HR_Data_Master]
           ([Emp_ID]
           ,[Emp_Name]
           ,[Current_CTC]
           ,[Created_By]
           ,[Created_Dt]
           ,[Updated_By]
           ,[Updated_Dt])

		 SELECT UT.Emp_ID
		   ,UT.Emp_Name
		   ,EncryptByKey(Key_GUID('APPSymmetricKey'), UT.Current_CTC)
		   ,@CurrentUser
		   ,GETDATE()
		   ,@CurrentUser
		   ,GETDATE() 
		   
		  FROM @UtypeExcelData UT		
		
	CLOSE SYMMETRIC KEY APPSymmetricKey; 


END





GO
USE [master]
GO
ALTER DATABASE [DB_EncryptionDecryption] SET  READ_WRITE 
GO
