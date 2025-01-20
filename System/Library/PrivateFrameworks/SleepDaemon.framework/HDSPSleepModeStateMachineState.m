@interface HDSPSleepModeStateMachineState
- (BOOL)updateStateCommon;
- (int64_t)sleepMode;
- (unint64_t)defaultChangeReason;
- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)didEnter;
- (void)sleepModeTurnedOffForUnknownReason;
- (void)sleepModeTurnedOnForUnknownReason;
- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToDisabled;
- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)updateStateFromTimeline;
- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3;
@end

@implementation HDSPSleepModeStateMachineState

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v10 = [v3 currentContext];

  if ([v10 hasStateTransitionOrInitializing])
  {
    v4 = [v10 previousState];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v10 reason];
    }
    else
    {
      if ([(HDSPSleepModeStateMachineState *)self defaultChangeReason] == 10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 reason];
          if (HKSPSleepScheduleStateChangeReasonIsExpected()) {
            uint64_t v6 = 2;
          }
          else {
            uint64_t v6 = 10;
          }
        }
        else
        {
          uint64_t v6 = 10;
        }
LABEL_11:
        v7 = [(HKSPStateMachineState *)self stateMachine];
        int64_t v8 = [(HDSPSleepModeStateMachineState *)self sleepMode];
        if (v4) {
          uint64_t v9 = [v4 sleepMode];
        }
        else {
          uint64_t v9 = 0;
        }
        [v7 sleepModeDidChange:v8 previousMode:v9 reason:v6];

        goto LABEL_15;
      }
      uint64_t v5 = [(HDSPSleepModeStateMachineState *)self defaultChangeReason];
    }
    uint64_t v6 = v5;
    goto LABEL_11;
  }
LABEL_15:
}

- (void)updateStateFromTimeline
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(HDSPSleepModeStateMachineState *)self updateStateCommon])
  {
    v3 = [(HKSPStateMachineState *)self stateMachine];
    v4 = [v3 infoProvider];
    if (objc_msgSend(v4, "shouldGoIntoSleepModeDuringState:", objc_msgSend(v4, "sleepScheduleState")))
    {
      if (HKSPSleepScheduleStateIsForBedtime())
      {
        uint64_t v5 = HKSPLogForCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 138543362;
          *(void *)&v13[4] = objc_opt_class();
          id v6 = *(id *)&v13[4];
          _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, turning on bedtime mode if it's not on", v13, 0xCu);
        }
        uint64_t v7 = [v3 bedtimeState];
LABEL_14:
        v12 = (void *)v7;
        objc_msgSend(v3, "enterState:", v7, *(_OWORD *)v13);

        return;
      }
      if (HKSPSleepScheduleStateIsForWindDown())
      {
        int64_t v8 = HKSPLogForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 138543362;
          *(void *)&v13[4] = objc_opt_class();
          id v9 = *(id *)&v13[4];
          _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, turning on wind down mode if it's not on", v13, 0xCu);
        }
        uint64_t v7 = [v3 windDownState];
        goto LABEL_14;
      }
    }
    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 138543362;
      *(void *)&v13[4] = objc_opt_class();
      id v11 = *(id *)&v13[4];
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off sleep mode if it's on", v13, 0xCu);
    }
    uint64_t v7 = [v3 offState];
    goto LABEL_14;
  }
}

- (BOOL)updateStateCommon
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  if ([v3 isAppleWatch])
  {
    v4 = [v2 infoProvider];
    char v5 = [v4 sleepFeaturesEnabled];

    if ((v5 & 1) == 0)
    {
      id v6 = HKSPLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = (id)objc_opt_class();
        id v7 = v23;
        _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled", buf, 0xCu);
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke;
      v20[3] = &unk_2645D90C0;
      int64_t v8 = &v21;
      id v9 = v2;
      id v21 = v9;
      id v10 = +[HDSPSleepModeStateMachineContext contextWithReason:10];
      id v11 = v20;
LABEL_12:
      [v9 perform:v11 withContext:v10];

      BOOL v14 = 1;
      goto LABEL_13;
    }
  }
  else
  {
  }
  v12 = [v2 infoProvider];
  char v13 = [v12 hasSleepFocusMode];

  if ((v13 & 1) == 0)
  {
    v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = (id)objc_opt_class();
      id v16 = v23;
      _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] no sleep focus mode exists", buf, 0xCu);
    }
    uint64_t v18 = MEMORY[0x263EF8330];
    int64_t v8 = (id *)&v19;
    id v9 = v2;
    id v10 = +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", 9, v18, 3221225472, __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke_279, &unk_2645D90C0, v9);
    id v11 = &v18;
    goto LABEL_12;
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

void __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 offState];
  [v1 enterState:v2];
}

void __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke_279(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 offState];
  [v1 enterState:v2];
}

- (int64_t)sleepMode
{
  return 0;
}

- (unint64_t)defaultChangeReason
{
  return 10;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 infoProvider];
  int v7 = [v6 shouldGoIntoSleepModeDuringState:3];

  int64_t v8 = HKSPLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v10 = v17;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, turning on sleep mode mode", buf, 0xCu);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWindDown_fromState___block_invoke;
    v14[3] = &unk_2645D90C0;
    id v15 = v5;
    id v11 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:a3];
    [v15 perform:v14 withContext:v11];

    id v12 = v15;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down but sleep mode is disabled, turning off sleep mode", buf, 0xCu);
    }
    id v12 = [v5 offState];
    [v5 enterState:v12];
  }
}

void __80__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWindDown_fromState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 windDownState];
  [v1 enterState:v2];
}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 infoProvider];
  int v7 = [v6 shouldGoIntoSleepModeDuringState:2];

  int64_t v8 = HKSPLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v10 = v17;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, turning on sleep mode mode", buf, 0xCu);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __79__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToBedtime_fromState___block_invoke;
    v14[3] = &unk_2645D90C0;
    id v15 = v5;
    id v11 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:a3];
    [v15 perform:v14 withContext:v11];

    id v12 = v15;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime but sleep mode is disabled, turning off sleep mode", buf, 0xCu);
    }
    id v12 = [v5 offState];
    [v5 enterState:v12];
  }
}

void __79__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToBedtime_fromState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 bedtimeState];
  [v1 enterState:v2];
}

- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wake up, turning off sleep mode", buf, 0xCu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWakeUp_fromState___block_invoke;
  v10[3] = &unk_2645D90C0;
  id v11 = v5;
  id v8 = v5;
  BOOL v9 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:a3];
  [v8 perform:v10 withContext:v9];
}

void __78__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWakeUp_fromState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 offState];
  [v1 enterState:v2];
}

- (void)sleepScheduleStateChangedToDisabled
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule state was disabled", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepModeStateMachineState *)self updateStateFromTimeline];
}

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [(HKSPStateMachineState *)self stateMachine];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = NSStringFromHKSPSleepModeChangeReason();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on (%{public}@)", buf, 0x16u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HDSPSleepModeStateMachineState_userTurnedOnSleepModeWithReason___block_invoke;
  v11[3] = &unk_2645D90C0;
  id v12 = v4;
  id v9 = v4;
  id v10 = +[HDSPSleepModeStateMachineContext contextWithReason:a3];
  [v9 perform:v11 withContext:v10];
}

void __66__HDSPSleepModeStateMachineState_userTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 manualOnState];
  [v1 enterState:v2];
}

- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = NSStringFromHKSPSleepModeChangeReason();
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off by user (%{public}@)", buf, 0x16u);
  }
  id v9 = [(HKSPStateMachineState *)self stateMachine];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPSleepModeStateMachineState_userTurnedOffSleepModeWithReason___block_invoke;
  v12[3] = &unk_2645D90C0;
  id v13 = v9;
  id v10 = v9;
  id v11 = +[HDSPSleepModeStateMachineContext contextWithReason:a3];
  [v10 perform:v12 withContext:v11];
}

void __67__HDSPSleepModeStateMachineState_userTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 manualOffState];
  [v1 enterState:v2];
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation", buf, 0xCu);
  }
  id v7 = [(HKSPStateMachineState *)self stateMachine];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HDSPSleepModeStateMachineState_automationTurnedOnSleepModeWithReason___block_invoke;
  v10[3] = &unk_2645D90C0;
  id v11 = v7;
  id v8 = v7;
  id v9 = +[HDSPSleepModeStateMachineContext contextWithReason:a3];
  [v8 perform:v10 withContext:v9];
}

void __72__HDSPSleepModeStateMachineState_automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 automatedOnState];
  [v1 enterState:v2];
}

- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off via automation", buf, 0xCu);
  }
  id v7 = [(HKSPStateMachineState *)self stateMachine];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HDSPSleepModeStateMachineState_automationTurnedOffSleepModeWithReason___block_invoke;
  v10[3] = &unk_2645D90C0;
  id v11 = v7;
  id v8 = v7;
  id v9 = +[HDSPSleepModeStateMachineContext contextWithReason:a3];
  [v8 perform:v10 withContext:v9];
}

void __73__HDSPSleepModeStateMachineState_automationTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 automatedOffState];
  [v1 enterState:v2];
}

- (void)sleepModeTurnedOnForUnknownReason
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for an unknown reason, treating as user requested", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__HDSPSleepModeStateMachineState_sleepModeTurnedOnForUnknownReason__block_invoke;
  v7[3] = &unk_2645D90C0;
  id v8 = v2;
  id v5 = v2;
  id v6 = +[HDSPSleepModeStateMachineContext contextWithReason:10];
  [v5 perform:v7 withContext:v6];
}

void __67__HDSPSleepModeStateMachineState_sleepModeTurnedOnForUnknownReason__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 manualOnState];
  [v1 enterState:v2];
}

- (void)sleepModeTurnedOffForUnknownReason
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off for an unknown reason, treating as user requested", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HDSPSleepModeStateMachineState_sleepModeTurnedOffForUnknownReason__block_invoke;
  v7[3] = &unk_2645D90C0;
  id v8 = v2;
  id v5 = v2;
  id v6 = +[HDSPSleepModeStateMachineContext contextWithReason:10];
  [v5 perform:v7 withContext:v6];
}

void __68__HDSPSleepModeStateMachineState_sleepModeTurnedOffForUnknownReason__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 manualOffState];
  [v1 enterState:v2];
}

@end