@interface HDSPSleepWidgetBedtimeState
- (BOOL)schedulesExpiration;
- (double)expirationDuration;
- (id)stateName;
- (int64_t)widgetState;
- (void)stateDidExpire;
@end

@implementation HDSPSleepWidgetBedtimeState

- (double)expirationDuration
{
  return 7200.0;
}

- (id)stateName
{
  return @"Bedtime";
}

- (int64_t)widgetState
{
  return 4;
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
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received bedtime expired event due", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v6 = [v5 bedtimeInProgressState];
  [v5 enterState:v6];
}

@end