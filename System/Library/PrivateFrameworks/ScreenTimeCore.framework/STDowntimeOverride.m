@interface STDowntimeOverride
+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 endDate:(id)a6;
+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 fixedDuration:(id)a6;
- (BOOL)isActiveAtDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDowntimeOverride:(id)a3;
- (BOOL)isExpiredAtDate:(id)a3;
- (NSCalendar)calendar;
- (NSDate)creationDate;
- (NSDate)endDate;
- (id)_initWithType:(int64_t)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6 endDate:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)modificationBasedOnScheduleChangeAtDate:(id)a3;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation STDowntimeOverride

- (id)_initWithType:(int64_t)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6 endDate:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)STDowntimeOverride;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [(STDowntimeOverride *)&v22 init];
  v14->_type = a3;
  v14->_state = a4;
  uint64_t v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  creationDate = v14->_creationDate;
  v14->_creationDate = (NSDate *)v15;

  uint64_t v17 = [v12 copy];
  calendar = v14->_calendar;
  v14->_calendar = (NSCalendar *)v17;

  uint64_t v19 = [v11 copy];
  endDate = v14->_endDate;
  v14->_endDate = (NSDate *)v19;

  return v14;
}

+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 fixedDuration:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  [a6 doubleValue];
  id v12 = objc_msgSend(v11, "dateByAddingTimeInterval:");
  id v13 = (void *)[objc_alloc((Class)a1) _initWithType:1 state:a3 creationDate:v11 calendar:v10 endDate:v12];

  return (STDowntimeOverride *)v13;
}

+ (STDowntimeOverride)overrideWithState:(int64_t)a3 creationDate:(id)a4 calendar:(id)a5 endDate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)[objc_alloc((Class)a1) _initWithType:0 state:a3 creationDate:v12 calendar:v11 endDate:v10];

  return (STDowntimeOverride *)v13;
}

- (BOOL)isActiveAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(STDowntimeOverride *)self creationDate];
  if ([v5 compare:v4] == 1)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [(STDowntimeOverride *)self endDate];
    BOOL v6 = [v7 compare:v4] != -1;
  }
  return v6;
}

- (BOOL)isExpiredAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(STDowntimeOverride *)self endDate];
  uint64_t v6 = [v5 compare:v4];

  return v6 != 1;
}

- (int64_t)modificationBasedOnScheduleChangeAtDate:(id)a3
{
  return ![(STDowntimeOverride *)self isExpiredAtDate:a3]
      && [(STDowntimeOverride *)self state] == 1;
}

- (id)description
{
  if ([(STDowntimeOverride *)self type] == 1)
  {
    v3 = NSNumber;
    id v4 = [(STDowntimeOverride *)self endDate];
    v5 = [(STDowntimeOverride *)self creationDate];
    [v4 timeIntervalSinceDate:v5];
    uint64_t v6 = objc_msgSend(v3, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  if ([(STDowntimeOverride *)self type]) {
    v9 = @"FixedDuration";
  }
  else {
    v9 = @"Automatic";
  }
  if ([(STDowntimeOverride *)self state] == 1) {
    id v10 = @"Enabled";
  }
  else {
    id v10 = @"Disabled";
  }
  id v11 = [(STDowntimeOverride *)self creationDate];
  id v12 = [(STDowntimeOverride *)self calendar];
  id v13 = [v12 calendarIdentifier];
  v14 = [(STDowntimeOverride *)self endDate];
  uint64_t v15 = [v7 stringWithFormat:@"<%@: %p { Type: %@, State: %@, CreationDate: %@, Calendar: %@, FixedDuration: %@, EndDate: %@ }>", v8, self, v9, v10, v11, v13, v6, v14];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t type = self->_type;
  int64_t state = self->_state;
  creationDate = self->_creationDate;
  calendar = self->_calendar;
  endDate = self->_endDate;
  return (id)[v4 _initWithType:type state:state creationDate:creationDate calendar:calendar endDate:endDate];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDowntimeOverride *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STDowntimeOverride *)self isEqualToDowntimeOverride:v4];
  }

  return v5;
}

- (BOOL)isEqualToDowntimeOverride:(id)a3
{
  id v4 = (STDowntimeOverride *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    int64_t v5 = [(STDowntimeOverride *)self type];
    if (v5 == [(STDowntimeOverride *)v4 type]
      && (int64_t v6 = [(STDowntimeOverride *)self state], v6 == [(STDowntimeOverride *)v4 state]))
    {
      v7 = [(STDowntimeOverride *)self creationDate];
      uint64_t v8 = [(STDowntimeOverride *)v4 creationDate];
      if ([v7 isEqualToDate:v8])
      {
        v9 = [(STDowntimeOverride *)self calendar];
        id v10 = [v9 calendarIdentifier];
        id v11 = [(STDowntimeOverride *)v4 calendar];
        id v12 = [v11 calendarIdentifier];
        if ([v10 isEqualToString:v12])
        {
          id v13 = [(STDowntimeOverride *)self endDate];
          v14 = [(STDowntimeOverride *)v4 endDate];
          char v15 = [v13 isEqualToDate:v14];
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  int64_t v3 = [(STDowntimeOverride *)self type];
  int64_t v4 = [(STDowntimeOverride *)self state] ^ v3;
  int64_t v5 = [(STDowntimeOverride *)self calendar];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(STDowntimeOverride *)self creationDate];
  uint64_t v8 = [v7 hash];
  v9 = [(STDowntimeOverride *)self endDate];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end