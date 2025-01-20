@interface RTFingerprintManager
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (BOOL)available;
- (BOOL)fingerprintMonitoringEnabled;
- (NSDate)startCollectAccessPoints;
- (RTDefaultsManager)defaultsManager;
- (RTFingerprintManager)initWithDefaultsManager:(id)a3 fingerprintStore:(id)a4 scenarioTriggerManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7;
- (RTFingerprintStore)fingerprintStore;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTTimer)scanRequestTimer;
- (RTTimer)scanResultTimer;
- (RTTimerManager)timerManager;
- (RTWiFiManager)wifiManager;
- (unint64_t)accessPointsCollectedPerFingerprint;
- (unint64_t)accessPointsFetchLimit;
- (unint64_t)settledState;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startScanRequestForUnsettledState;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6;
- (void)fetchFingerprintsInDateInterval:(id)a3 filteredBySettledState:(unint64_t)a4 handler:(id)a5;
- (void)fetchWifiAccessPointsForFingerprint:(id)a3 handler:(id)a4;
- (void)injectFingerprints:(id)a3 handler:(id)a4;
- (void)injectWifiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onSettledNotification:(id)a3;
- (void)onStoreAvailabilityDidChangeNotification:(id)a3;
- (void)onUnsettledNotification:(id)a3;
- (void)onWiFiScanNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setAccessPointsCollectedPerFingerprint:(unint64_t)a3;
- (void)setAccessPointsFetchLimit:(unint64_t)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setFingerprintMonitoringEnabled:(BOOL)a3;
- (void)setScanRequestTimer:(id)a3;
- (void)setScanResultTimer:(id)a3;
- (void)setSettledState:(unint64_t)a3;
- (void)setStartCollectAccessPoints:(id)a3;
@end

@implementation RTFingerprintManager

+ (id)vendedClasses
{
  v2 = (void *)vendedClasses_vendedClasses_4;
  if (!vendedClasses_vendedClasses_4)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [v3 initWithObjects:v4, objc_opt_class(), 0];
    v6 = (void *)vendedClasses_vendedClasses_4;
    vendedClasses_vendedClasses_4 = v5;

    v2 = (void *)vendedClasses_vendedClasses_4;
  }

  return v2;
}

- (void)_setup
{
  id v3 = [(RTFingerprintManager *)self defaultsManager];
  id v6 = [v3 objectForKey:@"RTDefaultsFingerprintManagerAccessPointsFetchLimit"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[RTFingerprintManager setAccessPointsFetchLimit:](self, "setAccessPointsFetchLimit:", [v6 unsignedIntegerValue]);
  }
  uint64_t v4 = [(RTFingerprintManager *)self fingerprintStore];
  uint64_t v5 = +[RTNotification notificationName];
  [v4 addObserver:self selector:sel_onStoreAvailabilityDidChangeNotification_ name:v5];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  [(RTFingerprintManager *)self setFingerprintMonitoringEnabled:0];
  uint64_t v4 = [(RTFingerprintManager *)self fingerprintStore];
  [v4 removeObserver:self];

  uint64_t v5 = [(RTFingerprintManager *)self scanRequestTimer];
  [v5 invalidate];

  [(RTFingerprintManager *)self setScanRequestTimer:0];
  id v6 = [(RTFingerprintManager *)self scanResultTimer];
  [v6 invalidate];

  [(RTFingerprintManager *)self setScanResultTimer:0];
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    v7 = v8;
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 1)
  {
    id v6 = [*(id *)(a1 + 32) fingerprintStore];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_27;
    v8[3] = &unk_1E6B90C18;
    id v9 = *(id *)(a1 + 48);
    [v6 clearWithHandler:v8];

    uint64_t v5 = v9;
    goto LABEL_5;
  }
  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) fingerprintStore];
    uint64_t v4 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v10[3] = &unk_1E6B92690;
    id v11 = v4;
    id v12 = *(id *)(a1 + 48);
    [v3 purgePredating:v11 handler:v10];

    uint64_t v5 = v11;
LABEL_5:

    return;
  }
  v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v7();
}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "purge entries from the fingerprint store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__RTFingerprintManager_performPurgeOfType_referenceDate_completion___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "failed to clear fingerprint store with error, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [(RTFingerprintManager *)self setFingerprintMonitoringEnabled:[(RTNotifier *)self getNumberOfObservers:v7] != 0];
  }
  else
  {
    uint64_t v10 = +[RTNotification notificationName];
    int v11 = [v7 isEqualToString:v10];

    if (v11)
    {
      id v12 = [[RTFingerprintManagerNotificationAvailabilityDidChange alloc] initWithAvailability:[(RTFingerprintManager *)self available]];
      [(RTNotifier *)self postNotification:v12 toObserver:v6];
    }
    else
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(RTFingerprintManager *)self setFingerprintMonitoringEnabled:[(RTNotifier *)self getNumberOfObservers:v5] != 0];
  }
  else
  {
    __int16 v8 = +[RTNotification notificationName];
    char v9 = [v5 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (RTFingerprintManager)initWithDefaultsManager:(id)a3 fingerprintStore:(id)a4 scenarioTriggerManager:(id)a5 timerManager:(id)a6 wifiManager:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id obj = a6;
  id v16 = a6;
  id v30 = a7;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
      __int16 v34 = 1024;
      int v35 = 171;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    __int16 v34 = 1024;
    int v35 = 172;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprintStore (in %s:%d)", buf, 0x12u);
  }

  if (v15)
  {
LABEL_4:
    if (v16) {
      goto LABEL_5;
    }
LABEL_22:
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
      __int16 v34 = 1024;
      int v35 = 174;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", buf, 0x12u);
    }

    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_19:
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    __int16 v34 = 1024;
    int v35 = 173;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: scenarioTriggerManager (in %s:%d)", buf, 0x12u);
  }

  if (!v16) {
    goto LABEL_22;
  }
LABEL_5:
  if (v17)
  {
LABEL_6:
    v18 = 0;
    if (v13 && v14 && v15 && v16)
    {
      v31.receiver = self;
      v31.super_class = (Class)RTFingerprintManager;
      v19 = [(RTNotifier *)&v31 init];
      v20 = v19;
      if (v19)
      {
        v19->_accessPointsCollectedPerFingerprint = 0;
        v19->_accessPointsFetchLimit = 1500;
        v19->_available = 0;
        objc_storeStrong((id *)&v19->_defaultsManager, a3);
        v20->_fingerprintMonitoringEnabled = 0;
        objc_storeStrong((id *)&v20->_fingerprintStore, a4);
        objc_storeStrong((id *)&v20->_scenarioTriggerManager, a5);
        objc_storeStrong((id *)&v20->_timerManager, obj);
        objc_storeStrong((id *)&v20->_wifiManager, v30);
        scanRequestTimer = v20->_scanRequestTimer;
        v20->_scanRequestTimer = 0;

        scanResultTimer = v20->_scanResultTimer;
        v20->_scanResultTimer = 0;

        [(RTService *)v20 setup];
      }
      self = v20;
      v18 = self;
    }
    goto LABEL_28;
  }
LABEL_25:
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:]";
    __int16 v34 = 1024;
    int v35 = 175;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager (in %s:%d)", buf, 0x12u);
  }

  v18 = 0;
LABEL_28:

  return v18;
}

- (void)fetchFingerprintsInDateInterval:(id)a3 filteredBySettledState:(unint64_t)a4 handler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = (void (**)(id, void, NSObject *))a5;
  if (!v9)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"requires a dateInterval.";
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = (__CFString **)v26;
    id v16 = &v25;
LABEL_9:
    id v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    int v11 = [v12 errorWithDomain:v13 code:7 userInfo:v17];

    v9[2](v9, 0, v11);
LABEL_10:

    goto LABEL_11;
  }
  if (a4 >= 3)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = @"requires a valid settledState.";
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = &v24;
    id v16 = &v23;
    goto LABEL_9;
  }
  uint64_t v10 = [(RTNotifier *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__RTFingerprintManager_fetchFingerprintsInDateInterval_filteredBySettledState_handler___block_invoke;
  v18[3] = &unk_1E6B90C40;
  v18[4] = self;
  id v19 = v8;
  unint64_t v21 = a4;
  v20 = v9;
  dispatch_async(v10, v18);

LABEL_11:
}

void __87__RTFingerprintManager_fetchFingerprintsInDateInterval_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) fingerprintStore];
  uint64_t v2 = [*(id *)(a1 + 40) startDate];
  id v3 = [*(id *)(a1 + 40) endDate];
  [v4 fetchFingerprintsBetweenStartDate:v2 endDate:v3 filteredBySettledState:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__RTFingerprintManager_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __97__RTFingerprintManager_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fingerprintStore];
  [v2 fetchFingerprintsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) filteredBySettledState:*(void *)(a1 + 64) handler:*(void *)(a1 + 56)];
}

- (void)fetchWifiAccessPointsForFingerprint:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTFingerprintManager_fetchWifiAccessPointsForFingerprint_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__RTFingerprintManager_fetchWifiAccessPointsForFingerprint_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fingerprintStore];
  [v2 fetchWifiAccessPointsForFingerprint:*(void *)(a1 + 40) fetchLimit:objc_msgSend(*(id *)(a1 + 32), "accessPointsFetchLimit") handler:*(void *)(a1 + 48)];
}

- (void)setAvailable:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_available != a3)
  {
    self->_available = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      if (self->_available) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, available, %@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [[RTFingerprintManagerNotificationAvailabilityDidChange alloc] initWithAvailability:self->_available];
    [(RTNotifier *)self postNotification:v9];
  }
}

- (void)setFingerprintMonitoringEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_fingerprintMonitoringEnabled != a3)
  {
    self->_fingerprintMonitoringEnabled = a3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_fingerprintMonitoringEnabled) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "fingerprint monitoring enabled, %@", (uint8_t *)&v16, 0xCu);
    }

    if (self->_fingerprintMonitoringEnabled)
    {
      [(RTFingerprintManager *)self setSettledState:0];
      id v7 = [(RTFingerprintManager *)self scenarioTriggerManager];
      id v8 = +[RTNotification notificationName];
      [v7 addObserver:self selector:sel_onSettledNotification_ name:v8];

      id v9 = [(RTFingerprintManager *)self scenarioTriggerManager];
      int v10 = +[RTNotification notificationName];
      [v9 addObserver:self selector:sel_onUnsettledNotification_ name:v10];
    }
    else
    {
      uint64_t v11 = [(RTFingerprintManager *)self scenarioTriggerManager];
      [v11 removeObserver:self];

      __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, stop scan snd invalidate scan timers", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v14 = [(RTFingerprintManager *)self scanRequestTimer];
      [v14 invalidate];

      [(RTFingerprintManager *)self setScanRequestTimer:0];
      id v15 = [(RTFingerprintManager *)self scanResultTimer];
      [v15 invalidate];

      [(RTFingerprintManager *)self setScanResultTimer:0];
    }
  }
}

- (void)onStoreAvailabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTFingerprintManager_onStoreAvailabilityDidChangeNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__RTFingerprintManager_onStoreAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) availability] == 2;
    id v6 = *(void **)(a1 + 40);
    [v6 setAvailable:v5];
  }
}

- (void)onSettledNotification:(id)a3
{
  int v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTFingerprintManager_onSettledNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __46__RTFingerprintManager_onSettledNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSettledState:2];
}

- (void)onUnsettledNotification:(id)a3
{
  int v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RTFingerprintManager_onUnsettledNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __48__RTFingerprintManager_onUnsettledNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSettledState:1];
}

- (void)setSettledState:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->_settledState != a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = +[RTScenarioTriggerManager settledStateName:self->_settledState];
      id v8 = +[RTScenarioTriggerManager settledStateName:a3];
      *(_DWORD *)buf = 138412546;
      v43 = v7;
      __int16 v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "settled state transitioned from, %@, to, %@", buf, 0x16u);
    }
    unint64_t settledState = self->_settledState;
    if (settledState == 1)
    {
      if (a3 != 2) {
        goto LABEL_27;
      }
    }
    else if (a3 != 2 || settledState)
    {
      if (a3 != 1 || settledState != 2)
      {
        if (a3 == 1 && !settledState) {
          [(RTFingerprintManager *)self _startScanRequestForUnsettledState];
        }
        goto LABEL_27;
      }
      v22 = [(RTFingerprintManager *)self wifiManager];
      [v22 removeObserver:self];

      uint64_t v23 = [(RTFingerprintManager *)self timerManager];
      v24 = NSString;
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = [v24 stringWithFormat:@"%@.scanRequestTimer", v26];
      v28 = [(RTNotifier *)self queue];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __40__RTFingerprintManager_setSettledState___block_invoke_2;
      v39[3] = &unk_1E6B91248;
      v39[4] = self;
      v39[5] = a2;
      v29 = [v23 timerWithIdentifier:v27 queue:v28 handler:v39];
      [(RTFingerprintManager *)self setScanRequestTimer:v29];

      id v30 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_super v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v43 = v31;
        _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, scanRequestTimer start", buf, 0xCu);
      }
      v32 = [(RTFingerprintManager *)self defaultsManager];
      v33 = [v32 objectForKey:@"RTDefaultsFingerprintManagerScanRequestTimerDuration"];
      if (v33)
      {
        __int16 v34 = [(RTFingerprintManager *)self defaultsManager];
        int v35 = [v34 objectForKey:@"RTDefaultsFingerprintManagerScanRequestTimerDuration"];
        [v35 doubleValue];
        double v37 = v36;
      }
      else
      {
        double v37 = 300.0;
      }

      v38 = [(RTFingerprintManager *)self scanRequestTimer];
      [v38 fireAfterDelay:v37 interval:INFINITY leeway:1.0];

      id v19 = [(RTFingerprintManager *)self scanRequestTimer];
      [v19 resume];
      goto LABEL_26;
    }
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v43 = v11;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, invalidate scan timers for unsettled state", buf, 0xCu);
    }
    __int16 v12 = [(RTFingerprintManager *)self scanRequestTimer];
    [v12 invalidate];

    [(RTFingerprintManager *)self setScanRequestTimer:0];
    id v13 = [(RTFingerprintManager *)self scanResultTimer];

    if (v13)
    {
      uint64_t v14 = [(RTFingerprintManager *)self wifiManager];
      [v14 removeObserver:self];

      id v15 = [(RTFingerprintManager *)self scanResultTimer];
      [v15 invalidate];

      [(RTFingerprintManager *)self setScanResultTimer:0];
    }
    if ([(RTFingerprintManager *)self fingerprintMonitoringEnabled])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F5CDE8]);
      id v17 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      id v19 = (void *)[v16 initWithIdentifier:v17 settledState:2 start:v18 accessPoints:0];

      id v20 = [(RTFingerprintManager *)self fingerprintStore];
      v41 = v19;
      unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __40__RTFingerprintManager_setSettledState___block_invoke;
      v40[3] = &unk_1E6B90840;
      v40[4] = self;
      [v20 storeFingerprints:v21 handler:v40];

LABEL_26:
LABEL_27:
      self->_unint64_t settledState = a3;
    }
  }
}

void __40__RTFingerprintManager_setSettledState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "failed to save settled transition with error, %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__RTFingerprintManager_setSettledState___block_invoke_51;
    block[3] = &unk_1E6B90E70;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

void __40__RTFingerprintManager_setSettledState___block_invoke_51(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartCollectAccessPoints:0];
  id v2 = [*(id *)(a1 + 32) wifiManager];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = +[RTNotification notificationName];
  [v2 addObserver:v3 selector:sel_onWiFiScanNotification_ name:v4];

  id v5 = [*(id *)(a1 + 32) wifiManager];
  [v5 scheduleScan];
}

uint64_t __40__RTFingerprintManager_setSettledState___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, scanRequestTimer expiry", (uint8_t *)&v6, 0xCu);
  }
  int v4 = [*(id *)(a1 + 32) scanRequestTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setScanRequestTimer:0];
  return [*(id *)(a1 + 32) _startScanRequestForUnsettledState];
}

- (void)_startScanRequestForUnsettledState
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(RTFingerprintManager *)self fingerprintMonitoringEnabled])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CDE8]);
    id v5 = [MEMORY[0x1E4F29128] UUID];
    int v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = (void *)[v4 initWithIdentifier:v5 settledState:1 start:v6 accessPoints:0];

    uint64_t v8 = [(RTFingerprintManager *)self fingerprintStore];
    v11[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke;
    v10[3] = &unk_1E6B90CB8;
    void v10[4] = self;
    v10[5] = a2;
    [v8 storeFingerprints:v9 handler:v10];
  }
}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "failed to save unsettled transition with error, %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_61;
    v6[3] = &unk_1E6B91248;
    long long v7 = *(_OWORD *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_61(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setStartCollectAccessPoints:0];
  id v2 = [*(id *)(a1 + 32) wifiManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[RTNotification notificationName];
  [v2 addObserver:v3 selector:sel_onWiFiScanNotification_ name:v4];

  id v5 = [*(id *)(a1 + 32) wifiManager];
  [v5 scheduleScan];

  int v6 = [*(id *)(a1 + 32) timerManager];
  long long v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 stringWithFormat:@"%@.scanResultTimer", v9];
  uint64_t v11 = [*(id *)(a1 + 32) queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_2;
  v17[3] = &unk_1E6B91248;
  long long v18 = *(_OWORD *)(a1 + 32);
  __int16 v12 = [v6 timerWithIdentifier:v10 queue:v11 handler:v17];
  [*(id *)(a1 + 32) setScanResultTimer:v12];

  id v13 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    id v20 = v14;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, scanResultTimer start", buf, 0xCu);
  }
  id v15 = [*(id *)(a1 + 32) scanResultTimer];
  [v15 fireAfterDelay:10.0 interval:INFINITY leeway:1.0];

  id v16 = [*(id *)(a1 + 32) scanResultTimer];
  [v16 resume];
}

void __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    v26 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, scanResultTimer expiry", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) scanResultTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setScanResultTimer:0];
  id v5 = [*(id *)(a1 + 32) wifiManager];
  [v5 removeObserver:*(void *)(a1 + 32)];

  int v6 = [*(id *)(a1 + 32) timerManager];
  long long v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 stringWithFormat:@"%@.scanRequestTimer", v9];
  uint64_t v11 = [*(id *)(a1 + 32) queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_65;
  v23[3] = &unk_1E6B91248;
  long long v24 = *(_OWORD *)(a1 + 32);
  __int16 v12 = [v6 timerWithIdentifier:v10 queue:v11 handler:v23];
  [*(id *)(a1 + 32) setScanRequestTimer:v12];

  id v13 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, scanRequestTimer start", buf, 0xCu);
  }
  id v15 = [*(id *)(a1 + 32) defaultsManager];
  id v16 = [v15 objectForKey:@"RTDefaultsFingerprintManagerScanRequestTimerDuration"];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 32) defaultsManager];
    long long v18 = [v17 objectForKey:@"RTDefaultsFingerprintManagerScanRequestTimerDuration"];
    [v18 doubleValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 300.0;
  }

  uint64_t v21 = [*(id *)(a1 + 32) scanRequestTimer];
  [v21 fireAfterDelay:v20 interval:INFINITY leeway:1.0];

  v22 = [*(id *)(a1 + 32) scanRequestTimer];
  [v22 resume];
}

uint64_t __58__RTFingerprintManager__startScanRequestForUnsettledState__block_invoke_65(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    long long v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, scanRequestTimer expiry", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) scanRequestTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setScanRequestTimer:0];
  return [*(id *)(a1 + 32) _startScanRequestForUnsettledState];
}

- (void)onWiFiScanNotification:(id)a3
{
  id v5 = a3;
  int v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  uint64_t v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __47__RTFingerprintManager_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  id v2 = [*(id *)(a1 + 40) startCollectAccessPoints];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) startCollectAccessPoints];
    [v3 timeIntervalSinceNow];
    if (v4 < -300.0)
    {

LABEL_11:
      id v17 = [*(id *)(a1 + 40) wifiManager];
      [v17 removeObserver:*(void *)(a1 + 40)];

      return;
    }
    unint64_t v6 = [*(id *)(a1 + 40) accessPointsCollectedPerFingerprint];
    unint64_t v7 = [*(id *)(a1 + 40) accessPointsFetchLimit];

    if (v6 >= v7) {
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 40) setStartCollectAccessPoints:v5];

    [*(id *)(a1 + 40) setAccessPointsCollectedPerFingerprint:0];
  }
  uint64_t v8 = [*(id *)(a1 + 32) scanResults];
  uint64_t v9 = [v8 count];
  unint64_t v10 = [*(id *)(a1 + 40) accessPointsCollectedPerFingerprint] + v9;
  if (v10 > [*(id *)(a1 + 40) accessPointsFetchLimit])
  {
    uint64_t v11 = [v8 subarrayWithRange:0, [*(id *)(a1 + 40) accessPointsFetchLimit] - [*(id *)(a1 + 40) accessPointsCollectedPerFingerprint]];

    __int16 v12 = [*(id *)(a1 + 40) wifiManager];
    [v12 removeObserver:*(void *)(a1 + 40)];

    uint64_t v8 = (void *)v11;
  }
  id v13 = [*(id *)(a1 + 40) fingerprintStore];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_2;
  v18[3] = &unk_1E6B94130;
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v19 = v8;
  uint64_t v20 = v14;
  v18[4] = v15;
  id v16 = v8;
  [v13 appendWiFiAccessPointsToLastFingerprint:v16 handler:v18];
}

void __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    unint64_t v6 = +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", [*(id *)(a1 + 32) settledState]);
    uint64_t v7 = [*(id *)(a1 + 40) count];
    uint64_t v8 = [*(id *)(a1 + 32) accessPointsCollectedPerFingerprint];
    uint64_t v9 = [*(id *)(a1 + 32) accessPointsCollectedPerFingerprint];
    uint64_t v10 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413570;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    __int16 v24 = 2048;
    uint64_t v25 = v10 + v9;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, settledState, %@, scan result count, %lu, accessPointsCollectedPerFingerprint before, %lu, after, %lu, error, %@", buf, 0x3Eu);
  }
  if (v3)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityFingerprint);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "failed to save wifi access points with error, %@", buf, 0xCu);
    }
  }
  else
  {
    __int16 v12 = [*(id *)(a1 + 32) queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_66;
    v14[3] = &unk_1E6B90BF0;
    id v13 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v13;
    dispatch_async(v12, v14);
  }
}

uint64_t __47__RTFingerprintManager_onWiFiScanNotification___block_invoke_66(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessPointsCollectedPerFingerprint];
  uint64_t v3 = [*(id *)(a1 + 40) count] + v2;
  double v4 = *(void **)(a1 + 32);

  return [v4 setAccessPointsCollectedPerFingerprint:v3];
}

- (void)injectFingerprints:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTFingerprintManager_injectFingerprints_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__RTFingerprintManager_injectFingerprints_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fingerprintStore];
  [v2 storeFingerprints:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)injectWifiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTFingerprintManager_injectWifiAccessPointsToLastFingerprint_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__RTFingerprintManager_injectWifiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fingerprintStore];
  [v2 appendWiFiAccessPointsToLastFingerprint:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__RTFingerprintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    id v13 = v8;
    uint64_t v14 = self;
    id v15 = v9;
    unint64_t v16 = a4;
    dispatch_async(v10, v12);

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __73__RTFingerprintManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v24;
    id v10 = &v23;
LABEL_9:
    uint64_t v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    id v12 = v6;
    uint64_t v13 = v7;
    uint64_t v14 = 7;
LABEL_11:
    id v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  double v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    __int16 v22 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v22;
    id v10 = &v21;
    goto LABEL_9;
  }
  if (([*(id *)(a1 + 40) available] & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    __int16 v20 = @"store is not available";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v12 = v15;
    uint64_t v13 = v16;
    uint64_t v14 = 5;
    goto LABEL_11;
  }
  id v18 = [*(id *)(a1 + 40) fingerprintStore];
  [v18 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (BOOL)available
{
  return self->_available;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTFingerprintStore)fingerprintStore
{
  return self->_fingerprintStore;
}

- (RTTimer)scanRequestTimer
{
  return self->_scanRequestTimer;
}

- (void)setScanRequestTimer:(id)a3
{
}

- (RTTimer)scanResultTimer
{
  return self->_scanResultTimer;
}

- (void)setScanResultTimer:(id)a3
{
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (unint64_t)accessPointsFetchLimit
{
  return self->_accessPointsFetchLimit;
}

- (void)setAccessPointsFetchLimit:(unint64_t)a3
{
  self->_accessPointsFetchLimit = a3;
}

- (unint64_t)accessPointsCollectedPerFingerprint
{
  return self->_accessPointsCollectedPerFingerprint;
}

- (void)setAccessPointsCollectedPerFingerprint:(unint64_t)a3
{
  self->_accessPointsCollectedPerFingerprint = a3;
}

- (NSDate)startCollectAccessPoints
{
  return self->_startCollectAccessPoints;
}

- (void)setStartCollectAccessPoints:(id)a3
{
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (BOOL)fingerprintMonitoringEnabled
{
  return self->_fingerprintMonitoringEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCollectAccessPoints, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_scanResultTimer, 0);
  objc_storeStrong((id *)&self->_scanRequestTimer, 0);
  objc_storeStrong((id *)&self->_fingerprintStore, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end