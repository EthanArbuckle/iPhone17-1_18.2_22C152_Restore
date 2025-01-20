@interface _HDSPSleepModeTurnedOnState
- (int64_t)sleepMode;
- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToDisabled;
- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4;
@end

@implementation _HDSPSleepModeTurnedOnState

- (int64_t)sleepMode
{
  return 2;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(HKSPStateMachineState *)self stateName];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, but staying in %{public}@ mode", (uint8_t *)&v9, 0x16u);
  }
}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(HKSPStateMachineState *)self stateName];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, but staying in %{public}@ mode", (uint8_t *)&v9, 0x16u);
  }
}

- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 5 && (HKSPSleepScheduleStateIsForSleep() & 1) == 0)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(HKSPStateMachineState *)self stateName];
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] staying in %{public}@ mode because we were already in wake up", buf, 0x16u);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_HDSPSleepModeTurnedOnState;
    [(HDSPSleepModeStateMachineState *)&v11 sleepScheduleStateChangedToWakeUp:a3 fromState:a4];
  }
}

- (void)sleepScheduleStateChangedToDisabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    v6 = [(HKSPStateMachineState *)self stateName];
    int v7 = 138543618;
    v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule state is disabled but staying in %{public}@ mode", (uint8_t *)&v7, 0x16u);
  }
}

@end