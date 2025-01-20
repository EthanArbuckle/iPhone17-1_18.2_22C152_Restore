@interface HDSPSleepLockScreenStateMachine
- (BOOL)inUnscheduledSleepMode;
- (BOOL)isLockScreenActive;
- (HDSPSleepLockScreenBedtimeState)bedtimeState;
- (HDSPSleepLockScreenGreetingState)greetingState;
- (HDSPSleepLockScreenOffState)offState;
- (HDSPSleepLockScreenStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPSleepLockScreenWindDownState)windDownState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (id)allStates;
- (int64_t)sleepMode;
- (unint64_t)loggingCategory;
- (void)dismissAlertForGoodMorning;
- (void)presentAlertForGoodMorning;
- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4;
- (void)sleepModeDidChange:(int64_t)a3 reason:(unint64_t)a4;
@end

@implementation HDSPSleepLockScreenStateMachine

- (HDSPSleepLockScreenStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v34[4] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v19 = [v12 setWithArray:v18];

  v33.receiver = self;
  v33.super_class = (Class)HDSPSleepLockScreenStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v33 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPSleepLockScreenOffState alloc] initWithStateMachine:v20];
    offState = v20->_offState;
    v20->_offState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPSleepLockScreenWindDownState alloc] initWithStateMachine:v20];
    windDownState = v20->_windDownState;
    v20->_windDownState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPSleepLockScreenBedtimeState alloc] initWithStateMachine:v20];
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPSleepLockScreenGreetingState alloc] initWithStateMachine:v20];
    greetingState = v20->_greetingState;
    v20->_greetingState = v27;

    v29 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v30 = v29;
    if (!v29) {
      v30 = v20->_offState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v30];

    v31 = v20;
  }

  return v20;
}

- (id)allStates
{
  v6[4] = *MEMORY[0x263EF8340];
  windDownState = self->_windDownState;
  v6[0] = self->_offState;
  v6[1] = windDownState;
  greetingState = self->_greetingState;
  v6[2] = self->_bedtimeState;
  v6[3] = greetingState;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)presentAlertForGoodMorning
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 presentAlertForGoodMorning];
}

- (void)dismissAlertForGoodMorning
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 dismissAlertForGoodMorning];
}

- (void)sleepModeDidChange:(int64_t)a3 reason:(unint64_t)a4
{
  id v6 = [(HKSPStateMachine *)self currentState];
  [v6 sleepModeDidChange:a3 reason:a4];
}

- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__HDSPSleepLockScreenStateMachine_sleepLockScreenStateDidChange_previousState___block_invoke;
  v4[3] = &__block_descriptor_48_e51_v16__0___HDSPSleepLockScreenStateMachineDelegate__8l;
  v4[4] = a3;
  v4[5] = a4;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v4];
}

uint64_t __79__HDSPSleepLockScreenStateMachine_sleepLockScreenStateDidChange_previousState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepLockScreenStateDidChange:*(void *)(a1 + 32) previousState:*(void *)(a1 + 40)];
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

- (int64_t)sleepMode
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  int64_t v3 = [v2 sleepMode];

  return v3;
}

- (BOOL)inUnscheduledSleepMode
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 inUnscheduledSleepMode];

  return v3;
}

- (BOOL)isLockScreenActive
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isLockScreenActive];

  return v3;
}

- (HDSPSleepLockScreenOffState)offState
{
  return self->_offState;
}

- (HDSPSleepLockScreenWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepLockScreenBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepLockScreenGreetingState)greetingState
{
  return self->_greetingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greetingState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);

  objc_storeStrong((id *)&self->_offState, 0);
}

@end