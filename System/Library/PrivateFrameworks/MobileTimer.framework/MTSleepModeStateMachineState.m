@interface MTSleepModeStateMachineState
- (id)determineNextState:(BOOL)a3;
- (id)nextSleepModeEndDate;
- (id)nextSleepModeEndDateAfterDate:(id)a3;
- (id)nextSleepModeStartDate;
- (id)nextSleepModeStartDateAfterDate:(id)a3;
- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5;
- (void)updateModeKeepOffUntilDateIfNecessary;
- (void)updateState:(BOOL)a3;
- (void)userWokeUp;
@end

@implementation MTSleepModeStateMachineState

- (void)updateState:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTSleepModeStateMachineState *)self updateModeKeepOffUntilDateIfNecessary];
  id v6 = [(MTSleepModeStateMachineState *)self determineNextState:v3];
  v5 = [(MTStateMachineState *)self stateMachine];
  [v5 enterState:v6];
}

- (void)updateModeKeepOffUntilDateIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTStateMachineState *)self stateMachine];
  v4 = [v3 currentDate];

  v5 = [(MTStateMachineState *)self stateMachine];
  id v6 = [v5 keepOffUntilDate];

  if (v6 && [v4 mtIsBeforeDate:v6])
  {
    v7 = [(MTSleepModeStateMachineState *)self nextSleepModeStartDateAfterDate:v4];
    if (([v6 isEqualToDate:v7] & 1) == 0)
    {
      v8 = MTLogForCategory(7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating keep off until date: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      v9 = [(MTStateMachineState *)self stateMachine];
      v10 = [(MTStateMachineState *)self stateMachine];
      [v9 stateMachine:v10 keepSleepModeOffUntilDate:v7];
    }
  }
}

- (id)determineNextState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = [(MTStateMachineState *)self stateMachine];
  id v6 = [v5 currentDate];

  v7 = [(MTStateMachineState *)self stateMachine];
  v8 = [v7 keepOffUntilDate];

  if (!v8 || ![v6 mtIsBeforeDate:v8])
  {
    v12 = [(MTStateMachineState *)self stateMachine];
    v10 = [v12 sleepAlarm];

    if (!v10)
    {
      v22 = MTLogForCategory(7);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138543618;
        v32 = self;
        __int16 v33 = 2114;
        v34 = @"sleep mode";
        _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ no sleep alarm, turning off %{public}@ if it's on", (uint8_t *)&v31, 0x16u);
      }
      goto LABEL_24;
    }
    if ([v10 sleepSchedule])
    {
      if ([v10 sleepMode])
      {
        __int16 v13 = [(MTStateMachineState *)self stateMachine];
        int v14 = [v13 isUserAsleep];

        if (v14)
        {
          if (!v3
            || ([v10 bedtimeReminder], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
            || (v16 = (void *)v15, uint64_t v17 = [v10 bedtimeReminderMinutes], v16, v17))
          {
            v18 = MTLogForCategory(7);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [v10 alarmIDString];
              int v31 = 138543874;
              v32 = self;
              __int16 v33 = 2114;
              v34 = @"sleep mode";
              __int16 v35 = 2114;
              v36 = v19;
              _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ turning on %{public}@ if it's not on for alarm %{public}@", (uint8_t *)&v31, 0x20u);
            }
            v20 = [(MTStateMachineState *)self stateMachine];
            v21 = [(MTSleepModeStateMachineState *)self nextSleepModeEndDate];
            int v11 = [v20 onStateWithSleepModeEndDate:v21];

            goto LABEL_26;
          }
          v29 = MTLogForCategory(7);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v10 alarmIDString];
            int v31 = 138543874;
            v32 = self;
            __int16 v33 = 2114;
            v34 = @"sleep mode";
            __int16 v35 = 2114;
            v36 = v30;
            _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ waiting 60 seconds before turning on %{public}@ for alarm %{public}@", (uint8_t *)&v31, 0x20u);
          }
          v20 = [(MTStateMachineState *)self stateMachine];
          uint64_t v27 = [v20 waitingState];
LABEL_25:
          int v11 = (void *)v27;
LABEL_26:

          goto LABEL_27;
        }
        v22 = MTLogForCategory(7);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v10 alarmIDString];
          int v31 = 138543874;
          v32 = self;
          __int16 v33 = 2114;
          v34 = v23;
          __int16 v35 = 2114;
          v36 = @"sleep mode";
          v24 = "%{public}@ not in sleep window for alarm %{public}@, turning off %{public}@ if it's on";
          goto LABEL_20;
        }
      }
      else
      {
        v22 = MTLogForCategory(7);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v10 alarmIDString];
          int v31 = 138544130;
          v32 = self;
          __int16 v33 = 2114;
          v34 = @"sleep mode";
          __int16 v35 = 2114;
          v36 = v23;
          __int16 v37 = 2114;
          v38 = @"sleep mode";
          v24 = "%{public}@ %{public}@ not enabled for alarm %{public}@, turning off %{public}@ if it's on";
          v25 = v22;
          uint32_t v26 = 42;
          goto LABEL_23;
        }
      }
    }
    else
    {
      v22 = MTLogForCategory(7);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v10 alarmIDString];
        int v31 = 138543874;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v23;
        __int16 v35 = 2114;
        v36 = @"sleep mode";
        v24 = "%{public}@ sleep schedule for %{public}@ not enabled, turning off %{public}@ if it's on";
LABEL_20:
        v25 = v22;
        uint32_t v26 = 32;
LABEL_23:
        _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v31, v26);
      }
    }
LABEL_24:

    v20 = [(MTStateMachineState *)self stateMachine];
    uint64_t v27 = [v20 offState];
    goto LABEL_25;
  }
  v9 = MTLogForCategory(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138543874;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v8;
    __int16 v35 = 2114;
    v36 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ We are before keep off until date: %{public}@, turning off %{public}@ if it's on", (uint8_t *)&v31, 0x20u);
  }

  v10 = [(MTStateMachineState *)self stateMachine];
  int v11 = [v10 userRequestedOffStateWithKeepOffUntilDate:v8];
LABEL_27:

  return v11;
}

- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v6)
  {
    v9 = [(MTSleepModeStateMachineState *)self nextSleepModeEndDate];
    v10 = [(MTStateMachineState *)self stateMachine];
    int v11 = [(MTStateMachineState *)self stateMachine];
    uint64_t v12 = [v11 onStateWithSleepModeEndDate:v9];
  }
  else
  {
    if (!v5)
    {
      v9 = [(MTStateMachineState *)self stateMachine];
      uint64_t v17 = [(MTStateMachineState *)self stateMachine];
      v18 = [v17 offState];
      [v9 enterState:v18];

      goto LABEL_9;
    }
    v9 = [(MTSleepModeStateMachineState *)self nextSleepModeStartDateAfterDate:v8];
    __int16 v13 = [(MTStateMachineState *)self stateMachine];
    int v14 = [v13 currentDate];
    int v15 = [v9 mtIsAfterDate:v14];

    if (!v15)
    {
      v10 = MTLogForCategory(7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        v20 = self;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring user requested off because it's for previous sleep window", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_7;
    }
    v10 = [(MTStateMachineState *)self stateMachine];
    int v11 = [(MTStateMachineState *)self stateMachine];
    uint64_t v12 = [v11 userRequestedOffStateWithKeepOffUntilDate:v9];
  }
  v16 = (void *)v12;
  [v10 enterState:v12];

LABEL_7:
LABEL_9:
}

- (void)userWokeUp
{
  id v5 = [(MTStateMachineState *)self stateMachine];
  BOOL v3 = [(MTStateMachineState *)self stateMachine];
  v4 = [v3 offState];
  [v5 enterState:v4];
}

- (id)nextSleepModeEndDate
{
  BOOL v3 = [(MTStateMachineState *)self stateMachine];
  v4 = [v3 currentDate];
  id v5 = [(MTSleepModeStateMachineState *)self nextSleepModeEndDateAfterDate:v4];

  return v5;
}

- (id)nextSleepModeEndDateAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachineState *)self stateMachine];
  BOOL v6 = [v5 sleepAlarm];
  v7 = [v6 nextExpectedWakeUpDateAfterDate:v4];

  return v7;
}

- (id)nextSleepModeStartDate
{
  BOOL v3 = [(MTStateMachineState *)self stateMachine];
  id v4 = [v3 currentDate];
  id v5 = [(MTSleepModeStateMachineState *)self nextSleepModeStartDateAfterDate:v4];

  return v5;
}

- (id)nextSleepModeStartDateAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachineState *)self stateMachine];
  BOOL v6 = [v5 sleepAlarm];
  v7 = [v6 nextExpectedBedtimeDateAfterDate:v4];

  return v7;
}

@end