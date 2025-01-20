@interface _HDSPSleepModeOnState
- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)sleepModeTurnedOnForUnknownReason;
- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3;
@end

@implementation _HDSPSleepModeOnState

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(HKSPStateMachineState *)self stateName];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turn on sleep mode, ignoring because we're already in %{public}@ mode", (uint8_t *)&v8, 0x16u);
  }
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(HKSPStateMachineState *)self stateName];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation, ignoring because we're already in %{public}@ mode", (uint8_t *)&v8, 0x16u);
  }
}

- (void)sleepModeTurnedOnForUnknownReason
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = [(HKSPStateMachineState *)self stateName];
    int v7 = 138543618;
    int v8 = v4;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for unknown reason, ignoring because we're already in %{public}@ mode", (uint8_t *)&v7, 0x16u);
  }
}

@end