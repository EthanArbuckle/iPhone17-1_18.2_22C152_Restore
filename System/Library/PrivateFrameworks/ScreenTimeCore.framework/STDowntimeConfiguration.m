@interface STDowntimeConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDowntimeState:(id)a3;
- (NSCalendar)calendar;
- (NSDate)currentDate;
- (NSDate)nextStateChangeDate;
- (STDowntimeConfiguration)initWithCurrentState:(int64_t)a3 currentDate:(id)a4 nextState:(int64_t)a5 nextStateChangeDate:(id)a6 calendar:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)currentState;
- (int64_t)nextState;
- (unint64_t)hash;
@end

@implementation STDowntimeConfiguration

- (STDowntimeConfiguration)initWithCurrentState:(int64_t)a3 currentDate:(id)a4 nextState:(int64_t)a5 nextStateChangeDate:(id)a6 calendar:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)STDowntimeConfiguration;
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  v14 = [(STDowntimeConfiguration *)&v22 init];
  v14->_currentState = a3;
  uint64_t v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  currentDate = v14->_currentDate;
  v14->_currentDate = (NSDate *)v15;

  v14->_nextState = a5;
  uint64_t v17 = [v12 copy];

  nextStateChangeDate = v14->_nextStateChangeDate;
  v14->_nextStateChangeDate = (NSDate *)v17;

  uint64_t v19 = [v11 copy];
  calendar = v14->_calendar;
  v14->_calendar = (NSCalendar *)v19;

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(STDowntimeConfiguration *)self currentState] - 1;
  if (v5 > 3) {
    v6 = @"Disabled";
  }
  else {
    v6 = off_1E6BC79A0[v5];
  }
  unint64_t v7 = [(STDowntimeConfiguration *)self nextState] - 1;
  if (v7 > 3) {
    v8 = @"Disabled";
  }
  else {
    v8 = off_1E6BC79A0[v7];
  }
  v9 = [(STDowntimeConfiguration *)self currentDate];
  v10 = [(STDowntimeConfiguration *)self nextStateChangeDate];
  id v11 = [(STDowntimeConfiguration *)self calendar];
  id v12 = [v11 calendarIdentifier];
  id v13 = [v3 stringWithFormat:@"<%@: %p { Current: %@, Next: %@, CurrentDate: %@, NextDate: %@, Calendar: %@ }>", v4, self, v6, v8, v9, v10, v12];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t currentState = self->_currentState;
  currentDate = self->_currentDate;
  int64_t nextState = self->_nextState;
  nextStateChangeDate = self->_nextStateChangeDate;
  calendar = self->_calendar;
  return (id)[v4 initWithCurrentState:currentState currentDate:currentDate nextState:nextState nextStateChangeDate:nextStateChangeDate calendar:calendar];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDowntimeConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STDowntimeConfiguration *)self isEqualToDowntimeState:v4];
  }

  return v5;
}

- (BOOL)isEqualToDowntimeState:(id)a3
{
  id v4 = (STDowntimeConfiguration *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    int64_t v5 = [(STDowntimeConfiguration *)self currentState];
    if (v5 == [(STDowntimeConfiguration *)v4 currentState])
    {
      int64_t v6 = [(STDowntimeConfiguration *)self nextState];
      if (v6 == [(STDowntimeConfiguration *)v4 nextState])
      {
        unint64_t v7 = [(STDowntimeConfiguration *)self currentDate];
        v8 = [(STDowntimeConfiguration *)v4 currentDate];
        if (![v7 isEqualToDate:v8])
        {
          char v13 = 0;
LABEL_17:

          goto LABEL_18;
        }
        v9 = [(STDowntimeConfiguration *)self nextStateChangeDate];
        uint64_t v10 = [(STDowntimeConfiguration *)v4 nextStateChangeDate];
        if (v9 == (void *)v10)
        {
          [(STDowntimeConfiguration *)self calendar];
        }
        else
        {
          id v11 = [(STDowntimeConfiguration *)self nextStateChangeDate];
          id v12 = [(STDowntimeConfiguration *)v4 nextStateChangeDate];
          if (![v11 isEqualToDate:v12])
          {
            char v13 = 0;
LABEL_15:

            v18 = (void *)v10;
LABEL_16:

            goto LABEL_17;
          }
          [(STDowntimeConfiguration *)self calendar];
        v14 = };
        uint64_t v15 = [v14 calendarIdentifier];
        v16 = [(STDowntimeConfiguration *)v4 calendar];
        uint64_t v17 = [v16 calendarIdentifier];
        char v13 = [v15 isEqualToString:v17];

        v18 = v9;
        id v12 = v21;
        id v11 = v23;
        if (v9 == (void *)v10) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    char v13 = 0;
  }
LABEL_18:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(STDowntimeConfiguration *)self currentState];
  int64_t v4 = [(STDowntimeConfiguration *)self nextState] ^ v3;
  int64_t v5 = [(STDowntimeConfiguration *)self currentDate];
  uint64_t v6 = v4 ^ [v5 hash];
  unint64_t v7 = [(STDowntimeConfiguration *)self nextStateChangeDate];
  uint64_t v8 = [v7 hash];
  v9 = [(STDowntimeConfiguration *)self calendar];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (NSDate)currentDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)nextState
{
  return self->_nextState;
}

- (NSDate)nextStateChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_nextStateChangeDate, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end