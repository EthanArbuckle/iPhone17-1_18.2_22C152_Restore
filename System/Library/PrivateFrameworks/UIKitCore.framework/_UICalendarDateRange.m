@interface _UICalendarDateRange
- (NSDateComponents)endDate;
- (NSDateComponents)startDate;
- (_UICalendarDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (id)allDatesInRangeForCalendar:(id)a3;
@end

@implementation _UICalendarDateRange

- (_UICalendarDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_UICalendarDateRange;
  v10 = [(_UICalendarDateRange *)&v26 init];
  if (v10)
  {
    v11 = [v8 calendar];
    v12 = [v9 calendar];
    char v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [(NSDateComponents *)v10->_startDate calendar];
      v24 = [(NSDateComponents *)v10->_endDate calendar];
      [v22 handleFailureInMethod:a2, v10, @"_UICalendarRangeSelection.m", 22, @"startDate.calendar and endDate.calendar must match. Start (%@) != End (%@)", v23, v24 object file lineNumber description];
    }
    v14 = [v8 calendar];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    v17 = v16;

    v18 = [v17 dateFromComponents:v8];
    v19 = [v17 dateFromComponents:v9];
    uint64_t v20 = [v18 compare:v19];

    if (v20 == 1)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v10, @"_UICalendarRangeSelection.m", 25, @"Start Date (%@) must be before End Date (%@)", v8, v9 object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }
  return v10;
}

- (id)allDatesInRangeForCalendar:(id)a3
{
  id v4 = a3;
  v5 = [v4 dateFromComponents:self->_startDate];
  v6 = [v4 dateFromComponents:self->_endDate];
  if ([v5 compare:v6] == 1)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[_UICalendarDateRange allDatesInRangeForCalendar:]"];
    [v13 handleFailureInFunction:v14 file:@"_UICalendarRangeSelection.m" lineNumber:37 description:@"Start date must be before the end date"];
  }
  v7 = objc_opt_new();
  id v8 = v5;
  id v9 = v8;
  if ([v8 compare:v6] != 1)
  {
    v10 = v8;
    do
    {
      v11 = [v4 components:1048606 fromDate:v10];
      [v7 addObject:v11];
      id v9 = [v4 dateByAddingUnit:16 value:1 toDate:v10 options:0];

      v10 = v9;
    }
    while ([v9 compare:v6] != 1);
  }

  return v7;
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (NSDateComponents)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end