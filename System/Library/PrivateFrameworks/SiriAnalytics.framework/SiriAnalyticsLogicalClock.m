@interface SiriAnalyticsLogicalClock
- (BOOL)containsTimestamp:(unint64_t)a3;
- (NSUUID)clockIdentifier;
- (SiriAnalyticsLogicalClock)init;
- (SiriAnalyticsLogicalClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5;
- (SiriAnalyticsLogicalClockStatistics)clockStatistics;
- (id)description;
- (id)logicalTimestampForMachAbsoluteTime:(unint64_t)a3;
- (int64_t)timestampOffset;
- (void)stopClock;
@end

@implementation SiriAnalyticsLogicalClock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

- (SiriAnalyticsLogicalClockStatistics)clockStatistics
{
  return self->_clockStatistics;
}

- (int64_t)timestampOffset
{
  return self->_timestampOffset;
}

- (NSUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (BOOL)containsTimestamp:(unint64_t)a3
{
  if ([(SiriAnalyticsLogicalClockStatistics *)self->_clockStatistics startedOn] > a3) {
    return 0;
  }
  if ([(SiriAnalyticsLogicalClockStatistics *)self->_clockStatistics endedOn]) {
    return [(SiriAnalyticsLogicalClockStatistics *)self->_clockStatistics endedOn] >= a3;
  }
  return 1;
}

- (void)stopClock
{
  clockStatistics = self->_clockStatistics;
  uint64_t v3 = mach_absolute_time();
  [(SiriAnalyticsLogicalClockStatistics *)clockStatistics setEndedOn:v3];
}

- (id)logicalTimestampForMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v3 = [[SiriAnalyticsLogicalTimeStamp alloc] initWithMachAbsoluteTime:self->_timestampOffset + a3 clockIdentifier:self->_clockIdentifier];
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p clockIdentifier: %@>", v5, self, self->_clockIdentifier];

  return v6;
}

- (SiriAnalyticsLogicalClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsLogicalClock;
  v9 = [(SiriAnalyticsLogicalClock *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    clockIdentifier = v9->_clockIdentifier;
    v9->_clockIdentifier = (NSUUID *)v10;

    v9->_timestampOffset = a4;
    v12 = objc_alloc_init(SiriAnalyticsLogicalClockStatistics);
    clockStatistics = v9->_clockStatistics;
    v9->_clockStatistics = v12;

    [(SiriAnalyticsLogicalClockStatistics *)v9->_clockStatistics setStartedOn:a5];
  }

  return v9;
}

- (SiriAnalyticsLogicalClock)init
{
  return 0;
}

@end