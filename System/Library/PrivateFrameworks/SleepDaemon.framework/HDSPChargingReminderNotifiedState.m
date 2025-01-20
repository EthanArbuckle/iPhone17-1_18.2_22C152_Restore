@interface HDSPChargingReminderNotifiedState
- (id)expirationDate;
- (id)stateName;
- (void)didEnter;
- (void)stateDidExpire;
- (void)updateState;
@end

@implementation HDSPChargingReminderNotifiedState

- (id)expirationDate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 infoProvider];

  v5 = [v4 currentDate];
  v6 = [v4 sleepScheduleModel];
  v7 = [v6 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v5];

  v8 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v9 = [v8 endDate];

  v10 = v7;
  if (v9)
  {
    int v11 = objc_msgSend(v7, "hksp_isAfterDate:", v9);
    v10 = v7;
    if (v11)
    {
      v12 = HKSPLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = (id)objc_opt_class();
        id v13 = v17;
        _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] bedtime has changed to be later, treating state as expired", (uint8_t *)&v16, 0xCu);
      }
      v10 = v5;
    }
  }
  id v14 = v10;

  return v14;
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
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending notification", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(HKSPStateMachineState *)self stateMachine];
    [v8 postChargingReminderNotification];
  }
}

- (void)updateState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(HDSPChargingReminderStateMachineState *)self isChargingReminderDisabled])
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v4 = v9;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] charging reminders disabled after notifying", (uint8_t *)&v8, 0xCu);
    }
    int v5 = [(HKSPStateMachineState *)self stateMachine];
    v6 = [(HKSPStateMachineState *)self stateMachine];
    id v7 = [v6 disabledState];
    [v5 enterState:v7];
  }
}

- (void)stateDidExpire
{
  v2.receiver = self;
  v2.super_class = (Class)HDSPChargingReminderNotifiedState;
  [(HDSPChargingReminderStateMachineState *)&v2 updateState];
}

- (id)stateName
{
  return @"Notified";
}

@end