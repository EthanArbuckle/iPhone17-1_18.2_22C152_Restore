@interface HDSPWakeUpResultsNotificationBuilder
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)_didMeetSleepDurationGoalLastNight;
- (BOOL)hasSufficientSleepData;
- (HDSPWakeUpResultsNotificationBuilder)initWithDaySummaries:(id)a3 morningIndexRange:(id)a4 userFirstName:(id)a5;
- (NSArray)daySummaries;
- (NSString)userFirstName;
- (id)_notificationForCategory:(unint64_t)a3 morningIndexRange:(id)a4 goalAchieved:(id)a5;
- (id)_sleepDurationGoalAchievedLastNightNotification;
- (id)_sleepDurationGoalAchievedShortWeekNotification;
- (id)_sleepDurationGoalAchievedTwoWeekNotification;
- (id)buildNotification;
- (int64_t)_randomNotificationVariantForCategory:(unint64_t)a3;
@end

@implementation HDSPWakeUpResultsNotificationBuilder

- (HDSPWakeUpResultsNotificationBuilder)initWithDaySummaries:(id)a3 morningIndexRange:(id)a4 userFirstName:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDSPWakeUpResultsNotificationBuilder;
  v11 = [(HDSPWakeUpResultsNotificationBuilder *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    daySummaries = v11->_daySummaries;
    v11->_daySummaries = (NSArray *)v12;

    v11->_morningIndexRange.start = var0;
    v11->_morningIndexRange.duration = var1;
    objc_storeStrong((id *)&v11->_userFirstName, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)hasSufficientSleepData
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_morningIndexRange.start == *MEMORY[0x263F094E8]
    && self->_morningIndexRange.duration == *(void *)(MEMORY[0x263F094E8] + 8))
  {
    uint64_t v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      id v16 = v15;
      v17 = NSStringFromHKDayIndexRange();
      int v19 = 138543618;
      id v20 = v15;
      __int16 v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Init failed: Invalid morning index range %{public}@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_23;
  }
  daySummaries = self->_daySummaries;
  if (!daySummaries)
  {
    uint64_t v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v13 = v20;
      v14 = "[%{public}@] Init failed: Nil sleep day summaries";
      goto LABEL_22;
    }
LABEL_23:

    return 0;
  }
  if (![(NSArray *)daySummaries count])
  {
    uint64_t v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v13 = v20;
      v14 = "[%{public}@] Init failed: Zero sleep day summaries";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v5 = [(NSArray *)self->_daySummaries lastObject];
  uint64_t v6 = [v5 morningIndex];
  int64_t duration = self->_morningIndexRange.duration;
  if (duration <= 0) {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v8 = self->_morningIndexRange.start + duration - 1;
  }

  if (v6 != v8)
  {
    uint64_t v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v13 = v20;
      v14 = "[%{public}@] Init failed: No sleep day summary for last night";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v9 = [(NSArray *)self->_daySummaries lastObject];
  [v9 sleepDuration];
  double v11 = v10;

  if (v11 <= 0.0)
  {
    uint64_t v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v13 = v20;
      v14 = "[%{public}@] Init failed: No asleep duration for last night";
LABEL_22:
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0xCu);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  return 1;
}

- (id)buildNotification
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    daySummaries = self->_daySummaries;
    id v6 = v4;
    uint64_t v7 = [(NSArray *)daySummaries count];
    int64_t v8 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138543874;
    v32 = v4;
    __int16 v33 = 2048;
    uint64_t v34 = v7;
    __int16 v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building notification from %lu summaries in range %{public}@", buf, 0x20u);
  }
  if (HKShowSensitiveLogItems())
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = self->_daySummaries;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v27;
      *(void *)&long long v11 = 138543618;
      long long v25 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = HKSPLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = self;
            v17 = objc_opt_class();
            id v18 = v17;
            int v19 = HKSensitiveLogItem();
            *(_DWORD *)buf = v25;
            v32 = v17;
            self = v16;
            __int16 v33 = 2114;
            uint64_t v34 = (uint64_t)v19;
            _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Summary: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }
  }
  if ([(HDSPWakeUpResultsNotificationBuilder *)self _didMeetSleepDurationGoalLastNight])
  {
    id v20 = [(HDSPWakeUpResultsNotificationBuilder *)self _sleepDurationGoalAchievedTwoWeekNotification];
    if (!v20)
    {
      id v20 = [(HDSPWakeUpResultsNotificationBuilder *)self _sleepDurationGoalAchievedShortWeekNotification];
      if (!v20)
      {
        id v20 = [(HDSPWakeUpResultsNotificationBuilder *)self _sleepDurationGoalAchievedLastNightNotification];
      }
    }
  }
  else
  {
    __int16 v21 = HKSPLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      id v23 = v22;
      _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not meet sleep duration goal last night; this is required for all notifications",
        buf,
        0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

- (BOOL)_didMeetSleepDurationGoalLastNight
{
  int64_t duration = self->_morningIndexRange.duration;
  if (duration <= 0) {
    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v3 = self->_morningIndexRange.start + duration - 1;
  }
  v4 = objc_msgSend(MEMORY[0x263F75F50], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v3, 1);
  BOOL v5 = [v4 sleepDurationGoalAchievedCount] == 1;

  return v5;
}

- (id)_sleepDurationGoalAchievedTwoWeekNotification
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t start = self->_morningIndexRange.start;
  int64_t duration = self->_morningIndexRange.duration;
  BOOL v5 = objc_msgSend(MEMORY[0x263F75F50], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, start, duration);
  uint64_t v6 = [v5 sleepDurationGoalAchievedCount];
  if (v6 <= 9)
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v8 = v17;
      id v9 = "[%{public}@] Not enough days achieved for two-week goal notification";
LABEL_7:
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v10 = v6;
  if ((unint64_t)v6 >= 0xF)
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v8 = v17;
      id v9 = "[%{public}@] Too many days achieved for two-week goal notification";
      goto LABEL_7;
    }
LABEL_8:

    long long v11 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = (void *)MEMORY[0x263F0A630];
  uint64_t v13 = [MEMORY[0x263F0A830] dayUnit];
  v14 = [v12 quantityWithUnit:v13 doubleValue:(double)v10];

  long long v11 = -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 2, start, duration, v14);

LABEL_10:

  return v11;
}

- (id)_sleepDurationGoalAchievedShortWeekNotification
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v3 = self->_morningIndexRange.start + 10;
  v4 = objc_msgSend(MEMORY[0x263F75F50], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v3, 4);
  uint64_t v5 = [v4 sleepDurationGoalAchievedCount];
  if (v5 <= 2)
  {
    uint64_t v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v7 = v16;
      id v8 = "[%{public}@] Not enough days achieved for short-week goal notification";
LABEL_7:
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v9 = v5;
  if ((unint64_t)v5 >= 5)
  {
    uint64_t v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v7 = v16;
      id v8 = "[%{public}@] Too many days achieved for short-week goal notification";
      goto LABEL_7;
    }
LABEL_8:

    uint64_t v10 = 0;
    goto LABEL_10;
  }
  long long v11 = (void *)MEMORY[0x263F0A630];
  uint64_t v12 = [MEMORY[0x263F0A830] dayUnit];
  uint64_t v13 = [v11 quantityWithUnit:v12 doubleValue:(double)v9];

  uint64_t v10 = -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 1, v3, 4, v13);

LABEL_10:

  return v10;
}

- (id)_sleepDurationGoalAchievedLastNightNotification
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t duration = self->_morningIndexRange.duration;
  if (duration <= 0) {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v4 = self->_morningIndexRange.start + duration - 1;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x263F75F50], "sleepMetricsForDaySummaries:inMorningIndexRange:", self->_daySummaries, v4, 1);
  uint64_t v6 = [v5 sleepDurationGoalAchievedCount];
  if (v6 <= 0)
  {
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      uint64_t v12 = "[%{public}@] Not enough days achieved for last night goal notification";
LABEL_11:
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v6 == 1)
    {
      id v7 = [(NSArray *)self->_daySummaries lastObject];
      id v8 = [v7 sleepDurationGoal];

      uint64_t v9 = -[HDSPWakeUpResultsNotificationBuilder _notificationForCategory:morningIndexRange:goalAchieved:](self, "_notificationForCategory:morningIndexRange:goalAchieved:", 0, v4, 1, v8);

      goto LABEL_13;
    }
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      uint64_t v12 = "[%{public}@] Too many days achieved for last night goal notification";
      goto LABEL_11;
    }
  }

  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (int64_t)_randomNotificationVariantForCategory:(unint64_t)a3
{
  if (a3 > 2) {
    uint32_t v3 = 0;
  }
  else {
    uint32_t v3 = dword_221AD6330[a3];
  }
  return arc4random_uniform(v3) + 1;
}

- (id)_notificationForCategory:(unint64_t)a3 morningIndexRange:(id)a4 goalAchieved:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v9 = a5;
  uint64_t v10 = [HDSPWakeUpResultsNotification alloc];
  if (var1 <= 0) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = var1 + var0 - 1;
  }
  int64_t v12 = [(HDSPWakeUpResultsNotificationBuilder *)self _randomNotificationVariantForCategory:a3];
  uint64_t v13 = [(HDSPWakeUpResultsNotificationBuilder *)self userFirstName];
  int v14 = [(HDSPWakeUpResultsNotification *)v10 initWithCategory:a3 endMorningIndex:v11 goalAchieved:v9 notificationVariant:v12 userFirstName:v13];

  return v14;
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t start = self->_morningIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFirstName, 0);

  objc_storeStrong((id *)&self->_daySummaries, 0);
}

@end