@interface HDSPChargingReminderStateMachine
- (BOOL)isCharging;
- (BOOL)sleepFeaturesEnabled;
- (HDSPChargingReminderDisabledState)disabledState;
- (HDSPChargingReminderMonitoringState)monitoringState;
- (HDSPChargingReminderNotifiedState)notifiedState;
- (HDSPChargingReminderStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HDSPChargingReminderWaitingState)waitingState;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (id)allStates;
- (id)monitoringWindowAfterDate:(id)a3;
- (unint64_t)loggingCategory;
- (unint64_t)sleepScheduleState;
- (void)batteryLevelChanged:(float)a3;
- (void)postChargingReminderNotification;
- (void)startBatteryMonitoring;
- (void)stopBatteryMonitoring;
@end

@implementation HDSPChargingReminderStateMachine

- (HDSPChargingReminderStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
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
  v33.super_class = (Class)HDSPChargingReminderStateMachine;
  v20 = [(HKSPPersistentStateMachine *)&v33 initWithIdentifier:v17 allowedStates:v19 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  if (v20)
  {
    v21 = [(HKSPPersistentStateMachineState *)[HDSPChargingReminderMonitoringState alloc] initWithStateMachine:v20];
    monitoringState = v20->_monitoringState;
    v20->_monitoringState = v21;

    v23 = [(HKSPPersistentStateMachineState *)[HDSPChargingReminderWaitingState alloc] initWithStateMachine:v20];
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = [(HKSPPersistentStateMachineState *)[HDSPChargingReminderDisabledState alloc] initWithStateMachine:v20];
    disabledState = v20->_disabledState;
    v20->_disabledState = v25;

    v27 = [(HKSPPersistentStateMachineState *)[HDSPChargingReminderNotifiedState alloc] initWithStateMachine:v20];
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v27;

    v29 = [(HKSPPersistentStateMachine *)v20 persistedState];
    v30 = v29;
    if (!v29) {
      v30 = v20->_disabledState;
    }
    [(HKSPStateMachine *)v20 setInitialState:v30];

    v31 = v20;
  }

  return v20;
}

- (id)allStates
{
  v6[4] = *MEMORY[0x263EF8340];
  waitingState = self->_waitingState;
  v6[0] = self->_monitoringState;
  v6[1] = waitingState;
  notifiedState = self->_notifiedState;
  v6[2] = self->_disabledState;
  v6[3] = notifiedState;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)batteryLevelChanged:(float)a3
{
  id v5 = [(HKSPStateMachine *)self currentState];
  *(float *)&double v4 = a3;
  [v5 batteryLevelChanged:v4];
}

- (void)postChargingReminderNotification
{
}

uint64_t __68__HDSPChargingReminderStateMachine_postChargingReminderNotification__block_invoke(uint64_t a1, void *a2)
{
  return [a2 postChargingReminderNotification];
}

- (void)startBatteryMonitoring
{
}

uint64_t __58__HDSPChargingReminderStateMachine_startBatteryMonitoring__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startBatteryMonitoring];
}

- (void)stopBatteryMonitoring
{
}

uint64_t __57__HDSPChargingReminderStateMachine_stopBatteryMonitoring__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopBatteryMonitoring];
}

- (NSDate)currentDate
{
  v2 = [(HKSPStateMachine *)self infoProvider];
  v3 = [v2 currentDate];

  return (NSDate *)v3;
}

- (BOOL)sleepFeaturesEnabled
{
  v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepFeaturesEnabled];

  return v3;
}

- (id)monitoringWindowAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self infoProvider];
  v6 = [v5 monitoringWindowAfterDate:v4];

  return v6;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v3;
}

- (unint64_t)sleepScheduleState
{
  v2 = [(HKSPStateMachine *)self infoProvider];
  unint64_t v3 = [v2 sleepScheduleState];

  return v3;
}

- (BOOL)isCharging
{
  v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isCharging];

  return v3;
}

- (HDSPChargingReminderDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPChargingReminderWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPChargingReminderMonitoringState)monitoringState
{
  return self->_monitoringState;
}

- (HDSPChargingReminderNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_monitoringState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);

  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end