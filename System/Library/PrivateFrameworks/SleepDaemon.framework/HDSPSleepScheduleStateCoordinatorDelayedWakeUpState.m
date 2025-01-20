@interface HDSPSleepScheduleStateCoordinatorDelayedWakeUpState
- (id)expirationDate;
- (id)stateName;
- (unint64_t)scheduleState;
- (void)alarmDismissed;
- (void)bedtimeReached;
- (void)didExit;
- (void)significantScheduleChangeOccurred:(unint64_t)a3;
- (void)updateStateForcibly:(BOOL)a3;
- (void)wakeUpConfirmed:(BOOL)a3;
- (void)windDownReached;
@end

@implementation HDSPSleepScheduleStateCoordinatorDelayedWakeUpState

- (id)stateName
{
  return @"DelayedWakeUp";
}

- (unint64_t)scheduleState
{
  return 6;
}

- (void)didExit
{
  v7.receiver = self;
  v7.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
  [(HKSPStateMachineState *)&v7 didExit];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 snoozeFireDateShouldBeReset];
  }
}

- (void)wakeUpConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 1024;
    BOOL v16 = v3;
    id v6 = v14;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up was confirmed (wasExplicitConfirmation: %d)", buf, 0x12u);
  }
  objc_super v7 = [(HKSPStateMachineState *)self stateMachine];
  if (v3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 8;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_wakeUpConfirmed___block_invoke;
  v11[3] = &unk_2645D90C0;
  id v12 = v7;
  id v9 = v7;
  v10 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:v8];
  [v9 perform:v11 withContext:v10];
}

void __71__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_wakeUpConfirmed___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 wakeUpState];
  [v1 enterState:v2];
}

- (void)alarmDismissed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm was dismissed", buf, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_alarmDismissed__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  objc_super v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:7];
  [v6 perform:v8 withContext:v7];
}

void __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_alarmDismissed__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 wakeUpState];
  [v1 enterState:v2];
}

- (void)significantScheduleChangeOccurred:(unint64_t)a3
{
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  [v5 snoozeFireDateShouldBeReset];

  v6.receiver = self;
  v6.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
  [(HDSPSleepScheduleStateCoordinatorStateMachineState *)&v6 significantScheduleChangeOccurred:a3];
}

- (void)updateStateForcibly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  if ([(HDSPSleepScheduleStateCoordinatorStateMachineState *)self isAlarmEnabled])
  {
    v9.receiver = self;
    v9.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
    [(HDSPSleepScheduleStateCoordinatorStateMachineState *)&v9 updateStateForcibly:v3];
  }
  else
  {
    objc_super v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = (id)objc_opt_class();
      id v7 = v13;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] treating disabled alarm as confirmed wake up", buf, 0xCu);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_updateStateForcibly___block_invoke;
    v10[3] = &unk_2645D90C0;
    id v11 = v5;
    uint64_t v8 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextForAlarmTurnedOffWhileFiring];
    [v11 perform:v10 withContext:v8];
  }
}

void __75__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_updateStateForcibly___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 wakeUpState];
  [v1 enterState:v2];
}

- (id)expirationDate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v3 = [v2 infoProvider];

  id v4 = [v3 sleepScheduleModel];
  int v5 = [v4 sleepEventRecord];
  objc_super v6 = [v3 currentDate];
  id v7 = [v5 wakeUpAlarmSnoozedUntilDate];
  int v8 = objc_msgSend(v7, "hksp_isAfterDate:", v6);

  if (v8)
  {
    objc_super v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [v5 wakeUpAlarmSnoozedUntilDate];
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] still waiting for snoozed alarm %{public}@", (uint8_t *)&v20, 0x16u);
    }
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = [v4 sleepSchedule];
    [v14 windDownTime];
    __int16 v15 = (id *)MEMORY[0x263F75C50];
    if (v16 <= 0.0) {
      __int16 v15 = (id *)MEMORY[0x263F75C18];
    }
    objc_super v9 = *v15;

    id v13 = [v4 nextEventWithIdentifier:v9 dueAfterDate:v6];
    uint64_t v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      v23 = v13;
      id v18 = v21;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] waiting until %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  return v13;
}

- (void)windDownReached
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for wind down", buf, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_windDownReached__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  id v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
  [v6 perform:v8 withContext:v7];
}

void __70__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_windDownReached__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 windDownState];
  [v1 enterState:v2];
}

- (void)bedtimeReached
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for bed", buf, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_bedtimeReached__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  id v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
  [v6 perform:v8 withContext:v7];
}

void __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_bedtimeReached__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 bedtimeState];
  [v1 enterState:v2];
}

@end