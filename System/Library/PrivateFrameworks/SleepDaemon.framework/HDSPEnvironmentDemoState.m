@interface HDSPEnvironmentDemoState
- (id)stateName;
- (void)didEnter;
@end

@implementation HDSPEnvironmentDemoState

- (id)stateName
{
  return @"Demo";
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