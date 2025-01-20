@interface VCSEvent
- (BOOL)fullDayEvent;
- (BOOL)isValidStatus:(unint64_t)a3;
- (VCSDate)endDate;
- (VCSDate)startDate;
- (unint64_t)entityType;
- (void)ensureDurationAlarms;
- (void)setEndDate:(id)a3;
- (void)setFullDayEvent:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation VCSEvent

- (unint64_t)entityType
{
  return 2;
}

- (VCSDate)startDate
{
  v2 = [(VCSEntity *)self propertyForName:@"DTSTART"];
  v3 = [v2 singleValue];
  v4 = [v3 value];

  return (VCSDate *)v4;
}

- (void)setStartDate:(id)a3
{
  id v4 = a3;
  v5 = [[VCSProperty alloc] initWithName:@"DTSTART" rawValue:v4 type:7];

  [(VCSEntity *)self setProperty:v5];
}

- (VCSDate)endDate
{
  v2 = [(VCSEntity *)self propertyForName:@"DTEND"];
  v3 = [v2 singleValue];
  id v4 = [v3 value];

  return (VCSDate *)v4;
}

- (void)setEndDate:(id)a3
{
  id v4 = a3;
  v5 = [[VCSProperty alloc] initWithName:@"DTEND" rawValue:v4 type:7];

  [(VCSEntity *)self setProperty:v5];
}

- (void)ensureDurationAlarms
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(VCSEntity *)self alarms];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(VCSEvent *)self startDate];
        [v8 ensureRelativeAlarmWithStartDate:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)isValidStatus:(unint64_t)a3
{
  return (a3 < 9) & (0x183u >> a3);
}

- (BOOL)fullDayEvent
{
  return self->_fullDayEvent;
}

- (void)setFullDayEvent:(BOOL)a3
{
  self->_fullDayEvent = a3;
}

@end