@interface HDSPWakeUpResultsNotificationNeedsProtectedDataState
- (id)expirationDate;
- (id)stateName;
- (void)_transitionToQueryingState;
- (void)didEnter;
- (void)didExit;
- (void)protectedHealthDataDidBecomeAvailable;
@end

@implementation HDSPWakeUpResultsNotificationNeedsProtectedDataState

- (id)stateName
{
  return @"NeedsProtectedData";
}

- (id)expirationDate
{
  v3 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v4 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v5 = [v4 currentDate];
  v6 = [v3 notificationAttemptWindowForWakeUpBeforeDate:v5];
  v7 = [v6 endDate];

  return v7;
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 startObservingProtectedHealthDataAvailability];
  }
}

- (void)didExit
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v12 = [v3 currentContext];

  if ([v12 hasStateTransitionOrInitializing])
  {
    v4 = [(HKSPStateMachineState *)self stateMachine];
    uint64_t v5 = [v12 nextState];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [v4 queryingState];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [v12 nextState];
        v10 = [v4 queryingState];
        char v11 = [v9 isMemberOfClass:objc_opt_class()];

        if (v11) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    [v4 stopObservingProtectedHealthDataAvailability];
LABEL_8:
  }
}

- (void)protectedHealthDataDidBecomeAvailable
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received protected heath data available event", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPWakeUpResultsNotificationNeedsProtectedDataState *)self _transitionToQueryingState];
}

- (void)_transitionToQueryingState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transitioning to querying state", (uint8_t *)&v7, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 queryingState];
  [v5 enterState:v6];
}

@end