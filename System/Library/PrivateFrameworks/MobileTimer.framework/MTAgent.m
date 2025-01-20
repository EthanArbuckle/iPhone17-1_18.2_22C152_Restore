@interface MTAgent
+ (id)agent;
- (BOOL)isHorseman;
- (BOOL)systemReady;
- (MTAgent)init;
- (MTAgentDiagnosticListener)diagnostics;
- (MTAgentNotificationManager)notificationManager;
- (MTAlarmIntentDonor)alarmIntentDonor;
- (MTAlarmScheduler)alarmScheduler;
- (MTAlarmServer)alarmServer;
- (MTAlarmSnapshot)alarmSnapshot;
- (MTAlarmStorage)alarmStorage;
- (MTAlarmSyncDataModel)alarmSyncDataModel;
- (MTCoreDuetMonitor)coreDuetMonitor;
- (MTLanguageChangeListener)languageChangeListener;
- (MTMetrics)syncMetrics;
- (MTNotificationCenter)notificationCenter;
- (MTSessionServer)sessionServer;
- (MTSessionsCoordinator)sessionsCoordinator;
- (MTSleepCoordinator)sleepCoordinator;
- (MTSleepManager)sleepManager;
- (MTSleepModeMonitor)sleepModeMonitor;
- (MTSleepSessionManager)sleepSessionManager;
- (MTSleepSessionTracker)sleepSessionTracker;
- (MTStopwatchServer)stopwatchServer;
- (MTSystemStateListener)systemStateListener;
- (MTTimeListener)timeListener;
- (MTTimerIntentDonor)timerIntentDonor;
- (MTTimerScheduler)timerScheduler;
- (MTTimerServer)timerServer;
- (MTTimerSnapshot)timerSnapshot;
- (MTTimerStorage)timerStorage;
- (MTWidgetProvider)widgetProvider;
- (NAScheduler)serializer;
- (NSDate)launchDate;
- (id)_diagnosticProviders;
- (id)gatherDiagnostics;
- (void)_removeUserDefaultsData;
- (void)_removeUserDefaultsDataIfNecessary:(id)a3;
- (void)_setupAlarms;
- (void)_setupInitialListeners;
- (void)_setupNotificationCenter;
- (void)_setupSecondaryListeners;
- (void)_setupSessions;
- (void)_setupStopwatches;
- (void)_setupSync;
- (void)_setupTimers;
- (void)handleF5Reset;
- (void)handleMigrationFinish;
- (void)printDiagnostics;
- (void)restoreDidFinish;
- (void)setAlarmIntentDonor:(id)a3;
- (void)setAlarmScheduler:(id)a3;
- (void)setAlarmServer:(id)a3;
- (void)setAlarmSnapshot:(id)a3;
- (void)setAlarmStorage:(id)a3;
- (void)setAlarmSyncDataModel:(id)a3;
- (void)setCoreDuetMonitor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setIsHorseman:(BOOL)a3;
- (void)setLanguageChangeListener:(id)a3;
- (void)setLaunchDate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSessionServer:(id)a3;
- (void)setSessionsCoordinator:(id)a3;
- (void)setSleepCoordinator:(id)a3;
- (void)setSleepModeMonitor:(id)a3;
- (void)setSleepSessionManager:(id)a3;
- (void)setSleepSessionTracker:(id)a3;
- (void)setStopwatchServer:(id)a3;
- (void)setSyncMetrics:(id)a3;
- (void)setSystemReady:(BOOL)a3;
- (void)setSystemStateListener:(id)a3;
- (void)setTimeListener:(id)a3;
- (void)setTimerIntentDonor:(id)a3;
- (void)setTimerScheduler:(id)a3;
- (void)setTimerServer:(id)a3;
- (void)setTimerSnapshot:(id)a3;
- (void)setTimerStorage:(id)a3;
- (void)setWidgetProvider:(id)a3;
@end

@implementation MTAgent

+ (id)agent
{
  if (agent_onceToken != -1) {
    dispatch_once(&agent_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)agent_agent;
  return v2;
}

uint64_t __16__MTAgent_agent__block_invoke()
{
  v0 = objc_alloc_init(MTAgent);
  uint64_t v1 = agent_agent;
  agent_agent = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTAgent)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MTAgent;
  v2 = [(MTAgent *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    launchDate = v2->_launchDate;
    v2->_launchDate = (NSDate *)v3;

    v2->_isHorseman = MTIsHorseman();
    uint64_t v5 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTAgent", +[MTScheduler defaultPriority]);
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v5;

    v7 = MTLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v2;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ has launched", buf, 0xCu);
    }

    v8 = v2->_serializer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __15__MTAgent_init__block_invoke;
    v10[3] = &unk_1E59150A8;
    v11 = v2;
    [(NAScheduler *)v8 performBlock:v10];
  }
  return v2;
}

uint64_t __15__MTAgent_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupNotificationCenter];
  [*(id *)(a1 + 32) _setupAlarms];
  [*(id *)(a1 + 32) _setupTimers];
  [*(id *)(a1 + 32) _setupStopwatches];
  [*(id *)(a1 + 32) _setupSessions];
  [*(id *)(a1 + 32) _setupInitialListeners];
  v2 = *(void **)(a1 + 32);
  return [v2 _setupSync];
}

- (void)_setupNotificationCenter
{
  uint64_t v3 = (MTNotificationCenter *)objc_opt_new();
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;
  MEMORY[0x1F41817F8](v3, notificationCenter);
}

- (void)_setupStopwatches
{
  uint64_t v3 = (MTStopwatchServer *)objc_opt_new();
  stopwatchServer = self->_stopwatchServer;
  self->_stopwatchServer = v3;
  MEMORY[0x1F41817F8](v3, stopwatchServer);
}

- (void)_setupAlarms
{
  uint64_t v3 = (MTAlarmStorage *)objc_opt_new();
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v3;

  if (MTShouldHandleForEucalyptus())
  {
    uint64_t v5 = [[MTSleepManager alloc] initWithAlarmStorage:self->_alarmStorage];
    sleepManager = self->_sleepManager;
    self->_sleepManager = v5;
  }
  v7 = [[MTAlarmServer alloc] initWithStorage:self->_alarmStorage];
  alarmServer = self->_alarmServer;
  self->_alarmServer = v7;

  v9 = [[MTAlarmScheduler alloc] initWithStorage:self->_alarmStorage notificationCenter:self->_notificationCenter];
  alarmScheduler = self->_alarmScheduler;
  self->_alarmScheduler = v9;

  [(MTAlarmStorage *)self->_alarmStorage setScheduler:self->_alarmScheduler];
  v11 = [[MTAlarmSnapshot alloc] initWithStorage:self->_alarmStorage];
  alarmSnapshot = self->_alarmSnapshot;
  self->_alarmSnapshot = v11;

  v13 = [(MTBaseAlarmWidgetProvider *)[MTWidgetProvider alloc] initWithAlarmStorage:self->_alarmStorage];
  widgetProvider = self->_widgetProvider;
  self->_widgetProvider = v13;

  if (!self->_isHorseman)
  {
    uint64_t v15 = [[MTCoreDuetMonitor alloc] initWithAlarmStorage:self->_alarmStorage];
    coreDuetMonitor = self->_coreDuetMonitor;
    self->_coreDuetMonitor = v15;

    v17 = [[MTAlarmIntentDonor alloc] initWithStorage:self->_alarmStorage];
    alarmIntentDonor = self->_alarmIntentDonor;
    self->_alarmIntentDonor = v17;

    if (MTShouldHandleForBedtime())
    {
      v19 = [[MTSleepCoordinator alloc] initWithAlarmStorage:self->_alarmStorage];
      sleepCoordinator = self->_sleepCoordinator;
      self->_sleepCoordinator = v19;

      v21 = [[MTSleepModeMonitor alloc] initWithAlarmStorage:self->_alarmStorage sleepCoordinator:self->_sleepCoordinator];
      sleepModeMonitor = self->_sleepModeMonitor;
      self->_sleepModeMonitor = v21;

      [(MTSleepCoordinator *)self->_sleepCoordinator setSleepModeMonitor:self->_sleepModeMonitor];
      v23 = [(MTSleepSessionTracker *)[MTTimeInBedSessionTracker alloc] initWithAlarmStorage:self->_alarmStorage];
      sleepSessionTracker = self->_sleepSessionTracker;
      self->_sleepSessionTracker = &v23->super;

      v25 = [[MTSleepSessionManager alloc] initWithAlarmStorage:self->_alarmStorage sleepCoordinator:self->_sleepCoordinator sleepSessionTracker:self->_sleepSessionTracker];
      sleepSessionManager = self->_sleepSessionManager;
      self->_sleepSessionManager = v25;
      MEMORY[0x1F41817F8](v25, sleepSessionManager);
    }
  }
}

- (void)_setupTimers
{
  uint64_t v3 = (MTTimerStorage *)objc_opt_new();
  timerStorage = self->_timerStorage;
  self->_timerStorage = v3;

  uint64_t v5 = [[MTTimerServer alloc] initWithStorage:self->_timerStorage];
  timerServer = self->_timerServer;
  self->_timerServer = v5;

  v7 = [[MTTimerScheduler alloc] initWithStorage:self->_timerStorage notificationCenter:self->_notificationCenter];
  timerScheduler = self->_timerScheduler;
  self->_timerScheduler = v7;

  [(MTTimerStorage *)self->_timerStorage setScheduler:self->_timerScheduler];
  v9 = [[MTTimerSnapshot alloc] initWithStorage:self->_timerStorage];
  timerSnapshot = self->_timerSnapshot;
  self->_timerSnapshot = v9;

  if (!self->_isHorseman)
  {
    v11 = [[MTTimerIntentDonor alloc] initWithStorage:self->_timerStorage];
    timerIntentDonor = self->_timerIntentDonor;
    self->_timerIntentDonor = v11;
    MEMORY[0x1F41817F8](v11, timerIntentDonor);
  }
}

- (void)_setupSessions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[MTSessionsCoordinator supportsSessions];
  p_super = MTLogForCategory(1);
  BOOL v5 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_19CC95000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ supports sessions, setting up coordinator", (uint8_t *)&v9, 0xCu);
    }

    v6 = [[MTSessionsCoordinator alloc] initWithStorage:self->_timerStorage alarmStorage:self->_alarmStorage];
    p_super = &self->_sessionsCoordinator->super;
    self->_sessionsCoordinator = v6;
  }
  else if (v5)
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_19CC95000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ does not support sessions", (uint8_t *)&v9, 0xCu);
  }

  v7 = [[MTSessionServer alloc] initWithCoordinator:self->_sessionsCoordinator];
  sessionServer = self->_sessionServer;
  self->_sessionServer = v7;
}

- (void)_setupSync
{
  BOOL v3 = (MTMetrics *)objc_opt_new();
  syncMetrics = self->_syncMetrics;
  self->_syncMetrics = v3;

  BOOL v5 = [[MTAlarmSyncDataModel alloc] initWithAlarmStorage:self->_alarmStorage syncMetrics:self->_syncMetrics];
  alarmSyncDataModel = self->_alarmSyncDataModel;
  self->_alarmSyncDataModel = v5;
  MEMORY[0x1F41817F8](v5, alarmSyncDataModel);
}

- (void)_setupInitialListeners
{
  BOOL v3 = (MTAgentNotificationManager *)objc_opt_new();
  notificationManager = self->_notificationManager;
  self->_notificationManager = v3;

  BOOL v5 = objc_alloc_init(MTLanguageChangeListener);
  languageChangeListener = self->_languageChangeListener;
  self->_languageChangeListener = v5;

  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_languageChangeListener];
  v7 = (MTTimeListener *)objc_opt_new();
  timeListener = self->_timeListener;
  self->_timeListener = v7;

  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_timeListener];
  int v9 = [[MTSystemStateListener alloc] initWithDelegate:self];
  systemStateListener = self->_systemStateListener;
  self->_systemStateListener = v9;

  self->_systemReady = [(MTSystemStateListener *)self->_systemStateListener checkSystemReady];
  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_systemStateListener];
  if (!self->_systemReady)
  {
    [(MTAlarmServer *)self->_alarmServer startListening];
    [(MTTimerServer *)self->_timerServer startListening];
    [(MTStopwatchServer *)self->_stopwatchServer startListening];
    [(MTSessionServer *)self->_sessionServer startListening];
  }
  [(MTAlarmStorage *)self->_alarmStorage setupListeners];
  [(MTTimerStorage *)self->_timerStorage setupListeners];
  id v11 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v11 addObserver:self forBundleIdentifier:@"com.apple.mobiletimer"];
}

- (void)restoreDidFinish
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__MTAgent_restoreDidFinish__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

uint64_t __27__MTAgent_restoreDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ system is ready", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 104) loadAlarms];
  [*(id *)(*(void *)(a1 + 32) + 136) loadTimers];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 8))
  {
    [*(id *)(v4 + 160) setupNotificationCenter];
    BOOL v5 = [[MTUserNotificationActionDispatcher alloc] initWithAlarmStorage:*(void *)(*(void *)(a1 + 32) + 104) timerStorage:*(void *)(*(void *)(a1 + 32) + 136)];
    [*(id *)(*(void *)(a1 + 32) + 160) registerActionHandler:v5];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  [*(id *)(v4 + 88) rescheduleAlarmsWithCompletion:0];
  [*(id *)(*(void *)(a1 + 32) + 72) registerObserver:*(void *)(*(void *)(a1 + 32) + 104)];
  [*(id *)(*(void *)(a1 + 32) + 120) rescheduleTimers];
  if (!MTIdiomIpad()) {
    [*(id *)(*(void *)(a1 + 32) + 72) registerObserver:*(void *)(*(void *)(a1 + 32) + 136)];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 8))
  {
    [*(id *)(v6 + 240) startSyncServices];
    if (MTShouldHandleForBedtime())
    {
      [*(id *)(*(void *)(a1 + 32) + 208) updateSleepState];
      [*(id *)(*(void *)(a1 + 32) + 208) registerObserver:*(void *)(*(void *)(a1 + 32) + 216)];
      [*(id *)(*(void *)(a1 + 32) + 72) registerObserver:*(void *)(*(void *)(a1 + 32) + 208)];
      [*(id *)(*(void *)(a1 + 32) + 72) registerObserver:*(void *)(*(void *)(a1 + 32) + 216)];
      [*(id *)(*(void *)(a1 + 32) + 216) updateMonitorState];
      [*(id *)(*(void *)(a1 + 32) + 208) registerObserver:*(void *)(*(void *)(a1 + 32) + 232)];
      [*(id *)(*(void *)(a1 + 32) + 232) prepare];
      [*(id *)(*(void *)(a1 + 32) + 224) saveSessionData];
    }
    [*(id *)(*(void *)(a1 + 32) + 184) handleSystemReady];
    [*(id *)(*(void *)(a1 + 32) + 200) handleSystemReady];
    [*(id *)(*(void *)(a1 + 32) + 192) handleSystemReady];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  [*(id *)(v6 + 80) handleSystemReady];
  [*(id *)(*(void *)(a1 + 32) + 112) handleSystemReady];
  [*(id *)(*(void *)(a1 + 32) + 144) handleSystemReady];
  [*(id *)(*(void *)(a1 + 32) + 152) handleSystemReady];
  [*(id *)(*(void *)(a1 + 32) + 168) prepareAlarms];
  uint64_t result = [*(id *)(a1 + 32) _setupSecondaryListeners];
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 9))
  {
    [*(id *)(v8 + 80) startListening];
    [*(id *)(*(void *)(a1 + 32) + 112) startListening];
    [*(id *)(*(void *)(a1 + 32) + 144) startListening];
    return [*(id *)(*(void *)(a1 + 32) + 152) startListening];
  }
  else
  {
    *(unsigned char *)(v8 + 9) = 1;
  }
  return result;
}

- (void)_setupSecondaryListeners
{
  notificationManager = self->_notificationManager;
  uint64_t v4 = +[MTDeviceListener sharedDeviceListener];
  [(MTAgentNotificationManager *)notificationManager registerListener:v4];

  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_alarmScheduler];
  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_timerScheduler];
  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_alarmStorage];
  if (MTShouldHandleForBedtime())
  {
    if (self->_sleepCoordinator) {
      -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:");
    }
    if (self->_sleepSessionTracker) {
      -[MTAgentNotificationManager registerListener:](self->_notificationManager, "registerListener:");
    }
  }
  BOOL v5 = [[MTAgentDiagnosticListener alloc] initWithDelegate:self];
  diagnostics = self->_diagnostics;
  self->_diagnostics = v5;

  [(MTAgentNotificationManager *)self->_notificationManager registerListener:self->_diagnostics];
  v7 = self->_notificationManager;
  uint64_t v8 = +[MTPairedDeviceListener sharedListener];
  [(MTAgentNotificationManager *)v7 registerListener:v8];

  [(MTAgentNotificationManager *)self->_notificationManager beginListening];
  id v9 = +[MTSensitiveUIMonitor sharedMonitor];
}

- (void)handleF5Reset
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __24__MTAgent_handleF5Reset__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

uint64_t __24__MTAgent_handleF5Reset__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) handleF5Reset];
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  return [v2 handleF5Reset];
}

- (void)handleMigrationFinish
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ migration finished", buf, 0xCu);
  }

  serializer = self->_serializer;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MTAgent_handleMigrationFinish__block_invoke;
  v5[3] = &unk_1E59150A8;
  v5[4] = self;
  [(NAScheduler *)serializer performBlock:v5];
}

uint64_t __32__MTAgent_handleMigrationFinish__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) handleMigrationFinish];
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  return [v2 handleMigrationFinish];
}

- (id)_diagnosticProviders
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MTAgent *)self systemStateListener];

  if (v4)
  {
    BOOL v5 = [(MTAgent *)self systemStateListener];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(MTAgent *)self alarmServer];

  if (v6)
  {
    v7 = [(MTAgent *)self alarmServer];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(MTAgent *)self alarmStorage];

  if (v8)
  {
    id v9 = [(MTAgent *)self alarmStorage];
    [v3 addObject:v9];
  }
  uint64_t v10 = [(MTAgent *)self alarmScheduler];

  if (v10)
  {
    uint64_t v11 = [(MTAgent *)self alarmScheduler];
    [v3 addObject:v11];
  }
  objc_super v12 = [(MTAgent *)self timerServer];

  if (v12)
  {
    v13 = [(MTAgent *)self timerServer];
    [v3 addObject:v13];
  }
  v14 = [(MTAgent *)self sessionServer];

  if (v14)
  {
    uint64_t v15 = [(MTAgent *)self sessionServer];
    [v3 addObject:v15];
  }
  v16 = [(MTAgent *)self timerStorage];

  if (v16)
  {
    v17 = [(MTAgent *)self timerStorage];
    [v3 addObject:v17];
  }
  v18 = [(MTAgent *)self timerScheduler];

  if (v18)
  {
    v19 = [(MTAgent *)self timerScheduler];
    [v3 addObject:v19];
  }
  v20 = +[MTDeviceListener sharedDeviceListener];
  [v3 addObject:v20];

  if (self->_alarmSyncDataModel) {
    objc_msgSend(v3, "addObject:");
  }
  v21 = +[MTPairedDeviceListener sharedListener];
  [v3 addObject:v21];

  if (MTShouldHandleForBedtime())
  {
    v22 = [(MTAgent *)self sleepCoordinator];

    if (v22)
    {
      v23 = [(MTAgent *)self sleepCoordinator];
      [v3 addObject:v23];
    }
  }
  return v3;
}

- (void)printDiagnostics
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  uint64_t v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  BOOL v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  uint64_t v6 = MTLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v7 = MTLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "-----%{public}@-----", buf, 0xCu);
  }

  id v9 = MTLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(MTAgent *)self launchDate];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = (uint64_t)v10;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "Launched: %{public}@", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [(MTAgent *)self _diagnosticProviders];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v15++) printDiagnostics];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v16 = MTLogForCategory(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "------------------------", buf, 2u);
  }

  v17 = MTLogForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v18 = MTLogForCategory(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v19 = MTLogForCategory(1);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v20 = MTLogForCategory(1);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
}

- (id)gatherDiagnostics
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MTAgent *)self launchDate];
  [v3 setObject:v4 forKeyedSubscript:@"Launched"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [(MTAgent *)self _diagnosticProviders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 gatherDiagnostics];
          [v3 addEntriesFromDictionary:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_removeUserDefaultsDataIfNecessary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"com.apple.mobiletimer"] & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), v7 = objc_claimAutoreleasedReturnValue(), char v8 = [v7 isApplicationInstalledForBundleIdentifier:@"com.apple.mobiletimer"], v7, (v8 & 1) == 0))
  {
    BOOL v5 = MTLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing user defaults", buf, 0xCu);
    }

    uint64_t v6 = [(MTAgent *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__MTAgent__removeUserDefaultsDataIfNecessary___block_invoke;
    v9[3] = &unk_1E59150A8;
    v9[4] = self;
    [v6 performBlock:v9];
  }
}

uint64_t __46__MTAgent__removeUserDefaultsDataIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeUserDefaultsData];
}

- (void)_removeUserDefaultsData
{
  v2 = [MTUserDefaults alloc];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobiletimer"];
  uint64_t v4 = [(MTUserDefaults *)v2 initWithUserDefaults:v3];

  [(MTUserDefaults *)v4 removeAllObjects];
}

- (MTSleepManager)sleepManager
{
  return self->_sleepManager;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
}

- (BOOL)isHorseman
{
  return self->_isHorseman;
}

- (void)setIsHorseman:(BOOL)a3
{
  self->_isHorseman = a3;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (MTAgentNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (MTSystemStateListener)systemStateListener
{
  return self->_systemStateListener;
}

- (void)setSystemStateListener:(id)a3
{
}

- (MTLanguageChangeListener)languageChangeListener
{
  return self->_languageChangeListener;
}

- (void)setLanguageChangeListener:(id)a3
{
}

- (MTAgentDiagnosticListener)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (MTTimeListener)timeListener
{
  return self->_timeListener;
}

- (void)setTimeListener:(id)a3
{
}

- (MTAlarmServer)alarmServer
{
  return self->_alarmServer;
}

- (void)setAlarmServer:(id)a3
{
}

- (MTAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (void)setAlarmScheduler:(id)a3
{
}

- (MTAlarmSnapshot)alarmSnapshot
{
  return self->_alarmSnapshot;
}

- (void)setAlarmSnapshot:(id)a3
{
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (MTTimerServer)timerServer
{
  return self->_timerServer;
}

- (void)setTimerServer:(id)a3
{
}

- (MTTimerScheduler)timerScheduler
{
  return self->_timerScheduler;
}

- (void)setTimerScheduler:(id)a3
{
}

- (MTTimerSnapshot)timerSnapshot
{
  return self->_timerSnapshot;
}

- (void)setTimerSnapshot:(id)a3
{
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (void)setTimerStorage:(id)a3
{
}

- (MTStopwatchServer)stopwatchServer
{
  return self->_stopwatchServer;
}

- (void)setStopwatchServer:(id)a3
{
}

- (MTSessionServer)sessionServer
{
  return self->_sessionServer;
}

- (void)setSessionServer:(id)a3
{
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (MTAlarmIntentDonor)alarmIntentDonor
{
  return self->_alarmIntentDonor;
}

- (void)setAlarmIntentDonor:(id)a3
{
}

- (MTTimerIntentDonor)timerIntentDonor
{
  return self->_timerIntentDonor;
}

- (void)setTimerIntentDonor:(id)a3
{
}

- (MTCoreDuetMonitor)coreDuetMonitor
{
  return self->_coreDuetMonitor;
}

- (void)setCoreDuetMonitor:(id)a3
{
}

- (MTSessionsCoordinator)sessionsCoordinator
{
  return self->_sessionsCoordinator;
}

- (void)setSessionsCoordinator:(id)a3
{
}

- (MTWidgetProvider)widgetProvider
{
  return self->_widgetProvider;
}

- (void)setWidgetProvider:(id)a3
{
}

- (MTSleepCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (void)setSleepCoordinator:(id)a3
{
}

- (MTSleepModeMonitor)sleepModeMonitor
{
  return self->_sleepModeMonitor;
}

- (void)setSleepModeMonitor:(id)a3
{
}

- (MTSleepSessionManager)sleepSessionManager
{
  return self->_sleepSessionManager;
}

- (void)setSleepSessionManager:(id)a3
{
}

- (MTSleepSessionTracker)sleepSessionTracker
{
  return self->_sleepSessionTracker;
}

- (void)setSleepSessionTracker:(id)a3
{
}

- (MTAlarmSyncDataModel)alarmSyncDataModel
{
  return self->_alarmSyncDataModel;
}

- (void)setAlarmSyncDataModel:(id)a3
{
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_alarmSyncDataModel, 0);
  objc_storeStrong((id *)&self->_sleepSessionTracker, 0);
  objc_storeStrong((id *)&self->_sleepSessionManager, 0);
  objc_storeStrong((id *)&self->_sleepModeMonitor, 0);
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_widgetProvider, 0);
  objc_storeStrong((id *)&self->_sessionsCoordinator, 0);
  objc_storeStrong((id *)&self->_coreDuetMonitor, 0);
  objc_storeStrong((id *)&self->_timerIntentDonor, 0);
  objc_storeStrong((id *)&self->_alarmIntentDonor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_sessionServer, 0);
  objc_storeStrong((id *)&self->_stopwatchServer, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
  objc_storeStrong((id *)&self->_timerSnapshot, 0);
  objc_storeStrong((id *)&self->_timerScheduler, 0);
  objc_storeStrong((id *)&self->_timerServer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_alarmSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_alarmServer, 0);
  objc_storeStrong((id *)&self->_timeListener, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_languageChangeListener, 0);
  objc_storeStrong((id *)&self->_systemStateListener, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_storeStrong((id *)&self->_sleepManager, 0);
}

@end