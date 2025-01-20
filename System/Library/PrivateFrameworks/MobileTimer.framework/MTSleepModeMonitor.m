@interface MTSleepModeMonitor
- (BOOL)isEnabled;
- (BOOL)isSleepModeEnabled:(BOOL *)a3;
- (BOOL)isSleepModeEnabled:(BOOL *)a3 error:(id *)a4;
- (BOOL)isUserAsleep;
- (BOOL)sleepMode:(id *)a3;
- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4;
- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5;
- (DNDModeAssertionService)assertionService;
- (MTAlarm)sleepAlarm;
- (MTAlarmStorage)alarmStorage;
- (MTSleepCoordinator)sleepCoordinator;
- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4;
- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 currentDateProvider:(id)a5;
- (MTSleepModeStateMachine)stateMachine;
- (NAScheduler)serializer;
- (NSDate)currentDate;
- (NSDate)keepOffUntilDate;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (unint64_t)sleepModeTimeoutMinutes;
- (void)dealloc;
- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4;
- (void)printDiagnostics;
- (void)setAlarmStorage:(id)a3;
- (void)setAssertionService:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSleepCoordinator:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)sleepCoordinator:(id)a3 bedtimeReminderDidFire:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 bedtimeWasReached:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4;
- (void)sleepCoordinator:(id)a3 userWentToBed:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 userWokeUp:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 wakeUpAlarmDidFire:(id)a4 sleepAlarm:(id)a5;
- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasSnoozed:(id)a4 sleepAlarm:(id)a5;
- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4;
- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4;
- (void)stateMachineClearKeepSleepModeOff:(id)a3;
- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4;
- (void)updateMonitorState;
- (void)userDisengagedSleepMode;
- (void)userDisengagedSleepModeOnDate:(id)a3;
@end

@implementation MTSleepModeMonitor

- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = MTCurrentDateProvider();
  v9 = [(MTSleepModeMonitor *)self initWithAlarmStorage:v7 sleepCoordinator:v6 currentDateProvider:v8];

  return v9;
}

- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 currentDateProvider:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MTSleepModeMonitor;
  v12 = [(MTSleepModeMonitor *)&v26 init];
  if (v12)
  {
    v13 = MTLogForCategory(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v12->_alarmStorage, a3);
    objc_storeWeak((id *)&v12->_sleepCoordinator, v10);
    uint64_t v14 = [v11 copy];
    id currentDateProvider = v12->_currentDateProvider;
    v12->_id currentDateProvider = (id)v14;

    uint64_t v16 = +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v12, +[MTScheduler defaultPriority]);
    serializer = v12->_serializer;
    v12->_serializer = (NAScheduler *)v16;

    objc_initWeak((id *)buf, v12);
    uint64_t v18 = [MEMORY[0x1E4F5F648] serviceForClientIdentifier:@"com.apple.mobiletimer.bedtime-mode"];
    assertionService = v12->_assertionService;
    v12->_assertionService = (DNDModeAssertionService *)v18;

    v20 = v12->_assertionService;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke;
    v24[3] = &unk_1E5915A78;
    objc_copyWeak(&v25, (id *)buf);
    [(DNDModeAssertionService *)v20 addAssertionUpdateListener:v12 withCompletionHandler:v24];
    v21 = [[MTSleepModeStateMachine alloc] initWithDelegate:v12 infoProvider:v12];
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  return v12;
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = MTLogForCategory(7);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7) {
      __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_2((uint64_t)WeakRetained, (uint64_t)v4, v6);
    }
  }
  else if (v7)
  {
    __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_1((uint64_t)WeakRetained, v6);
  }
}

- (void)dealloc
{
  [(DNDModeAssertionService *)self->_assertionService removeAssertionUpdateListener:self];
  id v3 = (id)[(DNDModeAssertionService *)self->_assertionService invalidateActiveModeAssertionWithError:0];
  v4.receiver = self;
  v4.super_class = (Class)MTSleepModeMonitor;
  [(MTSleepModeMonitor *)&v4 dealloc];
}

- (void)updateMonitorState
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MTSleepModeMonitor_updateMonitorState__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

uint64_t __40__MTSleepModeMonitor_updateMonitorState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState:1];
}

- (MTAlarm)sleepAlarm
{
  return [(MTAlarmStorage *)self->_alarmStorage sleepAlarm];
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateProvider + 2))();
}

- (BOOL)isUserAsleep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepCoordinator);
  char v3 = [WeakRetained isUserAsleep];

  return v3;
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3
{
  return [(MTSleepModeMonitor *)self isSleepModeEnabled:a3 error:0];
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3 error:(id *)a4
{
  objc_super v4 = [(DNDModeAssertionService *)self->_assertionService activeModeAssertionWithError:a4];
  v5 = [v4 details];

  return v5 != 0;
}

- (NSDate)keepOffUntilDate
{
  v2 = +[MTUserDefaults sharedUserDefaults];
  char v3 = [v2 objectForKey:@"MTKeepDndOffUntilDate"];

  return (NSDate *)v3;
}

- (unint64_t)sleepModeTimeoutMinutes
{
  v2 = +[MTUserDefaults sharedUserDefaults];
  unint64_t v3 = [v2 integerForKey:@"MTSleepTimeOutMinutesKey" defaultValue:60];

  return v3;
}

- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v7 = a4;
  v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ engageUntilDate:userEngaged", buf, 0xCu);
  }

  id v9 = [(MTSleepModeMonitor *)self assertionService];
  id v36 = 0;
  id v10 = [v9 activeModeAssertionWithError:&v36];
  id v11 = v36;

  uint64_t v12 = [v7 dateByAddingTimeInterval:(double)[(MTSleepModeMonitor *)self sleepModeTimeoutMinutes] * 60.0];
  id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  v34 = (void *)v12;
  v15 = (void *)[v13 initWithStartDate:v14 endDate:v12];

  uint64_t v16 = [MEMORY[0x1E4F5F638] lifetimeWithDateInterval:v15];
  if (v10)
  {
    v17 = [v10 details];
    uint64_t v18 = [v17 lifetime];
    int v19 = [v18 isEqual:v16];

    v20 = MTLogForCategory(7);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19 && !v5)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543362;
        v38 = self;
        _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ already have assertion", buf, 0xCu);
      }
      BOOL v22 = 1;
      id v23 = v11;
      goto LABEL_29;
    }
    if (v21)
    {
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v7;
      __int16 v41 = 1024;
      BOOL v42 = v5;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ updating active assertion with new end date %{public}@, isUserRequested %d", buf, 0x1Cu);
    }
  }
  v24 = [MEMORY[0x1E4F5F620] detailsWithIdentifier:@"com.apple.mobiletimer.sleep-mode.automatic" modeIdentifier:@"com.apple.mobiletimer.mode.sleep" lifetime:v16];
  v20 = [v24 mutableCopy];

  id v25 = [(MTSleepModeMonitor *)self sleepAlarm];
  if ([v25 isEnabled]) {
    objc_super v26 = v7;
  }
  else {
    objc_super v26 = 0;
  }
  [v20 setUserVisibleEndDate:v26];

  v27 = MTLogForCategory(7);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v20;
    _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ acquiring assertion with details %{public}@", buf, 0x16u);
  }

  v28 = [(MTSleepModeMonitor *)self assertionService];
  id v35 = v11;
  uint64_t v29 = [v28 takeModeAssertionWithDetails:v20 error:&v35];
  id v23 = v35;

  if (v29) {
    BOOL v30 = v23 == 0;
  }
  else {
    BOOL v30 = 0;
  }
  BOOL v22 = v30;
  v31 = MTLogForCategory(7);
  v32 = v31;
  if (v22)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_19CC95000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully acquired assertion", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[MTSleepModeMonitor stateMachine:engageSleepModeUntilDate:userEngaged:]();
  }

LABEL_29:
  return v22;
}

- (void)stateMachineClearKeepSleepModeOff:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    BOOL v7 = self;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ clearKeepOff:", (uint8_t *)&v6, 0xCu);
  }

  BOOL v5 = +[MTUserDefaults sharedUserDefaults];
  [v5 removeObjectForKey:@"MTKeepDndOffUntilDate"];
}

- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = MTLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v19 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ disengage:", buf, 0xCu);
  }

  int v6 = [(MTSleepModeMonitor *)self assertionService];
  id v17 = 0;
  BOOL v7 = [v6 activeModeAssertionWithError:&v17];
  id v8 = v17;

  if (v7)
  {
    id v9 = [(MTSleepModeMonitor *)self assertionService];
    id v16 = v8;
    uint64_t v10 = [v9 invalidateActiveModeAssertionWithError:&v16];
    id v11 = v16;

    uint64_t v12 = MTLogForCategory(7);
    id v13 = v12;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MTSleepModeMonitor stateMachine:disengageSleepModeUserRequested:]();
      }

      BOOL v14 = 0;
      id v13 = v10;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        int v19 = self;
        _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully released assertion", buf, 0xCu);
      }
      BOOL v14 = 1;
      id v11 = (id)v10;
    }
  }
  else
  {
    id v13 = MTLogForCategory(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v19 = self;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ there is no assertion", buf, 0xCu);
    }
    BOOL v14 = 1;
    id v11 = v8;
  }

  return v14;
}

- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ keepOffUntilDate: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v7 = +[MTUserDefaults sharedUserDefaults];
  [v7 setObject:v5 forKey:@"MTKeepDndOffUntilDate"];
}

- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduleUpdateForSecondsFromNow: %f", buf, 0x16u);
  }

  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_after(v7, v8, block);
}

uint64_t __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    id v11 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ re-checking %{public}@", buf, 0x16u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke_21;
  v7[3] = &unk_1E59150A8;
  v7[4] = v4;
  return [v5 performBlock:v7];
}

uint64_t __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke_21(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState:0];
}

- (BOOL)isEnabled
{
  return [(MTSleepModeMonitor *)self isSleepModeEnabled:0];
}

- (BOOL)sleepMode:(id *)a3
{
  return [(MTSleepModeMonitor *)self isSleepModeEnabled:0 error:a3];
}

- (void)userDisengagedSleepMode
{
  id v3 = [(MTSleepModeMonitor *)self currentDate];
  [(MTSleepModeMonitor *)self userDisengagedSleepModeOnDate:v3];
}

- (void)userDisengagedSleepModeOnDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSleepModeMonitor *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MTSleepModeMonitor_userDisengagedSleepModeOnDate___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __52__MTSleepModeMonitor_userDisengagedSleepModeOnDate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = @"sleep mode";
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ user manually turning off %{public}@ (%{public}@)", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 32) stateMachine];
  [v5 sleepModeEnabled:0 userRequested:1 date:*(void *)(a1 + 40)];
}

- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    __int16 v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveModeAssertionInvalidation %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = [v5 reason];
  if (v7 == 2)
  {
    __int16 v8 = [v5 invalidationDate];
    [(MTSleepModeMonitor *)self userDisengagedSleepModeOnDate:v8];
  }
  else if (v7 == 5)
  {
    [(MTSleepModeMonitor *)self updateMonitorState];
  }
}

- (void)sleepCoordinator:(id)a3 userWokeUp:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v10 = self;
    __int16 v11 = 2114;
    id v12 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user woke up, turning off %{public}@ if it's on", buf, 0x16u);
  }

  uint64_t v7 = [(MTSleepModeMonitor *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__MTSleepModeMonitor_sleepCoordinator_userWokeUp_sleepAlarm___block_invoke;
  v8[3] = &unk_1E59150A8;
  v8[4] = self;
  [v7 performBlock:v8];
}

void __61__MTSleepModeMonitor_sleepCoordinator_userWokeUp_sleepAlarm___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 userWokeUp];
}

- (void)sleepCoordinator:(id)a3 userWentToBed:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user went to bed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderDidFire:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ bedtime reminder fired, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user went to bed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 bedtimeWasReached:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ it's the user's bedtime, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmDidFire:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ wake up alarm fired, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasSnoozed:(id)a4 sleepAlarm:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    __int16 v10 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ wake up alarm snoozed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = @"modified";
  if (!a4) {
    id v5 = @"removed";
  }
  int v6 = v5;
  int v7 = MTLogForCategory(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    __int16 v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ user %{public}@ sleep alarm, checking %{public}@", (uint8_t *)&v8, 0x20u);
  }

  [(MTSleepModeMonitor *)self updateMonitorState];
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = @"sleep mode";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected, checking %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__MTSleepModeMonitor_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E59150D0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(NAScheduler *)serializer performBlock:v9];
}

uint64_t __85__MTSleepModeMonitor_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) updateState:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)printDiagnostics
{
  *(void *)&void v9[5] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v7 = 0;
  BOOL v2 = [(MTSleepModeMonitor *)self isSleepModeEnabled:&v7];
  uint64_t v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v9 = v4;
    id v5 = v4;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----%@-----", buf, 0xCu);
  }
  int v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v9[0] = v2;
    LOWORD(v9[1]) = 1024;
    *(_DWORD *)((char *)&v9[1] + 2) = v7;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "isEnabled: %d, isUserRequested: %d", buf, 0xEu);
  }
}

- (id)gatherDiagnostics
{
  v8[2] = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  if ([(MTSleepModeMonitor *)self isSleepModeEnabled:&v6]) {
    BOOL v2 = @"YES";
  }
  else {
    BOOL v2 = @"NO";
  }
  v7[0] = @"isEnabled";
  v7[1] = @"isUserRequested";
  if (v6) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  v8[0] = v2;
  v8[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  return v4;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (MTSleepCoordinator)sleepCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepCoordinator);
  return (MTSleepCoordinator *)WeakRetained;
}

- (void)setSleepCoordinator:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (MTSleepModeStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (DNDModeAssertionService)assertionService
{
  return self->_assertionService;
}

- (void)setAssertionService:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_assertionService, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_destroyWeak((id *)&self->_sleepCoordinator);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Added assertion update listener", (uint8_t *)&v2, 0xCu);
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, a2, a3, "%{public}@ Failed adding assertion update listener: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)stateMachine:engageSleepModeUntilDate:userEngaged:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ Failed to acquire assertion with %{public}@");
}

- (void)stateMachine:disengageSleepModeUserRequested:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ Failed to release assertion with %{public}@");
}

@end