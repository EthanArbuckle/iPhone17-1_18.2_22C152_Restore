@interface HDSPSleepLockScreenGreetingState
- (id)stateName;
- (int64_t)sleepLockScreenState;
- (void)dismissAlertForGoodMorning;
- (void)updateState;
@end

@implementation HDSPSleepLockScreenGreetingState

- (void)updateState
{
  id v6 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v6 infoProvider];
  v4 = [v3 sleepScheduleModel];
  if (([v4 goodMorningScreenEnabledWithLogObject:self] & 1) == 0)
  {
    v5 = [v6 offState];
    [v6 enterState:v5];
  }
}

- (void)dismissAlertForGoodMorning
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismissing good morning alert", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 offState];
  [v5 enterState:v6];
}

- (id)stateName
{
  return @"Greeting";
}

- (int64_t)sleepLockScreenState
{
  return 3;
}

@end