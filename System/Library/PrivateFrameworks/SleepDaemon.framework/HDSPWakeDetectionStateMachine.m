@interface HDSPWakeDetectionStateMachine
- (BOOL)isWatch;
- (BOOL)sleepModeIsOff;
- (HDSPWakeDetectionActivityDetectingState)activityDetectingState;
- (HDSPWakeDetectionDisabledState)disabledState;
- (HDSPWakeDetectionExplicitDetectingState)explicitDetectingState;
- (HDSPWakeDetectionNotifiedState)notifiedState;
- (HDSPWakeDetectionStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPWakeDetectionWaitingState)waitingState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (HKSPSleepScheduleOccurrence)relevantOccurrence;
- (NSDate)currentDate;
- (NSDate)nextWakeUp;
- (NSDate)upcomingStartDetection;
- (id)allStates;
- (id)detectionWindowForType:(unint64_t)a3;
- (unint64_t)activeTypes;
- (unint64_t)loggingCategory;
- (unint64_t)sleepScheduleState;
- (void)earlyWakeUpWasNotifiedRemotely;
- (void)postWakeDetectionNotification:(unint64_t)a3;
- (void)startWakeDetection:(unint64_t)a3;
- (void)stopWakeDetection;
- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4;
@end

@implementation HDSPWakeDetectionStateMachine

- (HDSPWakeDetectionStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v36[5] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v36[3] = objc_opt_class();
  v36[4] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];
  v19 = [v12 setWithArray:v18];

  v35.receiver = self;
  v35.super_class = (Class)HDSPWakeDetectionStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v35 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPWakeDetectionDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPWakeDetectionWaitingState alloc] initWithStateMachine:v20];
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPWakeDetectionExplicitDetectingState alloc] initWithStateMachine:v20];
    explicitDetectingState = v20->_explicitDetectingState;
    v20->_explicitDetectingState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPWakeDetectionActivityDetectingState alloc] initWithStateMachine:v20];
    activityDetectingState = v20->_activityDetectingState;
    v20->_activityDetectingState = v27;

    v29 = [(HKSPPersistentStateMachineState *)[HDSPWakeDetectionNotifiedState alloc] initWithStateMachine:v20];
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v29;

    v31 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v32 = v31;
    if (!v31) {
      v32 = v20->_disabledState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v32];

    v33 = v20;
  }

  return v20;
}

- (id)allStates
{
  v6[5] = *MEMORY[0x263EF8340];
  waitingState = self->_waitingState;
  v6[0] = self->_disabledState;
  v6[1] = waitingState;
  activityDetectingState = self->_activityDetectingState;
  v6[2] = self->_explicitDetectingState;
  v6[3] = activityDetectingState;
  v6[4] = self->_notifiedState;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];

  return v4;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSPStateMachine *)self currentState];
  [v7 wakeupEventDetected:a3 date:v6];
}

- (void)earlyWakeUpWasNotifiedRemotely
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 earlyWakeUpWasNotifiedRemotely];
}

- (void)startWakeDetection:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__HDSPWakeDetectionStateMachine_startWakeDetection___block_invoke;
  v3[3] = &__block_descriptor_40_e49_v16__0___HDSPWakeDetectionStateMachineDelegate__8l;
  v3[4] = a3;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v3];
}

uint64_t __52__HDSPWakeDetectionStateMachine_startWakeDetection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startWakeDetection:*(void *)(a1 + 32)];
}

- (void)stopWakeDetection
{
}

uint64_t __50__HDSPWakeDetectionStateMachine_stopWakeDetection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopWakeDetection];
}

- (void)postWakeDetectionNotification:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__HDSPWakeDetectionStateMachine_postWakeDetectionNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e49_v16__0___HDSPWakeDetectionStateMachineDelegate__8l;
  v3[4] = a3;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v3];
}

uint64_t __63__HDSPWakeDetectionStateMachine_postWakeDetectionNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 postWakeDetectionNotification:*(void *)(a1 + 32)];
}

- (NSDate)currentDate
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 currentDate];

  return (NSDate *)v3;
}

- (HKSPSleepScheduleOccurrence)relevantOccurrence
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 relevantOccurrence];

  return (HKSPSleepScheduleOccurrence *)v3;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v3;
}

- (unint64_t)sleepScheduleState
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  unint64_t v3 = [v2 sleepScheduleState];

  return v3;
}

- (BOOL)sleepModeIsOff
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepModeIsOff];

  return v3;
}

- (BOOL)isWatch
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isWatch];

  return v3;
}

- (unint64_t)activeTypes
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  unint64_t v3 = [v2 activeTypes];

  return v3;
}

- (NSDate)nextWakeUp
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  unint64_t v3 = [v2 nextWakeUp];

  return (NSDate *)v3;
}

- (NSDate)upcomingStartDetection
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  unint64_t v3 = [v2 upcomingStartDetection];

  return (NSDate *)v3;
}

- (id)detectionWindowForType:(unint64_t)a3
{
  v4 = [(HKSPStateMachine *)self infoProvider];
  v5 = [v4 detectionWindowForType:a3];

  return v5;
}

- (HDSPWakeDetectionDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPWakeDetectionWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPWakeDetectionExplicitDetectingState)explicitDetectingState
{
  return self->_explicitDetectingState;
}

- (HDSPWakeDetectionActivityDetectingState)activityDetectingState
{
  return self->_activityDetectingState;
}

- (HDSPWakeDetectionNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_activityDetectingState, 0);
  objc_storeStrong((id *)&self->_explicitDetectingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);

  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end