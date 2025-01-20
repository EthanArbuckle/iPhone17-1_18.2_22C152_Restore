@interface RTPeopleDiscoveryProvider
+ (double)_convertObservationIntervalToDouble:(unint64_t)a3;
+ (id)computeAdvMetrics:(int64_t)a3 identities:(id)a4 numOfResolvedAdvs:(int64_t)a5;
+ (id)getStoreURL;
+ (int)_scanLevelFromServiceLevel:(unint64_t)a3 observationInterval:(unint64_t)a4;
+ (int64_t)periodicPurgePolicy;
- (BOOL)broughtUp;
- (BOOL)contactScoreDataAvailable;
- (BOOL)hasLoadedPersistedRecords;
- (BOOL)isPeopleDensityEventsEnabled;
- (BOOL)isProximityEventsEnabled;
- (BOOL)peopleDensityStoreAvailable;
- (BOOL)proximityStoreAvailable;
- (CLLocationManagerGathering)advertisementManager;
- (NSMutableDictionary)clientConfigurations;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTPeopleDensityRecord)peopleDensityRecord;
- (RTPeopleDensityStore)peopleDensityStore;
- (RTPeopleDiscoveryContactRecord)contactRecord;
- (RTPeopleDiscoveryPersistenceStore)shortTermStore;
- (RTPeopleDiscoveryProvider)init;
- (RTPeopleDiscoveryProvider)initWithDefaultManager:(id)a3 proximityEventStore:(id)a4 peopleDensityStore:(id)a5 advertisementManager:(id)a6 dataProtectionManager:(id)a7 timerManager:(id)a8;
- (RTPeopleDiscoveryServiceConfiguration)aggregatedConfiguration;
- (RTPersistentTimer)scoringTimer;
- (RTProximityEventStore)proximityEventStore;
- (RTTimer)backupTimer;
- (RTTimerManager)timerManager;
- (double)expirationInterval;
- (id)_fetchAllIdentities;
- (id)_logClientConfigurations;
- (id)loadShortTermRecord;
- (unint64_t)minimumIdentities;
- (void)_addClientConfiguration:(id)a3 withIdentifier:(id)a4;
- (void)_addPeopleDensityBundle:(id)a3 handler:(id)a4;
- (void)_addProximityEvent:(id)a3 handler:(id)a4;
- (void)_aggregateAndApplyConfiguration;
- (void)_armNewInteractionsTimer;
- (void)_clearPeopleDensityBundles:(id)a3;
- (void)_clearProximityEvents:(id)a3;
- (void)_computeDailyContactScores;
- (void)_didCloseProximityEvent:(id)a3;
- (void)_fetchAndReconcileAdvertisements;
- (void)_fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4;
- (void)_fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)_fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4;
- (void)_fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)_loadAndMergeShortTermRecord;
- (void)_monitorEvents;
- (void)_onDataProtectionNotification:(id)a3;
- (void)_onPeopleDensityStoreNotification:(id)a3;
- (void)_onProximityStoreNotification:(id)a3;
- (void)_purgeEvents;
- (void)_removeClientConfiguration:(id)a3;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)addClient:(id)a3 withIdentifier:(id)a4 withConfiguration:(id)a5;
- (void)addPeopleDensityBundle:(id)a3 handler:(id)a4;
- (void)addProximityEvent:(id)a3 handler:(id)a4;
- (void)clearPeopleDensityBundles:(id)a3;
- (void)clearProximityEvents:(id)a3;
- (void)computeContactScores:(id)a3;
- (void)didCloseProximityEvent:(id)a3;
- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchMostRecentPeopleDensity:(id)a3;
- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)injectAdv:(id)a3 handler:(id)a4;
- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7;
- (void)onBufferedDevicesReceivedNotification;
- (void)onCoreLocationProviderCameUpNotification;
- (void)onDataProtectionNotification:(id)a3;
- (void)onPeopleDensityStoreNotification:(id)a3;
- (void)onProximityStoreNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)removeClient:(id)a3;
- (void)saveShortTermRecord;
- (void)setAdvertisementManager:(id)a3;
- (void)setAggregatedConfiguration:(id)a3;
- (void)setBackupTimer:(id)a3;
- (void)setBroughtUp:(BOOL)a3;
- (void)setClientConfigurations:(id)a3;
- (void)setContactRecord:(id)a3;
- (void)setContactScoreDataAvailable:(BOOL)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setExpirationInterval:(double)a3;
- (void)setHasLoadedPersistedRecords:(BOOL)a3;
- (void)setMinimumIdentities:(unint64_t)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setPeopleDensityRecord:(id)a3;
- (void)setPeopleDensityStore:(id)a3;
- (void)setPeopleDensityStoreAvailable:(BOOL)a3;
- (void)setProximityEventStore:(id)a3;
- (void)setProximityStoreAvailable:(BOOL)a3;
- (void)setScoringTimer:(id)a3;
- (void)setShortTermStore:(id)a3;
- (void)setTimerManager:(id)a3;
@end

@implementation RTPeopleDiscoveryProvider

- (RTPeopleDiscoveryProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager_);
}

- (RTPeopleDiscoveryProvider)initWithDefaultManager:(id)a3 proximityEventStore:(id)a4 peopleDensityStore:(id)a5 advertisementManager:(id)a6 dataProtectionManager:(id)a7 timerManager:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    LOWORD(buf) = 0;
    v44 = "Invalid parameter not satisfying: defaultsManager";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&buf, 2u);
    goto LABEL_22;
  }
  if (!v15)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    LOWORD(buf) = 0;
    v44 = "Invalid parameter not satisfying: proximityEventStore";
    goto LABEL_21;
  }
  if (!v16)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    LOWORD(buf) = 0;
    v44 = "Invalid parameter not satisfying: peopleDensityStore";
    goto LABEL_21;
  }
  if (!v17)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    LOWORD(buf) = 0;
    v44 = "Invalid parameter not satisfying: advertisementManager";
    goto LABEL_21;
  }
  if (!v18)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      v44 = "Invalid parameter not satisfying: dataProtectionManager";
      goto LABEL_21;
    }
LABEL_22:

    v45 = 0;
    goto LABEL_23;
  }
  v58.receiver = self;
  v58.super_class = (Class)RTPeopleDiscoveryProvider;
  v20 = [(RTNotifier *)&v58 init];
  v21 = v20;
  if (v20)
  {
    [(RTPeopleDiscoveryProvider *)v20 setDefaultsManager:v14];
    [(RTPeopleDiscoveryProvider *)v21 setProximityEventStore:v15];
    [(RTPeopleDiscoveryProvider *)v21 setPeopleDensityStore:v16];
    [(RTPeopleDiscoveryProvider *)v21 setAdvertisementManager:v17];
    [(RTPeopleDiscoveryProvider *)v21 setProximityStoreAvailable:0];
    [(RTPeopleDiscoveryProvider *)v21 setPeopleDensityStoreAvailable:0];
    [(RTPeopleDiscoveryProvider *)v21 setContactScoreDataAvailable:0];
    [(RTPeopleDiscoveryProvider *)v21 setHasLoadedPersistedRecords:0];
    v21->_broughtUp = 0;
    id v52 = v19;
    [(RTPeopleDiscoveryProvider *)v21 setTimerManager:v19];
    [(RTPeopleDiscoveryProvider *)v21 setDataProtectionManager:v18];
    v22 = [RTPeopleDiscoveryContactRecord alloc];
    v23 = [(RTNotifier *)v21 queue];
    v24 = [(RTPeopleDiscoveryProvider *)v21 defaultsManager];
    v25 = [(RTPeopleDiscoveryContactRecord *)v22 initWithQueue:v23 defaultsManager:v24];
    [(RTPeopleDiscoveryProvider *)v21 setContactRecord:v25];

    v26 = [(RTPeopleDiscoveryProvider *)v21 contactRecord];
    [v26 addObserver:v21];

    v27 = [RTPeopleDensityRecord alloc];
    v28 = [(RTNotifier *)v21 queue];
    v29 = [(RTPeopleDiscoveryProvider *)v21 peopleDensityStore];
    v30 = [(RTPeopleDiscoveryProvider *)v21 defaultsManager];
    v31 = [(RTPeopleDensityRecord *)v27 initWithQueue:v28 peopleDensityStore:v29 defaultsManager:v30];
    [(RTPeopleDiscoveryProvider *)v21 setPeopleDensityRecord:v31];

    v32 = [RTPeopleDiscoveryPersistenceStore alloc];
    v33 = [(RTPeopleDiscoveryProvider *)v21 contactRecord];
    v34 = [(RTPeopleDiscoveryProvider *)v21 peopleDensityRecord];
    v35 = [(RTPeopleDiscoveryPersistenceStore *)v32 initWithContactRecord:v33 densityRecord:v34];
    [(RTPeopleDiscoveryProvider *)v21 setShortTermStore:v35];

    v36 = [(RTPeopleDiscoveryProvider *)v21 defaultsManager];
    v37 = [v36 objectForKey:@"RTDefaultsPeopleDiscoveryProviderExpirationInterval"];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v39 = 0.0;
    if (isKindOfClass) {
      [v37 doubleValue];
    }
    [(RTPeopleDiscoveryProvider *)v21 setExpirationInterval:v39];
    v40 = [(RTPeopleDiscoveryProvider *)v21 defaultsManager];
    v41 = [v40 objectForKey:@"RTDefaultsPeopleDiscoveryProviderMinimumIdentities"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v42 = (unint64_t)(double)[v41 integerValue];
    }
    else {
      unint64_t v42 = 10;
    }
    [(RTPeopleDiscoveryProvider *)v21 setMinimumIdentities:v42];
    v47 = objc_opt_new();
    [(RTPeopleDiscoveryProvider *)v21 setClientConfigurations:v47];

    objc_initWeak(&buf, v21);
    uint64_t v48 = objc_opt_new();
    notificationHelper = v21->_notificationHelper;
    v21->_notificationHelper = (RTDarwinNotificationHelper *)v48;

    v50 = v21->_notificationHelper;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke;
    v55[3] = &unk_1E6B91900;
    objc_copyWeak(&v56, &buf);
    [(RTDarwinNotificationHelper *)v50 addObserverForNotificationName:@"com.apple.locationd.gathering.bufferedDevicesReceived" handler:v55];
    v51 = v21->_notificationHelper;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_3;
    v53[3] = &unk_1E6B91900;
    objc_copyWeak(&v54, &buf);
    [(RTDarwinNotificationHelper *)v51 addObserverForNotificationName:@"com.apple.locationd.gathering.came_up" handler:v53];
    [(RTService *)v21 setup];
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&buf);

    id v19 = v52;
  }
  self = v21;
  v45 = self;
LABEL_23:

  return v45;
}

void __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_2;
    block[3] = &unk_1E6B90E70;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) onBufferedDevicesReceivedNotification];
}

void __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_4;
    block[3] = &unk_1E6B90E70;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) onCoreLocationProviderCameUpNotification];
}

- (void)_setup
{
  if (self->_broughtUp)
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      v3 = "#RTPeopleDiscoveryProvider is already up";
LABEL_10:
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    }
  }
  else
  {
    id v5 = +[RTPlatform currentPlatform];
    char v6 = [v5 iPhoneDevice];

    if (v6)
    {
      v7 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
      v8 = +[RTNotification notificationName];
      [v7 addObserver:self selector:sel_onProximityStoreNotification_ name:v8];

      v9 = [(RTPeopleDiscoveryProvider *)self peopleDensityStore];
      v10 = +[RTNotification notificationName];
      [v9 addObserver:self selector:sel_onPeopleDensityStoreNotification_ name:v10];

      v11 = [(RTPeopleDiscoveryProvider *)self dataProtectionManager];
      v12 = +[RTNotification notificationName];
      [v11 addObserver:self selector:sel_onDataProtectionNotification_ name:v12];

      if (![(RTPeopleDiscoveryProvider *)self hasLoadedPersistedRecords]) {
        [(RTPeopleDiscoveryProvider *)self _loadAndMergeShortTermRecord];
      }
      v13 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__RTPeopleDiscoveryProvider__setup__block_invoke;
      block[3] = &unk_1E6B90E70;
      void block[4] = self;
      dispatch_async(v13, block);

      self->_broughtUp = 1;
      id v14 = [NSString alloc];
      id v15 = (void *)[v14 initWithCString:RTAnalyticsEventPeopleDiscoveryEvents encoding:1];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __35__RTPeopleDiscoveryProvider__setup__block_invoke_92;
      v21 = &unk_1E6B943B0;
      id v22 = v15;
      id v23 = &__block_literal_global_78;
      uint64_t v2 = v15;
      id v16 = (void *)MEMORY[0x1E016DB00](&v18);
      id v17 = [NSString stringWithFormat:@"com.apple.%@", v2, v18, v19, v20, v21];
      AnalyticsSendEventLazy();
    }
    else
    {
      uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id buf = 0;
        v3 = "#RTPeopleDiscoveryProvider disabled on platforms other than iPhone";
        goto LABEL_10;
      }
    }
  }
}

uint64_t __35__RTPeopleDiscoveryProvider__setup__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchAndReconcileAdvertisements];
  [*(id *)(a1 + 32) _monitorEvents];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _armNewInteractionsTimer];
}

void *__35__RTPeopleDiscoveryProvider__setup__block_invoke_2()
{
  return &unk_1F3453FF8;
}

id __35__RTPeopleDiscoveryProvider__setup__block_invoke_92(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

- (void)_shutdownWithHandler:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  if (self->_broughtUp)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "shutdown people discovery", v17, 2u);
    }

    char v6 = [(RTPeopleDiscoveryProvider *)self notificationHelper];
    [v6 removeObserverForNotificationName:@"com.apple.locationd.gathering.bufferedDevicesReceived"];

    v7 = [(RTPeopleDiscoveryProvider *)self notificationHelper];
    [v7 removeObserverForNotificationName:@"com.apple.locationd.gathering.came_up"];

    v8 = [(RTPeopleDiscoveryProvider *)self dataProtectionManager];
    [v8 removeObserver:self];

    v9 = [(RTPeopleDiscoveryProvider *)self backupTimer];

    if (v9)
    {
      v10 = [(RTPeopleDiscoveryProvider *)self backupTimer];
      [v10 invalidate];

      [(RTPeopleDiscoveryProvider *)self setBackupTimer:0];
    }
    v11 = [(RTPeopleDiscoveryProvider *)self scoringTimer];

    if (v11)
    {
      v12 = [(RTPeopleDiscoveryProvider *)self scoringTimer];
      [v12 invalidate];

      [(RTPeopleDiscoveryProvider *)self setScoringTimer:0];
    }
    self->_broughtUp = 0;
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"#RTPeopleDiscoveryProvider is already down";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v16 = [v13 errorWithDomain:v14 code:2 userInfo:v15];

    ((void (**)(id, void *))v4)[2](v4, v16);
  }
}

- (BOOL)isProximityEventsEnabled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(NSMutableDictionary *)self->_clientConfigurations count];
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "isProximityEventsEnabled: _clientConfigurations %d", (uint8_t *)v6, 8u);
  }

  return [(NSMutableDictionary *)self->_clientConfigurations count] != 0;
}

- (BOOL)isPeopleDensityEventsEnabled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(NSMutableDictionary *)self->_clientConfigurations count];
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "isPeopleDensityEventsEnabled: _clientConfigurations %d", (uint8_t *)v6, 8u);
  }

  return [(NSMutableDictionary *)self->_clientConfigurations count] != 0;
}

- (void)_armNewInteractionsTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  backupTimer = self->_backupTimer;
  if (backupTimer)
  {
    [(RTTimer *)backupTimer invalidate];
    int v4 = self->_backupTimer;
    self->_backupTimer = 0;
  }
  objc_initWeak(&location, self);
  timerManager = self->_timerManager;
  char v6 = [(RTNotifier *)self queue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __53__RTPeopleDiscoveryProvider__armNewInteractionsTimer__block_invoke;
  v13 = &unk_1E6B91900;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [(RTTimerManager *)timerManager timerWithIdentifier:@"RTPeopleDiscoveryProviderBackupTimer" queue:v6 handler:&v10];
  v8 = self->_backupTimer;
  self->_backupTimer = v7;

  v9 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v17 = 900;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Backup timer schedule after, %lu seconds", buf, 0xCu);
  }

  -[RTTimer fireAfterDelay:interval:](self->_backupTimer, "fireAfterDelay:interval:", 900.0, 900.0, v10, v11, v12, v13);
  [(RTTimer *)self->_backupTimer resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__RTPeopleDiscoveryProvider__armNewInteractionsTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "Backup timer fires", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchAndReconcileAdvertisements];
  [WeakRetained _monitorEvents];
}

- (void)_computeDailyContactScores
{
  v3 = [(RTPeopleDiscoveryProvider *)self contactRecord];
  [v3 updateDailyContactScores];

  [(RTPeopleDiscoveryProvider *)self saveShortTermRecord];
}

- (void)_monitorEvents
{
  v3 = [(RTPeopleDiscoveryProvider *)self contactRecord];
  int v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 checkAndCloseProximityEventsIfNeeded:v4];

  if ([(RTPeopleDiscoveryProvider *)self hasLoadedPersistedRecords]) {
    goto LABEL_3;
  }
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [(id)objc_opt_class() getStoreURL];
  uint64_t v7 = [v6 path];
  char v8 = [v5 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
LABEL_3:
    [(RTPeopleDiscoveryProvider *)self saveShortTermRecord];
  }
}

- (void)_purgeEvents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(RTPeopleDiscoveryProvider *)self expirationInterval];
  id v5 = [v3 dateByAddingTimeInterval:-v4];

  char v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [(RTPeopleDiscoveryProvider *)self expirationInterval];
    uint64_t v8 = v7;
    v9 = [v5 getFormattedDateString];
    int v12 = 134218242;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "_purgeEvents purging with expirationInterval: %f before date: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
  [v10 purgeProximityEventsPredating:v5 handler:&__block_literal_global_105];

  uint64_t v11 = [(RTPeopleDiscoveryProvider *)self peopleDensityStore];
  [v11 purgePeopleDensityPredating:v5 handler:&__block_literal_global_108];
}

void __41__RTPeopleDiscoveryProvider__purgeEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = [v2 description];
      int v5 = 138412290;
      char v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to purge proximity events, error %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __41__RTPeopleDiscoveryProvider__purgeEvents__block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = [v2 description];
      int v5 = 138412290;
      char v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to purge density bundles, error %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_loadAndMergeShortTermRecord
{
  id v7 = [(RTPeopleDiscoveryProvider *)self loadShortTermRecord];
  if (v7)
  {
    v3 = [(RTPeopleDiscoveryProvider *)self contactRecord];
    double v4 = [v7 contactRecord];
    [v3 mergeWithAnotherContactRecord:v4];

    int v5 = [(RTPeopleDiscoveryProvider *)self peopleDensityRecord];
    char v6 = [v7 densityRecord];
    [v5 mergeWithAnotherDensityRecord:v6];

    [(RTPeopleDiscoveryProvider *)self setHasLoadedPersistedRecords:1];
  }
}

- (void)onBufferedDevicesReceivedNotification
{
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "onBufferedDevicesReceivedNotification", v4, 2u);
  }

  [(RTPeopleDiscoveryProvider *)self _fetchAndReconcileAdvertisements];
  [(RTPeopleDiscoveryProvider *)self _monitorEvents];
  [(RTTimer *)self->_backupTimer fireAfterDelay:900.0 interval:900.0];
}

- (void)onCoreLocationProviderCameUpNotification
{
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "onCoreLocationProviderCameUpNotification", buf, 2u);
  }

  double v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTPeopleDiscoveryProvider_onCoreLocationProviderCameUpNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __69__RTPeopleDiscoveryProvider_onCoreLocationProviderCameUpNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAggregatedConfiguration:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _aggregateAndApplyConfiguration];
}

- (void)onProximityStoreNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTPeopleDiscoveryProvider_onProximityStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTPeopleDiscoveryProvider_onProximityStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onProximityStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onProximityStoreNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7) {
    -[RTPeopleDiscoveryProvider setProximityStoreAvailable:](self, "setProximityStoreAvailable:", [v4 availability] == 2);
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(RTPeopleDiscoveryProvider *)self proximityStoreAvailable];
    uint64_t v10 = @"NO";
    if (v9) {
      uint64_t v10 = @"YES";
    }
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Proximity Store availability change to , %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)onPeopleDensityStoreNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTPeopleDiscoveryProvider_onPeopleDensityStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__RTPeopleDiscoveryProvider_onPeopleDensityStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onPeopleDensityStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onPeopleDensityStoreNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7) {
    -[RTPeopleDiscoveryProvider setPeopleDensityStoreAvailable:](self, "setPeopleDensityStoreAvailable:", [v4 availability] == 2);
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(RTPeopleDiscoveryProvider *)self peopleDensityStoreAvailable];
    uint64_t v10 = @"NO";
    if (v9) {
      uint64_t v10 = @"YES";
    }
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "People Density Store availability change to , %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTPeopleDiscoveryProvider_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTPeopleDiscoveryProvider_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDataProtectionNotification:*(void *)(a1 + 40)];
}

- (void)_onDataProtectionNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 availability];
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = +[RTDataProtectionManager encryptedDataAvailabilityToString:v5];
      int v10 = 136315394;
      int v11 = "-[RTPeopleDiscoveryProvider _onDataProtectionNotification:]";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Received keybag notification, %@", (uint8_t *)&v10, 0x16u);
    }
    if (v5 == 2)
    {
      if (![(RTPeopleDiscoveryProvider *)self hasLoadedPersistedRecords]) {
        [(RTPeopleDiscoveryProvider *)self _loadAndMergeShortTermRecord];
      }
      [(RTPeopleDiscoveryProvider *)self setContactScoreDataAvailable:1];
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [v4 name];
      int v10 = 136315394;
      int v11 = "-[RTPeopleDiscoveryProvider _onDataProtectionNotification:]";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, unknown notification name, %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_fetchAndReconcileAdvertisements
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v101 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider fetching advertisements", v101, 2u);
  }

  *(void *)v101 = 0;
  v102 = v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__97;
  v105 = __Block_byref_object_dispose__97;
  id v106 = (id)objc_opt_new();
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__97;
  v99 = __Block_byref_object_dispose__97;
  id v100 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v87 = 0;
  v88 = (double *)&v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  id v4 = [(RTPeopleDiscoveryProvider *)self advertisementManager];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke;
  v81[3] = &unk_1E6B99380;
  v83 = v101;
  v84 = &v91;
  v85 = &v87;
  v86 = &v95;
  uint64_t v5 = v3;
  v82 = v5;
  [v4 fetchAdvertisementsDetailedWithHandler:v81];

  dsema = v5;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(dsema, v7)) {
    goto LABEL_8;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  int v11 = objc_opt_new();
  __int16 v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
  uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v14 = [v13 filteredArrayUsingPredicate:v12];
  id v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
  v116[0] = *MEMORY[0x1E4F28568];
  *(void *)id buf = @"semaphore wait timeout";
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v116 count:1];
  uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
LABEL_8:
    id v20 = 0;
  }

  id v21 = v20;
  v61 = v21;
  if (v96[5])
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = [(id)v96[5] description];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to fetch advertisements, %@", buf, 0xCu);
    }
  }
  else if (v21)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = [v61 description];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to fetch advertisements, %@", buf, 0xCu);
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F1C9C8] now];
    v65 = objc_opt_new();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = *((id *)v102 + 5);
    uint64_t v25 = [obj countByEnumeratingWithState:&v77 objects:v115 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v78 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          v29 = (void *)MEMORY[0x1E4F1C9C8];
          [v28 unixTime];
          v30 = [v29 dateWithTimeIntervalSince1970:x0];
          v31 = [RTPeopleDiscoveryAdvertisement alloc];
          v32 = [v28 address];
          uint64_t v33 = [v28 rssi];
          v34 = [v28 contactId];
          v35 = [(RTPeopleDiscoveryAdvertisement *)v31 initWithAddress:v32 rssi:v33 scanDate:v30 contactID:v34];

          [v65 addObject:v35];
          if ([v22 compare:v30] == 1)
          {
            v36 = v30;

            id v22 = v36;
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v77 objects:v115 count:16];
      }
      while (v25);
    }

    v37 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = [*((id *)v102 + 5) count];
      uint64_t v39 = v92[3];
      uint64_t v40 = *((void *)v88 + 3);
      v41 = [v22 getFormattedDateString];
      *(_DWORD *)id buf = 134218754;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v109 = 2048;
      uint64_t v110 = v39;
      __int16 v111 = 2048;
      uint64_t v112 = v40;
      __int16 v113 = 2112;
      v114 = v41;
      _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider receive advertisements, incomingAdvs count %lu, countSinceLastFetch %lu, scanDuration %f, earliestAdvertisementDate, %@", buf, 0x2Au);
    }
    unint64_t v42 = [(RTPeopleDiscoveryProvider *)self peopleDensityRecord];
    [v42 updateRecordOnFetchComplete:v92[3] scanDuration:v22 referenceDate:v65 advertisements:v88[3]];

    v43 = [(RTPeopleDiscoveryProvider *)self _fetchAllIdentities];
    unint64_t v44 = [v43 count];
    if (v44 >= [(RTPeopleDiscoveryProvider *)self minimumIdentities])
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v46 = v65;
      uint64_t v45 = 0;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v73 objects:v107 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v74 != v48) {
              objc_enumerationMutation(v46);
            }
            v50 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            v51 = [v50 contactID];

            if (v51)
            {
              id v52 = [(RTPeopleDiscoveryProvider *)self contactRecord];
              [v52 updateContactRecordOnAdvertisementReceived:v50];

              ++v45;
            }
          }
          uint64_t v47 = [v46 countByEnumeratingWithState:&v73 objects:v107 count:16];
        }
        while (v47);
      }
    }
    else
    {
      uint64_t v45 = 0;
    }
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_120;
    v69[3] = &unk_1E6B993A8;
    v69[4] = self;
    v71 = v101;
    id v53 = v43;
    id v70 = v53;
    uint64_t v72 = v45;
    id v54 = (void *)MEMORY[0x1E016DB00](v69);
    id v55 = [NSString alloc];
    id v56 = (void *)[v55 initWithCString:RTAnalyticsEventPeopleDiscoveryAdvertisement encoding:1];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_2;
    v66[3] = &unk_1E6B943B0;
    id v57 = v54;
    id v68 = v57;
    id v58 = v56;
    id v67 = v58;
    v59 = (void *)MEMORY[0x1E016DB00](v66);
    v60 = [NSString stringWithFormat:@"com.apple.%@", v58];
    AnalyticsSendEventLazy();
  }
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(v101, 8);
}

void __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v16 = v9;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a5;
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
  id v15 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_120(void *a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) count];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];

  return [v2 computeAdvMetrics:v3 identities:v4 numOfResolvedAdvs:v5];
}

id __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_2(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

- (id)_fetchAllIdentities
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F946C8]);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__97;
  unint64_t v44 = __Block_byref_object_dispose__97;
  id v45 = (id)objc_opt_new();
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97;
  uint64_t v38 = __Block_byref_object_dispose__97;
  id v39 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__RTPeopleDiscoveryProvider__fetchAllIdentities__block_invoke;
  v30[3] = &unk_1E6B905F0;
  v32 = &v40;
  uint64_t v33 = &v34;
  uint64_t v4 = v3;
  v31 = v4;
  [v2 getIdentitiesWithFlags:168 completion:v30];
  uint64_t v5 = v4;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7)) {
    goto LABEL_6;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  uint64_t v11 = objc_opt_new();
  __int16 v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
  uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v14 = [v13 filteredArrayUsingPredicate:v12];
  id v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
  v47[0] = *MEMORY[0x1E4F28568];
  *(void *)id buf = @"semaphore wait timeout";
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v47 count:1];
  uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
LABEL_6:
    id v20 = 0;
  }

  id v21 = v20;
  id v22 = v21;
  if (v35[5])
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v28 = [(id)v35[5] description];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Fail to get identities, error, %@\n", buf, 0xCu);
    }
LABEL_14:

    id v24 = 0;
    goto LABEL_15;
  }
  if (v21)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v29 = [v22 description];
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Fail to get identities, error, %@\n", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [(id)v41[5] count];
    *(_DWORD *)id buf = 134217984;
    *(void *)&uint8_t buf[4] = v27;
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "Successfully get identities, count, %lu", buf, 0xCu);
  }

  [v2 invalidate];
  id v24 = (id)v41[5];
LABEL_15:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

void __48__RTPeopleDiscoveryProvider__fetchAllIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)didCloseProximityEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTPeopleDiscoveryProvider_didCloseProximityEvent___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__RTPeopleDiscoveryProvider_didCloseProximityEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCloseProximityEvent:*(void *)(a1 + 40)];
}

- (void)_didCloseProximityEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v5 description];
      *(_DWORD *)id buf = 138412290;
      uint64_t v14 = v9;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "storing proximity event to database: %@", buf, 0xCu);
    }
    uint64_t v7 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__RTPeopleDiscoveryProvider__didCloseProximityEvent___block_invoke;
    v10[3] = &unk_1E6B90CB8;
    SEL v12 = a2;
    id v11 = v5;
    [v7 storeProximityEvent:v11 handler:v10];

    id v8 = v11;
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: event", buf, 2u);
    }
  }
}

void __53__RTPeopleDiscoveryProvider__didCloseProximityEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)saveShortTermRecord
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() getStoreURL];
  id v4 = (void *)MEMORY[0x1E016D870]();
  shortTermStore = self->_shortTermStore;
  id v14 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:shortTermStore requiringSecureCoding:1 error:&v14];
  id v7 = v14;
  if (!v7)
  {
    id v13 = 0;
    [v6 writeToURL:v3 options:805306369 error:&v13];
    id v8 = v13;
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    __int16 v9 = v10;
    if (v8)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      __int16 v11 = [v8 description];
      *(_DWORD *)id buf = 138412290;
      id v16 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider error writing short-term store, error, %@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      __int16 v11 = [v3 path];
      uint64_t v12 = [v6 length];
      *(_DWORD *)id buf = 138412546;
      id v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider successfully save short-term store to location, %@, bytes, %lu", buf, 0x16u);
    }

    goto LABEL_10;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = [v7 description];
    *(_DWORD *)id buf = 138412290;
    id v16 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider error archiving short-term store, error, %@", buf, 0xCu);
LABEL_10:
  }
}

- (id)loadShortTermRecord
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() getStoreURL];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v18 = 0;
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:2 error:&v18];
    id v7 = v18;
    if (v7)
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v2 absoluteString];
        id v14 = [v7 description];
        *(_DWORD *)id buf = 138412546;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fails to load short-term store, url, %@, error, %@", buf, 0x16u);
      }
      id v9 = 0;
    }
    else
    {
      id v17 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v17];
      id v8 = v17;
      if (v8)
      {
        __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = [v2 absoluteString];
          id v16 = [v8 description];
          *(_DWORD *)id buf = 138412546;
          id v20 = v15;
          __int16 v21 = 2112;
          id v22 = v16;
          _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fails to unarchive short-term store, url, %@, error, %@", buf, 0x16u);
        }
        id v9 = 0;
      }
      else
      {
        id v9 = v10;
      }
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider short term record file does not exist", buf, 2u);
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)getStoreURL
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [MEMORY[0x1E4F28CB8] routineCacheDirectoryPath];
  id v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  char v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"peopleDiscovery_records.bin" relativeToURL:v4];

  return v5;
}

- (void)addClient:(id)a3 withIdentifier:(id)a4 withConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke;
  v15[3] = &unk_1E6B96E10;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _addClientConfiguration:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _aggregateAndApplyConfiguration];
  id v2 = [*(id *)(a1 + 40) densityCallbackConfiguration];

  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      *(_DWORD *)id buf = 138412290;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider sending initial data to client %@", buf, 0xCu);
    }

    [objc_opt_class() _convertObservationIntervalToDouble:[*(id *)(a1 + 40) observationInterval]];
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v5];
    id v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke_127;
    v9[3] = &unk_1E6B94E10;
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    [v7 _fetchPeopleDensityHistoryFromStartDate:v6 endDate:v8 completionHandler:v9];
  }
}

void __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to retrieve initial data upon registration, error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    id v8 = [[RTPeopleDensityUpdateNotification alloc] initWithPeopleDensityBundles:v5];
    [*(id *)(a1 + 32) postNotification:v8 toObserver:*(void *)(a1 + 40)];
  }
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTPeopleDiscoveryProvider_removeClient___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__RTPeopleDiscoveryProvider_removeClient___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeClientConfiguration:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _aggregateAndApplyConfiguration];
}

- (void)_addClientConfiguration:(id)a3 withIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider _addClientConfiguration configuration %@ identifier %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6 && v7) {
    [(NSMutableDictionary *)self->_clientConfigurations setObject:v6 forKey:v7];
  }
}

- (void)_removeClientConfiguration:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider _removeClientConfiguration identifier %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    [(NSMutableDictionary *)self->_clientConfigurations removeObjectForKey:v4];
  }
}

+ (double)_convertObservationIntervalToDouble:(unint64_t)a3
{
  double result = 300.0;
  if (a3 != 2) {
    double result = 0.0;
  }
  if (a3 == 1) {
    return 900.0;
  }
  return result;
}

+ (int)_scanLevelFromServiceLevel:(unint64_t)a3 observationInterval:(unint64_t)a4
{
  if (a3 == 2)
  {
    if (a4 == 2)
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      int v6 = 1;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        return v6;
      }
      __int16 v9 = 0;
      id v5 = "#RTPeopleDiscoveryProvider CL Scan Level: Default";
      id v7 = (uint8_t *)&v9;
LABEL_9:
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, v5, v7, 2u);
      goto LABEL_11;
    }
    if (a4 == 1)
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v6 = 2;
        goto LABEL_11;
      }
      __int16 v10 = 0;
      id v5 = "#RTPeopleDiscoveryProvider CL Scan Level: Low";
      int v6 = 2;
      id v7 = (uint8_t *)&v10;
      goto LABEL_9;
    }
  }
  return -1;
}

- (void)_aggregateAndApplyConfiguration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_clientConfigurations count])
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(RTPeopleDiscoveryProvider *)self _logClientConfigurations];
      *(_DWORD *)id buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v5 = objc_alloc(MEMORY[0x1E4F5CE68]);
    int v6 = [(NSMutableDictionary *)self->_clientConfigurations allValues];
    id v7 = (void *)[v5 initWithAggregation:v6];

    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = [v7 description];
      *(_DWORD *)id buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1D9BFA000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Aggregated Service Configuration: %@", buf, 0xCu);
    }
    [MEMORY[0x1E4F5CE68] secondsForStorageDuration:[v7 storageDuration]];
    -[RTPeopleDiscoveryProvider setExpirationInterval:](self, "setExpirationInterval:");
    LODWORD(v8) = [v7 shouldAdvertise];
    uint64_t v10 = [_scanLevelFromServiceLevel:[v7 serviceLevel] observationInterval:[v7 observationInterval]];
    if ([(RTPeopleDiscoveryServiceConfiguration *)self->_aggregatedConfiguration isEqual:v7])
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Aggregated Service Configuration did not change, skip sending", buf, 2u);
      }
    }
    else
    {
      id v14 = [(RTNotifier *)self queue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke;
      v17[3] = &unk_1E6B90BF0;
      v17[4] = self;
      id v18 = v7;
      dispatch_async(v14, v17);
    }
    uint64_t v13 = v10 << 32;
    uint64_t v8 = v8;
  }
  else
  {
    [(RTPeopleDiscoveryProvider *)self setExpirationInterval:0.0];
    id v12 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_130;
    block[3] = &unk_1E6B90E70;
    void block[4] = self;
    dispatch_async(v12, block);

    uint64_t v8 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v15 = [(RTPeopleDiscoveryProvider *)self advertisementManager];
  [v15 configure:v13 | v8 withCompletionHandler:&__block_literal_global_141_0];
}

uint64_t __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setup];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setAggregatedConfiguration:v3];
}

uint64_t __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownWithHandler:&__block_literal_global_132];
}

void __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2)
    {
      id v4 = [NSString stringWithFormat:@", error %@", v2];
    }
    else
    {
      id v4 = @"OK";
    }
    *(_DWORD *)id buf = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "done shutdown %@", buf, 0xCu);
    if (v2) {
  }
    }
}

void __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2)
    {
      id v4 = [NSString stringWithFormat:@", error %@", v2];
    }
    else
    {
      id v4 = @"OK";
    }
    *(_DWORD *)id buf = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "CLLocationManagerGathering conf %@", buf, 0xCu);
    if (v2) {
  }
    }
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__RTPeopleDiscoveryProvider_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __90__RTPeopleDiscoveryProvider_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchProximityHistoryFromStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _monitorEvents];
}

- (void)_fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([v8 compare:v9] == 1)
  {
    __int16 v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    id v12 = NSString;
    id v13 = [v8 getFormattedDateString];
    id v14 = [v9 getFormattedDateString];
    uint64_t v15 = [v12 stringWithFormat:@"startDate, %@, endDate, %@", v13, v14];
    uint64_t v72 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    id v17 = [v11 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v16];

    v10[2](v10, MEMORY[0x1E4F1CBF0], v17);
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 getFormattedDateString];
      id v20 = [v9 getFormattedDateString];
      *(_DWORD *)id buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching proximity history by date, start %@, end %@", buf, 0x16u);
    }
    id v17 = objc_opt_new();
    uint64_t v21 = objc_opt_new();
    if ([(RTPeopleDiscoveryProvider *)self proximityStoreAvailable])
    {
      *(void *)id buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v68 = __Block_byref_object_copy__97;
      v69 = __Block_byref_object_dispose__97;
      id v70 = (id)objc_opt_new();
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x3032000000;
      v61 = __Block_byref_object_copy__97;
      v62 = __Block_byref_object_dispose__97;
      id v63 = 0;
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      uint64_t v23 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __91__RTPeopleDiscoveryProvider__fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
      v54[3] = &unk_1E6B905F0;
      id v56 = buf;
      id v57 = &v58;
      id v24 = v22;
      id v55 = v24;
      [v23 fetchProximityEventsFromDate:v8 endDate:v9 handler:v54];

      uint64_t v25 = v24;
      id v53 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v26 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(v25, v26)) {
        goto LABEL_12;
      }
      id v52 = [MEMORY[0x1E4F1C9C8] now];
      [v52 timeIntervalSinceDate:v53];
      double v28 = v27;
      v50 = objc_opt_new();
      v51 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 filteredArrayUsingPredicate:v51];
      v31 = [v30 firstObject];

      [v50 submitToCoreAnalytics:v31 type:1 duration:v28];
      v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v66 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v66, 2u);
      }

      uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
      v73[0] = *MEMORY[0x1E4F28568];
      *(void *)v66 = @"semaphore wait timeout";
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v73 count:1];
      v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

      if (v35)
      {
        id v36 = v35;
      }
      else
      {
LABEL_12:
        id v36 = 0;
      }

      id v40 = v36;
      if (v59[5]) {
        [v21 addObject:];
      }
      if (v40) {
        [v21 addObject:v40];
      }
      v41 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v42 = [*(id *)(*(void *)&buf[8] + 40) count];
        *(_DWORD *)v66 = 134217984;
        *(void *)&void v66[4] = v42;
        _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider finish loading persisted records, count %lu", v66, 0xCu);
      }

      [v17 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
      _Block_object_dispose(&v58, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v65 = @"historical data temporarily unavailable";
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      id v39 = [v37 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v38];

      [v21 addObject:v39];
    }
    v43 = [(RTPeopleDiscoveryProvider *)self contactRecord];
    unint64_t v44 = [MEMORY[0x1E4F1C9C8] now];
    id v45 = [v43 generateRealtimeProximityEventFromDate:v8 endDate:v9 referenceDate:v44];

    id v46 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v49 = [v45 count];
      *(_DWORD *)id buf = 134217984;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_debug_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider read %ld events from real-time records", buf, 0xCu);
    }

    [v17 addObjectsFromArray:v45];
    if ([v21 count])
    {
      uint64_t v47 = _RTSafeArray();
      uint64_t v48 = _RTMultiErrorCreate();
      ((void (**)(id, void *, void *))v10)[2](v10, v17, v48);
    }
    else
    {
      ((void (**)(id, void *, void *))v10)[2](v10, v17, 0);
    }
  }
}

void __91__RTPeopleDiscoveryProvider__fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTPeopleDiscoveryProvider_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __81__RTPeopleDiscoveryProvider_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchProximityHistoryFromEventIDs:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _monitorEvents];
}

- (void)_fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v5 = (void (**)(id, void *, void *))a4;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching proximity history by eventIDs", buf, 2u);
  }

  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  *(void *)id buf = 0;
  id v45 = buf;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__97;
  uint64_t v48 = __Block_byref_object_dispose__97;
  id v49 = (id)objc_opt_new();
  if ([(RTPeopleDiscoveryProvider *)self proximityStoreAvailable])
  {
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = &v53;
    uint64_t v54 = 0x3032000000;
    id v55 = __Block_byref_object_copy__97;
    id v56 = __Block_byref_object_dispose__97;
    id v57 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __82__RTPeopleDiscoveryProvider__fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
    v40[3] = &unk_1E6B905F0;
    uint64_t v42 = buf;
    v43 = &v53;
    id v11 = v9;
    v41 = v11;
    [v10 fetchProximityEventsFromEventIDs:v39 handler:v40];

    id v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      v37 = [MEMORY[0x1E4F1C9C8] now];
      [v37 timeIntervalSinceDate:v13];
      double v16 = v15;
      id v17 = objc_opt_new();
      id v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 filteredArrayUsingPredicate:v18];
      uint64_t v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      dispatch_semaphore_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v52 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v52, 2u);
      }

      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      v58[0] = *MEMORY[0x1E4F28568];
      *(void *)id v52 = @"semaphore wait timeout";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v58 count:1];
      id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

      if (v25)
      {
        id v25 = v25;
      }
    }
    else
    {
      id v25 = 0;
    }

    id v28 = v25;
    if (*(void *)(*((void *)&v53 + 1) + 40)) {
      [v8 addObject:];
    }
    if (v28) {
      [v8 addObject:v28];
    }
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v7 count];
      *(_DWORD *)id v52 = 134217984;
      *(void *)&v52[4] = v30;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider fetch by eventIDs from persisted records complete, count %lu", v52, 0xCu);
    }

    [v7 addObjectsFromArray:*((void *)v45 + 5)];
    _Block_object_dispose(&v53, 8);
  }
  else
  {
    dispatch_time_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v51 = @"historical data temporarily unavailable";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    double v27 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v12];

    [v8 addObject:v27];
  }
  uint64_t v31 = [*((id *)v45 + 5) count];
  if (v31 != [v39 count])
  {
    v32 = [(RTPeopleDiscoveryProvider *)self contactRecord];
    uint64_t v33 = [v32 queryRealTimeEventsByEventIDs:v39];

    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v33 count];
      LODWORD(v53) = 134217984;
      *(void *)((char *)&v53 + 4) = v34;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider query %ld events from real-time records", (uint8_t *)&v53, 0xCu);
    }

    [v7 addObjectsFromArray:v33];
  }
  uint64_t v35 = [v8 count];
  if (v35)
  {
    id v12 = _RTSafeArray();
    id v36 = _RTMultiErrorCreate();
  }
  else
  {
    id v36 = 0;
  }
  v5[2](v5, v7, v36);
  if (v35)
  {
  }
  _Block_object_dispose(buf, 8);
}

void __82__RTPeopleDiscoveryProvider__fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchMostRecentPeopleDensity:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTPeopleDiscoveryProvider_fetchMostRecentPeopleDensity___block_invoke;
  v7[3] = &unk_1E6B90D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__RTPeopleDiscoveryProvider_fetchMostRecentPeopleDensity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) peopleDensityRecord];
  id v2 = [v3 fetchCurrentObservationBundle];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__RTPeopleDiscoveryProvider_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __94__RTPeopleDiscoveryProvider_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPeopleDensityHistoryFromStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([v8 compare:v9] == 1)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    id v12 = NSString;
    id v13 = [v8 getFormattedDateString];
    id v14 = [v9 getFormattedDateString];
    double v15 = [v12 stringWithFormat:@"startDate, %@, endDate, %@", v13, v14];
    v65 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    id v17 = [v11 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v16];

    v10[2](v10, MEMORY[0x1E4F1CBF0], v17);
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 getFormattedDateString];
      id v20 = [v9 getFormattedDateString];
      *(_DWORD *)id buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching people density history by date, start %@, end %@", buf, 0x16u);
    }
    id v17 = objc_opt_new();
    if ([(RTPeopleDiscoveryProvider *)self peopleDensityStoreAvailable])
    {
      *(void *)id buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v61 = __Block_byref_object_copy__97;
      v62 = __Block_byref_object_dispose__97;
      id v63 = (id)objc_opt_new();
      uint64_t v51 = 0;
      id v52 = &v51;
      uint64_t v53 = 0x3032000000;
      uint64_t v54 = __Block_byref_object_copy__97;
      id v55 = __Block_byref_object_dispose__97;
      id v56 = 0;
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v22 = [(RTPeopleDiscoveryProvider *)self peopleDensityStore];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      void v47[2] = __95__RTPeopleDiscoveryProvider__fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
      v47[3] = &unk_1E6B905F0;
      id v49 = buf;
      uint64_t v50 = &v51;
      uint64_t v23 = v21;
      uint64_t v48 = v23;
      [v22 fetchPeopleDensityFromDate:v8 endDate:v9 handler:v47];

      id v24 = v23;
      uint64_t v46 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v25 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v24, v25))
      {
        id v45 = [MEMORY[0x1E4F1C9C8] now];
        [v45 timeIntervalSinceDate:v46];
        double v27 = v26;
        unint64_t v44 = objc_opt_new();
        id v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
        v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v30 = [v29 filteredArrayUsingPredicate:v28];
        uint64_t v31 = [v30 firstObject];

        [v44 submitToCoreAnalytics:v31 type:1 duration:v27];
        v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v59 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
        }

        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        v66[0] = *MEMORY[0x1E4F28568];
        *(void *)v59 = @"semaphore wait timeout";
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v66 count:1];
        id v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

        if (v35)
        {
          id v35 = v35;
        }
      }
      else
      {
        id v35 = 0;
      }

      id v39 = v35;
      if (v52[5]) {
        ((void (*)(void (**)(id, void, void *), void))v10[2])(v10, MEMORY[0x1E4F1CBF0]);
      }
      if (v39) {
        v10[2](v10, MEMORY[0x1E4F1CBF0], v39);
      }
      id v40 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [*(id *)(*(void *)&buf[8] + 40) count];
        *(_DWORD *)v59 = 134217984;
        *(void *)&v59[4] = v41;
        _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider finish loading people density records, count %lu", v59, 0xCu);
      }

      [v17 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
      uint64_t v42 = [(RTPeopleDiscoveryProvider *)self peopleDensityRecord];
      v43 = [v42 fetchOngoingPeopleDensityBundle:v8 endDate:v9];

      if (v43) {
        [v17 addObject:v43];
      }
      ((void (**)(id, void *, void *))v10)[2](v10, v17, 0);

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      uint64_t v58 = @"historical data temporarily unavailable";
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      uint64_t v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v37];

      v10[2](v10, MEMORY[0x1E4F1CBF0], v38);
    }
  }
}

void __95__RTPeopleDiscoveryProvider__fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTPeopleDiscoveryProvider_fetchContactScoresFromContactIDs_completionHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __80__RTPeopleDiscoveryProvider_fetchContactScoresFromContactIDs_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchContactScoresFromContactIDs:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching contact scores history by contactIDs", buf, 2u);
  }

  if ([(RTPeopleDiscoveryProvider *)self contactScoreDataAvailable])
  {
    if (v6 && [v6 count])
    {
      id v9 = [(RTPeopleDiscoveryProvider *)self contactRecord];
      id v10 = [v9 queryContactScoresWithContactIDs:v6];

      id v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v10 count];
        *(_DWORD *)id buf = 134217984;
        uint64_t v22 = v12;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider returns %ld contact scores", buf, 0xCu);
      }

      v7[2](v7, v10, 0);
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"contactIDs requires at least one element to fetch";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v18 = [v16 errorWithDomain:v17 code:7 userInfo:v10];
      ((void (**)(id, void *, void *))v7)[2](v7, (void *)MEMORY[0x1E4F1CBF0], v18);
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    id v20 = @"Data temporarily unavailable";
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v10 = [v13 errorWithDomain:v14 code:5 userInfo:v15];

    ((void (**)(id, void *, void *))v7)[2](v7, (void *)MEMORY[0x1E4F1CBF0], v10);
  }
}

- (id)_logClientConfigurations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"#RTPeopleDiscoveryProvider Associated Clients: {\n"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_clientConfigurations;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_clientConfigurations objectForKeyedSubscript:v9];
        [v3 appendFormat:@" <%@>: %@\n", v9, v10, (void)v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"}"];

  return v3;
}

- (void)addProximityEvent:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 description];
    *(_DWORD *)id buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider adding proximity event, %@", buf, 0xCu);
  }
  id v10 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTPeopleDiscoveryProvider_addProximityEvent_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

uint64_t __55__RTPeopleDiscoveryProvider_addProximityEvent_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addProximityEvent:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_addProximityEvent:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__RTPeopleDiscoveryProvider__addProximityEvent_handler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    SEL v14 = a2;
    id v12 = v7;
    id v13 = v8;
    [v9 storeProximityEvent:v12 handler:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: event", buf, 2u);
    }
  }
}

void __56__RTPeopleDiscoveryProvider__addProximityEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v8, 0x20u);
    }
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

- (void)injectAdv:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 description];
    *(_DWORD *)id buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider inject advertisement, %@", buf, 0xCu);
  }
  __int16 v10 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTPeopleDiscoveryProvider_injectAdv_handler___block_invoke;
  block[3] = &unk_1E6B92668;
  id v14 = v6;
  id v15 = v7;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __47__RTPeopleDiscoveryProvider_injectAdv_handler___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _fetchAllIdentities];
  unint64_t v3 = [v2 count];
  if (v3 >= [*(id *)(a1 + 32) minimumIdentities])
  {
    uint64_t v9 = [*(id *)(a1 + 40) contactID];

    if (v9)
    {
      __int16 v10 = [*(id *)(a1 + 32) contactRecord];
      [v10 updateContactRecordOnAdvertisementReceived:*(void *)(a1 + 40)];

      [*(id *)(a1 + 32) saveShortTermRecord];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F5CFE8];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Not enough identities available on device";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    int v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
  }
}

- (void)clearProximityEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTPeopleDiscoveryProvider_clearProximityEvents___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__RTPeopleDiscoveryProvider_clearProximityEvents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearProximityEvents:*(void *)(a1 + 40)];
}

- (void)_clearProximityEvents:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider remove all proximity events", (uint8_t *)&buf, 2u);
  }

  id v6 = objc_opt_new();
  id v7 = [(RTPeopleDiscoveryProvider *)self contactRecord];
  [v7 cleanUpOngoingContactRecordsAndScores];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v38 = +[RTPeopleDiscoveryProvider getStoreURL];
  uint64_t v9 = [v38 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() getStoreURL];
    id v42 = 0;
    [v8 removeItemAtURL:v11 error:&v42];
    id v12 = v42;

    if (v12)
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to remove cache file, error, %@", (uint8_t *)&buf, 0xCu);
      }

      [v6 addObject:v12];
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider Unable to clear proximity events as it has been recently cleared", (uint8_t *)&buf, 2u);
    }
  }

  if ([(RTPeopleDiscoveryProvider *)self proximityStoreAvailable])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = __Block_byref_object_copy__97;
    uint64_t v48 = __Block_byref_object_dispose__97;
    id v49 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = [(RTPeopleDiscoveryProvider *)self proximityEventStore];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__RTPeopleDiscoveryProvider__clearProximityEvents___block_invoke;
    v39[3] = &unk_1E6B90728;
    p_long long buf = &buf;
    id v16 = v14;
    id v40 = v16;
    [v15 clearWithHandler:v39];

    uint64_t v17 = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v19 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      v37 = [MEMORY[0x1E4F1C9C8] now];
      [v37 timeIntervalSinceDate:v18];
      double v21 = v20;
      uint64_t v22 = objc_opt_new();
      uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      dispatch_time_t v25 = [v24 filteredArrayUsingPredicate:v23];
      double v26 = [v25 firstObject];

      [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
      double v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v51 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v51 = @"semaphore wait timeout";
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

      if (v30)
      {
        id v30 = v30;
      }
    }
    else
    {
      id v30 = 0;
    }

    id v34 = v30;
    if (*(void *)(*((void *)&buf + 1) + 40)) {
      [v6 addObject:];
    }
    if (v34) {
      [v6 addObject:v34];
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    unint64_t v44 = @"historical data temporarily unavailable";
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v33 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v32];

    [v6 addObject:v33];
  }
  if ([v6 count])
  {
    id v35 = _RTSafeArray();
    id v36 = _RTMultiErrorCreate();
    v4[2](v4, v36);
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __51__RTPeopleDiscoveryProvider__clearProximityEvents___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addPeopleDensityBundle:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 description];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider adding people density bundle, %@", buf, 0xCu);
  }
  int v10 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTPeopleDiscoveryProvider_addPeopleDensityBundle_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

uint64_t __60__RTPeopleDiscoveryProvider_addPeopleDensityBundle_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPeopleDensityBundle:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_addPeopleDensityBundle:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [(RTPeopleDiscoveryProvider *)self peopleDensityStore];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__RTPeopleDiscoveryProvider__addPeopleDensityBundle_handler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    SEL v14 = a2;
    id v12 = v7;
    id v13 = v8;
    [v9 storePeopleDensity:v12 handler:v11];

    int v10 = v12;
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundle", buf, 2u);
    }
  }
}

void __61__RTPeopleDiscoveryProvider__addPeopleDensityBundle_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v8, 0x20u);
    }
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v12 getFormattedDateString];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v28 = a3;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider inject people density stats, numOfAdvs %lu, duration %f, date %@", buf, 0x20u);
  }
  uint64_t v17 = [(RTNotifier *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__RTPeopleDiscoveryProvider_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke;
  v21[3] = &unk_1E6B91418;
  id v24 = v14;
  unint64_t v25 = a3;
  double v26 = a4;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v17, v21);
}

uint64_t __91__RTPeopleDiscoveryProvider_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) peopleDensityRecord];
  [v2 updateRecordOnFetchComplete:*(void *)(a1 + 64) scanDuration:*(void *)(a1 + 40) referenceDate:*(void *)(a1 + 48) advertisements:*(double *)(a1 + 72)];

  [*(id *)(a1 + 32) saveShortTermRecord];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

- (void)clearPeopleDensityBundles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTPeopleDiscoveryProvider_clearPeopleDensityBundles___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTPeopleDiscoveryProvider_clearPeopleDensityBundles___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearPeopleDensityBundles:*(void *)(a1 + 40)];
}

- (void)_clearPeopleDensityBundles:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider remove all people density bundles", (uint8_t *)&buf, 2u);
  }

  id v6 = objc_opt_new();
  uint64_t v7 = [(RTPeopleDiscoveryProvider *)self peopleDensityRecord];
  [v7 cleanUpOngoingPeopleDensityBundle];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v38 = +[RTPeopleDiscoveryProvider getStoreURL];
  uint64_t v9 = [v38 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() getStoreURL];
    id v42 = 0;
    [v8 removeItemAtURL:v11 error:&v42];
    id v12 = v42;

    if (v12)
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to remove cache file, error, %@", (uint8_t *)&buf, 0xCu);
      }

      [v6 addObject:v12];
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider Unable to clear people density bundles as it has been recently cleared", (uint8_t *)&buf, 2u);
    }
  }

  if ([(RTPeopleDiscoveryProvider *)self peopleDensityStoreAvailable])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = __Block_byref_object_copy__97;
    uint64_t v48 = __Block_byref_object_dispose__97;
    id v49 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = [(RTPeopleDiscoveryProvider *)self peopleDensityStore];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __56__RTPeopleDiscoveryProvider__clearPeopleDensityBundles___block_invoke;
    v39[3] = &unk_1E6B90728;
    p_long long buf = &buf;
    id v16 = v14;
    id v40 = v16;
    [v15 clearWithHandler:v39];

    uint64_t v17 = v16;
    id v18 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v19 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      v37 = [MEMORY[0x1E4F1C9C8] now];
      [v37 timeIntervalSinceDate:v18];
      double v21 = v20;
      id v22 = objc_opt_new();
      id v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_415];
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      unint64_t v25 = [v24 filteredArrayUsingPredicate:v23];
      double v26 = [v25 firstObject];

      [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
      double v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v51 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      unint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v51 = @"semaphore wait timeout";
      __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

      if (v30)
      {
        id v30 = v30;
      }
    }
    else
    {
      id v30 = 0;
    }

    id v34 = v30;
    if (*(void *)(*((void *)&buf + 1) + 40)) {
      [v6 addObject:];
    }
    if (v34) {
      [v6 addObject:v34];
    }
    v4[2](v4, 0);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    __int16 v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    unint64_t v44 = @"historical data temporarily unavailable";
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v33 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v32];

    [v6 addObject:v33];
  }
  if ([v6 count])
  {
    id v35 = _RTSafeArray();
    id v36 = _RTMultiErrorCreate();
    ((void (**)(id, void *))v4)[2](v4, v36);
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __56__RTPeopleDiscoveryProvider__clearPeopleDensityBundles___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)computeContactScores:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *))a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "per-contact scores feature flag is not enabled", v9, 2u);
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F5CFE8];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"feature disabled";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v5 errorWithDomain:v6 code:13 userInfo:v7];

  v3[2](v3, v8);
}

+ (id)computeAdvMetrics:(int64_t)a3 identities:(id)a4 numOfResolvedAdvs:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v8);
        }
        int v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) type];
        switch(v17)
        {
          case 8:
            ++v12;
            break;
          case 6:
            ++v11;
            break;
          case 4:
            ++v14;
            break;
          default:
            ++v13;
            break;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }

  id v18 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v18 forKeyedSubscript:@"numOfAdvs"];

  dispatch_time_t v19 = [NSNumber numberWithUnsignedInteger:[v8 count]];
  [v7 setObject:v19 forKeyedSubscript:@"numOfIdentities"];

  double v20 = [NSNumber numberWithInteger:a5];
  [v7 setObject:v20 forKeyedSubscript:@"numOfResolvedAdvs"];

  double v21 = [NSNumber numberWithInteger:v14];
  [v7 setObject:v21 forKeyedSubscript:@"numOfFamilyDevices"];

  id v22 = [NSNumber numberWithInteger:v11];
  [v7 setObject:v22 forKeyedSubscript:@"numOfFriendDevices"];

  id v23 = [NSNumber numberWithInteger:v12];
  [v7 setObject:v23 forKeyedSubscript:@"numOfPairedDevices"];

  id v24 = [NSNumber numberWithInteger:v13];
  [v7 setObject:v24 forKeyedSubscript:@"numOfUnknownDevices"];

  return v7;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "RTPurgable performPurgeOfType called", buf, 2u);
  }

  uint64_t v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RTPeopleDiscoveryProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v12 = v7;
  int64_t v13 = a3;
  void block[4] = self;
  id v10 = v7;
  dispatch_async(v9, block);
}

uint64_t __73__RTPeopleDiscoveryProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) _purgeEvents];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (int64_t)periodicPurgePolicy
{
  return 0;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTPeopleDiscoveryContactRecord)contactRecord
{
  return self->_contactRecord;
}

- (void)setContactRecord:(id)a3
{
}

- (RTPeopleDiscoveryPersistenceStore)shortTermStore
{
  return self->_shortTermStore;
}

- (void)setShortTermStore:(id)a3
{
}

- (RTProximityEventStore)proximityEventStore
{
  return self->_proximityEventStore;
}

- (void)setProximityEventStore:(id)a3
{
}

- (RTPeopleDensityStore)peopleDensityStore
{
  return self->_peopleDensityStore;
}

- (void)setPeopleDensityStore:(id)a3
{
}

- (RTPeopleDensityRecord)peopleDensityRecord
{
  return self->_peopleDensityRecord;
}

- (void)setPeopleDensityRecord:(id)a3
{
}

- (RTPersistentTimer)scoringTimer
{
  return self->_scoringTimer;
}

- (void)setScoringTimer:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTTimer)backupTimer
{
  return self->_backupTimer;
}

- (void)setBackupTimer:(id)a3
{
}

- (CLLocationManagerGathering)advertisementManager
{
  return self->_advertisementManager;
}

- (void)setAdvertisementManager:(id)a3
{
}

- (BOOL)contactScoreDataAvailable
{
  return self->_contactScoreDataAvailable;
}

- (void)setContactScoreDataAvailable:(BOOL)a3
{
  self->_contactScoreDataAvailable = a3;
}

- (BOOL)hasLoadedPersistedRecords
{
  return self->_hasLoadedPersistedRecords;
}

- (void)setHasLoadedPersistedRecords:(BOOL)a3
{
  self->_hasLoadedPersistedRecords = a3;
}

- (BOOL)broughtUp
{
  return self->_broughtUp;
}

- (void)setBroughtUp:(BOOL)a3
{
  self->_broughtUp = a3;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (unint64_t)minimumIdentities
{
  return self->_minimumIdentities;
}

- (void)setMinimumIdentities:(unint64_t)a3
{
  self->_minimumIdentities = a3;
}

- (NSMutableDictionary)clientConfigurations
{
  return self->_clientConfigurations;
}

- (void)setClientConfigurations:(id)a3
{
}

- (RTPeopleDiscoveryServiceConfiguration)aggregatedConfiguration
{
  return (RTPeopleDiscoveryServiceConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAggregatedConfiguration:(id)a3
{
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (BOOL)proximityStoreAvailable
{
  return self->_proximityStoreAvailable;
}

- (void)setProximityStoreAvailable:(BOOL)a3
{
  self->_proximityStoreAvailable = a3;
}

- (BOOL)peopleDensityStoreAvailable
{
  return self->_peopleDensityStoreAvailable;
}

- (void)setPeopleDensityStoreAvailable:(BOOL)a3
{
  self->_peopleDensityStoreAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_aggregatedConfiguration, 0);
  objc_storeStrong((id *)&self->_clientConfigurations, 0);
  objc_storeStrong((id *)&self->_advertisementManager, 0);
  objc_storeStrong((id *)&self->_backupTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scoringTimer, 0);
  objc_storeStrong((id *)&self->_peopleDensityRecord, 0);
  objc_storeStrong((id *)&self->_peopleDensityStore, 0);
  objc_storeStrong((id *)&self->_proximityEventStore, 0);
  objc_storeStrong((id *)&self->_shortTermStore, 0);
  objc_storeStrong((id *)&self->_contactRecord, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end