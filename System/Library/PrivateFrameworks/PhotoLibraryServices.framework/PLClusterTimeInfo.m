@interface PLClusterTimeInfo
- (BOOL)utcDateBelongsInCluster:(id)a3;
- (NSCalendar)calendar;
- (NSDate)latestUTCDate;
- (PLClusterTimeInfo)initWithCalendar:(id)a3;
- (double)endOfSameDayTimestamp;
- (double)maximumNextDayTimestamp;
- (void)_updateTimestampsWithUTCDate:(id)a3 localDate:(id)a4;
- (void)reset;
- (void)updateWithUTCDate:(id)a3 localDate:(id)a4;
@end

@implementation PLClusterTimeInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestUTCDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (NSDate)latestUTCDate
{
  return self->_latestUTCDate;
}

- (double)maximumNextDayTimestamp
{
  return self->_maximumNextDayTimestamp;
}

- (double)endOfSameDayTimestamp
{
  return self->_endOfSameDayTimestamp;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)utcDateBelongsInCluster:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceReferenceDate];
  if (self->_latestUTCDate && v5 > self->_endOfSameDayTimestamp)
  {
    if (v5 <= self->_maximumNextDayTimestamp)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      BOOL v6 = v8 <= 10800.0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)updateWithUTCDate:(id)a3 localDate:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    latestUTCDate = self->_latestUTCDate;
    objc_storeStrong((id *)&self->_latestUTCDate, a3);
    if (!latestUTCDate) {
      [(PLClusterTimeInfo *)self _updateTimestampsWithUTCDate:v7 localDate:v9];
    }
  }
  else
  {
    v11 = PLMomentsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Trying to update cluster time info with nil date. utcDate: %@, localDate: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_updateTimestampsWithUTCDate:(id)a3 localDate:(id)a4
{
  id v7 = self->_calendar;
  id v8 = a4;
  [v8 timeIntervalSinceDate:a3];
  double v10 = v9;
  id v15 = [(NSCalendar *)v7 pl_endOfDayForDate:v8];
  [v15 timeIntervalSinceReferenceDate];
  self->_endOfSameDayTimestamp = v11 - v10;
  int v12 = [(NSCalendar *)v7 pl_startOfNextDayForDate:v8];

  id v13 = [v12 dateByAddingTimeInterval:28800.0];
  [v13 timeIntervalSinceReferenceDate];
  self->_maximumNextDayTimestamp = v14 - v10;
}

- (void)reset
{
  latestUTCDate = self->_latestUTCDate;
  self->_latestUTCDate = 0;
}

- (PLClusterTimeInfo)initWithCalendar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLClusterTimeInfo;
  BOOL v6 = [(PLClusterTimeInfo *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_calendar, a3);
  }

  return v7;
}

@end