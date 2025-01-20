@interface HDSPWakeDetectionStateMachineState
- (BOOL)isDetectingState;
- (BOOL)isWakeDetectionDisabled;
- (void)updateState;
@end

@implementation HDSPWakeDetectionStateMachineState

- (BOOL)isDetectingState
{
  return 0;
}

- (void)updateState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  if ([(HDSPWakeDetectionStateMachineState *)self isWakeDetectionDisabled])
  {
    v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138543362;
      *(void *)&v14[4] = objc_opt_class();
      id v5 = *(id *)&v14[4];
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection disabled", v14, 0xCu);
    }
    v6 = [v3 disabledState];
    [v3 enterState:v6];
  }
  else
  {
    v6 = [v3 infoProvider];
    char v7 = [v6 activeTypes];
    if (v7)
    {
      v9 = HKSPLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 138543362;
        *(void *)&v14[4] = objc_opt_class();
        id v10 = *(id *)&v14[4];
        _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] in detection window for activity (and explicit)", v14, 0xCu);
      }
      uint64_t v8 = [v3 activityDetectingState];
    }
    else if ((v7 & 2) != 0)
    {
      v11 = HKSPLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 138543362;
        *(void *)&v14[4] = objc_opt_class();
        id v12 = *(id *)&v14[4];
        _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] in detection window for explicit", v14, 0xCu);
      }
      uint64_t v8 = [v3 explicitDetectingState];
    }
    else
    {
      uint64_t v8 = [v3 waitingState];
    }
    v13 = (void *)v8;
    objc_msgSend(v3, "enterState:", v8, *(_OWORD *)v14);
  }
}

- (BOOL)isWakeDetectionDisabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  v4 = [v3 sleepScheduleModel];
  id v5 = [v4 sleepSchedule];
  if ([v5 isEnabledAndHasOccurrences])
  {
    v6 = [v4 sleepSettings];
    if ([v3 isWatch]
      && ([v6 watchSleepFeaturesEnabled] & 1) == 0)
    {
      char v7 = HKSPLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = (id)objc_opt_class();
        id v10 = v16;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_20;
    }
    char v7 = [v4 sleepEventRecord];
    if ([v3 isWatch]
      && ([v7 isAnySleepTrackingOnboardingCompleted] & 1) == 0)
    {
      v11 = HKSPLogForCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

LABEL_20:
        BOOL v8 = 1;
        goto LABEL_21;
      }
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      v13 = "[%{public}@] sleep tracking onboarding not completed";
    }
    else
    {
      if (([v3 isWatch] & 1) != 0
        || ([v7 isAnySleepCoachingOnboardingCompleted] & 1) != 0)
      {
        BOOL v8 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v11 = HKSPLogForCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      v13 = "[%{public}@] sleep coaching onboarding not completed";
    }
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);

    goto LABEL_19;
  }
  v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v9 = v16;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule disabled", (uint8_t *)&v15, 0xCu);
  }
  BOOL v8 = 1;
LABEL_22:

  return v8;
}

@end