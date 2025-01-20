@interface RTLifeCycleManager
- (NSMutableArray)signals;
- (NSMutableDictionary)listeners;
- (NSMutableSet)services;
- (OS_dispatch_queue)queue;
- (RTLifeCycleManager)init;
- (RTWatchdogManager)watchdogManager;
- (id)createSourceForSignal:(int)a3 withBlock:(id)a4;
- (id)serviceWithClass:(Class)a3;
- (void)_exit;
- (void)_start;
- (void)addListener:(id)a3 machPort:(id)a4;
- (void)addService:(id)a3;
- (void)dealloc;
- (void)exit;
- (void)exitWithDelay:(double)a3;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServices:(id)a3;
- (void)setSignals:(id)a3;
- (void)setWatchdogManager:(id)a3;
- (void)start;
- (void)submitUptimeMetricsWithDefaultsMananger:(id)a3;
@end

@implementation RTLifeCycleManager

- (RTLifeCycleManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)RTLifeCycleManager;
  v2 = [(RTLifeCycleManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (const char *)[(RTLifeCycleManager *)v4 UTF8String];
    }
    else
    {
      id v7 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v4];
      v6 = (const char *)[v7 UTF8String];
    }
    dispatch_queue_t v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    signals = v4->_signals;
    v4->_signals = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    listeners = v4->_listeners;
    v4->_listeners = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    services = v4->_services;
    v4->_services = (NSMutableSet *)v14;
  }
  return v3;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_signals enumerateObjectsUsingBlock:&__block_literal_global_12];
  v3.receiver = self;
  v3.super_class = (Class)RTLifeCycleManager;
  [(RTLifeCycleManager *)&v3 dealloc];
}

void __29__RTLifeCycleManager_dealloc__block_invoke(int a1, dispatch_source_t source)
{
  if (source) {
    dispatch_source_cancel(source);
  }
}

- (id)createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create(MEMORY[0x1E4F14480], a3, 0, MEMORY[0x1E4F14428]);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);

  return v6;
}

- (void)start
{
  objc_super v3 = [(RTLifeCycleManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager_start__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __27__RTLifeCycleManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)addService:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(RTLifeCycleManager *)self watchdogManager];

  if (!v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[RTLifeCycleManager addService:]";
      __int16 v14 = 1024;
      int v15 = 212;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.watchdogManager (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(RTLifeCycleManager *)self services];
      int v8 = [v7 containsObject:v4];

      if (v8)
      {
        v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v12 = 136315394;
          v13 = "-[RTLifeCycleManager addService:]";
          __int16 v14 = 1024;
          int v15 = 214;
          _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Service already added to services set. (in %s:%d)", (uint8_t *)&v12, 0x12u);
        }
      }
      uint64_t v10 = [(RTLifeCycleManager *)self services];
      [v10 addObject:v4];

      v11 = [(RTLifeCycleManager *)self watchdogManager];
      [v11 addObject:v4];
    }
  }
}

- (void)addListener:(id)a3 machPort:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(RTLifeCycleManager *)self listeners];
      [v7 setObject:v9 forKey:v6];

      int v8 = [(RTLifeCycleManager *)self watchdogManager];
      [v8 addObject:v9];
    }
  }
}

- (id)serviceWithClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v3 = [(RTLifeCycleManager *)self services];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceClass", buf, 2u);
    }
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

- (void)submitUptimeMetricsWithDefaultsMananger:(id)a3
{
  id v33 = a3;
  objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v5 = [v4 processName];
  uint64_t v6 = [@"LastLaunchDate" stringByAppendingPathExtension:v5];
  id v7 = [v33 objectForKey:v6];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F28F80] processInfo];
    id v9 = [v8 processName];
    uint64_t v10 = [@"LastExitDate" stringByAppendingPathExtension:v9];
    long long v11 = [v33 objectForKey:v10];

    if (v11) {
      long long v12 = v11;
    }
    else {
      long long v12 = v3;
    }
    if (v11) {
      long long v13 = v11;
    }
    else {
      long long v13 = v7;
    }
    [v12 timeIntervalSinceDate:v7];
    double v15 = v14;
    [v3 timeIntervalSinceDate:v13];
    double v17 = v16;
    v18 = objc_opt_new();
    v19 = [MEMORY[0x1E4F28F80] processInfo];
    v20 = [v19 processName];
    [v18 setObject:v20 forKeyedSubscript:@"processName"];

    v21 = [NSNumber numberWithDouble:v15];
    [v18 setObject:v21 forKeyedSubscript:@"processUptime"];

    v22 = [NSNumber numberWithDouble:v17];
    [v18 setObject:v22 forKeyedSubscript:@"durationSincePreviousLaunch"];

    if (v11)
    {
      v23 = [NSNumber numberWithInt:0];
      [v18 setObject:v23 forKeyedSubscript:@"previousExitWasUnclean"];
    }
    id v24 = [NSString alloc];
    v25 = (void *)[v24 initWithCString:RTAnalyticsEventProcessUptime encoding:1];
    log_analytics_submission(v25, v18);
    v26 = [NSString stringWithFormat:@"com.apple.%@", v25];
    AnalyticsSendEvent();
  }
  v27 = [MEMORY[0x1E4F28F80] processInfo];
  v28 = [v27 processName];
  v29 = [@"LastLaunchDate" stringByAppendingPathExtension:v28];
  [v33 setObject:v3 forKey:v29];

  v30 = [MEMORY[0x1E4F28F80] processInfo];
  v31 = [v30 processName];
  v32 = [@"LastExitDate" stringByAppendingPathExtension:v31];
  [v33 setObject:0 forKey:v32];
}

- (void)_start
{
  uint64_t v255 = *MEMORY[0x1E4F143B8];
  v136 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v252 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  v246 = +[RTPlatform currentPlatform];
  uint64_t v5 = objc_alloc_init(RTDefaultsManager);
  uint64_t v6 = [[RTWatchdogManager alloc] initWithLifeCycleManager:self defaultsManager:v5 platform:v246];
  watchdogManager = self->_watchdogManager;
  self->_watchdogManager = v6;

  [(RTLifeCycleManager *)self addService:v5];
  v217 = objc_alloc_init(RTReachabilityManager);
  [(RTLifeCycleManager *)self addService:v217];
  [(RTLifeCycleManager *)self submitUptimeMetricsWithDefaultsMananger:v5];
  v238 = [[RTDiagnostics alloc] initWithDefaultsManager:v5 platform:v246];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v5];
  [(RTLifeCycleManager *)self addService:v238];
  [(RTDiagnostics *)v238 logProcessDiagnosticInformation];
  v235 = [[RTXPCActivityManager alloc] initWithDefaultsManager:v5 diagnostics:v238 identifier:@"Default"];
  v237 = [[RTMetricManager alloc] initWithPlatform:v246 xpcActivityManager:v235];
  [(RTLifeCycleManager *)self addService:v237];
  v175 = [[RTAssetProcessor alloc] initWithDefaultsManager:v5];
  v201 = [[RTAssetManager alloc] initWithDefaultsManager:v5 assetProcessor:v175 xpcActivityManager:v235];
  [(RTLifeCycleManager *)self addService:v201];
  [(RTLifeCycleManager *)self addService:v235];
  v227 = [[RTAccountManager alloc] initWithLifecycleManager:self defaultsManager:v5];
  [(RTLifeCycleManager *)self addService:v227];
  v174 = objc_opt_new();
  v173 = objc_opt_new();
  v236 = [[RTDataProtectionManager alloc] initWithKeybagMonitor:v174 notificationHelper:v173];
  [(RTLifeCycleManager *)self addService:v236];
  v172 = objc_opt_new();
  v239 = [[RTAuthorizationManager alloc] initWithPlatform:v246 userSessionMonitor:v172];
  [(RTLifeCycleManager *)self addService:v239];
  v219 = objc_opt_new();
  [(RTLifeCycleManager *)self addService:v219];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v219];
  v247 = objc_opt_new();
  v218 = [[RTPersistenceDriver alloc] initWithPersistenceManager:v247 dataProtectionManager:v236 accountManager:v227 platform:v246 keychainManager:v219 defaultsManager:v5 lifecycleManager:self];
  v230 = [[RTPersistenceMirroringManager alloc] initWithAccountManager:v227 defaultsManager:v5 persistenceManager:v247 platform:v246 reachabilityManager:v217 xpcActivityManager:v235];
  [v247 setDelegate:v218];
  [v247 setMirroringDelegate:v230];
  if (([v247 initializeContainer] & 1) == 0)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "persistence failed to setup.", buf, 2u);
    }

    [(RTLifeCycleManager *)self exit];
  }
  [(RTPersistenceDriver *)v218 start];
  [(RTLifeCycleManager *)self addService:v247];
  [(RTLifeCycleManager *)self addService:v218];
  [(RTLifeCycleManager *)self addService:v230];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v247];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v230];
  objc_initWeak(&location, self);
  id v9 = [(RTLifeCycleManager *)self signals];
  v248[0] = MEMORY[0x1E4F143A8];
  v248[1] = 3221225472;
  v248[2] = __28__RTLifeCycleManager__start__block_invoke;
  v248[3] = &unk_1E6B91900;
  objc_copyWeak(&v249, &location);
  uint64_t v10 = [(RTLifeCycleManager *)self createSourceForSignal:15 withBlock:v248];
  [v9 addObject:v10];

  long long v11 = objc_alloc_init(RTWiFiManager);
  [(RTLifeCycleManager *)self addService:v11];
  v231 = v11;
  long long v12 = [[RTLocationStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v12];
  v222 = v12;
  v196 = objc_opt_new();
  v197 = objc_opt_new();
  long long v13 = [RTLocationManager alloc];
  double v14 = objc_opt_new();
  v244 = [(RTLocationManager *)v13 initWithAuthorizationManager:v239 defaultsManager:v5 locationSmoother:v196 locationStore:v222 platform:v246 routineLocationManager:v197 timerManager:v14];

  [(RTLifeCycleManager *)self addService:v244];
  double v15 = [[RTTripSegmentInertialDataStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v15];
  v171 = v15;
  double v16 = [[RTTripSegmentInertialDataManager alloc] initWithInertialDataStore:v15 routineLocationManager:v197];
  [(RTLifeCycleManager *)self addService:v16];
  v182 = v16;
  double v17 = [[RTBackgroundInertialOdometryStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v17];
  v170 = v17;
  v18 = [[RTBackgroundInertialOdometryManager alloc] initWithBackgroundInertialOdometryStore:v17];
  [(RTLifeCycleManager *)self addService:v18];
  v200 = v18;
  v19 = objc_alloc_init(RTMapServiceManager);
  [(RTLifeCycleManager *)self addService:v19];
  v242 = v19;
  uint64_t v20 = objc_opt_new();
  [(RTLifeCycleManager *)self addService:v20];
  v245 = (void *)v20;
  v21 = [[RTContactsManager alloc] initWithDataProtectionManager:v236 mapServiceManager:v242 distanceCalculator:v20];
  [(RTLifeCycleManager *)self addService:v21];
  v232 = v21;
  v22 = [[RTBuildingPolygonManager alloc] initWithDistanceCalculator:v245 MapServiceManager:v242];
  [(RTLifeCycleManager *)self addService:v22];
  v183 = v22;
  v23 = [[RTMapsSupportManager alloc] initWithMapServiceManager:v242];
  [(RTLifeCycleManager *)self addService:v23];
  v216 = v23;
  id v24 = [[RTVehicleStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v24];
  v209 = v24;
  v25 = [[RTMotionActivityManager alloc] initWithPlatform:v246 vehicleStore:v24];
  [(RTLifeCycleManager *)self addService:v25];
  v240 = v25;
  v26 = [[RTStarkManager alloc] initWithDefaultsManager:v5];
  [(RTLifeCycleManager *)self addService:v26];
  v190 = v26;
  v27 = [RTBatteryManager alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = (const char *)[@"BatteryManager" UTF8String];
  }
  else
  {
    id v30 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"BatteryManager"];
    v29 = (const char *)[v30 UTF8String];
  }
  dispatch_queue_t v31 = dispatch_queue_create(v29, v28);

  v224 = [(RTBatteryManager *)v27 initWithQueue:v31];
  [(RTLifeCycleManager *)self addService:v224];
  v32 = objc_alloc_init(RTBluetoothManager);
  [(RTLifeCycleManager *)self addService:v32];
  v166 = v32;
  id v33 = [[RTWalletManager alloc] initWithDefaultsManager:v5];
  [(RTLifeCycleManager *)self addService:v33];
  v165 = v33;
  v34 = [[RTNavigationManager alloc] initWithAuthorizationManager:v239 mapServiceManager:v242];
  [(RTLifeCycleManager *)self addService:v34];
  v223 = v34;
  uint64_t v35 = objc_opt_new();
  [(RTLifeCycleManager *)self addService:v35];
  v164 = (void *)v35;
  v36 = objc_alloc_init(RTEventManager);
  [(RTLifeCycleManager *)self addService:v36];
  v215 = v36;
  v37 = [(RTStore *)[RTVisitStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v37];
  v214 = v37;
  v195 = [(RTStore *)[RTSettledStateTransitionStore alloc] initWithPersistenceManager:v247];
  v169 = [[RTWiFiFootprintMonitor alloc] initWithWiFiManager:v231];
  v221 = [[RTScenarioTriggerManager alloc] initWithLocationStore:v222 motionActivityManager:v240 settledStateTransitionStore:v195 wifiFootprintMonitor:v169 platform:v246];
  v38 = [(RTStore *)[RTFingerprintStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v38];
  v168 = v38;
  v39 = [RTFingerprintManager alloc];
  v40 = objc_opt_new();
  v226 = [(RTFingerprintManager *)v39 initWithDefaultsManager:v5 fingerprintStore:v168 scenarioTriggerManager:v221 timerManager:v40 wifiManager:v231];

  [(RTLifeCycleManager *)self addService:v226];
  v41 = [RTLearnedLocationStore alloc];
  v42 = [[RTPersistenceExpirationEnforcer alloc] initWithPersistenceManager:v247];
  v241 = [(RTLearnedLocationStore *)v41 initWithDistanceCalculator:v245 expirationEnforcer:v42 mirroringManager:v230];

  [(RTLifeCycleManager *)self addService:v241];
  v43 = [v246 productType];
  if ([v43 isEqualToString:@"Watch1,1"])
  {

LABEL_13:
    v176 = 0;
    goto LABEL_15;
  }
  v44 = [v246 productType];
  char v45 = [v44 isEqualToString:@"Watch1,2"];

  if (v45) {
    goto LABEL_13;
  }
  v46 = [RTLocationAwarenessManager alloc];
  v47 = objc_opt_new();
  v48 = objc_opt_new();
  v176 = [(RTLocationAwarenessManager *)v46 initWithLocationManager:v244 config:v47 metricManager:v237 motionActivityManager:v240 authorizationManager:v239 wifiManager:v231 xpcActivityManager:v235 timerManager:v48 learnedLocationStore:v241];

  [(RTLifeCycleManager *)self addService:v176];
LABEL_15:
  v167 = [[RTInferredMapItemFuser alloc] initWithDefaultsManager:v5 distanceCalculator:v245 learnedLocationStore:v241];
  uint64_t v49 = objc_opt_new();
  [(RTLifeCycleManager *)self addService:v49];
  v194 = (void *)v49;
  v50 = [(RTStore *)[RTPlaceInferenceQueryStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v50];
  v210 = v50;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = (const char *)[@"placeInferenceManagerQueue" UTF8String];
  }
  else
  {
    id v53 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"placeInferenceManagerQueue"];
    v52 = (const char *)[v53 UTF8String];
  }
  object = dispatch_queue_create(v52, v51);

  dispatch_suspend(object);
  v54 = -[RTPlaceInferenceManager initWithQueue:defaultsManager:distanceCalculator:eventManager:fingerprintManager:inferredMapItemFuser:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:portraitManager:visitStore:]([RTPlaceInferenceManager alloc], "initWithQueue:defaultsManager:distanceCalculator:eventManager:fingerprintManager:inferredMapItemFuser:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:portraitManager:visitStore:", object, v5, v245, v215, v226, v167, v241, v244, v242, v216, v237, v240, v210, v246, v194,
          v214);
  [(RTLifeCycleManager *)self addService:v54];
  v229 = v54;
  v55 = [[RTLearnedPlaceTypeInferenceStore alloc] initWithPersistenceManager:v247 learnedLocationStore:v241];
  [(RTLifeCycleManager *)self addService:v55];
  v191 = v55;
  v192 = [[RTVisitLabeler alloc] initWithDefaultsManager:v5 placeInferenceManager:v229 locationManager:v244 wifiManager:v231];
  v154 = [[RTLearnedLocationReconcilerPerDevice alloc] initWithPersistenceManager:v247];
  v153 = [[RTLearnedLocationReconcilerPerVisit alloc] initWithPersistenceManager:v247 defaultsManager:v5];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = (const char *)[@"RTLearnedLocationManager" UTF8String];
  }
  else
  {
    id v58 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"RTLearnedLocationManager"];
    v57 = (const char *)[v58 UTF8String];
  }
  v204 = dispatch_queue_create(v57, v56);

  dispatch_suspend(v204);
  v59 = [[RTLearnedLocationManager alloc] initWithQueue:v204 contactsManager:v232 distanceCalculator:v245 learnedLocationStore:v241 learnedPlaceTypeInferenceStore:v191 mapServiceManager:v242];
  [(RTLifeCycleManager *)self addService:v59];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v59];
  v243 = v59;
  v163 = [(RTStore *)[RTHintStore alloc] initWithPersistenceManager:v247];
  v60 = [RTVehicleLocationProvider alloc];
  v61 = objc_opt_new();
  v233 = [(RTVehicleLocationProvider *)v60 initWithLocationManager:v244 motionActivityManager:v240 mapsSupportManager:v216 metricManager:v237 managedObjectContext:0 persistenceManager:v247 vehicleLocationHistoryController:0 learnedLocationManager:v243 managedConfiguration:v61 defaultsManager:v5 keychainManager:v219];

  [(RTLifeCycleManager *)self addService:v233];
  v62 = [[RTEventModelProvider alloc] initWithDefaultsManager:v5 eventManager:v215 learnedLocationManager:v243 managedObjectContext:0 metricManager:v237 persistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v62];
  v208 = v62;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = (const char *)[@"RTDeviceLocationPredictor" UTF8String];
  }
  else
  {
    id v65 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"RTDeviceLocationPredictor"];
    v64 = (const char *)[v65 UTF8String];
  }
  dispatch_queue_t v193 = dispatch_queue_create(v64, v63);

  v162 = [[RTNextPredictedLocationsOfInterestCache alloc] initWithQueue:v193 dataProtectionManager:v236 starkManager:v190];
  v161 = [[RTPredictedLocationOfInterestProviderStateModel alloc] initWithDataProtectionManager:v236 learnedLocationManager:v243 locationManager:v244 metricManager:v237 cache:v162];
  v160 = [[RTPredictedLocationOfInterestProviderCalendar alloc] initWithEventManager:v215 eventModelProvider:v208 learnedLocationManager:v243 mapServiceManager:v242];
  v159 = [[RTPredictedLocationOfInterestProviderMaps alloc] initWithMapsSupportManager:v216];
  v133 = [[RTPredictedLocationOfInterestProviderVehicleLocation alloc] initWithVehicleLocationProvider:v233 distanceCalculator:v245];
  v158 = [MEMORY[0x1E4F1CAD0] setWithObjects:v160, v161, v159, v133, 0];
  v66 = [[RTDeviceLocationPredictor alloc] initWithQueue:v193 authorizationManager:v239 defaultsManager:v5 distanceCalculator:v245 learnedLocationManager:v243 locationManager:v244 mapServiceManager:v242 metricManager:v237 platform:v246 providers:v158];
  [(RTLifeCycleManager *)self addService:v66];
  v225 = v66;
  v67 = [[RTHintManager alloc] initWithBatteryManager:v224 bluetoothManager:v166 cameraManager:v164 hintStore:v163 learnedLocationManager:v243 locationManager:v244 metricManager:v237 navigationManager:v223 reachabilityManager:v217 walletManager:v165];
  [(RTLifeCycleManager *)self addService:v67];
  v207 = v67;
  v68 = [[RTAppClipManager alloc] initWithDistanceCalculator:v245];
  [(RTLifeCycleManager *)self addService:v68];
  v157 = v68;
  v69 = [[RTPointOfInterestMonitor alloc] initWithAppClipManager:v68 buildingPolygonManager:v183 defaultsManager:v5 distanceCalculator:v245 learnedLocationManager:v243 locationManager:v244 mapServiceManager:v242 motionActivityManager:v240 navigationManager:v223 platform:v246 vehicleLocationProvider:v233 visitLabeler:v192 visitStore:v214];
  [(RTLifeCycleManager *)self addService:v69];
  v156 = v69;
  v70 = [[RTVisitManager alloc] initWithDefaultsManager:v5 deviceLocationPredictor:v225 hintManager:v207 learnedLocationManager:v243 locationAwarenessManager:v176 locationManager:v244 metricManager:v237 motionActivityManager:v240 platform:v246 pointOfInterestMonitor:v69 visitLabeler:v192 visitStore:v214 xpcActivityManager:v235];
  [(RTPlaceInferenceManager *)v229 setVisitManager:v70];
  v234 = v70;
  dispatch_resume(object);
  v155 = [[RTAuthorizedLocationVisitLogStore alloc] initWithPersistenceManager:v247];
  v71 = [RTAuthorizedLocationManager alloc];
  v72 = +[RTPlatform currentPlatform];
  v199 = [(RTAuthorizedLocationManager *)v71 initWithVisitManager:v234 locationManager:v244 distanceCalculator:v245 learnedLocationManager:v243 motionActivityManager:v240 visitLogStore:v155 defaultsManager:v5 xpcActivityManager:v235 dataProtectionManager:v236 persistenceMirroringManager:v230 platform:v72 authorizationManager:v239];

  [(RTLifeCycleManager *)self addService:v199];
  v73 = [[RTHealthKitManager alloc] initWithContactsManager:v232 defaultsManager:v5 distanceCalculator:v245 platform:v246];
  [(RTDiagnostics *)v238 addDiagnosticProvider:v73];
  v228 = v73;
  v152 = [[RTElevationStore alloc] initWithPersistenceManager:v247];
  if ([MEMORY[0x1E4F221A0] isAbsoluteAltitudeAvailable]
    && [v246 iPhoneDevice]
    && [MEMORY[0x1E4F1E600] locationServicesEnabled])
  {
    id v74 = objc_alloc_init(MEMORY[0x1E4F221A0]);
    v151 = [[RTElevationProvider alloc] initWithAltimeter:v74];
  }
  else
  {
    v151 = 0;
  }
  v75 = [[RTElevationManager alloc] initWithElevationStore:v152 elevationProvider:v151];
  [(RTLifeCycleManager *)self addService:v75];
  v213 = v75;
  v76 = [[RTElevationAdjuster alloc] initWithElevationManager:v75];
  [(RTLifeCycleManager *)self addService:v76];
  v181 = v76;
  v150 = [[RTTripSegmentStore alloc] initWithPersistenceManager:v247];
  v149 = [[RTSynthesizedLocationStore alloc] initWithPersistenceManager:v247];
  v77 = [[RTTripSegmentManager alloc] initWithTripSegmentStore:v150 synthesizedLocationStore:v149 defaultsManager:v5 elevationAdjuster:v76 learnedLocationStore:v241 distanceCalculator:v245];
  [(RTLifeCycleManager *)self addService:v77];
  v198 = v77;
  v78 = [[RTEventAgentManager alloc] initWithPlatform:v246];
  [(RTLifeCycleManager *)self addService:v78];
  v178 = v78;
  if (+[RTTripSegmentProvider isTripSegmentGenerationSupportedOnPlatform:v246])
  {
    v148 = [[RTTripSegmentProvider alloc] initWithLearnedLocationManager:v243 locationManager:v244 motionActivityManager:v240 tripSegmentInertialDataManager:v182 inertialOdometryManager:v200 vehicleStore:v209 tripSegmentManager:v198 elevationAdjuster:v181 distanceCalculator:v245 defaultsManager:v5 visitManager:v234];
  }
  else
  {
    v148 = 0;
  }
  v147 = [[RTTransitMetricManager alloc] initWithDefaultsManager:v5 distanceCalculator:v245 learnedLocationManager:v243 learnedLocationStore:v241];
  v79 = [[RTDeviceMetricManager alloc] initWithDefaultsManager:v5 motionActivityManager:v240 reachabilityManager:v217];
  [(RTLifeCycleManager *)self addService:v79];
  v132 = v79;
  v80 = [[RTBiomeManager alloc] initWithAuthorizationManager:v239 dataProtectionManager:v236 defaultsManager:v5 learnedLocationManager:v243 platform:v246];
  [(RTLifeCycleManager *)self addService:v80];
  v188 = v80;
  v146 = [[RTDailyTrainingSessionCounter alloc] initWithDefaultsManager:v5];
  v81 = [RTPointOfInterestSampler alloc];
  v82 = objc_opt_new();
  v180 = [(RTPointOfInterestSampler *)v81 initWithDefaultsManager:v5 locationManager:v244 placeInferenceManager:v229 timerManager:v82 wifiManager:v231];

  v83 = [RTPointOfInterestMetricsManager alloc];
  v84 = objc_opt_new();
  v189 = [(RTPointOfInterestMetricsManager *)v83 initWithBatteryManager:v224 defaultsManager:v5 distanceCalculator:v245 learnedLocationStore:v241 locationManager:v244 mapServiceManager:v242 navigationManager:v223 placeInferenceQueryStore:v210 pointOfInterestSampler:v180 scenarioTriggerManager:v221 timerManager:v84 visitManager:v234];

  [(RTLifeCycleManager *)self addService:v189];
  v85 = -[RTLearnedLocationEngine initWithAccountManager:biomeManager:contactsManager:dailyTrainingSessionCounter:defaultsManager:diagnostics:distanceCalculator:elevationManager:eventManager:fingerprintManager:learnedLocationStore:learnedPlaceTypeInferenceStore:locationManager:locationStore:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:pointOfInterestMetricsManager:portraitManager:reconcilerPerVisit:reconcilerPerDevice:settledStateTransitionStore:transitMetricManager:tripSegmentProvider:visitManager:xpcActivityManager:]([RTLearnedLocationEngine alloc], "initWithAccountManager:biomeManager:contactsManager:dailyTrainingSessionCounter:defaultsManager:diagnostics:distanceCalculator:elevationManager:eventManager:fingerprintManager:learnedLocationStore:learnedPlaceTypeInferenceStore:locationManager:locationStore:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:pointOfInterestMetricsManager:portraitManager:reconcilerPerVisit:reconcilerPerDevice:settledStateTransitionStore:transitMetricManager:tripSegmentProvider:visitManager:xpcActivityManager:", v227, v188, v232, v146, v5, v238, v245, v213, v215, v226, v241, v191, v244,
          v222,
          v242,
          v216,
          v237,
          v240,
          v210,
          v246,
          v189,
          v194,
          v153,
          v154,
          v195,
          v147,
          v148,
          v234,
          v235);
  [(RTLearnedLocationManager *)v243 setLearnedLocationEngine:v85];
  v131 = v85;
  dispatch_resume(v204);
  v86 = [[RTIntermittentGNSSManager alloc] initWithDefaultsManager:v5 learnedLocationManager:v243 locationManager:v244 motionActivityManager:v240 platform:v246 vehicleLocationProvider:v233 wifiManager:v231];
  [(RTLifeCycleManager *)self addService:v86];
  v177 = v86;
  v145 = objc_alloc_init(RTWorkoutMetricsManager);
  v87 = [(RTStore *)[RTWorkoutDistanceStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v87];
  v144 = v87;
  v88 = [[RTWorkoutRouteManager alloc] initWithDefaultsManager:v5 distanceCalculator:v245 healthKitManager:v228 locationManager:v244 mapServiceManager:v242 platform:v246 workoutDistanceStore:v87 workoutMetricsManager:v145];
  [(RTLifeCycleManager *)self addService:v88];
  v179 = v88;
  v89 = [[RTWorkoutScheduler alloc] initWithBatteryManager:v224 dataProtectionManager:v236 workoutRouteManager:v88 healthKitManager:v228 locationManager:v244 defaultsManager:v5 platform:v246 xpcActivityManager:v235];
  [(RTLifeCycleManager *)self addService:v89];
  v135 = v89;
  id v143 = objc_alloc_init(MEMORY[0x1E4F1E610]);
  v90 = [(RTStore *)[RTProximityEventStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v90];
  v142 = v90;
  v91 = [(RTStore *)[RTPeopleDensityStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v91];
  v141 = v91;
  v92 = [RTPeopleDiscoveryProvider alloc];
  v93 = objc_opt_new();
  v206 = [(RTPeopleDiscoveryProvider *)v92 initWithDefaultManager:v5 proximityEventStore:v142 peopleDensityStore:v141 advertisementManager:v143 dataProtectionManager:v236 timerManager:v93];

  [(RTLifeCycleManager *)self addService:v206];
  v94 = objc_alloc_init(RTNetworkOfInterestManager);
  [(RTLifeCycleManager *)self addService:v94];
  v140 = v94;
  v95 = objc_alloc_init(SMMessagingService);
  [(RTLifeCycleManager *)self addService:v95];
  v211 = v95;
  v96 = [SMSafetyCacheStore alloc];
  v97 = objc_opt_new();
  v220 = [(SMSafetyCacheStore *)v96 initWithPersistenceManager:v247 timerManager:v97];

  [(RTLifeCycleManager *)self addService:v220];
  v98 = [(RTStore *)[SMSessionStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v98];
  v212 = v98;
  id v203 = objc_alloc_init(MEMORY[0x1E4F99810]);
  id v99 = objc_alloc(MEMORY[0x1E4F99860]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v101 = (const char *)[@"SMEligibilityChecker" UTF8String];
  }
  else
  {
    id v102 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"SMEligibilityChecker"];
    v101 = (const char *)[v102 UTF8String];
  }
  dispatch_queue_t v103 = dispatch_queue_create(v101, v100);

  v187 = (void *)[v99 initWithQueue:v103];
  id v104 = objc_alloc(MEMORY[0x1E4F99850]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v105 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v106 = (const char *)[@"SMDeviceConfigurationChecker" UTF8String];
  }
  else
  {
    id v107 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"SMDeviceConfigurationChecker"];
    v106 = (const char *)[v107 UTF8String];
  }
  dispatch_queue_t v108 = dispatch_queue_create(v106, v105);

  v186 = (void *)[v104 initWithQueue:v108];
  v109 = [RTLocationManager alloc];
  v110 = objc_opt_new();
  v111 = [(RTLocationManager *)v109 initWithAuthorizationManager:0 defaultsManager:v5 locationSmoother:v196 locationStore:v220 platform:v246 routineLocationManager:0 timerManager:v110 effectiveLocationBundlePath:*MEMORY[0x1E4F99A90]];

  [(RTLifeCycleManager *)self addService:v111];
  v112 = [(RTStore *)[SMSuggestionsStore alloc] initWithPersistenceManager:v247];
  [(RTLifeCycleManager *)self addService:v112];
  v185 = v112;
  v113 = [[SMSuggestionsHelper alloc] initWithAuthorizationManager:v239 contactsManager:v232 deviceLocationPredictor:v225 distanceCalculator:v245 healthKitManager:v228 learnedLocationStore:v241 learnedLocationManager:v243 locationManager:v111 mapServiceManager:v242 navigationManager:v223 sessionStore:v212 eligibilityChecker:v187];
  [(RTLifeCycleManager *)self addService:v113];
  v202 = v113;
  v114 = -[SMSuggestionsManager initWithAuthorizationManager:contactsManager:defaultsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:messagingService:motionActivityManager:navigationManager:platform:visitManager:sessionStore:suggestionsStore:suggestionsHelper:appDeletionManager:]([SMSuggestionsManager alloc], "initWithAuthorizationManager:contactsManager:defaultsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:messagingService:motionActivityManager:navigationManager:platform:visitManager:sessionStore:suggestionsStore:suggestionsHelper:appDeletionManager:", v239, v232, v5, v225, v245, v228, v241, v243, v111, v242, v211, v240, v223, v246,
           v234,
           v212,
           v185,
           v113,
           v203);
  [(RTLifeCycleManager *)self addService:v114];
  v184 = [[RTXPCActivityManager alloc] initWithDefaultsManager:v5 diagnostics:v238 identifier:@"SafetyMonitor"];
  v139 = objc_opt_new();
  v115 = -[SMInitiatorService initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:appDeletionManager:]([SMInitiatorService alloc], "initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:appDeletionManager:", v5, v232, v111, v240, v246, v211, v220, v212, v236, v224, v184, v140, v239, 0,
           v233,
           v190,
           v114,
           v113,
           v243,
           v228,
           v186,
           v139,
           v188,
           v203);
  [(RTLifeCycleManager *)self addService:v115];
  v116 = [[SMReceiverService alloc] initWithDefaultsManager:v5 platform:v246 messagingService:v211 safetyCacheStore:v220 xpcActivityManager:v184];
  [(RTLifeCycleManager *)self addService:v116];
  v138 = v116;
  v117 = [[SMClientListener alloc] initWithDefaultsManager:v5 authorizationManager:v239 distanceCalculator:v245 platform:v246 initiatorService:v115 messagingService:v211 receiverService:v116 sessionStore:v212 suggestionsManager:v114 suggestionsHelper:v202 suggestionsStore:v185 eligibilityChecker:v187 deviceConfigurationChecker:v186 appDeletionManager:v203];
  [(RTLifeCycleManager *)self addListener:v117 machPort:*MEMORY[0x1E4F99A98]];
  v130 = v117;
  v137 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v207, v225, v213, v208, v226, v182, v200, v244, v243, v221, v234, v229, v233, v230, v218, v198, v209,
                   v115,
                   v114,
                   v206,
                   v111,
                   0);
  v118 = [[RTPurgeManager alloc] initWithDefaultsManager:v5 learnedLocationStore:v241 lifeCycleManager:self platform:v246 purgers:v137 visitStore:v214 xpcActivityManager:v235];
  [(RTLifeCycleManager *)self addService:v118];
  v119 = [RTLocationContextManager alloc];
  v120 = objc_opt_new();
  v121 = [(RTLocationContextManager *)v119 initWithAuthorizationManager:v239 defaultsManager:v5 distanceCalculator:v245 learnedLocationManager:v243 learnedLocationStore:v241 locationManager:v244 placeInferenceManager:v229 platform:v246 timerManager:v120 visitManager:v234];

  [(RTLifeCycleManager *)self addService:v121];
  v122 = [RTClientListener alloc];
  v123 = objc_opt_new();
  v124 = -[RTClientListener initWithAccountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v122, "initWithAccountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v227, v201, v239, v200, v232, v5, v225, v238, v213, v178, v208, v199,
           v226,
           v228,
           v207,
           v177,
           v243,
           v241,
           v244,
           v121,
           v222,
           v242,
           v237,
           v240,
           v206,
           v229,
           v118,
           v221,
           v123,
           v198,
           v233,
           v209,
           v234,
           v231);

  [(RTLifeCycleManager *)self addListener:v124 machPort:@"com.apple.routined.registration"];
  if ([v246 internalInstall])
  {
    v125 = -[RTClientListenerInternal initWithAccountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:platform:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:]([RTClientListenerInternal alloc], "initWithAccountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:platform:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:", v227, v201, v239, v183, v225, v238, v178, v208, v199, v226, v207, v177,
             v243,
             v241,
             v244,
             v222,
             v242,
             v240,
             v206,
             v247,
             v210,
             v246,
             v180,
             v118,
             v220,
             v221,
             v233,
             v234,
             v179,
             v135);
    [(RTLifeCycleManager *)self addListener:v125 machPort:@"com.apple.routined.internal"];
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_queue, &__block_literal_global_511);
  xpc_set_event_stream_handler("com.apple.alarm", (dispatch_queue_t)self->_queue, &__block_literal_global_516);
  v126 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v127 = (id)objc_claimAutoreleasedReturnValue();
    v128 = [MEMORY[0x1E4F1C9C8] date];
    [v128 timeIntervalSinceDate:v136];
    *(_DWORD *)buf = 138412546;
    id v252 = v127;
    __int16 v253 = 2048;
    uint64_t v254 = v129;
    _os_log_impl(&dword_1D9BFA000, v126, OS_LOG_TYPE_INFO, "%@, finished, latency, %.2f", buf, 0x16u);
  }
  objc_destroyWeak(&v249);
  objc_destroyWeak(&location);
}

void __28__RTLifeCycleManager__start__block_invoke(uint64_t a1)
{
  v2 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "handle SIGTERM", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained exit];
}

void __28__RTLifeCycleManager__start__block_invoke_508(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MEMORY[0x1E016E0A0]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14560]);
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = string;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "--- handle event %s ---", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = [NSString stringWithUTF8String:string];
    [v5 postNotificationName:v6 object:0];
  }
}

void __28__RTLifeCycleManager__start__block_invoke_514(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MEMORY[0x1E016E0A0]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14560]);
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = string;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "--- handle event, com.apple.alarm, name, %s ---", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = [NSString stringWithUTF8String:string];
    [v5 postNotificationName:v6 object:0];
  }
}

- (void)exitWithDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  uint64_t v5 = [(RTLifeCycleManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RTLifeCycleManager_exitWithDelay___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

uint64_t __36__RTLifeCycleManager_exitWithDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exit];
}

- (void)exit
{
  objc_super v3 = [(RTLifeCycleManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__RTLifeCycleManager_exit__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__RTLifeCycleManager_exit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exit];
}

- (void)_exit
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v71 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v35 = [(RTLifeCycleManager *)self serviceWithClass:objc_opt_class()];
  int v7 = [(RTLifeCycleManager *)self listeners];
  int v8 = [v7 allValues];
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(RTLifeCycleManager *)self services];
  long long v11 = (void *)[v10 mutableCopy];

  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager__exit__block_invoke;
  block[3] = &unk_1E6B917F0;
  SEL v67 = a2;
  id v34 = v6;
  id v64 = v34;
  id v39 = v11;
  id v65 = v39;
  id v38 = v9;
  id v66 = v38;
  dispatch_after(v12, queue, block);
  double v14 = dispatch_group_create();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  double v15 = [(RTLifeCycleManager *)self listeners];
  double v16 = [v15 allValues];

  id obj = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v60;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v59 + 1) + 8 * v20);
        v22 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_group_enter(v14);
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __27__RTLifeCycleManager__exit__block_invoke_517;
        v54[3] = &unk_1E6B91E30;
        v54[4] = self;
        v54[5] = v21;
        SEL v58 = a2;
        id v55 = v22;
        id v56 = v38;
        v57 = v14;
        id v23 = v22;
        [v21 shutdownWithHandler:v54];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v18);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obja = [(RTLifeCycleManager *)self services];
  uint64_t v24 = [obja countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v51;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(obja);
        }
        v28 = *(void **)(*((void *)&v50 + 1) + 8 * v27);
        v29 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_group_enter(v14);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __27__RTLifeCycleManager__exit__block_invoke_523;
        v45[3] = &unk_1E6B91E30;
        v45[4] = self;
        v45[5] = v28;
        SEL v49 = a2;
        id v46 = v29;
        id v47 = v39;
        v48 = v14;
        id v30 = v29;
        [v28 shutdownWithHandler:v45];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [obja countByEnumeratingWithState:&v50 objects:v68 count:16];
    }
    while (v25);
  }

  dispatch_queue_t v31 = [(RTLifeCycleManager *)self queue];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __27__RTLifeCycleManager__exit__block_invoke_525;
  v40[3] = &unk_1E6B917F0;
  id v41 = v35;
  id v42 = v34;
  v43 = self;
  SEL v44 = a2;
  id v32 = v34;
  id v33 = v35;
  dispatch_group_notify(v14, v31, v40);
}

void __27__RTLifeCycleManager__exit__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_super v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    dispatch_time_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
    uint64_t v6 = v5;
    uint64_t v7 = [*(id *)(a1 + 40) count];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 48) count];
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 138413570;
    dispatch_time_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, timed out waiting for clean exit, latency, %.2f, %lu services, %@, %lu listeners, %@", (uint8_t *)&v11, 0x3Eu);
  }
  exit(0);
}

void __27__RTLifeCycleManager__exit__block_invoke_517(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager__exit__block_invoke_2;
  block[3] = &unk_1E6B91E08;
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v5 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v10 = v3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v8 = v3;
  dispatch_async(v4, block);
}

void __27__RTLifeCycleManager__exit__block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 80));
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)buf = 138413058;
    uint64_t v25 = (uint64_t)v12;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    uint64_t v29 = v15;
    __int16 v30 = 2048;
    uint64_t v31 = v17;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, shutdown service, %@, error, %@, latency, %.2f", buf, 0x2Au);
  }
  [*(id *)(*(void *)(a1 + 56) + 32) removeObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 64) removeObject:*(void *)(a1 + 32)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v6)
        {
          [v6 appendString:@", "];
        }
        else
        {
          id v6 = [MEMORY[0x1E4F28E78] string:v19];
        }
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        [v6 appendString:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [*(id *)(a1 + 64) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = v18;
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "total number of listeners remaining, %lu, listeners, %@", buf, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __27__RTLifeCycleManager__exit__block_invoke_523(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__RTLifeCycleManager__exit__block_invoke_2_524;
  v7[3] = &unk_1E6B91E58;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 72);
  v7[4] = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  dispatch_async(v2, v7);
}

void __27__RTLifeCycleManager__exit__block_invoke_2_524(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = (uint64_t)v12;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, shutdown service, %@, latency, %.2f", buf, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 48) + 32) removeObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 56) removeObject:*(void *)(a1 + 32)];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v6)
        {
          [v6 appendString:@", "];
        }
        else
        {
          uint64_t v6 = [MEMORY[0x1E4F28E78] string:v18];
        }
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        [v6 appendString:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = [*(id *)(a1 + 56) count];
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    __int16 v26 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "total number of services remaining, %lu, services, %@", buf, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __27__RTLifeCycleManager__exit__block_invoke_525(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v5 = [v4 processName];
  uint64_t v6 = [@"LastExitDate" stringByAppendingPathExtension:v5];
  [v2 setObject:v3 forKey:v6];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, shutdown complete, latency, %.2f", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 32) shutdownWithHandler:&__block_literal_global_528];
  return xpc_transaction_exit_clean();
}

void __27__RTLifeCycleManager__exit__block_invoke_526()
{
  v0 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D9BFA000, v0, OS_LOG_TYPE_INFO, "RTWatchdog finished shutdown", v1, 2u);
  }
}

- (NSMutableArray)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (RTWatchdogManager)watchdogManager
{
  return self->_watchdogManager;
}

- (void)setWatchdogManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_watchdogManager, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_signals, 0);
}

@end