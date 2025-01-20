@interface RTPurgeManager
+ (id)purgeTypeToString:(int64_t)a3;
- (NSArray)purgers;
- (OS_dispatch_source)memoryWarningDispatchSource;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLifeCycleManager)lifeCycleManager;
- (RTPlatform)platform;
- (RTPurgeManager)init;
- (RTPurgeManager)initWithDefaultsManager:(id)a3 learnedLocationStore:(id)a4 lifeCycleManager:(id)a5 platform:(id)a6 purgers:(id)a7 visitStore:(id)a8 xpcActivityManager:(id)a9;
- (RTVisitStore)visitStore;
- (RTXPCActivityManager)xpcActivityManager;
- (id)_cacheDateDependencyForVisitWithDateInterval:(id)a3;
- (id)_cacheDateDependencyLabeledLearnedVisitWithDateInterval:(id)a3;
- (id)_cacheDateDependencyMomentsWithDateInterval:(id)a3;
- (id)_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:(id)a3;
- (id)_dailyReferenceDate:(id)a3;
- (id)_determinePruneDate:(id)a3 boundaryInterval:(id)a4;
- (id)_firstUnlabeledLearnedVisitWithError:(id *)a3;
- (id)_generatePeriodicPurgeReferenceDateDict;
- (id)_lastLabeledLearnedVisitWithError:(id *)a3;
- (id)_lastVisitWithError:(id *)a3;
- (id)_longTermReferenceDate:(id)a3;
- (id)_selectPruneDateFromReferenceDateDict:(id)a3 purger:(id)a4 type:(int64_t)a5;
- (id)_shortTermReferenceDate:(id)a3;
- (int64_t)pressureState;
- (void)_handleLanguageChangeNotification;
- (void)_purge:(id)a3;
- (void)_purgeWithType:(int64_t)a3 referenceDate:(id)a4 handler:(id)a5;
- (void)_registerForMemoryPressureWarnings;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForMemoryPressureWarnings;
- (void)clearRoutineWithHandler:(id)a3;
- (void)dealloc;
- (void)handleLanguageChangeNotification;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onCoreLocationPrivacyReset;
- (void)purge:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLifeCycleManager:(id)a3;
- (void)setMemoryWarningDispatchSource:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setPressureState:(int64_t)a3;
- (void)setPurgers:(id)a3;
- (void)setVisitStore:(id)a3;
@end

@implementation RTPurgeManager

+ (id)purgeTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B92950[a3];
  }
}

- (RTPurgeManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager_);
}

- (RTPurgeManager)initWithDefaultsManager:(id)a3 learnedLocationStore:(id)a4 lifeCycleManager:(id)a5 platform:(id)a6 purgers:(id)a7 visitStore:(id)a8 xpcActivityManager:(id)a9
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v43 = a7;
  id v45 = a8;
  id v44 = a9;
  v40 = v16;
  id obj = v17;
  v42 = v18;
  if (!v15)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v16)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationStore", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v17)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v18)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v45)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", (uint8_t *)location, 2u);
    }
    goto LABEL_39;
  }
  if (!v44)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", (uint8_t *)location, 2u);
    }
LABEL_39:

    v35 = 0;
    goto LABEL_40;
  }
  v59.receiver = self;
  v59.super_class = (Class)RTPurgeManager;
  v19 = [(RTNotifier *)&v59 init];
  val = v19;
  v20 = v19;
  if (v19)
  {
    v19->_pressureState = 0;
    v21 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v22 = v43;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 insertObject:v26 atIndex:0];
          }
          else {
            [v21 addObject:v26];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v23);
    }

    objc_storeStrong((id *)&val->_learnedLocationStore, a4);
    objc_storeWeak((id *)&val->_lifeCycleManager, obj);
    objc_storeStrong((id *)&val->_platform, a6);
    objc_storeStrong((id *)&val->_purgers, v21);
    objc_storeStrong((id *)&val->_visitStore, a8);
    objc_storeStrong((id *)&val->_xpcActivityManager, a9);
    uint64_t v27 = objc_opt_new();
    notificationHelper = val->_notificationHelper;
    val->_notificationHelper = (RTDarwinNotificationHelper *)v27;

    objc_initWeak(location, val);
    v29 = val->_notificationHelper;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke;
    v52[3] = &unk_1E6B91900;
    objc_copyWeak(&v53, location);
    [(RTDarwinNotificationHelper *)v29 addObserverForNotificationName:@"com.apple.language.changed" handler:v52];
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:val selector:sel_onCoreLocationPrivacyReset name:*MEMORY[0x1E4F22138] object:0];

    if ([v42 internalInstall])
    {
      int out_token = -1;
      v31 = (const char *)[@"PurgeNow" UTF8String];
      v32 = [(RTNotifier *)val queue];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_2;
      handler[3] = &unk_1E6B91EA0;
      objc_copyWeak(&v50, location);
      id v49 = v15;
      notify_register_dispatch(v31, &out_token, v32, handler);

      objc_destroyWeak(&v50);
    }
    v33 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:0 allowBattery:86400.0 powerNap:43200.0];
    [(RTXPCActivityCriteria *)v33 setCpuIntensive:1];
    v34 = [(RTPurgeManager *)val xpcActivityManager];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_56;
    v46[3] = &unk_1E6B928D0;
    v47[1] = (id)a2;
    objc_copyWeak(v47, location);
    [v34 registerActivityWithIdentifier:@"com.apple.routined.purge" criteria:v33 handler:v46];

    objc_destroyWeak(v47);
    objc_destroyWeak(&v53);
    objc_destroyWeak(location);

    v20 = val;
  }
  self = v20;
  v35 = self;
LABEL_40:

  return v35;
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleLanguageChangeNotification];
    id WeakRetained = v2;
  }
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) objectForKey:@"PurgeNow"];
    v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412546;
      v6 = @"PurgeNow";
      __int16 v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "default, %@, value, %@", (uint8_t *)&v5, 0x16u);
    }

    if ([v3 BOOLValue]) {
      [WeakRetained _purge:0];
    }
  }
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_57;
      v10[3] = &unk_1E6B90890;
      uint64_t v12 = *(void *)(a1 + 40);
      v11 = v5;
      [WeakRetained purge:v10];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

void __127__RTPurgeManager_initWithDefaultsManager_learnedLocationStore_lifeCycleManager_platform_purgers_visitStore_xpcActivityManager___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to purge, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)dealloc
{
  memoryWarningDispatchSource = self->_memoryWarningDispatchSource;
  if (memoryWarningDispatchSource)
  {
    dispatch_source_cancel(memoryWarningDispatchSource);
    v4 = self->_memoryWarningDispatchSource;
    self->_memoryWarningDispatchSource = 0;
  }
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.language.changed"];
  purgers = self->_purgers;
  self->_purgers = 0;

  v7.receiver = self;
  v7.super_class = (Class)RTPurgeManager;
  [(RTPurgeManager *)&v7 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  v4 = [(RTPurgeManager *)self xpcActivityManager];
  [v4 unregisterActivityWithIdentifier:@"com.apple.routined.purge" handler:0];

  [(RTPurgeManager *)self _unregisterForMemoryPressureWarnings];
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.language.changed"];
  purgers = self->_purgers;
  self->_purgers = 0;

  objc_super v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    objc_super v7 = v8;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v5] == 1) {
      [(RTPurgeManager *)self _registerForMemoryPressureWarnings];
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (![(RTNotifier *)self getNumberOfObservers:v5]) {
      [(RTPurgeManager *)self _unregisterForMemoryPressureWarnings];
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_registerForMemoryPressureWarnings
{
  p_memoryWarningDispatchSource = &self->_memoryWarningDispatchSource;
  if (!self->_memoryWarningDispatchSource)
  {
    v4 = [(RTNotifier *)self queue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, v4);

    objc_storeStrong((id *)p_memoryWarningDispatchSource, v5);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __52__RTPurgeManager__registerForMemoryPressureWarnings__block_invoke;
    handler[3] = &unk_1E6B917C8;
    objc_copyWeak(&v9, &location);
    dispatch_source_t v8 = v5;
    uint64_t v6 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__RTPurgeManager__registerForMemoryPressureWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
    if (data == 1)
    {
      uint64_t v5 = 0;
    }
    else if (data == 4)
    {
      uint64_t v5 = 2;
    }
    else
    {
      BOOL v4 = data == 2;
      id WeakRetained = v6;
      if (!v4) {
        goto LABEL_10;
      }
      uint64_t v5 = 1;
    }
    [v6 setPressureState:v5];
    id WeakRetained = v6;
  }
LABEL_10:
}

- (void)_unregisterForMemoryPressureWarnings
{
  memoryWarningDispatchSource = self->_memoryWarningDispatchSource;
  if (memoryWarningDispatchSource)
  {
    dispatch_source_cancel(memoryWarningDispatchSource);
    BOOL v4 = self->_memoryWarningDispatchSource;
    self->_memoryWarningDispatchSource = 0;
  }
}

- (void)purge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__RTPurgeManager_purge___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __24__RTPurgeManager_purge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purge:*(void *)(a1 + 40)];
}

- (void)_purge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "request to do periodic purge received.", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__RTPurgeManager__purge___block_invoke;
  v8[3] = &unk_1E6B90C18;
  id v9 = v4;
  id v7 = v4;
  [(RTPurgeManager *)self _purgeWithType:0 referenceDate:v6 handler:v8];
}

void __25__RTPurgeManager__purge___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "error occurred during old data purge, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)clearRoutineWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTPurgeManager_clearRoutineWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__RTPurgeManager_clearRoutineWithHandler___block_invoke(uint64_t a1)
{
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "request to do clear routine received.", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__RTPurgeManager_clearRoutineWithHandler___block_invoke_64;
  v5[3] = &unk_1E6B90C18;
  id v6 = *(id *)(a1 + 40);
  [v3 _purgeWithType:1 referenceDate:v4 handler:v5];
}

void __42__RTPurgeManager_clearRoutineWithHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "error occurred during clear routine, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)onCoreLocationPrivacyReset
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke(uint64_t a1)
{
  id v2 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "request to purge from reset location and privacy received.", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 _purgeWithType:2 referenceDate:v4 handler:&__block_literal_global_16];
}

void __44__RTPurgeManager_onCoreLocationPrivacyReset__block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "error occurred during reset location and privacy, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)_generatePeriodicPurgeReferenceDateDict
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = [(RTPurgeManager *)self _dailyReferenceDate:v3];
  id v5 = [(RTPurgeManager *)self _shortTermReferenceDate:v3];
  uint64_t v6 = [(RTPurgeManager *)self _longTermReferenceDate:v3];
  id v7 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v8 = v3;
  id v9 = [v7 initWithObjectsAndKeys:v4, &unk_1F344F9B8, v5, &unk_1F344F9D0, v6, &unk_1F344F9E8, v8, &unk_1F344FA00, 0];

  return v9;
}

- (id)_selectPruneDateFromReferenceDateDict:(id)a3 purger:(id)a4 type:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  else
  {
    if (!v7)
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = [(id)objc_opt_class() purgeTypeToString:0];
        int v14 = 138412802;
        __int16 v15 = v13;
        __int16 v16 = 2080;
        uint64_t v17 = "-[RTPurgeManager _selectPruneDateFromReferenceDateDict:purger:type:]";
        __int16 v18 = 1024;
        int v19 = 408;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "pruneReferenceDict must not be nil for type, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
      }
    }
    uint64_t v11 = [NSNumber numberWithInteger:[objc_opt_class() periodicPurgePolicy]];
    id v9 = [v7 objectForKeyedSubscript:v11];
  }

  return v9;
}

- (void)_purgeWithType:(int64_t)a3 referenceDate:(id)a4 handler:(id)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  dispatch_semaphore_t v60 = dispatch_semaphore_create(0);
  id v9 = objc_opt_new();
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSUInteger v11 = [(NSArray *)self->_purgers count];
    uint64_t v12 = [(id)objc_opt_class() purgeTypeToString:a3];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v79 = 2112;
    v80 = v12;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "starting purge with %lu purgers, type, %@", buf, 0x16u);
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  if (a3)
  {
    objc_super v59 = 0;
    int v14 = self;
  }
  else
  {
    int v14 = self;
    objc_super v59 = [(RTPurgeManager *)self _generatePeriodicPurgeReferenceDateDict];
  }
  v52 = (void *)v13;
  id v53 = (void (**)(void, void))v8;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v14->_purgers;
  __int16 v15 = v14;
  uint64_t v64 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v64)
  {
    v65 = 0;
    uint64_t v63 = *(void *)v72;
    uint64_t v54 = *MEMORY[0x1E4F28568];
    uint64_t v55 = *MEMORY[0x1E4F5CFE8];
    unint64_t v16 = 0x1E4F1C000uLL;
    int64_t v56 = a3;
    long long v57 = v9;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v72 != v63) {
          objc_enumerationMutation(obj);
        }
        __int16 v18 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        int v19 = [*(id *)(v16 + 2504) date];
        uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          id v22 = NSStringFromClass(v21);
          uint64_t v23 = [(id)objc_opt_class() purgeTypeToString:a3];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v22;
          __int16 v79 = 2112;
          v80 = v23;
          _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "purger of class %@ started, type, %@", buf, 0x16u);

          unint64_t v16 = 0x1E4F1C000uLL;
        }

        if (objc_opt_respondsToSelector())
        {
          uint64_t v24 = [(RTPurgeManager *)v15 _selectPruneDateFromReferenceDateDict:v59 purger:v18 type:a3];

          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __55__RTPurgeManager__purgeWithType_referenceDate_handler___block_invoke;
          v66[3] = &unk_1E6B91E30;
          v66[4] = v18;
          v66[5] = v15;
          int64_t v70 = a3;
          id v67 = v19;
          id v68 = v9;
          v25 = v60;
          v69 = v25;
          v62 = (void *)v24;
          [v18 performPurgeOfType:a3 referenceDate:v24 completion:v66];
          uint64_t v26 = v25;
          uint64_t v27 = [*(id *)(v16 + 2504) now];
          dispatch_time_t v28 = dispatch_time(0, 3600000000000);
          id v29 = v65;
          if (dispatch_semaphore_wait(v26, v28))
          {
            v30 = [*(id *)(v16 + 2504) now];
            [v30 timeIntervalSinceDate:v27];
            double v32 = v31;
            v33 = objc_opt_new();
            v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_188];
            v35 = [MEMORY[0x1E4F29060] callStackSymbols];
            v36 = [v35 filteredArrayUsingPredicate:v34];
            v37 = [v36 firstObject];

            [v33 submitToCoreAnalytics:v37 type:1 duration:v32];
            v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v39 = (void *)MEMORY[0x1E4F28C58];
            v81[0] = v54;
            *(void *)buf = @"semaphore wait timeout";
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v81 count:1];
            v41 = [v39 errorWithDomain:v55 code:15 userInfo:v40];

            id v29 = v65;
            a3 = v56;
            id v9 = v57;
            __int16 v15 = self;
            unint64_t v16 = 0x1E4F1C000;
            if (v41)
            {
              id v29 = v41;
            }
          }

          id v42 = v29;
          v65 = v42;
          id v7 = v62;
        }
      }
      uint64_t v64 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v64);
  }
  else
  {
    v65 = 0;
  }

  if (![v9 count])
  {
    v47 = 0;
    id v44 = v52;
    id v43 = v53;
    if (!v53) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  id v44 = v52;
  id v43 = v53;
  if ((unint64_t)[v9 count] >= 2)
  {
    uint64_t v45 = *MEMORY[0x1E4F5CFE0];
    v75[0] = *MEMORY[0x1E4F28568];
    v75[1] = v45;
    v76[0] = @"Multiple errors occurred.";
    v76[1] = v9;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
    v47 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:9 userInfo:v46];

    if (!v53) {
      goto LABEL_30;
    }
LABEL_29:
    ((void (**)(void, void *))v43)[2](v43, v47);
    goto LABEL_30;
  }
  v47 = [v9 firstObject];
  if (v53) {
    goto LABEL_29;
  }
LABEL_30:
  v48 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    id v49 = [(id)objc_opt_class() purgeTypeToString:a3];
    id v50 = [MEMORY[0x1E4F1C9C8] date];
    [v50 timeIntervalSinceDate:v44];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v49;
    __int16 v79 = 2048;
    v80 = v51;
    _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "finished purge, type, %@, latency, %.2f", buf, 0x16u);
  }
}

void __55__RTPurgeManager__purgeWithType_referenceDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = [(id)objc_opt_class() purgeTypeToString:*(void *)(a1 + 72)];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v13 = 138412802;
    int v14 = v6;
    __int16 v15 = 2112;
    unint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "purger of class %@ finished, type, %@, latency, %.2f", (uint8_t *)&v13, 0x20u);
  }
  if (v3)
  {
    id v10 = [v3 domain];
    if ([v10 isEqualToString:@"RTPersistenceMirroringManagerErrorDomain"])
    {
      NSUInteger v11 = [v3 domain];
      if (![v11 isEqualToString:@"RTPersistenceMirroringManagerErrorDomain"]
        || [v3 code] == 5)
      {

        goto LABEL_10;
      }
      uint64_t v12 = [v3 code];

      if (v12 == 3) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 56) addObject:v3];
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)setPressureState:(int64_t)a3
{
  if (self->_pressureState != a3)
  {
    self->_pressureState = a3;
    int v4 = [[RTPurgeManagerNotificationMemoryWarning alloc] initWithMemoryPressureState:self->_pressureState];
    if (v4) {
      [(RTNotifier *)self postNotification:v4];
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)handleLanguageChangeNotification
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTPurgeManager_handleLanguageChangeNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__RTPurgeManager_handleLanguageChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLanguageChangeNotification];
}

- (void)_handleLanguageChangeNotification
{
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "receive language change notification", buf, 2u);
  }

  int v4 = [MEMORY[0x1E4F1C9C8] date];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__RTPurgeManager__handleLanguageChangeNotification__block_invoke;
  v5[3] = &unk_1E6B90840;
  void v5[4] = self;
  [(RTPurgeManager *)self _purgeWithType:3 referenceDate:v4 handler:v5];
}

void __51__RTPurgeManager__handleLanguageChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "error occurred during purge localized data, %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "exiting after processing the language change notification", (uint8_t *)&v7, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) lifeCycleManager];
  [v6 exit];
}

- (id)_dailyReferenceDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:-86400.0];
}

- (id)_shortTermReferenceDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 dateByAddingTimeInterval:-604800.0];
    int v7 = [v5 dateByAddingTimeInterval:-259200.0];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v7];
    id v10 = [(RTPurgeManager *)self _cacheDateDependencyForVisitWithDateInterval:v9];
    [v8 addObject:v10];

    NSUInteger v11 = [(RTPurgeManager *)self _cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:v9];
    [v8 addObject:v11];

    uint64_t v12 = [(RTPurgeManager *)self _cacheDateDependencyLabeledLearnedVisitWithDateInterval:v9];
    [v8 addObject:v12];

    int v13 = [(RTPurgeManager *)self _cacheDateDependencyMomentsWithDateInterval:v9];
    [v8 addObject:v13];

    int v14 = [v8 valueForKeyPath:@"@min.self"];
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", v17, 2u);
    }

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    int v14 = [v6 dateByAddingTimeInterval:-604800.0];
  }

  return v14;
}

- (id)_longTermReferenceDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:-4838400.0];
}

- (id)_determinePruneDate:(id)a3 boundaryInterval:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 startDate];
  id v8 = [v7 laterDate:v6];

  uint64_t v9 = [v5 endDate];

  id v10 = [v8 earlierDate:v9];

  return v10;
}

- (id)_cacheDateDependencyForVisitWithDateInterval:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = 0;
  id v5 = [(RTPurgeManager *)self _lastVisitWithError:&v16];
  id v6 = (__CFString *)v16;
  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyForVisitWithDateInterval, when trying to retrieve lastVisit, got error %@", buf, 0xCu);
    }

LABEL_5:
    id v8 = [v4 startDate];
    goto LABEL_20;
  }
  if (v5)
  {
    uint64_t v9 = [v5 exit];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 entry];
    }
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  int v13 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v12)
    {
      int v14 = [v12 stringFromDate];
    }
    else
    {
      int v14 = @"nil";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v14;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "_cacheDateDependencyForVisitWithDateInterval: lastVisitDate is %@", buf, 0xCu);
    if (v12) {
  }
    }
  if (!v12) {
    goto LABEL_5;
  }
  id v8 = [(RTPurgeManager *)self _determinePruneDate:v12 boundaryInterval:v4];

LABEL_20:

  return v8;
}

- (id)_lastVisitWithError:(id *)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(RTPurgeManager *)self visitStore];

  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v54 = 136315394;
      *(void *)&v54[4] = "-[RTPurgeManager _lastVisitWithError:]";
      *(_WORD *)&v54[12] = 1024;
      *(_DWORD *)&v54[14] = 611;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "_lastVisitWithError, visitStore is nil (in %s:%d)", v54, 0x12u);
    }
  }
  *(void *)uint64_t v54 = 0;
  *(void *)&v54[8] = v54;
  *(void *)&v54[16] = 0x3032000000;
  uint64_t v55 = __Block_byref_object_copy__20;
  int64_t v56 = __Block_byref_object_dispose__20;
  id v57 = 0;
  uint64_t v43 = 0;
  id v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__20;
  v47 = __Block_byref_object_dispose__20;
  id v48 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F5CF58]);
  int v7 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
  id v8 = (void *)[v6 initWithAscending:0 confidence:v7 dateInterval:0 labelVisit:0 limit:&unk_1F344FA18];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(RTPurgeManager *)self visitStore];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __38__RTPurgeManager__lastVisitWithError___block_invoke;
  v39[3] = &unk_1E6B905F0;
  v41 = v54;
  id v42 = &v43;
  id v11 = v9;
  v40 = v11;
  [v10 fetchVisitsWithOptions:v8 handler:v39];

  uint64_t v12 = v11;
  int v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_10;
  }
  __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_188];
  uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  v21 = [v20 filteredArrayUsingPredicate:v19];
  id v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
  v58[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v58 count:1];
  uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;

    char v28 = 0;
  }
  else
  {
LABEL_10:
    id v27 = 0;
    char v28 = 1;
  }

  id v29 = v27;
  if ((v28 & 1) == 0) {
    objc_storeStrong(v44 + 5, v27);
  }
  if (a3 && v44[5])
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = NSStringFromSelector(a2);
      id v36 = v44[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v34;
      __int16 v50 = 2112;
      v51 = v35;
      __int16 v52 = 2112;
      id v53 = v36;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v31 = 0;
    *a3 = v44[5];
  }
  else
  {
    id v31 = *(id *)(*(void *)&v54[8] + 40);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v54, 8);

  return v31;
}

void __38__RTPurgeManager__lastVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  id v5 = [(RTPurgeManager *)self _firstUnlabeledLearnedVisitWithError:&v13];
  uint64_t v6 = (__CFString *)v13;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v15 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyUnlabeledLearnedVisit, when trying to retrieve unlabeled firstVisit, got error %@", buf, 0xCu);
    }

LABEL_5:
    id v8 = [v4 startDate];
    goto LABEL_17;
  }
  if (v5)
  {
    uint64_t v9 = [v5 entryDate];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9)
    {
      id v11 = [v9 stringFromDate];
    }
    else
    {
      id v11 = @"nil";
    }
    *(_DWORD *)buf = 138412290;
    __int16 v15 = v11;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "_cacheDateDependencyUnlabeledLearnedVisitWithDateInterval unlabeled firstVisit.entryDate is %@", buf, 0xCu);
    if (v9) {
  }
    }
  if (!v9) {
    goto LABEL_5;
  }
  id v8 = [(RTPurgeManager *)self _determinePruneDate:v9 boundaryInterval:v4];

LABEL_17:

  return v8;
}

- (id)_firstUnlabeledLearnedVisitWithError:(id *)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(RTPurgeManager *)self learnedLocationStore];

  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      *(void *)&v51[4] = "-[RTPurgeManager _firstUnlabeledLearnedVisitWithError:]";
      *(_WORD *)&v51[12] = 1024;
      *(_DWORD *)&v51[14] = 668;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "_firstUnlabeledLearnedVisitWithError, learnedLocationStore is nil (in %s:%d)", v51, 0x12u);
    }
  }
  *(void *)v51 = 0;
  *(void *)&v51[8] = v51;
  *(void *)&v51[16] = 0x3032000000;
  __int16 v52 = __Block_byref_object_copy__20;
  id v53 = __Block_byref_object_dispose__20;
  id v54 = 0;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__20;
  id v44 = __Block_byref_object_dispose__20;
  id v45 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(RTPurgeManager *)self learnedLocationStore];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __55__RTPurgeManager__firstUnlabeledLearnedVisitWithError___block_invoke;
  v36[3] = &unk_1E6B905F0;
  v38 = v51;
  v39 = &v40;
  uint64_t v9 = v7;
  v37 = v9;
  [v8 fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:v36 limit:&unk_1F344FA18];

  id v10 = v9;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_10;
  }
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  uint64_t v16 = objc_opt_new();
  double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_188];
  uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
  uint64_t v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v22 = (void *)MEMORY[0x1E4F28C58];
  v55[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:1];
  uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_10:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v41 + 5, v25);
  }
  if (a3 && v41[5])
  {
    char v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = NSStringFromSelector(a2);
      id v34 = v41[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v47 = 2112;
      id v48 = v33;
      __int16 v49 = 2112;
      id v50 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v29 = 0;
    *a3 = v41[5];
  }
  else
  {
    id v29 = *(id *)(*(void *)&v51[8] + 40);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v51, 8);

  return v29;
}

void __55__RTPurgeManager__firstUnlabeledLearnedVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_cacheDateDependencyLabeledLearnedVisitWithDateInterval:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  id v5 = [(RTPurgeManager *)self _lastLabeledLearnedVisitWithError:&v13];
  uint64_t v6 = (__CFString *)v13;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v15 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "_cacheDateDependencyLabeledLearnedVisitWithDateInterval, when trying to retrieve labeled lastVisit.exitDate, got error %@", buf, 0xCu);
    }

LABEL_5:
    id v8 = [v4 startDate];
    goto LABEL_17;
  }
  if (v5)
  {
    uint64_t v9 = [v5 exitDate];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9)
    {
      id v11 = [v9 stringFromDate];
    }
    else
    {
      id v11 = @"nil";
    }
    *(_DWORD *)buf = 138412290;
    double v15 = v11;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "_cacheDateDependencyLabeledLearnedVisitWithDateInterval, labeled lastVisit.exitDate is %@", buf, 0xCu);
    if (v9) {
  }
    }
  if (!v9) {
    goto LABEL_5;
  }
  id v8 = [(RTPurgeManager *)self _determinePruneDate:v9 boundaryInterval:v4];

LABEL_17:

  return v8;
}

- (id)_cacheDateDependencyMomentsWithDateInterval:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(RTPurgeManager *)self platform];
  int v8 = [v7 iPhoneDevice];

  if (v8)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v9 = (void *)_MergedGlobals_1;
    uint64_t v21 = _MergedGlobals_1;
    if (!_MergedGlobals_1)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getMOOnboardingManagerClass_block_invoke;
      uint64_t v23 = &unk_1E6B928F8;
      uint64_t v24 = &v18;
      __getMOOnboardingManagerClass_block_invoke((uint64_t)buf);
      uint64_t v9 = (void *)v19[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v18, 8);
    id v11 = [v10 sharedInstance:v18];
    uint64_t v12 = [v11 onboardingFlowCompletionStatus];

    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v13 = [v5 startDate];

      uint64_t v6 = (void *)v13;
    }
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityPurge);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v6 stringFromDate];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v23 = v16;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, onboarding flow completion status, %lu, earliest date required by moments, %@", buf, 0x20u);
    }
  }

  return v6;
}

- (id)_lastLabeledLearnedVisitWithError:(id *)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(RTPurgeManager *)self learnedLocationStore];

  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      *(void *)&v51[4] = "-[RTPurgeManager _lastLabeledLearnedVisitWithError:]";
      *(_WORD *)&v51[12] = 1024;
      *(_DWORD *)&v51[14] = 746;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "_lastLabeledLearnedVisitWithError, learnedLocationStore is nil (in %s:%d)", v51, 0x12u);
    }
  }
  *(void *)v51 = 0;
  *(void *)&v51[8] = v51;
  *(void *)&v51[16] = 0x3032000000;
  __int16 v52 = __Block_byref_object_copy__20;
  id v53 = __Block_byref_object_dispose__20;
  id v54 = 0;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__20;
  id v44 = __Block_byref_object_dispose__20;
  id v45 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  int v8 = [(RTPurgeManager *)self learnedLocationStore];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __52__RTPurgeManager__lastLabeledLearnedVisitWithError___block_invoke;
  v36[3] = &unk_1E6B920C8;
  v38 = v51;
  v39 = &v40;
  uint64_t v9 = v7;
  v37 = v9;
  [v8 fetchLastVisitWithHandler:v36];

  id v10 = v9;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_10;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  uint64_t v16 = objc_opt_new();
  double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_188];
  uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
  uint64_t v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v22 = (void *)MEMORY[0x1E4F28C58];
  v55[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:1];
  uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_10:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v41 + 5, v25);
  }
  if (a3 && v41[5])
  {
    char v28 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = NSStringFromSelector(a2);
      id v34 = v41[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v47 = 2112;
      id v48 = v33;
      __int16 v49 = 2112;
      id v50 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v29 = 0;
    *a3 = v41[5];
  }
  else
  {
    id v29 = *(id *)(*(void *)&v51[8] + 40);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v51, 8);

  return v29;
}

void __52__RTPurgeManager__lastLabeledLearnedVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (OS_dispatch_source)memoryWarningDispatchSource
{
  return self->_memoryWarningDispatchSource;
}

- (void)setMemoryWarningDispatchSource:(id)a3
{
}

- (int64_t)pressureState
{
  return self->_pressureState;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTLifeCycleManager)lifeCycleManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lifeCycleManager);

  return (RTLifeCycleManager *)WeakRetained;
}

- (void)setLifeCycleManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (NSArray)purgers
{
  return self->_purgers;
}

- (void)setPurgers:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_purgers, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_destroyWeak((id *)&self->_lifeCycleManager);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);

  objc_storeStrong((id *)&self->_memoryWarningDispatchSource, 0);
}

@end