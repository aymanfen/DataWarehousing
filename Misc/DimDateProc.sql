CREATE PROCEDURE dbo.PopulateDateDim
    @StartDate DATE,
    @EndDate DATE
AS
	DECLARE @CurrentDate DATE = @StartDate;
	WHILE @CurrentDate <= @EndDate
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM dbo.DateDim WHERE FullDate = @CurrentDate)
        BEGIN
            INSERT INTO dbo.DateDim (FullDate, Year, Quarter, Month, Week, Day)
            VALUES (
                @CurrentDate,
                YEAR(@CurrentDate),
                DATEPART(QUARTER, @CurrentDate),
                MONTH(@CurrentDate),
                DATEPART(WEEK, @CurrentDate),
                DAY(@CurrentDate)
            );
        END

        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END;
