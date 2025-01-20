@interface HDSPSleepScheduleStateCoordinatorStateMachine
- (BOOL)isAppleWatch;
- (BOOL)sleepFeaturesEnabled;
- (HDSPSleepScheduleStateCoordinatorBedtimeState)bedtimeState;
- (HDSPSleepScheduleStateCoordinatorDelayedWakeUpState)delayedWakeUpState;
- (HDSPSleepScheduleStateCoordinatorDisabledState)disabledState;
- (HDSPSleepScheduleStateCoordinatorInitialState)initialState;
- (HDSPSleepScheduleStateCoordinatorStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPSleepScheduleStateCoordinatorWakeUpState)wakeUpState;
- (HDSPSleepScheduleStateCoordinatorWindDownState)windDownState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (HKSPSleepScheduleOccurrence)previousOccurrence;
- (NSDate)currentDate;
- (unint64_t)loggingCategory;
- (void)alarmDismissed;
- (void)bedtimeReached;
- (void)scheduleModelChanged:(id)a3;
- (void)significantTimeChange;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5;
- (void)snoozeFireDateShouldBeReset;
- (void)timeZoneChange;
- (void)wakeTimeReached;
- (void)wakeUpConfirmed:(BOOL)a3;
- (void)windDownReached;
@end

@implementation HDSPSleepScheduleStateCoordinatorStateMachine

- (HDSPSleepScheduleStateCoordinatorStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v38[6] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v38[3] = objc_opt_class();
  v38[4] = objc_opt_class();
  v38[5] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:6];
  v19 = [v12 setWithArray:v18];

  v37.receiver = self;
  v37.super_class = (Class)HDSPSleepScheduleStateCoordinatorStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v37 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorWakeUpState alloc] initWithStateMachine:v20];
    wakeUpState = v20->_wakeUpState;
    v20->_wakeUpState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorBedtimeState alloc] initWithStateMachine:v20];
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorWindDownState alloc] initWithStateMachine:v20];
    windDownState = v20->_windDownState;
    v20->_windDownState = v27;

    v29 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorDelayedWakeUpState alloc] initWithStateMachine:v20];
    delayedWakeUpState = v20->_delayedWakeUpState;
    v20->_delayedWakeUpState = v29;

    v31 = [(HKSPPersistentStateMachineState *)[HDSPSleepScheduleStateCoordinatorInitialState alloc] initWithStateMachine:v20];
    initialState = v20->_initialState;
    v20->_initialState = v31;

    v33 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v34 = v33;
    if (!v33) {
      v34 = v20->_initialState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v34];

    v35 = v20;
  }

  return v20;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)windDownReached
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 windDownReached];
}

- (void)bedtimeReached
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 bedtimeReached];
}

- (void)wakeTimeReached
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 wakeTimeReached];
}

- (void)wakeUpConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 wakeUpConfirmed:v3];
}

- (void)alarmDismissed
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 alarmDismissed];
}

- (void)significantTimeChange
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 significantTimeChange];
}

- (void)timeZoneChange
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 timeZoneChange];
}

- (void)scheduleModelChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self currentState];
  [v5 scheduleModelChanged:v4];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __99__HDSPSleepScheduleStateCoordinatorStateMachine_sleepScheduleStateDidChange_previousState_context___block_invoke;
  v10[3] = &unk_2645DAE58;
  unint64_t v12 = a3;
  unint64_t v13 = a4;
  id v11 = v8;
  id v9 = v8;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v10];
}

uint64_t __99__HDSPSleepScheduleStateCoordinatorStateMachine_sleepScheduleStateDidChange_previousState_context___block_invoke(void *a1, void *a2)
{
  return [a2 sleepScheduleStateDidChange:a1[5] previousState:a1[6] context:a1[4]];
}

- (void)snoozeFireDateShouldBeReset
{
}

uint64_t __76__HDSPSleepScheduleStateCoordinatorStateMachine_snoozeFireDateShouldBeReset__block_invoke(uint64_t a1, void *a2)
{
  return [a2 snoozeFireDateShouldBeReset];
}

- (BOOL)isAppleWatch
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isAppleWatch];

  return v3;
}

- (BOOL)sleepFeaturesEnabled
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepFeaturesEnabled];

  return v3;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v3;
}

- (HKSPSleepScheduleOccurrence)previousOccurrence
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 previousOccurrence];

  return (HKSPSleepScheduleOccurrence *)v3;
}

- (NSDate)currentDate
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 currentDate];

  return (NSDate *)v3;
}

- (HDSPSleepScheduleStateCoordinatorDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPSleepScheduleStateCoordinatorWakeUpState)wakeUpState
{
  return self->_wakeUpState;
}

- (HDSPSleepScheduleStateCoordinatorBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepScheduleStateCoordinatorWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepScheduleStateCoordinatorDelayedWakeUpState)delayedWakeUpState
{
  return self->_delayedWakeUpState;
}

- (HDSPSleepScheduleStateCoordinatorInitialState)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_delayedWakeUpState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_wakeUpState, 0);

  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end