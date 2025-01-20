@interface HDSPWakeUpResultsNotificationWaitingForWakeUpState
- (id)stateName;
- (void)_transitionToDelayingForTrackingState;
- (void)wakeUpDidOccur;
@end

@implementation HDSPWakeUpResultsNotificationWaitingForWakeUpState

- (id)stateName
{
  return @"WaitingForWakeUp";
}

- (void)wakeUpDidOccur
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received wake up event", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPWakeUpResultsNotificationWaitingForWakeUpState *)self _transitionToDelayingForTrackingState];
}

- (void)_transitionToDelayingForTrackingState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transitioning to delaying for tracking state", (uint8_t *)&v7, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 delayingForTrackingState];
  [v5 enterState:v6];
}

@end