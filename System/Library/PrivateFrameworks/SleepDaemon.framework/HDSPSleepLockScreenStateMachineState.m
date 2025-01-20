@interface HDSPSleepLockScreenStateMachineState
- (BOOL)_isSleepLockScreenDisabled;
- (int64_t)sleepLockScreenState;
- (void)_updateStateForSleepMode:(int64_t)a3 reason:(unint64_t)a4;
- (void)didEnter;
- (void)presentAlertForGoodMorning;
- (void)updateState;
@end

@implementation HDSPSleepLockScreenStateMachineState

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v3 currentContext];

  if ([v6 hasStateTransitionOrInitializing])
  {
    v4 = [v6 previousState];
    v5 = [(HKSPStateMachineState *)self stateMachine];
    objc_msgSend(v5, "sleepLockScreenStateDidChange:previousState:", -[HDSPSleepLockScreenStateMachineState sleepLockScreenState](self, "sleepLockScreenState"), objc_msgSend(v4, "sleepLockScreenState"));
  }
}

- (void)presentAlertForGoodMorning
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  int v4 = [v3 isLockScreenActive];

  v5 = HKSPLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = objc_opt_class();
      id v7 = *(id *)&v11[4];
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] presenting good morning alert", v11, 0xCu);
    }
    uint64_t v8 = [v2 greetingState];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = objc_opt_class();
      id v9 = *(id *)&v11[4];
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping good morning alert, lock screen isn't active", v11, 0xCu);
    }
    uint64_t v8 = [v2 offState];
  }
  v10 = (void *)v8;
  objc_msgSend(v2, "enterState:", v8, *(_OWORD *)v11);
}

- (void)updateState
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v3 infoProvider];

  uint64_t v4 = [v6 sleepMode];
  if ([v6 inUnscheduledSleepMode]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 10;
  }
  [(HDSPSleepLockScreenStateMachineState *)self _updateStateForSleepMode:v4 reason:v5];
}

- (void)_updateStateForSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(HKSPStateMachineState *)self stateMachine];
  if ([(HDSPSleepLockScreenStateMachineState *)self _isSleepLockScreenDisabled])
  {
    uint64_t v7 = [v6 offState];
LABEL_12:
    uint64_t v8 = (void *)v7;
    [v6 enterState:v7];
LABEL_13:

    goto LABEL_14;
  }
  switch(a3)
  {
    case 0:
      uint64_t v8 = [v6 infoProvider];
      id v9 = [v8 sleepScheduleModel];
      if ([v9 goodMorningScreenEnabledWithLogObject:self])
      {
        int v10 = HKSPSleepModeChangeReasonTreatedAsExpected();
        v11 = HKSPLogForCategory();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            int v17 = 138543362;
            id v18 = (id)objc_opt_class();
            id v13 = v18;
            _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is off, waiting to be told to present greeting", (uint8_t *)&v17, 0xCu);
          }
          goto LABEL_19;
        }
        if (v12)
        {
          v14 = objc_opt_class();
          id v15 = v14;
          v16 = NSStringFromHKSPSleepModeChangeReason();
          int v17 = 138543618;
          id v18 = v14;
          __int16 v19 = 2114;
          v20 = v16;
          _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is off, not presenting greeting (%{public}@)", (uint8_t *)&v17, 0x16u);
        }
      }
      v11 = [v6 offState];
      [v6 enterState:v11];
LABEL_19:

      goto LABEL_13;
    case 2:
      uint64_t v7 = [v6 bedtimeState];
      goto LABEL_12;
    case 1:
      uint64_t v7 = [v6 windDownState];
      goto LABEL_12;
  }
LABEL_14:
}

- (int64_t)sleepLockScreenState
{
  return 0;
}

- (BOOL)_isSleepLockScreenDisabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  uint64_t v4 = [v3 sleepScheduleModel];
  uint64_t v5 = [v4 sleepSettings];
  __int16 v6 = [v5 sleepModeOptions];
  if ((v6 & 0x4000) == 0)
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep screen disabled", (uint8_t *)&v10, 0xCu);
    }
  }

  return (v6 & 0x4000) == 0;
}

@end