@interface _SUAutoInstallForecastDateCache
- (BOOL)_isStart:(id)a3 end:(id)a4 withinDateRange:(id)a5 end:(id)a6;
- (NSCalendar)calendar;
- (NSDate)roundedEndTime;
- (NSDate)roundedStartTime;
- (_SUAutoInstallForecastDateCache)initWithForecast:(id)a3;
- (id)_componentsFromDate:(id)a3;
- (id)description;
- (int64_t)scheduleType;
- (void)_computeTonightRangeRelativeToDate:(id)a3 extraDayOffset:(int64_t)a4 outStart:(id *)a5 outEnd:(id *)a6;
- (void)_parseForecast;
@end

@implementation _SUAutoInstallForecastDateCache

- (_SUAutoInstallForecastDateCache)initWithForecast:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SUAutoInstallForecastDateCache;
  v5 = [(_SUAutoInstallForecastDateCache *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_forecast, v4);
    uint64_t v7 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v7;

    v9 = v6->_calendar;
    v10 = [MEMORY[0x263EFFA18] defaultTimeZone];
    [(NSCalendar *)v9 setTimeZone:v10];

    [(_SUAutoInstallForecastDateCache *)v6 _parseForecast];
  }

  return v6;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (NSDate)roundedStartTime
{
  return self->_roundedStartDate;
}

- (NSDate)roundedEndTime
{
  return self->_roundedEndDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"[<_SUAutoInstallForecastDateCache:%p> ", self);
  [v3 appendString:v4];

  v5 = NSString;
  v6 = SUStringForAutoInstallForecastScheduleType(self->_scheduleType);
  uint64_t v7 = [v5 stringWithFormat:@"ForecastScheduleType=%@, ", v6];
  [v3 appendString:v7];

  v8 = NSString;
  v9 = [MEMORY[0x263F29C30] sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_forecast);
  v11 = [WeakRetained suStartDate];
  objc_super v12 = [v9 formatDateAsLongYMDHMSZPosixLocaleWithDate:v11];
  v13 = [v8 stringWithFormat:@"startDate=%@, ", v12];
  [v3 appendString:v13];

  v14 = NSString;
  v15 = [MEMORY[0x263F29C30] sharedInstance];
  v16 = [v15 formatDateAsLongYMDHMSZPosixLocaleWithDate:self->_roundedStartDate];
  v17 = [v14 stringWithFormat:@"startDateRounded=%@, ", v16];
  [v3 appendString:v17];

  v18 = NSString;
  v19 = [MEMORY[0x263F29C30] sharedInstance];
  id v20 = objc_loadWeakRetained((id *)&self->_weak_forecast);
  v21 = [v20 suEndDate];
  v22 = [v19 formatDateAsLongYMDHMSZPosixLocaleWithDate:v21];
  v23 = [v18 stringWithFormat:@"endDate=%@, ", v22];
  [v3 appendString:v23];

  v24 = NSString;
  v25 = [MEMORY[0x263F29C30] sharedInstance];
  v26 = [v25 formatDateAsLongYMDHMSZPosixLocaleWithDate:self->_roundedEndDate];
  v27 = [v24 stringWithFormat:@"endDateRounded=%@", v26];
  [v3 appendString:v27];

  [v3 appendString:@"]"];
  return v3;
}

- (void)_parseForecast
{
  p_weak_forecast = &self->_weak_forecast;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_forecast);
  v5 = [WeakRetained suStartDate];

  id v6 = objc_loadWeakRetained((id *)p_weak_forecast);
  uint64_t v7 = [v6 suEndDate];

  v8 = [MEMORY[0x263EFF910] date];
  v9 = [(_SUAutoInstallForecastDateCache *)self _componentsFromDate:v5];
  [v9 setMinute:0];
  [v9 setSecond:0];
  [v9 setNanosecond:0];
  v10 = [(NSCalendar *)self->_calendar dateFromComponents:v9];
  roundedStartDate = self->_roundedStartDate;
  self->_roundedStartDate = v10;

  objc_super v12 = [(_SUAutoInstallForecastDateCache *)self _componentsFromDate:v7];
  if ([v12 minute])
  {
    v13 = [(NSCalendar *)self->_calendar dateByAddingUnit:32 value:1 toDate:v7 options:0];
    uint64_t v14 = [(_SUAutoInstallForecastDateCache *)self _componentsFromDate:v13];

    objc_super v12 = (void *)v14;
  }
  [v12 setMinute:0];
  [v12 setSecond:0];
  [v12 setNanosecond:0];
  v15 = [(NSCalendar *)self->_calendar dateFromComponents:v12];
  roundedEndDate = self->_roundedEndDate;
  self->_roundedEndDate = v15;

  v17 = [MEMORY[0x263F29C38] sharedInstance];
  [v5 timeIntervalSinceReferenceDate];
  int v18 = objc_msgSend(v17, "isToday:");

  v19 = [MEMORY[0x263F29C38] sharedInstance];
  [v5 timeIntervalSinceReferenceDate];
  int v20 = objc_msgSend(v19, "isTomorrow:");

  v21 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:2 toDate:v8 options:0];
  if (![v5 isAfterDate:v21]
    && v5
    && v7
    && self->_roundedStartDate
    && self->_roundedEndDate)
  {
    id v42 = 0;
    id v43 = 0;
    [(_SUAutoInstallForecastDateCache *)self _computeTonightRangeRelativeToDate:v8 extraDayOffset:-1 outStart:&v43 outEnd:&v42];
    id v37 = v43;
    id v22 = v42;
    id v40 = 0;
    id v41 = 0;
    [(_SUAutoInstallForecastDateCache *)self _computeTonightRangeRelativeToDate:v8 extraDayOffset:0 outStart:&v41 outEnd:&v40];
    id v34 = v41;
    id v36 = v40;
    id v38 = 0;
    id v39 = 0;
    [(_SUAutoInstallForecastDateCache *)self _computeTonightRangeRelativeToDate:v8 extraDayOffset:1 outStart:&v39 outEnd:&v38];
    id v35 = v39;
    id v23 = v38;
    v24 = v23;
    self->_scheduleType = 3;
    if (v18)
    {
      id v25 = v23;
      v26 = v22;
      if ([(_SUAutoInstallForecastDateCache *)self _isStart:v5 end:v7 withinDateRange:v37 end:v22])
      {
        char v27 = [v8 isBeforeDate:v22];
        v28 = v34;
        v24 = v25;
        if (v27)
        {
          int64_t v29 = 1;
LABEL_23:
          self->_scheduleType = v29;
        }
      }
      else
      {
        v28 = v34;
        BOOL v31 = [(_SUAutoInstallForecastDateCache *)self _isStart:v5 end:v7 withinDateRange:v34 end:v36];
        v24 = v25;
        if (v31)
        {
          int v32 = [v8 isBeforeDate:v26];
          v24 = v25;
          int64_t v29 = 1;
          if (v32) {
            int64_t v29 = 2;
          }
          goto LABEL_23;
        }
      }
    }
    else
    {
      v26 = v22;
      v28 = v34;
      if (v20)
      {
        id v30 = v23;
        if ([(_SUAutoInstallForecastDateCache *)self _isStart:v5 end:v7 withinDateRange:v34 end:v36])
        {
          int64_t v29 = 1;
          v24 = v30;
          goto LABEL_23;
        }
        BOOL v33 = [(_SUAutoInstallForecastDateCache *)self _isStart:v5 end:v7 withinDateRange:v35 end:v30];
        v24 = v30;
        if (v33)
        {
          int64_t v29 = 2;
          goto LABEL_23;
        }
      }
    }

    goto LABEL_13;
  }
  self->_scheduleType = 0;
LABEL_13:
}

- (BOOL)_isStart:(id)a3 end:(id)a4 withinDateRange:(id)a5 end:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = v10;
  char v12 = 0;
  if (a3 && v9 && a5 && v10)
  {
    if ([a3 isAfterDate:a5]) {
      char v12 = [v9 isBeforeDate:v11];
    }
    else {
      char v12 = 0;
    }
  }

  return v12;
}

- (void)_computeTonightRangeRelativeToDate:(id)a3 extraDayOffset:(int64_t)a4 outStart:(id *)a5 outEnd:(id *)a6
{
  id v10 = a3;
  v11 = v10;
  id v19 = v10;
  if (a4)
  {
    v11 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:a4 toDate:v10 options:0];

    id v10 = v19;
  }
  if (v11)
  {
    char v12 = [(_SUAutoInstallForecastDateCache *)self _componentsFromDate:v11];
    [v12 setHour:20];
    [v12 setMinute:0];
    [v12 setSecond:0];
    [v12 setNanosecond:0];
    v13 = [(NSCalendar *)self->_calendar dateFromComponents:v12];

    if (v13)
    {
      v11 = [(NSCalendar *)self->_calendar dateByAddingUnit:64 value:-5 toDate:v13 options:0];
    }
    else
    {
      v11 = 0;
    }

    id v10 = v19;
  }
  uint64_t v14 = v10;
  int64_t v15 = a4 + 1;
  if (a4 != -1)
  {
    uint64_t v14 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:v15 toDate:v19 options:0];
  }
  if (v14)
  {
    v16 = -[_SUAutoInstallForecastDateCache _componentsFromDate:](self, "_componentsFromDate:", v14, v15);
    [v16 setHour:5];
    [v16 setMinute:0];
    [v16 setSecond:0];
    [v16 setNanosecond:0];
    v17 = [(NSCalendar *)self->_calendar dateFromComponents:v16];

    if (v17)
    {
      int v18 = [(NSCalendar *)self->_calendar dateByAddingUnit:64 value:5 toDate:v17 options:0];
    }
    else
    {
      int v18 = 0;
    }

    if (!a5) {
      goto LABEL_19;
    }
  }
  else
  {
    int v18 = 0;
    if (!a5) {
      goto LABEL_19;
    }
  }
  if (v11) {
    *a5 = v11;
  }
LABEL_19:
  if (a6 && v18) {
    *a6 = v18;
  }
}

- (id)_componentsFromDate:(id)a3
{
  return [(NSCalendar *)self->_calendar components:254 fromDate:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedEndDate, 0);
  objc_storeStrong((id *)&self->_roundedStartDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_weak_forecast);
}

@end