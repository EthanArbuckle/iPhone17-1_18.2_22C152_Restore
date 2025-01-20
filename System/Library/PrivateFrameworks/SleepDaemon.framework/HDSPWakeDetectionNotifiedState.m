@interface HDSPWakeDetectionNotifiedState
- (id)expirationDate;
- (id)stateName;
- (void)didEnter;
- (void)stateDidExpire;
- (void)updateState;
@end

@implementation HDSPWakeDetectionNotifiedState

- (id)expirationDate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 infoProvider];

  v5 = [v4 currentDate];
  v6 = [v4 sleepScheduleModel];
  v7 = [v4 currentDate];
  v8 = [v6 nextEventDueAfterDate:v7];

  v9 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v10 = [v9 endDate];

  if (v10
    && ([v8 dueDate],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend(v11, "hksp_isAfterDate:", v10),
        v11,
        v12))
  {
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v14 = v19;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeup has changed to be later, treating state as expired", (uint8_t *)&v18, 0xCu);
    }
    id v15 = v5;
  }
  else
  {
    id v15 = [v8 dueDate];
  }
  v16 = v15;

  return v16;
}

- (void)didEnter
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];

  if ([v4 hasStateTransitionOrInitializing])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v5 = [v4 type]) != 0)
    {
      uint64_t v6 = v5;
      v7 = [(HKSPStateMachineState *)self stateMachine];
      [v7 postWakeDetectionNotification:v6];
    }
    else
    {
      v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = (id)objc_opt_class();
        id v9 = v11;
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting wake detection notification", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)updateState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(HDSPWakeDetectionStateMachineState *)self isWakeDetectionDisabled])
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v4 = v9;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection disabled after notifying", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = [(HKSPStateMachineState *)self stateMachine];
    uint64_t v6 = [(HKSPStateMachineState *)self stateMachine];
    v7 = [v6 disabledState];
    [v5 enterState:v7];
  }
}

- (void)stateDidExpire
{
  v2.receiver = self;
  v2.super_class = (Class)HDSPWakeDetectionNotifiedState;
  [(HDSPWakeDetectionStateMachineState *)&v2 updateState];
}

- (id)stateName
{
  return @"Notified";
}

@end