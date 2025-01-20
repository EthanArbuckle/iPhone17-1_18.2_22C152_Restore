@interface PowerUIAlarmSignalMonitor
+ (id)monitorWithDelegate:(id)a3;
+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5;
- (MTAlarmManager)alarmManager;
- (OS_os_log)log;
- (PowerUIAlarmSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5;
- (PowerUISignalMonitorDelegate)delegate;
- (id)detectedSignals;
- (id)nextLocalAlarm;
- (id)requiredFullChargeDate;
- (unint64_t)signalID;
- (void)setAlarmManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)sourceInformationChangedNotification:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PowerUIAlarmSignalMonitor

- (PowerUIAlarmSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PowerUIAlarmSignalMonitor;
  v10 = [(PowerUIAlarmSignalMonitor *)&v27 init];
  if (v10)
  {
    v11 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x263F55D50]);
    alarmManager = v10->_alarmManager;
    v10->_alarmManager = v11;

    objc_storeStrong((id *)&v10->_delegate, a3);
    os_log_t v13 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __71__PowerUIAlarmSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke;
    v24 = &unk_2645A6878;
    id v15 = v9;
    id v25 = v15;
    v26 = v10;
    v16 = (void (**)(void, void, void, void))MEMORY[0x223C80C20](&v21);
    v16[2](v16, v17, v18, v19);
    objc_msgSend(v15, "addUpdateHandler:", v16, v21, v22, v23, v24);
  }
  return v10;
}

void __71__PowerUIAlarmSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) doubleFactorForName:@"alarmSignalBuffer"];
  if (v2 > 1.0) {
    kBufferBeforeAlarm = *(void *)&v2;
  }
  v3 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = kBufferBeforeAlarm;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "Alarm Buffer: %lf", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3 = a3;
  int v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3 trialManager:0 withContext:0];

  return v4;
}

+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v9 trialManager:v8 withContext:v7];

  return v10;
}

- (unint64_t)signalID
{
  return 2;
}

- (void)startMonitoring
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_sourceInformationChangedNotification_ name:*MEMORY[0x263F55CD8] object:0];
}

- (void)sourceInformationChangedNotification:(id)a3
{
  id v4 = [(PowerUIAlarmSignalMonitor *)self requiredFullChargeDate];
  [(PowerUISignalMonitorDelegate *)self->_delegate monitor:self maySuggestNewFullChargeDeadline:v4];
}

- (void)stopMonitoring
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F55CD8] object:0];
}

- (id)nextLocalAlarm
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__8;
  id v19 = [MEMORY[0x263EFF910] distantFuture];
  id v3 = [(MTAlarmManager *)self->_alarmManager nextAlarm];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__PowerUIAlarmSignalMonitor_nextLocalAlarm__block_invoke;
  v11[3] = &unk_2645A6DA0;
  v11[4] = self;
  os_log_t v13 = &v14;
  uint64_t v5 = v4;
  v12 = v5;
  id v6 = (id)[v3 addCompletionBlock:v11];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v15[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v8;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Earliest fire date is %@", buf, 0xCu);
  }
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __43__PowerUIAlarmSignalMonitor_nextLocalAlarm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = [v5 nextFireDate];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    v11 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      os_log_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Unable to obtain next alarm to fire: %@, %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)requiredFullChargeDate
{
  double v2 = [(PowerUIAlarmSignalMonitor *)self nextAlarm];
  id v3 = v2;
  if (v2 && ([v2 timeIntervalSinceNow], v4 >= 0.0))
  {
    uint64_t v5 = [v3 dateByAddingTimeInterval:-*(double *)&kBufferBeforeAlarm];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF910] distantFuture];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)detectedSignals
{
  double v2 = [(PowerUIAlarmSignalMonitor *)self nextAlarm];
  id v3 = [MEMORY[0x263EFF910] distantFuture];
  int v4 = [v2 isEqualToDate:v3];

  if (v4) {
    [MEMORY[0x263EFF8C0] array];
  }
  else {
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v2];
  }

  return v5;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end