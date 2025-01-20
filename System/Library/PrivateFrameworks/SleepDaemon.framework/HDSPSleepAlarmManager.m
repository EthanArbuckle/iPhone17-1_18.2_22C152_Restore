@interface HDSPSleepAlarmManager
- (HDSPEnvironment)environment;
- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3;
- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3 sleepAlarmProvider:(id)a4;
- (HDSPSleepAlarmProvider)sleepAlarmProvider;
- (NSString)sourceIdentifier;
- (id)currentSleepAlarms;
- (void)environmentWillBecomeReady:(id)a3;
- (void)resetSleepAlarmSnoozeState;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
@end

@implementation HDSPSleepAlarmManager

- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HDSPMobileTimerBridge);
  v6 = [(HDSPSleepAlarmManager *)self initWithEnvironment:v4 sleepAlarmProvider:v5];

  return v6;
}

- (HDSPSleepAlarmManager)initWithEnvironment:(id)a3 sleepAlarmProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepAlarmManager;
  v8 = [(HDSPSleepAlarmManager *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_sleepAlarmProvider, a4);
    v10 = v9;
  }

  return v9;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = [a3 sleepScheduleModelManager];
  [v4 addObserver:self];
}

- (id)currentSleepAlarms
{
  return (id)[(HDSPSleepAlarmProvider *)self->_sleepAlarmProvider sleepAlarmsFutureIgnoringCache:1];
}

- (void)resetSleepAlarmSnoozeState
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] reset sleep alarm snooze state", (uint8_t *)&v4, 0xCu);
  }

  [(HDSPSleepAlarmProvider *)self->_sleepAlarmProvider resetSleepAlarmSnoozeState];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating sleep alarms for model change", (uint8_t *)&v6, 0xCu);
  }

  [(HDSPSleepAlarmProvider *)self->_sleepAlarmProvider updateSleepAlarms];
}

- (NSString)sourceIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSleepAlarmProvider)sleepAlarmProvider
{
  return self->_sleepAlarmProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmProvider, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end