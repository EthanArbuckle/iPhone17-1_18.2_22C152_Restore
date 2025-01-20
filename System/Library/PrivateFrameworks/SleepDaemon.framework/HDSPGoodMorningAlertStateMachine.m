@interface HDSPGoodMorningAlertStateMachine
- (BOOL)goodMorningAlertEnabled;
- (BOOL)isAppleWatch;
- (BOOL)isOnCharger;
- (HDSPGoodMorningAlertDisabledState)disabledState;
- (HDSPGoodMorningAlertPresentingState)presentingState;
- (HDSPGoodMorningAlertStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPGoodMorningAlertWaitingState)waitingState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (id)allStates;
- (unint64_t)loggingCategory;
- (unint64_t)sleepScheduleState;
- (void)dismissAlertForGoodMorning;
- (void)presentAlertForGoodMorning;
- (void)sleepScheduleStateChangedToBedtime;
- (void)sleepScheduleStateChangedToWakeUp;
@end

@implementation HDSPGoodMorningAlertStateMachine

- (HDSPGoodMorningAlertStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v32[3] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v19 = [v12 setWithArray:v18];

  v31.receiver = self;
  v31.super_class = (Class)HDSPGoodMorningAlertStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v31 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPGoodMorningAlertDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPGoodMorningAlertWaitingState alloc] initWithStateMachine:v20];
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPGoodMorningAlertPresentingState alloc] initWithStateMachine:v20];
    presentingState = v20->_presentingState;
    v20->_presentingState = v25;

    v27 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v28 = v27;
    if (!v27) {
      v28 = v20->_disabledState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v28];

    v29 = v20;
  }

  return v20;
}

- (id)allStates
{
  v5[3] = *MEMORY[0x263EF8340];
  waitingState = self->_waitingState;
  v5[0] = self->_disabledState;
  v5[1] = waitingState;
  v5[2] = self->_presentingState;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];

  return v3;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)sleepScheduleStateChangedToBedtime
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 sleepScheduleStateChangedToBedtime];
}

- (void)sleepScheduleStateChangedToWakeUp
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 sleepScheduleStateChangedToWakeUp];
}

- (void)presentAlertForGoodMorning
{
}

uint64_t __62__HDSPGoodMorningAlertStateMachine_presentAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentAlertForGoodMorning];
}

- (void)dismissAlertForGoodMorning
{
}

uint64_t __62__HDSPGoodMorningAlertStateMachine_dismissAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dismissAlertForGoodMorning];
}

- (NSDate)currentDate
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 currentDate];

  return (NSDate *)v3;
}

- (BOOL)goodMorningAlertEnabled
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 goodMorningAlertEnabled];

  return v3;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepScheduleModel];

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

- (BOOL)isOnCharger
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isOnCharger];

  return v3;
}

- (HDSPGoodMorningAlertDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPGoodMorningAlertWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPGoodMorningAlertPresentingState)presentingState
{
  return self->_presentingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);

  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end