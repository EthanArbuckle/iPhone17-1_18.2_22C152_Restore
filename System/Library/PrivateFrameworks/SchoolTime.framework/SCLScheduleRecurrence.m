@interface SCLScheduleRecurrence
+ (BOOL)supportsSecureCoding;
+ (id)dayOfWeekAndStartTimeComparator;
- (BOOL)intersectsRecurrence:(id)a3;
- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4;
- (BOOL)isContiguousWithRecurrence:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SCLScheduleRecurrence)initWithCoder:(id)a3;
- (SCLScheduleRecurrence)initWithTimeInterval:(id)a3 day:(int64_t)a4;
- (SCLTimeInterval)timeInterval;
- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4;
- (id)description;
- (int64_t)day;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLScheduleRecurrence

- (SCLScheduleRecurrence)initWithTimeInterval:(id)a3 day:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLScheduleRecurrence;
  v7 = [(SCLScheduleRecurrence *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    timeInterval = v7->_timeInterval;
    v7->_timeInterval = (SCLTimeInterval *)v8;

    v7->_day = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleRecurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLScheduleRecurrence;
  v5 = [(SCLScheduleRecurrence *)&v9 init];
  if (v5)
  {
    v5->_day = [v4 decodeIntegerForKey:@"day"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeInterval"];
    timeInterval = v5->_timeInterval;
    v5->_timeInterval = (SCLTimeInterval *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t day = self->_day;
  id v5 = a3;
  [v5 encodeInteger:day forKey:@"day"];
  [v5 encodeObject:self->_timeInterval forKey:@"timeInterval"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCLScheduleRecurrence *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(SCLScheduleRecurrence *)v5 day];
      if (v6 == [(SCLScheduleRecurrence *)self day])
      {
        v7 = [(SCLScheduleRecurrence *)v5 timeInterval];
        uint64_t v8 = [(SCLScheduleRecurrence *)self timeInterval];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(SCLScheduleRecurrence *)self day];
  id v4 = [(SCLScheduleRecurrence *)self timeInterval];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  v20 = NSString;
  uint64_t v18 = objc_opt_class();
  int64_t v3 = NSNumber;
  v23 = [(SCLScheduleRecurrence *)self timeInterval];
  v22 = [v23 startTime];
  id v4 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v22, "hour"));
  unint64_t v5 = NSNumber;
  v21 = [(SCLScheduleRecurrence *)self timeInterval];
  v19 = [v21 startTime];
  uint64_t v6 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v19, "minute"));
  v7 = NSNumber;
  uint64_t v8 = [(SCLScheduleRecurrence *)self timeInterval];
  char v9 = [v8 endTime];
  v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "hour"));
  objc_super v11 = NSNumber;
  v12 = [(SCLScheduleRecurrence *)self timeInterval];
  v13 = [v12 endTime];
  v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "minute"));
  v15 = NSStringForSCLDay([(SCLScheduleRecurrence *)self day]);
  objc_msgSend(v20, "stringWithFormat:", @"<%@ %p; startTime: %@:%@; endTime: %@:%@; %@>",
    v18,
    self,
    v4,
    v6,
    v10,
    v14,
  v16 = v15);

  return v16;
}

- (SCLTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (int64_t)day
{
  return self->_day;
}

- (void).cxx_destruct
{
}

- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  v7 = [(SCLScheduleRecurrence *)self dateIntervalForActiveScheduleOnOrAfterDate:v6 calendar:a4];
  LOBYTE(self) = [v7 containsDate:v6];

  return (char)self;
}

- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  char v9 = 0;
  if (v6 && v7)
  {
    uint64_t Day = [(SCLScheduleRecurrence *)self day];
    uint64_t v11 = [v8 component:512 fromDate:v6];
    v12 = [(SCLScheduleRecurrence *)self timeInterval];
    v13 = [v12 startTime];
    v14 = [v13 dateComponents];

    v15 = [(SCLScheduleRecurrence *)self timeInterval];
    v16 = [v15 endTime];
    v17 = [v16 dateComponents];

    [v14 setWeekday:Day];
    uint64_t v18 = [(SCLScheduleRecurrence *)self timeInterval];
    LODWORD(v15) = [v18 crossesDayBoundary];

    if (v15) {
      uint64_t Day = SCLGetNextDay(v11);
    }
    [v17 setWeekday:Day];
    char v9 = objc_msgSend(MEMORY[0x263F08798], "SCL_dateIntervalForActiveScheduleOnOrAfterDate:calendar:startComponents:endComponents:", v6, v8, v14, v17);
  }
  return v9;
}

- (BOOL)intersectsRecurrence:(id)a3
{
  id v4 = (SCLScheduleRecurrence *)a3;
  uint64_t v5 = [(SCLScheduleRecurrence *)v4 day];
  int64_t v6 = [(SCLScheduleRecurrence *)self day];
  id v7 = [(SCLScheduleRecurrence *)self timeInterval];
  uint64_t v8 = v7;
  if (v5 != v6)
  {
    if ([v7 crossesDayBoundary])
    {
      uint64_t Day = SCLGetNextDay([(SCLScheduleRecurrence *)self day]);
      uint64_t v12 = [(SCLScheduleRecurrence *)v4 day];

      if (Day == v12)
      {
        uint64_t v8 = [(SCLScheduleRecurrence *)v4 timeInterval];
        char v9 = [v8 startTime];
        v13 = self;
LABEL_10:
        v16 = [(SCLScheduleRecurrence *)v13 timeInterval];
        v17 = [v16 startTime];
        char v10 = [v9 compare:v17] == -1;

        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v8 = [(SCLScheduleRecurrence *)v4 timeInterval];
    if (![v8 crossesDayBoundary])
    {
      char v10 = 0;
      goto LABEL_12;
    }
    uint64_t v14 = SCLGetPreviousDay([(SCLScheduleRecurrence *)self day]);
    uint64_t v15 = [(SCLScheduleRecurrence *)v4 day];

    if (v14 != v15)
    {
      char v10 = 0;
      goto LABEL_13;
    }
    uint64_t v8 = [(SCLScheduleRecurrence *)self timeInterval];
    char v9 = [v8 startTime];
    v13 = v4;
    goto LABEL_10;
  }
  char v9 = [(SCLScheduleRecurrence *)v4 timeInterval];
  char v10 = [v8 intersectsTimeInterval:v9];
LABEL_11:

LABEL_12:
LABEL_13:

  return v10;
}

- (BOOL)isContiguousWithRecurrence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCLScheduleRecurrence *)self timeInterval];
  int64_t v6 = [v5 endTime];

  uint64_t v7 = [v4 day];
  if (v7 == [(SCLScheduleRecurrence *)self day])
  {
    uint64_t v8 = [(SCLScheduleRecurrence *)self timeInterval];
    char v9 = [v8 crossesDayBoundary];

    if ((v9 & 1) == 0)
    {
      char v10 = [v4 timeInterval];
      v13 = [v10 startTime];
      char v16 = [v6 isEqual:v13];
LABEL_10:

      goto LABEL_11;
    }
  }
  char v10 = [(SCLScheduleRecurrence *)self timeInterval];
  if (([v10 crossesDayBoundary] & 1) != 0 || !objc_msgSend(v6, "hour") && !objc_msgSend(v6, "minute"))
  {
    uint64_t Day = SCLGetNextDay([(SCLScheduleRecurrence *)self day]);
    uint64_t v12 = [v4 day];

    if (Day != v12)
    {
      char v16 = 0;
      goto LABEL_13;
    }
    char v10 = [(SCLScheduleRecurrence *)self timeInterval];
    v13 = [v10 endTime];
    uint64_t v14 = [v4 timeInterval];
    uint64_t v15 = [v14 startTime];
    char v16 = [v13 isEqual:v15];

    goto LABEL_10;
  }
  char v16 = 0;
LABEL_11:

LABEL_13:
  return v16;
}

+ (id)dayOfWeekAndStartTimeComparator
{
  return &__block_literal_global;
}

uint64_t __66__SCLScheduleRecurrence_Extended__dayOfWeekAndStartTimeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "day"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "day"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    char v9 = [v4 timeInterval];
    char v10 = [v9 startTime];
    uint64_t v11 = [v5 timeInterval];
    uint64_t v12 = [v11 startTime];
    uint64_t v8 = [v10 compare:v12];
  }
  return v8;
}

@end