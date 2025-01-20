@interface HDSPSleepWidgetStateMachineState
- (BOOL)reloadsWidgetOnModelChange;
- (BOOL)reloadsWidgetOnTimeChange;
- (BOOL)shouldGoIntoUpcomingState;
- (BOOL)widgetStateHasTimeComponent;
- (id)stateName;
- (int64_t)widgetState;
- (void)didEnter;
- (void)significantTimeChangeOccurred;
- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4;
- (void)sleepScheduleModelDidChange:(id)a3;
- (void)sleepScheduleStateDidChange:(unint64_t)a3;
- (void)updateState;
@end

@implementation HDSPSleepWidgetStateMachineState

- (id)stateName
{
  return 0;
}

- (int64_t)widgetState
{
  return 0;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 1;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 1;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 1;
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v8 = [v3 currentContext];

  if ([v8 hasStateTransitionOrInitializing])
  {
    v4 = [v8 previousState];
    v5 = [(HKSPStateMachineState *)self stateMachine];
    int64_t v6 = [(HDSPSleepWidgetStateMachineState *)self widgetState];
    if (v4) {
      uint64_t v7 = [v4 widgetState];
    }
    else {
      uint64_t v7 = 0;
    }
    [v5 sleepWidgetStateDidChange:v6 previousState:v7];
  }

  MEMORY[0x270F9A758]();
}

- (void)updateState
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v69 = 138543362;
    *(void *)&v69[4] = objc_opt_class();
    id v4 = *(id *)&v69[4];
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] determining state", v69, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  int64_t v6 = [v5 infoProvider];
  uint64_t v7 = [v5 infoProvider];
  v8 = [v7 currentDate];

  v9 = [v6 sleepScheduleModel];
  uint64_t v10 = [v6 sleepScheduleState];
  int v11 = [v6 inUnscheduledSleepMode];
  if (([v6 isOnboarded] & 1) == 0)
  {
    v18 = HKSPLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [v5 notOnboardedState];
      v22 = [v21 stateName];
      *(_DWORD *)v69 = 138543618;
      *(void *)&v69[4] = v19;
      *(_WORD *)&v69[12] = 2114;
      *(void *)&v69[14] = v22;
      _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] not onboarded, determined state: %{public}@", v69, 0x16u);
    }
    uint64_t v17 = [v5 notOnboardedState];
    goto LABEL_15;
  }
  if (!v10)
  {
    v23 = HKSPLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = [v5 disabledState];
      v27 = [v26 stateName];
      *(_DWORD *)v69 = 138543618;
      *(void *)&v69[4] = v24;
      *(_WORD *)&v69[12] = 2114;
      *(void *)&v69[14] = v27;
      _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule disabled, determined state: %{public}@", v69, 0x16u);
    }
    uint64_t v17 = [v5 disabledState];
    goto LABEL_15;
  }
  if (v11)
  {
    v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      id v14 = v13;
      v15 = [v5 bedtimeInProgressState];
      v16 = [v15 stateName];
      *(_DWORD *)v69 = 138543618;
      *(void *)&v69[4] = v13;
      *(_WORD *)&v69[12] = 2114;
      *(void *)&v69[14] = v16;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] in user requested sleep mode, determined state: %{public}@", v69, 0x16u);
    }
    uint64_t v17 = [v5 bedtimeInProgressState];
LABEL_15:
    v28 = (void *)v17;
    objc_msgSend(v5, "enterState:", v17, *(_OWORD *)v69);
    goto LABEL_16;
  }
  switch(v10)
  {
    case 1:
      if ([(HDSPSleepWidgetStateMachineState *)self shouldGoIntoUpcomingState])
      {
        uint64_t v17 = [v5 upcomingState];
        goto LABEL_15;
      }
      v28 = [v9 previousEventWithIdentifier:*MEMORY[0x263F75C40] dueBeforeDate:v8];
      if (v28)
      {
        [v8 timeIntervalSinceDate:v28];
        double v51 = v50;
      }
      else
      {
        double v51 = 1.79769313e308;
      }
      v52 = HKSPLogForCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = objc_opt_class();
        *(_DWORD *)v69 = 138543874;
        *(void *)&v69[4] = v53;
        *(_WORD *)&v69[12] = 2114;
        *(void *)&v69[14] = v28;
        __int16 v70 = 2048;
        double v71 = v51;
        id v54 = v53;
        _os_log_impl(&dword_221A52000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up date: %{public}@ (secondsAfterWakeUp: %f)", v69, 0x20u);
      }
      v55 = [v5 greetingState];
      [v55 expirationDuration];
      double v57 = v56;

      v58 = HKSPLogForCategory();
      BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
      if (v51 >= v57)
      {
        if (v59)
        {
          v64 = objc_opt_class();
          id v65 = v64;
          v66 = [v5 waitingState];
          v67 = [v66 stateName];
          *(_DWORD *)v69 = 138543618;
          *(void *)&v69[4] = v64;
          *(_WORD *)&v69[12] = 2114;
          *(void *)&v69[14] = v67;
          _os_log_impl(&dword_221A52000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);
        }
        uint64_t v45 = [v5 waitingState];
      }
      else
      {
        if (v59)
        {
          v60 = objc_opt_class();
          id v61 = v60;
          v62 = [v5 greetingState];
          v63 = [v62 stateName];
          *(_DWORD *)v69 = 138543618;
          *(void *)&v69[4] = v60;
          *(_WORD *)&v69[12] = 2114;
          *(void *)&v69[14] = v63;
          _os_log_impl(&dword_221A52000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);
        }
        uint64_t v45 = [v5 greetingState];
      }
LABEL_46:
      v68 = (void *)v45;
      objc_msgSend(v5, "enterState:", v45, *(void *)v69, *(void *)&v69[8]);

      break;
    case 2:
    case 6:
      v28 = [v9 previousEventWithIdentifier:*MEMORY[0x263F75C18] dueBeforeDate:v8];
      if (v28)
      {
        [v8 timeIntervalSinceDate:v28];
        double v30 = v29;
      }
      else
      {
        double v30 = 1.79769313e308;
      }
      v36 = objc_msgSend(v5, "bedtimeState", *(void *)v69, *(void *)&v69[8]);
      [v36 expirationDuration];
      double v38 = v37;

      v39 = HKSPLogForCategory();
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v30 >= v38)
      {
        if (v40)
        {
          v46 = objc_opt_class();
          id v47 = v46;
          v48 = [v5 bedtimeInProgressState];
          v49 = [v48 stateName];
          *(_DWORD *)v69 = 138543618;
          *(void *)&v69[4] = v46;
          *(_WORD *)&v69[12] = 2114;
          *(void *)&v69[14] = v49;
          _os_log_impl(&dword_221A52000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);
        }
        uint64_t v45 = [v5 bedtimeInProgressState];
      }
      else
      {
        if (v40)
        {
          v41 = objc_opt_class();
          id v42 = v41;
          v43 = [v5 bedtimeState];
          v44 = [v43 stateName];
          *(_DWORD *)v69 = 138543618;
          *(void *)&v69[4] = v41;
          *(_WORD *)&v69[12] = 2114;
          *(void *)&v69[14] = v44;
          _os_log_impl(&dword_221A52000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);
        }
        uint64_t v45 = [v5 bedtimeState];
      }
      goto LABEL_46;
    case 3:
      v31 = HKSPLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_opt_class();
        id v33 = v32;
        v34 = [v5 windDownState];
        v35 = [v34 stateName];
        *(_DWORD *)v69 = 138543618;
        *(void *)&v69[4] = v32;
        *(_WORD *)&v69[12] = 2114;
        *(void *)&v69[14] = v35;
        _os_log_impl(&dword_221A52000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", v69, 0x16u);
      }
      uint64_t v17 = [v5 windDownState];
      goto LABEL_15;
    default:
      goto LABEL_17;
  }
LABEL_16:

LABEL_17:
}

- (BOOL)shouldGoIntoUpcomingState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  id v4 = [v3 currentDate];

  v5 = [v2 waitingState];
  int64_t v6 = [v5 expirationDate];

  if (v6 && objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v6))
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      uint64_t v10 = [v2 upcomingState];
      int v11 = [v10 stateName];
      int v14 = 138543618;
      v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined state: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int64_t v6 = [(HKSPStateMachineState *)self stateMachine];
  if (a3 == 2 && v4)
  {
    uint64_t v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turned on sleep mode", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [v6 bedtimeInProgressState];
    [v6 enterState:v9];
  }
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = [(HKSPStateMachineState *)self stateMachine];
  if (a3 == 3)
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v12 = 138543362;
      *(void *)&v12[4] = objc_opt_class();
      id v10 = *(id *)&v12[4];
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule state is wind down", v12, 0xCu);
    }
    uint64_t v8 = [v5 windDownState];
  }
  else
  {
    if (a3)
    {
      id v11 = [(HKSPStateMachineState *)self stateMachine];
      [v11 updateState];
      goto LABEL_11;
    }
    int64_t v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v12 = 138543362;
      *(void *)&v12[4] = objc_opt_class();
      id v7 = *(id *)&v12[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] schedule state is disabled", v12, 0xCu);
    }
    uint64_t v8 = [v5 disabledState];
  }
  id v11 = (void *)v8;
  objc_msgSend(v5, "enterState:", v8, *(_OWORD *)v12);
LABEL_11:
}

- (void)sleepScheduleModelDidChange:(id)a3
{
  id v8 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v4 = [v8 infoProvider];
  if (![v4 isOnboarded])
  {

    goto LABEL_5;
  }
  BOOL v5 = [(HDSPSleepWidgetStateMachineState *)self widgetStateHasTimeComponent];

  if (v5)
  {
LABEL_5:
    int64_t v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 updateState];
  }
  if ([(HDSPSleepWidgetStateMachineState *)self reloadsWidgetOnModelChange])
  {
    id v7 = [(HKSPStateMachineState *)self stateMachine];
    [v7 sleepWidgetShouldReload];
  }
}

- (void)significantTimeChangeOccurred
{
  if ([(HDSPSleepWidgetStateMachineState *)self widgetStateHasTimeComponent])
  {
    v3 = [(HKSPStateMachineState *)self stateMachine];
    [v3 updateState];
  }
  if ([(HDSPSleepWidgetStateMachineState *)self reloadsWidgetOnTimeChange])
  {
    id v4 = [(HKSPStateMachineState *)self stateMachine];
    [v4 sleepWidgetShouldReload];
  }
}

@end