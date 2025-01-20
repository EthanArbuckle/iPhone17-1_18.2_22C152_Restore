@interface HDSPSleepModeAutomatedOffState
- (id)stateName;
- (unint64_t)defaultChangeReason;
- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)sleepModeTurnedOnForUnknownReason;
@end

@implementation HDSPSleepModeAutomatedOffState

- (unint64_t)defaultChangeReason
{
  return 7;
}

- (id)stateName
{
  return @"Automated Off";
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation after having been turned off due to automation", (uint8_t *)&v7, 0xCu);
  }
  [(HDSPSleepModeAutomatedOffState *)self _automationTurnedOnSleepModeWithReason:a3];
}

- (void)sleepModeTurnedOnForUnknownReason
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for unknown reason after having been turned off due to automation, treating like automation on", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepModeAutomatedOffState *)self _automationTurnedOnSleepModeWithReason:7];
}

- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [(HKSPStateMachineState *)self stateMachine];
  int v5 = [v4 infoProvider];
  uint64_t v6 = [v5 sleepScheduleState];
  uint64_t v7 = [v4 automatedOnState];
  if ([v5 shouldGoIntoSleepModeDuringState:v6])
  {
    if (HKSPSleepScheduleStateIsForBedtime())
    {
      id v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = (id)objc_opt_class();
        id v9 = v21;
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, going into bedtime mode", buf, 0xCu);
      }
      uint64_t v10 = [v4 bedtimeState];
LABEL_10:
      v13 = (void *)v10;

      uint64_t v7 = v13;
      goto LABEL_11;
    }
    if (HKSPSleepScheduleStateIsForWindDown())
    {
      v11 = HKSPLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = (id)objc_opt_class();
        id v12 = v21;
        _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, going into wind down", buf, 0xCu);
      }
      uint64_t v10 = [v4 windDownState];
      goto LABEL_10;
    }
  }
LABEL_11:
  uint64_t v17 = MEMORY[0x263EF8330];
  id v18 = v4;
  id v19 = v7;
  id v14 = v7;
  id v15 = v4;
  v16 = +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3, v17, 3221225472, __73__HDSPSleepModeAutomatedOffState__automationTurnedOnSleepModeWithReason___block_invoke, &unk_2645D9288);
  [v15 perform:&v17 withContext:v16];
}

uint64_t __73__HDSPSleepModeAutomatedOffState__automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enterState:*(void *)(a1 + 40)];
}

@end