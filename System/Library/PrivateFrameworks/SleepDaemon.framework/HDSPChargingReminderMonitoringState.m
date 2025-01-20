@interface HDSPChargingReminderMonitoringState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
- (void)batteryLevelChanged:(float)a3;
- (void)didEnter;
- (void)didExit;
@end

@implementation HDSPChargingReminderMonitoringState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 currentDate];
  v5 = [v3 monitoringWindowAfterDate:v4];
  v6 = [v5 endDate];

  return v6;
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 startBatteryMonitoring];
  }
}

- (void)didExit
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 stopBatteryMonitoring];
  }
}

- (id)stateName
{
  return @"Monitoring";
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)batteryLevelChanged:(float)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2048;
    double v16 = a3;
    id v6 = v14;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] batteryLevelChanged: %f", (uint8_t *)&v13, 0x16u);
  }
  v7 = HKSPLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 < 0.3)
  {
    if (v8)
    {
      v9 = objc_opt_class();
      int v13 = 138543362;
      id v14 = v9;
      id v10 = v9;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] we should charge", (uint8_t *)&v13, 0xCu);
    }
    v7 = [(HKSPStateMachineState *)self stateMachine];
    id v11 = [v7 notifiedState];
    [v7 enterState:v11];
    goto LABEL_9;
  }
  if (v8)
  {
    v12 = objc_opt_class();
    int v13 = 138543362;
    id v14 = v12;
    id v11 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] we don't need to charge yet", (uint8_t *)&v13, 0xCu);
LABEL_9:
  }
}

@end