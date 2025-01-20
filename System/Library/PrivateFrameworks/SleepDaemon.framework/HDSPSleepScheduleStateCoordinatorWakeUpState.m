@interface HDSPSleepScheduleStateCoordinatorWakeUpState
- (id)expirationDate;
- (id)stateName;
- (unint64_t)scheduleState;
- (void)bedtimeReached;
- (void)windDownReached;
@end

@implementation HDSPSleepScheduleStateCoordinatorWakeUpState

- (id)stateName
{
  return @"WakeUp";
}

- (unint64_t)scheduleState
{
  return 1;
}

- (void)windDownReached
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for wind down", buf, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__HDSPSleepScheduleStateCoordinatorWakeUpState_windDownReached__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
  [v6 perform:v8 withContext:v7];
}

void __63__HDSPSleepScheduleStateCoordinatorWakeUpState_windDownReached__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 windDownState];
  [v1 enterState:v2];
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
  v8[2] = __62__HDSPSleepScheduleStateCoordinatorWakeUpState_bedtimeReached__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  v7 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:1];
  [v6 perform:v8 withContext:v7];
}

void __62__HDSPSleepScheduleStateCoordinatorWakeUpState_bedtimeReached__block_invoke(uint64_t a1)
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
  v5 = [v3 currentDate];
  id v6 = [v4 upcomingEventsDueAfterDate:v5];
  v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_27);
  v8 = [v7 firstObject];
  id v9 = [v8 dueDate];

  return v9;
}

uint64_t __62__HDSPSleepScheduleStateCoordinatorWakeUpState_expirationDate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x263F75C50]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [v2 identifier];
    uint64_t v4 = [v5 isEqualToString:*MEMORY[0x263F75C18]];
  }
  return v4;
}

@end