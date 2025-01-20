@interface HKSPSleepStore(MobileTimerUIAdditions)
+ (id)mt_getDetailedAlarmTitleForDate:()MobileTimerUIAdditions calendar:onlyAppliesOnce:;
- (id)mt_sleepMetaDataForUpcomingAlarmInCalendar:()MobileTimerUIAdditions error:;
@end

@implementation HKSPSleepStore(MobileTimerUIAdditions)

- (id)mt_sleepMetaDataForUpcomingAlarmInCalendar:()MobileTimerUIAdditions error:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  uint64_t v30 = 0;
  v8 = [MEMORY[0x263EFF910] mtNow];
  id v29 = 0;
  v9 = [a1 upcomingResolvedScheduleOccurrenceAfterDate:v8 alarmStatus:&v30 error:&v29];
  id v10 = v29;

  v11 = MTLogForCategory();
  v12 = v11;
  if (!a4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = a1;
      __int16 v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_235CF1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ upcoming sleep occurrence: %{public}@", buf, 0x16u);
    }

    v15 = [v9 occurrence];
    v16 = [v15 wakeUpComponents];
    [v7 setAlarmComponents:v16];

    switch(v30)
    {
      case 0:
        [v7 setDisplaysTime:0];
        v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimerUI"];
        v18 = [v17 localizedStringForKey:@"SLEEP_ALARM_NONE" value:&stru_26E926B18 table:@"MobileTimerUI_Burrito"];
        [v7 setMainDescription:v18];

        goto LABEL_13;
      case 1:
        [v7 setDisplaysTime:0];
        v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimerUI"];
        v20 = [v19 localizedStringForKey:@"SLEEP_ALARM_SKIPPED" value:&stru_26E926B18 table:@"MobileTimerUI_Burrito"];
        [v7 setMainDescription:v20];

        goto LABEL_11;
      case 2:
        [v7 setDisplaysTime:1];
LABEL_11:
        uint64_t v21 = objc_opt_class();
        v13 = [v9 wakeUpEvent];
        v14 = [v13 dueDate];
        v22 = (void *)v21;
        v23 = v14;
        id v24 = v6;
        uint64_t v25 = 1;
        goto LABEL_14;
      case 3:
        [v7 setDisplaysTime:1];
LABEL_13:
        uint64_t v26 = objc_opt_class();
        v13 = [v9 wakeUpEvent];
        v14 = [v13 dueDate];
        v22 = (void *)v26;
        v23 = v14;
        id v24 = v6;
        uint64_t v25 = 0;
LABEL_14:
        v27 = objc_msgSend(v22, "mt_getDetailedAlarmTitleForDate:calendar:onlyAppliesOnce:", v23, v24, v25);
        [v7 setDetailedDescription:v27];

        goto LABEL_15;
      default:
        goto LABEL_16;
    }
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[HKSPSleepStore(MobileTimerUIAdditions) mt_sleepMetaDataForUpcomingAlarmInCalendar:error:]((uint64_t)a1, (uint64_t)v10, v12);
  }

  [v7 setDisplaysTime:0];
  v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimerUI"];
  v14 = [v13 localizedStringForKey:@"SLEEP_ALARM_NONE" value:&stru_26E926B18 table:@"MobileTimerUI_Burrito"];
  [v7 setMainDescription:v14];
LABEL_15:

LABEL_16:

  return v7;
}

+ (id)mt_getDetailedAlarmTitleForDate:()MobileTimerUIAdditions calendar:onlyAppliesOnce:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = 0;
    goto LABEL_19;
  }
  v9 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v10 = objc_msgSend(v8, "hksp_dayPeriodForDate:locale:", v7, v9);

  v11 = MTLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543618;
    id v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    _os_log_impl(&dword_235CF1000, v11, OS_LOG_TYPE_DEFAULT, "wake up date is %{public}@ and time of the day enum is %lu", (uint8_t *)&v22, 0x16u);
  }

  int v12 = [v8 isDateInToday:v7];
  int v13 = [v8 isDateInTomorrow:v7];
  if ((v12 & 1) == 0 && !v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F08790]);
    [v14 setDateFormat:@"EEEE"];
    v15 = [MEMORY[0x263EFF960] currentLocale];
    [v14 setLocale:v15];

    v16 = [v14 stringFromDate:v7];
    v17 = MTLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v16;
      _os_log_impl(&dword_235CF1000, v17, OS_LOG_TYPE_DEFAULT, "wake up day of the week is %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_18;
  }
  v18 = objc_opt_new();
  id v14 = v18;
  if (v12) {
    v19 = @"TODAY_";
  }
  else {
    v19 = @"TOMORROW_";
  }
  [v18 appendString:v19];
  if (a5)
  {
    v20 = @"ONLY";
LABEL_16:
    [v14 appendString:v20];
    goto LABEL_17;
  }
  if ((unint64_t)(v10 - 1) <= 2)
  {
    v20 = off_264C73D80[v10 - 1];
    goto LABEL_16;
  }
LABEL_17:
  v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileTimerUI"];
  v16 = [v17 localizedStringForKey:v14 value:&stru_26E926B18 table:@"MobileTimerUI_Burrito"];
LABEL_18:

LABEL_19:

  return v16;
}

- (void)mt_sleepMetaDataForUpcomingAlarmInCalendar:()MobileTimerUIAdditions error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235CF1000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve upcoming sleep occurrence with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end