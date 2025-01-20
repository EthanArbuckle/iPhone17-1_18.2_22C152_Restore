@interface RTPointOfInterestMonitor
- (BOOL)_exceedPowerBudget;
- (BOOL)_setupPolygonalRegionsForLocations:(id)a3 error:(id *)a4;
- (BOOL)_shouldMonitorLocation:(id)a3;
- (BOOL)_shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:(id)a3;
- (BOOL)_startMonitoringLocation:(id)a3 error:(id *)a4;
- (BOOL)registeredForRegionEvents;
- (BOOL)requestingHighAccuracyLocation;
- (NSDate)lastMonitoringDate;
- (NSMutableArray)monitoringLocationDenyList;
- (NSString)regionMonitoringClientIdentifer;
- (RTAppClipManager)appClipManager;
- (RTBuildingPolygonManager)buildingPolygonManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocation)navigationDestination;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTNavigationManager)navigationManager;
- (RTPlatform)platform;
- (RTPointOfInterestMonitor)init;
- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 dailyMetrics:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 eventMetrics:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 motionActivityManager:(id)a12 navigationManager:(id)a13 platform:(id)a14 timerManager:(id)a15 vehicleLocationProvider:(id)a16 visitLabeler:(id)a17 visitStore:(id)a18;
- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 motionActivityManager:(id)a10 navigationManager:(id)a11 platform:(id)a12 vehicleLocationProvider:(id)a13 visitLabeler:(id)a14 visitStore:(id)a15;
- (RTPointOfInterestMonitorDailyMetrics)dailyMetrics;
- (RTPointOfInterestMonitorEventMetrics)eventMetrics;
- (RTTimer)locationRequestTimer;
- (RTTimer)metricsSubmissionTimer;
- (RTTimer)regionMonitorTimer;
- (RTTimerManager)timerManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTVisitLabeler)visitLabeler;
- (RTVisitStore)visitStore;
- (id)_polygonalRegionWithRegionIdentifier:(id)a3 polygon:(id)a4;
- (id)_regionMonitoringLocationsForLocation:(id)a3 error:(id *)a4;
- (void)_onActivityAlarmNotification:(id)a3;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_onLearnedLocationManagerNotification:(id)a3;
- (void)_onNavigationNotification:(id)a3;
- (void)_onVehicleEventNotification:(id)a3;
- (void)_registerForNotifications;
- (void)_registerForPolygonalRegionEvents;
- (void)_setup;
- (void)_shutdown;
- (void)_startEventMetricsSubmissionTimer;
- (void)_startHighAccuracyLocationRequest;
- (void)_stopHighAccuracyLocationRequest;
- (void)_stopMonitoringAllRegionsIfNeeded;
- (void)_unRegisterForNotifications;
- (void)_unRegisterForPolygonalRegionEvents;
- (void)_updateMonitoringLocationDenyList;
- (void)handlePolygonalRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onActivityAlarmNotification:(id)a3;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)onNavigationNotification:(id)a3;
- (void)onVehicleEventNotification:(id)a3;
- (void)setAppClipManager:(id)a3;
- (void)setBuildingPolygonManager:(id)a3;
- (void)setDailyMetrics:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEventMetrics:(id)a3;
- (void)setLastMonitoringDate:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationRequestTimer:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMetricsSubmissionTimer:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setNavigationDestination:(id)a3;
- (void)setNavigationManager:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRegionMonitorTimer:(id)a3;
- (void)setRegionMonitoringClientIdentifer:(id)a3;
- (void)setRegisteredForRegionEvents:(BOOL)a3;
- (void)setRequestingHighAccuracyLocation:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setVisitLabeler:(id)a3;
- (void)setVisitStore:(id)a3;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation RTPointOfInterestMonitor

- (RTPointOfInterestMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAppClipManager_buildingPolygonManager_dailyMetrics_defaultsManager_distanceCalculator_eventMetrics_learnedLocationManager_locationManager_mapServiceManager_motionActivityManager_navigationManager_platform_timerManager_vehicleLocationProvider_visitLabeler_visitStore_);
}

- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 motionActivityManager:(id)a10 navigationManager:(id)a11 platform:(id)a12 vehicleLocationProvider:(id)a13 visitLabeler:(id)a14 visitStore:(id)a15
{
  id v31 = a15;
  id v30 = a14;
  id v29 = a13;
  id v19 = a12;
  id v28 = a11;
  id v27 = a10;
  id v25 = a9;
  id v39 = a8;
  id v38 = a7;
  id v20 = a6;
  id v23 = a5;
  id v37 = a4;
  id v35 = a3;
  v24 = [[RTPointOfInterestMonitorDailyMetrics alloc] initWithDefaultsManager:v23];
  v21 = [[RTPointOfInterestMonitorEventMetrics alloc] initWithDistanceCalculator:v20];
  Class v26 = (Class)objc_opt_new();
  v33 = -[RTPointOfInterestMonitor initWithAppClipManager:buildingPolygonManager:dailyMetrics:defaultsManager:distanceCalculator:eventMetrics:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:timerManager:vehicleLocationProvider:visitLabeler:visitStore:](self, "initWithAppClipManager:buildingPolygonManager:dailyMetrics:defaultsManager:distanceCalculator:eventMetrics:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:timerManager:vehicleLocationProvider:visitLabeler:visitStore:", v35, v37, v24, v23, v20, v21, v38, v39, v25, v27, v28, v19, v26, v29, v30,
          v31);

  return v33;
}

- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 dailyMetrics:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 eventMetrics:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 motionActivityManager:(id)a12 navigationManager:(id)a13 platform:(id)a14 timerManager:(id)a15 vehicleLocationProvider:(id)a16 visitLabeler:(id)a17 visitStore:(id)a18
{
  id v71 = a3;
  id v55 = a4;
  id v23 = a4;
  id v60 = a5;
  id v70 = a6;
  id v56 = a7;
  id v59 = a7;
  id v58 = a8;
  id v57 = a9;
  id v69 = a10;
  id v24 = a11;
  id v68 = a12;
  id v67 = a13;
  id v66 = a14;
  id v65 = a15;
  id v64 = a16;
  id v63 = a17;
  id v25 = a18;
  v61 = v25;
  if (!v71)
  {
    Class v26 = v23;
    v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appClipManager", buf, 2u);
    }

    v43 = 0;
    v46 = v70;
    v45 = 0;
    id v27 = v59;
    id v28 = v60;
    id v30 = v57;
    id v29 = v58;
    goto LABEL_56;
  }
  Class v26 = v23;
  if (!v23)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v27 = v59;
    id v28 = v60;
    v48 = v69;
    v46 = v70;
    id v30 = v57;
    id v29 = v58;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: buildingPolygonManager", buf, 2u);
    }

    v43 = 0;
    v45 = v71;
    goto LABEL_57;
  }
  id v27 = v59;
  id v28 = v60;
  id v30 = v57;
  id v29 = v58;
  if (!v60)
  {
    v46 = v70;
    v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dailyMetrics", buf, 2u);
    }

    v43 = 0;
    v45 = v71;
    goto LABEL_56;
  }
  if (!v70)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: defaultsManager";
LABEL_53:
    _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_54;
  }
  if (!v59)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_53;
  }
  if (!v58)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: eventMetrics";
    goto LABEL_53;
  }
  if (!v57)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_53;
  }
  if (!v69)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_53;
  }
  if (!v24)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_53;
  }
  if (!v68)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_53;
  }
  if (!v67)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_53;
  }
  if (!v66)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: platform";
    goto LABEL_53;
  }
  if (!v65)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_53;
  }
  if (!v64)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_53;
  }
  if (!v63)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: visitLabeler";
      goto LABEL_53;
    }
LABEL_54:

    v43 = 0;
LABEL_55:
    v46 = v70;
    v45 = v71;
LABEL_56:
    v48 = v69;
    goto LABEL_57;
  }
  if (v25)
  {
    v72.receiver = self;
    v72.super_class = (Class)RTPointOfInterestMonitor;
    id v31 = [(RTNotifier *)&v72 init];
    v32 = v31;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_appClipManager, a3);
      objc_storeStrong((id *)&v32->_buildingPolygonManager, v55);
      objc_storeStrong((id *)&v32->_defaultsManager, a6);
      objc_storeStrong((id *)&v32->_dailyMetrics, a5);
      objc_storeStrong((id *)&v32->_distanceCalculator, v56);
      objc_storeStrong((id *)&v32->_eventMetrics, a8);
      objc_storeStrong((id *)&v32->_learnedLocationManager, a9);
      objc_storeStrong((id *)&v32->_locationManager, a10);
      objc_storeStrong((id *)&v32->_motionActivityManager, a12);
      objc_storeStrong((id *)&v32->_mapServiceManager, a11);
      objc_storeStrong((id *)&v32->_navigationManager, a13);
      objc_storeStrong((id *)&v32->_platform, a14);
      objc_storeStrong((id *)&v32->_vehicleLocationProvider, a16);
      objc_storeStrong((id *)&v32->_timerManager, a15);
      objc_storeStrong((id *)&v32->_visitLabeler, a17);
      objc_storeStrong((id *)&v32->_visitStore, a18);
      v33 = (objc_class *)objc_opt_class();
      uint64_t v34 = NSStringFromClass(v33);
      regionMonitoringClientIdentifer = v32->_regionMonitoringClientIdentifer;
      v32->_regionMonitoringClientIdentifer = (NSString *)v34;

      lastMonitoringDate = v32->_lastMonitoringDate;
      v32->_lastMonitoringDate = 0;

      locationRequestTimer = v32->_locationRequestTimer;
      v32->_locationRequestTimer = 0;

      metricsSubmissionTimer = v32->_metricsSubmissionTimer;
      v32->_metricsSubmissionTimer = 0;

      regionMonitorTimer = v32->_regionMonitorTimer;
      v32->_regionMonitorTimer = 0;

      v32->_requestingHighAccuracyLocation = 0;
      navigationDestination = v32->_navigationDestination;
      v32->_navigationDestination = 0;

      v32->_registeredForRegionEvents = 0;
      uint64_t v41 = objc_opt_new();
      monitoringLocationDenyList = v32->_monitoringLocationDenyList;
      v32->_monitoringLocationDenyList = (NSMutableArray *)v41;
    }
    [(RTService *)v32 setup];
    v43 = v32;
    self = v43;
    goto LABEL_55;
  }
  v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v46 = v70;
  v45 = v71;
  v48 = v69;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", buf, 2u);
  }

  v43 = 0;
LABEL_57:

  return v43;
}

- (void)_setup
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(RTPointOfInterestMonitor *)self platform];
    int v4 = [v3 iPhoneDevice];

    if (v4)
    {
      v5 = [(RTPointOfInterestMonitor *)self eventMetrics];
      [v5 reset];

      [(RTPointOfInterestMonitor *)self _registerForNotifications];
      [(RTPointOfInterestMonitor *)self _registerForPolygonalRegionEvents];
      [(RTPointOfInterestMonitor *)self _stopMonitoringAllRegionsIfNeeded];
    }
  }
}

- (void)_registerForNotifications
{
  v3 = [(RTPointOfInterestMonitor *)self navigationManager];
  int v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onNavigationNotification_ name:v4];

  v5 = [(RTPointOfInterestMonitor *)self navigationManager];
  v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onNavigationNotification_ name:v6];

  v7 = [(RTPointOfInterestMonitor *)self vehicleLocationProvider];
  v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onVehicleEventNotification_ name:v8];

  v9 = [(RTPointOfInterestMonitor *)self motionActivityManager];
  v10 = +[RTNotification notificationName];
  [v9 addObserver:self selector:sel_onActivityAlarmNotification_ name:v10];

  v11 = [(RTPointOfInterestMonitor *)self learnedLocationManager];
  v12 = +[RTNotification notificationName];
  [v11 addObserver:self selector:sel_onLearnedLocationManagerNotification_ name:v12];

  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

- (void)_registerForPolygonalRegionEvents
{
  int v4 = [(RTPointOfInterestMonitor *)self locationManager];
  regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__RTPointOfInterestMonitor__registerForPolygonalRegionEvents__block_invoke;
  v6[3] = &unk_1E6B911D0;
  v6[4] = self;
  v6[5] = a2;
  [v4 registerForRegionEventsWithClientIdentifier:regionMonitoringClientIdentifer handler:v6];

  [(RTPointOfInterestMonitor *)self setRegisteredForRegionEvents:1];
}

void __61__RTPointOfInterestMonitor__registerForPolygonalRegionEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (a3 == 4)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = +[RTLocationManager stringForRegionCallbackType:4];
      int v17 = 138412802;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = v9;
      id v13 = "%@, regionMonitoring failure, %@, error, %@";
      goto LABEL_14;
    }
LABEL_6:

    goto LABEL_12;
  }
  if (a3 == 3)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = +[RTLocationManager stringForRegionCallbackType:3];
      int v17 = 138412802;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = v9;
      id v13 = "%@, regionMonitoring client registration failure, %@, error, %@";
LABEL_14:
      _os_log_fault_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v17, 0x20u);

      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v16 = +[RTLocationManager stringForRegionCallbackType:a3];
      int v17 = 138412802;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_fault_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_FAULT, "%@, regionMonitoring %@, error, %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) handlePolygonalRegionCallback:a3 region:v7 clientIdentifier:*(void *)(*(void *)(a1 + 32) + 168)];
  }
LABEL_12:
}

- (void)_stopMonitoringAllRegionsIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v4 = [(RTPointOfInterestMonitor *)self defaultsManager];
  v5 = [v4 objectForKey:@"InstantPOILastFenceSetupDate"];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1800.0];
    int v7 = [v5 isBeforeDate:v6];
  }
  else
  {
    int v7 = 0;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromSelector(a2);
    uint64_t v10 = [v5 stringFromDate];
    v11 = (void *)v10;
    v12 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    if (v7) {
      v12 = @"YES";
    }
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, last fence setup date, %@, shouldStopMonitoringAllRegions, %@", buf, 0x20u);
  }
  if (v7)
  {
    id v13 = [(RTPointOfInterestMonitor *)self locationManager];
    v14 = [(RTPointOfInterestMonitor *)self regionMonitoringClientIdentifer];
    id v18 = 0;
    [v13 stopMonitoringAllRegionsForClientIdentifier:v14 error:&v18];
    id v15 = v18;

    v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v15;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, stop monitoring all regions, error, %@", buf, 0x16u);
    }
  }
}

- (void)_updateMonitoringLocationDenyList
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v4 = [(RTPointOfInterestMonitor *)self monitoringLocationDenyList];
  [v4 removeAllObjects];

  v5 = objc_opt_new();
  v6 = objc_opt_new();
  int v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = [(RTPointOfInterestMonitor *)self learnedLocationManager];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke;
  v27[3] = &unk_1E6B911F8;
  SEL v30 = a2;
  id v9 = v5;
  id v28 = v9;
  uint64_t v10 = v7;
  id v29 = v10;
  [v8 fetchLocationsOfInterestWithPlaceType:1 handler:v27];

  dispatch_group_enter(v10);
  v11 = [(RTPointOfInterestMonitor *)self learnedLocationManager];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke_60;
  __int16 v23 = &unk_1E6B911F8;
  SEL v26 = a2;
  id v12 = v6;
  id v24 = v12;
  id v13 = v10;
  uint64_t v25 = v13;
  [v11 fetchLocationsOfInterestWithPlaceType:2 handler:&v20];

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v14 = [(RTPointOfInterestMonitor *)self monitoringLocationDenyList];
  [v14 addObjectsFromArray:v9];

  id v15 = [(RTPointOfInterestMonitor *)self monitoringLocationDenyList];
  [v15 addObjectsFromArray:v12];

  v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = NSStringFromSelector(a2);
    id v18 = [(RTPointOfInterestMonitor *)self monitoringLocationDenyList];
    uint64_t v19 = [v18 count];
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    __int16 v33 = 2048;
    uint64_t v34 = v19;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, monitoringLocationDenyList size, %lu", buf, 0x16u);
  }
}

void __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
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
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v15 = [v14 location:v24, v25];
          v16 = [v15 location];

          if (v16)
          {
            int v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
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
            __int16 v23 = [v22 location];
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

void __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
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
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v15 = [v14 location:v24, v25];
          v16 = [v15 location];

          if (v16)
          {
            int v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
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
            __int16 v23 = [v22 location];
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

- (void)shutdownWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RTPointOfInterestMonitor_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__RTPointOfInterestMonitor_shutdownWithHandler___block_invoke(uint64_t a1)
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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(a2);
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);
  }
  [(RTTimer *)self->_locationRequestTimer invalidate];
  locationRequestTimer = self->_locationRequestTimer;
  self->_locationRequestTimer = 0;

  [(RTTimer *)self->_regionMonitorTimer invalidate];
  regionMonitorTimer = self->_regionMonitorTimer;
  self->_regionMonitorTimer = 0;

  [(RTTimer *)self->_metricsSubmissionTimer invalidate];
  metricsSubmissionTimer = self->_metricsSubmissionTimer;
  self->_metricsSubmissionTimer = 0;

  [(RTPointOfInterestMonitor *)self _unRegisterForNotifications];
  if ([(RTPointOfInterestMonitor *)self registeredForRegionEvents]) {
    [(RTPointOfInterestMonitor *)self _unRegisterForPolygonalRegionEvents];
  }
}

- (void)_unRegisterForNotifications
{
  v3 = [(RTPointOfInterestMonitor *)self navigationManager];
  id v4 = +[RTNotification notificationName];
  [v3 removeObserver:self fromNotification:v4];

  id v5 = [(RTPointOfInterestMonitor *)self vehicleLocationProvider];
  id v6 = +[RTNotification notificationName];
  [v5 removeObserver:self fromNotification:v6];

  id v8 = [(RTPointOfInterestMonitor *)self locationManager];
  int v7 = +[RTNotification notificationName];
  [v8 removeObserver:self fromNotification:v7];
}

- (void)_unRegisterForPolygonalRegionEvents
{
  id v4 = [(RTPointOfInterestMonitor *)self locationManager];
  regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__RTPointOfInterestMonitor__unRegisterForPolygonalRegionEvents__block_invoke;
  v6[3] = &unk_1E6B90CB8;
  v6[4] = self;
  v6[5] = a2;
  [v4 unregisterForRegionEventsWithClientIdentifier:regionMonitoringClientIdentifer handler:v6];
}

void __63__RTPointOfInterestMonitor__unRegisterForPolygonalRegionEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 168);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "%@, regionMonitoring unregistration failure, client, %@, error, %@", (uint8_t *)&v9, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 168);
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, client, %@, error, %@", (uint8_t *)&v9, 0x20u);
    goto LABEL_6;
  }
}

- (void)handlePolygonalRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[RTPointOfInterestMonitor handlePolygonalRegionCallback:region:clientIdentifier:]";
    __int16 v23 = 1024;
    LODWORD(v24) = 426;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_7:
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[RTPointOfInterestMonitor handlePolygonalRegionCallback:region:clientIdentifier:]";
      __int16 v23 = 1024;
      LODWORD(v24) = 427;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    uint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = +[RTLocationManager stringForRegionCallbackType:a3];
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    long long v28 = v11;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, callbackType, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);
  }
  if (a3 == 1)
  {
    int v17 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke;
    block[3] = &unk_1E6B91220;
    block[4] = self;
    id v19 = v9;
    SEL v20 = a2;
    dispatch_async(v17, block);
  }
}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) eventMetrics];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"isFenceBreak"];

  id v3 = [*(id *)(a1 + 32) eventMetrics];
  id v4 = [v3 highAccuracyLocationRequestStartDate];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    id v6 = [*(id *)(a1 + 32) eventMetrics];
    uint64_t v7 = [v6 highAccuracyLocationRequestStartDate];
    [v5 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 <= 60.0)
    {
      id v10 = [*(id *)(a1 + 32) eventMetrics];
      [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"isGPSRunningWhenFenceBreak"];
    }
  }
  __int16 v11 = [*(id *)(a1 + 32) eventMetrics];
  uint64_t v12 = [*(id *)(a1 + 40) identifier];
  [v11 updateBuildingPolygonMetricsForRegionIdentifer:v12];

  __int16 v13 = [*(id *)(a1 + 32) eventMetrics];
  id v14 = [v13 arrivalEventDate];

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 32) eventMetrics];
    v16 = NSNumber;
    int v17 = [MEMORY[0x1E4F1C9C8] now];
    id v18 = [*(id *)(a1 + 32) eventMetrics];
    id v19 = [v18 arrivalEventDate];
    [v17 timeIntervalSinceDate:v19];
    uint64_t v21 = [v16 numberWithUnsignedInteger:vcvtad_u64_f64(v20)];
    [v15 setObject:v21 forKey:@"fenceBreakLatency"];
  }
  uint64_t v22 = [*(id *)(a1 + 32) locationRequestTimer];
  [v22 invalidate];

  [*(id *)(a1 + 32) setLocationRequestTimer:0];
  [*(id *)(a1 + 32) _stopHighAccuracyLocationRequest];
  __int16 v23 = [*(id *)(a1 + 32) locationManager];
  id v24 = [v23 lastLocation];

  __int16 v25 = [*(id *)(a1 + 32) eventMetrics];
  id v26 = [NSNumber numberWithUnsignedInt:[v24 signalEnvironmentType]];
  [v25 setObject:v26 forKey:@"signalEnvironment"];

  id v27 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v24 coordinate];
  double v29 = v28;
  [v24 coordinate];
  double v31 = v30;
  [v24 horizontalAccuracy];
  double v33 = v32;
  uint64_t v34 = [v24 timestamp];
  __int16 v35 = (void *)[v27 initWithLatitude:v34 longitude:v29 horizontalUncertainty:v31 date:v33];

  id v36 = [MEMORY[0x1E4F1C9C8] now];
  id v37 = objc_alloc(MEMORY[0x1E4F5CFC8]);
  id v38 = (void *)[v37 initWithDate:v36 type:1 location:v35 entry:v36 exit:0 dataPointCount:0 confidence:*MEMORY[0x1E4F5D010] placeInference:0 source:2];
  id v39 = [*(id *)(a1 + 32) visitLabeler];
  id v100 = 0;
  [v39 labelVisit:v38 clientIdentifier:@"com.apple.CoreRoutine.instantPOI" error:&v100];
  id v40 = v100;

  uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    v102 = v42;
    __int16 v103 = 2112;
    id v104 = v38;
    __int16 v105 = 2112;
    id v106 = v40;
    _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, labeled visit, %@, error, %@", buf, 0x20u);
  }
  id v92 = v40;

  v43 = [*(id *)(a1 + 32) defaultsManager];
  v44 = [v43 objectForKey:@"InstantPOIEvalMode"];
  int v45 = [v44 BOOLValue];

  if (v45)
  {
    v46 = [[RTPointOfInterestMonitorVisitNotification alloc] initWithVisit:v38];
    [*(id *)(a1 + 32) postNotification:v46];
  }
  v47 = [MEMORY[0x1E4F1C9C8] now];
  [v47 timeIntervalSinceDate:v36];
  double v49 = v48;

  v50 = [*(id *)(a1 + 32) eventMetrics];
  v51 = [NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(v49)];
  [v50 setObject:v51 forKey:@"bluePOILatency"];

  v52 = [*(id *)(a1 + 32) eventMetrics];
  v53 = [v52 arrivalEventDate];

  if (v53)
  {
    v54 = [MEMORY[0x1E4F1C9C8] now];
    id v55 = [*(id *)(a1 + 32) eventMetrics];
    id v56 = [v55 arrivalEventDate];
    [v54 timeIntervalSinceDate:v56];
    double v58 = v57;

    id v59 = [*(id *)(a1 + 32) eventMetrics];
    id v60 = [NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(v58)];
    [v59 setObject:v60 forKey:@"pOIVisitDetectionLatency"];
  }
  unint64_t v61 = vcvtad_u64_f64(v49 / 5.0);
  if (v61 >= 2) {
    uint64_t v62 = 2;
  }
  else {
    uint64_t v62 = v61;
  }
  id v63 = [*(id *)(a1 + 32) eventMetrics];
  id v64 = [NSNumber numberWithUnsignedInteger:v62];
  [v63 setObject:v64 forKey:@"BluePOIQueryCount"];

  for (; v62; --v62)
  {
    id v65 = [*(id *)(a1 + 32) dailyMetrics];
    [v65 increaseCountForKey:@"InstantPOIMetricsBluePOIQueryCount"];
  }
  id v66 = v92;
  if (v92
    || ([v38 placeInference], id v68 = objc_claimAutoreleasedReturnValue(), v68, !v68))
  {
    id v67 = [*(id *)(a1 + 32) eventMetrics];
    [v67 submit];
  }
  else
  {
    v91 = v35;
    id v69 = [*(id *)(a1 + 32) regionMonitorTimer];
    [v69 invalidate];

    [*(id *)(a1 + 32) setRegionMonitorTimer:0];
    id v70 = [*(id *)(a1 + 32) locationManager];
    uint64_t v71 = *(void *)(*(void *)(a1 + 32) + 168);
    id v99 = 0;
    [v70 stopMonitoringAllRegionsForClientIdentifier:v71 error:&v99];
    id v67 = v99;

    objc_super v72 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      v73 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      v102 = v73;
      __int16 v103 = 2112;
      id v104 = v67;
      _os_log_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_INFO, "%@, stop monitor all regions, error, %@", buf, 0x16u);
    }
    v74 = [*(id *)(a1 + 32) visitStore];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_74;
    v96[3] = &unk_1E6B90CB8;
    uint64_t v98 = *(void *)(a1 + 48);
    id v75 = v38;
    id v97 = v75;
    [v74 storeVisit:v75 handler:v96];

    v76 = [*(id *)(a1 + 32) eventMetrics];
    [v76 setObject:MEMORY[0x1E4F1CC38] forKey:@"bluePOIHasResult"];

    v77 = [*(id *)(a1 + 32) eventMetrics];
    v78 = NSNumber;
    v79 = [v75 placeInference];
    [v79 confidence];
    v81 = [v78 numberWithUnsignedInteger:(unint64_t)(v80 * 100.0)];
    [v77 setObject:v81 forKey:@"bluePOIConfidenceScore"];

    v82 = [*(id *)(a1 + 32) dailyMetrics];
    [v82 increaseCountForKey:@"InstantPOIMetricsVisitCount"];

    id v83 = objc_alloc(MEMORY[0x1E4F5CE48]);
    v84 = (objc_class *)objc_opt_class();
    v85 = NSStringFromClass(v84);
    v86 = (void *)[v83 initWithUseBackgroundTraits:1 analyticsIdentifier:v85 clientIdentifier:@"com.apple.CoreRoutine.instantPOI"];

    v87 = [*(id *)(a1 + 32) mapServiceManager];
    v88 = [v75 placeInference];
    v89 = [v88 mapItem];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_79;
    v93[3] = &unk_1E6B911F8;
    uint64_t v90 = *(void *)(a1 + 48);
    v93[4] = *(void *)(a1 + 32);
    uint64_t v95 = v90;
    id v94 = v75;
    [v87 fetchAppClipURLsForMapItem:v89 options:v86 handler:v93];

    __int16 v35 = v91;
    id v66 = 0;
  }
}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      double v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_2;
  block[3] = &unk_1E6B90F80;
  double v8 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = [*(id *)(a1 + 32) count];
    id v5 = [*(id *)(a1 + 40) placeInference];
    id v6 = [v5 mapItem];
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138413058;
    __int16 v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, app clip count, %lu, mapItem, %@, error, %@", (uint8_t *)&v10, 0x2Au);
  }
  if ([*(id *)(a1 + 32) count])
  {
    double v8 = [*(id *)(a1 + 56) eventMetrics];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKey:@"pOIHasAppClip"];
  }
  id v9 = [*(id *)(a1 + 56) eventMetrics];
  [v9 submit];
}

- (id)_polygonalRegionWithRegionIdentifier:(id)a3 polygon:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v11 = "Invalid parameter not satisfying: regionIdentifier";
      goto LABEL_23;
    }
LABEL_6:
    __int16 v12 = 0;
    goto LABEL_19;
  }
  double v8 = [v6 vertices];
  unint64_t v9 = [v8 count];

  if (v9 <= 2)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v11 = "Invalid parameter not satisfying: polygon.vertices.count >= kRTBuildingPolygonManagerMinimumNumberOfVertices";
LABEL_23:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  uint64_t v32 = objc_opt_new();
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = NSStringFromSelector(a2);
    uint64_t v15 = [v7 vertices];
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = v14;
    __int16 v42 = 2112;
    id v43 = v5;
    __int16 v44 = 2048;
    uint64_t v45 = [v15 count];
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, region identifier, %@, polygon vertices count, %lu", buf, 0x20u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v7 vertices];
  uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  int v10 = v32;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          __int16 v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          uint64_t v41 = v23;
          __int16 v42 = 2048;
          id v43 = (id)(v18 + i);
          int v10 = v32;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v21;
          _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, vertex idx, %lu, coordinate, %@", buf, 0x20u);
        }
        id v24 = objc_alloc(MEMORY[0x1E4F1E6B8]);
        [v21 latitude];
        CLLocationDegrees v26 = v25;
        [v21 longitude];
        CLLocationCoordinate2D v28 = CLLocationCoordinate2DMake(v26, v27);
        double v29 = [v24 initWithCoordinate:v28.latitude, v28.longitude];
        [v10 addObject:v29];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      v18 += i;
    }
    while (v17);
  }

  double v30 = [v10 firstObject];
  [v10 addObject:v30];

  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E698]) initWithVertices:v10 identifier:v5];
  [v12 setNotifyOnEntry:1];
  [v12 setNotifyOnExit:0];
LABEL_19:

  return v12;
}

- (void)_startHighAccuracyLocationRequest
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(RTPointOfInterestMonitor *)self requestingHighAccuracyLocation])
  {
    [(RTPointOfInterestMonitor *)self setRequestingHighAccuracyLocation:1];
    uint64_t v4 = [(RTPointOfInterestMonitor *)self defaultsManager];
    id v5 = [v4 objectForKey:@"InstantPOIHighAccuracyLocationRequestCount"];
    uint64_t v6 = [v5 unsignedIntValue];

    uint64_t v7 = [(RTPointOfInterestMonitor *)self defaultsManager];
    double v8 = [NSNumber numberWithUnsignedInteger:v6 + 1];
    [v7 setObject:v8 forKey:@"InstantPOIHighAccuracyLocationRequestCount"];

    unint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v29 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, start high accuracy location request", buf, 0xCu);
    }
    __int16 v11 = [(RTPointOfInterestMonitor *)self locationManager];
    __int16 v12 = +[RTNotification notificationName];
    [v11 addObserver:self selector:sel__onNoOpLocationNotification_ name:v12];

    uint64_t v13 = [(RTPointOfInterestMonitor *)self timerManager];
    __int16 v14 = NSString;
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 stringWithFormat:@"%@.locationRequestTimer", v16];
    uint64_t v18 = [(RTNotifier *)self queue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__RTPointOfInterestMonitor__startHighAccuracyLocationRequest__block_invoke;
    v27[3] = &unk_1E6B91248;
    void v27[4] = self;
    v27[5] = a2;
    uint64_t v19 = [v13 timerWithIdentifier:v17 queue:v18 handler:v27];
    [(RTPointOfInterestMonitor *)self setLocationRequestTimer:v19];

    double v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v29 = v21;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, locationRequestTimer start", buf, 0xCu);
    }
    uint64_t v22 = [(RTPointOfInterestMonitor *)self locationRequestTimer];
    [v22 fireAfterDelay:60.0 interval:INFINITY leeway:1.0];

    __int16 v23 = [(RTPointOfInterestMonitor *)self locationRequestTimer];
    [v23 resume];

    id v24 = [MEMORY[0x1E4F1C9C8] now];
    double v25 = [(RTPointOfInterestMonitor *)self eventMetrics];
    [v25 setHighAccuracyLocationRequestStartDate:v24];

    CLLocationDegrees v26 = [(RTPointOfInterestMonitor *)self dailyMetrics];
    [v26 increaseCountForKey:@"InstantPOIMetricsHighAccuracyLocationRequestCount"];
  }
}

uint64_t __61__RTPointOfInterestMonitor__startHighAccuracyLocationRequest__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, locationRequestTimer expiry", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) locationRequestTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setLocationRequestTimer:0];
  return [*(id *)(a1 + 32) _stopHighAccuracyLocationRequest];
}

- (void)_stopHighAccuracyLocationRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(RTPointOfInterestMonitor *)self requestingHighAccuracyLocation])
  {
    [(RTPointOfInterestMonitor *)self setRequestingHighAccuracyLocation:0];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(a2);
      int v17 = 138412290;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, stop high accuracy location request", (uint8_t *)&v17, 0xCu);
    }
    int v6 = [(RTPointOfInterestMonitor *)self locationManager];
    uint64_t v7 = +[RTNotification notificationName];
    [v6 removeObserver:self fromNotification:v7];

    uint64_t v8 = [(RTPointOfInterestMonitor *)self eventMetrics];
    unint64_t v9 = [v8 highAccuracyLocationRequestStartDate];

    if (v9)
    {
      int v10 = [(RTPointOfInterestMonitor *)self eventMetrics];
      __int16 v11 = NSNumber;
      __int16 v12 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v13 = [(RTPointOfInterestMonitor *)self eventMetrics];
      __int16 v14 = [v13 highAccuracyLocationRequestStartDate];
      [v12 timeIntervalSinceDate:v14];
      uint64_t v16 = [v11 numberWithUnsignedInteger:vcvtad_u64_f64(v15)];
      [v10 setObject:v16 forKey:@"highAccuracyLocationRequestDuration"];
    }
  }
}

- (BOOL)_shouldMonitorLocation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v6 sinceDate:-300.0];
  uint64_t v8 = [(RTPointOfInterestMonitor *)self lastMonitoringDate];
  int v9 = [v8 isAfterDate:v7];

  if (v9)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = NSStringFromSelector(a2);
      __int16 v12 = [(RTPointOfInterestMonitor *)self lastMonitoringDate];
      uint64_t v13 = [v12 stringFromDate];
      __int16 v14 = [v6 stringFromDate];
      *(_DWORD *)buf = 138412802;
      long long v36 = v11;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, skip monitor location, last monitor date, %@, current date, %@", buf, 0x20u);
    }
    BOOL v15 = 0;
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v10 = [(RTPointOfInterestMonitor *)self monitoringLocationDenyList];
    uint64_t v16 = [v10 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      aSelector = a2;
      double v29 = v7;
      uint64_t v18 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v10);
          }
          double v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v21 = [(RTPointOfInterestMonitor *)self distanceCalculator];
          id v30 = 0;
          [v21 distanceFromLocation:v5 toLocation:v20 error:&v30];
          double v23 = v22;
          id v24 = v30;

          if (!v24 && v23 < 250.0)
          {
            double v25 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              CLLocationDegrees v26 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138413058;
              long long v36 = v26;
              __int16 v37 = 2112;
              id v38 = v5;
              __int16 v39 = 2112;
              id v40 = v20;
              __int16 v41 = 2048;
              double v42 = v23;
              _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, skip monitor location, current location, %@, denied location, %@, distance, %.2f", buf, 0x2Au);
            }
            BOOL v15 = 0;
            goto LABEL_18;
          }
        }
        uint64_t v17 = [v10 countByEnumeratingWithState:&v31 objects:v43 count:16];
        BOOL v15 = 1;
        if (v17) {
          continue;
        }
        break;
      }
LABEL_18:
      uint64_t v7 = v29;
    }
    else
    {
      BOOL v15 = 1;
    }
  }

  return v15;
}

- (BOOL)_startMonitoringLocation:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, start monitor location, %@", buf, 0x16u);
  }
  int v10 = [MEMORY[0x1E4F1C9C8] now];
  [(RTPointOfInterestMonitor *)self setLastMonitoringDate:v10];

  id v27 = 0;
  __int16 v11 = [(RTPointOfInterestMonitor *)self _regionMonitoringLocationsForLocation:v7 error:&v27];
  id v12 = v27;
  if (v12 || ![v11 count])
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      uint64_t v24 = [v11 count];
      *(_DWORD *)buf = 138412802;
      double v29 = v17;
      __int16 v30 = 2048;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v12;
      uint64_t v18 = "%@, monitor location count, %lu, error, %@";
      uint64_t v19 = v13;
      uint32_t v20 = 32;
      goto LABEL_17;
    }
  }
  else
  {
    id v26 = 0;
    [(RTPointOfInterestMonitor *)self _setupPolygonalRegionsForLocations:v11 error:&v26];
    id v16 = v26;
    if (!v16)
    {
      double v22 = [(RTPointOfInterestMonitor *)self defaultsManager];
      double v23 = [(RTPointOfInterestMonitor *)self lastMonitoringDate];
      [v22 setObject:v23 forKey:@"InstantPOILastFenceSetupDate"];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__RTPointOfInterestMonitor__startMonitoringLocation_error___block_invoke;
      v25[3] = &__block_descriptor_40_e27_v32__0__RTLocation_8Q16_B24l;
      v25[4] = a2;
      [v11 enumerateObjectsUsingBlock:v25];
      id v14 = 0;
      id v12 = 0;
      BOOL v15 = 1;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
    id v12 = v16;
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v12;
      uint64_t v18 = "%@, error, %@";
      uint64_t v19 = v13;
      uint32_t v20 = 22;
LABEL_17:
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
  }

  if (!a4)
  {
    BOOL v15 = 0;
    goto LABEL_13;
  }
  id v14 = v12;
  BOOL v15 = 0;
LABEL_7:
  *a4 = v14;
  id v12 = v14;
LABEL_13:

  return v15;
}

void __59__RTPointOfInterestMonitor__startMonitoringLocation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    int v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, region monitoring location idx, %lu, location, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_regionMonitoringLocationsForLocation:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(RTPointOfInterestMonitor *)self defaultsManager];
    int v8 = [v7 objectForKey:@"InstantPOIPowerMode"];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      if (a4) {
        *a4 = 0;
      }
      id v55 = v6;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    }
    else
    {
      uint64_t v14 = objc_opt_new();
      uint64_t v49 = 0;
      v50 = (id *)&v49;
      uint64_t v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__7;
      v53 = __Block_byref_object_dispose__7;
      id v54 = 0;
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      id v16 = [(RTPointOfInterestMonitor *)self appClipManager];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __72__RTPointOfInterestMonitor__regionMonitoringLocationsForLocation_error___block_invoke;
      v45[3] = &unk_1E6B91290;
      id v44 = v14;
      id v46 = v44;
      double v48 = &v49;
      uint64_t v17 = v15;
      v47 = v17;
      [v16 fetchNearbyAppClipLocationsFromLocation:v6 radius:10 limit:v45 handler:300.0];

      uint64_t v18 = v17;
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v20 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v18, v20)) {
        goto LABEL_14;
      }
      id v43 = [MEMORY[0x1E4F1C9C8] now];
      [v43 timeIntervalSinceDate:v19];
      double v22 = v21;
      double v23 = objc_opt_new();
      uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [v25 filteredArrayUsingPredicate:v24];
      id v27 = [v26 firstObject];

      [v23 submitToCoreAnalytics:v27 type:1 duration:v22];
      CLLocationCoordinate2D v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v58 count:1];
      uint64_t v31 = [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v30];

      if (v31)
      {
        id v32 = v31;
      }
      else
      {
LABEL_14:
        id v32 = 0;
      }

      id v33 = v32;
      if (v33) {
        objc_storeStrong(v50 + 5, v32);
      }
      if (!v50[5])
      {
        uint64_t v34 = [(RTPointOfInterestMonitor *)self eventMetrics];
        long long v35 = [NSNumber numberWithUnsignedInteger:[v44 count]];
        [v34 setObject:v35 forKey:@"nearbyAppClipCount"];

        long long v36 = [(RTPointOfInterestMonitor *)self eventMetrics];
        [v36 calculateMinimumDistanceFromLocation:v6 toLocations:v44];
        double v38 = v37;

        if (v38 != 1.79769313e308)
        {
          __int16 v39 = [(RTPointOfInterestMonitor *)self eventMetrics];
          id v40 = [NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(v38)];
          [v39 setObject:v40 forKey:@"distanceFromArrivalLocationToClosestAppClipLocation"];
        }
      }
      if (_os_feature_enabled_impl() && ![v44 count]) {
        [v44 addObject:v6];
      }
      if (a4) {
        *a4 = v50[5];
      }
      __int16 v41 = v47;
      id v10 = v44;

      _Block_object_dispose(&v49, 8);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    double v57 = @"location cannot be nil";
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    id v13 = [v11 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];

    if (a4) {
      *a4 = v13;
    }

    id v10 = 0;
  }

  return v10;
}

void __72__RTPointOfInterestMonitor__regionMonitoringLocationsForLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!v5 && [v9 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v9];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_exceedPowerBudget
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(RTPointOfInterestMonitor *)self defaultsManager];
  id v5 = [v4 objectForKey:@"InstantPOIPowerMode"];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v8 = [(RTPointOfInterestMonitor *)self defaultsManager];
    id v9 = [v8 objectForKey:@"InstantPOILastPowerBudgetResetDate"];

    id v10 = [(RTPointOfInterestMonitor *)self defaultsManager];
    uint64_t v11 = [v10 objectForKey:@"InstantPOIHighAccuracyLocationRequestCount"];
    uint64_t v12 = [v11 unsignedIntValue];

    if (v9
      && ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v9 isBeforeDate:v13],
          v13,
          !v14))
    {
      BOOL v7 = v12 > 1;
    }
    else
    {
      dispatch_semaphore_t v15 = [(RTPointOfInterestMonitor *)self defaultsManager];
      id v16 = [MEMORY[0x1E4F1C9C8] date];
      [v15 setObject:v16 forKey:@"InstantPOILastPowerBudgetResetDate"];

      uint64_t v17 = [(RTPointOfInterestMonitor *)self defaultsManager];
      [v17 setObject:&unk_1F344F8E0 forKey:@"InstantPOIHighAccuracyLocationRequestCount"];

      BOOL v7 = 0;
    }
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = NSStringFromSelector(a2);
      uint64_t v20 = [v9 stringFromDate];
      double v21 = (void *)v20;
      double v22 = @"NO";
      int v24 = 138413058;
      __int16 v26 = 2048;
      double v25 = v19;
      if (v7) {
        double v22 = @"YES";
      }
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, high accuracy request count, %lu, last power budget reset date, %@, exceed power budget, %@", (uint8_t *)&v24, 0x2Au);
    }
  }
  return v7;
}

- (BOOL)_shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:(id)a3
{
  aSelector = a2;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  BOOL v4 = [(RTPointOfInterestMonitor *)self _exceedPowerBudget];
  v53 = self;
  id v5 = [(RTPointOfInterestMonitor *)self eventMetrics];
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setObject:v6 forKey:@"exceedDailyPowerBudget"];

  if ([v47 count]) {
    int v7 = v4;
  }
  else {
    int v7 = 1;
  }
  if (v7 == 1)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = NSStringFromSelector(aSelector);
      uint64_t v10 = [v47 count];
      uint64_t v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v9;
      if (v4) {
        uint64_t v11 = @"YES";
      }
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v74 = (uint64_t (*)(uint64_t, uint64_t))v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, should request high accuracy locations, NO, location count, %lu, exceed power budget, %@", buf, 0x20u);
    }
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v64 = 0;
    id v65 = &v64;
    uint64_t v66 = 0x2020000000;
    char v67 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__7;
    id v75 = __Block_byref_object_dispose__7;
    id v76 = 0;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v47;
    uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
    id v14 = 0;
    id v8 = 0;
    if (v13)
    {
      uint64_t v52 = *(void *)v61;
      uint64_t v48 = *MEMORY[0x1E4F5CFE8];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      while (2)
      {
        uint64_t v51 = v13;
        uint64_t v15 = 0;
        id v16 = v14;
        do
        {
          if (*(void *)v61 != v52) {
            objc_enumerationMutation(obj);
          }
          id v55 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:*(void *)(*((void *)&v60 + 1) + 8 * v15), aSelector];
          id v17 = objc_alloc(MEMORY[0x1E4F5CE78]);
          uint64_t v71 = v55;
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
          id v54 = (void *)[v17 initWithFidelityPolicy:0 locations:v18 accessPoints:MEMORY[0x1E4F1CBF0] clientIdentifier:@"com.apple.CoreRoutine.instantPOI"];

          dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
          uint64_t v20 = [(RTPointOfInterestMonitor *)v53 visitLabeler];
          double v21 = [v20 placeInferenceManager];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __92__RTPointOfInterestMonitor__shouldRequestHighAccuracyLocationsForMonitoringRegionLocations___block_invoke;
          v56[3] = &unk_1E6B905F0;
          uint64_t v58 = buf;
          id v59 = &v64;
          double v22 = v19;
          double v57 = v22;
          [v21 fetchPlaceInferencesForOptions:v54 handler:v56];

          id v8 = v22;
          double v23 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v24 = dispatch_time(0, 3600000000000);
          id v25 = v16;
          if (dispatch_semaphore_wait(v8, v24))
          {
            __int16 v26 = [MEMORY[0x1E4F1C9C8] now];
            [v26 timeIntervalSinceDate:v23];
            double v28 = v27;
            uint64_t v29 = objc_opt_new();
            __int16 v30 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
            uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v32 = [v31 filteredArrayUsingPredicate:v30];
            id v33 = [v32 firstObject];

            [v29 submitToCoreAnalytics:v33 type:1 duration:v28];
            uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)id v68 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v68, 2u);
            }

            long long v35 = (void *)MEMORY[0x1E4F28C58];
            v77[0] = v49;
            *(void *)id v68 = @"semaphore wait timeout";
            long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v77 count:1];
            double v37 = [v35 errorWithDomain:v48 code:15 userInfo:v36];

            id v25 = v16;
            if (v37)
            {
              id v25 = v37;
            }
          }

          id v14 = v25;
          if (v14) {
            objc_storeStrong((id *)(*(void *)&buf[8] + 40), v25);
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {

            goto LABEL_28;
          }
          BOOL v38 = *((unsigned char *)v65 + 24) == 0;

          if (!v38) {
            goto LABEL_28;
          }
          ++v15;
          id v16 = v14;
        }
        while (v51 != v15);
        uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    __int16 v39 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = NSStringFromSelector(aSelector);
      __int16 v41 = (void *)v40;
      if (*((unsigned char *)v65 + 24)) {
        double v42 = @"YES";
      }
      else {
        double v42 = @"NO";
      }
      *(_DWORD *)id v68 = 138412546;
      *(void *)&v68[4] = v40;
      __int16 v69 = 2112;
      id v70 = v42;
      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, should request high accuracy locations, %@", v68, 0x16u);
    }
    id v43 = [(RTPointOfInterestMonitor *)v53 eventMetrics];
    id v44 = [NSNumber numberWithBool:*((unsigned __int8 *)v65 + 24)];
    [v43 setObject:v44 forKey:@"shouldRequestGPS"];

    BOOL v12 = *((unsigned char *)v65 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v64, 8);
  }

  return v12;
}

void __92__RTPointOfInterestMonitor__shouldRequestHighAccuracyLocationsForMonitoringRegionLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else if (![a2 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_setupPolygonalRegionsForLocations:(id)a3 error:(id *)a4
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  if ([v71 count])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v94 = 0;
    uint64_t v95 = &v94;
    uint64_t v96 = 0x3032000000;
    id v97 = __Block_byref_object_copy__7;
    uint64_t v98 = __Block_byref_object_dispose__7;
    id v99 = 0;
    uint64_t v88 = 0;
    v89 = (id *)&v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__7;
    id v92 = __Block_byref_object_dispose__7;
    id v93 = 0;
    id v76 = self;
    int v7 = [(RTPointOfInterestMonitor *)self buildingPolygonManager];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke;
    v84[3] = &unk_1E6B905F0;
    v86 = &v94;
    v87 = &v88;
    id v8 = v6;
    v85 = v8;
    [v7 fetchClosestBuildingPolygonsFromLocations:v71 radius:10 limit:v84 handler:200.0];

    dsema = v8;
    id v9 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v10)) {
      goto LABEL_7;
    }
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    id v14 = objc_opt_new();
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
    id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v17 = [v16 filteredArrayUsingPredicate:v15];
    uint64_t v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    dispatch_semaphore_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    v110[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v110 count:1];
    double v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22)
    {
      id v23 = v22;
    }
    else
    {
LABEL_7:
      id v23 = 0;
    }

    oslog = v23;
    if (oslog) {
      objc_storeStrong(v89 + 5, v23);
    }
    id v24 = v89[5];
    BOOL v69 = v24 == 0;
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
    }
    else
    {
      id v25 = [(RTPointOfInterestMonitor *)v76 eventMetrics];
      __int16 v26 = [NSNumber numberWithUnsignedInteger:[v95[5] count]];
      [v25 setObject:v26 forKey:@"buildingFenceCount"];

      double v27 = [(RTPointOfInterestMonitor *)v76 eventMetrics];
      [v27 saveBuildingPolygons:v95[5]];

      double v28 = [(RTPointOfInterestMonitor *)v76 eventMetrics];
      [v28 updateBuildingPolygonMetricsForRegionIdentifer:@"POIEntry-0"];

      uint64_t v29 = [(RTPointOfInterestMonitor *)v76 dailyMetrics];
      [v29 increaseCountForKey:@"InstantPOIMetricsBuildingFenceSetupCount"];

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = (id)v95[5];
      uint64_t v30 = [obj countByEnumeratingWithState:&v80 objects:v109 count:16];
      if (v30)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v75 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v81 != v75) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            long long v35 = [NSString stringWithFormat:@"%@-%lu", @"POIEntry", v32 + i];
            long long v36 = [(RTPointOfInterestMonitor *)v76 _polygonalRegionWithRegionIdentifier:v35 polygon:v34];

            double v37 = [(RTPointOfInterestMonitor *)v76 locationManager];
            regionMonitoringClientIdentifer = v76->_regionMonitoringClientIdentifer;
            id v79 = 0;
            [v37 startMonitoringForRegion:v36 clientIdentifier:regionMonitoringClientIdentifer error:&v79];
            id v39 = v79;

            uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              id v41 = (id)objc_claimAutoreleasedReturnValue();
              double v42 = v76->_regionMonitoringClientIdentifer;
              id v43 = [v34 centroid];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v41;
              __int16 v101 = 2112;
              v102 = v42;
              __int16 v103 = 2112;
              id v104 = v36;
              __int16 v105 = 2112;
              id v106 = v43;
              __int16 v107 = 2112;
              id v108 = v39;
              _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, polygon centroid, %@, error, %@", buf, 0x34u);
            }
            if (!v39) {
              ++v31;
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v80 objects:v109 count:16];
          v32 += i;
        }
        while (v30);

        if (v31)
        {
          id v44 = NSString;
          uint64_t v45 = (objc_class *)objc_opt_class();
          id v46 = NSStringFromClass(v45);
          id v47 = [v44 stringWithFormat:@"%@.regionMonitorTimer", v46];

          uint64_t v48 = [(RTPointOfInterestMonitor *)v76 timerManager];
          uint64_t v49 = [(RTNotifier *)v76 queue];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_121;
          v78[3] = &unk_1E6B91248;
          v78[4] = v76;
          v78[5] = a2;
          v50 = [v48 timerWithIdentifier:v47 queue:v49 handler:v78];
          [(RTPointOfInterestMonitor *)v76 setRegionMonitorTimer:v50];

          uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            uint64_t v52 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "%@, regionMonitorTimer start", buf, 0xCu);
          }
          v53 = [(RTPointOfInterestMonitor *)v76 regionMonitorTimer];
          [v53 fireAfterDelay:1800.0 interval:INFINITY leeway:60.0];

          id v54 = [(RTPointOfInterestMonitor *)v76 regionMonitorTimer];
          [v54 resume];

          if ([(RTPointOfInterestMonitor *)v76 _shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:v71])
          {
            id v55 = [(RTPointOfInterestMonitor *)v76 timerManager];
            uint64_t v56 = NSString;
            double v57 = (objc_class *)objc_opt_class();
            uint64_t v58 = NSStringFromClass(v57);
            id v59 = [v56 stringWithFormat:@"%@.locationRequestTimer", v58];
            long long v60 = [(RTNotifier *)v76 queue];
            v77[0] = MEMORY[0x1E4F143A8];
            v77[1] = 3221225472;
            v77[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_122;
            v77[3] = &unk_1E6B91248;
            void v77[4] = v76;
            v77[5] = a2;
            long long v61 = [v55 timerWithIdentifier:v59 queue:v60 handler:v77];
            [(RTPointOfInterestMonitor *)v76 setLocationRequestTimer:v61];

            long long v62 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              long long v63 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v63;
              _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "%@, locationRequestTimer start", buf, 0xCu);
            }
            uint64_t v64 = [(RTPointOfInterestMonitor *)v76 locationRequestTimer];
            [v64 fireAfterDelay:60.0 interval:INFINITY leeway:1.0];

            id v65 = [(RTPointOfInterestMonitor *)v76 locationRequestTimer];
            [v65 resume];

            uint64_t v66 = [MEMORY[0x1E4F1C9C8] now];
            char v67 = [(RTPointOfInterestMonitor *)v76 eventMetrics];
            [v67 setLocationRequestTimerStartDate:v66];
          }
        }
      }
      else
      {
      }
    }

    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(&v94, 8);
  }
  else
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count>0", buf, 2u);
    }
    BOOL v69 = 0;
  }

  return v69;
}

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_121(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    double v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, regionMonitorTimer expiry", buf, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) regionMonitorTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setRegionMonitorTimer:0];
  id v5 = [*(id *)(a1 + 32) locationRequestTimer];
  [v5 invalidate];

  [*(id *)(a1 + 32) setLocationRequestTimer:0];
  id v6 = [*(id *)(a1 + 32) locationManager];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 168);
  id v11 = 0;
  [v6 stopMonitoringAllRegionsForClientIdentifier:v7 error:&v11];
  id v8 = v11;

  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      double v13 = v10;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, failed to stop monitoring all regions, error, %@", buf, 0x16u);
    }
  }
}

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_122(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v12 = 138412290;
    double v13 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, locationRequestTimer expiry", (uint8_t *)&v12, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) locationRequestTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setLocationRequestTimer:0];
  [*(id *)(a1 + 32) _startHighAccuracyLocationRequest];
  id v5 = [*(id *)(a1 + 32) eventMetrics];
  id v6 = NSNumber;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = [*(id *)(a1 + 32) eventMetrics];
  uint64_t v9 = [v8 locationRequestTimerStartDate];
  [v7 timeIntervalSinceDate:v9];
  id v11 = [v6 numberWithUnsignedInteger:vcvtad_u64_f64(v10)];
  [v5 setObject:v11 forKey:@"highAccuracyLocationRequestLatency"];
}

- (void)_startEventMetricsSubmissionTimer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(RTPointOfInterestMonitor *)self metricsSubmissionTimer];

  if (v4)
  {
    id v5 = [(RTPointOfInterestMonitor *)self metricsSubmissionTimer];
    [v5 invalidate];

    [(RTPointOfInterestMonitor *)self setMetricsSubmissionTimer:0];
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v21 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, stop running metricsSubmissionTimer", buf, 0xCu);
    }
  }
  id v8 = [(RTPointOfInterestMonitor *)self timerManager];
  uint64_t v9 = NSString;
  double v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  int v12 = [v9 stringWithFormat:@"%@.metricsSubmissionTimer", v11];
  double v13 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__RTPointOfInterestMonitor__startEventMetricsSubmissionTimer__block_invoke;
  v19[3] = &unk_1E6B91248;
  v19[4] = self;
  v19[5] = a2;
  uint64_t v14 = [v8 timerWithIdentifier:v12 queue:v13 handler:v19];
  [(RTPointOfInterestMonitor *)self setMetricsSubmissionTimer:v14];

  id v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    double v21 = v16;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, start metricsSubmissionTimer", buf, 0xCu);
  }
  id v17 = [(RTPointOfInterestMonitor *)self metricsSubmissionTimer];
  [v17 fireAfterDelay:1800.0 interval:INFINITY leeway:60.0];

  uint64_t v18 = [(RTPointOfInterestMonitor *)self metricsSubmissionTimer];
  [v18 resume];
}

void __61__RTPointOfInterestMonitor__startEventMetricsSubmissionTimer__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, metricsSubmissionTimer expiry", (uint8_t *)&v6, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) metricsSubmissionTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setMetricsSubmissionTimer:0];
  id v5 = [*(id *)(a1 + 32) eventMetrics];
  [v5 submit];
}

- (void)_onNavigationNotification:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = v5;
    double v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = NSStringFromSelector(a2);
      int v12 = (const char *)(int)[v9 state];
      double v13 = [(RTPointOfInterestMonitor *)self navigationDestination];
      *(_DWORD *)buf = 138412802;
      id v49 = v11;
      __int16 v50 = 2048;
      uint64_t v51 = v12;
      __int16 v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, received navigation state, %lu, destination, %@", buf, 0x20u);
    }
    if ([v9 state] == 6)
    {
      uint64_t v14 = [(RTPointOfInterestMonitor *)self navigationDestination];
      if (v14)
      {
        id v15 = (void *)v14;
        uint64_t v16 = [(RTPointOfInterestMonitor *)self navigationDestination];
        BOOL v17 = [(RTPointOfInterestMonitor *)self _shouldMonitorLocation:v16];

        if (v17)
        {
          uint64_t v18 = [(RTPointOfInterestMonitor *)self eventMetrics];
          [v18 reset];

          dispatch_semaphore_t v19 = [(RTPointOfInterestMonitor *)self eventMetrics];
          [v19 setObject:&unk_1F344F8F8 forKey:@"arrivalEvent"];

          uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
          double v21 = [(RTPointOfInterestMonitor *)self eventMetrics];
          [v21 setArrivalEventDate:v20];

          uint64_t v22 = [(RTPointOfInterestMonitor *)self navigationDestination];
          id v23 = [(RTPointOfInterestMonitor *)self eventMetrics];
          [v23 setArrivalEventLocation:v22];

          [(RTPointOfInterestMonitor *)self _startEventMetricsSubmissionTimer];
          id v24 = [(RTPointOfInterestMonitor *)self regionMonitorTimer];
          [v24 invalidate];

          [(RTPointOfInterestMonitor *)self setRegionMonitorTimer:0];
          id v25 = [(RTPointOfInterestMonitor *)self locationRequestTimer];
          [v25 invalidate];

          [(RTPointOfInterestMonitor *)self setLocationRequestTimer:0];
          __int16 v26 = [(RTPointOfInterestMonitor *)self locationManager];
          regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
          id v47 = 0;
          [v26 stopMonitoringAllRegionsForClientIdentifier:regionMonitoringClientIdentifer error:&v47];
          double v28 = v47;

          if (v28)
          {
            uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
LABEL_17:

LABEL_18:
              goto LABEL_19;
            }
            uint64_t v30 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            id v49 = v30;
            __int16 v50 = 2112;
            uint64_t v51 = (const char *)v28;
            _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, failed to stop monitoring all regions, error, %@", buf, 0x16u);
          }
          else
          {
            id v43 = [(RTPointOfInterestMonitor *)self navigationDestination];
            id v46 = 0;
            [(RTPointOfInterestMonitor *)self _startMonitoringLocation:v43 error:&v46];
            double v28 = v46;

            if (!v28)
            {
              id v44 = [(RTPointOfInterestMonitor *)self dailyMetrics];
              [v44 increaseCountForKey:@"InstantPOIMetricsArrivalEventCount"];

              goto LABEL_19;
            }
            uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              goto LABEL_17;
            }
            uint64_t v30 = NSStringFromSelector(a2);
            uint64_t v45 = [(RTPointOfInterestMonitor *)self navigationDestination];
            *(_DWORD *)buf = 138412802;
            id v49 = v30;
            __int16 v50 = 2112;
            uint64_t v51 = v45;
            __int16 v52 = 2112;
            v53 = v28;
            _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, failed to monitor location, %@, error, %@", buf, 0x20u);
          }
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    uint64_t v31 = [v5 name];
    uint64_t v32 = +[RTNotification notificationName];
    int v33 = [v31 isEqualToString:v32];

    if (v33)
    {
      uint64_t v9 = v5;
      id v34 = objc_alloc(MEMORY[0x1E4F5CE00]);
      [v9 destinationLatitude];
      double v36 = v35;
      [v9 destinationLongitude];
      double v38 = v37;
      id v39 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v40 = (void *)[v34 initWithLatitude:v39 longitude:v36 horizontalUncertainty:v38 date:0.0];
      [(RTPointOfInterestMonitor *)self setNavigationDestination:v40];

      double v28 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v41 = NSStringFromSelector(a2);
        double v42 = [(RTPointOfInterestMonitor *)self navigationDestination];
        *(_DWORD *)buf = 138412546;
        id v49 = v41;
        __int16 v50 = 2112;
        uint64_t v51 = v42;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, received navigation destination, %@", buf, 0x16u);
      }
      goto LABEL_18;
    }
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v49 = v5;
      __int16 v50 = 2080;
      uint64_t v51 = "-[RTPointOfInterestMonitor _onNavigationNotification:]";
      __int16 v52 = 1024;
      LODWORD(v53) = 1056;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
LABEL_19:
}

- (void)onNavigationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTPointOfInterestMonitor_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__RTPointOfInterestMonitor_onNavigationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNavigationNotification:*(void *)(a1 + 40)];
}

- (void)_onVehicleEventNotification:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = v5;
    double v10 = [v9 vehicleEvents];
    id v11 = [v10 objectAtIndexedSubscript:0];
    int v12 = [v11 location];

    double v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v34 = v14;
      __int16 v35 = 2112;
      double v36 = v12;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, received vehicle location, %@", buf, 0x16u);
    }
    if (!v12 || ![(RTPointOfInterestMonitor *)self _shouldMonitorLocation:v12]) {
      goto LABEL_15;
    }
    id v15 = [(RTPointOfInterestMonitor *)self eventMetrics];
    [v15 reset];

    uint64_t v16 = [(RTPointOfInterestMonitor *)self eventMetrics];
    [v16 setObject:&unk_1F344F910 forKey:@"arrivalEvent"];

    BOOL v17 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v18 = [(RTPointOfInterestMonitor *)self eventMetrics];
    [v18 setArrivalEventDate:v17];

    dispatch_semaphore_t v19 = [(RTPointOfInterestMonitor *)self eventMetrics];
    [v19 setArrivalEventLocation:v12];

    [(RTPointOfInterestMonitor *)self _startEventMetricsSubmissionTimer];
    uint64_t v20 = [(RTPointOfInterestMonitor *)self regionMonitorTimer];
    [v20 invalidate];

    [(RTPointOfInterestMonitor *)self setRegionMonitorTimer:0];
    double v21 = [(RTPointOfInterestMonitor *)self locationRequestTimer];
    [v21 invalidate];

    [(RTPointOfInterestMonitor *)self setLocationRequestTimer:0];
    uint64_t v22 = [(RTPointOfInterestMonitor *)self locationManager];
    regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
    id v32 = 0;
    [v22 stopMonitoringAllRegionsForClientIdentifier:regionMonitoringClientIdentifer error:&v32];
    id v24 = (char *)v32;

    if (v24)
    {
      id v25 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v34 = v26;
        __int16 v35 = 2112;
        double v36 = v24;
        double v27 = "%@, failed to stop monitoring all regions, error, %@";
        double v28 = v25;
        uint32_t v29 = 22;
LABEL_19:
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
      }
    }
    else
    {
      id v31 = 0;
      [(RTPointOfInterestMonitor *)self _startMonitoringLocation:v12 error:&v31];
      uint64_t v30 = (char *)v31;
      if (!v30)
      {
        id v24 = [(RTPointOfInterestMonitor *)self dailyMetrics];
        [v24 increaseCountForKey:@"InstantPOIMetricsArrivalEventCount"];
        goto LABEL_14;
      }
      id v24 = v30;
      id v25 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v34 = v26;
        __int16 v35 = 2112;
        double v36 = v12;
        __int16 v37 = 2112;
        double v38 = v24;
        double v27 = "%@, failed to monitor location, %@, error, %@";
        double v28 = v25;
        uint32_t v29 = 32;
        goto LABEL_19;
      }
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v5;
    __int16 v35 = 2080;
    double v36 = "-[RTPointOfInterestMonitor _onVehicleEventNotification:]";
    __int16 v37 = 1024;
    LODWORD(v38) = 1112;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_16:
}

- (void)onVehicleEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTPointOfInterestMonitor_onVehicleEventNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTPointOfInterestMonitor_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleEventNotification:*(void *)(a1 + 40)];
}

- (void)_onActivityAlarmNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = v5;
    if ([v9 trigger] == 10)
    {
      double v10 = [(RTPointOfInterestMonitor *)self locationManager];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke;
      v11[3] = &unk_1E6B912B8;
      v11[4] = self;
      SEL v13 = a2;
      uint64_t v9 = v9;
      int v12 = v9;
      [v10 fetchCurrentLocationWithHandler:v11];
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2080;
      BOOL v17 = "-[RTPointOfInterestMonitor _onActivityAlarmNotification:]";
      __int16 v18 = 1024;
      int v19 = 1179;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

void __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke_2;
  block[3] = &unk_1E6B90F80;
  int v8 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  id v13 = v8;
  id v14 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v4 = +[RTMotionActivityManager activityAlarmTriggerToString:](RTMotionActivityManager, "activityAlarmTriggerToString:", [*(id *)(a1 + 32) trigger]);
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    double v28 = v3;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    id v32 = v5;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, received motion alarm, %@, location, %@, error, %@", buf, 0x2Au);
  }
  if (!*(void *)(a1 + 48))
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:*(void *)(a1 + 40)];
    if (!v7 || ![*(id *)(a1 + 56) _shouldMonitorLocation:v7]) {
      goto LABEL_13;
    }
    int v8 = [*(id *)(a1 + 56) eventMetrics];
    [v8 reset];

    uint64_t v9 = [*(id *)(a1 + 56) eventMetrics];
    [v9 setObject:&unk_1F344F928 forKey:@"arrivalEvent"];

    id v10 = [MEMORY[0x1E4F1C9C8] now];
    id v11 = [*(id *)(a1 + 56) eventMetrics];
    [v11 setArrivalEventDate:v10];

    int v12 = [*(id *)(a1 + 56) eventMetrics];
    [v12 setArrivalEventLocation:v7];

    [*(id *)(a1 + 56) _startEventMetricsSubmissionTimer];
    id v13 = [*(id *)(a1 + 56) regionMonitorTimer];
    [v13 invalidate];

    [*(id *)(a1 + 56) setRegionMonitorTimer:0];
    id v14 = [*(id *)(a1 + 56) locationRequestTimer];
    [v14 invalidate];

    [*(id *)(a1 + 56) setLocationRequestTimer:0];
    id v15 = [*(id *)(a1 + 56) locationManager];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 168);
    id v26 = 0;
    [v15 stopMonitoringAllRegionsForClientIdentifier:v16 error:&v26];
    id v17 = v26;

    if (v17)
    {
      __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        double v28 = v19;
        __int16 v29 = 2112;
        id v30 = v17;
        uint64_t v20 = "%@, failed to stop monitoring all regions, error, %@";
        double v21 = v18;
        uint32_t v22 = 22;
LABEL_17:
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
      }
    }
    else
    {
      id v23 = *(void **)(a1 + 56);
      id v25 = 0;
      [v23 _startMonitoringLocation:v7 error:&v25];
      id v24 = v25;
      if (!v24)
      {
        id v17 = [*(id *)(a1 + 56) dailyMetrics];
        [v17 increaseCountForKey:@"InstantPOIMetricsArrivalEventCount"];
        goto LABEL_12;
      }
      id v17 = v24;
      __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412802;
        double v28 = v19;
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v17;
        uint64_t v20 = "%@, failed to monitor location, %@, error, %@";
        double v21 = v18;
        uint32_t v22 = 32;
        goto LABEL_17;
      }
    }

LABEL_12:
LABEL_13:
  }
}

- (void)onActivityAlarmNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__RTPointOfInterestMonitor_onActivityAlarmNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__RTPointOfInterestMonitor_onActivityAlarmNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onActivityAlarmNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = v5;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = NSStringFromSelector(a2);
      int v12 = [v9 available];
      id v13 = @"NO";
      if (v12) {
        id v13 = @"YES";
      }
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = (const char *)v13;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, learnedLocationManager available, %@", (uint8_t *)&v14, 0x16u);
    }
    if ([v9 available]) {
      [(RTPointOfInterestMonitor *)self _updateMonitoringLocationDenyList];
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v5;
      __int16 v16 = 2080;
      id v17 = "-[RTPointOfInterestMonitor _onLearnedLocationManagerNotification:]";
      __int16 v18 = 1024;
      int v19 = 1204;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTPointOfInterestMonitor_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__RTPointOfInterestMonitor_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(RTPointOfInterestMonitor *)self dailyMetrics];
  [v8 submit];
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTPointOfInterestMonitor_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTPointOfInterestMonitor_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = NSStringFromSelector(a2);
      int v10 = 138412546;
      __int16 v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = NSStringFromSelector(a2);
      int v10 = 138412546;
      __int16 v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)requestingHighAccuracyLocation
{
  return self->_requestingHighAccuracyLocation;
}

- (void)setRequestingHighAccuracyLocation:(BOOL)a3
{
  self->_requestingHighAccuracyLocation = a3;
}

- (BOOL)registeredForRegionEvents
{
  return self->_registeredForRegionEvents;
}

- (void)setRegisteredForRegionEvents:(BOOL)a3
{
  self->_registeredForRegionEvents = a3;
}

- (RTAppClipManager)appClipManager
{
  return self->_appClipManager;
}

- (void)setAppClipManager:(id)a3
{
}

- (RTBuildingPolygonManager)buildingPolygonManager
{
  return self->_buildingPolygonManager;
}

- (void)setBuildingPolygonManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTPointOfInterestMonitorDailyMetrics)dailyMetrics
{
  return self->_dailyMetrics;
}

- (void)setDailyMetrics:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTPointOfInterestMonitorEventMetrics)eventMetrics
{
  return self->_eventMetrics;
}

- (void)setEventMetrics:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (NSDate)lastMonitoringDate
{
  return self->_lastMonitoringDate;
}

- (void)setLastMonitoringDate:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTTimer)locationRequestTimer
{
  return self->_locationRequestTimer;
}

- (void)setLocationRequestTimer:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTTimer)metricsSubmissionTimer
{
  return self->_metricsSubmissionTimer;
}

- (void)setMetricsSubmissionTimer:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTLocation)navigationDestination
{
  return self->_navigationDestination;
}

- (void)setNavigationDestination:(id)a3
{
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)regionMonitoringClientIdentifer
{
  return self->_regionMonitoringClientIdentifer;
}

- (void)setRegionMonitoringClientIdentifer:(id)a3
{
}

- (RTTimer)regionMonitorTimer
{
  return self->_regionMonitorTimer;
}

- (void)setRegionMonitorTimer:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (void)setVisitLabeler:(id)a3
{
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setVisitStore:(id)a3
{
}

- (NSMutableArray)monitoringLocationDenyList
{
  return self->_monitoringLocationDenyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringLocationDenyList, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_regionMonitorTimer, 0);
  objc_storeStrong((id *)&self->_regionMonitoringClientIdentifer, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_navigationDestination, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricsSubmissionTimer, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationRequestTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastMonitoringDate, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventMetrics, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);

  objc_storeStrong((id *)&self->_appClipManager, 0);
}

@end