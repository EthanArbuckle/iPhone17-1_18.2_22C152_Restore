@interface HDSPSleepWidgetNotOnboardedState
- (BOOL)reloadsWidgetOnModelChange;
- (BOOL)reloadsWidgetOnTimeChange;
- (BOOL)widgetStateHasTimeComponent;
- (id)stateName;
- (int64_t)widgetState;
- (void)sleepScheduleModelDidChange:(id)a3;
@end

@implementation HDSPSleepWidgetNotOnboardedState

- (id)stateName
{
  return @"NotOnboarded";
}

- (int64_t)widgetState
{
  return 7;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

- (void)sleepScheduleModelDidChange:(id)a3
{
  id v6 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v6 infoProvider];
  if ([v4 isOnboarded])
  {
    v5 = [(HKSPStateMachineState *)self stateMachine];
    [v5 updateState];
  }
}

@end