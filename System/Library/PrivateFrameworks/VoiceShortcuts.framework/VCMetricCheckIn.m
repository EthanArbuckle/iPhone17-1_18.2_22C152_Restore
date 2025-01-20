@interface VCMetricCheckIn
+ (id)recentCheckInWithMode:(int64_t)a3;
- (BOOL)isCheckInAllowed;
- (NSDate)checkInDate;
- (NSDate)currentDate;
- (NSDate)intervalStartDate;
- (NSUserDefaults)userDefaults;
- (VCMetricCheckIn)initWithCurrentDate:(id)a3 mode:(int64_t)a4 defaults:(id)a5;
- (id)calendar;
- (id)checkInKey;
- (int64_t)mode;
- (void)updateCheckInToNow;
@end

@implementation VCMetricCheckIn

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (id)checkInKey
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(VCMetricCheckIn *)self mode];
  if (v3 == 1) {
    return @"VCDailyMetricCheckInLastCheckInKey";
  }
  if (v3 == 2) {
    return @"VCWeeklyMetricCheckInLastCheckInKey";
  }
  v5 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315394;
    v7 = "-[VCMetricCheckIn checkInKey]";
    __int16 v8 = 2048;
    int64_t v9 = [(VCMetricCheckIn *)self mode];
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v6, 0x16u);
  }

  return @"fiddlesticks";
}

- (NSDate)intervalStartDate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(VCMetricCheckIn *)self mode];
  if (v3 == 1)
  {
    uint64_t v4 = 16;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    uint64_t v4 = 0x2000;
LABEL_5:
    v5 = [(VCMetricCheckIn *)self calendar];
    int v6 = [(VCMetricCheckIn *)self currentDate];
    v7 = [v5 dateByAddingUnit:v4 value:-1 toDate:v6 options:0];

    goto LABEL_9;
  }
  __int16 v8 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v10 = 136315394;
    v11 = "-[VCMetricCheckIn intervalStartDate]";
    __int16 v12 = 2048;
    int64_t v13 = [(VCMetricCheckIn *)self mode];
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v10, 0x16u);
  }

  v7 = [(VCMetricCheckIn *)self currentDate];
LABEL_9:
  return (NSDate *)v7;
}

- (NSDate)checkInDate
{
  int64_t v3 = [(VCMetricCheckIn *)self userDefaults];
  uint64_t v4 = [(VCMetricCheckIn *)self checkInKey];
  v5 = [v3 objectForKey:v4];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)updateCheckInToNow
{
  id v5 = [(VCMetricCheckIn *)self userDefaults];
  int64_t v3 = [(VCMetricCheckIn *)self currentDate];
  uint64_t v4 = [(VCMetricCheckIn *)self checkInKey];
  [v5 setObject:v3 forKey:v4];
}

- (BOOL)isCheckInAllowed
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(VCMetricCheckIn *)self checkInDate];

  if (!v3) {
    return 1;
  }
  int64_t v4 = [(VCMetricCheckIn *)self mode];
  if (v4 == 1)
  {
    uint64_t v5 = 16;
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    uint64_t v5 = 0x2000;
LABEL_7:
    v7 = [(VCMetricCheckIn *)self calendar];
    __int16 v8 = [(VCMetricCheckIn *)self currentDate];
    int64_t v9 = [(VCMetricCheckIn *)self checkInDate];
    BOOL v6 = [v7 compareDate:v8 toDate:v9 toUnitGranularity:v5] == 1;

    return v6;
  }
  int v10 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v12 = 136315394;
    int64_t v13 = "-[VCMetricCheckIn isCheckInAllowed]";
    __int16 v14 = 2048;
    int64_t v15 = [(VCMetricCheckIn *)self mode];
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v12, 0x16u);
  }

  return 0;
}

- (id)calendar
{
  return (id)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
}

- (VCMetricCheckIn)initWithCurrentDate:(id)a3 mode:(int64_t)a4 defaults:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCMetricCheckIn;
  v11 = [(VCMetricCheckIn *)&v15 init];
  int v12 = v11;
  if (v11)
  {
    v11->_mode = a4;
    objc_storeStrong((id *)&v11->_currentDate, a3);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    int64_t v13 = v12;
  }

  return v12;
}

+ (id)recentCheckInWithMode:(int64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  v7 = (void *)[v4 initWithCurrentDate:v5 mode:a3 defaults:v6];

  return v7;
}

@end