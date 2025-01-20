@interface RTVisitManager
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (BOOL)findingPointOfInterest;
- (BOOL)pointOfInterestUpdateEnabled;
- (BOOL)shouldFindPointOfInterestForVisit:(id)a3;
- (BOOL)spoofMode;
- (NSMutableArray)spoofVisitIncidentTokens;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTHintManager)hintManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationAwarenessManager)locationAwarenessManager;
- (RTLocationManager)locationManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTPointOfInterestMonitor)pointOfInterestMonitor;
- (RTVisit)lastHighConfidenceVisit;
- (RTVisitLabeler)visitLabeler;
- (RTVisitManager)init;
- (RTVisitManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 pointOfInterestMonitor:(id)a12 visitLabeler:(id)a13 visitStore:(id)a14 xpcActivityManager:(id)a15;
- (RTVisitMonitor)visitMonitor;
- (RTVisitStore)visitStore;
- (RTXPCActivityManager)xpcActivityManager;
- (id)registerForSpoofVisitIncidentOfCategory:(id)a3;
- (void)_fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5;
- (void)_injectRealtimeVisit:(id)a3 handler:(id)a4;
- (void)_onLowConfidenceVisitIncident:(id)a3 error:(id)a4;
- (void)_onPointOfInterestVisitNotification:(id)a3;
- (void)_onVisitIncident:(id)a3 error:(id)a4;
- (void)_onVisitStoreNotification:(id)a3;
- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)_registerXpcActivityFindPointOfInterest;
- (void)_setup;
- (void)_setupVisitMonitorWithHandler:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_simulateVisit:(id)a3 handler:(id)a4;
- (void)_unregisterXpcActivityFindPointOfInterest;
- (void)_updateStateForLeechedVisitIncidents;
- (void)_updateStateForLowConfidenceVisitIncidents;
- (void)_updateStateForVisitIncidents;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5;
- (void)injectRealtimeVisit:(id)a3 handler:(id)a4;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onLowConfidenceVisitIncident:(id)a3 error:(id)a4;
- (void)onPointOfInterestVisitNotification:(id)a3;
- (void)onVisitIncident:(id)a3 error:(id)a4;
- (void)onVisitStoreNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setFindingPointOfInterest:(BOOL)a3;
- (void)setHintManager:(id)a3;
- (void)setLastHighConfidenceVisit:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationAwarenessManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPointOfInterestMonitor:(id)a3;
- (void)setPointOfInterestUpdateEnabled:(BOOL)a3;
- (void)setSpoofMode:(BOOL)a3;
- (void)setSpoofVisitIncidentTokens:(id)a3;
- (void)setVisitMonitor:(id)a3;
- (void)setVisitStore:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)simulateVisit:(id)a3 handler:(id)a4;
- (void)unregisterForSpoofVisitIncidentWithToken:(int)a3;
@end

@implementation RTVisitManager

+ (id)vendedClasses
{
  v2 = (void *)vendedClasses_vendedClasses_3;
  if (!vendedClasses_vendedClasses_3)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), 0];
    v4 = (void *)vendedClasses_vendedClasses_3;
    vendedClasses_vendedClasses_3 = v3;

    v2 = (void *)vendedClasses_vendedClasses_3;
  }

  return v2;
}

- (RTVisitManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_deviceLocationPredictor_hintManager_learnedLocationManager_locationAwarenessManager_locationManager_metricManager_motionActivityManager_platform_pointOfInterestMonitor_visitLabeler_visitStore_xpcActivityManager_);
}

- (RTVisitManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 pointOfInterestMonitor:(id)a12 visitLabeler:(id)a13 visitStore:(id)a14 xpcActivityManager:(id)a15
{
  id v53 = a3;
  id v40 = a4;
  id v20 = a4;
  id v47 = a5;
  id v41 = a6;
  id v46 = a6;
  id v42 = a7;
  id v45 = a7;
  id v43 = a8;
  id v44 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v52 = a12;
  id v51 = a13;
  id v50 = a14;
  id v24 = a15;
  v48 = v24;
  if (!v53)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v32 = 0;
    v34 = 0;
    v25 = v20;
    v26 = v46;
    v27 = v47;
    v29 = v44;
    v28 = v45;
    goto LABEL_45;
  }
  v25 = v20;
  if (!v20)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = v46;
    v27 = v47;
    v29 = v44;
    v28 = v45;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: deviceLocationPredictor";
LABEL_42:
    _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_43;
  }
  v26 = v46;
  v27 = v47;
  v29 = v44;
  v28 = v45;
  if (!v47)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_42;
  }
  if (!v46)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_42;
  }
  if (!v45)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: locationAwarenessManager";
    goto LABEL_42;
  }
  if (!v44)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_42;
  }
  if (!v21)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_42;
  }
  if (!v22)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_42;
  }
  if (!v23)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: platform";
    goto LABEL_42;
  }
  if (!v52)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: pointOfInterestMonitor";
    goto LABEL_42;
  }
  if (!v51)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: visitLabeler";
    goto LABEL_42;
  }
  if (!v50)
  {
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = "Invalid parameter not satisfying: visitStore";
      goto LABEL_42;
    }
LABEL_43:

    v32 = 0;
LABEL_44:
    v34 = v53;
    goto LABEL_45;
  }
  if (v24)
  {
    v54.receiver = self;
    v54.super_class = (Class)RTVisitManager;
    v30 = [(RTNotifier *)&v54 init];
    v31 = v30;
    if (v30)
    {
      objc_storeStrong((id *)&v30->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_deviceLocationPredictor, v40);
      objc_storeStrong((id *)&v31->_hintManager, a5);
      objc_storeStrong((id *)&v31->_learnedLocationManager, v41);
      objc_storeStrong((id *)&v31->_locationAwarenessManager, v42);
      objc_storeStrong((id *)&v31->_locationManager, v43);
      objc_storeStrong((id *)&v31->_metricManager, a9);
      objc_storeStrong((id *)&v31->_motionActivityManager, a10);
      objc_storeStrong((id *)&v31->_platform, a11);
      objc_storeStrong((id *)&v31->_pointOfInterestMonitor, a12);
      objc_storeStrong((id *)&v31->_visitLabeler, a13);
      objc_storeStrong((id *)&v31->_visitStore, a14);
      objc_storeStrong((id *)&v31->_xpcActivityManager, a15);
      v31->_findingPointOfInterest = 0;
      v31->_pointOfInterestUpdateEnabled = 0;
      [(RTService *)v31 setup];
    }
    v32 = v31;
    self = v32;
    goto LABEL_44;
  }
  v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = v53;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", buf, 2u);
  }

  v32 = 0;
LABEL_45:

  return v32;
}

- (void)_setup
{
  uint64_t v3 = [(RTVisitManager *)self visitStore];
  v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onVisitStoreNotification_ name:v4];

  v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"InstantPOIEvalMode"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [(RTVisitManager *)self pointOfInterestMonitor];
    v8 = +[RTNotification notificationName];
    [v7 addObserver:self selector:sel_onPointOfInterestVisitNotification_ name:v8];
  }
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    objc_initWeak(&location, self);
    int out_token = 0;
    v9 = (const char *)[@"SpoofVisit" UTF8String];
    v10 = [(RTNotifier *)self queue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__RTVisitManager__setup__block_invoke;
    handler[3] = &unk_1E6B99EE8;
    handler[4] = self;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch(v9, &out_token, v10, handler);

    v11 = objc_opt_new();
    [(RTVisitManager *)self setSpoofVisitIncidentTokens:v11];

    int v17 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __24__RTVisitManager__setup__block_invoke_90;
    v15[3] = &unk_1E6B91EA0;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    v12 = (void (**)(void, void))MEMORY[0x1E016DB00](v15);
    v13 = (const char *)[@"SpoofVisitIncidentsUpdate" UTF8String];
    v14 = [(RTNotifier *)self queue];
    notify_register_dispatch(v13, &v17, v14, v12);

    v12[2](v12, 0xFFFFFFFFLL);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __24__RTVisitManager__setup__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"SpoofVisit"];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    v7 = @"SpoofVisit";
    __int16 v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "default, %@, %@", (uint8_t *)&v6, 0x16u);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F5CFC8]) initWithDefaultsDictionanry:v2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained onVisitIncident:v4 error:0];
}

void __24__RTVisitManager__setup__block_invoke_90(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"SpoofVisitIncidentsOn"];
  uint64_t v2 = [v4 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSpoofMode:v2];
}

- (void)_onVisitStoreNotification:(id)a3
{
  id v7 = a3;
  id v4 = [v7 name];
  v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  if (v6 && [v7 availability] == 2) {
    [(RTVisitManager *)self _setupVisitMonitorWithHandler:&__block_literal_global_86];
  }
}

void __44__RTVisitManager__onVisitStoreNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "setup visit monitor, error, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)onVisitStoreNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__RTVisitManager_onVisitStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__RTVisitManager_onVisitStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onPointOfInterestVisitNotification:(id)a3
{
  id v13 = a3;
  id v4 = [v13 name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  id v7 = v13;
  if (v6)
  {
    id v8 = v13;
    v9 = [v8 visit];

    if (v9)
    {
      uint64_t v10 = [RTVisitManagerVisitIncidentNotification alloc];
      v11 = [v8 visit];
      v12 = [(RTVisitManagerVisitIncidentNotification *)v10 initWithVisitIncident:v11];

      [(RTNotifier *)self postNotification:v12];
    }

    id v7 = v13;
  }
}

- (void)onPointOfInterestVisitNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTVisitManager_onPointOfInterestVisitNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__RTVisitManager_onPointOfInterestVisitNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onPointOfInterestVisitNotification:*(void *)(a1 + 40)];
}

- (void)_setupVisitMonitorWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__110;
  v42[4] = __Block_byref_object_dispose__110;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__110;
  v40[4] = __Block_byref_object_dispose__110;
  id v41 = 0;
  dispatch_group_enter(v5);
  id v6 = [(RTVisitManager *)self visitStore];
  id v7 = objc_alloc(MEMORY[0x1E4F5CF58]);
  id v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
  v9 = (void *)[v7 initWithAscending:0 confidence:v8 dateInterval:0 labelVisit:0 limit:&unk_1F3451C08];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke;
  v36[3] = &unk_1E6B905F0;
  v38 = v42;
  v39 = v40;
  uint64_t v10 = v5;
  v37 = v10;
  [v6 fetchVisitsWithOptions:v9 handler:v36];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__110;
  v34[4] = __Block_byref_object_dispose__110;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__110;
  v32[4] = __Block_byref_object_dispose__110;
  id v33 = 0;
  dispatch_group_enter(v10);
  v11 = [(RTVisitManager *)self visitStore];
  id v12 = objc_alloc(MEMORY[0x1E4F5CF58]);
  id v13 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D018]];
  v14 = (void *)[v12 initWithAscending:0 confidence:v13 dateInterval:0 labelVisit:0 limit:&unk_1F3451C08];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_2;
  v28[3] = &unk_1E6B905F0;
  v30 = v34;
  v31 = v32;
  v15 = v10;
  v29 = v15;
  [v11 fetchVisitsWithOptions:v14 handler:v28];

  id v16 = [(RTVisitManager *)self visitMonitor];

  if (v16)
  {
    dispatch_group_enter(v15);
    int v17 = [(RTVisitManager *)self visitMonitor];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_3;
    v26[3] = &unk_1E6B90840;
    v27 = v15;
    [v17 shutdownWithHandler:v26];
  }
  v18 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_4;
  block[3] = &unk_1E6B99F10;
  id v22 = v42;
  id v23 = v34;
  block[4] = self;
  id v21 = v4;
  id v24 = v40;
  v25 = v32;
  id v19 = v4;
  dispatch_group_notify(v15, v18, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_3(uint64_t a1)
{
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_4(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v28 = [[RTVisitMonitorState alloc] initWithLastVisit:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lastLowConfidenceVisit:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  v25 = [RTVisitMonitor alloc];
  v27 = [*(id *)(a1 + 32) defaultsManager];
  v26 = [*(id *)(a1 + 32) deviceLocationPredictor];
  id v24 = [*(id *)(a1 + 32) hintManager];
  uint64_t v2 = [*(id *)(a1 + 32) learnedLocationManager];
  uint64_t v3 = [*(id *)(a1 + 32) locationAwarenessManager];
  id v4 = [*(id *)(a1 + 32) locationManager];
  id v5 = [*(id *)(a1 + 32) metricManager];
  uint64_t v6 = [*(id *)(a1 + 32) motionActivityManager];
  uint64_t v7 = [*(id *)(a1 + 32) platform];
  id v8 = [*(id *)(a1 + 32) queue];
  uint64_t v9 = [*(id *)(a1 + 32) visitLabeler];
  uint64_t v10 = (void *)v2;
  id v11 = [(RTVisitMonitor *)v25 initWithDefaultsManager:v27 deviceLocationPredictor:v26 hintManager:v24 learnedLocationManager:v2 locationAwarenessManager:v3 locationManager:v4 metricManager:v5 motionActivityManager:v6 platform:v7 queue:v8 state:v28 visitLabeler:v9];
  [*(id *)(a1 + 32) setVisitMonitor:v11];

  id v12 = [*(id *)(a1 + 32) visitMonitor];

  if (v12)
  {
    id v13 = *(void **)(a1 + 32);
    v14 = [v13 visitMonitor];
    [v14 setDelegate:v13];

    [*(id *)(a1 + 32) _updateStateForVisitIncidents];
    [*(id *)(a1 + 32) _updateStateForLeechedVisitIncidents];
    [*(id *)(a1 + 32) _updateStateForLowConfidenceVisitIncidents];
    v15 = *(void **)(a1 + 32);
    id v16 = objc_opt_new();
    [v15 postNotification:v16];

    int v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"failed to setup visit monitor.";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    int v17 = [v18 errorWithDomain:v19 code:5 userInfo:v20];
  }
  uint64_t v21 = *(void *)(a1 + 40);
  id v22 = _RTSafeArray();
  id v23 = _RTMultiErrorCreate();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v23);
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  id v4 = [(RTVisitManager *)self visitMonitor];
  [v4 setDelegate:0];

  id v5 = [(RTVisitManager *)self visitMonitor];
  [v5 shutdownWithHandler:0];

  uint64_t v6 = [(RTVisitManager *)self visitStore];
  [v6 removeObserver:self];

  uint64_t v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    uint64_t v7 = v8;
  }
}

- (void)_updateStateForVisitIncidents
{
  uint64_t v3 = +[RTNotification notificationName];
  unint64_t v4 = [(RTNotifier *)self getNumberOfObservers:v3];

  id v5 = [(RTVisitManager *)self visitMonitor];
  id v6 = v5;
  if (v4) {
    [v5 startMonitoringVisitIncidents];
  }
  else {
    [v5 stopMonitoringVisitIncidents];
  }
}

- (void)_updateStateForLeechedVisitIncidents
{
  uint64_t v3 = +[RTNotification notificationName];
  unint64_t v4 = [(RTNotifier *)self getNumberOfObservers:v3];

  id v5 = [(RTVisitManager *)self visitMonitor];
  id v6 = v5;
  if (v4) {
    [v5 startMonitoringLeechedVisitIncidents];
  }
  else {
    [v5 stopMonitoringLeechedVisitIncidents];
  }
}

- (void)_updateStateForLowConfidenceVisitIncidents
{
  uint64_t v3 = +[RTNotification notificationName];
  unint64_t v4 = [(RTNotifier *)self getNumberOfObservers:v3];

  id v5 = [(RTVisitManager *)self visitMonitor];
  id v6 = v5;
  if (v4) {
    [v5 startMonitoringLowConfidenceVisitIncidents];
  }
  else {
    [v5 stopMonitoringLowConfidenceVisitIncidents];
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [(RTVisitManager *)self _updateStateForVisitIncidents];
  }
  else
  {
    uint64_t v10 = +[RTNotification notificationName];
    int v11 = [v7 isEqualToString:v10];

    if (v11)
    {
      [(RTVisitManager *)self _updateStateForLeechedVisitIncidents];
    }
    else
    {
      id v12 = +[RTNotification notificationName];
      int v13 = [v7 isEqualToString:v12];

      if (v13)
      {
        [(RTVisitManager *)self _updateStateForLowConfidenceVisitIncidents];
      }
      else
      {
        v14 = +[RTNotification notificationName];
        int v15 = [v7 isEqualToString:v14];

        if (v15)
        {
          id v16 = [(RTVisitManager *)self visitMonitor];

          if (v16)
          {
            int v17 = objc_opt_new();
            [(RTNotifier *)self postNotification:v17 toObserver:v6];
          }
        }
        else
        {
          v18 = +[RTNotification notificationName];
          int v19 = [v7 isEqualToString:v18];

          if (v19)
          {
            [(RTVisitManager *)self setPointOfInterestUpdateEnabled:[(RTNotifier *)self getNumberOfObservers:v7] != 0];
          }
          else
          {
            id v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              int v21 = 138412290;
              id v22 = v7;
              _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v21, 0xCu);
            }
          }
        }
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(RTVisitManager *)self _updateStateForVisitIncidents];
  }
  else
  {
    id v8 = +[RTNotification notificationName];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      [(RTVisitManager *)self _updateStateForLeechedVisitIncidents];
    }
    else
    {
      uint64_t v10 = +[RTNotification notificationName];
      int v11 = [v5 isEqualToString:v10];

      if (v11)
      {
        [(RTVisitManager *)self _updateStateForLowConfidenceVisitIncidents];
      }
      else
      {
        id v12 = +[RTNotification notificationName];
        int v13 = [v5 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          v14 = +[RTNotification notificationName];
          int v15 = [v5 isEqualToString:v14];

          if (v15)
          {
            [(RTVisitManager *)self setPointOfInterestUpdateEnabled:[(RTNotifier *)self getNumberOfObservers:v5] != 0];
          }
          else
          {
            id v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v17 = 138412290;
              id v18 = v5;
              _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v17, 0xCu);
            }
          }
        }
      }
    }
  }
}

- (void)_fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
      __int16 v47 = 1024;
      int v48 = 498;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
    __int16 v47 = 1024;
    int v48 = 497;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if (v10)
  {
LABEL_4:
    if (v8 && v9)
    {
      if ([v8 compare:v9] == 1)
      {
        int v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F5CFE8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        int v13 = NSString;
        v14 = [v8 stringFromDate];
        int v15 = [v9 stringFromDate];
        id v16 = [v13 stringWithFormat:@"fromDate, %@, postdates toDate, %@", v14, v15];
        id v42 = v16;
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v18 = [v11 errorWithDomain:v12 code:7 userInfo:v17];
        v10[2](v10, 0, v18);
      }
      else
      {
        uint64_t v23 = [RTVisitMonitor alloc];
        id v24 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v23];
        v14 = dispatch_queue_create((const char *)[v24 UTF8String], 0);

        v34 = v23;
        v37 = [(RTVisitManager *)self defaultsManager];
        v36 = [(RTVisitManager *)self deviceLocationPredictor];
        id v35 = [(RTVisitManager *)self hintManager];
        v32 = [(RTVisitManager *)self learnedLocationManager];
        v31 = [(RTVisitManager *)self locationAwarenessManager];
        v30 = [(RTVisitManager *)self locationManager];
        uint64_t v29 = [(RTVisitManager *)self metricManager];
        v28 = [(RTVisitManager *)self motionActivityManager];
        v27 = [(RTVisitManager *)self platform];
        v25 = [[RTVisitMonitorState alloc] initWithLastVisit:0 lastLowConfidenceVisit:0];
        v26 = [(RTVisitManager *)self visitLabeler];
        id v33 = [(RTVisitMonitor *)v34 initWithDefaultsManager:v37 deviceLocationPredictor:v36 hintManager:v35 learnedLocationManager:v32 locationAwarenessManager:v31 locationManager:v30 metricManager:v29 motionActivityManager:v28 platform:v27 queue:v14 state:v25 visitLabeler:v26];

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __54__RTVisitManager__fetchVisitsFromDate_toDate_handler___block_invoke;
        v38[3] = &unk_1E6B90688;
        v39 = v33;
        id v40 = v10;
        int v15 = v33;
        [(RTVisitMonitor *)v15 fetchVisitsFromDate:v8 toDate:v9 handler:v38];
      }
    }
    else
    {
      int v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F5CFE8];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      id v44 = @"requires valid dates.";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      int v15 = [v21 errorWithDomain:v22 code:7 userInfo:v14];
      v10[2](v10, 0, v15);
    }

    goto LABEL_19;
  }
LABEL_14:
  v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
    __int16 v47 = 1024;
    int v48 = 499;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_19:
}

uint64_t __54__RTVisitManager__fetchVisitsFromDate_toDate_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 shutdownWithHandler:0];
}

- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__RTVisitManager_fetchVisitsFromDate_toDate_handler___block_invoke;
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

uint64_t __53__RTVisitManager_fetchVisitsFromDate_toDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsFromDate:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__110;
  v59 = __Block_byref_object_dispose__110;
  id v60 = 0;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000;
  id v52 = __Block_byref_object_copy__110;
  id v53 = __Block_byref_object_dispose__110;
  id v54 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v38 = a1;
  uint64_t v3 = [*(id *)(a1 + 32) visitStore];
  unint64_t v4 = *(void **)(v38 + 40);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_2;
  v44[3] = &unk_1E6B928A8;
  id v45 = v4;
  __int16 v47 = &v49;
  int v48 = &v55;
  id v5 = v2;
  id v46 = v5;
  [v3 fetchVisitsWithOptions:v45 handler:v44];

  dsema = v5;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v7)) {
    goto LABEL_6;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  int v11 = objc_opt_new();
  id v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_386];
  id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v14 = [v13 filteredArrayUsingPredicate:v12];
  int v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v62 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v62 count:1];
  uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;

    char v21 = 0;
  }
  else
  {
LABEL_6:
    id v20 = 0;
    char v21 = 1;
  }

  id v35 = v20;
  if ((v21 & 1) == 0) {
    objc_storeStrong(v56 + 5, v20);
  }
  if (v56[5]) {
    (*(void (**)(void))(*(void *)(v38 + 48) + 16))(*(void *)(v38 + 48));
  }
  if ((objc_msgSend(*(id *)(v38 + 40), "labelVisit", v35) & 1) == 0)
  {
    id v33 = [_RTMap alloc];
    v34 = [(_RTMap *)v33 initWithInput:v50[5]];
    uint64_t v22 = [(_RTMap *)v34 withBlock:&__block_literal_global_126];

    (*(void (**)(void))(*(void *)(v38 + 48) + 16))();
    goto LABEL_26;
  }
  uint64_t v22 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = (id)v50[5];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v61 count:16];
  if (!v24) {
    goto LABEL_24;
  }
  uint64_t v25 = *(void *)v41;
  double v26 = *MEMORY[0x1E4F5D018];
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v41 != v25) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if ([v28 source] == 1)
      {
        uint64_t v29 = [v28 placeInference];
        if (!v29)
        {
          [v28 confidence];
          if (v30 <= v26) {
            goto LABEL_22;
          }
          uint64_t v29 = [*(id *)(v38 + 32) visitLabeler];
          v31 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
          v32 = [v31 bundleIdentifier];
          uint64_t v39 = 0;
          [v29 labelVisit:v28 clientIdentifier:v32 error:&v39];
        }
      }
LABEL_22:
      [v22 addObject:v28];
    }
    uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v61 count:16];
  }
  while (v24);
LABEL_24:

  (*(void (**)(void))(*(void *)(v38 + 48) + 16))();
LABEL_26:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
}

void __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    char v21 = [v5 firstObject];
    double v9 = [v21 date];
    double v10 = [v9 stringFromDate];
    int v11 = [v5 lastObject];
    id v12 = [v11 date];
    id v13 = [v12 stringFromDate];
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    v27 = v13;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "fetched %ld visits from detection date, %@, to, %@, options, %@", buf, 0x2Au);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v5;
  id v17 = v5;

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v6;
  id v20 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_123(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v2 = (objc_class *)MEMORY[0x1E4F5CFC8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 date];
  uint64_t v6 = [v3 type];
  dispatch_time_t v7 = [v3 location];
  uint64_t v8 = [v3 entry];
  double v9 = [v3 exit];
  uint64_t v10 = [v3 dataPointCount];
  [v3 confidence];
  double v12 = v11;
  uint64_t v13 = [v3 source];

  uint64_t v14 = (void *)[v4 initWithDate:v5 type:v6 location:v7 entry:v8 exit:v9 dataPointCount:v10 confidence:v12 placeInference:0 source:v13];

  return v14;
}

- (void)setFindingPointOfInterest:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_findingPointOfInterest != a3)
  {
    BOOL v3 = a3;
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      uint64_t v8 = (void *)v7;
      double v9 = @"YES";
      if (self->_findingPointOfInterest) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      int v11 = 138412802;
      uint64_t v12 = v7;
      uint64_t v14 = v10;
      __int16 v13 = 2112;
      if (!v3) {
        double v9 = @"NO";
      }
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, findingPointOfInterest transitioned from, %@, to, %@", (uint8_t *)&v11, 0x20u);
    }
    self->_findingPointOfInterest = v3;
    if (v3) {
      [(RTVisitManager *)self _registerXpcActivityFindPointOfInterest];
    }
    else {
      [(RTVisitManager *)self _unregisterXpcActivityFindPointOfInterest];
    }
  }
}

- (void)_registerXpcActivityFindPointOfInterest
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [(RTVisitManager *)self lastHighConfidenceVisit];
  uint64_t v6 = [v5 entry];
  [v4 timeIntervalSinceDate:v6];
  double v8 = 900.0 - v7;

  if (v8 < 1.0) {
    double v8 = 1.0;
  }
  double v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = v10;
    __int16 v17 = 2048;
    double v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = 0x404E000000000000;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, delay, %.1f, grace period, %.1f", buf, 0x20u);
  }
  LOBYTE(v13) = 1;
  int v11 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:1 priority:0 requireNetworkConnectivity:1024 requireInexpensiveNetworkConnectivity:102400 networkTransferUploadSize:1 networkTransferDownloadSize:9.22337204e18 allowBattery:60.0 powerNap:v8 delay:v13 requireBatteryLevel:0];
  uint64_t v12 = [(RTVisitManager *)self xpcActivityManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke;
  v14[3] = &unk_1E6B949F0;
  v14[4] = self;
  v14[5] = a2;
  [v12 registerActivityWithIdentifier:@"com.apple.routined.visitManager.findPointOfInterest" criteria:v11 handler:v14];
}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2;
  v3[3] = &unk_1E6B91248;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_async(v2, v3);
}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    long long v4 = [*(id *)(a1 + 32) lastHighConfidenceVisit];
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, finding POI for visit, %@", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) visitLabeler];
  uint64_t v6 = [*(id *)(a1 + 32) lastHighConfidenceVisit];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_136;
  v7[3] = &unk_1E6B99F58;
  long long v8 = *(_OWORD *)(a1 + 32);
  [v5 findPointOfInterestForVisit:v6 clientIdentifier:@"com.apple.CoreRoutine.visitManager" handler:v7];
}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2_137;
  v10[3] = &unk_1E6B917F0;
  id v11 = v5;
  id v12 = v6;
  long long v13 = *(_OWORD *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2_137(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) lastHighConfidenceVisit];
    int v7 = [*(id *)(a1 + 48) pointOfInterestUpdateEnabled];
    *(_DWORD *)buf = 138413314;
    id v8 = @"NO";
    id v35 = v3;
    __int16 v36 = 2112;
    if (v7) {
      id v8 = @"YES";
    }
    uint64_t v37 = v4;
    __int16 v38 = 2112;
    uint64_t v39 = v5;
    __int16 v40 = 2112;
    long long v41 = v6;
    __int16 v42 = 2112;
    long long v43 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, updated visit, %@, error, %@, before update, %@, pointOfInterestUpdateEnabled, %@", buf, 0x34u);
  }
  [*(id *)(a1 + 48) _unregisterXpcActivityFindPointOfInterest];
  id v9 = [*(id *)(a1 + 48) defaultsManager];
  uint64_t v10 = [v9 objectForKey:@"VisitManagerPreviousPOIVisitDates"];

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  long long v13 = [v11 setWithObjects:v12, objc_opt_class(), 0];
  id v33 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v10 error:&v33];
  id v15 = v33;
  id v16 = [*(id *)(a1 + 48) defaultsManager];
  __int16 v17 = [v16 objectForKey:@"VisitManagerQueryingBluePOIMaxDailyVisitCount"];

  if (v17)
  {
    double v18 = [*(id *)(a1 + 48) defaultsManager];
    __int16 v19 = [v18 objectForKey:@"VisitManagerQueryingBluePOIMaxDailyVisitCount"];
    unint64_t v20 = [v19 unsignedIntegerValue];
  }
  else
  {
    unint64_t v20 = 2;
  }
  if ([v14 count] > v20)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v31 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412290;
      id v35 = v31;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "%@, exceed BluePOI query budget!", buf, 0xCu);
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
  [v14 addObject:v22];

  id v32 = 0;
  uint64_t v23 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v32];
  id v24 = v32;
  if (!v24)
  {
    uint64_t v25 = [*(id *)(a1 + 48) defaultsManager];
    [v25 setObject:v23 forKey:@"VisitManagerPreviousPOIVisitDates"];
  }
  if ([*(id *)(a1 + 48) pointOfInterestUpdateEnabled])
  {
    __int16 v26 = [*(id *)(a1 + 32) placeInference];
    v27 = [v26 mapItem];

    if (v27)
    {
      __int16 v28 = [RTVisitManagerPointOfInterestUpdateNotification alloc];
      uint64_t v29 = [*(id *)(a1 + 32) placeInference];
      uint64_t v30 = [(RTVisitManagerPointOfInterestUpdateNotification *)v28 initWithPlaceInference:v29];

      [*(id *)(a1 + 48) postNotification:v30];
    }
  }
}

- (void)_unregisterXpcActivityFindPointOfInterest
{
  v42[1] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__110;
  uint64_t v37 = __Block_byref_object_dispose__110;
  id v38 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [(RTVisitManager *)self xpcActivityManager];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __59__RTVisitManager__unregisterXpcActivityFindPointOfInterest__block_invoke;
  uint64_t v30 = &unk_1E6B90728;
  id v32 = &v33;
  id v6 = v4;
  v31 = v6;
  [v5 unregisterActivityWithIdentifier:@"com.apple.routined.visitManager.findPointOfInterest" handler:&v27];

  int v7 = v6;
  id v8 = [MEMORY[0x1E4F1C9C8] now:v27, v28, v29, v30];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  long long v13 = objc_opt_new();
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_386];
  id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v16 = [v15 filteredArrayUsingPredicate:v14];
  __int16 v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v19 = (void *)MEMORY[0x1E4F28C58];
  v42[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  unint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v42 count:1];
  uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
LABEL_6:
    id v22 = 0;
  }

  id v23 = v22;
  if (v23) {
    objc_storeStrong(v34 + 5, v22);
  }
  id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = NSStringFromSelector(a2);
    id v26 = v34[5];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v40 = 2112;
    id v41 = v26;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
  }
  _Block_object_dispose(&v33, 8);
}

void __59__RTVisitManager__unregisterXpcActivityFindPointOfInterest__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)shouldFindPointOfInterestForVisit:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  if (_os_feature_enabled_impl()
    && ([v5 confidence], v7 == *MEMORY[0x1E4F5D010])
    && [v5 type] == 1
    && ([v5 placeInference],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 mapItem],
        dispatch_time_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    id v16 = [(RTVisitManager *)self defaultsManager];
    uint64_t v17 = [v16 objectForKey:@"VisitManagerPreviousPOIVisitDates"];

    double v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    unint64_t v20 = [v18 setWithObjects:v19, objc_opt_class(), 0];
    id v42 = 0;
    __int16 v36 = (void *)v17;
    uint64_t v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v20 fromData:v17 error:&v42];
    id v22 = v42;
    id v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __52__RTVisitManager_shouldFindPointOfInterestForVisit___block_invoke;
    v38[3] = &unk_1E6B99F80;
    id v35 = v23;
    id v39 = v35;
    SEL v41 = a2;
    id v24 = v6;
    id v40 = v24;
    [v21 enumerateObjectsUsingBlock:v38];
    uint64_t v25 = [(RTVisitManager *)self defaultsManager];
    id v26 = [v25 objectForKey:@"VisitManagerQueryingBluePOIMaxDailyVisitCount"];

    if (v26)
    {
      uint64_t v27 = [(RTVisitManager *)self defaultsManager];
      [v27 objectForKey:@"VisitManagerQueryingBluePOIMaxDailyVisitCount"];
      id v34 = v22;
      uint64_t v28 = v21;
      v30 = uint64_t v29 = v20;
      unint64_t v31 = [v30 unsignedIntegerValue];

      unint64_t v20 = v29;
      uint64_t v21 = v28;
      id v22 = v34;
    }
    else
    {
      unint64_t v31 = 2;
    }
    BOOL v10 = [v24 count] < v31;
    uint64_t v37 = 0;
    id v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v37];
    if (!v37)
    {
      uint64_t v33 = [(RTVisitManager *)self defaultsManager];
      [v33 setObject:v32 forKey:@"VisitManagerPreviousPOIVisitDates"];
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  double v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v12 = NSStringFromSelector(a2);
    if (v10) {
      long long v13 = @"YES";
    }
    else {
      long long v13 = @"NO";
    }
    uint64_t v14 = [v6 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 2048;
    uint64_t v48 = v14;
    __int16 v49 = 2112;
    id v50 = v5;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, result, %@, filtered date count, %lu, visit, %@", buf, 0x2Au);
  }
  return v10;
}

void __52__RTVisitManager_shouldFindPointOfInterestForVisit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isAfterDate:*(void *)(a1 + 32)])
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v8 = 138412802;
      dispatch_time_t v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, date, %@", (uint8_t *)&v8, 0x20u);
    }
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)_onVisitIncident:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    dispatch_time_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  __int16 v10 = [(RTVisitManager *)self visitMonitor];
  if ([v10 monitoringVisitIncidents])
  {
  }
  else
  {
    BOOL v11 = [(RTVisitManager *)self spoofMode];

    if (!v11) {
      goto LABEL_9;
    }
  }
  __int16 v12 = [[RTVisitManagerVisitIncidentNotification alloc] initWithVisitIncident:v7];
  [(RTNotifier *)self postNotification:v12];

LABEL_9:
  id v13 = [(RTVisitManager *)self visitMonitor];
  if ([v13 monitoringLeechedVisitIncidents])
  {
  }
  else
  {
    BOOL v14 = [(RTVisitManager *)self spoofMode];

    if (!v14) {
      goto LABEL_13;
    }
  }
  id v15 = [[RTVisitManagerLeechedVisitIncidentNotification alloc] initWithVisitIncident:v7];
  [(RTNotifier *)self postNotification:v15];

LABEL_13:
  id v16 = [(RTVisitManager *)self visitStore];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __41__RTVisitManager__onVisitIncident_error___block_invoke;
  id v23 = &unk_1E6B90CB8;
  SEL v25 = a2;
  id v17 = v7;
  id v24 = v17;
  [v16 storeVisit:v17 handler:&v20];

  if (-[RTVisitManager shouldFindPointOfInterestForVisit:](self, "shouldFindPointOfInterestForVisit:", v17, v20, v21, v22, v23))
  {
    [(RTVisitManager *)self setLastHighConfidenceVisit:v17];
    [(RTVisitManager *)self setFindingPointOfInterest:1];
  }
  if ([v17 type] == 3)
  {
    [v17 confidence];
    if (v18 == *MEMORY[0x1E4F5D010]) {
      [(RTVisitManager *)self setFindingPointOfInterest:0];
    }
  }
}

void __41__RTVisitManager__onVisitIncident_error___block_invoke(uint64_t a1, void *a2)
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
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)onVisitIncident:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__RTVisitManager_onVisitIncident_error___block_invoke;
  block[3] = &unk_1E6B92F80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __40__RTVisitManager_onVisitIncident_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) spoofMode];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 _onVisitIncident:v4 error:v5];
  }
  return result;
}

- (void)_onLowConfidenceVisitIncident:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v18 = v13;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  id v10 = [[RTVisitManagerLowConfidenceVisitIncidentNotification alloc] initWithVisitIncident:v7];
  [(RTNotifier *)self postNotification:v10];
  __int16 v11 = [(RTVisitManager *)self visitStore];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__RTVisitManager__onLowConfidenceVisitIncident_error___block_invoke;
  v14[3] = &unk_1E6B90CB8;
  id v15 = v7;
  SEL v16 = a2;
  id v12 = v7;
  [v11 storeVisit:v12 handler:v14];
}

void __54__RTVisitManager__onLowConfidenceVisitIncident_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)onLowConfidenceVisitIncident:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTVisitManager_onLowConfidenceVisitIncident_error___block_invoke;
  block[3] = &unk_1E6B92F80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __53__RTVisitManager_onLowConfidenceVisitIncident_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) spoofMode];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 _onLowConfidenceVisitIncident:v4 error:v5];
  }
  return result;
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if ((unint64_t)a3 > 1)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
  else
  {
    __int16 v11 = [(RTVisitManager *)self visitStore];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__RTVisitManager__performPurgeOfType_referenceDate_completion___block_invoke;
    v12[3] = &unk_1E6B90C18;
    id v13 = v10;
    [v11 purgeVisitsPredating:v8 handler:v12];
  }
}

uint64_t __63__RTVisitManager__performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__RTVisitManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __62__RTVisitManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPurgeOfType:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)setSpoofMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_spoofMode == a3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = @"OFF";
      if (v3) {
        uint64_t v5 = @"ON";
      }
      *(_DWORD *)buf = 138412290;
      SEL v25 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Spoof mode remains %@.", buf, 0xCu);
    }
  }
  else
  {
    self->_spoofMode = a3;
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Start spoof mode.", buf, 2u);
      }

      id v9 = [(RTVisitManager *)self spoofVisitIncidentTokens];
      id v10 = [(RTVisitManager *)self registerForSpoofVisitIncidentOfCategory:@"SpoofVisitIncident"];
      [v9 addObject:v10];

      id v11 = [(RTVisitManager *)self spoofVisitIncidentTokens];
      id v12 = [(RTVisitManager *)self registerForSpoofVisitIncidentOfCategory:@"SpoofLeechedVisitIncident"];
      [v11 addObject:v12];

      uint64_t v4 = [(RTVisitManager *)self spoofVisitIncidentTokens];
      id v13 = [(RTVisitManager *)self registerForSpoofVisitIncidentOfCategory:@"SpoofLowConfidenceVisitIncident"];
      [v4 addObject:v13];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Stop spoof.", buf, 2u);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = [(RTVisitManager *)self spoofVisitIncidentTokens];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v20;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            -[RTVisitManager unregisterForSpoofVisitIncidentWithToken:](self, "unregisterForSpoofVisitIncidentWithToken:", [*(id *)(*((void *)&v19 + 1) + 8 * v18++) intValue]);
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v16);
      }

      uint64_t v4 = [(RTVisitManager *)self spoofVisitIncidentTokens];
      [v4 removeAllObjects];
    }
  }
}

- (id)registerForSpoofVisitIncidentOfCategory:(id)a3
{
  id v4 = a3;
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__RTVisitManager_registerForSpoofVisitIncidentOfCategory___block_invoke;
    v12[3] = &unk_1E6B99FA8;
    objc_copyWeak(&v14, &location);
    void v12[4] = self;
    id v5 = v4;
    id v13 = v5;
    id v6 = (void *)MEMORY[0x1E016DB00](v12);
    int out_token = 0;
    id v7 = (const char *)[v5 UTF8String];
    BOOL v8 = [(RTNotifier *)self queue];
    notify_register_dispatch(v7, &out_token, v8, v6);

    id v9 = [NSNumber numberWithInt:out_token];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __58__RTVisitManager_registerForSpoofVisitIncidentOfCategory___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
    if (v3)
    {
      id v4 = [objc_alloc(MEMORY[0x1E4F5CFC8]) initWithDefaultsDictionanry:v3];
      id v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Read %@ from defaults, visitIncident, %@", (uint8_t *)&v8, 0x16u);
      }

      if (([*(id *)(a1 + 40) isEqualToString:@"SpoofVisitIncident"] & 1) != 0
        || [*(id *)(a1 + 40) isEqualToString:@"SpoofLeechedVisitIncident"])
      {
        [WeakRetained _onVisitIncident:v4 error:0];
      }
      else if ([*(id *)(a1 + 40) isEqualToString:@"SpoofLowConfidenceVisitIncident"])
      {
        [WeakRetained _onLowConfidenceVisitIncident:v4 error:0];
      }
    }
    else
    {
      id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Cannot find %@ in defaults", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)unregisterForSpoofVisitIncidentWithToken:(int)a3
{
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    notify_cancel(a3);
  }
}

- (void)_simulateVisit:(id)a3 handler:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void (**)(id, uint64_t))a4;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "simulate visit, %@", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
  {
    __int16 v10 = [(RTVisitManager *)self visitLabeler];
    id v11 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
    uint64_t v12 = [v11 bundleIdentifier];
    id v59 = 0;
    [v10 labelVisit:v7 clientIdentifier:v12 error:&v59];
    id v48 = v59;

    id v13 = [[RTVisitManagerVisitIncidentNotification alloc] initWithVisitIncident:v7];
    v66[0] = v13;
    id v14 = [[RTVisitManagerLeechedVisitIncidentNotification alloc] initWithVisitIncident:v7];
    v66[1] = v14;
    uint64_t v15 = [[RTVisitManagerLowConfidenceVisitIncidentNotification alloc] initWithVisitIncident:v7];
    v66[2] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(v17);
          }
          [(RTNotifier *)self postNotification:*(void *)(*((void *)&v55 + 1) + 8 * i)];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v18);
    }

    if (self->_spoofMode)
    {
      long long v21 = [(RTVisitManager *)self visitStore];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __41__RTVisitManager__simulateVisit_handler___block_invoke;
      v52[3] = &unk_1E6B90CB8;
      SEL v54 = a2;
      id v22 = v7;
      id v53 = v22;
      [v21 storeVisit:v22 handler:v52];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v61 = 0x3032000000;
      uint64_t v62 = __Block_byref_object_copy__110;
      v63 = __Block_byref_object_dispose__110;
      id v64 = 0;
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      id v24 = [(RTVisitManager *)self visitStore];
      id v25 = objc_alloc(MEMORY[0x1E4F5CF58]);
      uint64_t v26 = NSNumber;
      [v22 confidence];
      uint64_t v27 = [v26 numberWithDouble:x0];
      __int16 v28 = (void *)[v25 initWithAscending:0 confidence:v27 dateInterval:0 labelVisit:0 limit:&unk_1F3451C08];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __41__RTVisitManager__simulateVisit_handler___block_invoke_171;
      v49[3] = &unk_1E6B90700;
      p_long long buf = &buf;
      id v29 = v23;
      id v50 = v29;
      [v24 fetchVisitsWithOptions:v28 handler:v49];

      uint64_t v30 = v29;
      __int16 v47 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v31 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v30, v31))
      {
        id v46 = [MEMORY[0x1E4F1C9C8] now];
        [v46 timeIntervalSinceDate:v47];
        double v33 = v32;
        __int16 v45 = objc_opt_new();
        id v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_386];
        id v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v36 = [v35 filteredArrayUsingPredicate:v34];
        uint64_t v37 = [v36 firstObject];

        [v45 submitToCoreAnalytics:v37 type:1 duration:v33];
        id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v70 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v70, 2u);
        }

        id v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        *(void *)v70 = @"semaphore wait timeout";
        id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
        SEL v41 = [v39 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v40];
      }
      id v42 = [(RTVisitManager *)self visitMonitor];
      [v42 compareVisit:v22 previousVisit:*(void *)(*((void *)&buf + 1) + 40)];

      _Block_object_dispose(&buf, 8);
    }
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v43 = 0;
LABEL_21:
    v8[2](v8, v43);
LABEL_22:

    goto LABEL_23;
  }
  if (v8)
  {
    uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v68 = @"requires a valid visit.";
    id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v43 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v48];
    id v17 = (id)v43;
    goto LABEL_21;
  }
LABEL_23:
}

void __41__RTVisitManager__simulateVisit_handler___block_invoke(uint64_t a1, void *a2)
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
      int v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

intptr_t __41__RTVisitManager__simulateVisit_handler___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (void)simulateVisit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__RTVisitManager_simulateVisit_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __40__RTVisitManager_simulateVisit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _simulateVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_injectRealtimeVisit:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "inject visit, %@", buf, 0xCu);
  }

  if (v7)
  {
    id v10 = [(RTVisitManager *)self visitStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__RTVisitManager__injectRealtimeVisit_handler___block_invoke;
    v15[3] = &unk_1E6B916B8;
    SEL v18 = a2;
    id v16 = v7;
    id v17 = v8;
    [v10 storeVisit:v16 handler:v15];

    __int16 v11 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    long long v20 = @"requires a valid visit.";
    __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v14 = [v12 errorWithDomain:v13 code:7 userInfo:v11];
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_7;
  }
LABEL_8:
}

void __47__RTVisitManager__injectRealtimeVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412802;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)injectRealtimeVisit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTVisitManager_injectRealtimeVisit_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __46__RTVisitManager_injectRealtimeVisit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _injectRealtimeVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
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
    v12[2] = __67__RTVisitManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
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
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __67__RTVisitManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v17;
    id v10 = &v16;
LABEL_8:
    uint64_t v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    id v12 = [v6 errorWithDomain:v7 code:7 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  uint64_t v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v15;
    id v10 = &v14;
    goto LABEL_8;
  }
  id v13 = [*(id *)(a1 + 40) visitStore];
  [v13 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTPointOfInterestMonitor)pointOfInterestMonitor
{
  return self->_pointOfInterestMonitor;
}

- (void)setPointOfInterestMonitor:(id)a3
{
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setVisitStore:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (BOOL)spoofMode
{
  return self->_spoofMode;
}

- (NSMutableArray)spoofVisitIncidentTokens
{
  return self->_spoofVisitIncidentTokens;
}

- (void)setSpoofVisitIncidentTokens:(id)a3
{
}

- (RTVisitMonitor)visitMonitor
{
  return self->_visitMonitor;
}

- (void)setVisitMonitor:(id)a3
{
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (RTVisit)lastHighConfidenceVisit
{
  return self->_lastHighConfidenceVisit;
}

- (void)setLastHighConfidenceVisit:(id)a3
{
}

- (BOOL)findingPointOfInterest
{
  return self->_findingPointOfInterest;
}

- (BOOL)pointOfInterestUpdateEnabled
{
  return self->_pointOfInterestUpdateEnabled;
}

- (void)setPointOfInterestUpdateEnabled:(BOOL)a3
{
  self->_pointOfInterestUpdateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHighConfidenceVisit, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_visitMonitor, 0);
  objc_storeStrong((id *)&self->_spoofVisitIncidentTokens, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_pointOfInterestMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end