@interface RTPointOfInterestMetricsManager
- (BOOL)_shouldCollectQueriesForMapItem:(id)a3;
- (BOOL)samplingPointOfInterest;
- (BOOL)submitMetricsWithError:(id *)a3;
- (NSMutableArray)locationDenyList;
- (RTBatteryManager)batteryManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTMapItem)navigationDestination;
- (RTMapServiceManager)mapServiceManager;
- (RTNavigationManager)navigationManager;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTPointOfInterestMetricsManager)init;
- (RTPointOfInterestMetricsManager)initWithBatteryManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 locationManager:(id)a7 mapServiceManager:(id)a8 navigationManager:(id)a9 placeInferenceQueryStore:(id)a10 pointOfInterestSampler:(id)a11 scenarioTriggerManager:(id)a12 timerManager:(id)a13 visitManager:(id)a14;
- (RTPointOfInterestSampler)pointOfInterestSampler;
- (RTScenarioTriggerManager)scenarioTriggerManager;
- (RTTimer)samplingTimer;
- (RTTimerManager)timerManager;
- (RTVisitManager)visitManager;
- (id)collectMetricsWithError:(id *)a3;
- (id)processQueries:(id)a3 visitEntryDate:(id)a4 poiIdentifier:(unint64_t)a5;
- (int)currentSignalEnvironmentType;
- (unint64_t)getTruthPointOfInterestIdentifier;
- (unint64_t)settledState;
- (void)_onLearnedLocationStoreNotification:(id)a3;
- (void)_onLeechedLocationNotification:(id)a3;
- (void)_onNavigationNotification:(id)a3;
- (void)_onVisitManagerVisitIncidentNotification:(id)a3;
- (void)_registerForNotifications;
- (void)_setup;
- (void)_shutdown;
- (void)_unRegisterForNotifications;
- (void)_updateLocationDenyList;
- (void)onLearnedLocationStoreNotification:(id)a3;
- (void)onLeechedLocationNotification:(id)a3;
- (void)onNavigationNotification:(id)a3;
- (void)onSettledNotification:(id)a3;
- (void)onUnsettledNotification:(id)a3;
- (void)onVisitManagerVisitIncidentNotification:(id)a3;
- (void)setCurrentSignalEnvironmentType:(int)a3;
- (void)setNavigationDestination:(id)a3;
- (void)setSamplingPointOfInterest:(BOOL)a3;
- (void)setSamplingTimer:(id)a3;
- (void)setSettledState:(unint64_t)a3;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation RTPointOfInterestMetricsManager

uint64_t __65__RTPointOfInterestMetricsManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLeechedLocationNotification:*(void *)(a1 + 40)];
}

- (void)onLeechedLocationNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTPointOfInterestMetricsManager_onLeechedLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_onLeechedLocationNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [v5 leechedLocations];
    if ([v9 count])
    {
      v10 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = NSStringFromSelector(a2);
        v12 = [v9 lastObject];
        int v14 = 138412546;
        id v15 = v11;
        __int16 v16 = 2048;
        unint64_t v17 = [v12 signalEnvironmentType];
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, update current signal environment type, %lu", (uint8_t *)&v14, 0x16u);
      }
      v13 = [v9 lastObject];
      -[RTPointOfInterestMetricsManager setCurrentSignalEnvironmentType:](self, "setCurrentSignalEnvironmentType:", [v13 signalEnvironmentType]);
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v5;
      __int16 v16 = 2080;
      unint64_t v17 = (unint64_t)"-[RTPointOfInterestMetricsManager _onLeechedLocationNotification:]";
      __int16 v18 = 1024;
      int v19 = 629;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)setCurrentSignalEnvironmentType:(int)a3
{
  self->_currentSignalEnvironmentType = a3;
}

- (RTPointOfInterestMetricsManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBatteryManager_defaultsManager_distanceCalculator_learnedLocationStore_locationManager_mapServiceManager_navigationManager_placeInferenceQueryStore_pointOfInterestSampler_scenarioTriggerManager_timerManager_visitManager_);
}

- (RTPointOfInterestMetricsManager)initWithBatteryManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 locationManager:(id)a7 mapServiceManager:(id)a8 navigationManager:(id)a9 placeInferenceQueryStore:(id)a10 pointOfInterestSampler:(id)a11 scenarioTriggerManager:(id)a12 timerManager:(id)a13 visitManager:(id)a14
{
  id v54 = a3;
  id v43 = a4;
  id v19 = a4;
  id v44 = a5;
  id v49 = a5;
  id v45 = a6;
  id v48 = a6;
  id v46 = a7;
  id v20 = a7;
  id v47 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v53 = a12;
  id v52 = a13;
  id v25 = a14;
  v50 = v25;
  if (!v54)
  {
    v26 = v19;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: batteryManager", buf, 2u);
    }

    v35 = 0;
    v37 = 0;
    v27 = v48;
    v28 = v49;
    goto LABEL_42;
  }
  v26 = v19;
  if (!v19)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = v48;
    v28 = v49;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: defaultsManager";
LABEL_39:
    _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_40;
  }
  v27 = v48;
  v28 = v49;
  if (!v49)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_39;
  }
  if (!v48)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_39;
  }
  if (!v20)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_39;
  }
  if (!v21)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_39;
  }
  if (!v22)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_39;
  }
  if (!v23)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_39;
  }
  if (!v24)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: pointOfInterestSampler";
    goto LABEL_39;
  }
  if (!v53)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_39;
  }
  if (!v52)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v39 = "Invalid parameter not satisfying: timerManger";
      goto LABEL_39;
    }
LABEL_40:

    v35 = 0;
LABEL_41:
    v37 = v54;
    goto LABEL_42;
  }
  if (v25)
  {
    v55.receiver = self;
    v55.super_class = (Class)RTPointOfInterestMetricsManager;
    v29 = [(RTNotifier *)&v55 init];
    v30 = v29;
    if (v29)
    {
      objc_storeStrong((id *)&v29->_batteryManager, a3);
      objc_storeStrong((id *)&v30->_defaultsManager, v43);
      objc_storeStrong((id *)&v30->_distanceCalculator, v44);
      objc_storeStrong((id *)&v30->_learnedLocationStore, v45);
      objc_storeStrong((id *)&v30->_locationManager, v46);
      objc_storeStrong((id *)&v30->_mapServiceManager, v47);
      objc_storeStrong((id *)&v30->_navigationManager, a9);
      objc_storeStrong((id *)&v30->_placeInferenceQueryStore, a10);
      objc_storeStrong((id *)&v30->_pointOfInterestSampler, a11);
      objc_storeStrong((id *)&v30->_scenarioTriggerManager, a12);
      objc_storeStrong((id *)&v30->_timerManager, a13);
      objc_storeStrong((id *)&v30->_visitManager, a14);
      uint64_t v31 = objc_opt_new();
      locationDenyList = v30->_locationDenyList;
      v30->_locationDenyList = (NSMutableArray *)v31;

      v30->_samplingPointOfInterest = 0;
      v30->_settledState = 0;
      samplingTimer = v30->_samplingTimer;
      v30->_samplingTimer = 0;

      v30->_currentSignalEnvironmentType = 0;
      navigationDestination = v30->_navigationDestination;
      v30->_navigationDestination = 0;
    }
    [(RTService *)v30 setup];
    v35 = v30;
    self = v35;
    goto LABEL_41;
  }
  v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = v54;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
  }

  v35 = 0;
LABEL_42:

  return v35;
}

- (void)_setup
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F83948] sharedInstance];
  int v5 = [v4 optInApple];

  id v6 = NSString;
  id v7 = [NSString alloc];
  int v8 = (void *)[v7 initWithCString:RTAnalyticsEventBluePoiMetrics encoding:1];
  v9 = [v6 stringWithFormat:@"com.apple.%@", v8];
  int IsEventUsed = AnalyticsIsEventUsed();

  v11 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    v13 = (void *)v12;
    int v14 = @"NO";
    if (v5) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v12;
    id v19 = v15;
    __int16 v18 = 2112;
    if (IsEventUsed) {
      int v14 = @"YES";
    }
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, optInApple, %@, sampled, %@", buf, 0x20u);
  }
  if ((v5 & IsEventUsed) == 1) {
    [(RTPointOfInterestMetricsManager *)self _registerForNotifications];
  }
}

- (void)_registerForNotifications
{
  v3 = [(RTPointOfInterestMetricsManager *)self navigationManager];
  id v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onNavigationNotification_ name:v4];

  int v5 = [(RTPointOfInterestMetricsManager *)self navigationManager];
  id v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onNavigationNotification_ name:v6];

  id v7 = [(RTPointOfInterestMetricsManager *)self learnedLocationStore];
  int v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onLearnedLocationStoreNotification_ name:v8];

  id v10 = [(RTPointOfInterestMetricsManager *)self locationManager];
  v9 = +[RTNotification notificationName];
  [v10 addObserver:self selector:sel_onLeechedLocationNotification_ name:v9];
}

- (void)shutdownWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTPointOfInterestMetricsManager_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTPointOfInterestMetricsManager_shutdownWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _shutdown];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_shutdown
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v7, 0x16u);
  }
  [(RTTimer *)self->_samplingTimer invalidate];
  samplingTimer = self->_samplingTimer;
  self->_samplingTimer = 0;

  [(RTPointOfInterestMetricsManager *)self _unRegisterForNotifications];
}

- (void)_unRegisterForNotifications
{
  v3 = [(RTPointOfInterestMetricsManager *)self navigationManager];
  id v4 = +[RTNotification notificationName];
  [v3 removeObserver:self fromNotification:v4];

  int v5 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
  id v6 = +[RTNotification notificationName];
  [v5 removeObserver:self fromNotification:v6];

  int v7 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
  id v8 = +[RTNotification notificationName];
  [v7 removeObserver:self fromNotification:v8];

  __int16 v9 = [(RTPointOfInterestMetricsManager *)self visitManager];
  id v10 = +[RTNotification notificationName];
  [v9 removeObserver:self fromNotification:v10];

  id v12 = [(RTPointOfInterestMetricsManager *)self locationManager];
  uint64_t v11 = +[RTNotification notificationName];
  [v12 removeObserver:self fromNotification:v11];
}

- (void)setSamplingPointOfInterest:(BOOL)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (self->_samplingPointOfInterest != a3)
  {
    BOOL v3 = a3;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      id v8 = (void *)v7;
      __int16 v9 = @"YES";
      if (self->_samplingPointOfInterest) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v7;
      id v44 = v10;
      __int16 v43 = 2112;
      if (!v3) {
        __int16 v9 = @"NO";
      }
      __int16 v45 = 2112;
      id v46 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, samplingPointOfInterest transitioned from, %@, to, %@", buf, 0x20u);
    }
    self->_samplingPointOfInterest = v3;
    if (v3)
    {
      [(RTPointOfInterestMetricsManager *)self setSettledState:0];
      uint64_t v11 = [(RTPointOfInterestMetricsManager *)self pointOfInterestSampler];
      id v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v11 startSamplingPointOfInterestFromRequester:v13 samplingInterval:30.0];

      int v14 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
      id v15 = +[RTNotification notificationName];
      [v14 addObserver:self selector:sel_onSettledNotification_ name:v15];

      __int16 v16 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
      uint64_t v17 = +[RTNotification notificationName];
      [v16 addObserver:self selector:sel_onUnsettledNotification_ name:v17];

      __int16 v18 = [(RTPointOfInterestMetricsManager *)self visitManager];
      id v19 = +[RTNotification notificationName];
      [v18 addObserver:self selector:sel_onVisitManagerVisitIncidentNotification_ name:v19];

      __int16 v20 = [(RTPointOfInterestMetricsManager *)self timerManager];
      id v21 = NSString;
      uint64_t v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      id v24 = [v21 stringWithFormat:@"%@.samplingTimer", v23];
      id v25 = [(RTNotifier *)self queue];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __62__RTPointOfInterestMetricsManager_setSamplingPointOfInterest___block_invoke;
      v40[3] = &unk_1E6B91248;
      v40[4] = self;
      v40[5] = a2;
      v26 = [v20 timerWithIdentifier:v24 queue:v25 handler:v40];
      [(RTPointOfInterestMetricsManager *)self setSamplingTimer:v26];

      v27 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v28;
        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, samplingTimer start", buf, 0xCu);
      }
      v29 = [(RTPointOfInterestMetricsManager *)self samplingTimer];
      [v29 fireAfterDelay:7200.0 interval:INFINITY];

      v30 = [(RTPointOfInterestMetricsManager *)self samplingTimer];
      [v30 resume];
    }
    else
    {
      uint64_t v31 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
      v32 = +[RTNotification notificationName];
      [v31 removeObserver:self fromNotification:v32];

      v33 = [(RTPointOfInterestMetricsManager *)self scenarioTriggerManager];
      v34 = +[RTNotification notificationName];
      [v33 removeObserver:self fromNotification:v34];

      v35 = [(RTPointOfInterestMetricsManager *)self visitManager];
      v36 = +[RTNotification notificationName];
      [v35 removeObserver:self fromNotification:v36];

      v37 = [(RTPointOfInterestMetricsManager *)self pointOfInterestSampler];
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      [v37 stopSamplingPointOfInterestFromRequester:v39];
    }
  }
}

uint64_t __62__RTPointOfInterestMetricsManager_setSamplingPointOfInterest___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, samplingTimer expiry", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) samplingTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setSamplingTimer:0];
  return [*(id *)(a1 + 32) setSamplingPointOfInterest:0];
}

- (BOOL)_shouldCollectQueriesForMapItem:(id)a3
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  if ([v55 validMUID])
  {
    os_log_t log = [MEMORY[0x1E4F1C9C8] now];
    v50 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:log sinceDate:-2592000.0];
    id v4 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
    v51 = [v4 objectForKey:@"PointOfInterestMetricsManagerQueryCollectionDate"];

    if (v51 && [v51 isAfterDate:v50])
    {
      osos_log_t log = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        int v5 = NSStringFromSelector(a2);
        int v6 = [v51 stringFromDate];
        uint64_t v7 = [log stringFromDate];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        __int16 v70 = 2112;
        id v71 = v6;
        __int16 v72 = 2112;
        v73 = v7;
        _os_log_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_INFO, "%@, skip collect queries, last query collection date, %@, current date, %@", buf, 0x20u);
      }
      BOOL v8 = 0;
    }
    else
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      uint64_t v65 = 0;
      v66 = (int *)&v65;
      uint64_t v67 = 0x2020000000;
      int v68 = 0;
      uint64_t v11 = [(RTPointOfInterestMetricsManager *)self batteryManager];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __67__RTPointOfInterestMetricsManager__shouldCollectQueriesForMapItem___block_invoke;
      v62[3] = &unk_1E6B92C10;
      v64 = &v65;
      id v12 = v10;
      v63 = v12;
      [v11 fetchCurrentBatteryPercent:v62];

      dsema = v12;
      v13 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v14)) {
        goto LABEL_15;
      }
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      __int16 v18 = objc_opt_new();
      id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
      __int16 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 filteredArrayUsingPredicate:v19];
      uint64_t v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      id v24 = (void *)MEMORY[0x1E4F28C58];
      v77[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v77 count:1];
      v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v27 = v26;

        char v28 = 0;
      }
      else
      {
LABEL_15:
        id v27 = 0;
        char v28 = 1;
      }

      id v29 = v27;
      v30 = v29;
      if (v28) {
        osos_log_t log = 0;
      }
      else {
        osos_log_t log = v29;
      }
      uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = NSStringFromSelector(a2);
        v33 = (void *)v66[6];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v70 = 2048;
        id v71 = v33;
        __int16 v72 = 2112;
        v73 = oslog;
        _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%@, battery percent, %lu, error, %@", buf, 0x20u);
      }
      if (oslog || v66[6] <= 19)
      {
        v34 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v35;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, skip collect queries due to low battery", buf, 0xCu);
        }
LABEL_39:
        BOOL v8 = 0;
      }
      else
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v34 = [(RTPointOfInterestMetricsManager *)self locationDenyList];
        uint64_t v36 = [v34 countByEnumeratingWithState:&v58 objects:v76 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v59;
          while (2)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v59 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = *(NSObject **)(*((void *)&v58 + 1) + 8 * i);
              v40 = [(RTPointOfInterestMetricsManager *)self distanceCalculator];
              v41 = [v55 location];
              id v57 = 0;
              [v40 distanceFromLocation:v41 toLocation:v39 error:&v57];
              double v43 = v42;
              id v44 = v57;

              if (!v44 && v43 < 1000.0)
              {
                id v46 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(a2);
                  id v47 = (id)objc_claimAutoreleasedReturnValue();
                  id v48 = [v55 location];
                  *(_DWORD *)buf = 138413058;
                  *(void *)&uint8_t buf[4] = v47;
                  __int16 v70 = 2112;
                  id v71 = v48;
                  __int16 v72 = 2112;
                  v73 = v39;
                  __int16 v74 = 2048;
                  double v75 = v43;
                  _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "%@, skip collect queries, current location, %@, denied location, %@, distance, %.2f", buf, 0x2Au);
                }
                goto LABEL_39;
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v58 objects:v76 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }

        v34 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        BOOL v8 = 1;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          __int16 v45 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v45;
          __int16 v70 = 2112;
          id v71 = v55;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, should collect queries, YES, mapItem, %@", buf, 0x16u);

          BOOL v8 = 1;
        }
      }

      _Block_object_dispose(&v65, 8);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_INFO, "%@, skip collect queries due to invalid MUID", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

intptr_t __67__RTPointOfInterestMetricsManager__shouldCollectQueriesForMapItem___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setSettledState:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_settledState != a3)
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      BOOL v8 = +[RTScenarioTriggerManager settledStateName:self->_settledState];
      __int16 v9 = +[RTScenarioTriggerManager settledStateName:a3];
      BOOL v10 = [(RTPointOfInterestMetricsManager *)self samplingPointOfInterest];
      uint64_t v11 = @"NO";
      *(_DWORD *)double v17 = 138413058;
      *(void *)&v17[4] = v7;
      *(_WORD *)&v17[12] = 2112;
      if (v10) {
        uint64_t v11 = @"YES";
      }
      *(void *)&v17[14] = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, settled state transitioned from, %@, to, %@, samplingPointOfInterest, %@", v17, 0x2Au);
    }
    self->_unint64_t settledState = a3;
    if ([(RTPointOfInterestMetricsManager *)self samplingPointOfInterest])
    {
      unint64_t settledState = self->_settledState;
      v13 = [(RTPointOfInterestMetricsManager *)self pointOfInterestSampler];
      dispatch_time_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      double v16 = 300.0;
      if (settledState != 1) {
        double v16 = 30.0;
      }
      [v13 startSamplingPointOfInterestFromRequester:v15 samplingInterval:v16 *(_OWORD *)v17];
    }
  }
}

- (void)_updateLocationDenyList
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTPointOfInterestMetricsManager *)self locationDenyList];
  [v4 removeAllObjects];

  int v5 = objc_opt_new();
  int v6 = objc_opt_new();
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  BOOL v8 = [(RTPointOfInterestMetricsManager *)self learnedLocationStore];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke;
  v27[3] = &unk_1E6B911F8;
  SEL v30 = a2;
  id v9 = v5;
  id v28 = v9;
  BOOL v10 = v7;
  id v29 = v10;
  [v8 fetchLocationsOfInterestWithPlaceType:1 handler:v27];

  dispatch_group_enter(v10);
  uint64_t v11 = [(RTPointOfInterestMetricsManager *)self learnedLocationStore];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke_357;
  id v23 = &unk_1E6B911F8;
  SEL v26 = a2;
  id v12 = v6;
  id v24 = v12;
  v13 = v10;
  id v25 = v13;
  [v11 fetchLocationsOfInterestWithPlaceType:2 handler:&v20];

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_time_t v14 = [(RTPointOfInterestMetricsManager *)self locationDenyList];
  [v14 addObjectsFromArray:v9];

  id v15 = [(RTPointOfInterestMetricsManager *)self locationDenyList];
  [v15 addObjectsFromArray:v12];

  double v16 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = NSStringFromSelector(a2);
    __int16 v18 = [(RTPointOfInterestMetricsManager *)self locationDenyList];
    uint64_t v19 = [v18 count];
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    __int16 v33 = 2048;
    uint64_t v34 = v19;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, locationDenyList size, %lu", buf, 0x16u);
  }
}

void __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = [v5 count];
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, fetched home loi count, %lu, error, %@", buf, 0x20u);
  }
  if (!v6 && [v5 count])
  {
    id v24 = 0;
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          dispatch_time_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v15 = [v14 location:v24, v25];
          double v16 = [v15 location];

          if (v16)
          {
            double v17 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
              uint64_t v19 = [v14 location];
              uint64_t v20 = [v19 location];
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              __int16 v33 = 2112;
              uint64_t v34 = (uint64_t)v20;
              _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, add home loi location, %@", buf, 0x16u);
            }
            uint64_t v21 = *(void **)(a1 + 32);
            uint64_t v22 = [v14 location];
            id v23 = [v22 location];
            [v21 addObject:v23];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    id v6 = v24;
    id v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke_357(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = [v5 count];
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, fetched work loi count, %lu, error, %@", buf, 0x20u);
  }
  if (!v6 && [v5 count])
  {
    id v24 = 0;
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          dispatch_time_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v15 = [v14 location:v24, v25];
          double v16 = [v15 location];

          if (v16)
          {
            double v17 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
              uint64_t v19 = [v14 location];
              uint64_t v20 = [v19 location];
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              __int16 v33 = 2112;
              uint64_t v34 = (uint64_t)v20;
              _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, add work loi location, %@", buf, 0x16u);
            }
            uint64_t v21 = *(void **)(a1 + 32);
            uint64_t v22 = [v14 location];
            id v23 = [v22 location];
            [v21 addObject:v23];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    id v6 = v24;
    id v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)onSettledNotification:(id)a3
{
  id v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTPointOfInterestMetricsManager_onSettledNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __57__RTPointOfInterestMetricsManager_onSettledNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSettledState:2];
}

- (void)onUnsettledNotification:(id)a3
{
  id v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTPointOfInterestMetricsManager_onUnsettledNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __59__RTPointOfInterestMetricsManager_onUnsettledNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSettledState:1];
}

- (void)onNavigationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__RTPointOfInterestMetricsManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__RTPointOfInterestMetricsManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNavigationNotification:*(void *)(a1 + 40)];
}

- (void)_onNavigationNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = (const char *)v9;
      __int16 v22 = 2048;
      uint64_t v23 = (int)[v9 state];
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, received navigation notification, %@, state, %lu", buf, 0x20u);
    }
    if ([v9 state] == 6
      && ![(RTPointOfInterestMetricsManager *)self samplingPointOfInterest])
    {
      uint64_t v12 = [(RTPointOfInterestMetricsManager *)self navigationManager];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke;
      v17[3] = &unk_1E6B92C38;
      v17[4] = self;
      v17[5] = a2;
      [v12 fetchNavigationRouteSummaryWithHandler:v17];
    }
  }
  else
  {
    v13 = [v5 name];
    dispatch_time_t v14 = +[RTNotification notificationName];
    int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        id v19 = v16;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, received route summary, no op", buf, 0xCu);
      }
    }
    else
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v5;
        __int16 v20 = 2080;
        uint64_t v21 = "-[RTPointOfInterestMetricsManager _onNavigationNotification:]";
        __int16 v22 = 1024;
        LODWORD(v23) = 553;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
      }
    }
  }
}

void __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke_2;
  block[3] = &unk_1E6B91220;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) firstObject];
    id v3 = [v2 destinationMapItem];

    [*(id *)(a1 + 40) setNavigationDestination:v3];
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v14 = 138412546;
      int v15 = v5;
      __int16 v16 = 2112;
      double v17 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, navigation destination, %@", (uint8_t *)&v14, 0x16u);
    }
    if ([*(id *)(a1 + 40) _shouldCollectQueriesForMapItem:v3])
    {
      id v6 = [*(id *)(a1 + 40) defaultsManager];
      id v7 = [NSNumber numberWithUnsignedInteger:[v3 muid]];
      [v6 setObject:v7 forKey:@"PointOfInterestMetricsManagerTruthLabelIdentifier"];

      long long v8 = [*(id *)(a1 + 40) defaultsManager];
      id v9 = [MEMORY[0x1E4F1C9C8] now];
      [v8 setObject:v9 forKey:@"PointOfInterestMetricsManagerNavSessionEndDate"];

      uint64_t v10 = [*(id *)(a1 + 40) defaultsManager];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:[*(id *)(a1 + 40) currentSignalEnvironmentType]];
      [v10 setObject:v11 forKey:@"PointOfInterestMetricsManagerSignalEnvironment"];

      uint64_t v12 = [*(id *)(a1 + 40) defaultsManager];
      v13 = [MEMORY[0x1E4F1C9C8] now];
      [v12 setObject:v13 forKey:@"PointOfInterestMetricsManagerQueryCollectionDate"];

      [*(id *)(a1 + 40) setSamplingPointOfInterest:1];
    }
  }
}

- (void)onLearnedLocationStoreNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTPointOfInterestMetricsManager_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__RTPointOfInterestMetricsManager_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      uint64_t v12 = [v9 availability];
      v13 = @"YES";
      if (!v12) {
        v13 = @"NO";
      }
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      double v17 = (const char *)v13;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, learned store available, %@", (uint8_t *)&v14, 0x16u);
    }
    if ([v9 availability] == 2) {
      [(RTPointOfInterestMetricsManager *)self _updateLocationDenyList];
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v5;
      __int16 v16 = 2080;
      double v17 = "-[RTPointOfInterestMetricsManager _onLearnedLocationStoreNotification:]";
      __int16 v18 = 1024;
      int v19 = 578;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)_onVisitManagerVisitIncidentNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    uint64_t v10 = [v9 visitIncident];
    if ([v10 type] == 3)
    {
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v10;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, received visit exit, %@", buf, 0x16u);
      }
      v13 = [(RTPointOfInterestMetricsManager *)self distanceCalculator];
      int v14 = [(RTPointOfInterestMetricsManager *)self navigationDestination];
      id v15 = [v14 location];
      __int16 v16 = [v10 location];
      uint64_t v20 = 0;
      [v13 distanceFromLocation:v15 toLocation:v16 error:&v20];
      double v18 = v17;
      uint64_t v19 = v20;

      if (!v19 && v18 < 1000.0)
      {
        [(RTPointOfInterestMetricsManager *)self setSamplingPointOfInterest:0];
        [(RTPointOfInterestMetricsManager *)self setNavigationDestination:0];
      }
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v5;
      __int16 v23 = 2080;
      uint64_t v24 = "-[RTPointOfInterestMetricsManager _onVisitManagerVisitIncidentNotification:]";
      __int16 v25 = 1024;
      int v26 = 604;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)onVisitManagerVisitIncidentNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__RTPointOfInterestMetricsManager_onVisitManagerVisitIncidentNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __75__RTPointOfInterestMetricsManager_onVisitManagerVisitIncidentNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerVisitIncidentNotification:*(void *)(a1 + 40)];
}

- (id)collectMetricsWithError:(id *)a3
{
  v282[1] = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, collecting point of interest metrics", buf, 0xCu);
  }
  unint64_t v214 = [(RTPointOfInterestMetricsManager *)self getTruthPointOfInterestIdentifier];
  if (v214)
  {
    v213 = objc_opt_new();
    uint64_t v245 = 0;
    v246 = (id *)&v245;
    uint64_t v247 = 0x3032000000;
    v248 = __Block_byref_object_copy__23;
    v249 = __Block_byref_object_dispose__23;
    id v250 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v239 = 0;
    v240 = &v239;
    uint64_t v241 = 0x3032000000;
    v242 = __Block_byref_object_copy__23;
    v243 = __Block_byref_object_dispose__23;
    id v244 = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F5CE48]);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    v210 = (void *)[v7 initWithUseBackgroundTraits:1 analyticsIdentifier:v9 clientIdentifier:@"com.apple.CoreRoutine.PoiMetrics"];

    uint64_t v10 = [(RTPointOfInterestMetricsManager *)self mapServiceManager];
    v235[0] = MEMORY[0x1E4F143A8];
    v235[1] = 3221225472;
    v235[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke;
    v235[3] = &unk_1E6B92C60;
    v237 = &v239;
    v238 = &v245;
    uint64_t v11 = v6;
    v236 = v11;
    [v10 fetchPointOfInterestAttributesWithIdentifier:v214 options:v210 handler:v235];

    uint64_t v12 = v11;
    v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_9;
    }
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    double v18 = objc_opt_new();
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
    uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    id v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v271 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v271 count:1];
    int v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;

      char v28 = 0;
    }
    else
    {
LABEL_9:
      id v27 = 0;
      char v28 = 1;
    }

    id v208 = v27;
    if ((v28 & 1) == 0) {
      objc_storeStrong(v246 + 5, v27);
    }
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      SEL v30 = NSStringFromSelector(a2);
      uint64_t v31 = v240[5];
      v32 = (uint64_t (*)(uint64_t, uint64_t))v246[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      v278 = v32;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, fetched POI attributes, %@, error, %@", buf, 0x20u);
    }
    id v33 = v246[5];
    if (v33)
    {
      if (a3) {
        *a3 = v33;
      }
      uint64_t v34 = MEMORY[0x1E4F1CC08];
    }
    else
    {
      [v213 setObject:&unk_1F344FF88 forKeyedSubscript:@"poiCategory"];
      v38 = [(id)v240[5] category];
      v39 = [&unk_1F3453FA8 objectForKey:v38];

      if (v39)
      {
        v40 = [(id)v240[5] category];
        v41 = [&unk_1F3453FD0 objectForKey:v40];
        [v213 setObject:v41 forKeyedSubscript:@"poiCategory"];
      }
      double v42 = NSNumber;
      if ([(id)v240[5] applePaySupport]) {
        uint64_t v43 = 1;
      }
      else {
        uint64_t v43 = 2;
      }
      id v44 = [v42 numberWithInt:v43];
      [v213 setObject:v44 forKeyedSubscript:@"applePaySupport"];

      __int16 v45 = [NSNumber numberWithDouble:ceil((double)(unint64_t)[[v240[5] nearbyPoiCount] / 10.0]);
      [v213 setObject:v45 forKeyedSubscript:@"nearbyPoiCountBucketed"];

      id v46 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
      uint64_t v47 = [v46 objectForKey:@"PointOfInterestMetricsManagerSignalEnvironment"];
      id v48 = (void *)v47;
      if (v47) {
        id v49 = (void *)v47;
      }
      else {
        id v49 = &unk_1F344FFA0;
      }
      [v213 setObject:v49 forKeyedSubscript:@"signalEnvironment"];

      v50 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        id v132 = (id)objc_claimAutoreleasedReturnValue();
        v133 = [v213 objectForKeyedSubscript:@"poiCategory"];
        v134 = [v213 objectForKeyedSubscript:@"applePaySupport"];
        v135 = [v213 objectForKeyedSubscript:@"nearbyPoiCountBucketed"];
        v136 = [v213 objectForKeyedSubscript:@"signalEnvironment"];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v132;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v214;
        *(_WORD *)&buf[22] = 2112;
        v278 = v133;
        *(_WORD *)v279 = 2112;
        *(void *)&v279[2] = v134;
        *(_WORD *)&v279[10] = 2112;
        *(void *)&v279[12] = v135;
        __int16 v280 = 2112;
        v281 = v136;
        _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "%@, muid, %lu, poi category, %@, applePay support, %@, bucketed nearby point count, %@, signal enviroment, %@", buf, 0x3Eu);
      }
      v51 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
      v207 = [v51 objectForKey:@"PointOfInterestMetricsManagerNavSessionEndDate"];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v278 = __Block_byref_object_copy__23;
      *(void *)v279 = __Block_byref_object_dispose__23;
      *(void *)&v279[8] = 0;
      uint64_t v271 = 0;
      v272 = (id *)&v271;
      uint64_t v273 = 0x3032000000;
      v274 = __Block_byref_object_copy__23;
      v275 = __Block_byref_object_dispose__23;
      id v276 = 0;
      dispatch_semaphore_t v52 = dispatch_semaphore_create(0);
      id v53 = [(RTPointOfInterestMetricsManager *)self learnedLocationStore];
      v204 = [v53 predicateForObjectsFromCurrentDevice];

      v206 = [v207 dateByAddingTimeInterval:-300.0];
      v205 = [MEMORY[0x1E4F1C9C8] date];
      v203 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v206 endDate:v205];
      id v54 = [(RTPointOfInterestMetricsManager *)self learnedLocationStore];
      v231[0] = MEMORY[0x1E4F143A8];
      v231[1] = 3221225472;
      v231[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_387;
      v231[3] = &unk_1E6B905F0;
      v233 = buf;
      v234 = &v271;
      id v55 = v52;
      v232 = v55;
      [v54 fetchVisitsWithPredicate:v204 ascending:1 dateInterval:v203 limit:&unk_1F344FFB8 handler:v231];

      dsema = v55;
      v56 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v57 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v57)) {
        goto LABEL_36;
      }
      long long v58 = [MEMORY[0x1E4F1C9C8] now];
      [v58 timeIntervalSinceDate:v56];
      double v60 = v59;
      long long v61 = objc_opt_new();
      v62 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
      v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      v64 = [v63 filteredArrayUsingPredicate:v62];
      uint64_t v65 = [v64 firstObject];

      [v61 submitToCoreAnalytics:v65 type:1 duration:v60];
      v66 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v268 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v268, 2u);
      }

      uint64_t v67 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v265 = *MEMORY[0x1E4F28568];
      *(void *)v268 = @"semaphore wait timeout";
      int v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v268 forKeys:v265 count:1];
      v69 = [v67 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v68];

      if (v69)
      {
        id v70 = v69;

        char v71 = 0;
      }
      else
      {
LABEL_36:
        id v70 = 0;
        char v71 = 1;
      }

      id v202 = v70;
      if ((v71 & 1) == 0) {
        objc_storeStrong(v272 + 5, v70);
      }
      __int16 v72 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = NSStringFromSelector(a2);
        uint64_t v74 = *(void *)(*(void *)&buf[8] + 40);
        id v75 = v272[5];
        *(_DWORD *)v268 = 138413058;
        *(void *)&v268[4] = v73;
        *(_WORD *)&v268[12] = 2112;
        *(void *)&v268[14] = v74;
        *(_WORD *)&v268[22] = 2112;
        v269 = (uint64_t (*)(uint64_t, uint64_t))v207;
        LOWORD(v270) = 2112;
        *(void *)((char *)&v270 + 2) = v75;
        _os_log_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_INFO, "%@, fetched learned visit, %@, nav session end date, %@, error, %@", v268, 0x2Au);
      }
      id v76 = v272[5];
      if (v76 || !*(void *)(*(void *)&buf[8] + 40))
      {
        if (a3) {
          *a3 = v76;
        }
        uint64_t v34 = MEMORY[0x1E4F1CC08];
      }
      else
      {
        v77 = NSNumber;
        [*(id *)(*(void *)&buf[8] + 40) duration];
        v79 = [v77 numberWithDouble:round(v78)];
        [v213 setObject:v79 forKeyedSubscript:@"visitDuration"];

        v80 = NSNumber;
        v81 = [*(id *)(*(void *)&buf[8] + 40) entryDate];
        [v207 timeIntervalSinceDate:v81];
        v83 = [v80 numberWithDouble:round(v82)];
        [v213 setObject:v83 forKeyedSubscript:@"navigationTimeOffset"];

        v84 = [MEMORY[0x1E4F1C9C8] now];
        if ([v207 isBeforeDate:v84])
        {
          id v85 = [v207 dateByAddingTimeInterval:-300.0];
        }
        else
        {
          id v85 = v84;
        }
        v86 = v85;
        id v87 = v84;
        v201 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v86 endDate:v87];
        id v88 = objc_alloc(MEMORY[0x1E4F5CF58]);
        v89 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
        v90 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F344FFD0];
        v200 = (void *)[v88 initWithAscending:1 confidence:v89 dateInterval:v201 labelVisit:0 limit:0 sources:v90];

        *(void *)v268 = 0;
        *(void *)&v268[8] = v268;
        *(void *)&v268[16] = 0x3032000000;
        v269 = __Block_byref_object_copy__23;
        *(void *)&long long v270 = __Block_byref_object_dispose__23;
        *((void *)&v270 + 1) = 0;
        id v91 = v272[5];
        v272[5] = 0;

        dispatch_semaphore_t v92 = dispatch_semaphore_create(0);
        v93 = [(RTPointOfInterestMetricsManager *)self visitManager];
        v225[0] = MEMORY[0x1E4F143A8];
        v225[1] = 3221225472;
        v225[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_393;
        v225[3] = &unk_1E6B92C88;
        v229 = &v271;
        id v198 = v86;
        id v226 = v198;
        id v199 = v87;
        id v227 = v199;
        v230 = v268;
        v94 = v92;
        v228 = v94;
        [v93 fetchStoredVisitsWithOptions:v200 handler:v225];

        dsema = v94;
        v95 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v96 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v96)) {
          goto LABEL_54;
        }
        v97 = [MEMORY[0x1E4F1C9C8] now];
        [v97 timeIntervalSinceDate:v95];
        double v99 = v98;
        v100 = objc_opt_new();
        v101 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
        v102 = [MEMORY[0x1E4F29060] callStackSymbols];
        v103 = [v102 filteredArrayUsingPredicate:v101];
        v104 = [v103 firstObject];

        [v100 submitToCoreAnalytics:v104 type:1 duration:v99];
        v105 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v265 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v105, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v265, 2u);
        }

        v106 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v259 = *MEMORY[0x1E4F28568];
        *(void *)v265 = @"semaphore wait timeout";
        v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v265 forKeys:&v259 count:1];
        v108 = [v106 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v107];

        if (v108)
        {
          id v109 = v108;

          char v110 = 0;
        }
        else
        {
LABEL_54:
          id v109 = 0;
          char v110 = 1;
        }

        id v202 = v109;
        if ((v110 & 1) == 0) {
          objc_storeStrong(v272 + 5, v109);
        }
        v111 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          v112 = NSStringFromSelector(a2);
          uint64_t v113 = *(void *)(*(void *)&v268[8] + 40);
          id v114 = v272[5];
          *(_DWORD *)v265 = 138413058;
          *(void *)&v265[4] = v112;
          *(_WORD *)&v265[12] = 2112;
          *(void *)&v265[14] = v113;
          *(_WORD *)&v265[22] = 2112;
          v266 = (uint64_t (*)(uint64_t, uint64_t))v207;
          LOWORD(v267) = 2112;
          *(void *)((char *)&v267 + 2) = v114;
          _os_log_impl(&dword_1D9BFA000, v111, OS_LOG_TYPE_INFO, "%@, fetched realtime visit, %@, nav session end date, %@, error, %@", v265, 0x2Au);
        }
        id v115 = v272[5];
        if (v115 || !*(void *)(*(void *)&v268[8] + 40))
        {
          if (a3) {
            *a3 = v115;
          }
          uint64_t v34 = MEMORY[0x1E4F1CC08];
        }
        else
        {
          v116 = NSNumber;
          v117 = [*(id *)(*(void *)&v268[8] + 40) entry];
          v118 = [*(id *)(*(void *)&buf[8] + 40) entryDate];
          [v117 timeIntervalSinceDate:v118];
          v120 = [v116 numberWithDouble:round(v119)];
          [v213 setObject:v120 forKeyedSubscript:@"realtimeVisitEntryTimeOffset"];

          v121 = NSNumber;
          v122 = [*(id *)(*(void *)&v268[8] + 40) exit];
          v123 = [*(id *)(*(void *)&buf[8] + 40) entryDate];
          [v122 timeIntervalSinceDate:v123];
          v125 = [v121 numberWithDouble:round(v124)];
          [v213 setObject:v125 forKeyedSubscript:@"realtimeVisitExitTimeOffset"];

          *(void *)v265 = 0;
          *(void *)&v265[8] = v265;
          *(void *)&v265[16] = 0x3032000000;
          v266 = __Block_byref_object_copy__23;
          *(void *)&long long v267 = __Block_byref_object_dispose__23;
          *((void *)&v267 + 1) = 0;
          uint64_t v259 = 0;
          v260 = (id *)&v259;
          uint64_t v261 = 0x3032000000;
          v262 = __Block_byref_object_copy__23;
          v263 = __Block_byref_object_dispose__23;
          id v264 = 0;
          dispatch_semaphore_t v193 = dispatch_semaphore_create(0);
          id v196 = v207;
          v126 = [*(id *)(*(void *)&buf[8] + 40) exitDate];
          v197 = [v126 dateByAddingTimeInterval:300.0];

          if ([v196 isAfterDate:v197])
          {
            id v127 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v257 = *MEMORY[0x1E4F28568];
            v128 = [NSString stringWithFormat:@"placeInferenceQueryStartDate cannot be after placeInferenceQueryEndDate"];
            v258 = v128;
            v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
            v130 = [v127 initWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v129];

            if (a3)
            {
              dispatch_semaphore_t v131 = v130;
              *a3 = v131;
              uint64_t v34 = MEMORY[0x1E4F1CC08];
            }
            else
            {
              uint64_t v34 = MEMORY[0x1E4F1CC08];
              dispatch_semaphore_t v131 = v130;
            }
          }
          else
          {
            v192 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v196 endDate:v197];
            v137 = [(RTPointOfInterestMetricsManager *)self placeInferenceQueryStore];
            v221[0] = MEMORY[0x1E4F143A8];
            v221[1] = 3221225472;
            v221[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_399;
            v221[3] = &unk_1E6B905F0;
            v223 = v265;
            v224 = &v259;
            v138 = v193;
            v222 = v138;
            [v137 fetchPlaceInferenceQueriesWithDateInterval:v192 ascending:1 handler:v221];

            v194 = v138;
            v139 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v140 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v194, v140)) {
              goto LABEL_72;
            }
            v141 = [MEMORY[0x1E4F1C9C8] now];
            [v141 timeIntervalSinceDate:v139];
            double v143 = v142;
            v144 = objc_opt_new();
            v145 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
            v146 = [MEMORY[0x1E4F29060] callStackSymbols];
            v147 = [v146 filteredArrayUsingPredicate:v145];
            v148 = [v147 firstObject];

            [v144 submitToCoreAnalytics:v148 type:1 duration:v143];
            v149 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v252 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v149, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v252, 2u);
            }

            v150 = (void *)MEMORY[0x1E4F28C58];
            v282[0] = *MEMORY[0x1E4F28568];
            *(void *)v252 = @"semaphore wait timeout";
            v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v252 forKeys:v282 count:1];
            v152 = [v150 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v151];

            if (v152)
            {
              id v153 = v152;

              char v154 = 0;
            }
            else
            {
LABEL_72:
              id v153 = 0;
              char v154 = 1;
            }

            dispatch_semaphore_t v195 = (dispatch_semaphore_t)v153;
            if ((v154 & 1) == 0) {
              objc_storeStrong(v260 + 5, v153);
            }
            v155 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
            if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v156 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v157 = [*(id *)(*(void *)&v265[8] + 40) count];
              id v158 = v260[5];
              *(_DWORD *)v252 = 138412802;
              *(void *)&v252[4] = v156;
              __int16 v253 = 2048;
              uint64_t v254 = v157;
              __int16 v255 = 2112;
              v256 = v158;
              _os_log_impl(&dword_1D9BFA000, v155, OS_LOG_TYPE_INFO, "%@, fetched place inference queries, %lu, error, %@", v252, 0x20u);
            }
            id v159 = v260[5];
            if (v159)
            {
              if (a3) {
                *a3 = v159;
              }
              uint64_t v34 = MEMORY[0x1E4F1CC08];
            }
            else
            {
              v160 = [NSNumber numberWithDouble:-1.0];
              [v213 setObject:v160 forKeyedSubscript:@"distanceBetweenQueryAndRealtimeVisit"];

              v161 = [NSNumber numberWithDouble:-1.0];
              [v213 setObject:v161 forKeyedSubscript:@"distanceBetweenQueryAndLearnedVisit"];

              if ([*(id *)(*(void *)&v265[8] + 40) count])
              {
                v162 = [*(id *)(*(void *)&v265[8] + 40) firstObject];
                v163 = [(RTPointOfInterestMetricsManager *)self distanceCalculator];
                v164 = [v162 placeInference];
                v165 = [v164 referenceLocation];
                v166 = [*(id *)(*(void *)&v268[8] + 40) location];
                id v220 = 0;
                [v163 distanceFromLocation:v165 toLocation:v166 error:&v220];
                double v168 = v167;
                id v169 = v220;

                if (!v169)
                {
                  v170 = [NSNumber numberWithDouble:round(v168)];
                  [v213 setObject:v170 forKeyedSubscript:@"distanceBetweenQueryAndRealtimeVisit"];
                }
                v171 = [(RTPointOfInterestMetricsManager *)self distanceCalculator];
                v172 = [v162 placeInference];
                v173 = [v172 referenceLocation];
                v174 = [*(id *)(*(void *)&buf[8] + 40) location];
                v175 = [v174 location];
                id v219 = 0;
                [v171 distanceFromLocation:v173 toLocation:v175 error:&v219];
                double v177 = v176;
                id v178 = v219;

                if (!v178)
                {
                  v179 = [NSNumber numberWithDouble:round(v177)];
                  [v213 setObject:v179 forKeyedSubscript:@"distanceBetweenQueryAndLearnedVisit"];
                }
              }
              uint64_t v180 = *(void *)(*(void *)&v265[8] + 40);
              v181 = [*(id *)(*(void *)&buf[8] + 40) entryDate];
              v182 = [(RTPointOfInterestMetricsManager *)self processQueries:v180 visitEntryDate:v181 poiIdentifier:v214];

              long long v217 = 0u;
              long long v218 = 0u;
              long long v215 = 0u;
              long long v216 = 0u;
              id v183 = v182;
              uint64_t v184 = [v183 countByEnumeratingWithState:&v215 objects:v251 count:16];
              if (v184)
              {
                uint64_t v185 = *(void *)v216;
                do
                {
                  for (uint64_t i = 0; i != v184; ++i)
                  {
                    if (*(void *)v216 != v185) {
                      objc_enumerationMutation(v183);
                    }
                    uint64_t v187 = *(void *)(*((void *)&v215 + 1) + 8 * i);
                    v188 = [v183 objectForKeyedSubscript:v187];
                    v189 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
                    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
                    {
                      v190 = NSStringFromSelector(a2);
                      *(_DWORD *)v252 = 138412802;
                      *(void *)&v252[4] = v190;
                      __int16 v253 = 2112;
                      uint64_t v254 = v187;
                      __int16 v255 = 2112;
                      v256 = v188;
                      _os_log_debug_impl(&dword_1D9BFA000, v189, OS_LOG_TYPE_DEBUG, "%@, Key: %@, Value: %@", v252, 0x20u);
                    }
                  }
                  uint64_t v184 = [v183 countByEnumeratingWithState:&v215 objects:v251 count:16];
                }
                while (v184);
              }

              [v213 addEntriesFromDictionary:v183];
              uint64_t v34 = v213;
            }
            dispatch_semaphore_t v131 = v195;
          }

          _Block_object_dispose(&v259, 8);
          _Block_object_dispose(v265, 8);
        }
        _Block_object_dispose(v268, 8);
      }
      _Block_object_dispose(&v271, 8);

      _Block_object_dispose(buf, 8);
    }

    _Block_object_dispose(&v239, 8);
    _Block_object_dispose(&v245, 8);

    id v36 = v213;
  }
  else
  {
    __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    id v36 = v35;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "%@, invalid truth POI identifier, skip metrics collection", buf, 0xCu);

      uint64_t v34 = MEMORY[0x1E4F1CC08];
      id v36 = v35;
    }
    else
    {
      uint64_t v34 = MEMORY[0x1E4F1CC08];
    }
  }

  return v34;
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_387(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_393(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 exit];
        if (v12)
        {
          v13 = (void *)v12;
          dispatch_time_t v14 = [v11 exit];
          if ([v14 isAfterDate:*(void *)(a1 + 32)])
          {
            id v15 = [v11 exit];
            int v16 = [v15 isBeforeDate:*(void *)(a1 + 40)];

            if (v16)
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v11);
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
LABEL_13:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_399(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = -[RTPointOfInterestMetricsManager collectMetricsWithError:](self, "collectMetricsWithError:");
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v6 count];
    id v10 = *a3;
    *(_DWORD *)buf = 138412802;
    long long v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, metric count, %lu, error, %@", buf, 0x20u);
  }
  if (*a3 || ![v6 count])
  {
    BOOL v11 = 0;
  }
  else
  {
    id v12 = [NSString alloc];
    BOOL v11 = 1;
    v13 = (void *)[v12 initWithCString:RTAnalyticsEventBluePoiMetrics encoding:1];
    log_analytics_submission(v13, v6);
    dispatch_time_t v14 = [NSString stringWithFormat:@"com.apple.%@", v13];
    AnalyticsSendEvent();

    id v15 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
    [v15 setObject:&unk_1F344FF88 forKey:@"PointOfInterestMetricsManagerTruthLabelIdentifier"];

    int v16 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
    [v16 setObject:0 forKey:@"PointOfInterestMetricsManagerNavSessionEndDate"];

    id v17 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
    [v17 setObject:0 forKey:@"PointOfInterestMetricsManagerSignalEnvironment"];
  }
  return v11;
}

- (id)processQueries:(id)a3 visitEntryDate:(id)a4 poiIdentifier:(unint64_t)a5
{
  uint64_t v312 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v250 = a4;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v305 = v8;
    __int16 v306 = 2048;
    uint64_t v307 = [v6 count];
    __int16 v308 = 2112;
    unint64_t v309 = (unint64_t)v250;
    __int16 v310 = 2048;
    unint64_t v311 = a5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, query count, %lu, visit entry date, %@, poi muid, %lu", buf, 0x2Au);
  }
  uint64_t v9 = objc_opt_new();
  __int16 v253 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v10 = objc_opt_new();
  v246 = v6;
  if ([v6 count])
  {
    char v11 = 0;
    unint64_t v12 = 1;
    do
    {
      if ((v11 & 1) == 0)
      {
        v13 = [v6 objectAtIndexedSubscript:v12 - 1];
        dispatch_time_t v14 = [v13 placeInference];
        id v15 = [v14 mapItem];

        if (!v15)
        {
          __int16 v23 = [v6 objectAtIndexedSubscript:v12 - 1];
          [v10 addObject:v23];
          goto LABEL_13;
        }
        char v11 = 1;
      }
      int v16 = [v6 objectAtIndexedSubscript:v12 - 1];
      [v253 addObject:v16];

      if ((v11 & 1) == 0) {
        continue;
      }
      if (v12 - 1 != [v6 count] - 1)
      {
        id v17 = [v6 objectAtIndexedSubscript:v12];
        long long v18 = [v17 date];
        long long v19 = [v6 objectAtIndexedSubscript:v12 - 1];
        long long v20 = [v19 date];
        [v18 timeIntervalSinceDate:v20];
        double v22 = v21;

        id v6 = v246;
        if (v22 <= 1.0) {
          continue;
        }
      }
      __int16 v23 = v253;
      [v9 addObject:v253];
      __int16 v253 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
LABEL_13:
    }
    while (v12++ < [v6 count]);
  }
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v26 = NSStringFromSelector(a2);
    uint64_t v27 = [v9 count];
    *(_DWORD *)buf = 138412546;
    v305 = v26;
    __int16 v306 = 2048;
    uint64_t v307 = v27;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, query group count, %lu", buf, 0x16u);
  }
  v299[0] = MEMORY[0x1E4F143A8];
  v299[1] = 3221225472;
  v299[2] = __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke;
  v299[3] = &__block_descriptor_40_e24_v32__0__NSArray_8Q16_B24l;
  v299[4] = a2;
  [v9 enumerateObjectsUsingBlock:v299];
  char v28 = objc_opt_new();
  long long v29 = [NSNumber numberWithUnsignedInteger:[v9 count]];
  [v28 setObject:v29 forKeyedSubscript:@"queryCount"];

  SEL v30 = [NSNumber numberWithUnsignedInteger:objc_msgSend(v10, "count") + objc_msgSend(v9, "count")];
  [v28 setObject:v30 forKeyedSubscript:@"queryTotalCount"];

  uint64_t v31 = [NSString stringWithFormat:@"%lu", a5];
  v265 = v28;
  [v28 setObject:v31 forKeyedSubscript:@"muid"];

  long long v297 = 0u;
  long long v298 = 0u;
  long long v295 = 0u;
  long long v296 = 0u;
  obuint64_t j = v10;
  uint64_t v32 = [obj countByEnumeratingWithState:&v295 objects:v303 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v296;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v296 != v36) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v295 + 1) + 8 * i);
        if ([v38 errorCode] != -1)
        {
          if ([v38 errorCode] == 7) {
            ++v34;
          }
          ++v35;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v295 objects:v303 count:16];
    }
    while (v33);
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }

  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  id v39 = v9;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v291 objects:v302 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v292;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v292 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = *(void **)(*((void *)&v291 + 1) + 8 * j);
        if ([v44 count])
        {
          __int16 v45 = [v44 firstObject];
          uint64_t v46 = [v45 errorCode];

          if (v46 != -1)
          {
            uint64_t v47 = [v44 firstObject];
            uint64_t v48 = [v47 errorCode];

            if (v48 == 7) {
              ++v34;
            }
            ++v35;
          }
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v291 objects:v302 count:16];
    }
    while (v41);
  }

  unint64_t v49 = 0x1E4F28000uLL;
  v50 = [NSNumber numberWithUnsignedInteger:v35];
  [v265 setObject:v50 forKeyedSubscript:@"queryErrorCount"];

  v51 = [NSNumber numberWithUnsignedInteger:v34];
  [v265 setObject:v51 forKeyedSubscript:@"emptyWiFiScanCount"];

  if (![v39 count])
  {
    v289[0] = MEMORY[0x1E4F143A8];
    v289[1] = 3221225472;
    v289[2] = __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke_404;
    v289[3] = &unk_1E6B92CD0;
    id v290 = v39;
    [obj enumerateObjectsUsingBlock:v289];
  }
  uint64_t v259 = objc_opt_new();
  v258 = objc_opt_new();
  v256 = objc_opt_new();
  unint64_t v52 = [v39 count];
  uint64_t v53 = 10;
  if (v52 < 0xA) {
    uint64_t v53 = v52;
  }
  id v276 = v39;
  if (v53)
  {
    unint64_t v54 = 0;
    uint64_t v255 = 1;
    while (1)
    {
      id v55 = [v39 objectAtIndexedSubscript:v54];
      uint64_t v56 = [v55 count];

      if (v56)
      {
        dispatch_time_t v57 = [v39 objectAtIndexedSubscript:v54];
        long long v58 = [v57 firstObject];
        double v59 = [v58 date];
        [v59 timeIntervalSinceDate:v250];
        uint64_t v277 = v54;
        unint64_t v61 = llround(v60);

        uint64_t v62 = [NSString stringWithFormat:@"%@%lu%@", @"visitEntryQuery", v54 + 1, @"TimeOffset"];
        unint64_t v63 = v61;
        uint64_t v64 = v54;
        uint64_t v65 = [*(id *)(v49 + 3792) numberWithInteger:v63];
        uint64_t v254 = (void *)v62;
        [v265 setObject:v65 forKeyedSubscript:v62];

        unint64_t v261 = v54 + 1;
        uint64_t v66 = [NSString stringWithFormat:@"%@%lu%@", @"visitEntryQuery", v54 + 1, @"ErrorCode"];
        uint64_t v67 = *(void **)(v49 + 3792);
        int v68 = [v39 objectAtIndexedSubscript:v54];
        v69 = [v68 firstObject];
        id v70 = [v67 numberWithInteger:[v69 errorCode]];
        v251 = (void *)v66;
        [v265 setObject:v70 forKeyedSubscript:v66];

        char v71 = [v39 objectAtIndexedSubscript:v54];
        unint64_t v72 = [v71 count];

        uint64_t v73 = 3;
        if (v72 < 3) {
          uint64_t v73 = v72;
        }
        if (v73)
        {
          unint64_t v74 = 0;
          while (1)
          {
            id v75 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              id v76 = NSStringFromSelector(a2);
              v77 = [v39 objectAtIndexedSubscript:v64];
              double v78 = [v77 objectAtIndexedSubscript:v74];
              *(_DWORD *)buf = 138413058;
              v305 = v76;
              __int16 v306 = 2048;
              uint64_t v307 = v277;
              __int16 v308 = 2048;
              unint64_t v309 = v74;
              __int16 v310 = 2112;
              unint64_t v311 = (unint64_t)v78;
              _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "%@, group idx, %lu, result idx, %lu, query, %@", buf, 0x2Au);

              uint64_t v64 = v277;
            }

            v79 = [v39 objectAtIndexedSubscript:v64];
            v80 = [v79 objectAtIndexedSubscript:v74];
            v81 = [v80 placeInference];
            double v82 = [v81 mapItem];
            if (v82)
            {
              v83 = [v39 objectAtIndexedSubscript:v64];
              v84 = [v83 objectAtIndexedSubscript:v74];
              id v85 = [v84 placeInference];
              v86 = [v85 mapItem];
              uint64_t v87 = [v86 muid];

              id v39 = v276;
              unint64_t v49 = 0x1E4F28000;

              uint64_t v64 = v277;
            }
            else
            {
              uint64_t v87 = 0;
            }

            id v88 = [v39 objectAtIndexedSubscript:v64];
            v89 = [v88 objectAtIndexedSubscript:v74];
            v90 = [v89 placeInference];
            [v90 confidence];
            double v92 = v91;

            if (v87 == a5)
            {
              uint64_t v268 = 1;
              goto LABEL_66;
            }
            v93 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
            v94 = [v259 objectForKey:v93];

            if (v94) {
              break;
            }
            if (v87)
            {
              v95 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v255 + 1];
              dispatch_time_t v96 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
              [v259 setObject:v95 forKey:v96];
              uint64_t v268 = ++v255;
              goto LABEL_65;
            }
            uint64_t v268 = 0;
LABEL_66:
            unint64_t v273 = vcvtad_u64_f64(v92 * 10000.0);
            v97 = [v39 objectAtIndexedSubscript:v64];
            double v98 = [v97 objectAtIndexedSubscript:v74];
            [v98 placeInference];
            v100 = uint64_t v99 = v64;
            uint64_t v101 = [v100 placeType];

            if (v101 == 3)
            {
              v102 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
              v103 = [v258 objectForKey:v102];

              if (!v103)
              {
                v104 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
                [v258 setObject:&unk_1F344FFA0 forKey:v104];
              }
              v105 = *(void **)(v49 + 3792);
              v106 = [v105 numberWithUnsignedInteger:v87];
              v107 = [v258 objectForKeyedSubscript:v106];
              v108 = [v105 numberWithUnsignedInteger:[v107 unsignedIntegerValue] + 1];
              id v109 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
              [v258 setObject:v108 forKey:v109];
              uint64_t v110 = 1;
            }
            else
            {
              v111 = [v39 objectAtIndexedSubscript:v99];
              v112 = [v111 objectAtIndexedSubscript:v74];
              uint64_t v113 = [v112 placeInference];
              uint64_t v114 = [v113 placeType];

              if (v114 != 2)
              {
                uint64_t v119 = v87;
                uint64_t v270 = 0;
                uint64_t v120 = v49;
                goto LABEL_76;
              }
              id v115 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
              v116 = [v256 objectForKey:v115];

              if (!v116)
              {
                v117 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
                [v256 setObject:&unk_1F344FFA0 forKey:v117];
              }
              v118 = *(void **)(v49 + 3792);
              v106 = [v118 numberWithUnsignedInteger:v87];
              v107 = [v256 objectForKeyedSubscript:v106];
              v108 = [v118 numberWithUnsignedInteger:[v107 unsignedIntegerValue] + 1];
              id v109 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
              [v256 setObject:v108 forKey:v109];
              uint64_t v110 = 2;
            }
            uint64_t v270 = v110;
            uint64_t v119 = v87;

            uint64_t v120 = 0x1E4F28000;
LABEL_76:
            v266 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitEntryQuery", v261, @"Result", v74 + 1, @"Muid"];
            v121 = [NSString stringWithFormat:@"%lu", v119];
            [v265 setObject:v121 forKeyedSubscript:v266];

            v122 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitEntryQuery", v261, @"Result", v74 + 1, @"Match"];
            v123 = [*(id *)(v120 + 3792) numberWithUnsignedInteger:v268];
            [v265 setObject:v123 forKeyedSubscript:v122];

            double v124 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitEntryQuery", v261, @"Result", v74 + 1, @"Confidence"];
            v125 = [*(id *)(v120 + 3792) numberWithUnsignedInteger:v273];
            [v265 setObject:v125 forKeyedSubscript:v124];

            v126 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitEntryQuery", v261, @"Result", ++v74, @"PoiSize"];
            id v127 = [*(id *)(v120 + 3792) numberWithUnsignedInteger:v270];
            [v265 setObject:v127 forKeyedSubscript:v126];

            uint64_t v64 = v277;
            v128 = [v276 objectAtIndexedSubscript:v277];
            unint64_t v129 = [v128 count];

            unint64_t v130 = 3;
            if (v129 < 3) {
              unint64_t v130 = v129;
            }
            unint64_t v49 = v120;
            id v39 = v276;
            if (v74 >= v130) {
              goto LABEL_81;
            }
          }
          v95 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v87];
          dispatch_time_t v96 = [v259 objectForKey:v95];
          uint64_t v268 = [v96 unsignedIntegerValue];
LABEL_65:

          goto LABEL_66;
        }
LABEL_81:

        unint64_t v131 = v261;
      }
      else
      {
        unint64_t v131 = v54 + 1;
      }
      unint64_t v132 = [v39 count];
      unint64_t v133 = 10;
      if (v132 < 0xA) {
        unint64_t v133 = v132;
      }
      unint64_t v54 = v131;
      if (v131 >= v133) {
        goto LABEL_88;
      }
    }
  }
  uint64_t v255 = 1;
LABEL_88:
  if ((unint64_t)[v39 count] > 0xA)
  {
    uint64_t v134 = [v39 count];
    if ((v134 - 10) / 0xAuLL <= 1) {
      unint64_t v135 = 1;
    }
    else {
      unint64_t v135 = (v134 - 10) / 0xAuLL;
    }
    unint64_t v136 = [v39 count];
    unint64_t v137 = 10 * v135 + 10;
    if (v136 < v137) {
      unint64_t v137 = v136;
    }
    unint64_t v247 = v137;
    unint64_t v248 = v135;
    if (v137 >= 0xB)
    {
      uint64_t v267 = 1;
      unint64_t v138 = 10;
      do
      {
        v139 = [v39 objectAtIndexedSubscript:v138];
        uint64_t v140 = [v139 count];

        if (v140)
        {
          v141 = [v39 objectAtIndexedSubscript:v138];
          double v142 = [v141 firstObject];
          double v143 = [v142 date];
          [v143 timeIntervalSinceDate:v250];
          unint64_t v145 = llround(v144);

          uint64_t v146 = [NSString stringWithFormat:@"%@%lu%@", @"visitDwellQuery", v267, @"TimeOffset"];
          v147 = [*(id *)(v49 + 3792) numberWithInteger:v145];
          v252 = (void *)v146;
          [v265 setObject:v147 forKeyedSubscript:v146];

          unint64_t v262 = v138 + 1;
          uint64_t v148 = [NSString stringWithFormat:@"%@%lu%@", @"visitDwellQuery", v138 + 1, @"ErrorCode"];
          v149 = *(void **)(v49 + 3792);
          v150 = [v39 objectAtIndexedSubscript:v138];
          v151 = [v150 firstObject];
          v152 = [v149 numberWithInteger:[v151 errorCode]];
          v249 = (void *)v148;
          [v265 setObject:v152 forKeyedSubscript:v148];

          id v153 = [v39 objectAtIndexedSubscript:v138];
          unint64_t v154 = [v153 count];

          uint64_t v155 = 3;
          if (v154 < 3) {
            uint64_t v155 = v154;
          }
          if (v155)
          {
            unint64_t v156 = 0;
            unint64_t v257 = v138;
            while (1)
            {
              uint64_t v157 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
              if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
              {
                id v158 = NSStringFromSelector(a2);
                id v159 = [v39 objectAtIndexedSubscript:v138];
                v160 = [v159 objectAtIndexedSubscript:v156];
                *(_DWORD *)buf = 138413058;
                v305 = v158;
                __int16 v306 = 2048;
                uint64_t v307 = v138;
                __int16 v308 = 2048;
                unint64_t v309 = v156;
                __int16 v310 = 2112;
                unint64_t v311 = (unint64_t)v160;
                _os_log_impl(&dword_1D9BFA000, v157, OS_LOG_TYPE_INFO, "%@, group idx, %lu, result idx, %lu, query, %@", buf, 0x2Au);
              }
              v161 = [v39 objectAtIndexedSubscript:v138];
              v162 = [v161 objectAtIndexedSubscript:v156];
              v163 = [v162 placeInference];
              v164 = [v163 mapItem];
              if (v164)
              {
                v165 = [v39 objectAtIndexedSubscript:v138];
                v166 = [v165 objectAtIndexedSubscript:v156];
                double v167 = [v166 placeInference];
                double v168 = [v167 mapItem];
                uint64_t v274 = [v168 muid];

                id v39 = v276;
                unint64_t v49 = 0x1E4F28000;
              }
              else
              {
                uint64_t v274 = 0;
              }

              id v169 = [v39 objectAtIndexedSubscript:v138];
              v170 = [v169 objectAtIndexedSubscript:v156];
              v171 = [v170 placeInference];
              [v171 confidence];
              double v173 = v172;

              unint64_t v174 = v138;
              if (v274 == a5)
              {
                uint64_t v278 = 1;
                uint64_t v175 = v274;
                goto LABEL_113;
              }
              double v176 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v274];
              double v177 = [v259 objectForKey:v176];

              uint64_t v175 = v274;
              if (v177) {
                break;
              }
              if (v274)
              {
                id v178 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v255 + 1];
                v179 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v274];
                [v259 setObject:v178 forKey:v179];
                uint64_t v278 = ++v255;
                goto LABEL_112;
              }
              uint64_t v278 = 0;
LABEL_113:
              uint64_t v180 = [v39 objectAtIndexedSubscript:v174];
              v181 = [v180 objectAtIndexedSubscript:v156];
              v182 = [v181 placeInference];
              uint64_t v183 = [v182 placeType];

              unint64_t v275 = vcvtad_u64_f64(v173 * 10000.0);
              if (v183 == 3)
              {
                uint64_t v184 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                uint64_t v185 = [v258 objectForKey:v184];

                if (!v185)
                {
                  v186 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                  [v258 setObject:&unk_1F344FFA0 forKey:v186];
                }
                uint64_t v187 = *(void **)(v49 + 3792);
                v188 = [v187 numberWithUnsignedInteger:v175];
                v189 = [v258 objectForKeyedSubscript:v188];
                v190 = [v187 numberWithUnsignedInteger:[v189 unsignedIntegerValue] + 1];
                v191 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                [v258 setObject:v190 forKey:v191];
                uint64_t v192 = 1;
              }
              else
              {
                dispatch_semaphore_t v193 = [v39 objectAtIndexedSubscript:v174];
                v194 = [v193 objectAtIndexedSubscript:v156];
                dispatch_semaphore_t v195 = [v194 placeInference];
                uint64_t v196 = [v195 placeType];

                if (v196 != 2)
                {
                  uint64_t v271 = 0;
                  uint64_t v201 = v49;
                  goto LABEL_123;
                }
                v197 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                id v198 = [v256 objectForKey:v197];

                if (!v198)
                {
                  id v199 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                  [v256 setObject:&unk_1F344FFA0 forKey:v199];
                }
                v200 = *(void **)(v49 + 3792);
                v188 = [v200 numberWithUnsignedInteger:v175];
                v189 = [v256 objectForKeyedSubscript:v188];
                v190 = [v200 numberWithUnsignedInteger:[v189 unsignedIntegerValue] + 1];
                v191 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v175];
                [v256 setObject:v190 forKey:v191];
                uint64_t v192 = 2;
              }
              uint64_t v271 = v192;

              uint64_t v201 = 0x1E4F28000;
LABEL_123:
              v269 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitDwellQuery", v262, @"Result", ++v156, @"Muid"];
              id v202 = [NSString stringWithFormat:@"%lu", v175];
              [v265 setObject:v202 forKeyedSubscript:v269];

              v203 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitDwellQuery", v267, @"Result", v156, @"Match"];
              v204 = [*(id *)(v201 + 3792) numberWithUnsignedInteger:v278];
              [v265 setObject:v204 forKeyedSubscript:v203];

              [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitDwellQuery", v267, @"Result", v156, @"Confidence"];
              v205 = unint64_t v49 = v201;
              v206 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v275];
              [v265 setObject:v206 forKeyedSubscript:v205];

              v207 = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"visitDwellQuery", v267, @"Result", v156, @"PoiSize"];
              id v208 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v271];
              [v265 setObject:v208 forKeyedSubscript:v207];

              id v39 = v276;
              unint64_t v138 = v257;
              v209 = [v276 objectAtIndexedSubscript:v257];
              unint64_t v210 = [v209 count];

              unint64_t v211 = 3;
              if (v210 < 3) {
                unint64_t v211 = v210;
              }
              if (v156 >= v211) {
                goto LABEL_128;
              }
            }
            id v178 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v274];
            v179 = [v259 objectForKey:v178];
            uint64_t v278 = [v179 unsignedIntegerValue];
LABEL_112:

            goto LABEL_113;
          }
LABEL_128:
          ++v267;
        }
        v138 += v248;
      }
      while (v138 < v247);
    }
  }
  long long v287 = 0u;
  long long v288 = 0u;
  long long v285 = 0u;
  long long v286 = 0u;
  id v212 = v258;
  uint64_t v213 = [v212 countByEnumeratingWithState:&v285 objects:v301 count:16];
  if (v213)
  {
    uint64_t v214 = v213;
    uint64_t v279 = 0;
    unint64_t v215 = 0;
    uint64_t v216 = *(void *)v286;
    do
    {
      for (uint64_t k = 0; k != v214; ++k)
      {
        if (*(void *)v286 != v216) {
          objc_enumerationMutation(v212);
        }
        long long v218 = *(void **)(*((void *)&v285 + 1) + 8 * k);
        id v219 = [v212 objectForKeyedSubscript:v218];
        unint64_t v220 = [v219 unsignedIntegerValue];

        if (v220 > v215)
        {
          uint64_t v279 = [v218 unsignedIntegerValue];
          unint64_t v215 = v220;
        }
        v221 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        unint64_t v49 = 0x1E4F28000;
        if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
        {
          v222 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v305 = v222;
          __int16 v306 = 2112;
          uint64_t v307 = (uint64_t)v218;
          __int16 v308 = 2048;
          unint64_t v309 = v220;
          __int16 v310 = 2048;
          unint64_t v311 = v215;
          _os_log_debug_impl(&dword_1D9BFA000, v221, OS_LOG_TYPE_DEBUG, "%@, POI label, %@, count, %lu, max count, %lu", buf, 0x2Au);

          unint64_t v49 = 0x1E4F28000;
        }
      }
      uint64_t v214 = [v212 countByEnumeratingWithState:&v285 objects:v301 count:16];
    }
    while (v214);
  }
  else
  {
    uint64_t v279 = 0;
    unint64_t v215 = 0;
  }
  v272 = v212;

  v223 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
  {
    v224 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v305 = v224;
    __int16 v306 = 2048;
    uint64_t v307 = v279;
    __int16 v308 = 2048;
    unint64_t v309 = v215;
    _os_log_impl(&dword_1D9BFA000, v223, OS_LOG_TYPE_INFO, "%@, aggregated POI label, %lu, count, %lu", buf, 0x20u);
  }
  uint64_t v225 = 1;
  if (v279 != a5) {
    uint64_t v225 = 2;
  }
  if (v279) {
    uint64_t v226 = v225;
  }
  else {
    uint64_t v226 = 0;
  }
  id v227 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v226];
  [v265 setObject:v227 forKeyedSubscript:@"aggregatedResult1Match"];

  [v265 setObject:&unk_1F344FFB8 forKeyedSubscript:@"aggregatedResult1PoiSize"];
  long long v283 = 0u;
  long long v284 = 0u;
  long long v281 = 0u;
  long long v282 = 0u;
  id v228 = v256;
  uint64_t v229 = [v228 countByEnumeratingWithState:&v281 objects:v300 count:16];
  if (v229)
  {
    uint64_t v230 = v229;
    uint64_t v280 = 0;
    unint64_t v231 = 0;
    uint64_t v232 = *(void *)v282;
    do
    {
      for (uint64_t m = 0; m != v230; ++m)
      {
        if (*(void *)v282 != v232) {
          objc_enumerationMutation(v228);
        }
        v234 = *(void **)(*((void *)&v281 + 1) + 8 * m);
        v235 = [v228 objectForKeyedSubscript:v234];
        unint64_t v236 = [v235 unsignedIntegerValue];

        if (v236 > v231)
        {
          uint64_t v280 = [v234 unsignedIntegerValue];
          unint64_t v231 = v236;
        }
        v237 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG))
        {
          v238 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v305 = v238;
          __int16 v306 = 2112;
          uint64_t v307 = (uint64_t)v234;
          __int16 v308 = 2048;
          unint64_t v309 = v236;
          __int16 v310 = 2048;
          unint64_t v311 = v231;
          _os_log_debug_impl(&dword_1D9BFA000, v237, OS_LOG_TYPE_DEBUG, "%@, AOI label, %@, count, %lu, max count, %lu", buf, 0x2Au);

          unint64_t v49 = 0x1E4F28000;
        }
      }
      uint64_t v230 = [v228 countByEnumeratingWithState:&v281 objects:v300 count:16];
    }
    while (v230);
  }
  else
  {
    uint64_t v280 = 0;
    unint64_t v231 = 0;
  }

  uint64_t v239 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
  {
    v240 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v305 = v240;
    __int16 v306 = 2048;
    uint64_t v307 = v280;
    __int16 v308 = 2048;
    unint64_t v309 = v231;
    _os_log_impl(&dword_1D9BFA000, v239, OS_LOG_TYPE_INFO, "%@, aggregated AOI label, %lu, count, %lu", buf, 0x20u);
  }
  uint64_t v241 = 1;
  if (v280 != a5) {
    uint64_t v241 = 2;
  }
  if (v280) {
    uint64_t v242 = v241;
  }
  else {
    uint64_t v242 = 0;
  }
  v243 = [*(id *)(v49 + 3792) numberWithUnsignedInteger:v242];
  [v265 setObject:v243 forKeyedSubscript:@"aggregatedResult2Match"];

  [v265 setObject:&unk_1F344FFE8 forKeyedSubscript:@"aggregatedResult2PoiSize"];
  id v244 = v265;

  return v244;
}

void __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2048;
    uint64_t v13 = [v5 count];
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, group idx, %lu, query count, %lu", (uint8_t *)&v8, 0x20u);
  }
}

void __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke_404(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  [v2 addObject:v5, v6, v7];
}

- (unint64_t)getTruthPointOfInterestIdentifier
{
  uint64_t v2 = [(RTPointOfInterestMetricsManager *)self defaultsManager];
  id v3 = [v2 objectForKey:@"PointOfInterestMetricsManagerTruthLabelIdentifier"];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (RTPointOfInterestSampler)pointOfInterestSampler
{
  return self->_pointOfInterestSampler;
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (NSMutableArray)locationDenyList
{
  return self->_locationDenyList;
}

- (BOOL)samplingPointOfInterest
{
  return self->_samplingPointOfInterest;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (RTTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
}

- (int)currentSignalEnvironmentType
{
  return self->_currentSignalEnvironmentType;
}

- (RTMapItem)navigationDestination
{
  return self->_navigationDestination;
}

- (void)setNavigationDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDestination, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_locationDenyList, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end