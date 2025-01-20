@interface HDSPGoodMorningAlertPresentingState
- (BOOL)schedulesExpiration;
- (double)expirationDuration;
- (id)stateName;
- (void)didEnter;
- (void)didExit;
- (void)sleepScheduleStateChangedToBedtime;
- (void)stateDidExpire;
- (void)updateState;
@end

@implementation HDSPGoodMorningAlertPresentingState

- (double)expirationDuration
{
  return *MEMORY[0x263F75AB0];
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)didEnter
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionAndNotInitializing];

  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting alert", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(HKSPStateMachineState *)self stateMachine];
    [v8 presentAlertForGoodMorning];
  }
}

- (void)didExit
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissing alert", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(HKSPStateMachineState *)self stateMachine];
    [v8 dismissAlertForGoodMorning];
  }
}

- (void)updateState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  if ([v3 goodMorningAlertEnabled])
  {
    v4 = [v3 sleepScheduleModel];
    int v5 = [v4 sleepEventRecord];
    v6 = [v5 goodMorningDismissedDate];

    uint64_t v7 = *MEMORY[0x263F75C40];
    v8 = [v3 currentDate];
    int v9 = [v4 previousEventWithIdentifier:v7 dueBeforeDate:v8];

    if (v9 && objc_msgSend(v6, "hksp_isAfterOrSameAsDate:", v9))
    {
      id v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2114;
        v18 = v6;
        id v11 = v16;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alert dismissed %{public}@", (uint8_t *)&v15, 0x16u);
      }
      v12 = [v2 waitingState];
      [v2 enterState:v12];
    }
  }
  else
  {
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v14 = v16;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alerts disabled", (uint8_t *)&v15, 0xCu);
    }
    v4 = [v2 disabledState];
    [v2 enterState:v4];
  }
}

- (void)stateDidExpire
{
  id v3 = [(HKSPStateMachineState *)self stateMachine];
  v2 = [v3 waitingState];
  [v3 enterState:v2];
}

- (id)stateName
{
  return @"Presenting";
}

- (void)sleepScheduleStateChangedToBedtime
{
  id v3 = [(HKSPStateMachineState *)self stateMachine];
  v2 = [v3 waitingState];
  [v3 enterState:v2];
}

@end