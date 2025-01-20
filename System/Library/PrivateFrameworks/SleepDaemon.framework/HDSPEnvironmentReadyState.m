@interface HDSPEnvironmentReadyState
- (id)stateName;
- (void)didEnter;
@end

@implementation HDSPEnvironmentReadyState

- (id)stateName
{
  return @"Ready";
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 environmentDidBecomeReady];
  }
}

@end