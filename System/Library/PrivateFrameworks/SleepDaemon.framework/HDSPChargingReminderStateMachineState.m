@interface HDSPChargingReminderStateMachineState
- (BOOL)inMonitoringWindow;
- (BOOL)isChargingReminderDisabled;
- (void)updateState;
@end

@implementation HDSPChargingReminderStateMachineState

- (void)updateState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  if ([(HDSPChargingReminderStateMachineState *)self isChargingReminderDisabled])
  {
    uint64_t v4 = [v3 disabledState];
  }
  else if ([(HDSPChargingReminderStateMachineState *)self inMonitoringWindow])
  {
    v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v8 = 138543362;
      *(void *)&v8[4] = objc_opt_class();
      id v6 = *(id *)&v8[4];
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] in monitoring window", v8, 0xCu);
    }
    uint64_t v4 = [v3 monitoringState];
  }
  else
  {
    uint64_t v4 = [v3 waitingState];
  }
  v7 = (void *)v4;
  objc_msgSend(v3, "enterState:", v4, *(_OWORD *)v8);
}

- (BOOL)isChargingReminderDisabled
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  uint64_t v4 = [v3 infoProvider];
  v5 = [v4 sleepScheduleModel];
  if ([v5 chargingRemindersEnabledWithLogObject:self])
  {
    id v6 = [v5 sleepSchedule];
    [v6 windDownTime];
    if (v7 >= 3600.0)
    {
      v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v9 = v14;
        v10 = "[%{public}@] wind down time is greater than monitor window";
        goto LABEL_9;
      }
    }
    else
    {
      if (![v4 isCharging])
      {
        BOOL v11 = 0;
        goto LABEL_12;
      }
      v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v9 = v14;
        v10 = "[%{public}@] currently charging";
LABEL_9:
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
      }
    }

    BOOL v11 = 1;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)inMonitoringWindow
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  uint64_t v4 = [v3 currentDate];
  v5 = [v3 monitoringWindowAfterDate:v4];
  id v6 = [v3 currentDate];
  char v7 = objc_msgSend(v5, "hksp_containsDate:", v6);

  return v7;
}

@end