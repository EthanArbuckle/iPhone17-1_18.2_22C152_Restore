@interface _HDSPSleepModeTurnedOffState
- (BOOL)_shouldUpdateSleepModeStateForState:(unint64_t)a3 changeReason:(unint64_t)a4 previousState:(unint64_t)a5;
- (id)expirationDate;
- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)updateState;
@end

@implementation _HDSPSleepModeTurnedOffState

- (id)expirationDate
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 sleepScheduleModel];
  id v5 = (id)*MEMORY[0x263F75C18];
  v6 = [v4 sleepSchedule];
  [v6 windDownTime];
  double v8 = v7;

  if (v8 > 0.0)
  {
    id v9 = (id)*MEMORY[0x263F75C50];

    id v5 = v9;
  }
  v10 = [v3 currentDate];
  v11 = [v4 nextEventWithIdentifier:v5 dueAfterDate:v10];

  v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    v20 = v11;
    id v13 = v16;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] keeping off until next %{public}@ at %{public}@", (uint8_t *)&v15, 0x20u);
  }

  return v11;
}

- (void)updateState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (![(HDSPSleepModeStateMachineState *)self updateStateCommon])
  {
    v3 = [(HKSPStateMachineState *)self stateMachine];
    v4 = [v3 infoProvider];
    if ((objc_msgSend(v4, "shouldGoIntoSleepModeDuringState:", objc_msgSend(v4, "sleepScheduleState")) & 1) == 0)
    {
      id v5 = HKSPLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = (id)objc_opt_class();
        id v6 = v9;
        _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] going to regular off state", (uint8_t *)&v8, 0xCu);
      }
      double v7 = [v3 offState];
      [v3 enterState:v7];
    }
  }
}

- (BOOL)_shouldUpdateSleepModeStateForState:(unint64_t)a3 changeReason:(unint64_t)a4 previousState:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = NSStringFromHKSPSleepScheduleState();
    v11 = NSStringFromHKSPSleepScheduleState();
    v12 = NSStringFromHKSPSleepScheduleStateChangeReason();
    int v25 = 138544130;
    v26 = v8;
    __int16 v27 = 2114;
    v28 = v10;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ entered from %{public}@ (%{public}@)", (uint8_t *)&v25, 0x2Au);
  }
  if (a5 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (a4 == 5)
    {
      id v13 = HKSPLogForCategory();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (a5)
      {
        if (v14)
        {
          int v15 = objc_opt_class();
          int v25 = 138543362;
          v26 = v15;
          id v16 = v15;
          __int16 v17 = "[%{public}@] ignoring initial state change";
LABEL_10:
          _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 0xCu);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
      if (v14)
      {
        v23 = objc_opt_class();
        int v25 = 138543362;
        v26 = v23;
        id v21 = v23;
        v22 = "[%{public}@] updating for initial change because schedule was previously disabled";
        goto LABEL_16;
      }
    }
    else
    {
      id v13 = HKSPLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        int v25 = 138543362;
        v26 = v20;
        id v21 = v20;
        v22 = "[%{public}@] updating";
LABEL_16:
        _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);
      }
    }
    BOOL v19 = 1;
    goto LABEL_18;
  }
  id v13 = HKSPLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = objc_opt_class();
    int v25 = 138543362;
    v26 = v18;
    id v16 = v18;
    __int16 v17 = "[%{public}@] ignoring";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v19 = 0;
LABEL_18:

  return v19;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  if ([(_HDSPSleepModeTurnedOffState *)self _shouldUpdateSleepModeStateForState:3 changeReason:a3 previousState:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)_HDSPSleepModeTurnedOffState;
    [(HDSPSleepModeStateMachineState *)&v7 sleepScheduleStateChangedToWindDown:a3 fromState:a4];
  }
}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  if ([(_HDSPSleepModeTurnedOffState *)self _shouldUpdateSleepModeStateForState:2 changeReason:a3 previousState:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)_HDSPSleepModeTurnedOffState;
    [(HDSPSleepModeStateMachineState *)&v7 sleepScheduleStateChangedToBedtime:a3 fromState:a4];
  }
}

@end