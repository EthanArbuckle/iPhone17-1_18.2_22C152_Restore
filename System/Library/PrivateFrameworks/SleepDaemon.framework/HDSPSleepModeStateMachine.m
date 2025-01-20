@interface HDSPSleepModeStateMachine
- (BOOL)hasSleepFocusMode;
- (BOOL)isAppleWatch;
- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3;
- (BOOL)sleepFeaturesEnabled;
- (HDSPSleepModeAutomatedOffState)automatedOffState;
- (HDSPSleepModeAutomatedOnState)automatedOnState;
- (HDSPSleepModeBedtimeState)bedtimeState;
- (HDSPSleepModeManualOffState)manualOffState;
- (HDSPSleepModeManualOnState)manualOnState;
- (HDSPSleepModeOffState)offState;
- (HDSPSleepModeStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPSleepModeWindDownState)windDownState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (unint64_t)loggingCategory;
- (unint64_t)sleepScheduleState;
- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepModeTurnedOffForUnknownReason;
- (void)sleepModeTurnedOnForUnknownReason;
- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToDisabled;
- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3;
@end

@implementation HDSPSleepModeStateMachine

- (HDSPSleepModeStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
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
  v39.super_class = (Class)HDSPSleepModeStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v39 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeOffState alloc] initWithStateMachine:v20];
    offState = v20->_offState;
    v20->_offState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeWindDownState alloc] initWithStateMachine:v20];
    windDownState = v20->_windDownState;
    v20->_windDownState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeManualOffState alloc] initWithStateMachine:v20];
    manualOffState = v20->_manualOffState;
    v20->_manualOffState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeBedtimeState alloc] initWithStateMachine:v20];
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v27;

    v29 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeManualOnState alloc] initWithStateMachine:v20];
    manualOnState = v20->_manualOnState;
    v20->_manualOnState = v29;

    v31 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeAutomatedOnState alloc] initWithStateMachine:v20];
    automatedOnState = v20->_automatedOnState;
    v20->_automatedOnState = v31;

    v33 = [(HKSPPersistentStateMachineState *)[HDSPSleepModeAutomatedOffState alloc] initWithStateMachine:v20];
    automatedOffState = v20->_automatedOffState;
    v20->_automatedOffState = v33;

    v35 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v36 = v35;
    if (!v35) {
      v36 = v20->_offState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v36];

    v37 = v20;
  }

  return v20;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6 = [(HKSPStateMachine *)self currentState];
  [v6 sleepScheduleStateChangedToWindDown:a3 fromState:a4];
}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6 = [(HKSPStateMachine *)self currentState];
  [v6 sleepScheduleStateChangedToBedtime:a3 fromState:a4];
}

- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6 = [(HKSPStateMachine *)self currentState];
  [v6 sleepScheduleStateChangedToWakeUp:a3 fromState:a4];
}

- (void)sleepScheduleStateChangedToDisabled
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 sleepScheduleStateChangedToDisabled];
}

- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 userTurnedOffSleepModeWithReason:a3];
}

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 userTurnedOnSleepModeWithReason:a3];
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 automationTurnedOnSleepModeWithReason:a3];
}

- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 automationTurnedOffSleepModeWithReason:a3];
}

- (void)sleepModeTurnedOnForUnknownReason
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 sleepModeTurnedOnForUnknownReason];
}

- (void)sleepModeTurnedOffForUnknownReason
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 sleepModeTurnedOffForUnknownReason];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__HDSPSleepModeStateMachine_sleepModeDidChange_previousMode_reason___block_invoke;
  v5[3] = &__block_descriptor_56_e45_v16__0___HDSPSleepModeStateMachineDelegate__8l;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v5];
}

uint64_t __68__HDSPSleepModeStateMachine_sleepModeDidChange_previousMode_reason___block_invoke(void *a1, void *a2)
{
  return [a2 sleepModeDidChange:a1[4] previousMode:a1[5] reason:a1[6]];
}

- (NSDate)currentDate
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 currentDate];

  return (NSDate *)v3;
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

- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self infoProvider];
  LOBYTE(a3) = [v4 shouldGoIntoSleepModeDuringState:a3];

  return a3;
}

- (BOOL)hasSleepFocusMode
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 hasSleepFocusMode];

  return v3;
}

- (HDSPSleepModeOffState)offState
{
  return self->_offState;
}

- (HDSPSleepModeWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepModeManualOffState)manualOffState
{
  return self->_manualOffState;
}

- (HDSPSleepModeBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepModeManualOnState)manualOnState
{
  return self->_manualOnState;
}

- (HDSPSleepModeAutomatedOnState)automatedOnState
{
  return self->_automatedOnState;
}

- (HDSPSleepModeAutomatedOffState)automatedOffState
{
  return self->_automatedOffState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automatedOffState, 0);
  objc_storeStrong((id *)&self->_automatedOnState, 0);
  objc_storeStrong((id *)&self->_manualOnState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_manualOffState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);

  objc_storeStrong((id *)&self->_offState, 0);
}

@end