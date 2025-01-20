@interface HKSPSleepStore
+ (id)_sleepDisabledError;
+ (id)_updatedHistoricalSleepGoalForSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5;
+ (id)_updatedHistoricalSleepSchedulesFromSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5;
- (BOOL)_cachingEnabled;
- (BOOL)_connectAutomatically;
- (BOOL)_observeSleepFocusMode;
- (BOOL)_reloadsWidgets;
- (BOOL)_resultHasSchedule:(id)a3;
- (BOOL)_resultScheduleIsValid:(id)a3;
- (BOOL)_resultScheduleMeetsDefaultGoal:(id)a3;
- (BOOL)hasSleepFocusMode;
- (BOOL)shouldReloadWidgetOfKind:(id)a3;
- (BOOL)sleepModeOnWithError:(id *)a3;
- (HKHealthStore)healthStore;
- (HKSPAnalyticsManager)analyticsManager;
- (HKSPObserverSet)observers;
- (HKSPSleepFocusConfiguration)sleepFocusConfiguration;
- (HKSPSleepFocusModeBridge)sleepFocusModeBridge;
- (HKSPSleepStore)init;
- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6;
- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6 analyticsManager:(id)a7 throttlerProvider:(id)a8 callbackScheduler:(id)a9 sleepFocusModeBridgeProvider:(id)a10 widgetTimelineControllersProvider:(id)a11 widgetRelevanceControllerProvider:(id)a12 currentDateProvider:(id)a13;
- (HKSPSleepStore)initWithHealthStore:(id)a3;
- (HKSPSleepStore)initWithIdentifier:(id)a3;
- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4;
- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4 options:(unint64_t)a5;
- (HKSPSleepStoreExportedObject)sleepStoreExportedObject;
- (HKSPSleepStoreModelCache)sleepStoreCache;
- (HKSPSleepWidgetManager)widgetManager;
- (HKSPSyncAnchorContainer)syncAnchorContainer;
- (HKSPThrottler)reconnectThrottler;
- (HKSPXPCClientIdentifier)clientIdentifier;
- (HKSPXPCConnectionProvider)connectionProvider;
- (HKSleepHealthStore)sleepHealthStore;
- (NAScheduler)callbackScheduler;
- (NSString)description;
- (id)_clearWidgetOverrideOnServer;
- (id)_confirmAwakeOnServer;
- (id)_dismissGoodMorningOnServer;
- (id)_dismissSleepLockOnServer;
- (id)_getSleepEventRecordDoSync:(BOOL)a3;
- (id)_getSleepEventRecordFromServerDoSync:(BOOL)a3;
- (id)_getSleepModeDoSync:(BOOL)a3;
- (id)_getSleepModeFromServerDoSync:(BOOL)a3;
- (id)_getSleepScheduleDoSync:(BOOL)a3;
- (id)_getSleepScheduleFromServerDoSync:(BOOL)a3;
- (id)_getSleepScheduleModelDoSync:(BOOL)a3;
- (id)_getSleepScheduleModelFromServerDoSync:(BOOL)a3;
- (id)_getSleepScheduleStateFromServerDoSync:(BOOL)a3;
- (id)_getSleepScheduleStateOnDoSync:(BOOL)a3;
- (id)_getSleepSettingsDoSync:(BOOL)a3;
- (id)_getSleepSettingsFromServerDoSync:(BOOL)a3;
- (id)_getSleepWidgetStateFromServerDoSync:(BOOL)a3;
- (id)_prepareObjectForSave:(id)a3 options:(unint64_t)a4;
- (id)_publishNotificationOnServerWithIdentifier:(id)a3 userInfo:(id)a4;
- (id)_publishWakeUpResultsNotificationOnServer;
- (id)_saveCurrentSleepEventRecordOnServer:(id)a3 options:(unint64_t)a4;
- (id)_saveCurrentSleepScheduleOnServer:(id)a3 options:(unint64_t)a4;
- (id)_saveCurrentSleepSettingsOnServer:(id)a3 options:(unint64_t)a4;
- (id)_sendScheduleChangedAnalyticsWithContext:(id)a3;
- (id)_setLockScreenOverrideStateOnServerWithState:(int64_t)a3 userInfo:(id)a4;
- (id)_setSleepModeOnServer:(int64_t)a3 reason:(unint64_t)a4;
- (id)_setWidgetOverrideStateOnServerWithState:(int64_t)a3;
- (id)_sleepAlarmWasDismissedOnDateOnServer:(id)a3 source:(unint64_t)a4;
- (id)_sleepAlarmWasModifiedOnServer:(unint64_t)a3;
- (id)_sleepAlarmWasSnoozedUntilDateOnServer:(id)a3 source:(unint64_t)a4;
- (id)_writeHistoricalSchedule:(id)a3 options:(unint64_t)a4;
- (id)currentDateProvider;
- (id)currentSleepEventRecordFuture;
- (id)currentSleepEventRecordWithError:(id *)a3;
- (id)currentSleepScheduleFuture;
- (id)currentSleepScheduleStateFuture;
- (id)currentSleepScheduleWithError:(id *)a3;
- (id)currentSleepSettingsFuture;
- (id)currentSleepSettingsWithError:(id *)a3;
- (id)nextEventDueAfterDate:(id)a3 error:(id *)a4;
- (id)nextEventDueAfterDateFuture:(id)a3;
- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 error:(id *)a5;
- (id)nextEventWithIdentifierFuture:(id)a3 dueAfterDate:(id)a4;
- (id)saveCurrentSleepEventRecord:(id)a3;
- (id)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4;
- (id)saveCurrentSleepSchedule:(id)a3;
- (id)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5;
- (id)saveCurrentSleepSettings:(id)a3;
- (id)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4;
- (id)sleepModeFuture;
- (id)sleepModeOnFuture;
- (id)sleepScheduleModelFuture;
- (id)sleepScheduleModelWithError:(id *)a3;
- (id)sleepWidgetStateFuture;
- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5;
- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4;
- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5;
- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4;
- (id)upcomingScheduleOccurrenceAfterDateFuture:(id)a3;
- (int64_t)sleepModeWithError:(id *)a3;
- (int64_t)sleepWidgetStateWithError:(id *)a3;
- (unint64_t)currentSleepScheduleStateWithError:(id *)a3;
- (unint64_t)options;
- (void)_checkInWithCurrentSyncAnchor;
- (void)_notifyObserversForChangedSleepEventRecord:(id)a3;
- (void)_notifyObserversForChangedSleepMode:(int64_t)a3 reason:(unint64_t)a4;
- (void)_notifyObserversForChangedSleepSchedule:(id)a3;
- (void)_notifyObserversForChangedSleepScheduleState:(unint64_t)a3 reason:(unint64_t)a4;
- (void)_notifyObserversForChangedSleepSettings:(id)a3;
- (void)_notifyObserversForSleepEvent:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearWidgetOverrideWithCompletion:(id)a3;
- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4;
- (void)confirmAwakeWithCompletion:(id)a3;
- (void)connect;
- (void)connectSynchronously:(BOOL)a3;
- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4;
- (void)currentSleepEventRecordWithCompletion:(id)a3;
- (void)currentSleepScheduleStateWithCompletion:(id)a3;
- (void)currentSleepScheduleWithCompletion:(id)a3;
- (void)currentSleepSettingsWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteSleepFocusModeWithCompletion:(id)a3;
- (void)dismissGoodMorningWithCompletion:(id)a3;
- (void)dismissSleepLockWithCompletion:(id)a3;
- (void)nextEventDueAfterDate:(id)a3 completion:(id)a4;
- (void)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 completion:(id)a5;
- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3;
- (void)reconnect;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)saveCurrentSleepEventRecord:(id)a3 completion:(id)a4;
- (void)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)saveCurrentSleepSchedule:(id)a3 completion:(id)a4;
- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6;
- (void)saveCurrentSleepSettings:(id)a3 completion:(id)a4;
- (void)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4;
- (void)setSleepModeOn:(BOOL)a3 completion:(id)a4;
- (void)setSleepModeOn:(BOOL)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4;
- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4;
- (void)setSyncAnchorContainer:(id)a3;
- (void)setUpcomingWakeUpAlarmEnabled:(BOOL)a3 date:(id)a4 completion:(id)a5;
- (void)setWakeUpAlarmEnabled:(BOOL)a3 resolvedOccurrence:(id)a4 date:(id)a5 completion:(id)a6;
- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4;
- (void)skipUpcomingWakeUpAlarmForDate:(id)a3 completion:(id)a4;
- (void)sleepAlarmWasDismissedOnDate:(id)a3 completion:(id)a4;
- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4;
- (void)sleepAlarmWasModifiedWithCompletion:(id)a3;
- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 completion:(id)a4;
- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4;
- (void)sleepModeOnWithCompletion:(id)a3;
- (void)sleepModeWithCompletion:(id)a3;
- (void)sleepScheduleModelWithCompletion:(id)a3;
- (void)sleepWidgetStateWithCompletion:(id)a3;
- (void)suggestedSleepScheduleWithProviders:(id)a3 completion:(id)a4;
- (void)upcomingScheduleOccurrenceAfterDate:(id)a3 completion:(id)a4;
@end

@implementation HKSPSleepStore

- (HKSPSleepStore)initWithIdentifier:(id)a3
{
  return [(HKSPSleepStore *)self initWithIdentifier:a3 healthStore:0];
}

- (BOOL)hasSleepFocusMode
{
  v2 = [(HKSPSleepStore *)self sleepFocusConfiguration];
  char v3 = [v2 hasSleepFocusMode];

  return v3;
}

- (HKSPSleepFocusConfiguration)sleepFocusConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v3 = [(HKSPSleepStore *)self sleepFocusModeBridge];

  if (v3)
  {
    v4 = [(HKSPSleepStore *)self sleepFocusModeBridge];
    id v10 = 0;
    v5 = [v4 sleepFocusConfiguration:&v10];
    v6 = (HKSPSleepFocusConfiguration *)v10;

    v7 = HKSPLogForCategory(1uLL);
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v6;
        _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "%{public}@ error retrieving sleep focus config: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      __int16 v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepFocusConfiguration: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v5 = [[HKSPSleepFocusConfiguration alloc] initWithUUID:0 mirrorsFocusModes:0 state:0];
  }
  return v5;
}

- (HKSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (HKSPSleepStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v5 = HKSPGenerateSleepStoreIdentifier(&stru_1EFE54160);
  v6 = [(HKSPSleepStore *)self initWithIdentifier:v5 healthStore:v4];

  return v6;
}

- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4 options:(unint64_t)a5
{
  return [(HKSPSleepStore *)self initWithConnectionProviderProvider:&__block_literal_global_12 identifier:a3 healthStore:a4 options:a5];
}

- (HKSPSleepStore)initWithIdentifier:(id)a3 healthStore:(id)a4
{
  return [(HKSPSleepStore *)self initWithIdentifier:a3 healthStore:a4 options:0];
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HKSPXPCClientIdentifier *)self->_clientIdentifier loggingIdentifier];
  v7 = [v3 stringWithFormat:@"[%@.%@.%p]", v5, v6, self];

  return (NSString *)v7;
}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E5D32F80;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 getSleepEventRecordWithCompletion:v6];
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__HKSPSleepStore_connectSynchronously___block_invoke_2;
  v8[3] = &unk_1E5D32D50;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v6;
  id v9 = v7;
  [v5 connectWithCompletion:v8];

  objc_destroyWeak(&v10);
}

- (HKSPXPCClientIdentifier)clientIdentifier
{
  return self->_clientIdentifier;
}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E5D32F08;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 getSleepSettingsWithCompletion:v6];
}

- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6
{
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_2;
  v24 = &__block_descriptor_40_e33____HKSPSleepFocusModeBridge__8__0l;
  unint64_t v25 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  __int16 v13 = (void *)MEMORY[0x1AD0DD220](&v21);
  v14 = [HKSPAnalyticsManager alloc];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_analyticsUserDefaults");
  v16 = [(HKSPAnalyticsManager *)v14 initWithUserDefaults:v15];
  v17 = [MEMORY[0x1E4F7A0F0] hkspMainThreadScheduler];
  v18 = HKSPCurrentDateProvider();
  v19 = -[HKSPSleepStore initWithConnectionProviderProvider:identifier:healthStore:options:analyticsManager:throttlerProvider:callbackScheduler:sleepFocusModeBridgeProvider:widgetTimelineControllersProvider:widgetRelevanceControllerProvider:currentDateProvider:](self, "initWithConnectionProviderProvider:identifier:healthStore:options:analyticsManager:throttlerProvider:callbackScheduler:sleepFocusModeBridgeProvider:widgetTimelineControllersProvider:widgetRelevanceControllerProvider:currentDateProvider:", v12, v11, v10, a6, v16, &__block_literal_global_291, v17, v13, &__block_literal_global_300, &__block_literal_global_304, v18, v21, v22, v23, v24,
          v25);

  return v19;
}

- (HKSPSleepStore)initWithConnectionProviderProvider:(id)a3 identifier:(id)a4 healthStore:(id)a5 options:(unint64_t)a6 analyticsManager:(id)a7 throttlerProvider:(id)a8 callbackScheduler:(id)a9 sleepFocusModeBridgeProvider:(id)a10 widgetTimelineControllersProvider:(id)a11 widgetRelevanceControllerProvider:(id)a12 currentDateProvider:(id)a13
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v17 = (void (**)(id, HKSPSleepStore *))a3;
  id v18 = a4;
  id v61 = a5;
  id obj = a7;
  id v56 = a7;
  v19 = (void (**)(id, void *))a8;
  id v60 = a9;
  v59 = (void (**)(void))a10;
  v58 = (void (**)(void))a11;
  v20 = (void (**)(void))a12;
  id v21 = a13;
  v64.receiver = self;
  v64.super_class = (Class)HKSPSleepStore;
  uint64_t v22 = [(HKSPSleepStore *)&v64 init];
  if (v22)
  {
    v23 = [HKSPXPCClientIdentifier alloc];
    v24 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v25 = [(HKSPXPCClientIdentifier *)v23 initWithUniqueIdentifier:v24 loggingIdentifier:v18];
    clientIdentifier = v22->_clientIdentifier;
    v22->_clientIdentifier = (HKSPXPCClientIdentifier *)v25;

    v27 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v22;
      _os_log_impl(&dword_1A7E74000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    v28 = [[HKSPSyncAnchorContainer alloc] initWithIdentifier:v18];
    syncAnchorContainer = v22->_syncAnchorContainer;
    v22->_syncAnchorContainer = v28;

    v30 = objc_alloc_init(HKSPSleepStoreExportedObject);
    sleepStoreExportedObject = v22->_sleepStoreExportedObject;
    v22->_sleepStoreExportedObject = v30;

    [(HKSPSleepStoreExportedObject *)v22->_sleepStoreExportedObject setSleepStore:v22];
    if (v17)
    {
      uint64_t v32 = v17[2](v17, v22);
      connectionProvider = v22->_connectionProvider;
      v22->_connectionProvider = (HKSPXPCConnectionProvider *)v32;
    }
    else
    {
      connectionProvider = v22->_connectionProvider;
      v22->_connectionProvider = 0;
    }

    [(HKSPXPCConnectionProvider *)v22->_connectionProvider setDelegate:v22];
    if (v61)
    {
      v34 = [MEMORY[0x1E4F2B860] sharedBehavior];
      if (objc_msgSend(v34, "hksp_supportsHealthData"))
      {
        uint64_t v35 = [objc_alloc(MEMORY[0x1E4FA5590]) initWithHealthStore:v61];
        sleepHealthStore = v22->_sleepHealthStore;
        v22->_sleepHealthStore = (HKSleepHealthStore *)v35;
      }
      else
      {
        sleepHealthStore = v22->_sleepHealthStore;
        v22->_sleepHealthStore = 0;
      }
    }
    else
    {
      v34 = v22->_sleepHealthStore;
      v22->_sleepHealthStore = 0;
    }

    v22->_options = a6;
    if ([(HKSPSleepStore *)v22 _cachingEnabled])
    {
      v37 = objc_alloc_init(HKSPSleepStoreModelCache);
      sleepStoreCache = v22->_sleepStoreCache;
      v22->_sleepStoreCache = v37;
    }
    else
    {
      sleepStoreCache = v22->_sleepStoreCache;
      v22->_sleepStoreCache = 0;
    }

    v39 = [[HKSPObserverSet alloc] initWithCallbackScheduler:v60];
    observers = v22->_observers;
    v22->_observers = v39;

    uint64_t v41 = [v21 copy];
    id currentDateProvider = v22->_currentDateProvider;
    v22->_id currentDateProvider = (id)v41;

    objc_storeStrong((id *)&v22->_analyticsManager, obj);
    if ([(HKSPSleepStore *)v22 _observeSleepFocusMode])
    {
      uint64_t v43 = v59[2]();
      sleepFocusModeBridge = v22->_sleepFocusModeBridge;
      v22->_sleepFocusModeBridge = (HKSPSleepFocusModeBridge *)v43;
    }
    else
    {
      sleepFocusModeBridge = v22->_sleepFocusModeBridge;
      v22->_sleepFocusModeBridge = 0;
    }

    [(HKSPSleepFocusModeBridge *)v22->_sleepFocusModeBridge setDelegate:v22];
    if ([(HKSPSleepStore *)v22 _reloadsWidgets])
    {
      v45 = [HKSPSleepWidgetManager alloc];
      v46 = v58[2]();
      v47 = v20[2](v20);
      uint64_t v48 = [(HKSPSleepWidgetManager *)v45 initWithTimelineControllers:v46 relevanceController:v47];
      widgetManager = v22->_widgetManager;
      v22->_widgetManager = (HKSPSleepWidgetManager *)v48;
    }
    else
    {
      v46 = v22->_widgetManager;
      v22->_widgetManager = 0;
    }

    [(HKSPSleepWidgetManager *)v22->_widgetManager setDelegate:v22];
    objc_initWeak((id *)buf, v22);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __254__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options_analyticsManager_throttlerProvider_callbackScheduler_sleepFocusModeBridgeProvider_widgetTimelineControllersProvider_widgetRelevanceControllerProvider_currentDateProvider___block_invoke;
    v62[3] = &unk_1E5D32D28;
    objc_copyWeak(&v63, (id *)buf);
    uint64_t v50 = v19[2](v19, v62);
    reconnectThrottler = v22->_reconnectThrottler;
    v22->_reconnectThrottler = (HKSPThrottler *)v50;

    if ([(HKSPSleepStore *)v22 _connectAutomatically]) {
      [(HKSPSleepStore *)v22 connect];
    }
    v52 = v22;
    objc_destroyWeak(&v63);
    objc_destroyWeak((id *)buf);
  }

  return v22;
}

- (void)addObserver:(id)a3
{
}

HKSPThrottler *__84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [HKSPThrottler alloc];
  id v4 = [MEMORY[0x1E4F7A0F0] serialDispatchQueueSchedulerWithName:@"com.apple.sleep.HKSPSleepStore"];
  uint64_t v5 = [(HKSPThrottler *)v3 initWithInterval:v2 executeBlock:v4 scheduler:0.1];

  return v5;
}

- (void)connect
{
}

- (BOOL)_reloadsWidgets
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_observeSleepFocusMode
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)_getSleepEventRecordFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep event record from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D32DF0;
    id v22 = v8;
    id v23 = v9;
    v24 = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_338;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    __int16 v13 = v20;
    id v14 = v11;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
    v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

- (void)connectSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ connecting", buf, 0xCu);
    }

    id v8 = [(HKSPSleepStore *)self description];
    objc_initWeak((id *)buf, self);
    uint64_t v9 = [HKSPXPCMessage alloc];
    if (v3) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__HKSPSleepStore_connectSynchronously___block_invoke;
    v18[3] = &unk_1E5D32D78;
    objc_copyWeak(&v19, (id *)buf);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __39__HKSPSleepStore_connectSynchronously___block_invoke_3;
    v16 = &unk_1E5D32DA0;
    id v11 = v8;
    id v17 = v11;
    id v12 = [(HKSPXPCMessage *)v9 initWithIdentifier:@"connect" block:v18 options:v10 errorHandler:&v13];
    -[HKSPXPCConnectionProvider sendMessage:](self->_connectionProvider, "sendMessage:", v12, v13, v14, v15, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

id __57__HKSPSleepStore_initWithIdentifier_healthStore_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPSleepServerInterface();
    int v6 = [v2 sleepStoreExportedObject];
    id v7 = HKSPSleepClientInterface();
    id v8 = +[HKSPXPCConnectionInfo infoForMachServiceName:@"com.apple.sleepd.sleepserver" remoteObjectInterface:v5 exportedObject:v6 exportedObjectInterface:v7 lifecycleNotification:@"com.apple.sleepd.wakeup" requiredEntitlement:@"com.apple.private.sleepd" options:0];

    uint64_t v9 = +[HKSPXPCConnectionProvider providerWithConnectionInfo:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)currentSleepSettingsWithError:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  int v4 = [(HKSPSleepStore *)self _getSleepSettingsDoSync:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore_currentSleepSettingsWithError___block_invoke;
  v8[3] = &unk_1E5D32F58;
  void v8[4] = &v15;
  v8[5] = &v9;
  id v5 = (id)[v4 addCompletionBlock:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (HKSPSleepStoreExportedObject)sleepStoreExportedObject
{
  return self->_sleepStoreExportedObject;
}

- (BOOL)_connectAutomatically
{
  return (self->_options & 0x10) == 0;
}

- (void)currentSleepEventRecordWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepStore *)self currentSleepEventRecordFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HKSPSleepStore_currentSleepEventRecordWithCompletion___block_invoke;
  v8[3] = &unk_1E5D32FA8;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

- (id)currentSleepEventRecordWithError:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v4 = [(HKSPSleepStore *)self _getSleepEventRecordDoSync:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_currentSleepEventRecordWithError___block_invoke;
  v8[3] = &unk_1E5D32FD0;
  void v8[4] = &v15;
  v8[5] = &v9;
  id v5 = (id)[v4 addCompletionBlock:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)_getSleepSettingsDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__HKSPSleepStore__getSleepSettingsDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    id v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepSettingsWithMissHandler:v8];
  }
  else
  {
    id v6 = [(HKSPSleepStore *)self _getSleepSettingsFromServerDoSync:v3];
  }
  return v6;
}

- (id)_getSleepEventRecordDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__HKSPSleepStore__getSleepEventRecordDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    id v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepEventRecordWithMissHandler:v8];
  }
  else
  {
    id v6 = [(HKSPSleepStore *)self _getSleepEventRecordFromServerDoSync:v3];
  }
  return v6;
}

- (BOOL)_cachingEnabled
{
  return (self->_options & 1) == 0;
}

uint64_t __45__HKSPSleepStore__getSleepEventRecordDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepEventRecordFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

- (id)currentSleepEventRecordFuture
{
  return [(HKSPSleepStore *)self _getSleepEventRecordDoSync:0];
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_2(uint64_t a1)
{
  return +[HKSPDNDConfigurationService sleepFocusConfigurationServiceWithOptions:(*(void *)(a1 + 32) >> 1) & 2];
}

uint64_t __42__HKSPSleepStore__getSleepSettingsDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepSettingsFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_getSleepSettingsFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep settings from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    BOOL v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D32DF0;
    id v22 = v8;
    id v23 = v9;
    v24 = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_336;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    uint64_t v13 = v20;
    id v14 = v11;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
    v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  id v8 = HKSPNullify(v5);
  [v7 finishWithResult:v8 error:v6];

  BOOL v9 = HKSPLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep settings: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep settings from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  id v8 = HKSPNullify(v5);
  [v7 finishWithResult:v8 error:v6];

  BOOL v9 = HKSPLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep event record: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep event record from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

void __56__HKSPSleepStore_currentSleepEventRecordWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

void __48__HKSPSleepStore_currentSleepSettingsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = HKSPNilify(a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __51__HKSPSleepStore_currentSleepEventRecordWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = HKSPNilify(a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained syncAnchorContainer];
  [v8 updateWithContainer:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKSPSyncAnchorContainer)syncAnchorContainer
{
  return self->_syncAnchorContainer;
}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  id v8 = HKSPNullify(v5);
  [v7 finishWithResult:v8 error:v6];

  uint64_t v9 = HKSPLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule model: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep schedule model from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E5D32FF8;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 getSleepScheduleModelWithCompletion:v6];
}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  id v8 = HKSPNullify(v5);
  [v7 finishWithResult:v8 error:v6];

  uint64_t v9 = HKSPLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received sleep schedule from server: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_2;
  v6[3] = &unk_1E5D32398;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 getSleepScheduleWithCompletion:v6];
}

void __48__HKSPSleepStore_currentSleepScheduleWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = HKSPNilify(a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

uint64_t __47__HKSPSleepStore__getSleepScheduleModelDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepScheduleModelFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

void __46__HKSPSleepStore_sleepScheduleModelWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = HKSPNilify(a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

uint64_t __42__HKSPSleepStore__getSleepScheduleDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepScheduleFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4
{
  return [(HKSPSleepStore *)self upcomingResolvedScheduleOccurrenceAfterDate:a3 alarmStatus:0 error:a4];
}

- (id)upcomingResolvedScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKSPSleepStore *)self sleepScheduleModelWithError:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 upcomingResolvedOccurrenceAfterDate:v8];
    uint64_t v12 = v11;
    if (a4)
    {
      int v13 = [v11 occurrence];
      *a4 = [v10 alarmStatusForOccurrence:v13];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)sleepScheduleModelWithError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  int v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v4 = [(HKSPSleepStore *)self _getSleepScheduleModelDoSync:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HKSPSleepStore_sleepScheduleModelWithError___block_invoke;
  v8[3] = &unk_1E5D33048;
  void v8[4] = &v15;
  void v8[5] = &v9;
  id v5 = (id)[v4 addCompletionBlock:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)currentSleepScheduleWithError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  int v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v4 = [(HKSPSleepStore *)self _getSleepScheduleDoSync:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore_currentSleepScheduleWithError___block_invoke;
  v8[3] = &unk_1E5D32E90;
  void v8[4] = &v15;
  void v8[5] = &v9;
  id v5 = (id)[v4 addCompletionBlock:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)_getSleepScheduleModelFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule model from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D32DF0;
    id v22 = v8;
    id v23 = v9;
    v24 = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_340;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    int v13 = v20;
    id v14 = v11;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
    id v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

- (id)_getSleepScheduleModelDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__HKSPSleepStore__getSleepScheduleModelDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    char v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepScheduleModelWithMissHandler:v8];
  }
  else
  {
    char v6 = [(HKSPSleepStore *)self _getSleepScheduleModelFromServerDoSync:v3];
  }
  return v6;
}

- (id)_getSleepScheduleFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    BOOL v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D32DF0;
    id v22 = v8;
    id v23 = v9;
    v24 = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_331;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    int v13 = v20;
    id v14 = v11;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
    id v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

- (id)_getSleepScheduleDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__HKSPSleepStore__getSleepScheduleDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    char v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepScheduleWithMissHandler:v8];
  }
  else
  {
    char v6 = [(HKSPSleepStore *)self _getSleepScheduleFromServerDoSync:v3];
  }
  return v6;
}

- (void)suggestedSleepScheduleWithProviders:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = self;
    _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting suggested sleep schedule", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke;
  v11[3] = &unk_1E5D32460;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(HKSPSleepStore *)self currentSleepScheduleWithCompletion:v11];
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (![v5 hasOccurrences])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_280;
      v17[3] = &unk_1E5D323E8;
      id v10 = *(void **)(a1 + 40);
      v17[4] = *(void *)(a1 + 32);
      id v11 = objc_msgSend(v10, "na_map:", v17);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_285;
      v16[3] = &unk_1E5D32410;
      v16[4] = *(void *)(a1 + 32);
      id v12 = objc_msgSend(MEMORY[0x1E4F7A0D8], "hksp_chainFutures:returningFirstPassingTest:ignoreErrors:", v11, v16, 1);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2_287;
      v14[3] = &unk_1E5D32438;
      v14[4] = *(void *)(a1 + 32);
      id v15 = *(id *)(a1 + 48);
      id v13 = (id)[v12 addCompletionBlock:v14];

      goto LABEL_8;
    }
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ returning existing sleep schedule: %{public}@", buf, 0x16u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
LABEL_8:
}

id __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_280(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2;
  v9[3] = &unk_1E5D323C0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  id v7 = [v4 lazyFutureWithBlock:v9];

  return v7;
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_3;
  v7[3] = &unk_1E5D32398;
  int8x16_t v6 = a1[2];
  id v4 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "hksp_suggestedSleepScheduleWithCompletion:", v7);
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HKSPLogForCategory(1uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v6;
      uint64_t v11 = "%{public}@ provider %{public}@ failed to suggest sleep schedule: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x20u);
    }
  }
  else if (v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v15 = 138543874;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v5;
    uint64_t v11 = "%{public}@ provider %{public}@ suggested sleep schedule: %{public}@";
    goto LABEL_6;
  }

  id v14 = objc_alloc_init(_HKSPScheduleAndProviderPair);
  [(_HKSPScheduleAndProviderPair *)v14 setProvider:*(void *)(a1 + 40)];
  [(_HKSPScheduleAndProviderPair *)v14 setSchedule:v5];
  [*(id *)(a1 + 48) finishWithResult:v14 error:v6];
}

uint64_t __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_285(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _resultHasSchedule:v3]
    && [*(id *)(a1 + 32) _resultScheduleMeetsDefaultGoal:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _resultScheduleIsValid:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __76__HKSPSleepStore_Proactive__suggestedSleepScheduleWithProviders_completion___block_invoke_2_287(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NAEmptyResult();
  char v8 = [v5 isEqual:v7];

  uint64_t v9 = HKSPLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543618;
      uint64_t v19 = v17;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ no suggested sleep schedule found (error: %{public}@)", (uint8_t *)&v18, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v5 schedule];
      uint64_t v13 = [v5 provider];
      int v18 = 138543874;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ returning suggested sleep schedule: %{public}@ (provider: %{public}@)", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = [v5 schedule];
    uint64_t v16 = [v5 provider];
    (*(void (**)(uint64_t, void *, void *, id))(v14 + 16))(v14, v15, v16, v6);
  }
}

- (BOOL)_resultHasSchedule:(id)a3
{
  id v3 = [a3 schedule];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_resultScheduleMeetsDefaultGoal:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 schedule];
  int v5 = [v4 meetsDefaultSleepGoal];

  id v6 = HKSPLogForCategory(1uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      char v8 = "%{public}@ suggested schedule meets default sleep goal";
LABEL_6:
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    char v8 = "%{public}@ suggested schedule doesn't meet default sleep goal";
    goto LABEL_6;
  }

  return v5;
}

- (BOOL)_resultScheduleIsValid:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HKSPSleepStore *)self sleepScheduleModelWithError:0];
  id v6 = [v4 schedule];

  BOOL v7 = [v5 sleepSettings];
  char v8 = [v5 sleepEventRecord];
  uint64_t v9 = +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:v6 sleepSettings:v7 sleepEventRecord:v8];

  int v10 = [(HKSPSleepStore *)self currentDateProvider];
  uint64_t v11 = v10[2]();
  uint64_t v12 = +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:v9 date:v11];

  uint64_t v13 = [v12 buildTimelineWithOptions:2];
  int v14 = [v13 sleepScheduleInvalid];
  int v15 = HKSPLogForCategory(1uLL);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v19 = 138543362;
      __int16 v20 = self;
      uint64_t v17 = "%{public}@ suggested schedule is invalid";
LABEL_6:
      _os_log_impl(&dword_1A7E74000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);
    }
  }
  else if (v16)
  {
    int v19 = 138543362;
    __int16 v20 = self;
    uint64_t v17 = "%{public}@ suggested schedule is valid";
    goto LABEL_6;
  }

  return v14 ^ 1;
}

- (HKSPSleepStore)init
{
  id v3 = HKSPGenerateSleepStoreIdentifier(&stru_1EFE54160);
  id v4 = [(HKSPSleepStore *)self initWithIdentifier:v3];

  return v4;
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_3()
{
  return +[HKSPSleepWidgetManager defaultTimelineControllers];
}

id __84__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options___block_invoke_4()
{
  return +[HKSPSleepWidgetManager defaultRelevanceController];
}

void __254__HKSPSleepStore_initWithConnectionProviderProvider_identifier_healthStore_options_analyticsManager_throttlerProvider_callbackScheduler_sleepFocusModeBridgeProvider_widgetTimelineControllersProvider_widgetRelevanceControllerProvider_currentDateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkInWithCurrentSyncAnchor];
}

- (void)removeObserver:(id)a3
{
}

- (void)removeAllObservers
{
}

- (void)reconnect
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconnecting", (uint8_t *)&v4, 0xCu);
  }

  [(HKSPThrottler *)self->_reconnectThrottler execute];
}

void __39__HKSPSleepStore_connectSynchronously___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to connect: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_checkInWithCurrentSyncAnchor
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(HKSPSleepStore *)self syncAnchorContainer];
      *(_DWORD *)buf = 138543618;
      int v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = v6;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ checking in with sync anchor container: %{public}@", buf, 0x16u);
    }
    uint64_t v7 = [(HKSPSleepStore *)self description];
    __int16 v8 = [HKSPXPCMessage alloc];
    id v15 = v7;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke;
    v16[3] = &unk_1E5D32DC8;
    v16[4] = self;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke_2;
    int v14 = &unk_1E5D32DA0;
    id v9 = v7;
    uint64_t v10 = [(HKSPXPCMessage *)v8 initWithIdentifier:@"checkIn" block:v16 options:2 errorHandler:&v11];
    -[HKSPXPCConnectionProvider sendMessage:](self->_connectionProvider, "sendMessage:", v10, v11, v12, v13, v14);
  }
}

void __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 syncAnchorContainer];
  [v6 checkInWithSyncAnchorContainer:v7 completion:v5];
}

void __47__HKSPSleepStore__checkInWithCurrentSyncAnchor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to check in: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)[(HKSleepHealthStore *)self->_sleepHealthStore healthStore];
}

+ (id)_sleepDisabledError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep.HKSPSleepStore" code:1 userInfo:0];
}

void __52__HKSPSleepStore__getSleepScheduleFromServerDoSync___block_invoke_331(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)currentSleepScheduleWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self currentSleepScheduleFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSleepStore_currentSleepScheduleWithCompletion___block_invoke;
  v8[3] = &unk_1E5D32E68;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __53__HKSPSleepStore_currentSleepScheduleWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (id)currentSleepScheduleFuture
{
  return [(HKSPSleepStore *)self _getSleepScheduleDoSync:0];
}

- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 error:(id *)a4
{
  id v4 = [(HKSPSleepStore *)self upcomingResolvedScheduleOccurrenceAfterDate:a3 error:a4];
  id v5 = [v4 occurrence];

  return v5;
}

- (id)upcomingScheduleOccurrenceAfterDate:(id)a3 alarmStatus:(int64_t *)a4 error:(id *)a5
{
  id v5 = [(HKSPSleepStore *)self upcomingResolvedScheduleOccurrenceAfterDate:a3 alarmStatus:a4 error:a5];
  id v6 = [v5 occurrence];

  return v6;
}

- (void)upcomingScheduleOccurrenceAfterDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSPSleepStore *)self upcomingScheduleOccurrenceAfterDateFuture:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HKSPSleepStore_upcomingScheduleOccurrenceAfterDate_completion___block_invoke;
  v10[3] = &unk_1E5D32EB8;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

void __65__HKSPSleepStore_upcomingScheduleOccurrenceAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (id)upcomingScheduleOccurrenceAfterDateFuture:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepStore *)self sleepScheduleModelFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKSPSleepStore_upcomingScheduleOccurrenceAfterDateFuture___block_invoke;
  v9[3] = &unk_1E5D32EE0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __60__HKSPSleepStore_upcomingScheduleOccurrenceAfterDateFuture___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 upcomingOccurrenceAfterDate:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = HKSPNilify(v2);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

void __52__HKSPSleepStore__getSleepSettingsFromServerDoSync___block_invoke_336(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep settings: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)currentSleepSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self currentSleepSettingsFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSleepStore_currentSleepSettingsWithCompletion___block_invoke;
  v8[3] = &unk_1E5D32F30;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __53__HKSPSleepStore_currentSleepSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (id)currentSleepSettingsFuture
{
  return [(HKSPSleepStore *)self _getSleepSettingsDoSync:0];
}

void __55__HKSPSleepStore__getSleepEventRecordFromServerDoSync___block_invoke_338(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep event record: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

void __57__HKSPSleepStore__getSleepScheduleModelFromServerDoSync___block_invoke_340(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule model: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)sleepScheduleModelWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self sleepScheduleModelFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_sleepScheduleModelWithCompletion___block_invoke;
  v8[3] = &unk_1E5D33020;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __51__HKSPSleepStore_sleepScheduleModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (id)sleepScheduleModelFuture
{
  return [(HKSPSleepStore *)self _getSleepScheduleModelDoSync:0];
}

- (id)_getSleepModeFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep mode from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D33098;
    id v22 = v8;
    id v23 = v9;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_343;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    uint64_t v13 = v20;
    id v14 = v11;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F7A0D8];
    BOOL v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E5D33070;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 getSleepModeWithCompletion:v4];
}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v6 finishWithResult:v7 error:v5];

  if (v5)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep mode: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __48__HKSPSleepStore__getSleepModeFromServerDoSync___block_invoke_343(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep mode: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)_getSleepModeDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__HKSPSleepStore__getSleepModeDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    int v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepModeWithMissHandler:v8];
  }
  else
  {
    int v6 = [(HKSPSleepStore *)self _getSleepModeFromServerDoSync:v3];
  }
  return v6;
}

uint64_t __38__HKSPSleepStore__getSleepModeDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepModeFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

- (id)sleepModeFuture
{
  return [(HKSPSleepStore *)self _getSleepModeDoSync:0];
}

- (id)sleepModeOnFuture
{
  id v2 = [(HKSPSleepStore *)self sleepModeFuture];
  BOOL v3 = [v2 flatMap:&__block_literal_global_346];

  return v3;
}

id __35__HKSPSleepStore_sleepModeOnFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = HKSPNilify(a2);
  uint64_t v3 = [v2 integerValue];

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3 != 0];
  int v6 = [v4 futureWithResult:v5];

  return v6;
}

- (void)sleepModeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self sleepModeFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__HKSPSleepStore_sleepModeWithCompletion___block_invoke;
  v8[3] = &unk_1E5D330E0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __42__HKSPSleepStore_sleepModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, [v6 integerValue], a2 != 0, v5);
  }
}

- (void)sleepModeOnWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepStore *)self sleepModeOnFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__HKSPSleepStore_sleepModeOnWithCompletion___block_invoke;
  v8[3] = &unk_1E5D330E0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __44__HKSPSleepStore_sleepModeOnWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, [v6 BOOLValue], a2 != 0, v5);
  }
}

- (int64_t)sleepModeWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v3 = [(HKSPSleepStore *)self _getSleepModeDoSync:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HKSPSleepStore_sleepModeWithError___block_invoke;
  v7[3] = &unk_1E5D33108;
  void v7[4] = &v8;
  id v4 = (id)[v3 addCompletionBlock:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __37__HKSPSleepStore_sleepModeWithError___block_invoke(uint64_t a1, void *a2)
{
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

- (BOOL)sleepModeOnWithError:(id *)a3
{
  return [(HKSPSleepStore *)self sleepModeWithError:a3] != 0;
}

- (id)_getSleepWidgetStateFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep widget state from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D33098;
    id v22 = v8;
    id v23 = v9;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_348;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    id v13 = v20;
    id v14 = v11;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F7A0D8];
    BOOL v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E5D33070;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 getSleepWidgetStateWithCompletion:v4];
}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v6 finishWithResult:v7 error:v5];

  if (v5)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep widget state: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __55__HKSPSleepStore__getSleepWidgetStateFromServerDoSync___block_invoke_348(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep widget state: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)sleepWidgetStateFuture
{
  return [(HKSPSleepStore *)self _getSleepWidgetStateDoSync:0];
}

- (void)sleepWidgetStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self sleepWidgetStateFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HKSPSleepStore_sleepWidgetStateWithCompletion___block_invoke;
  v8[3] = &unk_1E5D330E0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __49__HKSPSleepStore_sleepWidgetStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, [v6 integerValue], a2 != 0, v5);
  }
}

- (int64_t)sleepWidgetStateWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v3 = [(HKSPSleepStore *)self _getSleepWidgetStateDoSync:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HKSPSleepStore_sleepWidgetStateWithError___block_invoke;
  v7[3] = &unk_1E5D33108;
  void v7[4] = &v8;
  id v4 = (id)[v3 addCompletionBlock:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__HKSPSleepStore_sleepWidgetStateWithError___block_invoke(uint64_t a1, void *a2)
{
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

- (BOOL)shouldReloadWidgetOfKind:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![a3 isEqualToString:@"com.apple.health.SleepWidget"]) {
    return 1;
  }
  id v11 = 0;
  int64_t v4 = [(HKSPSleepStore *)self sleepWidgetStateWithError:&v11];
  id v5 = v11;
  if (v5)
  {
    id v6 = HKSPLogForCategory(0x12uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      id v10 = v9;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch sleep widget state with error: %{public}@", buf, 0x16u);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = (unint64_t)(v4 - 6) < 0xFFFFFFFFFFFFFFFCLL;
  }

  return v7;
}

- (id)_getSleepScheduleStateFromServerDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    BOOL v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting sleep schedule state from server", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v9 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke;
    v21[3] = &unk_1E5D33098;
    id v22 = v8;
    id v23 = v9;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_350;
    v18[3] = &unk_1E5D32E18;
    id v19 = v23;
    id v11 = v22;
    id v20 = v11;
    id v12 = v23;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v21 withErrorHandler:v18 doSynchronously:v3];
    id v13 = v20;
    id v14 = v11;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v16 = [(id)objc_opt_class() _sleepDisabledError];
    id v14 = [v15 futureWithError:v16];
  }
  return v14;
}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_2;
  v4[3] = &unk_1E5D33130;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 getSleepScheduleStateWithCompletion:v4];
}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  [v6 finishWithResult:v7 error:v5];

  if (v5)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule state: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __57__HKSPSleepStore__getSleepScheduleStateFromServerDoSync___block_invoke_350(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to get sleep schedule state: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)_getSleepScheduleStateOnDoSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKSPSleepStore *)self _cachingEnabled])
  {
    sleepStoreCache = self->_sleepStoreCache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__HKSPSleepStore__getSleepScheduleStateOnDoSync___block_invoke;
    v8[3] = &unk_1E5D32E40;
    void v8[4] = self;
    BOOL v9 = v3;
    int v6 = [(HKSPSleepStoreModelCache *)sleepStoreCache cachedSleepScheduleStateWithMissHandler:v8];
  }
  else
  {
    int v6 = [(HKSPSleepStore *)self _getSleepScheduleStateFromServerDoSync:v3];
  }
  return v6;
}

uint64_t __49__HKSPSleepStore__getSleepScheduleStateOnDoSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSleepScheduleStateFromServerDoSync:*(unsigned __int8 *)(a1 + 40)];
}

- (id)currentSleepScheduleStateFuture
{
  return [(HKSPSleepStore *)self _getSleepScheduleStateOnDoSync:0];
}

- (void)currentSleepScheduleStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self currentSleepScheduleStateFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore_currentSleepScheduleStateWithCompletion___block_invoke;
  v8[3] = &unk_1E5D330E0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __58__HKSPSleepStore_currentSleepScheduleStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  HKSPNilify(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, BOOL, id))(v4 + 16))(v4, [v6 integerValue], a2 != 0, v5);
}

- (unint64_t)currentSleepScheduleStateWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  BOOL v3 = [(HKSPSleepStore *)self _getSleepScheduleStateOnDoSync:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKSPSleepStore_currentSleepScheduleStateWithError___block_invoke;
  v7[3] = &unk_1E5D33108;
  void v7[4] = &v8;
  id v4 = (id)[v3 addCompletionBlock:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __53__HKSPSleepStore_currentSleepScheduleStateWithError___block_invoke(uint64_t a1, void *a2)
{
  HKSPNilify(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

- (id)_saveCurrentSleepScheduleOnServer:(id)a3 options:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if (v7)
  {
    uint64_t v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep schedule on server: %{public}@", buf, 0x16u);
    }

    [(HKSPSleepStoreModelCache *)self->_sleepStoreCache updateCachedSleepSchedule:v5];
    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke;
    v27[3] = &unk_1E5D32DA0;
    v27[4] = self;
    id v10 = (id)[v9 addFailureBlock:v27];
    uint64_t v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_2;
    v23[3] = &unk_1E5D32DF0;
    id v24 = v5;
    id v25 = v11;
    id v26 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_351;
    v20[3] = &unk_1E5D32E18;
    id v21 = v25;
    id v13 = v26;
    id v22 = v13;
    id v14 = v25;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v23 withErrorHandler:v20];
    id v15 = v22;
    id v16 = v13;
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F7A0D8];
    int v18 = [(id)objc_opt_class() _sleepDisabledError];
    id v16 = [v17 futureWithError:v18];
  }
  return v16;
}

uint64_t __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) purgeCachedSleepSchedule];
}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_3;
  v5[3] = &unk_1E5D32E18;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [a2 saveSleepSchedule:v4 completion:v5];
}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep schedule on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __60__HKSPSleepStore__saveCurrentSleepScheduleOnServer_options___block_invoke_351(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep schedule on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)saveCurrentSleepSchedule:(id)a3
{
  return [(HKSPSleepStore *)self saveCurrentSleepSchedule:a3 options:0 context:0];
}

- (id)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v12 = objc_msgSend(v11, "hksp_supportsHealthData");

  if (a4 & 4) != 0 || (v12)
  {
    if ((a4 & 4) == 0 && !self->_sleepHealthStore)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"HKSPSleepStore.m" lineNumber:791 description:@"Attempted to save a sleep schedule without a sleep health store"];
    }
    id v16 = [(HKSPSleepStore *)self _prepareObjectForSave:v9 options:a4];
    uint64_t v17 = [(HKSPSleepStore *)self _saveCurrentSleepScheduleOnServer:v16 options:a4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke;
    v21[3] = &unk_1E5D33180;
    void v21[4] = self;
    id v22 = v16;
    unint64_t v24 = a4;
    id v23 = v10;
    id v18 = v16;
    id v15 = [v17 flatMap:v21];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:4 userInfo:0];
    id v15 = [v13 futureWithError:v14];
  }
  return v15;
}

id __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _writeHistoricalSchedule:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke_2;
  v5[3] = &unk_1E5D33158;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v3 = [v2 flatMap:v5];

  return v3;
}

uint64_t __59__HKSPSleepStore_saveCurrentSleepSchedule_options_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendScheduleChangedAnalyticsWithContext:*(void *)(a1 + 40)];
}

- (id)_sendScheduleChangedAnalyticsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self currentSleepSettingsFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKSPSleepStore__sendScheduleChangedAnalyticsWithContext___block_invoke;
  v9[3] = &unk_1E5D331A8;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v9];

  return v5;
}

void __59__HKSPSleepStore__sendScheduleChangedAnalyticsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HKSPLogForCategory(1uLL);
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch current sleep settings with error: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched current sleep settings: %@", (uint8_t *)&v17, 0x16u);
    }

    __int16 v8 = +[HKSPAnalyticsManager activePairedWatchProductType];
    uint64_t v11 = [v5 sleepTracking];
    char v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HKSPAnalyticsSleepScheduleChangeApplication"];
    id v13 = [[HKSPAnalyticsSleepScheduleChangeInfo alloc] initWithApplication:HKSPAnalyticsSleepScheduleChangeApplicationFromValue(v12) activePairedWatchProductType:v8 isSleepTrackingEnabled:v11];
    id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HKSPAnalyticsSleepScheduleChangeProvenanceInfo"];
    id v15 = *(void **)(*(void *)(a1 + 32) + 8);
    id v16 = [[HKSPAnalyticsSleepScheduleChangeEvent alloc] initWithScheduleChangeInfo:v13 provenanceInfo:v14];
    [v15 trackEvent:v16];
  }
}

- (void)saveCurrentSleepSchedule:(id)a3 completion:(id)a4
{
}

- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
}

- (void)saveCurrentSleepSchedule:(id)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [(HKSPSleepStore *)self saveCurrentSleepSchedule:a3 options:a4 context:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HKSPSleepStore_saveCurrentSleepSchedule_options_context_completion___block_invoke;
  v14[3] = &unk_1E5D331D0;
  id v15 = v10;
  id v12 = v10;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

uint64_t __70__HKSPSleepStore_saveCurrentSleepSchedule_options_context_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (id)_writeHistoricalSchedule:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (self->_sleepHealthStore)
  {
    id v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
    __int16 v8 = [(id)objc_opt_class() _updatedHistoricalSleepSchedulesFromSleepSchedule:v6 options:a4 date:v7];
    uint64_t v9 = [(id)objc_opt_class() _updatedHistoricalSleepGoalForSleepSchedule:v6 options:a4 date:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    sleepHealthStore = self->_sleepHealthStore;
    id v12 = objc_msgSend(v10, "hksp_BOOLErrorCompletionHandlerAdapter");
    [(HKSleepHealthStore *)sleepHealthStore updateCurrentSleepSchedules:v8 sleepDurationGoal:v9 completion:v12];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__HKSPSleepStore__writeHistoricalSchedule_options___block_invoke;
    v17[3] = &unk_1E5D331F8;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v13 = v9;
    id v14 = v8;
    id v15 = (id)[v10 addCompletionBlock:v17];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

void __51__HKSPSleepStore__writeHistoricalSchedule_options___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HKSPLogForCategory(1uLL);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = (void *)a1[5];
      uint64_t v10 = a1[6];
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated current sleep schedules: %@ and sleep goal: %@ in HealthKit", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = a1[4];
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to update current sleep schedules in HealthKit with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

+ (id)_updatedHistoricalSleepSchedulesFromSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5
{
  char v6 = a4;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (!v7
    || (v6 & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v7 hasChangeAffectingScheduling])
  {
    uint64_t v9 = [v7 occurrences];
    uint64_t v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_367);

    if ([v10 count] && objc_msgSend(v7, "isEnabled"))
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      uint64_t v35 = __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke_2;
      v36 = &unk_1E5D33220;
      id v11 = v8;
      id v37 = v11;
      int v12 = objc_msgSend(v10, "na_map:", &v33);
      if ([v7 weekdaysWithoutOccurrences])
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F2B550];
        uint64_t v14 = HKSleepScheduleWeekdaysFromHKSPWeekdays([v7 weekdaysWithoutOccurrences]);
        id v15 = objc_msgSend(v13, "sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:", v11, v14, 0, 0, 0, 0, 0, v33, v34, v35, v36);
        uint64_t v16 = [v12 arrayByAddingObject:v15];

        int v12 = (void *)v16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v7;
        if ([v17 hasOverrideOccurrenceRemoval])
        {
          uint64_t v18 = [v17 lastOverrideOccurrenceWakeUpComponents];
          id v19 = v18;
          if (v18)
          {
            id v20 = (void *)MEMORY[0x1E4F2B550];
            uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v18, "hk_dayIndex"));
            id v22 = [v20 sleepScheduleWithDate:v11 weekdays:0 wakeTimeComponents:0 bedTimeComponents:0 overrideDayIndex:v21 device:0 metadata:0];

            uint64_t v23 = [v12 arrayByAddingObject:v22];

            int v12 = (void *)v23;
          }
        }
      }
      unint64_t v24 = v37;
    }
    else
    {
      id v25 = [MEMORY[0x1E4F2B550] sleepScheduleWithDate:v8 weekdays:*MEMORY[0x1E4F2AA00] wakeTimeComponents:0 bedTimeComponents:0 overrideDayIndex:0 device:0 metadata:0];
      v38[0] = v25;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];

      id v26 = [v7 overrideOccurrence];

      if (!v26)
      {
LABEL_20:

        goto LABEL_22;
      }
      uint64_t v27 = [v7 overrideOccurrence];
      unint64_t v24 = [v27 wakeUpComponents];

      if (v24)
      {
        v28 = (void *)MEMORY[0x1E4F2B550];
        v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v24, "hk_dayIndex"));
        __int16 v30 = [v28 sleepScheduleWithDate:v8 weekdays:0 wakeTimeComponents:0 bedTimeComponents:0 overrideDayIndex:v29 device:0 metadata:0];

        uint64_t v31 = [v12 arrayByAddingObject:v30];

        int v12 = (void *)v31;
      }
    }

    goto LABEL_20;
  }
  int v12 = 0;
LABEL_22:

  return v12;
}

uint64_t __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInitialized];
}

id __81__HKSPSleepStore__updatedHistoricalSleepSchedulesFromSleepSchedule_options_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 weekdays])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28ED0];
    char v6 = [v3 wakeUpComponents];
    id v4 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "hk_dayIndex"));
  }
  id v7 = (void *)MEMORY[0x1E4F2B550];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = HKSleepScheduleWeekdaysFromHKSPWeekdays([v3 weekdays]);
  uint64_t v10 = [v3 wakeUpComponents];
  id v11 = [v3 bedtimeComponents];
  int v12 = [v7 sleepScheduleWithDate:v8 weekdays:v9 wakeTimeComponents:v10 bedTimeComponents:v11 overrideDayIndex:v4 device:0 metadata:0];

  return v12;
}

+ (id)_updatedHistoricalSleepGoalForSleepSchedule:(id)a3 options:(unint64_t)a4 date:(id)a5
{
  char v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8
    || (v6 & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v8 hasChangeToSleepDurationGoal])
  {
    uint64_t v10 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = a1;
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep duration goal changed", (uint8_t *)&v19, 0xCu);
    }

    id v11 = (void *)MEMORY[0x1E4F2B388];
    int v12 = [MEMORY[0x1E4F2B3B8] sleepDurationGoalType];
    uint64_t v13 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
    [v8 sleepDurationGoal];
    id v15 = objc_msgSend(v14, "numberWithDouble:");
    uint64_t v16 = objc_msgSend(v13, "hk_quantityWithSeconds:", v15);
    id v17 = [v11 quantitySampleWithType:v12 quantity:v16 startDate:v9 endDate:v9];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_saveCurrentSleepSettingsOnServer:(id)a3 options:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if (v7)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep settings on server: %{public}@", buf, 0x16u);
    }

    [(HKSPSleepStoreModelCache *)self->_sleepStoreCache updateCachedSleepSettings:v5];
    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke;
    v27[3] = &unk_1E5D32DA0;
    v27[4] = self;
    id v10 = (id)[v9 addFailureBlock:v27];
    id v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_2;
    v23[3] = &unk_1E5D32DF0;
    id v24 = v5;
    id v25 = v11;
    id v26 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_374;
    v20[3] = &unk_1E5D32E18;
    id v21 = v25;
    id v13 = v26;
    id v22 = v13;
    id v14 = v25;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v23 withErrorHandler:v20];
    id v15 = v22;
    id v16 = v13;
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v18 = [(id)objc_opt_class() _sleepDisabledError];
    id v16 = [v17 futureWithError:v18];
  }
  return v16;
}

uint64_t __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) purgeCachedSleepSettings];
}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_3;
  v5[3] = &unk_1E5D32E18;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [a2 saveSleepSettings:v4 completion:v5];
}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep settings on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __60__HKSPSleepStore__saveCurrentSleepSettingsOnServer_options___block_invoke_374(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep settings on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)saveCurrentSleepSettings:(id)a3
{
  return [(HKSPSleepStore *)self saveCurrentSleepSettings:a3 options:0];
}

- (id)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4
{
  int v6 = -[HKSPSleepStore _prepareObjectForSave:options:](self, "_prepareObjectForSave:options:", a3);
  uint64_t v7 = [(HKSPSleepStore *)self _saveCurrentSleepSettingsOnServer:v6 options:a4];

  return v7;
}

- (void)saveCurrentSleepSettings:(id)a3 completion:(id)a4
{
}

- (void)saveCurrentSleepSettings:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HKSPSleepStore *)self saveCurrentSleepSettings:a3 options:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HKSPSleepStore_saveCurrentSleepSettings_options_completion___block_invoke;
  v12[3] = &unk_1E5D331D0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

uint64_t __62__HKSPSleepStore_saveCurrentSleepSettings_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (id)_prepareObjectForSave:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  int v6 = v5;
  if ([v5 conformsToProtocol:&unk_1EFE6CE78])
  {
    if ((v4 & 2) != 0) {
      uint64_t v7 = [v5 copyWithZone:0];
    }
    else {
      uint64_t v7 = [v5 mutableCopy];
    }
    int v6 = (void *)v7;
    [v5 freeze];
  }
  return v6;
}

- (id)_saveCurrentSleepEventRecordOnServer:(id)a3 options:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v7 = objc_msgSend(v6, "hksp_supportsSleepDaemon");

  if (v7)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updating current sleep event record on server: %{public}@", buf, 0x16u);
    }

    [(HKSPSleepStoreModelCache *)self->_sleepStoreCache updateCachedSleepEventRecord:v5];
    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke;
    v27[3] = &unk_1E5D32DA0;
    v27[4] = self;
    id v10 = (id)[v9 addFailureBlock:v27];
    id v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_2;
    v23[3] = &unk_1E5D32DF0;
    id v24 = v5;
    id v25 = v11;
    id v26 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_470;
    v20[3] = &unk_1E5D32E18;
    id v21 = v25;
    id v13 = v26;
    id v22 = v13;
    id v14 = v25;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v23 withErrorHandler:v20];
    id v15 = v22;
    id v16 = v13;
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v18 = [(id)objc_opt_class() _sleepDisabledError];
    id v16 = [v17 futureWithError:v18];
  }
  return v16;
}

uint64_t __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) purgeCachedSleepEventRecord];
}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_3;
  v5[3] = &unk_1E5D32E18;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [a2 saveSleepEventRecord:v4 completion:v5];
}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep event record on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __63__HKSPSleepStore__saveCurrentSleepEventRecordOnServer_options___block_invoke_470(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to save sleep event record on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)saveCurrentSleepEventRecord:(id)a3
{
  return [(HKSPSleepStore *)self saveCurrentSleepEventRecord:a3 options:0];
}

- (id)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4
{
  int v6 = -[HKSPSleepStore _prepareObjectForSave:options:](self, "_prepareObjectForSave:options:", a3);
  uint64_t v7 = [(HKSPSleepStore *)self _saveCurrentSleepEventRecordOnServer:v6 options:a4];

  return v7;
}

- (void)saveCurrentSleepEventRecord:(id)a3 completion:(id)a4
{
}

- (void)saveCurrentSleepEventRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HKSPSleepStore *)self saveCurrentSleepEventRecord:a3 options:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HKSPSleepStore_saveCurrentSleepEventRecord_options_completion___block_invoke;
  v12[3] = &unk_1E5D331D0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

uint64_t __65__HKSPSleepStore_saveCurrentSleepEventRecord_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (id)_setSleepModeOnServer:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromHKSPSleepMode(a3);
      id v11 = NSStringFromHKSPSleepModeChangeReason(a4);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = self;
      __int16 v34 = 2114;
      uint64_t v35 = v10;
      __int16 v36 = 2114;
      id v37 = v11;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating sleep mode on server: %{public}@ (%{public}@)", buf, 0x20u);
    }
    [(HKSPSleepStoreModelCache *)self->_sleepStoreCache updateCachedSleepMode:a3];
    id v12 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke;
    v31[3] = &unk_1E5D32DA0;
    v31[4] = self;
    id v13 = (id)[v12 addFailureBlock:v31];
    id v14 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_2;
    v26[3] = &unk_1E5D33248;
    int64_t v29 = a3;
    unint64_t v30 = a4;
    id v27 = v14;
    id v28 = v12;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_471;
    v23[3] = &unk_1E5D32E18;
    id v24 = v27;
    id v16 = v28;
    id v25 = v16;
    id v17 = v27;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v26 withErrorHandler:v23];
    uint64_t v18 = v25;
    id v19 = v16;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F7A0D8];
    id v21 = [(id)objc_opt_class() _sleepDisabledError];
    id v19 = [v20 futureWithError:v21];
  }
  return v19;
}

uint64_t __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) purgeCachedSleepMode];
}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_3;
  v6[3] = &unk_1E5D32E18;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [a2 setSleepMode:v4 reason:v5 completion:v6];
}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to set sleep mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __47__HKSPSleepStore__setSleepModeOnServer_reason___block_invoke_471(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to set sleep mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)setSleepModeOn:(BOOL)a3 completion:(id)a4
{
}

- (void)setSleepModeOn:(BOOL)a3 reason:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  __int16 v8 = (void (**)(id, uint64_t, void))a5;
  if (a4 <= 0xA && ((1 << a4) & 0x60C) != 0)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      id v12 = NSStringFromHKSPSleepModeChangeReason(a4);
      *(_DWORD *)buf = 138543618;
      id v19 = v10;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring set sleep mode with reason: %{public}@", buf, 0x16u);
    }
    v8[2](v8, 1, 0);
  }
  else
  {
    if (v6) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = [(HKSPSleepStore *)self _setSleepModeOnServer:v13 reason:a4];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__HKSPSleepStore_setSleepModeOn_reason_completion___block_invoke;
    v16[3] = &unk_1E5D331D0;
    id v17 = v8;
    id v15 = (id)[v14 addCompletionBlock:v16];
  }
}

uint64_t __51__HKSPSleepStore_setSleepModeOn_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_confirmAwakeOnServer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = self;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Confirming awake on server", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v7 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke;
    v18[3] = &unk_1E5D33098;
    id v19 = v6;
    id v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_473;
    v15[3] = &unk_1E5D32E18;
    id v16 = v20;
    id v9 = v19;
    id v17 = v9;
    id v10 = v20;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v18 withErrorHandler:v15];
    id v11 = v17;
    id v12 = v9;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [(id)objc_opt_class() _sleepDisabledError];
    id v12 = [v13 futureWithError:v10];
  }

  return v12;
}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_2;
  v4[3] = &unk_1E5D33270;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 confirmAwakeWithCompletion:v4];
}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to confirm awake on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __39__HKSPSleepStore__confirmAwakeOnServer__block_invoke_473(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to confirn awake on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)confirmAwakeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self _confirmAwakeOnServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HKSPSleepStore_confirmAwakeWithCompletion___block_invoke;
  v8[3] = &unk_1E5D331D0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __45__HKSPSleepStore_confirmAwakeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_dismissGoodMorningOnServer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = self;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing good morning on server", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v7 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke;
    v18[3] = &unk_1E5D33098;
    id v19 = v6;
    id v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_474;
    v15[3] = &unk_1E5D32E18;
    id v16 = v20;
    id v9 = v19;
    id v17 = v9;
    id v10 = v20;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v18 withErrorHandler:v15];
    uint64_t v11 = v17;
    id v12 = v9;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [(id)objc_opt_class() _sleepDisabledError];
    id v12 = [v13 futureWithError:v10];
  }

  return v12;
}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_2;
  v4[3] = &unk_1E5D33270;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 dismissGoodMorningWithCompletion:v4];
}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __45__HKSPSleepStore__dismissGoodMorningOnServer__block_invoke_474(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)dismissGoodMorningWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self _dismissGoodMorningOnServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HKSPSleepStore_dismissGoodMorningWithCompletion___block_invoke;
  v8[3] = &unk_1E5D331D0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __51__HKSPSleepStore_dismissGoodMorningWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_dismissSleepLockOnServer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = self;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing sleep lock on server", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v7 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke;
    v18[3] = &unk_1E5D33098;
    id v19 = v6;
    id v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_475;
    v15[3] = &unk_1E5D32E18;
    id v16 = v20;
    id v9 = v19;
    id v17 = v9;
    id v10 = v20;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v18 withErrorHandler:v15];
    uint64_t v11 = v17;
    id v12 = v9;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [(id)objc_opt_class() _sleepDisabledError];
    id v12 = [v13 futureWithError:v10];
  }

  return v12;
}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_2;
  v4[3] = &unk_1E5D33270;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 dismissSleepLockWithCompletion:v4];
}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep lock on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __43__HKSPSleepStore__dismissSleepLockOnServer__block_invoke_475(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss good morning on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)dismissSleepLockWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self _dismissSleepLockOnServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HKSPSleepStore_dismissSleepLockWithCompletion___block_invoke;
  v8[3] = &unk_1E5D331D0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __49__HKSPSleepStore_dismissSleepLockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 completion:(id)a4
{
}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HKSPSleepStore *)self _sleepAlarmWasDismissedOnDateOnServer:a3 source:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HKSPSleepStore_sleepAlarmWasDismissedOnDate_source_completion___block_invoke;
  v12[3] = &unk_1E5D331D0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

uint64_t __65__HKSPSleepStore_sleepAlarmWasDismissedOnDate_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_sleepAlarmWasDismissedOnDateOnServer:(id)a3 source:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"Local";
      if (a4 == 1) {
        id v10 = @"NanoSync";
      }
      if (a4 == 2) {
        id v10 = @"CloudSync";
      }
      id v11 = v10;
      *(_DWORD *)buf = 138543874;
      id v31 = self;
      __int16 v32 = 2114;
      id v33 = v6;
      __int16 v34 = 2114;
      uint64_t v35 = v11;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was dismissed on date %{public}@ (%{public}@)", buf, 0x20u);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v13 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke;
    v25[3] = &unk_1E5D33298;
    id v26 = v6;
    unint64_t v29 = a4;
    id v27 = v12;
    id v28 = v13;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_476;
    v22[3] = &unk_1E5D32E18;
    id v23 = v28;
    id v15 = v27;
    id v24 = v15;
    id v16 = v28;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v25 withErrorHandler:v22];
    id v17 = v24;
    id v18 = v15;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    id v20 = [(id)objc_opt_class() _sleepDisabledError];
    id v18 = [v19 futureWithError:v20];
  }
  return v18;
}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_2;
  v6[3] = &unk_1E5D33270;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [a2 sleepAlarmWasDismissedOnDate:v5 source:v4 completion:v6];
}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __63__HKSPSleepStore__sleepAlarmWasDismissedOnDateOnServer_source___block_invoke_476(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to dismiss sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 completion:(id)a4
{
}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HKSPSleepStore *)self _sleepAlarmWasSnoozedUntilDateOnServer:a3 source:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKSPSleepStore_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke;
  v12[3] = &unk_1E5D331D0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

uint64_t __66__HKSPSleepStore_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_sleepAlarmWasSnoozedUntilDateOnServer:(id)a3 source:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"Local";
      if (a4 == 1) {
        id v10 = @"NanoSync";
      }
      if (a4 == 2) {
        id v10 = @"CloudSync";
      }
      id v11 = v10;
      *(_DWORD *)buf = 138543874;
      id v31 = self;
      __int16 v32 = 2114;
      id v33 = v6;
      __int16 v34 = 2114;
      uint64_t v35 = v11;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was snoozed until date %{public}@ (%{public}@)", buf, 0x20u);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v13 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke;
    v25[3] = &unk_1E5D33298;
    id v26 = v6;
    unint64_t v29 = a4;
    id v27 = v12;
    id v28 = v13;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_477;
    v22[3] = &unk_1E5D32E18;
    id v23 = v28;
    id v15 = v27;
    id v24 = v15;
    id v16 = v28;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v25 withErrorHandler:v22];
    id v17 = v24;
    id v18 = v15;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    id v20 = [(id)objc_opt_class() _sleepDisabledError];
    id v18 = [v19 futureWithError:v20];
  }
  return v18;
}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_2;
  v6[3] = &unk_1E5D33270;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [a2 sleepAlarmWasSnoozedUntilDate:v5 source:v4 completion:v6];
}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to snooze sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __64__HKSPSleepStore__sleepAlarmWasSnoozedUntilDateOnServer_source___block_invoke_477(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to snooze sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)sleepAlarmWasModifiedWithCompletion:(id)a3
{
}

- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKSPSleepStore *)self _sleepAlarmWasModifiedOnServer:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HKSPSleepStore_sleepAlarmWasModifiedFromSource_completion___block_invoke;
  v10[3] = &unk_1E5D331D0;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

uint64_t __61__HKSPSleepStore_sleepAlarmWasModifiedFromSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_sleepAlarmWasModifiedOnServer:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"Local";
      if (a3 == 1) {
        id v8 = @"NanoSync";
      }
      if (a3 == 2) {
        id v8 = @"CloudSync";
      }
      id v9 = v8;
      *(_DWORD *)buf = 138543618;
      id v28 = self;
      __int16 v29 = 2114;
      unint64_t v30 = v9;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Sleep alarm was modified (%{public}@)", buf, 0x16u);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke;
    v23[3] = &unk_1E5D332C0;
    unint64_t v26 = a3;
    id v24 = v10;
    id v25 = v11;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_478;
    v20[3] = &unk_1E5D32E18;
    id v21 = v25;
    id v13 = v24;
    id v22 = v13;
    id v14 = v25;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v23 withErrorHandler:v20];
    id v15 = v22;
    id v16 = v13;
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F7A0D8];
    id v18 = [(id)objc_opt_class() _sleepDisabledError];
    id v16 = [v17 futureWithError:v18];
  }
  return v16;
}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_2;
  v5[3] = &unk_1E5D33270;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [a2 sleepAlarmWasModifiedFromSource:v4 completion:v5];
}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify sleep alarm on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __49__HKSPSleepStore__sleepAlarmWasModifiedOnServer___block_invoke_478(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify sleep alarm on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)skipUpcomingWakeUpAlarmForDate:(id)a3 completion:(id)a4
{
}

- (void)setUpcomingWakeUpAlarmEnabled:(BOOL)a3 date:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v13 = 0;
  uint64_t v10 = [(HKSPSleepStore *)self upcomingResolvedScheduleOccurrenceAfterDate:v8 error:&v13];
  id v11 = v13;
  if (v10)
  {
    [(HKSPSleepStore *)self setWakeUpAlarmEnabled:v6 resolvedOccurrence:v10 date:v8 completion:v9];
  }
  else
  {
    __int16 v12 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = self;
      _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ no upcoming occurrence", buf, 0xCu);
    }

    v9[2](v9, v11 != 0, v11);
  }
}

- (void)setWakeUpAlarmEnabled:(BOOL)a3 resolvedOccurrence:(id)a4 date:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 1024;
    BOOL v27 = v8;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setting wake up alarm to %d for %{public}@", buf, 0x1Cu);
  }

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  id v15 = [v10 generateOverrideOccurrenceForCurrentDate:v12 gregorianCalendar:v14];

  uint64_t v16 = [v15 alarmConfiguration];
  id v17 = (void *)[v16 mutableCopy];

  [v17 setEnabled:v8];
  [v15 setAlarmConfiguration:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__HKSPSleepStore_setWakeUpAlarmEnabled_resolvedOccurrence_date_completion___block_invoke;
  v20[3] = &unk_1E5D332E8;
  id v21 = v15;
  id v22 = self;
  id v23 = v11;
  id v18 = v11;
  id v19 = v15;
  [(HKSPSleepStore *)self currentSleepScheduleWithCompletion:v20];
}

void __75__HKSPSleepStore_setWakeUpAlarmEnabled_resolvedOccurrence_date_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    BOOL v6 = (void *)[a2 mutableCopy];
    [v6 saveOccurrence:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) saveCurrentSleepSchedule:v6 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch sleep schedule: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_publishNotificationOnServerWithIdentifier:(id)a3 userInfo:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v9 = objc_msgSend(v8, "hksp_supportsSleepDaemon");

  if (v9)
  {
    uint64_t v10 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = self;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Publishing notification with identifier on server: %{public}@", buf, 0x16u);
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v12 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke;
    v23[3] = &unk_1E5D33310;
    id v24 = v6;
    id v25 = v7;
    id v26 = v11;
    id v27 = v12;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_480;
    v20[3] = &unk_1E5D32E18;
    id v21 = v27;
    id v14 = v26;
    id v22 = v14;
    id v15 = v27;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v23 withErrorHandler:v20];
    uint64_t v16 = v22;
    id v17 = v14;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v15 = [(id)objc_opt_class() _sleepDisabledError];
    id v17 = [v18 futureWithError:v15];
  }

  return v17;
}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_2;
  v6[3] = &unk_1E5D33270;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [a2 publishNotificationWithIdentifier:v4 userInfo:v5 completion:v6];
}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish notification on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __70__HKSPSleepStore__publishNotificationOnServerWithIdentifier_userInfo___block_invoke_480(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish notification on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[a4 copy];
  uint64_t v11 = [(HKSPSleepStore *)self _publishNotificationOnServerWithIdentifier:v9 userInfo:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HKSPSleepStore_publishNotificationWithIdentifier_userInfo_completion___block_invoke;
  v14[3] = &unk_1E5D331D0;
  id v15 = v8;
  id v12 = v8;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

uint64_t __72__HKSPSleepStore_publishNotificationWithIdentifier_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_setLockScreenOverrideStateOnServerWithState:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromHKSPSleepLockScreenState(a3);
      *(_DWORD *)buf = 138543874;
      __int16 v30 = self;
      __int16 v31 = 2114;
      uint64_t v32 = v10;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding lock screen state on server: %{public}@ (userInfo: %{public}@)", buf, 0x20u);
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v12 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke;
    v24[3] = &unk_1E5D33298;
    int64_t v28 = a3;
    id v25 = v6;
    id v26 = v11;
    id v27 = v12;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_481;
    v21[3] = &unk_1E5D32E18;
    id v22 = v27;
    id v14 = v26;
    id v23 = v14;
    id v15 = v27;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v24 withErrorHandler:v21];
    uint64_t v16 = v23;
    id v17 = v14;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v19 = [(id)objc_opt_class() _sleepDisabledError];
    id v17 = [v18 futureWithError:v19];
  }
  return v17;
}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_2;
  v6[3] = &unk_1E5D33270;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [a2 setLockScreenOverrideState:v4 userInfo:v5 completion:v6];
}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override lock screen state on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __72__HKSPSleepStore__setLockScreenOverrideStateOnServerWithState_userInfo___block_invoke_481(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override lock screen state on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)[a4 copy];
  uint64_t v10 = [(HKSPSleepStore *)self _setLockScreenOverrideStateOnServerWithState:a3 userInfo:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HKSPSleepStore_setLockScreenOverrideState_userInfo_completion___block_invoke;
  v13[3] = &unk_1E5D331D0;
  id v14 = v8;
  id v11 = v8;
  id v12 = (id)[v10 addCompletionBlock:v13];
}

uint64_t __65__HKSPSleepStore_setLockScreenOverrideState_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromHKSPSleepFocusConfigurationState(a3);
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating sleep focus (%{public}@) mode on server", buf, 0x16u);
    }
    id v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke;
    v17[3] = &unk_1E5D33338;
    unint64_t v19 = a3;
    id v18 = v6;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke_2;
    v14[3] = &unk_1E5D33360;
    id v15 = v11;
    id v16 = v18;
    id v13 = v11;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v17 withErrorHandler:v14];
  }
  else
  {
    id v13 = [(id)objc_opt_class() _sleepDisabledError];
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v13);
  }
}

uint64_t __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createSleepFocusInState:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
}

void __53__HKSPSleepStore_createSleepFocusInState_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSleepFocusModeWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = self;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting sleep focus mode on server", buf, 0xCu);
    }

    __int16 v8 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke;
    v15[3] = &unk_1E5D33388;
    id v16 = v4;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke_2;
    v12[3] = &unk_1E5D33360;
    id v13 = v8;
    id v14 = v16;
    id v10 = v8;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v15 withErrorHandler:v12];
  }
  else
  {
    id v11 = [(id)objc_opt_class() _sleepDisabledError];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

uint64_t __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteSleepFocusModeWithCompletion:*(void *)(a1 + 32)];
}

void __53__HKSPSleepStore_deleteSleepFocusModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = objc_msgSend(v7, "hksp_supportsSleepDaemon");

  if (v8)
  {
    id v9 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromHKSPSleepFocusConfigurationState(a3);
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Configuring sleep focus (state: %{public}@) on server", buf, 0x16u);
    }
    id v11 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke;
    v17[3] = &unk_1E5D33338;
    unint64_t v19 = a3;
    id v18 = v6;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke_2;
    v14[3] = &unk_1E5D33360;
    id v15 = v11;
    id v16 = v18;
    id v13 = v11;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v17 withErrorHandler:v14];
  }
  else
  {
    id v13 = [(id)objc_opt_class() _sleepDisabledError];
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v13);
  }
}

uint64_t __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 configureSleepFocusWithState:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
}

void __58__HKSPSleepStore_configureSleepFocusWithState_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to configure sleep focus mode on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_setWidgetOverrideStateOnServerWithState:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if (v6)
  {
    uint64_t v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = NSStringFromHKSPSleepWidgetState(a3);
      *(_DWORD *)buf = 138543618;
      id v27 = self;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding sleep widget state on server: %{public}@", buf, 0x16u);
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v10 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke;
    v22[3] = &unk_1E5D332C0;
    int64_t v25 = a3;
    id v23 = v9;
    id v24 = v10;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_482;
    v19[3] = &unk_1E5D32E18;
    id v20 = v24;
    id v12 = v23;
    id v21 = v12;
    id v13 = v24;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v22 withErrorHandler:v19];
    id v14 = v21;
    id v15 = v12;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F7A0D8];
    id v17 = [(id)objc_opt_class() _sleepDisabledError];
    id v15 = [v16 futureWithError:v17];
  }
  return v15;
}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_2;
  v5[3] = &unk_1E5D33270;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [a2 setWidgetOverrideState:v4 completion:v5];
}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override sleep widget state on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __59__HKSPSleepStore__setWidgetOverrideStateOnServerWithState___block_invoke_482(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to override sleep widget state on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKSPSleepStore *)self _setWidgetOverrideStateOnServerWithState:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HKSPSleepStore_setWidgetOverrideState_completion___block_invoke;
  v10[3] = &unk_1E5D331D0;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

uint64_t __52__HKSPSleepStore_setWidgetOverrideState_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_clearWidgetOverrideOnServer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v22 = self;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing sleep widget override on server", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v7 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke;
    v18[3] = &unk_1E5D33098;
    id v19 = v6;
    id v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_483;
    v15[3] = &unk_1E5D32E18;
    id v16 = v20;
    id v9 = v19;
    id v17 = v9;
    id v10 = v20;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v18 withErrorHandler:v15];
    id v11 = v17;
    id v12 = v9;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [(id)objc_opt_class() _sleepDisabledError];
    id v12 = [v13 futureWithError:v10];
  }

  return v12;
}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_2;
  v4[3] = &unk_1E5D33270;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 clearWidgetOverrideWithCompletion:v4];
}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to clear sleep widget override on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sleep" code:1000 userInfo:0];
      [v7 finishWithError:v8];
    }
  }
}

void __46__HKSPSleepStore__clearWidgetOverrideOnServer__block_invoke_483(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to clear sleep widget override on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)clearWidgetOverrideWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self _clearWidgetOverrideOnServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HKSPSleepStore_clearWidgetOverrideWithCompletion___block_invoke;
  v8[3] = &unk_1E5D331D0;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __52__HKSPSleepStore_clearWidgetOverrideWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (id)_publishWakeUpResultsNotificationOnServer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = objc_msgSend(v3, "hksp_supportsSleepDaemon");

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v22 = self;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Publishing wake up results notification on server", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v7 = [(HKSPSleepStore *)self description];
    connectionProvider = self->_connectionProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke;
    v18[3] = &unk_1E5D33098;
    id v19 = v6;
    id v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_485;
    v15[3] = &unk_1E5D32E18;
    id v16 = v20;
    id v9 = v19;
    id v17 = v9;
    id v10 = v20;
    [(HKSPXPCConnectionProvider *)connectionProvider performRemoteBlock:v18 withErrorHandler:v15];
    uint64_t v11 = v17;
    id v12 = v9;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = [(id)objc_opt_class() _sleepDisabledError];
    id v12 = [v13 futureWithError:v10];
  }

  return v12;
}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_2;
  v4[3] = &unk_1E5D333B0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 publishWakeUpResultsNotificationWithCompletion:v4];
}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish wake up results notification on server: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    __int16 v8 = HKSPNullify(a2);
    [v7 finishWithResult:v8];
  }
}

void __59__HKSPSleepStore__publishWakeUpResultsNotificationOnServer__block_invoke_485(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to publish wake up results notification on server: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepStore *)self _publishWakeUpResultsNotificationOnServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HKSPSleepStore_publishWakeUpResultsNotificationWithCompletion___block_invoke;
  v8[3] = &unk_1E5D333D8;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

void __65__HKSPSleepStore_publishWakeUpResultsNotificationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  HKSPNilify(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)nextEventDueAfterDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSPSleepStore *)self nextEventDueAfterDateFuture:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HKSPSleepStore_nextEventDueAfterDate_completion___block_invoke;
  v10[3] = &unk_1E5D33400;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

void __51__HKSPSleepStore_nextEventDueAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HKSPSleepStore *)self nextEventWithIdentifierFuture:a3 dueAfterDate:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKSPSleepStore_nextEventWithIdentifier_dueAfterDate_completion___block_invoke;
  v12[3] = &unk_1E5D33428;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __66__HKSPSleepStore_nextEventWithIdentifier_dueAfterDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    HKSPNilify(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (id)nextEventDueAfterDateFuture:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepStore *)self sleepScheduleModelFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HKSPSleepStore_nextEventDueAfterDateFuture___block_invoke;
  v9[3] = &unk_1E5D32EE0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __46__HKSPSleepStore_nextEventDueAfterDateFuture___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 nextEventDueAfterDate:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = HKSPNullify(v2);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)nextEventDueAfterDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HKSPSleepStore *)self sleepScheduleModelWithError:a4];
  id v8 = [v7 nextEventDueAfterDate:v6];

  return v8;
}

- (id)nextEventWithIdentifierFuture:(id)a3 dueAfterDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKSPSleepStore *)self sleepScheduleModelFuture];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HKSPSleepStore_nextEventWithIdentifierFuture_dueAfterDate___block_invoke;
  v13[3] = &unk_1E5D33450;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 flatMap:v13];

  return v11;
}

id __61__HKSPSleepStore_nextEventWithIdentifierFuture_dueAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 nextEventWithIdentifier:*(void *)(a1 + 32) dueAfterDate:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = HKSPNullify(v2);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HKSPSleepStore *)self sleepScheduleModelWithError:a5];
  id v11 = [v10 nextEventWithIdentifier:v9 dueAfterDate:v8];

  return v11;
}

- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep coaching onboarding version to %{public}@", buf, 0x16u);
  }
  id v9 = [(HKSPSleepStore *)self currentSleepEventRecordFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKSPSleepStore_setSleepCoachingOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E5D33478;
  void v12[4] = self;
  id v13 = v6;
  int64_t v14 = a3;
  id v10 = v6;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __72__HKSPSleepStore_setSleepCoachingOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HKSPNilify(a2);
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
    [v7 updateSleepCoachingOnboardingCompletedVersion:v8 completedDate:v9];

    [*(id *)(a1 + 32) saveCurrentSleepEventRecord:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v10 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep coaching onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep tracking onboarding version to %{public}@", buf, 0x16u);
  }
  id v9 = [(HKSPSleepStore *)self currentSleepEventRecordFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKSPSleepStore_setSleepTrackingOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E5D33478;
  void v12[4] = self;
  id v13 = v6;
  int64_t v14 = a3;
  id v10 = v6;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __72__HKSPSleepStore_setSleepTrackingOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HKSPNilify(a2);
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
    [v7 updateSleepTrackingOnboardingCompletedVersion:v8 completedDate:v9];

    [*(id *)(a1 + 32) saveCurrentSleepEventRecord:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v10 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep tracking onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting sleep wind down shortcuts onboarding version to %{public}@", buf, 0x16u);
  }
  id v9 = [(HKSPSleepStore *)self currentSleepEventRecordFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HKSPSleepStore_setSleepWindDownShortcutsOnboardingCompletedVersion_completion___block_invoke;
  v12[3] = &unk_1E5D33478;
  void v12[4] = self;
  id v13 = v6;
  int64_t v14 = a3;
  id v10 = v6;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __81__HKSPSleepStore_setSleepWindDownShortcutsOnboardingCompletedVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HKSPNilify(a2);
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
    [v7 updateSleepWindDownShortcutsOnboardingCompletedVersion:v8 completedDate:v9];

    [*(id *)(a1 + 32) saveCurrentSleepEventRecord:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v10 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve event record for setting sleep wind down shortcuts onboarding: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_notifyObserversForChangedSleepSchedule:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep schedule: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke;
  v8[3] = &unk_1E5D334C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v8];
}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) sleepScheduleModelFuture];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke_2;
    v8[3] = &unk_1E5D334A0;
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    id v7 = (id)[v4 addSuccessBlock:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:*(void *)(a1 + 32) sleepScheduleDidChange:*(void *)(a1 + 40)];
  }
}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSchedule___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 sleepSettings];
  uint64_t v6 = [v4 sleepEventRecord];

  id v7 = +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:v3 sleepSettings:v5 sleepEventRecord:v6];

  [*(id *)(a1 + 40) sleepStore:*(void *)(a1 + 48) sleepScheduleModelDidChange:v7];
}

- (void)_notifyObserversForChangedSleepSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep settings: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke;
  v8[3] = &unk_1E5D334C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v8];
}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    id v5 = [*(id *)(a1 + 32) sleepScheduleModelFuture];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke_2;
    v8[3] = &unk_1E5D334A0;
    id v9 = *(id *)(a1 + 40);
    id v10 = v4;
    uint64_t v11 = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = (id)[v5 addSuccessBlock:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:*(void *)(a1 + 32) sleepSettingsDidChange:*(void *)(a1 + 40)];
  }
}

void __58__HKSPSleepStore__notifyObserversForChangedSleepSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sleepSchedule];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 sleepEventRecord];

  id v7 = +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:v4 sleepSettings:v5 sleepEventRecord:v6];

  [*(id *)(a1 + 40) sleepStore:*(void *)(a1 + 48) sleepScheduleModelDidChange:v7];
}

- (void)_notifyObserversForChangedSleepEventRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep event record: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke;
  v8[3] = &unk_1E5D334C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v8];
}

void __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) sleepScheduleModelFuture];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke_2;
    v8[3] = &unk_1E5D334A0;
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    id v7 = (id)[v4 addSuccessBlock:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:*(void *)(a1 + 32) sleepEventRecordDidChange:*(void *)(a1 + 40)];
  }
}

void __61__HKSPSleepStore__notifyObserversForChangedSleepEventRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sleepSchedule];
  id v5 = [v3 sleepSettings];

  id v6 = +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:v4 sleepSettings:v5 sleepEventRecord:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) sleepStore:*(void *)(a1 + 48) sleepScheduleModelDidChange:v6];
}

- (void)_notifyObserversForChangedSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromHKSPSleepMode(a3);
    id v9 = NSStringFromHKSPSleepModeChangeReason(a4);
    *(_DWORD *)buf = 138543874;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for changed sleep mode: %{public}@ (%{public}@)", buf, 0x20u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKSPSleepStore__notifyObserversForChangedSleepMode_reason___block_invoke;
  v11[3] = &unk_1E5D334F0;
  v11[4] = self;
  void v11[5] = a3;
  v11[6] = a4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
}

void __61__HKSPSleepStore__notifyObserversForChangedSleepMode_reason___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:a1[4] sleepModeDidChange:a1[5] reason:a1[6]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:a1[4] sleepModeOnDidChange:a1[5] != 0];
  }
}

- (void)_notifyObserversForSleepEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep event: %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKSPSleepStore__notifyObserversForSleepEvent___block_invoke;
  v8[3] = &unk_1E5D334C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v8];
}

void __48__HKSPSleepStore__notifyObserversForSleepEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepStore:*(void *)(a1 + 32) sleepEventDidOccur:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversForChangedSleepScheduleState:(unint64_t)a3 reason:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromHKSPSleepScheduleState(a3);
    id v9 = NSStringFromHKSPSleepScheduleStateChangeReason(a4);
    *(_DWORD *)buf = 138543874;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep state: %{public}@ (%{public}@)", buf, 0x20u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HKSPSleepStore__notifyObserversForChangedSleepScheduleState_reason___block_invoke;
  v11[3] = &unk_1E5D334F0;
  v11[4] = self;
  void v11[5] = a3;
  v11[6] = a4;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
}

void __70__HKSPSleepStore__notifyObserversForChangedSleepScheduleState_reason___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:a1[4] sleepScheduleStateDidChange:a1[5] reason:a1[6]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 sleepStore:a1[4] sleepScheduleStateDidChange:a1[5]];
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  [(HKSPXPCConnectionProvider *)self->_connectionProvider invalidate];
  [(HKSPSleepFocusModeBridge *)self->_sleepFocusModeBridge invalidate];
  v4.receiver = self;
  v4.super_class = (Class)HKSPSleepStore;
  [(HKSPSleepStore *)&v4 dealloc];
}

- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for sleep focus mode update: %{public}@", buf, 0x16u);
  }

  uint64_t v7 = [(HKSPSleepStore *)self sleepStoreCache];
  [v7 purgeCachedSleepMode];

  observers = self->_observers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HKSPSleepStore_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke;
  v10[3] = &unk_1E5D334C8;
  void v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v10];
}

void __72__HKSPSleepStore_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepStore:*(void *)(a1 + 32) sleepFocusConfigurationDidUpdate:*(void *)(a1 + 40)];
  }
}

- (HKSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HKSleepHealthStore)sleepHealthStore
{
  return self->_sleepHealthStore;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (HKSPXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (HKSPSleepStoreModelCache)sleepStoreCache
{
  return self->_sleepStoreCache;
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (HKSPThrottler)reconnectThrottler
{
  return self->_reconnectThrottler;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setSyncAnchorContainer:(id)a3
{
}

- (HKSPSleepWidgetManager)widgetManager
{
  return self->_widgetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_syncAnchorContainer, 0);
  objc_storeStrong((id *)&self->_sleepStoreExportedObject, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_sleepFocusModeBridge, 0);
  objc_storeStrong((id *)&self->_reconnectThrottler, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
  objc_storeStrong((id *)&self->_sleepStoreCache, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepHealthStore, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end