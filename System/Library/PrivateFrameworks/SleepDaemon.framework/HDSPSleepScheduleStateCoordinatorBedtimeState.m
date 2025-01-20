@interface HDSPSleepScheduleStateCoordinatorBedtimeState
- (id)expirationDate;
- (id)stateName;
- (unint64_t)scheduleState;
- (void)alarmDismissed;
- (void)wakeTimeReached;
- (void)wakeUpConfirmed:(BOOL)a3;
@end

@implementation HDSPSleepScheduleStateCoordinatorBedtimeState

- (id)stateName
{
  return @"Bedtime";
}

- (unint64_t)scheduleState
{
  return 2;
}

- (void)wakeTimeReached
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v4 = [(HDSPSleepScheduleStateCoordinatorStateMachineState *)self isAlarmEnabled];
  v5 = HKSPLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      id v18 = (id)objc_opt_class();
      id v7 = v18;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake time reached and alarm enabled", buf, 0xCu);
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke;
    v15[3] = &unk_2645D90C0;
    v8 = &v16;
    v16 = v3;
    id v9 = v3;
    v10 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
    v11 = v15;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      id v18 = (id)objc_opt_class();
      id v12 = v18;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake time reached and alarm disabled", buf, 0xCu);
    }
    uint64_t v13 = MEMORY[0x263EF8330];
    v8 = &v14;
    v14 = v3;
    id v9 = v3;
    v10 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 1, v13, 3221225472, __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke_281, &unk_2645D90C0);
    v11 = &v13;
  }
  [v9 perform:v11 withContext:v10];
}

void __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 delayedWakeUpState];
  [v1 enterState:v2];
}

void __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke_281(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 wakeUpState];
  [v1 enterState:v2];
}

- (void)wakeUpConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 1024;
    BOOL v16 = v3;
    id v6 = v14;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up was confirmed (wasExplicitConfirmation: %d)", buf, 0x12u);
  }
  id v7 = [(HKSPStateMachineState *)self stateMachine];
  if (v3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 8;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeUpConfirmed___block_invoke;
  v11[3] = &unk_2645D90C0;
  id v12 = v7;
  id v9 = v7;
  v10 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:v8];
  [v9 perform:v11 withContext:v10];
}

void __65__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeUpConfirmed___block_invoke(uint64_t a1)
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
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__HDSPSleepScheduleStateCoordinatorBedtimeState_alarmDismissed__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  id v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:7];
  [v6 perform:v8 withContext:v7];
}

void __63__HDSPSleepScheduleStateCoordinatorBedtimeState_alarmDismissed__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 wakeUpState];
  [v1 enterState:v2];
}

- (id)expirationDate
{
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v3 = [v2 infoProvider];

  id v4 = [v3 sleepScheduleModel];
  uint64_t v5 = *MEMORY[0x263F75C40];
  id v6 = [v3 currentDate];
  id v7 = [v4 nextEventWithIdentifier:v5 dueAfterDate:v6];

  uint64_t v8 = [v7 dateByAddingTimeInterval:900.0];

  return v8;
}

@end