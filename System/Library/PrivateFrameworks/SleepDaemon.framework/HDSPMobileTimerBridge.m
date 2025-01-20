@interface HDSPMobileTimerBridge
+ (BOOL)sleepAlarm:(id)a3 matchesSleepScheduleModel:(id)a4;
+ (id)sleepScheduleModelFromSleepAlarm:(id)a3;
- (HDSPMobileTimerBridge)init;
- (HDSPMobileTimerBridge)initWithAlarmManager:(id)a3;
- (MTAlarmManager)alarmManager;
- (NAFuture)alarmServerReady;
- (id)sleepAlarmsFuture;
- (id)sleepAlarmsFutureIgnoringCache:(BOOL)a3;
- (void)_alarmServerReady;
- (void)_checkAlarmServer;
- (void)resetSleepAlarmSnoozeState;
- (void)updateSleepAlarms;
@end

@implementation HDSPMobileTimerBridge

- (HDSPMobileTimerBridge)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F55D50]);
  v4 = [(HDSPMobileTimerBridge *)self initWithAlarmManager:v3];

  return v4;
}

- (HDSPMobileTimerBridge)initWithAlarmManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPMobileTimerBridge;
  v6 = [(HDSPMobileTimerBridge *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alarmManager, a3);
    [(HDSPMobileTimerBridge *)v7 _checkAlarmServer];
    v8 = v7;
  }

  return v7;
}

- (void)_checkAlarmServer
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke;
  v7[3] = &unk_2645DB448;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v4 = [v3 lazyFutureWithBlock:v7];
  alarmServerReady = self->_alarmServerReady;
  self->_alarmServerReady = v4;

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__alarmServerReady name:*MEMORY[0x263F55CE0] object:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] lazily checking alarm server", buf, 0xCu);
  }
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) sleepAlarm];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke_281;
  v10[3] = &unk_2645DB420;
  v10[4] = WeakRetained;
  id v11 = v3;
  id v8 = v3;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

void __42__HDSPMobileTimerBridge__checkAlarmServer__block_invoke_281(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 domain];
  if ([v5 isEqualToString:@"com.apple.mobiletimerd.MTAlarmServer"])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 1)
    {
      v7 = HKSPLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = (id)objc_opt_class();
        id v8 = v12;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm server not ready yet", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v10 = v12;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm server is ready", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 40) finishWithNoResult];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F55CE0] object:0];
LABEL_9:
}

- (void)_alarmServerReady
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received notification that alarm server is ready", (uint8_t *)&v6, 0xCu);
  }
  [(NAFuture *)self->_alarmServerReady finishWithNoResult];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F55CE0] object:0];
}

- (id)sleepAlarmsFutureIgnoringCache:(BOOL)a3
{
  alarmServerReady = self->_alarmServerReady;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke;
  v6[3] = &unk_2645DB470;
  BOOL v7 = a3;
  v6[4] = self;
  id v4 = [(NAFuture *)alarmServerReady flatMap:v6];

  return v4;
}

id __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v1 = objc_alloc_init(MEMORY[0x263F55D50]);
  }
  else {
    id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  }
  v2 = v1;
  id v3 = [v1 sleepAlarms];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPMobileTimerBridge_sleepAlarmsFutureIgnoringCache___block_invoke_2;
  v7[3] = &unk_2645D9238;
  id v8 = v2;
  id v4 = v2;
  id v5 = (id)[v3 addCompletionBlock:v7];

  return v3;
}

- (id)sleepAlarmsFuture
{
  return [(HDSPMobileTimerBridge *)self sleepAlarmsFutureIgnoringCache:0];
}

- (void)updateSleepAlarms
{
  id v3 = [(MTAlarmManager *)self->_alarmManager updateSleepAlarms];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__HDSPMobileTimerBridge_updateSleepAlarms__block_invoke;
  v5[3] = &unk_2645D9E40;
  v5[4] = self;
  id v4 = (id)[v3 addFailureBlock:v5];
}

void __42__HDSPMobileTimerBridge_updateSleepAlarms__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_221A52000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to update sleep alarms with error %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)resetSleepAlarmSnoozeState
{
  id v3 = [(MTAlarmManager *)self->_alarmManager resetSleepAlarmSnoozeState];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HDSPMobileTimerBridge_resetSleepAlarmSnoozeState__block_invoke;
  v5[3] = &unk_2645D9E40;
  v5[4] = self;
  id v4 = (id)[v3 addFailureBlock:v5];
}

void __51__HDSPMobileTimerBridge_resetSleepAlarmSnoozeState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_221A52000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to reset snooze state with error %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

+ (BOOL)sleepAlarm:(id)a3 matchesSleepScheduleModel:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  id v6 = a4;
  uint64_t v7 = [v6 sleepSchedule];
  __int16 v8 = (void *)v7;
  if (v5 | v7)
  {
    char v9 = 0;
    if (v5 && v7)
    {
      uint64_t v10 = [(id)v7 occurrences];
      int v11 = [v10 firstObject];

      id v12 = [v11 alarmConfiguration];
      uint64_t v13 = [v6 sleepSettings];
      uint64_t v14 = [(id)v5 hour];
      v15 = [v11 wakeUpComponents];
      if (v14 == [v15 hour])
      {
        uint64_t v16 = [(id)v5 minute];
        v17 = [v11 wakeUpComponents];
        if (v16 == [v17 minute])
        {
          uint64_t v18 = [(id)v5 bedtimeHour];
          v19 = [v11 bedtimeComponents];
          if (v18 == [v19 hour])
          {
            uint64_t v20 = [(id)v5 bedtimeMinute];
            v39 = [v11 bedtimeComponents];
            if (v20 == [v39 minute]
              && (uint64_t v21 = [(id)v5 repeatSchedule], v21 == objc_msgSend(v11, "weekdays"))
              && (int v22 = [(id)v5 sleepMode], v22 == objc_msgSend(v13, "scheduledSleepMode")))
            {
              v38 = [(id)v5 bedtimeReminder];
              if ((v38 == 0) != [v13 bedtimeReminders]
                && (uint64_t v24 = [(id)v5 bedtimeReminderMinutes], v24 == objc_msgSend(v8, "windDownMinutes"))
                && (int v25 = [(id)v5 sleepSchedule], v25 == objc_msgSend(v8, "isEnabled"))
                && (int v26 = [(id)v5 isEnabled], v26 == objc_msgSend(v12, "isEnabled")))
              {
                v37 = [(id)v5 sound];
                uint64_t v27 = [v37 soundVolume];
                v35 = [v12 soundVolume];
                v36 = (void *)v27;
                if (NAEqualObjects())
                {
                  v34 = [(id)v5 sound];
                  uint64_t v28 = [v34 toneIdentifier];
                  v32 = [v12 toneIdentifier];
                  v33 = (void *)v28;
                  if (NAEqualObjects())
                  {
                    v31 = [(id)v5 sound];
                    v30 = [v31 vibrationIdentifier];
                    v29 = [v12 vibrationIdentifier];
                    char v9 = NAEqualObjects();
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
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

+ (id)sleepScheduleModelFromSleepAlarm:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F75E08]);
    objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "sleepSchedule"));
    objc_msgSend(v4, "setWindDownMinutes:", objc_msgSend(v3, "bedtimeReminderMinutes"));
    id v5 = objc_alloc_init(MEMORY[0x263F75E10]);
    id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v6, "setHour:", objc_msgSend(v3, "bedtimeHour"));
    objc_msgSend(v6, "setMinute:", objc_msgSend(v3, "bedtimeMinute"));
    [v5 setBedtimeComponents:v6];
    id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v7, "setHour:", objc_msgSend(v3, "hour"));
    objc_msgSend(v7, "setMinute:", objc_msgSend(v3, "minute"));
    [v5 setWakeUpComponents:v7];
    objc_msgSend(v5, "setWeekdays:", objc_msgSend(v3, "repeatSchedule"));
    id v8 = objc_alloc_init(MEMORY[0x263F75DF8]);
    objc_msgSend(v8, "setEnabled:", objc_msgSend(v3, "isEnabled"));
    char v9 = [v3 sound];
    uint64_t v10 = [v9 soundVolume];
    [v8 setSoundVolume:v10];

    int v11 = [v3 sound];
    id v12 = [v11 toneIdentifier];
    [v8 setToneIdentifier:v12];

    uint64_t v13 = [v3 sound];
    uint64_t v14 = [v13 vibrationIdentifier];
    [v8 setVibrationIdentifier:v14];

    [v5 setAlarmConfiguration:v8];
    [v4 saveOccurrence:v5];
    v15 = [v3 lastModifiedDate];
    [v4 setLastModifiedDate:v15];

    id v16 = objc_alloc_init(MEMORY[0x263F75E18]);
    objc_msgSend(v16, "setScheduledSleepMode:", objc_msgSend(v3, "sleepMode"));
    v17 = [v3 bedtimeReminder];

    if (!v17) {
      [v16 setBedtimeReminders:0];
    }
    uint64_t v18 = [v3 lastModifiedDate];
    [v16 setLastModifiedDate:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F75E00]);
    uint64_t v20 = [v3 dismissedDate];
    if (v20)
    {
      [v19 setWakeUpAlarmDismissedDate:v20];
    }
    else
    {
      v23 = [MEMORY[0x263EFF910] distantPast];
      [v19 setWakeUpAlarmDismissedDate:v23];
    }
    uint64_t v24 = [v3 snoozeFireDate];
    if (v24)
    {
      [v19 setWakeUpAlarmSnoozedUntilDate:v24];
    }
    else
    {
      int v25 = [MEMORY[0x263EFF910] distantPast];
      [v19 setWakeUpAlarmSnoozedUntilDate:v25];
    }
    int v26 = [v3 lastModifiedDate];
    [v19 setLastModifiedDate:v26];

    int v22 = [MEMORY[0x263F75E88] sleepScheduleModelWithSleepSchedule:v4 sleepSettings:v16 sleepEventRecord:v19];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x263F75E88];
    id v4 = objc_alloc_init(MEMORY[0x263F75EA0]);
    id v5 = objc_alloc_init(MEMORY[0x263F75E58]);
    int v22 = [v21 sleepScheduleModelWithSleepSchedule:0 sleepSettings:v4 sleepEventRecord:v5];
  }

  return v22;
}

- (NAFuture)alarmServerReady
{
  return self->_alarmServerReady;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);

  objc_storeStrong((id *)&self->_alarmServerReady, 0);
}

@end