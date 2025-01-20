@interface HDSPSleepWidgetWaitingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
- (int64_t)widgetState;
- (void)stateDidExpire;
@end

@implementation HDSPSleepWidgetWaitingState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 sleepScheduleModel];
  v5 = [v4 sleepSchedule];
  [v5 windDownTime];
  v6 = (id *)MEMORY[0x263F75C50];
  if (v7 <= 0.0) {
    v6 = (id *)MEMORY[0x263F75C18];
  }
  id v8 = *v6;

  v9 = [v3 currentDate];
  v10 = [v4 nextEventWithIdentifier:v8 dueAfterDate:v9];

  v11 = [v10 dateByAddingTimeInterval:-7200.0];

  return v11;
}

- (id)stateName
{
  return @"Waiting";
}

- (int64_t)widgetState
{
  return 1;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)stateDidExpire
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received waiting expired event due", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v6 = [v5 upcomingState];
  [v5 enterState:v6];
}

@end