@interface HDSPWakeUpResultsNotificationWaitingForRetryState
- (id)expirationDate;
- (id)stateName;
- (void)didEnter;
- (void)didExit;
- (void)retryAttemptEventDue;
@end

@implementation HDSPWakeUpResultsNotificationWaitingForRetryState

- (id)stateName
{
  return @"WaitingForRetry";
}

- (id)expirationDate
{
  v3 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v4 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v5 = [v4 currentDate];
  v6 = [v3 notificationAttemptWindowForWakeUpBeforeDate:v5];
  v7 = [v6 endDate];

  return v7;
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 scheduleRetryAttempt];
  }
}

- (void)didExit
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  v4 = [v3 currentContext];
  int v5 = [v4 hasStateTransitionOrInitializing];

  if (v5)
  {
    id v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 unscheduleRetryAttempt];
  }
}

- (void)retryAttemptEventDue
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received retry event", (uint8_t *)&v8, 0xCu);
  }
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  id v6 = [(HKSPStateMachineState *)self stateMachine];
  v7 = [v6 queryingState];
  [v5 enterState:v7];
}

@end