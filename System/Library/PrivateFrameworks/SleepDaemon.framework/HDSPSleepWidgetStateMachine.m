@interface HDSPSleepWidgetStateMachine
- (BOOL)inUnscheduledSleepMode;
- (BOOL)isOnboarded;
- (HDSPSleepWidgetBedtimeInProgressState)bedtimeInProgressState;
- (HDSPSleepWidgetBedtimeState)bedtimeState;
- (HDSPSleepWidgetDisabledState)disabledState;
- (HDSPSleepWidgetGreetingState)greetingState;
- (HDSPSleepWidgetNotOnboardedState)notOnboardedState;
- (HDSPSleepWidgetStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPSleepWidgetUpcomingState)upcomingState;
- (HDSPSleepWidgetWaitingState)waitingState;
- (HDSPSleepWidgetWindDownState)windDownState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (id)allStates;
- (unint64_t)loggingCategory;
- (unint64_t)sleepScheduleState;
- (void)significantTimeChangeOccurred;
- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4;
- (void)sleepScheduleModelDidChange:(id)a3;
- (void)sleepScheduleStateDidChange:(unint64_t)a3;
- (void)sleepWidgetShouldReload;
- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4;
@end

@implementation HDSPSleepWidgetStateMachine

- (HDSPSleepWidgetStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  v42[8] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  v42[2] = objc_opt_class();
  v42[3] = objc_opt_class();
  v42[4] = objc_opt_class();
  v42[5] = objc_opt_class();
  v42[6] = objc_opt_class();
  v42[7] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:8];
  v19 = [v12 setWithArray:v18];

  v41.receiver = self;
  v41.super_class = (Class)HDSPSleepWidgetStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v41 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetWaitingState alloc] initWithStateMachine:v20];
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetUpcomingState alloc] initWithStateMachine:v20];
    upcomingState = v20->_upcomingState;
    v20->_upcomingState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetWindDownState alloc] initWithStateMachine:v20];
    windDownState = v20->_windDownState;
    v20->_windDownState = v27;

    v29 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetBedtimeState alloc] initWithStateMachine:v20];
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v29;

    v31 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetBedtimeInProgressState alloc] initWithStateMachine:v20];
    bedtimeInProgressState = v20->_bedtimeInProgressState;
    v20->_bedtimeInProgressState = v31;

    v33 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetGreetingState alloc] initWithStateMachine:v20];
    greetingState = v20->_greetingState;
    v20->_greetingState = v33;

    v35 = [(HKSPPersistentStateMachineState *)[HDSPSleepWidgetNotOnboardedState alloc] initWithStateMachine:v20];
    notOnboardedState = v20->_notOnboardedState;
    v20->_notOnboardedState = v35;

    v37 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v38 = v37;
    if (!v37) {
      v38 = v20->_disabledState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v38];

    v39 = v20;
  }

  return v20;
}

- (id)allStates
{
  v8[8] = *MEMORY[0x263EF8340];
  waitingState = self->_waitingState;
  v8[0] = self->_disabledState;
  v8[1] = waitingState;
  windDownState = self->_windDownState;
  v8[2] = self->_upcomingState;
  v8[3] = windDownState;
  bedtimeInProgressState = self->_bedtimeInProgressState;
  v8[4] = self->_bedtimeState;
  v8[5] = bedtimeInProgressState;
  notOnboardedState = self->_notOnboardedState;
  v8[6] = self->_greetingState;
  v8[7] = notOnboardedState;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];

  return v6;
}

- (unint64_t)loggingCategory
{
  return 18;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(HKSPStateMachine *)self currentState];
  [v6 sleepModeDidChange:a3 isUserRequested:v4];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  id v4 = [(HKSPStateMachine *)self currentState];
  [v4 sleepScheduleStateDidChange:a3];
}

- (void)sleepScheduleModelDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self currentState];
  [v5 sleepScheduleModelDidChange:v4];
}

- (void)significantTimeChangeOccurred
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 significantTimeChangeOccurred];
}

- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__HDSPSleepWidgetStateMachine_sleepWidgetStateDidChange_previousState___block_invoke;
  v4[3] = &__block_descriptor_48_e47_v16__0___HDSPSleepWidgetStateMachineDelegate__8l;
  v4[4] = a3;
  v4[5] = a4;
  [(HKSPStateMachine *)self notifyDelegateWithBlock:v4];
}

uint64_t __71__HDSPSleepWidgetStateMachine_sleepWidgetStateDidChange_previousState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepWidgetStateDidChange:*(void *)(a1 + 32) previousState:*(void *)(a1 + 40)];
}

- (void)sleepWidgetShouldReload
{
}

uint64_t __54__HDSPSleepWidgetStateMachine_sleepWidgetShouldReload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepWidgetShouldReload];
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

- (BOOL)inUnscheduledSleepMode
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 inUnscheduledSleepMode];

  return v3;
}

- (BOOL)isOnboarded
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isOnboarded];

  return v3;
}

- (HDSPSleepWidgetDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPSleepWidgetWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPSleepWidgetUpcomingState)upcomingState
{
  return self->_upcomingState;
}

- (HDSPSleepWidgetWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepWidgetBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepWidgetBedtimeInProgressState)bedtimeInProgressState
{
  return self->_bedtimeInProgressState;
}

- (HDSPSleepWidgetGreetingState)greetingState
{
  return self->_greetingState;
}

- (HDSPSleepWidgetNotOnboardedState)notOnboardedState
{
  return self->_notOnboardedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notOnboardedState, 0);
  objc_storeStrong((id *)&self->_greetingState, 0);
  objc_storeStrong((id *)&self->_bedtimeInProgressState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_upcomingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);

  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end