@interface HDSPWakeUpResultsNotificationQueryingState
- (BOOL)schedulesExpiration;
- (HDSPWakeUpResultsNotificationQueryingState)initWithCoder:(id)a3;
- (id)expirationDate;
- (id)stateName;
- (void)_executeQuery;
- (void)_retryQueryIfNeededOrTransitionToNeedsProtectedDataState;
- (void)_transitionToNotifiedState;
- (void)_transitionToRetryState;
- (void)_transitionToWaitingForWakeUpState;
- (void)didEnter;
- (void)didExit;
- (void)protectedHealthDataDidBecomeAvailable;
- (void)queryDidComplete;
- (void)queryDidFailWithError:(id)a3;
@end

@implementation HDSPWakeUpResultsNotificationQueryingState

- (HDSPWakeUpResultsNotificationQueryingState)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDSPWakeUpResultsNotificationQueryingState;
  v3 = [(HKSPPersistentStateMachineState *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldRetryImmediatelyOnFailure = 0;
    v5 = v3;
  }

  return v4;
}

- (id)stateName
{
  return @"Querying";
}

- (id)expirationDate
{
  v3 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v4 = [(HDSPWakeUpResultsNotificationStateMachineState *)self infoProvider];
  v5 = [v4 currentDate];
  v6 = [v3 notificationAttemptWindowForWakeUpBeforeDate:v5];
  objc_super v7 = [v6 endDate];

  return v7;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)didEnter
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v14 = [v3 currentContext];

  if ([v14 hasStateTransitionOrInitializing])
  {
    v4 = [(HKSPStateMachineState *)self stateMachine];
    uint64_t v5 = [v14 previousState];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [v4 needsProtectedDataState];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [v14 previousState];
        v10 = [v4 needsProtectedDataState];
        char v11 = [v9 isMemberOfClass:objc_opt_class()];

        if (v11) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    v12 = [(HKSPStateMachineState *)self stateMachine];
    v13 = [v12 delegate];
    [v13 startObservingProtectedHealthDataAvailability];

LABEL_8:
    [(HDSPWakeUpResultsNotificationQueryingState *)self _executeQuery];
  }
}

- (void)didExit
{
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v12 = [v3 currentContext];

  if ([v12 hasStateTransitionOrInitializing])
  {
    v4 = [(HKSPStateMachineState *)self stateMachine];
    uint64_t v5 = [v12 nextState];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [v4 needsProtectedDataState];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [v12 nextState];
        v10 = [v4 needsProtectedDataState];
        char v11 = [v9 isMemberOfClass:objc_opt_class()];

        if (v11) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    [v4 stopObservingProtectedHealthDataAvailability];
LABEL_8:
  }
}

- (void)queryDidFailWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received query failed with error %{public}@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_msgSend(v4, "hksp_isHealthDatabaseInaccessibleError"))
  {
    [(HDSPWakeUpResultsNotificationQueryingState *)self _retryQueryIfNeededOrTransitionToNeedsProtectedDataState];
  }
  else if (objc_msgSend(v4, "hdsp_isInsufficientSleepDataError"))
  {
    [(HDSPWakeUpResultsNotificationQueryingState *)self _transitionToRetryState];
  }
  else
  {
    [(HDSPWakeUpResultsNotificationQueryingState *)self _transitionToWaitingForWakeUpState];
  }
}

- (void)queryDidComplete
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received query completion event", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPWakeUpResultsNotificationQueryingState *)self _transitionToNotifiedState];
}

- (void)protectedHealthDataDidBecomeAvailable
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received protected heath data available event", (uint8_t *)&v5, 0xCu);
  }
  self->_shouldRetryImmediatelyOnFailure = 1;
}

- (void)_executeQuery
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing query", (uint8_t *)&v6, 0xCu);
  }
  self->_shouldRetryImmediatelyOnFailure = 0;
  int v5 = [(HKSPStateMachineState *)self stateMachine];
  [v5 executeQuery];
}

- (void)_retryQueryIfNeededOrTransitionToNeedsProtectedDataState
{
  if (self->_shouldRetryImmediatelyOnFailure)
  {
    [(HDSPWakeUpResultsNotificationQueryingState *)self _executeQuery];
  }
  else
  {
    id v5 = [(HKSPStateMachineState *)self stateMachine];
    v3 = [(HKSPStateMachineState *)self stateMachine];
    id v4 = [v3 needsProtectedDataState];
    [v5 enterState:v4];
  }
}

- (void)_transitionToWaitingForWakeUpState
{
  id v5 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 waitingForWakeUpState];
  [v5 enterState:v4];
}

- (void)_transitionToNotifiedState
{
  id v5 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 notifiedState];
  [v5 enterState:v4];
}

- (void)_transitionToRetryState
{
  id v5 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 waitingForRetryState];
  [v5 enterState:v4];
}

@end