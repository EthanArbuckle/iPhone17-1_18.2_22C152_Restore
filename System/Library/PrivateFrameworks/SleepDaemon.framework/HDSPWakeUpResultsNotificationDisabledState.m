@interface HDSPWakeUpResultsNotificationDisabledState
- (id)stateName;
- (void)updateState;
@end

@implementation HDSPWakeUpResultsNotificationDisabledState

- (id)stateName
{
  return @"Disabled";
}

- (void)updateState
{
  if ([(HDSPWakeUpResultsNotificationStateMachineState *)self isNotificationEnabled])
  {
    id v5 = [(HKSPStateMachineState *)self stateMachine];
    v3 = [(HKSPStateMachineState *)self stateMachine];
    v4 = [v3 waitingForWakeUpState];
    [v5 enterState:v4];
  }
}

@end