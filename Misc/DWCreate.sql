CREATE TABLE DateDim (
	FullDate DATE PRIMARY KEY,
	Year INT,
	Quarter INT,
	Month INT,
	Week INT,
	Day INT);

CREATE TABLE BenchmarkDim (
	BenchmarkID INT IDENTITY(1,1) PRIMARY KEY,
	BenchmarkName NVARCHAR(255) );

CREATE TABLE ModelDim (
	ModelKey INT IDENTITY(1,1) PRIMARY KEY,
	ModelID NVARCHAR(255) ,
	ModelName NVARCHAR(255),
	ModelPrecision NVARCHAR(255),
	ModelType NVARCHAR(100),
	ModelWeight NVARCHAR(100),
	ModelArchitecture NVARCHAR(255),
	ModelAvgScore FLOAT,
	ModelLicense NVARCHAR(100),
    IsCurrent BIT NOT NULL);

CREATE TABLE FactEVal (
	EvalID INT IDENTITY(1,1) PRIMARY KEY,
	EvalValue FLOAT,
	Params FLOAT,
	Co2Cost FLOAT,
	SubmissionDate Date,
	ModelID INT,
	BenchmarkID INT,
	
	CONSTRAINT FK_FactEval_Model FOREIGN KEY (ModelID)
        REFERENCES ModelDim(ModelKey),
    CONSTRAINT FK_FactEval_Benchmark FOREIGN KEY (BenchmarkID)
        REFERENCES BenchmarkDim(BenchmarkID),
    CONSTRAINT FK_FactEval_Date FOREIGN KEY (SubmissionDate)
        REFERENCES DateDim(FullDate)
);
