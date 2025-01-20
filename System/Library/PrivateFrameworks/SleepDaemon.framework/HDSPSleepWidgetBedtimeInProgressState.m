@interface HDSPSleepWidgetBedtimeInProgressState
- (id)stateName;
- (int64_t)widgetState;
- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3;
@end

@implementation HDSPSleepWidgetBedtimeInProgressState

- (id)stateName
{
  return @"BedtimeInProgress";
}

- (int64_t)widgetState
{
  return 5;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 == 2 && a4)
  {
    v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turned on sleep mode, staying here", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 updateState];
  }
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [v5 infoProvider];
  char v7 = [v6 inUnscheduledSleepMode];

  if (v7)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] in user requested sleep mode, staying here", buf, 0xCu);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HDSPSleepWidgetBedtimeInProgressState;
    [(HDSPSleepWidgetStateMachineState *)&v10 sleepScheduleStateDidChange:a3];
  }
}

@end