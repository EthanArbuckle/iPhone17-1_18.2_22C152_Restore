@interface HDSPWakeDetectionActivityDetectingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
- (unint64_t)activeTypes;
@end

@implementation HDSPWakeDetectionActivityDetectingState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 nextWakeUp];

  return v4;
}

- (unint64_t)activeTypes
{
  return 3;
}

- (id)stateName
{
  return @"ActivityDetecting";
}

- (BOOL)schedulesExpiration
{
  return 0;
}

@end