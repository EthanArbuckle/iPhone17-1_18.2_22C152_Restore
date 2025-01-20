@interface SCLUnlockHistoryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSCalendar)calendar;
- (NSDateInterval)unlockedInterval;
- (NSTimeZone)timeZone;
- (SCLScheduleRecurrence)effectiveRecurrence;
- (SCLScheduleTime)scheduleEndTime;
- (SCLScheduleTime)scheduleStartTime;
- (SCLUnlockHistoryItem)initWithCoder:(id)a3;
- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5;
- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5 startTime:(id)a6 endTime:(id)a7;
- (id)description;
- (unint64_t)hash;
- (void)_loadEffectiveRecurrence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLUnlockHistoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[SCLScheduleTime alloc] initWithHour:0 minute:0];
  v12 = [(SCLUnlockHistoryItem *)self initWithInterval:v10 calendar:v9 timeZone:v8 startTime:v11 endTime:v11];

  return v12;
}

- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5 startTime:(id)a6 endTime:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCLUnlockHistoryItem;
  v17 = [(SCLUnlockHistoryItem *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    unlockedInterval = v17->_unlockedInterval;
    v17->_unlockedInterval = (NSDateInterval *)v18;

    uint64_t v20 = [v13 copy];
    calendar = v17->_calendar;
    v17->_calendar = (NSCalendar *)v20;

    uint64_t v22 = [v14 copy];
    timeZone = v17->_timeZone;
    v17->_timeZone = (NSTimeZone *)v22;

    uint64_t v24 = [v15 copy];
    scheduleStartTime = v17->_scheduleStartTime;
    v17->_scheduleStartTime = (SCLScheduleTime *)v24;

    uint64_t v26 = [v16 copy];
    scheduleEndTime = v17->_scheduleEndTime;
    v17->_scheduleEndTime = (SCLScheduleTime *)v26;

    [(SCLUnlockHistoryItem *)v17 _loadEffectiveRecurrence];
  }

  return v17;
}

- (SCLUnlockHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SCLUnlockHistoryItem;
  v5 = [(SCLUnlockHistoryItem *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    unlockedInterval = v5->_unlockedInterval;
    v5->_unlockedInterval = (NSDateInterval *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarIdentifier"];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:v8];
      calendar = v5->_calendar;
      v5->_calendar = (NSCalendar *)v9;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZoneName"];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263EFFA18] timeZoneWithName:v11];
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSTimeZone *)v12;
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    scheduleStartTime = v5->_scheduleStartTime;
    v5->_scheduleStartTime = (SCLScheduleTime *)v14;

    if (!v5->_scheduleStartTime)
    {
      id v16 = [[SCLScheduleTime alloc] initWithHour:0 minute:0];
      v17 = v5->_scheduleStartTime;
      v5->_scheduleStartTime = v16;
    }
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    scheduleEndTime = v5->_scheduleEndTime;
    v5->_scheduleEndTime = (SCLScheduleTime *)v18;

    if (!v5->_scheduleEndTime)
    {
      uint64_t v20 = [[SCLScheduleTime alloc] initWithHour:0 minute:0];
      v21 = v5->_scheduleEndTime;
      v5->_scheduleEndTime = v20;
    }
    [(SCLUnlockHistoryItem *)v5 _loadEffectiveRecurrence];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unlockedInterval = self->_unlockedInterval;
  id v7 = a3;
  [v7 encodeObject:unlockedInterval forKey:@"interval"];
  v5 = [(NSCalendar *)self->_calendar calendarIdentifier];
  [v7 encodeObject:v5 forKey:@"calendarIdentifier"];

  uint64_t v6 = [(NSTimeZone *)self->_timeZone name];
  [v7 encodeObject:v6 forKey:@"timeZoneName"];

  [v7 encodeObject:self->_scheduleStartTime forKey:@"startTime"];
  [v7 encodeObject:self->_scheduleEndTime forKey:@"endTime"];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_unlockedInterval hash];
  id v4 = [(NSCalendar *)self->_calendar calendarIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(NSTimeZone *)self->_timeZone name];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(SCLScheduleTime *)self->_scheduleStartTime hash];
  unint64_t v9 = v8 ^ [(SCLScheduleTime *)self->_scheduleEndTime hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 unlockedInterval];
    uint64_t v7 = [(SCLUnlockHistoryItem *)self unlockedInterval];
    if ([v6 isEqual:v7])
    {
      unint64_t v8 = [v5 calendar];
      unint64_t v9 = [v8 calendarIdentifier];
      id v10 = [(SCLUnlockHistoryItem *)self calendar];
      v11 = [v10 calendarIdentifier];
      if ([v9 isEqual:v11])
      {
        uint64_t v24 = v8;
        uint64_t v26 = [v5 timeZone];
        uint64_t v12 = [v26 name];
        id v13 = [(SCLUnlockHistoryItem *)self timeZone];
        [v13 name];
        objc_super v23 = v25 = v12;
        if (objc_msgSend(v12, "isEqual:"))
        {
          uint64_t v14 = [v5 scheduleStartTime];
          v21 = [(SCLUnlockHistoryItem *)self scheduleStartTime];
          uint64_t v22 = v14;
          int v15 = objc_msgSend(v14, "isEqual:");
          id v16 = v13;
          unint64_t v8 = v24;
          if (v15)
          {
            uint64_t v20 = [v5 scheduleEndTime];
            v19 = [(SCLUnlockHistoryItem *)self scheduleEndTime];
            char v17 = [v20 isEqual:v19];
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
          id v16 = v13;
          unint64_t v8 = v24;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)_loadEffectiveRecurrence
{
  uint64_t v3 = [SCLTimeInterval alloc];
  id v4 = [(SCLUnlockHistoryItem *)self scheduleStartTime];
  id v5 = [(SCLUnlockHistoryItem *)self scheduleEndTime];
  uint64_t v12 = [(SCLTimeInterval *)v3 initWithStartTime:v4 endTime:v5];

  uint64_t v6 = [(SCLUnlockHistoryItem *)self calendar];
  uint64_t v7 = [(SCLUnlockHistoryItem *)self unlockedInterval];
  unint64_t v8 = [v7 startDate];
  uint64_t v9 = [v6 component:512 fromDate:v8];

  id v10 = [[SCLScheduleRecurrence alloc] initWithTimeInterval:v12 day:v9];
  effectiveRecurrence = self->_effectiveRecurrence;
  self->_effectiveRecurrence = v10;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(SCLUnlockHistoryItem *)self unlockedInterval];
  id v5 = (id)[v3 appendObject:v4 withName:@"interval"];

  uint64_t v6 = [(SCLUnlockHistoryItem *)self calendar];
  uint64_t v7 = [v6 calendarIdentifier];
  id v8 = (id)[v3 appendObject:v7 withName:@"calendar"];

  uint64_t v9 = [(SCLUnlockHistoryItem *)self timeZone];
  id v10 = [v9 name];
  id v11 = (id)[v3 appendObject:v10 withName:@"timezone"];

  uint64_t v12 = [(SCLUnlockHistoryItem *)self scheduleStartTime];
  id v13 = (id)[v3 appendObject:v12 withName:@"scheduleStartTime"];

  uint64_t v14 = [(SCLUnlockHistoryItem *)self scheduleEndTime];
  id v15 = (id)[v3 appendObject:v14 withName:@"scheduleEndTime"];

  id v16 = [v3 build];

  return v16;
}

- (NSDateInterval)unlockedInterval
{
  return self->_unlockedInterval;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (SCLScheduleTime)scheduleStartTime
{
  return self->_scheduleStartTime;
}

- (SCLScheduleTime)scheduleEndTime
{
  return self->_scheduleEndTime;
}

- (SCLScheduleRecurrence)effectiveRecurrence
{
  return self->_effectiveRecurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveRecurrence, 0);
  objc_storeStrong((id *)&self->_scheduleEndTime, 0);
  objc_storeStrong((id *)&self->_scheduleStartTime, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_unlockedInterval, 0);
}

@end