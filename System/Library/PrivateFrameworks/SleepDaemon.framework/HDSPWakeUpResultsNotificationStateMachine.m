@interface HDSPWakeUpResultsNotificationStateMachine
- (BOOL)isDelayingForTracking;
- (BOOL)isWaitingForWakeUp;
- (HDSPWakeUpResultsNotificationDelayingForTrackingState)delayingForTrackingState;
- (HDSPWakeUpResultsNotificationDisabledState)disabledState;
- (HDSPWakeUpResultsNotificationNeedsProtectedDataState)needsProtectedDataState;
- (HDSPWakeUpResultsNotificationNotifiedState)notifiedState;
- (HDSPWakeUpResultsNotificationQueryingState)queryingState;
- (HDSPWakeUpResultsNotificationStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPWakeUpResultsNotificationWaitingForRetryState)waitingForRetryState;
- (HDSPWakeUpResultsNotificationWaitingForWakeUpState)waitingForWakeUpState;
- (id)allStates;
- (unint64_t)loggingCategory;
- (void)didPostResultsNotification;
- (void)executeQuery;
- (void)postResultsNotification;
- (void)protectedHealthDataDidBecomeAvailable;
- (void)queryDidComplete;
- (void)queryDidFailWithError:(id)a3;
- (void)retryAttemptEventDue;
- (void)scheduleRetryAttempt;
- (void)startObservingProtectedHealthDataAvailability;
- (void)stopObservingProtectedHealthDataAvailability;
- (void)unscheduleRetryAttempt;
- (void)wakeUpDidOccur;
@end

@implementation HDSPWakeUpResultsNotificationStateMachine

- (HDSPWakeUpResultsNotificationStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v40[7] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v40[2] = objc_opt_class();
  v40[3] = objc_opt_class();
  v40[4] = objc_opt_class();
  v40[5] = objc_opt_class();
  v40[6] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:7];
  v19 = [v12 setWithArray:v18];

  v39.receiver = self;
  v39.super_class = (Class)HDSPWakeUpResultsNotificationStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v39 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationWaitingForWakeUpState alloc] initWithStateMachine:v20];
    waitingForWakeUpState = v20->_waitingForWakeUpState;
    v20->_waitingForWakeUpState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationDelayingForTrackingState alloc] initWithStateMachine:v20];
    delayingForTrackingState = v20->_delayingForTrackingState;
    v20->_delayingForTrackingState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationWaitingForRetryState alloc] initWithStateMachine:v20];
    waitingForRetryState = v20->_waitingForRetryState;
    v20->_waitingForRetryState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationQueryingState alloc] initWithStateMachine:v20];
    queryingState = v20->_queryingState;
    v20->_queryingState = v27;

    v29 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationNeedsProtectedDataState alloc] initWithStateMachine:v20];
    needsProtectedDataState = v20->_needsProtectedDataState;
    v20->_needsProtectedDataState = v29;

    v31 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationNotifiedState alloc] initWithStateMachine:v20];
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v31;

    v33 = [(HKSPPersistentStateMachineState *)[HDSPWakeUpResultsNotificationDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v33;

    v35 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v36 = v35;
    if (!v35) {
      v36 = v20->_disabledState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v36];

    v37 = v20;
  }

  return v20;
}

- (id)allStates
{
  v7[7] = *MEMORY[0x263EF8340];
  delayingForTrackingState = self->_delayingForTrackingState;
  v7[0] = self->_waitingForWakeUpState;
  v7[1] = delayingForTrackingState;
  queryingState = self->_queryingState;
  v7[2] = self->_waitingForRetryState;
  v7[3] = queryingState;
  notifiedState = self->_notifiedState;
  v7[4] = self->_needsProtectedDataState;
  v7[5] = notifiedState;
  v7[6] = self->_disabledState;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:7];

  return v5;
}

- (BOOL)isWaitingForWakeUp
{
  v3 = [(HKSPStateMachine *)self currentState];
  if (v3)
  {
    v4 = [(HDSPWakeUpResultsNotificationStateMachine *)self waitingForWakeUpState];
    if (v4)
    {
      v5 = [(HKSPStateMachine *)self currentState];
      v6 = [(HDSPWakeUpResultsNotificationStateMachine *)self waitingForWakeUpState];
      char v7 = [v5 isMemberOfClass:objc_opt_class()];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isDelayingForTracking
{
  v3 = [(HKSPStateMachine *)self currentState];
  if (v3)
  {
    v4 = [(HDSPWakeUpResultsNotificationStateMachine *)self delayingForTrackingState];
    if (v4)
    {
      v5 = [(HKSPStateMachine *)self currentState];
      v6 = [(HDSPWakeUpResultsNotificationStateMachine *)self delayingForTrackingState];
      char v7 = [v5 isMemberOfClass:objc_opt_class()];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)loggingCategory
{
  return 8;
}

- (void)protectedHealthDataDidBecomeAvailable
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 protectedHealthDataDidBecomeAvailable];
}

- (void)queryDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self currentState];
  [v5 queryDidFailWithError:v4];
}

- (void)queryDidComplete
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 queryDidComplete];
}

- (void)wakeUpDidOccur
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 wakeUpDidOccur];
}

- (void)didPostResultsNotification
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 didPostResultsNotification];
}

- (void)retryAttemptEventDue
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 retryAttemptEventDue];
}

- (void)executeQuery
{
}

uint64_t __57__HDSPWakeUpResultsNotificationStateMachine_executeQuery__block_invoke(uint64_t a1, void *a2)
{
  return [a2 executeQuery];
}

- (void)postResultsNotification
{
}

uint64_t __68__HDSPWakeUpResultsNotificationStateMachine_postResultsNotification__block_invoke(uint64_t a1, void *a2)
{
  return [a2 postResultsNotification];
}

- (void)scheduleRetryAttempt
{
}

uint64_t __65__HDSPWakeUpResultsNotificationStateMachine_scheduleRetryAttempt__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleRetryAttempt];
}

- (void)unscheduleRetryAttempt
{
}

uint64_t __67__HDSPWakeUpResultsNotificationStateMachine_unscheduleRetryAttempt__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unscheduleRetryAttempt];
}

- (void)startObservingProtectedHealthDataAvailability
{
}

uint64_t __90__HDSPWakeUpResultsNotificationStateMachine_startObservingProtectedHealthDataAvailability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startObservingProtectedHealthDataAvailability];
}

- (void)stopObservingProtectedHealthDataAvailability
{
}

uint64_t __89__HDSPWakeUpResultsNotificationStateMachine_stopObservingProtectedHealthDataAvailability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopObservingProtectedHealthDataAvailability];
}

- (HDSPWakeUpResultsNotificationWaitingForWakeUpState)waitingForWakeUpState
{
  return self->_waitingForWakeUpState;
}

- (HDSPWakeUpResultsNotificationDelayingForTrackingState)delayingForTrackingState
{
  return self->_delayingForTrackingState;
}

- (HDSPWakeUpResultsNotificationWaitingForRetryState)waitingForRetryState
{
  return self->_waitingForRetryState;
}

- (HDSPWakeUpResultsNotificationQueryingState)queryingState
{
  return self->_queryingState;
}

- (HDSPWakeUpResultsNotificationNeedsProtectedDataState)needsProtectedDataState
{
  return self->_needsProtectedDataState;
}

- (HDSPWakeUpResultsNotificationNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (HDSPWakeUpResultsNotificationDisabledState)disabledState
{
  return self->_disabledState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_needsProtectedDataState, 0);
  objc_storeStrong((id *)&self->_queryingState, 0);
  objc_storeStrong((id *)&self->_waitingForRetryState, 0);
  objc_storeStrong((id *)&self->_delayingForTrackingState, 0);

  objc_storeStrong((id *)&self->_waitingForWakeUpState, 0);
}

@end