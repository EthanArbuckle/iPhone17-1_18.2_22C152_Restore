@interface _UIDatePickerDateRange
- (BOOL)_containsDate:(id)a3 withAccuracy:(unint64_t)a4 inCalendar:(id)a5;
- (BOOL)containsDate:(id)a3;
- (BOOL)containsDay:(id)a3;
- (BOOL)containsMonth:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (_UIDatePickerDateRange)init;
- (_UIDatePickerDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (id)copyWithEndDate:(id)a3;
- (id)copyWithStartDate:(id)a3;
- (id)dateInRangeForDate:(id)a3;
@end

@implementation _UIDatePickerDateRange

- (_UIDatePickerDateRange)init
{
  return [(_UIDatePickerDateRange *)self initWithStartDate:0 endDate:0];
}

- (_UIDatePickerDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerDateRange;
  v9 = [(_UIDatePickerDateRange *)&v11 init];
  if (v9)
  {
    if (v7 && v8 && [v7 compare:v8] == 1) {
      *(unsigned char *)&v9->_flags |= 1u;
    }
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v9->_endDate, a4);
  }

  return v9;
}

- (id)copyWithStartDate:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDatePickerDateRange alloc] initWithStartDate:v4 endDate:self->_endDate];

  return v5;
}

- (id)copyWithEndDate:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDatePickerDateRange alloc] initWithStartDate:self->_startDate endDate:v4];

  return v5;
}

- (BOOL)containsDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDatePickerDateRange.m", 52, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  if (*(unsigned char *)&self->_flags)
  {
    BOOL v7 = 1;
  }
  else
  {
    startDate = self->_startDate;
    if (startDate) {
      BOOL v7 = [(NSDate *)startDate compare:v5] != NSOrderedDescending;
    }
    else {
      BOOL v7 = 1;
    }
    if (self->_endDate && objc_msgSend(v5, "compare:") == 1) {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_containsDate:(id)a3 withAccuracy:(unint64_t)a4 inCalendar:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(_UIDatePickerDateRange *)self containsDate:v9])
  {
    BOOL v11 = 1;
  }
  else
  {
    id v18 = 0;
    double v19 = 0.0;
    char v12 = [v10 rangeOfUnit:a4 startDate:&v18 interval:&v19 forDate:v9];
    id v13 = v18;
    if ((v12 & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"_UIDatePickerDateRange.m", 80, @"Unable to calculate range for date %@ in calendar %@ with accuracy %tu.", v9, v10, a4 object file lineNumber description];
    }
    startDate = self->_startDate;
    if (startDate)
    {
      v15 = [v13 dateByAddingTimeInterval:v19];
      BOOL v11 = [(NSDate *)startDate compare:v15] == NSOrderedAscending;
    }
    else
    {
      BOOL v11 = 1;
    }
    if (self->_endDate && objc_msgSend(v13, "compare:") == 1) {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (id)dateInRangeForDate:(id)a3
{
  id v5 = a3;
  if ([(_UIDatePickerDateRange *)self containsDate:v5])
  {
    v6 = (NSDate *)v5;
    goto LABEL_11;
  }
  if (self->_startDate && objc_msgSend(v5, "compare:") == -1)
  {
    startDate = self->_startDate;
  }
  else
  {
    endDate = self->_endDate;
    if (!endDate || [(NSDate *)endDate compare:v5] != NSOrderedAscending)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIDatePickerDateRange.m", 102, @"Invalid state. Unable to find closest valid date to date %@ with lower bounds %@ and upper bounds %@.", v5, self->_startDate, self->_endDate object file lineNumber description];

      v6 = (NSDate *)objc_opt_new();
      goto LABEL_11;
    }
    startDate = self->_endDate;
  }
  v6 = startDate;
LABEL_11:
  id v10 = v6;

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (BOOL)containsMonth:(id)a3
{
  id v4 = a3;
  id v5 = [v4 date];
  v6 = [v4 calendar];

  LOBYTE(self) = [(_UIDatePickerDateRange *)self _containsDate:v5 withAccuracy:8 inCalendar:v6];
  return (char)self;
}

- (BOOL)containsDay:(id)a3
{
  id v4 = a3;
  id v5 = [v4 date];
  v6 = [v4 calendar];

  LOBYTE(self) = [(_UIDatePickerDateRange *)self _containsDate:v5 withAccuracy:16 inCalendar:v6];
  return (char)self;
}

@end