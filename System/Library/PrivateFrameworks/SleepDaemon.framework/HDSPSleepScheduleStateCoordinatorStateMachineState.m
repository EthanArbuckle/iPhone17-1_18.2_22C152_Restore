@interface HDSPSleepScheduleStateCoordinatorStateMachineState
- (BOOL)isAlarmEnabled;
- (BOOL)isSleepScheduleDisabled;
- (id)_determineNextStateFromTimeline;
- (id)_timelineForDate:(id)a3;
- (unint64_t)scheduleState;
- (void)_forceUpdateStateWithChangeReason:(unint64_t)a3;
- (void)didEnter;
- (void)scheduleModelChanged:(id)a3;
- (void)significantTimeChange;
- (void)stateDidExpire;
- (void)timeZoneChange;
- (void)updateState;
- (void)updateStateForcibly:(BOOL)a3;
@end

@implementation HDSPSleepScheduleStateCoordinatorStateMachineState

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v13 = [v3 currentContext];

  if ([v13 hasStateTransitionOrInitializing])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v5 = [v13 isInitializing];
    v6 = [v13 previousState];
    if ((v5 & 1) != 0 || (isKindOfClass & 1) == 0)
    {
      if (v5) {
        uint64_t v8 = 5;
      }
      else {
        uint64_t v8 = 6;
      }
      id v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:v8];
    }
    else
    {
      id v7 = v13;
    }
    v9 = v7;
    v10 = [(HKSPStateMachineState *)self stateMachine];
    unint64_t v11 = [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self scheduleState];
    if (v6) {
      uint64_t v12 = [v6 scheduleState];
    }
    else {
      uint64_t v12 = *MEMORY[0x263F75CE0];
    }
    [v10 sleepScheduleStateDidChange:v11 previousState:v12 context:v9];
  }
}

- (void)updateState
{
}

- (void)updateStateForcibly:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  if ([(HDSPSleepScheduleStateCoordinatorStateMachineState *)self isSleepScheduleDisabled])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__HDSPSleepScheduleStateCoordinatorStateMachineState_updateStateForcibly___block_invoke;
    v8[3] = &unk_2645D90C0;
    id v9 = v5;
    v6 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:6];
    [v9 perform:v8 withContext:v6];
  }
  else if (v3)
  {
    id v7 = [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self _determineNextStateFromTimeline];
    [v5 enterState:v7];
  }
}

void __74__HDSPSleepScheduleStateCoordinatorStateMachineState_updateStateForcibly___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 disabledState];
  [v1 enterState:v2];
}

- (void)_forceUpdateStateWithChangeReason:(unint64_t)a3
{
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__HDSPSleepScheduleStateCoordinatorStateMachineState__forceUpdateStateWithChangeReason___block_invoke;
  v7[3] = &unk_2645D90C0;
  v7[4] = self;
  v6 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:a3];
  [v5 perform:v7 withContext:v6];
}

uint64_t __88__HDSPSleepScheduleStateCoordinatorStateMachineState__forceUpdateStateWithChangeReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateForcibly:1];
}

- (void)stateDidExpire
{
}

- (BOOL)isSleepScheduleDisabled
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v3 = [v2 infoProvider];
  if (![v3 isAppleWatch] || (objc_msgSend(v3, "sleepFeaturesEnabled") & 1) != 0)
  {
    v4 = [v3 sleepScheduleModel];
    int v5 = [v4 sleepSchedule];
    v6 = v5;
    if (v5)
    {
      if ([v5 isEnabledAndHasOccurrences])
      {
        BOOL v7 = 0;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v9 = v14;
        v10 = "[%{public}@] sleep schedule is disabled";
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v9 = v14;
        v10 = "[%{public}@] sleep schedule is nil";
LABEL_13:
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
      }
    }

    BOOL v7 = 1;
    goto LABEL_15;
  }
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v11 = v14;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled for this watch", (uint8_t *)&v13, 0xCu);
  }
  BOOL v7 = 1;
LABEL_16:

  return v7;
}

- (BOOL)isAlarmEnabled
{
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v3 = [v2 infoProvider];
  v4 = [v3 previousOccurrence];
  int v5 = [v4 alarmConfiguration];
  char v6 = [v5 isEnabled];

  return v6;
}

- (id)_timelineForDate:(id)a3
{
  id v4 = a3;
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  char v6 = [v5 infoProvider];
  BOOL v7 = (void *)MEMORY[0x263F75E60];
  uint64_t v8 = [v6 sleepScheduleModel];
  id v9 = [v7 builderWithSleepScheduleModel:v8 date:v4];

  v10 = [v9 buildTimelineWithOptions:0];
  id v11 = [v10 timeline];

  return v11;
}

- (id)_determineNextStateFromTimeline
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 infoProvider];
  int v5 = [v4 currentDate];

  char v6 = [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self _timelineForDate:v5];
  BOOL v7 = [v6 resolvedOccurrenceContainingDate:v5];
  uint64_t v8 = [v7 windDownInterval];
  int v9 = objc_msgSend(v8, "hksp_containsDate:searchOptions:", v5, 1);

  if (v9)
  {
    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v11 = v22;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] currently in a wind down session", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v12 = [v3 windDownState];
  }
  else
  {
    int v13 = [v7 bedtimeInterval];
    int v14 = objc_msgSend(v13, "hksp_containsDate:searchOptions:", v5, 1);

    uint64_t v15 = HKSPLogForCategory();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v17 = v22;
        _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] currently in a bedtime session", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v12 = [v3 bedtimeState];
    }
    else
    {
      if (v16)
      {
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v18 = v22;
        _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] not in a session, must be awake", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v12 = [v3 wakeUpState];
    }
  }
  v19 = (void *)v12;

  return v19;
}

- (void)significantTimeChange
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] significant time change occurred", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  [v5 updateState];
}

- (void)timeZoneChange
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] timezone change occurred", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self _forceUpdateStateWithChangeReason:6];
}

- (void)scheduleModelChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a3 isSignificantChange];
  int v5 = HKSPLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v7 = v11;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] significant schedule change occurred", (uint8_t *)&v10, 0xCu);
    }
    [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self significantScheduleChangeOccurred:6];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v8 = v11;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_INFO, "[%{public}@] schedule change not significant", (uint8_t *)&v10, 0xCu);
    }
    int v9 = [(HKSPStateMachineState *)self stateMachine];
    [v9 updateState];
  }
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

@end