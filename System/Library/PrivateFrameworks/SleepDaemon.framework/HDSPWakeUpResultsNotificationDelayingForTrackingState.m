@interface HDSPWakeUpResultsNotificationDelayingForTrackingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
- (void)stateDidExpire;
@end

@implementation HDSPWakeUpResultsNotificationDelayingForTrackingState

- (id)stateName
{
  return @"DelayingForTracking";
}

- (id)expirationDate
{
  v3 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v4 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v5 = [v4 currentDate];
  v6 = [v3 notificationAttemptWindowForWakeUpBeforeDate:v5];
  v7 = [v6 startDate];

  return v7;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)stateDidExpire
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] expired", (uint8_t *)&v8, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v6 = [(HKSPStateMachineState *)self stateMachine];
  v7 = [v6 queryingState];
  [v5 enterState:v7];
}

@end