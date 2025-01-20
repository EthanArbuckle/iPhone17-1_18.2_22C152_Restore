@interface MTSleepCoordinatorStateMachineState
- (id)determineNextStateForSleepAlarm:(id)a3;
- (void)updateState;
- (void)updateStateForSleepAlarm:(id)a3;
- (void)userBedTimeReached:(id)a3;
- (void)userWakeTimeReached:(id)a3;
- (void)userWakeUpAlarmFired;
- (void)userWentToBed;
- (void)userWokeUp;
- (void)wakeUpAlarmTimedOut;
@end

@implementation MTSleepCoordinatorStateMachineState

- (void)updateState
{
  id v4 = [(MTStateMachineState *)self stateMachine];
  v3 = [v4 sleepAlarm];
  [(MTSleepCoordinatorStateMachineState *)self updateStateForSleepAlarm:v3];
}

- (void)updateStateForSleepAlarm:(id)a3
{
  id v5 = [(MTSleepCoordinatorStateMachineState *)self determineNextStateForSleepAlarm:a3];
  id v4 = [(MTStateMachineState *)self stateMachine];
  [v4 enterState:v5];
}

- (id)determineNextStateForSleepAlarm:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MTStateMachineState *)self stateMachine];
  v7 = [v6 currentDate];

  if (!v5)
  {
    v11 = MTLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      v40 = self;
      v12 = "%{public}@ no sleep alarm, sleep disabled";
LABEL_11:
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v39, 0xCu);
    }
LABEL_12:

    v9 = [(MTStateMachineState *)self stateMachine];
    uint64_t v10 = [v9 disabledState];
LABEL_13:
    v13 = (void *)v10;
    goto LABEL_14;
  }
  if (([v5 sleepSchedule] & 1) == 0)
  {
    v11 = MTLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      v40 = self;
      v12 = "%{public}@ sleep schedule disabled";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if ([v5 isFiring])
  {
    v8 = MTLogForCategory(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      v40 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ haven't dismissed morning alarm yet so we're sleeping", (uint8_t *)&v39, 0xCu);
    }

    v9 = [(MTStateMachineState *)self stateMachine];
    uint64_t v10 = [v9 asleepState];
    goto LABEL_13;
  }
  v9 = [v5 nextTriggersAfterDate:v7 includeBedtime:1];
  v15 = [v9 firstObject];
  if ([v15 triggerType] == 5)
  {
    v16 = MTLogForCategory(7);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v15 triggerDate];
      int v39 = 138543618;
      v40 = self;
      __int16 v41 = 2114;
      v42 = v17;
      v18 = "%{public}@ wake up alarm was snoozed (%{public}@) so we're sleeping";
LABEL_24:
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v39, 0x16u);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if ([v15 triggerType] != 4 && objc_msgSend(v15, "triggerType") != 8)
  {
    v20 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_7);
    v19 = [v20 triggerDate];

    v21 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_2);
    v22 = [v21 triggerDate];

    if (v22)
    {
      v23 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_4);
      v24 = [v23 triggerDate];

      if ([v24 mtIsBeforeDate:v19]
        && [v22 mtIsAfterDate:v24]
        && [v22 mtIsBeforeDate:v19])
      {
        v25 = MTLogForCategory(7);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = 138543874;
          v40 = self;
          __int16 v41 = 2114;
          v42 = v22;
          __int16 v43 = 2114;
          v44 = v24;
          v26 = "%{public}@ bedtime reminder was snoozed (%{public}@) for after the bedtime: (%{public}@). it is currentl"
                "y before bedtime and the snooze date";
          v27 = v25;
          uint32_t v28 = 32;
LABEL_39:
          _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v39, v28);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      if ([v24 mtIsAfterDate:v19]
        && [v22 mtIsBeforeDate:v24]
        && [v22 mtIsBeforeDate:v19])
      {
        v25 = MTLogForCategory(7);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = 138543618;
          v40 = self;
          __int16 v41 = 2114;
          v42 = v22;
          v26 = "%{public}@ bedtime reminder was snoozed (%{public}@) for after the bedtime. it is currently past bedtime"
                " but before the snooze date.";
          v27 = v25;
          uint32_t v28 = 22;
          goto LABEL_39;
        }
LABEL_40:

        v29 = [(MTStateMachineState *)self stateMachine];
        v13 = [v29 awakeState];

LABEL_58:
        goto LABEL_26;
      }
      v30 = objc_msgSend(v9, "na_filter:", &__block_literal_global_7);

      uint64_t v31 = [v30 firstObject];

      v15 = (void *)v31;
      v9 = v30;
    }
    if ([v15 triggerType] == 7 && objc_msgSend(v5, "confirmedLastBedtimeReminder"))
    {
      v32 = MTLogForCategory(7);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v5 bedtimeDismissedDate];
        int v39 = 138543874;
        v40 = self;
        __int16 v41 = 2114;
        v42 = v33;
        __int16 v43 = 2114;
        v44 = v19;
        _os_log_impl(&dword_19CC95000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ user confirmed go to bed notification (%{public}@) so we're sleeping until %{public}@", (uint8_t *)&v39, 0x20u);
      }
      v24 = [(MTStateMachineState *)self stateMachine];
      uint64_t v34 = [v24 asleepState];
      goto LABEL_57;
    }
    if ([v15 triggerType] == 2 || objc_msgSend(v15, "triggerType") == 7)
    {
      if ([v15 triggerType] == 2)
      {
        v35 = MTLogForCategory(7);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [v15 triggerDate];
          int v39 = 138543618;
          v40 = self;
          __int16 v41 = 2114;
          v42 = v36;
          v37 = "%{public}@ haven't seen go to bed reminder yet (%{public}@)";
LABEL_55:
          _os_log_impl(&dword_19CC95000, v35, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v39, 0x16u);

          goto LABEL_56;
        }
        goto LABEL_56;
      }
      if ([v15 triggerType] == 7)
      {
        v35 = MTLogForCategory(7);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [v15 triggerDate];
          int v39 = 138543618;
          v40 = self;
          __int16 v41 = 2114;
          v42 = v36;
          v37 = "%{public}@ not bedtime yet (%{public}@)";
          goto LABEL_55;
        }
LABEL_56:

        v24 = [(MTStateMachineState *)self stateMachine];
        uint64_t v34 = [v24 awakeState];
LABEL_57:
        v13 = (void *)v34;
        goto LABEL_58;
      }
    }

    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"MTSleepCoordinatorStateMachineState.m" lineNumber:127 description:@"Unhandled sleep window case!"];

    v13 = 0;
    goto LABEL_27;
  }
  v16 = MTLogForCategory(7);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v15 triggerDate];
    int v39 = 138543618;
    v40 = self;
    __int16 v41 = 2114;
    v42 = v17;
    v18 = "%{public}@ next trigger is for wake up (%{public}@) so we're sleeping";
    goto LABEL_24;
  }
LABEL_25:

  v19 = [(MTStateMachineState *)self stateMachine];
  v13 = [v19 asleepState];
LABEL_26:

LABEL_27:
LABEL_14:

  return v13;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke(uint64_t a1, void *a2)
{
  return [a2 triggerType] == 8;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 triggerType] == 3;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 triggerType] == 7;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 triggerType] != 3;
}

- (void)userWokeUp
{
  id v5 = [(MTStateMachineState *)self stateMachine];
  v3 = [(MTStateMachineState *)self stateMachine];
  id v4 = [v3 awakeState];
  [v5 enterState:v4];
}

- (void)userWentToBed
{
  id v5 = [(MTStateMachineState *)self stateMachine];
  v3 = [(MTStateMachineState *)self stateMachine];
  id v4 = [v3 asleepState];
  [v5 enterState:v4];
}

- (void)userBedTimeReached:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ bedtime reached, checking state", (uint8_t *)&v5, 0xCu);
  }

  [(MTSleepCoordinatorStateMachineState *)self updateState];
}

- (void)userWakeTimeReached:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MTStateMachineState *)self stateMachine];
  v6 = [v5 sleepAlarm];

  if ([v6 isEnabled])
  {
    [(MTSleepCoordinatorStateMachineState *)self updateStateForSleepAlarm:v6];
  }
  else
  {
    uint64_t v7 = MTLogForCategory(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ waketime reached but alarm not enabled, dismissing", (uint8_t *)&v10, 0xCu);
    }

    v8 = [(MTStateMachineState *)self stateMachine];
    v9 = [(MTStateMachineState *)self stateMachine];
    [v8 stateMachine:v9 dismissWakeUpAlarm:v4 dismissAction:8];
  }
}

- (void)userWakeUpAlarmFired
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling alarm timeout", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(MTStateMachineState *)self stateMachine];
  int v5 = [(MTStateMachineState *)self stateMachine];
  v6 = [(MTStateMachineState *)self stateMachine];
  objc_msgSend(v4, "stateMachine:shouldScheduleAlarmTimeoutForSecondsFromNow:", v5, (double)(unint64_t)(60 * objc_msgSend(v6, "sleepTimeOutMinutes")));

  [(MTSleepCoordinatorStateMachineState *)self updateState];
}

- (void)wakeUpAlarmTimedOut
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm timeout occurred, dismissing", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(MTStateMachineState *)self stateMachine];
  int v5 = [(MTStateMachineState *)self stateMachine];
  v6 = [(MTStateMachineState *)self stateMachine];
  int v7 = [v6 currentDate];
  [v4 stateMachine:v5 dismissWakeUpAlarm:v7 dismissAction:7];
}

@end