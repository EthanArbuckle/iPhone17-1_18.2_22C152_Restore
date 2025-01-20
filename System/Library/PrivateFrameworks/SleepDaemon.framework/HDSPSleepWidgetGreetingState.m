@interface HDSPSleepWidgetGreetingState
- (BOOL)reloadsWidgetOnModelChange;
- (BOOL)reloadsWidgetOnTimeChange;
- (BOOL)schedulesExpiration;
- (double)expirationDuration;
- (id)stateName;
- (int64_t)widgetState;
- (void)stateDidExpire;
@end

@implementation HDSPSleepWidgetGreetingState

- (double)expirationDuration
{
  return 7200.0;
}

- (id)stateName
{
  return @"Greeting";
}

- (int64_t)widgetState
{
  return 6;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (void)stateDidExpire
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138543362;
    *(void *)&v10[4] = objc_opt_class();
    id v4 = *(id *)&v10[4];
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received greeting expired event due", v10, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  BOOL v6 = [(HDSPSleepWidgetStateMachineState *)self shouldGoIntoUpcomingState];
  v7 = [(HKSPStateMachineState *)self stateMachine];
  v8 = v7;
  if (v6) {
    [v7 upcomingState];
  }
  else {
  v9 = [v7 waitingState];
  }
  objc_msgSend(v5, "enterState:", v9, *(_OWORD *)v10);
}

@end