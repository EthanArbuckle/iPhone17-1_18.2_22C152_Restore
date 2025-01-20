@interface HDSPWakeDetectionExplicitDetectingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
- (unint64_t)activeTypes;
@end

@implementation HDSPWakeDetectionExplicitDetectingState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 upcomingStartDetection];

  return v4;
}

- (unint64_t)activeTypes
{
  return 2;
}

- (id)stateName
{
  return @"ExplicitDetecting";
}

- (BOOL)schedulesExpiration
{
  return 1;
}

@end