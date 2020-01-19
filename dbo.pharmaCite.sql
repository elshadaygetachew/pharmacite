CREATE TABLE [dbo].[pharmacist] (
    [pharmacistID]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [pharmacistName] VARCHAR (100) NOT NULL,
    [hiredBy]        BIGINT        NOT NULL,
    [hiredDate]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [pwd] VARCHAR(50) NOT NULL, 
    PRIMARY KEY CLUSTERED ([pharmacistID] ASC),
    FOREIGN KEY ([hiredBy]) REFERENCES [dbo].[manager] ([managerID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[medicines_sold]
(
	[soldId] BIGINT NOT NULL PRIMARY KEY, 
    [soldBy] BIGINT NOT NULL, 
    [soldMedicine] BIGINT NOT NULL, 
    [soldDate] DATETIME NOT NULL DEFAULT (getDate()), 
    [soldTo] BIGINT NOT NULL, 
    CONSTRAINT [FK_sold_med_To_Medicines_stored] FOREIGN KEY ([soldMedicine]) REFERENCES [dbo].[medicines_stored] ([medicineID]) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT [FK_sold_med_To_Users] FOREIGN KEY ([soldTo]) REFERENCES [dbo].[users] ([userID]) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT [FK_sold_med_To_Pharmacist] FOREIGN KEY ([soldBy]) REFERENCES [dbo].[pharmacist] ([pharmacistID]) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE [dbo].[user_compliants] (
    [complaintID]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [complaintBy]   BIGINT   NOT NULL,
    [complaintOn]   BIGINT   NOT NULL,
    [complaintDate] DATETIME DEFAULT (getdate()) NOT NULL,
    [compaintText] VARCHAR(100) NOT NULL, 
    PRIMARY KEY CLUSTERED ([complaintID] ASC),
    CONSTRAINT [FK_user_compliants_To_Medicines_stored] FOREIGN KEY ([complaintOn]) REFERENCES [dbo].[medicines_stored] ([medicineID]) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT [FK_user_compliants_To_Users] FOREIGN KEY ([complaintBy]) REFERENCES [dbo].[users] ([userID]) ON DELETE CASCADE ON UPDATE CASCADE, 
   );


CREATE TABLE [dbo].[manager] (
    [managerID]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [managerName] VARCHAR (100) NOT NULL,
    [pwd] VARCHAR(50) NOT NULL, 
    PRIMARY KEY CLUSTERED ([managerID] ASC)
);

CREATE TABLE [dbo].[medicines_stored] (
    [medicineID]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [medicineName]      VARCHAR (100) NOT NULL,
    [Category]          VARCHAR (100) NOT NULL,
    [UnitPrice]         DECIMAL (18)  NOT NULL,
    [AvailableQuantity] BIGINT        NOT NULL,
    [storedDate]        DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([medicineID] ASC)
);

