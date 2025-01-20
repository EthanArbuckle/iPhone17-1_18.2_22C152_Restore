@interface MTAlarmStorage
+ (id)_diagnosticDictionaryForAlarm:(id)a3;
- (BOOL)_queue_hasMatchingAlarm:(id)a3;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (MTAlarm)nextAlarm;
- (MTAlarm)sleepAlarm;
- (MTAlarmMigrator)migrator;
- (MTAlarmScheduler)scheduler;
- (MTAlarmStorage)init;
- (MTAlarmStorage)initWithPersistence:(id)a3;
- (MTAlarmStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7;
- (MTObserverStore)observers;
- (MTPersistence)persistence;
- (NAScheduler)serializer;
- (NSArray)alarms;
- (NSArray)allAlarms;
- (NSDate)lastModifiedDate;
- (NSMutableArray)orderedAlarms;
- (NSMutableArray)sleepAlarms;
- (id)_applyNecessaryChangesFromExistingAlarm:(id)a3 updatedAlarm:(id)a4;
- (id)_cleanUpForInternalBuild:(id)a3;
- (id)_cleanUpSleepAlarmRepeat:(id)a3;
- (id)_cleanUpSnoozeFireDate:(id)a3;
- (id)_convertSleepAlarmToRegular:(id)a3;
- (id)_diagnosticDictionaryForAlarms:(id)a3;
- (id)_queuePersistAlarm:(id)a3 replacingAlarm:(id)a4;
- (id)_queue_alarmMatchingAlarm:(id)a3;
- (id)_queue_alarmMatchingAlarmIdentifier:(id)a3;
- (id)_queue_allAlarms;
- (id)_queue_allSleepAlarms;
- (id)_queue_updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (id)_queue_updateSleepAlarmsFromExistingAlarms:(id)a3;
- (id)activeSleepAlarm;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (id)transferMetadataForSleepAlarm:(id)a3 fromPrevious:(id)a4;
- (void)_clearOutInvalidToneIdentifiers;
- (void)_loadAlarmsWithCompletion:(id)a3;
- (void)_notifyObserversForAlarmAdd:(id)a3 source:(id)a4;
- (void)_notifyObserversForAlarmChange:(id)a3 previousAlarms:(id)a4 source:(id)a5;
- (void)_notifyObserversForAlarmDismiss:(id)a3 dismissAction:(unint64_t)a4 source:(id)a5;
- (void)_notifyObserversForAlarmFire:(id)a3 triggerType:(unint64_t)a4 source:(id)a5;
- (void)_notifyObserversForAlarmRemoval:(id)a3 source:(id)a4;
- (void)_notifyObserversForAlarmSnooze:(id)a3 snoozeAction:(unint64_t)a4 source:(id)a5;
- (void)_notifyObserversForNextAlarmChange:(id)a3 source:(id)a4;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_queue_actuallyRemoveAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7;
- (void)_queue_dismissMutableAlarm:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5;
- (void)_queue_persistAlarms;
- (void)_queue_removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_removeAllAlarmsForSource:(id)a3;
- (void)_queue_resetAlarmsTo:(id)a3 sleepAlarms:(id)a4;
- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5;
- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7;
- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7 override:(BOOL)a8;
- (void)_queue_snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7;
- (void)_queue_sortAlarms;
- (void)_queue_sortSleepAlarms;
- (void)_queue_updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6;
- (void)_removeAlarmDataIfNecessary:(id)a3;
- (void)_resetCurrentToneIdentifier;
- (void)addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)alarmWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6;
- (void)dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7;
- (void)getAlarmsWithCompletion:(id)a3;
- (void)handleMigrationFinish;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)loadAlarms;
- (void)loadAlarmsSync;
- (void)printDiagnostics;
- (void)registerObserver:(id)a3;
- (void)removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)removeAllAlarmsForSource:(id)a3;
- (void)scheduler:(id)a3 didChangeNextAlarm:(id)a4;
- (void)scheduler:(id)a3 didFireAlarm:(id)a4;
- (void)setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5;
- (void)setLastModifiedDate:(id)a3;
- (void)setMigrator:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOrderedAlarms:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSleepAlarms:(id)a3;
- (void)setupListeners;
- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6;
- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7;
- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4;
- (void)updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6;
- (void)updateSleepAlarms:(id)a3 source:(id)a4;
- (void)updateSleepAlarmsWithBlock:(id)a3 source:(id)a4;
@end

@implementation MTAlarmStorage

- (void)getAlarmsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for alarms", buf, 0xCu);
  }

  if (v4)
  {
    v6 = [(MTAlarmStorage *)self nextAlarm];
    v7 = [(MTAlarmStorage *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke;
    v9[3] = &unk_1E5915120;
    v9[4] = self;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    [v7 performBlock:v9];
  }
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTAlarm)nextAlarm
{
  v2 = [(MTAlarmStorage *)self scheduler];
  v3 = [v2 nextAlarm];

  return (MTAlarm *)v3;
}

- (MTAlarmScheduler)scheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  return (MTAlarmScheduler *)WeakRetained;
}

uint64_t __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(3);
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  id v4 = MTLogForCategory(3);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [*(id *)(v6 + 16) valueForKey:@"alarmID"];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 24) valueForKey:@"alarmID"];
    v9 = [*(id *)(a1 + 40) alarmID];
    int v14 = 138544130;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    v17 = v7;
    __int16 v18 = 2114;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning ordered alarms: %{public}@, sleep alarms: %{public}@, next alarm: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  id v10 = MTLogForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion block with alarms %@", (uint8_t *)&v14, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke_cold_1()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v1;
  uint64_t v10 = v3;
  _os_log_debug_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ returning ordered alarms: %{public}@, sleep alarms: %{public}@, next alarm: %{public}@", v5, 0x2Au);
}

- (MTAlarmStorage)init
{
  uint64_t v3 = +[MTUserDefaults sharedUserDefaults];
  os_log_t v4 = [(MTAlarmStorage *)self initWithPersistence:v3];

  return v4;
}

- (MTAlarmStorage)initWithPersistence:(id)a3
{
  id v4 = a3;
  v5 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTAlarmStorage.access-queue", +[MTScheduler defaultPriority]);
  uint64_t v6 = objc_opt_new();
  __int16 v7 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  uint64_t v8 = MTCurrentDateProvider();
  __int16 v9 = [(MTAlarmStorage *)self initWithPersistence:v4 migrator:v6 serializer:v5 callbackScheduler:v7 currentDateProvider:v8];

  return v9;
}

- (MTAlarmStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MTAlarmStorage;
  __int16 v18 = [(MTAlarmStorage *)&v25 init];
  if (v18)
  {
    v19 = MTLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v27 = v18;
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with persistence %{public}@ and migrator %{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v18->_serializer, a5);
    __int16 v20 = [[MTObserverStore alloc] initWithCallbackScheduler:v16];
    observers = v18->_observers;
    v18->_observers = v20;

    objc_storeStrong((id *)&v18->_migrator, a4);
    uint64_t v22 = [v17 copy];
    id currentDateProvider = v18->_currentDateProvider;
    v18->_id currentDateProvider = (id)v22;

    objc_storeStrong((id *)&v18->_persistence, a3);
  }

  return v18;
}

- (void)dealloc
{
  uint64_t v3 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTAlarmStorage;
  [(MTAlarmStorage *)&v4 dealloc];
}

- (void)setupListeners
{
  id v3 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v3 addObserver:self forBundleIdentifier:@"com.apple.mobiletimer"];
}

- (id)_cleanUpSnoozeFireDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 snoozeFireDate],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        (*((void (**)(void))self->_currentDateProvider + 2))(),
        __int16 v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 mtIsBeforeDate:v7],
        v7,
        v6,
        v8))
  {
    __int16 v9 = MTLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _cleanUpSnoozeFireDate:]();
    }

    id v10 = (id)[v5 mutableCopy];
    [v10 setSnoozeFireDate:0];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)_cleanUpSleepAlarmRepeat:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _cleanUpSleepAlarmRepeat:]();
    }

    v5 = (void *)[v3 mutableCopy];
    [v5 setRepeatSchedule:127];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_convertSleepAlarmToRegular:(id)a3
{
  id v3 = a3;
  id v4 = +[MTAlarm alarm];
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
  objc_msgSend(v4, "setMinute:", objc_msgSend(v3, "minute"));
  objc_msgSend(v4, "setRepeatSchedule:", objc_msgSend(v3, "repeatSchedule"));
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"BED_TIME" value:&stru_1EEDE16C8 table:@"Localizable"];
  [v4 setTitle:v6];

  __int16 v7 = [v3 sound];

  int v8 = [v4 sound];
  __int16 v9 = [v8 toneIdentifier];

  id v10 = [v4 sound];
  uint64_t v11 = [v10 vibrationIdentifier];

  if ([v7 soundType] == 1)
  {
    v12 = (void *)*MEMORY[0x1E4FAF638];
  }
  else
  {
    id v13 = [v7 toneIdentifier];
    v12 = (void *)*MEMORY[0x1E4FAF638];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4FAF638]];

    if (!v14) {
      goto LABEL_5;
    }
  }
  id v15 = v12;

  __int16 v9 = v15;
LABEL_5:
  id v16 = [v7 vibrationIdentifier];
  id v17 = (void *)*MEMORY[0x1E4FAF640];
  int v18 = [v16 isEqualToString:*MEMORY[0x1E4FAF640]];

  if (v18)
  {
    id v19 = v17;

    uint64_t v11 = v19;
  }
  __int16 v20 = [v4 sound];
  v21 = [v20 soundVolume];
  uint64_t v22 = +[MTSound toneSoundWithIdentifier:v9 vibrationIdentifer:v11 volume:v21];
  [v4 setSound:v22];

  v23 = (void *)[v4 copy];
  return v23;
}

- (id)_cleanUpForInternalBuild:(id)a3
{
  if (a3)
  {
    id v4 = (void *)[a3 mutableCopy];
    v5 = [v4 sound];
    uint64_t v6 = [v5 soundVolume];

    if (!v6)
    {
      __int16 v7 = [MTSound alloc];
      int v8 = [v4 sound];
      __int16 v9 = [(MTSound *)v7 initWithSound:v8 usingVolume:&unk_1EEE11EB0];

      [v4 setSound:v9];
    }
    [(MTAlarmStorage *)self _resetCurrentToneIdentifier];
    id v10 = +[MTUserDefaults sharedUserDefaults];
    [v10 removeObjectForKey:@"MTDefaultTimerVibrationID"];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_clearOutInvalidToneIdentifiers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    __int16 v9 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Cleaning out invalid tone identifiers", (uint8_t *)&v8, 0xCu);
  }

  id v4 = +[MTUserDefaults sharedUserDefaults];
  [v4 removeObjectForKey:@"MTDefaultAlarmSoundType"];

  v5 = +[MTUserDefaults sharedUserDefaults];
  [v5 removeObjectForKey:@"MTDefaultAlarmToneID"];

  uint64_t v6 = +[MTUserDefaults sharedUserDefaults];
  [v6 removeObjectForKey:@"MTDefaultAlarmMediaItemID"];

  __int16 v7 = +[MTUserDefaults sharedUserDefaults];
  [v7 removeObjectForKey:@"MTDefaultAlarmVibrationID"];
}

- (void)_resetCurrentToneIdentifier
{
  uint64_t v2 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
  uint64_t v3 = *MEMORY[0x1E4FAF610];
  [v2 setCurrentToneIdentifier:0 forAlertType:13 topic:*MEMORY[0x1E4FAF610]];

  id v4 = [MEMORY[0x1E4FAF5F8] sharedVibrationManager];
  [v4 setCurrentVibrationIdentifier:0 forAlertType:13 topic:v3];
}

- (void)loadAlarms
{
}

- (void)loadAlarmsSync
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MTAlarmStorage_loadAlarmsSync__block_invoke;
  v5[3] = &unk_1E59150A8;
  dispatch_semaphore_t v6 = v3;
  id v4 = v3;
  [(MTAlarmStorage *)self _loadAlarmsWithCompletion:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __32__MTAlarmStorage_loadAlarmsSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadAlarmsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MTAlarmStorage *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke;
  v7[3] = &unk_1E59150D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) persistence];
  BOOL v4 = v3 == 0;

  v5 = MTLogForCategory(3);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      id v7 = *v2;
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ loading alarms", buf, 0xCu);
    }

    id v8 = [*v2 persistence];
    v5 = [v8 objectForKey:@"MTAlarms"];

    __int16 v9 = [*v2 persistence];
    [v9 floatForKey:@"MTAlarmStorageVersion"];
    float v11 = v10;

    v12 = [*v2 persistence];
    id v13 = [v12 objectForKey:@"MTAlarmModifiedDate"];

    uint64_t v14 = objc_opt_new();
    id v15 = (void *)*((void *)*v2 + 2);
    *((void *)*v2 + 2) = v14;

    uint64_t v16 = objc_opt_new();
    id v17 = (void *)*((void *)*v2 + 3);
    *((void *)*v2 + 3) = v16;

    if (v11 < 1.0)
    {
      int v18 = MTLogForCategory(3);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migration needed", buf, 0xCu);
      }

      __int16 v20 = MTLogForCategory(3);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ To set as a marker we are hitting here with updated root", buf, 0xCu);
      }

      [*((id *)*v2 + 7) migrateFromOldStorage];
      uint64_t v22 = [*((id *)*v2 + 7) alarms];
      v23 = [*((id *)*v2 + 7) sleepAlarm];
      v24 = (void *)MEMORY[0x1E4F1CBF0];
      BOOL v25 = 1;
LABEL_92:
      v73 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_74;
      block[3] = &unk_1E59150A8;
      block[4] = *v2;
      dispatch_async(v73, block);

      objc_msgSend(*v2, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:", v22, v24, 0, v25, 0);
      if (v11 < 1.0) {
        [*((id *)*v2 + 7) removeFromOldStorage];
      }
      v74 = MTLogForCategory(3);
      BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG);

      v76 = MTLogForCategory(3);
      v77 = v76;
      if (v75)
      {
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
          __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        id v78 = *v2;
        uint64_t v79 = [*((id *)*v2 + 2) count];
        uint64_t v80 = [*((id *)*v2 + 3) count];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v78;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2050;
        v96 = (void *)v80;
        _os_log_impl(&dword_19CC95000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded %{public}ld alarms, %{public}ld sleep alarms", buf, 0x20u);
      }

      v81 = v13;
      if (!v13)
      {
        v81 = (*(void (**)(void))(*((void *)*v2 + 9) + 16))();
      }
      objc_storeStrong((id *)*v2 + 4, v81);
      if (!v13) {

      }
      goto LABEL_104;
    }
    if (!v5)
    {
      v36 = MTLogForCategory(3);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_19CC95000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ has no alarms", buf, 0xCu);
      }

      BOOL v25 = 0;
      v23 = 0;
      v24 = (void *)MEMORY[0x1E4F1CBF0];
      uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_92;
    }
    if (v11 < 2.2)
    {
      v27 = MTLogForCategory(3);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ clean-up needed", buf, 0xCu);
      }

      [*((id *)*v2 + 7) cleanUpOldNotifications];
    }
    if (v11 >= 2.0)
    {
      objc_opt_class();
      v38 = v5;
      if (objc_opt_isKindOfClass()) {
        v39 = v38;
      }
      else {
        v39 = 0;
      }
      v33 = v39;

      v86 = [[MTStorageReader alloc] initWithEncodedDictionary:v33];
    }
    else
    {
      id v29 = MTLogForCategory(3);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ binary data storage version detected.  Using old reader.", buf, 0xCu);
      }

      objc_opt_class();
      id v31 = v5;
      if (objc_opt_isKindOfClass()) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = 0;
      }
      v33 = v32;

      id v89 = 0;
      v86 = (MTStorageReader *)[[MTStorageReaderV1 alloc] initForReadingFromData:v33 error:&v89];
      id v34 = v89;
      if (v34)
      {
        v35 = MTLogForCategory(3);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_2(v2);
        }
      }
    }

    uint64_t v22 = [(MTStorageReader *)v86 decodeObjectForKey:@"MTAlarms"];
    v23 = [(MTStorageReader *)v86 decodeObjectForKey:@"MTSleepAlarm"];
    v24 = [(MTStorageReader *)v86 decodeObjectForKey:@"MTSleepAlarms"];
    BOOL v25 = v11 < 2.3;
    if (v11 < 2.3)
    {
      uint64_t v40 = [*v2 _cleanUpForInternalBuild:v23];

      v23 = (void *)v40;
    }
    if (v11 < 2.5)
    {
      uint64_t v41 = [*v2 _cleanUpSnoozeFireDate:v23];

      BOOL v25 = 1;
      v23 = (void *)v41;
    }
    if (v11 < 2.6)
    {
      v42 = [*v2 scheduler];
      [v42 cleanDeliveredNotifications];

      BOOL v25 = 1;
    }
    if (v11 < 2.7)
    {
      [*((id *)*v2 + 7) cleanUpOldNotifications];
      BOOL v25 = 1;
    }
    if (v23)
    {
      if (![v23 repeatSchedule])
      {
        uint64_t v43 = [*v2 _cleanUpSleepAlarmRepeat:v23];

        BOOL v25 = 1;
        v23 = (void *)v43;
      }
      if (v11 >= 3.1) {
        goto LABEL_53;
      }
      if (v23)
      {
        v44 = MTLogForCategory(3);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = *v2;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          _os_log_impl(&dword_19CC95000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating sleep alarm: %{public}@ ", buf, 0x16u);
        }

        v94 = v23;
        uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];

        v47 = [*v2 persistence];
        v48 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
        [v47 setObject:v48 forKey:@"MTNeedsSleepMigration"];

        BOOL v25 = 1;
        v24 = (void *)v46;
        goto LABEL_53;
      }
    }
    else
    {
      v23 = 0;
      if (v11 >= 3.1) {
        goto LABEL_53;
      }
    }
    BOOL v25 = 1;
LABEL_53:
    if (v11 < 3.2 && MTShouldHandleForEucalyptus())
    {
      if (v23)
      {
        uint64_t v90 = 0;
        v91 = &v90;
        uint64_t v92 = 0x2050000000;
        v49 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
        uint64_t v93 = getBMDiscoverabilitySignalEventClass_softClass;
        if (!getBMDiscoverabilitySignalEventClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getBMDiscoverabilitySignalEventClass_block_invoke;
          v96 = &unk_1E5914EC0;
          v97 = &v90;
          __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)buf);
          v49 = (void *)v91[3];
        }
        v50 = v49;
        _Block_object_dispose(&v90, 8);
        id v51 = [v50 alloc];
        v52 = [MEMORY[0x1E4F28B50] mainBundle];
        v53 = [v52 bundleIdentifier];
        v54 = [v51 initWithIdentifier:@"com.apple.mobiletimer.bedtime.migration.done" bundleID:v53 context:0];

        uint64_t v90 = 0;
        v91 = &v90;
        uint64_t v92 = 0x2050000000;
        v55 = (void *)getBMStreamsClass_softClass;
        uint64_t v93 = getBMStreamsClass_softClass;
        if (!getBMStreamsClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getBMStreamsClass_block_invoke;
          v96 = &unk_1E5914EC0;
          v97 = &v90;
          __getBMStreamsClass_block_invoke((uint64_t)buf);
          v55 = (void *)v91[3];
        }
        id v56 = v55;
        _Block_object_dispose(&v90, 8);
        v57 = [v56 discoverabilitySignal];
        v58 = [v57 source];

        [v58 sendEvent:v54];
        v59 = MTLogForCategory(3);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          id v60 = *v2;
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v60;
          _os_log_impl(&dword_19CC95000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ Donate signal for existing bedtime", buf, 0xCu);
        }
      }
      else
      {
        v54 = MTLogForCategory(3);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v61 = *v2;
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v61;
          _os_log_impl(&dword_19CC95000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Don't donate signal because no existing bedtime", buf, 0xCu);
        }
      }

      BOOL v25 = 1;
    }
    if (v11 < 3.3 && MTShouldHandleForEucalyptus())
    {
      v85 = [MEMORY[0x1E4F5F648] serviceForClientIdentifier:@"com.apple.mobiletimer.bedtime-mode"];
      id v88 = 0;
      v84 = [v85 invalidateActiveModeAssertionWithError:&v88];
      id v62 = v88;
      v83 = v62;
      if (v84) {
        BOOL v63 = v62 == 0;
      }
      else {
        BOOL v63 = 0;
      }
      int v64 = !v63;
      v65 = MTLogForCategory(3);
      v66 = v65;
      if (v64)
      {
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          id v67 = *v2;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v67;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v85;
          *(_WORD *)&buf[22] = 2114;
          v96 = v83;
          _os_log_error_impl(&dword_19CC95000, v66, OS_LOG_TYPE_ERROR, "%{public}@ Failed to release assertion with %{public}@, failure error:%{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        id v68 = *v2;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v68;
        _os_log_impl(&dword_19CC95000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully released assertion", buf, 0xCu);
      }
    }
    if (v11 < 3.4) {
      [*v2 _resetCurrentToneIdentifier];
    }
    if (v11 < 3.5) {
      [*v2 _clearOutInvalidToneIdentifiers];
    }
    if (MTIdiomIpad())
    {
      if (MTShouldHandleForEucalyptus())
      {
        if (v23 || ([v24 firstObject], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v69 = objc_msgSend(*v2, "_convertSleepAlarmToRegular:", v23, v83);
          uint64_t v70 = [v22 arrayByAddingObject:v69];

          v71 = MTLogForCategory(3);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            id v72 = *v2;
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v72;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2114;
            v96 = v69;
            _os_log_impl(&dword_19CC95000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating sleep alarm: %{public}@ to regular: %{public}@", buf, 0x20u);
          }

          v24 = (void *)MEMORY[0x1E4F1CBF0];
          uint64_t v22 = (void *)v70;
        }
      }
    }

    goto LABEL_92;
  }
  if (v6)
  {
    id v26 = *v2;
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v26;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ persistence is nil", buf, 0xCu);
  }
LABEL_104:

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_74(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) clearInvalidPendingNotifications];
}

- (void)_queue_resetAlarmsTo:(id)a3 sleepAlarms:(id)a4
{
  orderedAlarms = self->_orderedAlarms;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableArray *)orderedAlarms removeAllObjects];
  [(NSMutableArray *)self->_sleepAlarms removeAllObjects];
  __int16 v9 = self->_orderedAlarms;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke;
  v14[3] = &unk_1E5914D40;
  v14[4] = self;
  float v10 = objc_msgSend(v8, "na_filter:", v14);

  [(NSMutableArray *)v9 addObjectsFromArray:v10];
  sleepAlarms = self->_sleepAlarms;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_76;
  v13[3] = &unk_1E5914D40;
  v13[4] = self;
  v12 = objc_msgSend(v7, "na_filter:", v13);

  [(NSMutableArray *)sleepAlarms addObjectsFromArray:v12];
}

uint64_t __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSleepAlarm])
  {
    BOOL v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_cold_1(a1);
    }
  }
  uint64_t v5 = [v3 isSleepAlarm] ^ 1;

  return v5;
}

uint64_t __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isSleepAlarm] & 1) == 0)
  {
    BOOL v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_76_cold_1(a1);
    }
  }
  uint64_t v5 = [v3 isSleepAlarm];

  return v5;
}

- (void)setScheduler:(id)a3
{
  p_scheduler = &self->_scheduler;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scheduler);
  [WeakRetained setDelegate:0];

  objc_storeWeak((id *)p_scheduler, obj);
  [obj setDelegate:self];
}

- (NSArray)alarms
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __24__MTAlarmStorage_alarms__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  __int16 v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __24__MTAlarmStorage_alarms__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  return dispatch_semaphore_signal(v5);
}

- (MTAlarm)sleepAlarm
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__MTAlarmStorage_sleepAlarm__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  __int16 v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (MTAlarm *)v6;
}

intptr_t __28__MTAlarmStorage_sleepAlarm__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) firstObject];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  return dispatch_semaphore_signal(v5);
}

- (NSMutableArray)sleepAlarms
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__MTAlarmStorage_sleepAlarms__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  __int16 v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSMutableArray *)v6;
}

intptr_t __29__MTAlarmStorage_sleepAlarms__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allSleepAlarms");
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

- (NSArray)allAlarms
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__MTAlarmStorage_allAlarms__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  __int16 v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __27__MTAlarmStorage_allAlarms__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allAlarms");
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

- (id)_queue_allAlarms
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_orderedAlarms];
  [v3 addObjectsFromArray:self->_sleepAlarms];
  return v3;
}

- (id)_queue_allSleepAlarms
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_sleepAlarms];
  return v3;
}

- (NSDate)lastModifiedDate
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__MTAlarmStorage_lastModifiedDate__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  __int16 v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSDate *)v6;
}

intptr_t __34__MTAlarmStorage_lastModifiedDate__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  uint64_t v2 = a1[5];
  return dispatch_semaphore_signal(v2);
}

- (void)addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 alarmID];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    BOOL v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ adding alarm %{public}@", buf, 0x16u);
  }
  uint64_t v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Adding Alarm", buf, 2u);
  }

  uint64_t v14 = [(MTAlarmStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__MTAlarmStorage_addAlarm_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

uint64_t __49__MTAlarmStorage_addAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addAlarm:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 alarmID];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    BOOL v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm %{public}@", buf, 0x16u);
  }
  uint64_t v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Updating Alarm", buf, 2u);
  }

  uint64_t v14 = [(MTAlarmStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__MTAlarmStorage_updateAlarm_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

id __52__MTAlarmStorage_updateAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_updateAlarm:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = MTLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating %{public}@ with changes %{public}@", buf, 0x20u);
  }

  id v15 = MTLogForCategory(9);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Updating Alarm", buf, 2u);
  }

  id v16 = [(MTAlarmStorage *)self serializer];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__MTAlarmStorage_updateAlarmWithIdentifier_changeSet_withCompletion_source___block_invoke;
  v21[3] = &unk_1E5915BA0;
  v21[4] = self;
  id v22 = v10;
  id v24 = v13;
  id v25 = v12;
  id v23 = v11;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [v16 performBlock:v21];
}

uint64_t __76__MTAlarmStorage_updateAlarmWithIdentifier_changeSet_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 alarmID];
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing alarm %{public}@", buf, 0x16u);
  }
  id v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Removing Alarm", buf, 2u);
  }

  uint64_t v14 = [(MTAlarmStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__MTAlarmStorage_removeAlarm_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

uint64_t __52__MTAlarmStorage_removeAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarm:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing alarm with ID %{public}@", buf, 0x16u);
  }

  id v12 = [(MTAlarmStorage *)self serializer];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__MTAlarmStorage_removeAlarmWithIdentifier_withCompletion_source___block_invoke;
  v16[3] = &unk_1E5915148;
  v16[4] = self;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performBlock:v16];
}

uint64_t __66__MTAlarmStorage_removeAlarmWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmWithIdentifier:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)removeAllAlarmsForSource:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all alarms", buf, 0xCu);
  }

  id v6 = [(MTAlarmStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmStorage_removeAllAlarmsForSource___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

uint64_t __43__MTAlarmStorage_removeAllAlarmsForSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllAlarmsForSource:", *(void *)(a1 + 40));
}

- (void)setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MTLogForCategory(3);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  id v13 = MTLogForCategory(3);
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_debug_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ setting all alarms %{public}@, sleep alarms %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = self;
    _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ setting all alarms", buf, 0xCu);
  }

  id v15 = [(MTAlarmStorage *)self serializer];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__MTAlarmStorage_setAllAlarms_sleepAlarms_source___block_invoke;
  v19[3] = &unk_1E5915BC8;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  [v15 performBlock:v19];
}

uint64_t __50__MTAlarmStorage_setAllAlarms_sleepAlarms_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAllAlarms:sleepAlarms:source:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)updateSleepAlarms:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTAlarmStorage *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__MTAlarmStorage_updateSleepAlarms_source___block_invoke;
  v11[3] = &unk_1E5915078;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

void __43__MTAlarmStorage_updateSleepAlarms_source___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ setting sleep alarms %{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateSleepAlarmsFromExistingAlarms:", *(void *)(a1 + 40));
  id v6 = *(id **)(a1 + 32);
  id v7 = (void *)[v6[2] copy];
  objc_msgSend(v6, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:override:", v7, v5, *(void *)(a1 + 48), 1, 1, 0);
}

- (id)_queue_updateSleepAlarmsFromExistingAlarms:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sleepAlarms = self->_sleepAlarms;
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = sleepAlarms;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ transferring metadata from existing sleep alarms %{public}@", buf, 0x16u);
  }

  id v7 = [(NSMutableArray *)self->_sleepAlarms na_dictionaryWithKeyGenerator:&__block_literal_global_13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke_2;
  v11[3] = &unk_1E5915C10;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  uint64_t v9 = objc_msgSend(v4, "na_map:", v11);

  return v9;
}

uint64_t __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmIDString];
}

id __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 alarmIDString];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) transferMetadataForSleepAlarm:v3 fromPrevious:v6];
  }
  else
  {
    id v7 = v3;
  }
  id v8 = v7;

  return v8;
}

- (id)transferMetadataForSleepAlarm:(id)a3 fromPrevious:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  id v8 = [v6 firedDate];
  [v7 setFiredDate:v8];

  uint64_t v9 = [v6 dismissedDate];
  [v7 setDismissedDate:v9];

  objc_msgSend(v7, "setDismissedAction:", objc_msgSend(v6, "dismissedAction"));
  __int16 v10 = [v6 bedtimeFiredDate];
  [v7 setBedtimeFiredDate:v10];

  uint64_t v11 = [v6 bedtimeDismissedDate];
  [v7 setBedtimeDismissedDate:v11];

  objc_msgSend(v7, "setBedtimeDismissedAction:", objc_msgSend(v6, "bedtimeDismissedAction"));
  id v12 = [v6 snoozeFireDate];
  [v7 setSnoozeFireDate:v12];

  id v13 = [v6 bedtimeSnoozeFireDate];
  [v7 setBedtimeSnoozeFireDate:v13];

  id v14 = (void *)[v7 copy];
  id v15 = [(MTAlarmStorage *)self _applyNecessaryChangesFromExistingAlarm:v6 updatedAlarm:v14];

  return v15;
}

- (void)updateSleepAlarmsWithBlock:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTAlarmStorage *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke;
  v11[3] = &unk_1E5915C60;
  id v12 = v7;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

void __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke_2;
  v6[3] = &unk_1E5915C38;
  id v7 = *(id *)(a1 + 48);
  id v3 = objc_msgSend(v2, "na_map:", v6);
  id v4 = *(id **)(a1 + 32);
  uint64_t v5 = (void *)[v4[2] copy];
  objc_msgSend(v4, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:override:", v5, v3, *(void *)(a1 + 40), 1, 1, 0);
}

id __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

- (id)activeSleepAlarm
{
  uint64_t v2 = [(MTAlarmStorage *)self sleepAlarms];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_84);

  return v3;
}

uint64_t __34__MTAlarmStorage_activeSleepAlarm__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFiring]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isSnoozed];
  }

  return v3;
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = +[MTUserDefaults sharedUserDefaults];
  id v14 = v13;
  if (a4 == 1) {
    id v15 = @"MTBedtimeSnoozeDuration";
  }
  else {
    id v15 = @"MTAlarmSnoozeDuration";
  }
  if (a4 == 1) {
    uint64_t v16 = 10;
  }
  else {
    uint64_t v16 = 9;
  }
  uint64_t v17 = [v13 integerForKey:v15 defaultValue:v16];

  uint64_t v18 = MTLogForCategory(3);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543618;
    id v22 = v10;
    __int16 v23 = 2050;
    uint64_t v24 = v17;
    _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozing for %{public}lu minutes", (uint8_t *)&v21, 0x16u);
  }

  id v19 = (*((void (**)(void))self->_currentDateProvider + 2))();
  id v20 = [v19 dateByAddingTimeInterval:(double)(60 * v17)];

  [(MTAlarmStorage *)self snoozeAlarmWithIdentifier:v10 snoozeDate:v20 snoozeAction:a4 withCompletion:v12 source:v11];
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = MTLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v30 = self;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v33 = 2048;
    unint64_t v34 = a5;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozing alarm with ID %{public}@ and action %ld", buf, 0x20u);
  }

  uint64_t v17 = MTLogForCategory(9);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_INFO, "MTAlarmStorage - Snoozing Alarm", buf, 2u);
  }

  uint64_t v18 = [(MTAlarmStorage *)self serializer];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__MTAlarmStorage_snoozeAlarmWithIdentifier_snoozeDate_snoozeAction_withCompletion_source___block_invoke;
  v23[3] = &unk_1E5915C88;
  v23[4] = self;
  id v24 = v12;
  id v27 = v14;
  unint64_t v28 = a5;
  id v25 = v13;
  id v26 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [v18 performBlock:v23];
}

uint64_t __90__MTAlarmStorage_snoozeAlarmWithIdentifier_snoozeDate_snoozeAction_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6
{
  id currentDateProvider = self->_currentDateProvider;
  id v11 = (void (*)(void *))currentDateProvider[2];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v11(currentDateProvider);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [(MTAlarmStorage *)self dismissAlarmWithIdentifier:v14 dismissDate:v15 dismissAction:a4 withCompletion:v13 source:v12];
}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = MTLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = MTDismissAlarmActionDescription(a5);
    *(_DWORD *)buf = 138543874;
    __int16 v31 = self;
    __int16 v32 = 2114;
    id v33 = v12;
    __int16 v34 = 2114;
    uint64_t v35 = v17;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alarm with ID %{public}@ and action %{public}@", buf, 0x20u);
  }
  uint64_t v18 = MTLogForCategory(9);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_INFO, "MTAlarmStorage - Dismissing Alarm", buf, 2u);
  }

  id v19 = [(MTAlarmStorage *)self serializer];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __93__MTAlarmStorage_dismissAlarmWithIdentifier_dismissDate_dismissAction_withCompletion_source___block_invoke;
  v24[3] = &unk_1E5915C88;
  v24[4] = self;
  id v25 = v12;
  id v28 = v14;
  unint64_t v29 = a5;
  id v26 = v13;
  id v27 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  [v19 performBlock:v24];
}

uint64_t __93__MTAlarmStorage_dismissAlarmWithIdentifier_dismissDate_dismissAction_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)alarmWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTAlarmStorage *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__MTAlarmStorage_alarmWithIdentifier_withCompletion___block_invoke;
  v11[3] = &unk_1E5915120;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __53__MTAlarmStorage_alarmWithIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_alarmMatchingAlarmIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }
  return MEMORY[0x1F41817F8](v3, v2);
}

- (void)_queue_addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  if ([(MTAlarmStorage *)self _queue_hasMatchingAlarm:v8])
  {
    id v11 = MTLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _queue_addAlarm:withCompletion:source:]();
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Alarm already exists!";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v14 = [v12 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:1 userInfo:v13];

    id v15 = MTLogForCategory(9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Adding Alarm", v18, 2u);
    }
  }
  else
  {
    uint64_t v16 = [(MTAlarmStorage *)self _queuePersistAlarm:v8 replacingAlarm:0];

    uint64_t v19 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [(MTAlarmStorage *)self _notifyObserversForAlarmAdd:v17 source:v10];

    id v15 = MTLogForCategory(9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Adding Alarm", v18, 2u);
    }
    id v14 = 0;
    id v8 = (id)v16;
  }

  if (v9) {
    v9[2](v9, v14);
  }
}

- (void)_queue_updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = (void (**)(id, void *))a5;
  id v12 = a6;
  id v13 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:a3];
  id v14 = v13;
  if (v13)
  {
    id v15 = (void *)[v13 mutableCopy];
    [v15 applyChangesFromChangeSet:v10];
    id v16 = [(MTAlarmStorage *)self _queue_updateAlarm:v15 withCompletion:v11 source:v12];
  }
  else
  {
    uint64_t v17 = MTLogForCategory(3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:]();
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Alarm does not exist!";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v20 = [v18 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:2 userInfo:v19];

    id v21 = MTLogForCategory(9);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Updating Alarm", v22, 2u);
    }

    if (v11) {
      v11[2](v11, v20);
    }
  }
}

- (id)_queue_updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  id v11 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarm:v8];
  id v12 = v11;
  if (v11)
  {
    if ([v11 isSleepAlarm]) {
      uint64_t v13 = 11;
    }
    else {
      uint64_t v13 = 10;
    }
    uint64_t v37 = v13;
    if ((([v12 isSleepAlarm] & 1) != 0 || objc_msgSend(v12, "repeats"))
      && [v12 isFiring]
      && ([v8 isEnabled] & 1) == 0)
    {
      __int16 v31 = (*((void (**)(void))self->_currentDateProvider + 2))();
      __int16 v32 = MTLogForCategory(3);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [v12 alarmIDString];
        id v33 = [v12 firedDate];
        [v12 dismissedDate];
        *(_DWORD *)buf = 138544386;
        uint64_t v43 = self;
        __int16 v44 = 2114;
        id v45 = v36;
        __int16 v46 = 2114;
        v47 = v33;
        __int16 v48 = 2114;
        v49 = v31;
        uint64_t v51 = v50 = 2114;
        __int16 v34 = (void *)v51;
        _os_log_impl(&dword_19CC95000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ disabled while firing (%{public}@).  Dismissing: %{public}@ (last dismissed: %{public}@)", buf, 0x34u);
      }
      uint64_t v35 = [v8 mutableCopy];
      [(MTAlarmStorage *)self _queue_dismissMutableAlarm:v35 dismissDate:v31 dismissAction:v13];

      int v14 = 1;
      id v8 = (id)v35;
    }
    else
    {
      int v14 = 0;
    }
    id v15 = [(MTAlarmStorage *)self _queuePersistAlarm:v8 replacingAlarm:v12];
    id v16 = +[MTChangeSet changeSetWithChangesFromObject:v8 toObject:v15];
    uint64_t v17 = +[MTAlarm propertiesAffectingNotification];
    int v18 = [v16 hasChangesInProperties:v17];

    if (v18)
    {
      uint64_t v19 = MTLogForCategory(3);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v15 alarmIDString];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = self;
        __int16 v44 = 2114;
        id v45 = v20;
        _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ modified during save.  Notifying everyone.", buf, 0x16u);
      }
      id v21 = MTLogForCategory(3);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:]();
      }

      id v10 = 0;
    }
    uint64_t v41 = v15;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    uint64_t v40 = v12;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [(MTAlarmStorage *)self _notifyObserversForAlarmChange:v22 previousAlarms:v23 source:v10];

    if (v14) {
      [(MTAlarmStorage *)self _notifyObserversForAlarmDismiss:v15 dismissAction:v37 source:v10];
    }
    id v24 = MTLogForCategory(9);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v24, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Updating Alarm", buf, 2u);
    }

    id v25 = 0;
    if (v9) {
LABEL_21:
    }
      v9[2](v9, v25);
  }
  else
  {
    id v27 = MTLogForCategory(3);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:]();
    }

    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39 = @"Alarm does not exist!";
    unint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v25 = [v28 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:2 userInfo:v29];

    __int16 v30 = MTLogForCategory(9);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v30, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Updating Alarm", buf, 2u);
    }

    +[MTAnalytics sendCriticalEvent:@"Alarm storage - trying to update alarm that does not exist"];
    id v15 = 0;
    if (v9) {
      goto LABEL_21;
    }
  }

  return v15;
}

- (void)_queue_removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarm:a3];
  [(MTAlarmStorage *)self _queue_actuallyRemoveAlarm:v10 withCompletion:v9 source:v8];
}

- (void)_queue_removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:a3];
  [(MTAlarmStorage *)self _queue_actuallyRemoveAlarm:v10 withCompletion:v9 source:v8];
}

- (void)_queue_actuallyRemoveAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(MTAlarmStorage *)self _queuePersistAlarm:0 replacingAlarm:v8];

    v22[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(MTAlarmStorage *)self _notifyObserversForAlarmRemoval:v12 source:v10];

    uint64_t v13 = MTLogForCategory(9);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Removing Alarm", v19, 2u);
    }

    int v14 = 0;
    if (v9) {
LABEL_5:
    }
      v9[2](v9, v14);
  }
  else
  {
    id v15 = MTLogForCategory(3);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:]();
    }

    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v21 = @"Alarm does not exist!";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v14 = [v16 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:2 userInfo:v17];

    int v18 = MTLogForCategory(9);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Removing Alarm", v19, 2u);
    }

    +[MTAnalytics sendCriticalEvent:@"Alarm storage - trying to remove alarm that does not exist"];
    if (v9) {
      goto LABEL_5;
    }
  }
}

- (id)_queuePersistAlarm:(id)a3 replacingAlarm:(id)a4
{
  id v6 = a4;
  id v7 = [(MTAlarmStorage *)self _applyNecessaryChangesFromExistingAlarm:v6 updatedAlarm:a3];
  if (([v7 isSleepAlarm] & 1) != 0 || objc_msgSend(v6, "isSleepAlarm"))
  {
    p_sleepAlarms = &self->_sleepAlarms;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    p_sleepAlarms = &self->_orderedAlarms;
  }
  id v10 = *p_sleepAlarms;
  id v11 = v10;
  if (v6) {
    [(NSMutableArray *)v10 removeObject:v6];
  }
  if (v7) {
    [(NSMutableArray *)v11 addObject:v7];
  }
  [(MTAlarmStorage *)self _queue_persistAlarms];
  if (v9) {
    [(MTAlarmStorage *)self _queue_sortSleepAlarms];
  }
  else {
    [(MTAlarmStorage *)self _queue_sortAlarms];
  }
  if (v7) {
    id v12 = v7;
  }
  else {
    id v12 = v6;
  }
  id v13 = v12;

  return v13;
}

- (id)_applyNecessaryChangesFromExistingAlarm:(id)a3 updatedAlarm:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v7 mutableCopy];
  int v9 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [v8 setLastModifiedDate:v9];

  id v10 = +[MTChangeSet changeSetWithChangesFromObject:v6 toObject:v7];
  id v11 = [v10 changes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = MTLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:]();
    }
  }
  if ([v7 isSnoozed]) {
    int v14 = [v6 isSnoozed];
  }
  else {
    int v14 = 0;
  }
  if ([v7 isBedtimeSnoozed]) {
    int v15 = [v6 isBedtimeSnoozed];
  }
  else {
    int v15 = 0;
  }
  if ((v14 | v15) == 1)
  {
    if ([v7 isEnabled])
    {
      if (!v6
        || !v7
        || (+[MTAlarm propertiesAffectingSnooze],
            id v16 = objc_claimAutoreleasedReturnValue(),
            int v17 = [v10 hasChangesInProperties:v16],
            v16,
            !v17))
      {
        id v21 = [v7 keepOffUntilDate];
        id v22 = [v7 snoozeFireDate];
        int v23 = [v21 mtIsAfterOrSameAsDate:v22];

        if (!v23) {
          goto LABEL_29;
        }
        int v18 = MTLogForCategory(3);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        uint64_t v19 = [v7 alarmID];
        id v24 = [v7 keepOffUntilDate];
        int v27 = 138543618;
        id v28 = v19;
        __int16 v29 = 2114;
        __int16 v30 = v24;
        _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ was snoozed but early wake up was confirmed (%{public}@). Cancelling.", (uint8_t *)&v27, 0x16u);

        goto LABEL_24;
      }
      int v18 = MTLogForCategory(3);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v7 alarmID];
        int v27 = 138543362;
        id v28 = v19;
        uint64_t v20 = "%{public}@ was snoozed but had relevant changes. Cancelling.";
LABEL_20:
        _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, 0xCu);
LABEL_24:
      }
    }
    else
    {
      int v18 = MTLogForCategory(3);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v7 alarmID];
        int v27 = 138543362;
        id v28 = v19;
        uint64_t v20 = "%{public}@ was snoozed and isn't enabled anywhere. Cancelling.";
        goto LABEL_20;
      }
    }
LABEL_25:

    if (v14) {
      [v8 resetSnoozeFireDate];
    }
    if (v15)
    {
      [v8 setBedtimeSnoozeFireDate:0];
      id v25 = [v7 lastModifiedDate];
      [v8 setBedtimeDismissedDate:v25];

      [v8 setBedtimeDismissedAction:6];
    }
  }
LABEL_29:

  return v8;
}

- (void)_queue_removeAllAlarmsForSource:(id)a3
{
  orderedAlarms = self->_orderedAlarms;
  id v5 = a3;
  id v6 = (id)[(NSMutableArray *)orderedAlarms copy];
  [(MTAlarmStorage *)self _queue_resetAlarmsTo:MEMORY[0x1E4F1CBF0] sleepAlarms:MEMORY[0x1E4F1CBF0]];
  [(MTAlarmStorage *)self _queue_persistAlarms];
  [(MTAlarmStorage *)self _notifyObserversForAlarmRemoval:v6 source:v5];
}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5
{
}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7
{
}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7 override:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v39 = a5;
  id v16 = MTLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544642;
    uint64_t v52 = self;
    __int16 v53 = 2114;
    id v54 = v14;
    __int16 v55 = 2114;
    id v56 = v15;
    __int16 v57 = 1024;
    BOOL v58 = v10;
    __int16 v59 = 1024;
    BOOL v60 = v9;
    __int16 v61 = 1024;
    BOOL v62 = v8;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ setting alarms:%{public}@, sleep alarms: %{public}@, persist: %i, notify %i, override: %i", buf, 0x32u);
  }
  BOOL v37 = v9;
  BOOL v38 = v8;
  BOOL v36 = v10;

  int v17 = objc_opt_new();
  int v18 = objc_opt_new();
  uint64_t v19 = objc_opt_new();
  uint64_t v20 = objc_opt_new();
  orderedAlarms = self->_orderedAlarms;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke;
  v49[3] = &unk_1E5915CB0;
  id v22 = v20;
  id v50 = v22;
  [(NSMutableArray *)orderedAlarms na_each:v49];
  sleepAlarms = self->_sleepAlarms;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_2;
  v47[3] = &unk_1E5915CB0;
  id v24 = v22;
  id v48 = v24;
  [(NSMutableArray *)sleepAlarms na_each:v47];
  uint64_t v40 = v15;
  uint64_t v41 = v14;
  if ([v15 count])
  {
    id v25 = [v14 arrayByAddingObjectsFromArray:v15];
  }
  else
  {
    id v25 = v14;
  }
  id v26 = v25;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_3;
  v42[3] = &unk_1E5915CD8;
  id v27 = v24;
  id v43 = v27;
  id v28 = v18;
  id v44 = v28;
  id v29 = v19;
  id v45 = v29;
  id v30 = v17;
  id v46 = v30;
  objc_msgSend(v26, "na_each:", v42);
  uint64_t v31 = [v27 allValues];
  uint64_t v32 = [v30 count];
  uint64_t v33 = [v28 count] + v32;
  uint64_t v34 = -[v31 count];
  uint64_t v35 = MTLogForCategory(3);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v52 = self;
    __int16 v53 = 1024;
    LODWORD(v54) = v33 != v34;
    _os_log_impl(&dword_19CC95000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ setting alarms - needs update: %i", buf, 0x12u);
  }

  if (v38 || v33 != v34)
  {
    [(MTAlarmStorage *)self _queue_resetAlarmsTo:v41 sleepAlarms:v40];
    if (v36) {
      [(MTAlarmStorage *)self _queue_persistAlarms];
    }
    [(MTAlarmStorage *)self _queue_sortAlarms];
    if (v37)
    {
      [(MTAlarmStorage *)self _notifyObserversForAlarmRemoval:v31 source:v39];
      [(MTAlarmStorage *)self _notifyObserversForAlarmChange:v28 previousAlarms:v29 source:v39];
      [(MTAlarmStorage *)self _notifyObserversForAlarmAdd:v30 source:v39];
    }
  }
}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 alarmIDString];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 alarmIDString];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 alarmIDString];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    if (([v6 isEqualToAlarm:v9] & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v9];
      [*(id *)(a1 + 48) addObject:v6];
    }
    id v7 = *(void **)(a1 + 32);
    BOOL v8 = [v9 alarmIDString];
    [v7 removeObjectForKey:v8];
  }
  else
  {
    [*(id *)(a1 + 56) addObject:v9];
  }
}

- (void)_queue_snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void *))a6;
  id v15 = a7;
  id v16 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:v12];
  int v17 = v16;
  if (v16)
  {
    int v18 = (void *)[v16 mutableCopy];
    [v18 setEnabled:1];
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (a5 != 1)
      {
LABEL_21:
        uint64_t v31 = [(MTAlarmStorage *)self _queue_updateAlarm:v18 withCompletion:v14 source:v15];
        uint64_t v32 = (void *)v31;
        if (v31) {
          uint64_t v33 = (void *)v31;
        }
        else {
          uint64_t v33 = v18;
        }
        [(MTAlarmStorage *)self _notifyObserversForAlarmSnooze:v33 snoozeAction:a5 source:v15];
        uint64_t v34 = MTLogForCategory(9);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19CC95000, v34, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Snoozing Alarm", buf, 2u);
        }

        goto LABEL_27;
      }
      uint64_t v19 = [v18 bedtimeSnoozeFireDate];

      if (!v19)
      {
        [v18 setBedtimeSnoozeFireDate:v13];
        goto LABEL_21;
      }
      uint64_t v20 = MTLogForCategory(3);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v18 bedtimeSnoozeFireDate];
        *(_DWORD *)buf = 138543874;
        id v38 = v12;
        __int16 v39 = 2114;
        uint64_t v40 = v21;
        __int16 v41 = 2114;
        id v42 = v13;
        _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ has a bed-time snooze fire date of %{public}@ and we want to snooze until %{public}@.  Picking later date", buf, 0x20u);
      }
      id v22 = [v18 bedtimeSnoozeFireDate];
      int v23 = [v22 laterDate:v13];
      [v18 setBedtimeSnoozeFireDate:v23];
    }
    else
    {
      id v28 = [v18 snoozeFireDate];

      if (!v28)
      {
        [v18 setSnoozeFireDate:v13];
        goto LABEL_21;
      }
      id v29 = MTLogForCategory(3);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v18 snoozeFireDate];
        *(_DWORD *)buf = 138543874;
        id v38 = v12;
        __int16 v39 = 2114;
        uint64_t v40 = v30;
        __int16 v41 = 2114;
        id v42 = v13;
        _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ has a snooze fire date of %{public}@ and we want to snooze until %{public}@.  Picking later date", buf, 0x20u);
      }
      id v22 = [v18 snoozeFireDate];
      int v23 = [v22 laterDate:v13];
      [v18 setSnoozeFireDate:v23];
    }

    goto LABEL_21;
  }
  id v24 = MTLogForCategory(3);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[MTAlarmStorage _queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:]();
  }

  +[MTAnalytics sendCriticalEvent:@"Alarm storage - trying to snooze alarm that does not exist"];
  id v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v35 = *MEMORY[0x1E4F28568];
  BOOL v36 = @"Alarm does not exist!";
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  int v18 = [v25 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:2 userInfo:v26];

  if (v14)
  {
    id v27 = MTLogForCategory(9);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Snoozing Alarm", buf, 2u);
    }

    v14[2](v14, v18);
  }
LABEL_27:
}

- (void)_queue_dismissMutableAlarm:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (MTDismissAlarmActionIsForBedtime(a5))
  {
    [v8 setBedtimeDismissedDate:v9];
    [v8 setBedtimeDismissedAction:a5];
  }
  else if (MTDismissAlarmActionCountsAsWakeUp(a5))
  {
    [v8 setDismissedDate:v9];
    [v8 setDismissedAction:a5];
  }
  if (a5 - 5 <= 1)
  {
    [v8 setSnoozeFireDate:0];
    if (([v8 repeats] & 1) == 0 && (objc_msgSend(v8, "isSleepAlarm") & 1) == 0)
    {
      BOOL v10 = MTLogForCategory(3);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v8 alarmID];
        int v12 = 138543618;
        id v13 = self;
        __int16 v14 = 2114;
        id v15 = v11;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting non-repeating alarm %{public}@ to disabled", (uint8_t *)&v12, 0x16u);
      }
      [v8 setEnabled:0];
    }
  }
}

- (void)_queue_dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = (void (**)(id, void *))a6;
  id v15 = a7;
  uint64_t v16 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:v12];
  int v17 = v16;
  if (v16)
  {
    int v18 = (void *)[v16 mutableCopy];
    [(MTAlarmStorage *)self _queue_dismissMutableAlarm:v18 dismissDate:v13 dismissAction:a5];
    uint64_t v19 = MTLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v18;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissed alarm %{public}@ at %{public}@", buf, 0x20u);
    }

    uint64_t v20 = [(MTAlarmStorage *)self _queue_updateAlarm:v18 withCompletion:v14 source:v15];
    id v21 = (void *)v20;
    if (v20) {
      id v22 = (void *)v20;
    }
    else {
      id v22 = v18;
    }
    [(MTAlarmStorage *)self _notifyObserversForAlarmDismiss:v22 dismissAction:a5 source:v15];
    int v23 = MTLogForCategory(9);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Dismissing Alarm", buf, 2u);
    }
  }
  else
  {
    id v24 = MTLogForCategory(3);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MTAlarmStorage _queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:]();
    }

    +[MTAnalytics sendCriticalEvent:@"Alarm storage - trying to dismiss alarm that does not exist"];
    id v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v29 = @"Alarm does not exist!";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    int v18 = [v25 errorWithDomain:@"com.apple.mobiletimerd.MTAlarmStorage" code:2 userInfo:v26];

    if (v14)
    {
      id v27 = MTLogForCategory(9);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Dismissing Alarm", buf, 2u);
      }

      v14[2](v14, v18);
    }
  }
}

- (void)_queue_sortAlarms
{
  orderedAlarms = self->_orderedAlarms;
  MTAlarmStandardSort();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)orderedAlarms sortUsingComparator:v3];
}

- (void)_queue_sortSleepAlarms
{
  sleepAlarms = self->_sleepAlarms;
  MTAlarmStandardSort();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)sleepAlarms sortUsingComparator:v3];
}

- (void)registerObserver:(id)a3
{
}

- (void)_notifyObserversWithBlock:(id)a3
{
}

- (void)_notifyObserversForAlarmAdd:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]
    && ((objc_opt_respondsToSelector() & 1) == 0 || ([v7 dontNotify] & 1) == 0))
  {
    id v8 = MTLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm addition", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__MTAlarmStorage__notifyObserversForAlarmAdd_source___block_invoke;
    v9[3] = &unk_1E5915D00;
    id v10 = v7;
    id v11 = v6;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v9];
  }
}

uint64_t __53__MTAlarmStorage__notifyObserversForAlarmAdd_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didAddAlarms:*(void *)(a1 + 40)];
}

- (void)_notifyObserversForAlarmChange:(id)a3 previousAlarms:(id)a4 source:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count]
    && ((objc_opt_respondsToSelector() & 1) == 0 || ([v10 dontNotify] & 1) == 0))
  {
    id v11 = MTLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v17 = self;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm change", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__MTAlarmStorage__notifyObserversForAlarmChange_previousAlarms_source___block_invoke;
    v12[3] = &unk_1E5915D28;
    id v13 = v10;
    id v14 = v8;
    id v15 = v9;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v12];
  }
}

void __71__MTAlarmStorage__notifyObserversForAlarmChange_previousAlarms_source___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 source:a1[4] didUpdateAlarms:a1[5]];
  if (objc_opt_respondsToSelector()) {
    [v3 source:a1[4] didUpdateAlarms:a1[5] previousAlarms:a1[6]];
  }
}

- (void)_notifyObserversForAlarmRemoval:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]
    && ((objc_opt_respondsToSelector() & 1) == 0 || ([v7 dontNotify] & 1) == 0))
  {
    id v8 = MTLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm removal", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__MTAlarmStorage__notifyObserversForAlarmRemoval_source___block_invoke;
    v9[3] = &unk_1E5915D00;
    id v10 = v7;
    id v11 = v6;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v9];
  }
}

uint64_t __57__MTAlarmStorage__notifyObserversForAlarmRemoval_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didRemoveAlarms:*(void *)(a1 + 40)];
}

- (void)_notifyObserversForAlarmSnooze:(id)a3 snoozeAction:(unint64_t)a4 source:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v9 dontNotify] & 1) == 0)
  {
    id v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm snooze", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__MTAlarmStorage__notifyObserversForAlarmSnooze_snoozeAction_source___block_invoke;
    v11[3] = &unk_1E5915D50;
    id v12 = v9;
    id v13 = v8;
    unint64_t v14 = a4;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v11];
  }
}

uint64_t __69__MTAlarmStorage__notifyObserversForAlarmSnooze_snoozeAction_source___block_invoke(void *a1, void *a2)
{
  return [a2 source:a1[4] didSnoozeAlarm:a1[5] snoozeAction:a1[6]];
}

- (void)_notifyObserversForAlarmDismiss:(id)a3 dismissAction:(unint64_t)a4 source:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v9 dontNotify] & 1) == 0)
  {
    id v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm dismissal", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MTAlarmStorage__notifyObserversForAlarmDismiss_dismissAction_source___block_invoke;
    v11[3] = &unk_1E5915D50;
    id v12 = v9;
    id v13 = v8;
    unint64_t v14 = a4;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v11];
  }
}

uint64_t __71__MTAlarmStorage__notifyObserversForAlarmDismiss_dismissAction_source___block_invoke(void *a1, void *a2)
{
  return [a2 source:a1[4] didDismissAlarm:a1[5] dismissAction:a1[6]];
}

- (void)_notifyObserversForAlarmFire:(id)a3 triggerType:(unint64_t)a4 source:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v9 dontNotify] & 1) == 0)
  {
    id v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm fire", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__MTAlarmStorage__notifyObserversForAlarmFire_triggerType_source___block_invoke;
    v11[3] = &unk_1E5915D50;
    id v12 = v9;
    id v13 = v8;
    unint64_t v14 = a4;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v11];
  }
}

uint64_t __66__MTAlarmStorage__notifyObserversForAlarmFire_triggerType_source___block_invoke(void *a1, void *a2)
{
  return [a2 source:a1[4] didFireAlarm:a1[5] triggerType:a1[6]];
}

- (void)_notifyObserversForNextAlarmChange:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v7 dontNotify] & 1) == 0)
  {
    id v8 = MTLogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for next alarm change", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__MTAlarmStorage__notifyObserversForNextAlarmChange_source___block_invoke;
    v9[3] = &unk_1E5915D00;
    id v10 = v7;
    id v11 = v6;
    [(MTAlarmStorage *)self _notifyObserversWithBlock:v9];
  }
}

uint64_t __60__MTAlarmStorage__notifyObserversForNextAlarmChange_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didChangeNextAlarm:*(void *)(a1 + 40)];
}

- (void)scheduler:(id)a3 didChangeNextAlarm:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTAlarmStorage - Next Alarm Changed", v10, 2u);
  }

  id v9 = [v6 scheduleable];

  [(MTAlarmStorage *)self _notifyObserversForNextAlarmChange:v9 source:v7];
}

- (void)scheduler:(id)a3 didFireAlarm:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory(9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "MTAlarmStorage - Fired Alarm", v11, 2u);
  }

  id v9 = [v6 scheduleable];
  id v10 = [v6 trigger];

  -[MTAlarmStorage _notifyObserversForAlarmFire:triggerType:source:](self, "_notifyObserversForAlarmFire:triggerType:source:", v9, [v10 triggerType], v7);
}

- (id)_queue_alarmMatchingAlarm:(id)a3
{
  id v4 = [a3 alarmIDString];
  id v5 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:v4];

  return v5;
}

- (id)_queue_alarmMatchingAlarmIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAlarmStorage *)self _queue_allAlarms];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MTAlarmStorage__queue_alarmMatchingAlarmIdentifier___block_invoke;
  v9[3] = &unk_1E5914D40;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __54__MTAlarmStorage__queue_alarmMatchingAlarmIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_queue_hasMatchingAlarm:(id)a3
{
  uint64_t v4 = [a3 alarmID];
  id v5 = [v4 UUIDString];
  id v6 = [(MTAlarmStorage *)self _queue_alarmMatchingAlarmIdentifier:v5];

  return v6 != 0;
}

- (void)_queue_persistAlarms
{
  id v3 = [(MTAlarmStorage *)self persistence];

  if (v3)
  {
    id v10 = (id)objc_opt_new();
    [v10 encodeObject:self->_orderedAlarms forKey:@"MTAlarms"];
    [v10 encodeObject:self->_sleepAlarms forKey:@"MTSleepAlarms"];
    uint64_t v4 = [v10 encodedDictionary];
    id v5 = [(MTAlarmStorage *)self persistence];
    [v5 setObject:v4 forKey:@"MTAlarms"];

    id v6 = [(MTAlarmStorage *)self persistence];
    LODWORD(v7) = 3.5;
    [v6 setFloat:@"MTAlarmStorageVersion" forKey:v7];

    id v8 = [(MTAlarmStorage *)self persistence];
    id v9 = (*((void (**)(void))self->_currentDateProvider + 2))();
    [v8 setObject:v9 forKey:@"MTAlarmModifiedDate"];
  }
}

- (void)handleMigrationFinish
{
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected, rescheduling alarms", buf, 0xCu);
  }

  double v7 = [(MTAlarmStorage *)self serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__MTAlarmStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E59150D0;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 performBlock:v9];
}

void __81__MTAlarmStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  __int16 v41 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_queue_allAlarms");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v40 = *(void *)v43;
    id v38 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v42 + 1) + 8 * i);
        double v7 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
        id v8 = [v6 firedDate];
        int v9 = [v8 mtIsAfterDate:v7];

        id v10 = v6;
        if (v9)
        {
          id v11 = MTLogForCategory(3);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = *(void *)(a1 + 32);
            uint64_t v13 = [v6 alarmID];
            *(_DWORD *)buf = 138543618;
            uint64_t v47 = v12;
            __int16 v48 = 2114;
            v49 = v13;
            _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting firedDate on %{public}@ because it's in the future", buf, 0x16u);
          }
          id v10 = (void *)[v6 mutableCopy];
          [v10 setFiredDate:0];
          uint64_t v14 = [v6 dismissedDate];
          int v15 = [v14 mtIsAfterDate:v7];

          if (v15)
          {
            uint64_t v16 = MTLogForCategory(3);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = *(void *)(a1 + 32);
              uint64_t v18 = [v6 alarmID];
              *(_DWORD *)buf = 138543618;
              uint64_t v47 = v17;
              __int16 v48 = 2114;
              v49 = v18;
              _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting dismissedDate on %{public}@ because it's in the future", buf, 0x16u);
            }
            [v10 setDismissedDate:0];
          }
        }
        uint64_t v19 = objc_msgSend(v6, "bedtimeFiredDate", v38);
        int v20 = [v19 mtIsAfterDate:v7];

        if (v20)
        {
          id v21 = MTLogForCategory(3);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = *(void *)(a1 + 32);
            int v23 = [v6 alarmID];
            *(_DWORD *)buf = 138543618;
            uint64_t v47 = v22;
            __int16 v48 = 2114;
            v49 = v23;
            _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting bedtimeFiredDate on %{public}@ because it's in the future", buf, 0x16u);
          }
          id v24 = (void *)[v10 mutableCopy];
          [v24 setBedtimeFiredDate:0];
          id v25 = [v6 bedtimeDismissedDate];
          int v26 = [v25 mtIsAfterDate:v7];

          if (v26)
          {
            id v27 = MTLogForCategory(3);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = *(void *)(a1 + 32);
              id v29 = [v6 alarmID];
              *(_DWORD *)buf = 138543618;
              uint64_t v47 = v28;
              uint64_t v2 = v38;
              __int16 v48 = 2114;
              v49 = v29;
              _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting bedtimeDismissedDate on %{public}@ because it's in the future", buf, 0x16u);
            }
            [v24 setBedtimeDismissedDate:0];
          }
        }
        else
        {
          id v24 = v10;
        }
        id v30 = [v6 lastModifiedDate];
        int v31 = [v30 mtIsAfterDate:v7];

        if (v31)
        {
          __int16 v32 = MTLogForCategory(3);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            __int16 v34 = [v6 alarmID];
            *(_DWORD *)buf = 138543618;
            uint64_t v47 = v33;
            uint64_t v2 = v38;
            __int16 v48 = 2114;
            v49 = v34;
            _os_log_impl(&dword_19CC95000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting lastModifiedDate on %{public}@ because it's in the future", buf, 0x16u);
          }
          id v35 = (void *)[v24 mutableCopy];
          [v35 setLastModifiedDate:v7];

          id v24 = v35;
        }
        if ([v6 isSleepAlarm]) {
          uint64_t v36 = v41;
        }
        else {
          uint64_t v36 = v2;
        }
        [v36 addObject:v24];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_setAllAlarms:sleepAlarms:source:persist:notify:", v2, v41, 0, 1, 0);
  BOOL v37 = [*(id *)(a1 + 32) scheduler];
  [v37 rescheduleAlarmsWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"com.apple.mobiletimerd.reset", a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  int v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ handling notification %{public}@", (uint8_t *)&v10, 0x16u);
  }

  [(MTAlarmStorage *)self removeAllAlarmsForSource:0];
  if (v8) {
    v8[2](v8);
  }
}

- (void)printDiagnostics
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmStorage-----", (uint8_t *)&v10, 2u);
  }

  uint64_t v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTAlarmStorage *)self _diagnosticDictionaryForAlarms:self->_orderedAlarms];
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Alarms: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MTAlarmStorage *)self _diagnosticDictionaryForAlarms:self->_sleepAlarms];
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Sleep Alarms: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  id v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(MTAlarmStorage *)self lastModifiedDate];
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "Last Modified: %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"Alarms";
  uint64_t v3 = [(MTAlarmStorage *)self _diagnosticDictionaryForAlarms:self->_orderedAlarms];
  v9[0] = v3;
  v8[1] = @"Sleep Alarms";
  uint64_t v4 = [(MTAlarmStorage *)self _diagnosticDictionaryForAlarms:self->_sleepAlarms];
  v9[1] = v4;
  v8[2] = @"Alarms Last Modified";
  id v5 = [(MTAlarmStorage *)self lastModifiedDate];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)_diagnosticDictionaryForAlarms:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [(MTAlarmStorage *)self serializer];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__MTAlarmStorage__diagnosticDictionaryForAlarms___block_invoke;
  v14[3] = &unk_1E5915BC8;
  id v15 = v4;
  id v8 = v5;
  id v16 = v8;
  uint64_t v17 = self;
  dispatch_semaphore_t v18 = v6;
  int v9 = v6;
  id v10 = v4;
  [v7 performBlock:v14];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v11 = v18;
  id v12 = v8;

  return v12;
}

intptr_t __49__MTAlarmStorage__diagnosticDictionaryForAlarms___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        id v8 = objc_msgSend((id)objc_opt_class(), "_diagnosticDictionaryForAlarm:", v7, (void)v12);
        int v9 = *(void **)(a1 + 40);
        id v10 = [v7 alarmIDString];
        [v9 setObject:v8 forKeyedSubscript:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

+ (id)_diagnosticDictionaryForAlarm:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "isEnabled"));
  [v4 setObject:v5 forKeyedSubscript:@"enabled"];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "hour"));
  [v4 setObject:v6 forKeyedSubscript:@"hour"];

  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "minute"));
  [v4 setObject:v7 forKeyedSubscript:@"minute"];

  if ([v3 isSleepAlarm])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "bedtimeHour"));
    [v4 setObject:v8 forKeyedSubscript:@"bedtimeHour"];

    int v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "bedtimeMinute"));
    [v4 setObject:v9 forKeyedSubscript:@"bedtimeMinute"];
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "isFiring"));
  [v4 setObject:v10 forKeyedSubscript:@"firing"];

  uint64_t v11 = [v3 firedDate];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  else {
    long long v13 = @"None";
  }
  [v4 setObject:v13 forKeyedSubscript:@"fired"];

  uint64_t v14 = [v3 lastModifiedDate];
  long long v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = @"None";
  }
  [v4 setObject:v16 forKeyedSubscript:@"modified"];

  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "isSnoozed"));
  [v4 setObject:v17 forKeyedSubscript:@"snoozed"];

  dispatch_semaphore_t v18 = NSString;
  uint64_t v28 = [v3 sound];
  uint64_t v19 = [v28 toneIdentifier];
  int v20 = [v3 sound];
  id v21 = [v20 mediaItemIdentifier];
  uint64_t v22 = [v3 sound];
  int v23 = [v22 vibrationIdentifier];
  id v24 = [v3 sound];
  id v25 = [v24 soundVolume];
  int v26 = [v18 stringWithFormat:@"toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@", v19, v21, v23, v25];
  [v4 setObject:v26 forKeyedSubscript:@"sound"];

  return v4;
}

- (void)_removeAlarmDataIfNecessary:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"com.apple.mobiletimer";
  if (([a3 isEqualToString:v5] & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), id v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 isApplicationInstalledForBundleIdentifier:v5], v8, (v9 & 1) == 0))
  {
    uint64_t v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v12 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all alarms (sans sleep)", buf, 0xCu);
    }

    id v7 = [(MTAlarmStorage *)self serializer];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__MTAlarmStorage__removeAlarmDataIfNecessary___block_invoke;
    v10[3] = &unk_1E59150A8;
    v10[4] = self;
    [v7 performBlock:v10];
  }
}

void __46__MTAlarmStorage__removeAlarmDataIfNecessary___block_invoke(uint64_t a1)
{
  __int16 v1 = *(id **)(a1 + 32);
  id v2 = (id)[v1[3] copy];
  objc_msgSend(v1, "_queue_setAllAlarms:sleepAlarms:source:", MEMORY[0x1E4F1CBF0], v2, 0);
}

- (NSMutableArray)orderedAlarms
{
  return self->_orderedAlarms;
}

- (void)setOrderedAlarms:(id)a3
{
}

- (void)setSleepAlarms:(id)a3
{
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void)setSerializer:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MTAlarmMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_orderedAlarms, 0);
  objc_destroyWeak((id *)&self->_scheduler);
}

- (void)_cleanUpSnoozeFireDate:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ cleaning up snooze fire date for sleep alarm %{public}@");
}

- (void)_cleanUpSleepAlarmRepeat:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ cleaning up repeat schedule for sleep alarm %{public}@");
}

void __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ loaded %{public}@, sleep alarms %{public}@", v4, 0x20u);
}

void __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ unexpected error reading data %{public}@", (void)v3, DWORD2(v3));
}

void __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ ignoring misplaced sleep alarm %{public}@", (void)v3, DWORD2(v3));
}

void __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_76_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ ignoring misplaced regular alarm %{public}@", (void)v3, DWORD2(v3));
}

- (void)_queue_addAlarm:withCompletion:source:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_1(&dword_19CC95000, v0, v1, "Alarm already exists", v2, v3, v4, v5, v6);
}

- (void)_queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_1(&dword_19CC95000, v0, v1, "Alarm doesn't exist", v2, v3, v4, v5, v6);
}

- (void)_queue_updateAlarm:withCompletion:source:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_19CC95000, v0, v1, "%{public}@ Changes: %{public}@");
}

- (void)_queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ couldn't find matching alarm to snooze for %{public}@");
}

- (void)_queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ couldn't find matching alarm to dismiss for %{public}@");
}

@end