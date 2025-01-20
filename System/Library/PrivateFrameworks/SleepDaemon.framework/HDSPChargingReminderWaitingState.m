@interface HDSPChargingReminderWaitingState
- (BOOL)schedulesExpiration;
- (id)expirationDate;
- (id)stateName;
@end

@implementation HDSPChargingReminderWaitingState

- (id)expirationDate
{
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];

  v4 = [v3 currentDate];
  v5 = [v3 monitoringWindowAfterDate:v4];
  v6 = [v5 startDate];

  return v6;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (id)stateName
{
  return @"Waiting";
}

@end