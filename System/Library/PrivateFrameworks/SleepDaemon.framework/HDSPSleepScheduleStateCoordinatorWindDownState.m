@interface HDSPSleepScheduleStateCoordinatorWindDownState
- (id)expirationDate;
- (id)stateName;
- (unint64_t)scheduleState;
- (void)bedtimeReached;
@end

@implementation HDSPSleepScheduleStateCoordinatorWindDownState

- (id)stateName
{
  return @"WindDown";
}

- (unint64_t)scheduleState
{
  return 3;
}

- (void)bedtimeReached
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for bed", buf, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HDSPSleepScheduleStateCoordinatorWindDownState_bedtimeReached__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
  [v6 perform:v8 withContext:v7];
}

void __64__HDSPSleepScheduleStateCoordinatorWindDownState_bedtimeReached__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 bedtimeState];
  [v1 enterState:v2];
}

- (id)expirationDate
{
  id v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  id v4 = [v3 sleepScheduleModel];
  uint64_t v5 = *MEMORY[0x263F75C18];
  id v6 = [v3 currentDate];
  v7 = [v4 nextEventWithIdentifier:v5 dueAfterDate:v6];

  v8 = [v7 dateByAddingTimeInterval:60.0];

  return v8;
}

@end