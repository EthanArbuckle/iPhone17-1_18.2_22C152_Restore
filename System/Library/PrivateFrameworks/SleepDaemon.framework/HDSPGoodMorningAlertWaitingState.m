@interface HDSPGoodMorningAlertWaitingState
- (id)stateName;
- (void)sleepScheduleStateChangedToWakeUp;
@end

@implementation HDSPGoodMorningAlertWaitingState

- (id)stateName
{
  return @"Waiting";
}

- (void)sleepScheduleStateChangedToWakeUp
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  if ([v3 isAppleWatch] && objc_msgSend(v3, "isOnCharger"))
  {
    v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping good morning alert, watch is charging", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = [v2 presentingState];
    [v2 enterState:v6];
  }
}

@end