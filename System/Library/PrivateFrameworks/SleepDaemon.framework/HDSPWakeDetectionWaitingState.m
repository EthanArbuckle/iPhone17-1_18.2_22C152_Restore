@interface HDSPWakeDetectionWaitingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
@end

@implementation HDSPWakeDetectionWaitingState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 upcomingStartDetection];

  return v4;
}

- (id)stateName
{
  return @"Waiting";
}

- (BOOL)schedulesExpiration
{
  return 1;
}

@end