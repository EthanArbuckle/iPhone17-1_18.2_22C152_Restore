@interface HDSPEnvironmentMigrationState
- (id)stateName;
- (void)dataMigrationDidComplete;
- (void)didEnter;
@end

@implementation HDSPEnvironmentMigrationState

- (id)stateName
{
  return @"Migration";
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 environmentShouldMigrateData];
  }
}

- (void)dataMigrationDidComplete
{
  id v3 = [(HKSPStateMachineState *)self stateMachine];
  v2 = [v3 readyState];
  [v3 enterState:v2];
}

@end