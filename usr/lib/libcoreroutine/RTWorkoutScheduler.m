@interface RTWorkoutScheduler
+ (id)taskStateToString:(unint64_t)a3;
+ (id)taskTypeToString:(unint64_t)a3;
- (BOOL)_deviceEligible;
- (BOOL)_didClusterAndSyncOccurInLastInterval;
- (BOOL)_isEligibibleForRelevanceScoreUpdateRetry;
- (BOOL)_isEligibleForClusterAndSync;
- (BOOL)_isEligibleForInitialClusterAndSync;
- (BOOL)_isEligibleForPruneDistanceMatrix;
- (BOOL)_isEligibleForWorkoutComparison;
- (BOOL)_isPasscodeDisabled;
- (BOOL)_isSchedulingWorkDone;
- (BOOL)_isVersionChangeDetected;
- (BOOL)checkRoutinedFootprint;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (FBSDisplayLayoutMonitorConfiguration)configuration;
- (NSDate)lastClusterAndSyncDate;
- (NSDate)lastPruneDistanceMatrixDate;
- (NSDate)lastRelevanceScoreUpdateDate;
- (NSDate)lastSingleWorkoutClusteringDate;
- (NSDate)lastWorkoutComparisonDate;
- (RTBatteryManager)batteryManager;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTHealthKitManager)healthKitManager;
- (RTLocationManager)locationManager;
- (RTPlatform)platform;
- (RTTimer)clusteringDeferralTimer;
- (RTTimerManager)timerManager;
- (RTWorkoutRouteManager)workoutRouteManager;
- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 platform:(id)a9 xpcActivityManager:(id)a10;
- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 timerManager:(id)a9 platform:(id)a10 xpcActivityManager:(id)a11;
- (RTWorkoutSchedulerMetrics)metrics;
- (RTXPCActivityManager)xpcActivityManager;
- (int64_t)_chargerConnectionState;
- (int64_t)encryptedDataAvailability;
- (unint64_t)currentNWorkouts;
- (unint64_t)singleWorkoutClusteringTaskState;
- (unint64_t)topNWorkoutsWithIncrement:(unint64_t)a3;
- (unint64_t)totalWorkouts;
- (unint64_t)updateRelevanceScoreTaskState;
- (void)_clearOutSchedulerState;
- (void)_evaluateSchedulingTaskPriority;
- (void)_evaluateVersionChange;
- (void)_getCurrentLocationAndMonitorForRegion;
- (void)_handleVersionChange;
- (void)_onClusteringTimerExpiry;
- (void)_onCurrentLocationUpdate:(id)a3;
- (void)_onDailyXPCActivity;
- (void)_onDataProtectionNotification:(id)a3;
- (void)_onHealthKitNotification;
- (void)_onLayoutMonitorUpdateDisplayBacklightLevelNotification:(int64_t)a3;
- (void)_registerForCircularRegionEvents;
- (void)_scheduleClusteringTask:(unint64_t)a3;
- (void)_schedulePruneDistanceMatrix;
- (void)_scheduleSingleWorkoutClustering;
- (void)_scheduleUpdateRelevanceScore;
- (void)_scheduleWorkoutComparisonIfCharging;
- (void)_setup;
- (void)_setupDisplayLayoutMonitor;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startClusteringDeferralTimerWithLatency:(double)a3;
- (void)clearTaskStatesWithHandler:(id)a3;
- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5;
- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4;
- (void)logTaskStates;
- (void)onCurrentLocationUpdate:(id)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)onHealthKitNotification;
- (void)readTaskStates;
- (void)saveTaskStates;
- (void)setBatteryManager:(id)a3;
- (void)setClusteringDeferralTimer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCurrentNWorkouts:(unint64_t)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setLastClusterAndSyncDate:(id)a3;
- (void)setLastPruneDistanceMatrixDate:(id)a3;
- (void)setLastRelevanceScoreUpdateDate:(id)a3;
- (void)setLastSingleWorkoutClusteringDate:(id)a3;
- (void)setLastWorkoutComparisonDate:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setSingleWorkoutClusteringTaskState:(unint64_t)a3;
- (void)setTimerManager:(id)a3;
- (void)setTotalWorkouts:(unint64_t)a3;
- (void)setUpdateRelevanceScoreTaskState:(unint64_t)a3;
- (void)setWorkoutRouteManager:(id)a3;
- (void)setXpcActivityManager:(id)a3;
@end

@implementation RTWorkoutScheduler

+ (id)taskStateToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"RTWorkoutSchedulerTaskStateUnknown";
  }
  else {
    return off_1E6B9D180[a3 - 1];
  }
}

+ (id)taskTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9D198[a3 - 1];
  }
}

- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 platform:(id)a9 xpcActivityManager:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_alloc_init(RTTimerManager);
  v26 = [(RTWorkoutScheduler *)self initWithBatteryManager:v24 dataProtectionManager:v23 workoutRouteManager:v22 healthKitManager:v21 locationManager:v20 defaultsManager:v19 timerManager:v25 platform:v18 xpcActivityManager:v17];

  return v26;
}

- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 timerManager:(id)a9 platform:(id)a10 xpcActivityManager:(id)a11
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v37 = a5;
  id v19 = a5;
  id v38 = a6;
  id v20 = a6;
  id v39 = a7;
  id v21 = a7;
  id v40 = a8;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v41 = v17;
  if (!v17)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: batteryManager";
LABEL_29:
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_30;
  }
  if (!v18)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: dataProtectionManager";
    goto LABEL_29;
  }
  if (!v19)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: workoutRouteManager";
    goto LABEL_29;
  }
  if (!v20)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_29;
  }
  if (!v21)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_29;
  }
  if (!v22)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_29;
  }
  if (!v23)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_29;
  }
  if (!v24)
  {
    v30 = v25;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v32 = "Invalid parameter not satisfying: platform";
      goto LABEL_29;
    }
LABEL_30:

    v28 = 0;
    v29 = v41;
    goto LABEL_31;
  }
  id v35 = v25;
  if (v25)
  {
    v43.receiver = self;
    v43.super_class = (Class)RTWorkoutScheduler;
    v26 = [(RTNotifier *)&v43 init];
    p_isa = (id *)&v26->super.super.super.isa;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_batteryManager, a3);
      objc_storeStrong(p_isa + 6, obj);
      objc_storeStrong(p_isa + 7, v37);
      objc_storeStrong(p_isa + 8, v38);
      objc_storeStrong(p_isa + 9, v39);
      objc_storeStrong(p_isa + 11, v40);
      objc_storeStrong(p_isa + 10, a9);
      objc_storeStrong(p_isa + 12, a10);
      objc_storeStrong(p_isa + 5, a11);
      [p_isa setup];
    }
    v28 = p_isa;
    self = v28;
    v29 = v17;
  }
  else
  {
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = v17;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", buf, 2u);
    }

    v28 = 0;
  }
  v30 = v35;
LABEL_31:

  return v28;
}

- (void)_setup
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [[RTWorkoutSchedulerMetrics alloc] initWithDefaultsManager:self->_defaultsManager];
  [(RTWorkoutScheduler *)self setMetrics:v4];

  if (_os_feature_enabled_impl())
  {
    if ([(RTWorkoutScheduler *)self _deviceEligible])
    {
      v5 = [(RTWorkoutScheduler *)self defaultsManager];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];

      v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Starting Workout Scheduler", buf, 2u);
      }

      self->_singleWorkoutClusteringTaskState = 0;
      self->_updateRelevanceScoreTaskState = 0;
      self->_currentNWorkouts = 0;
      [(RTWorkoutScheduler *)self readTaskStates];
      v7 = [(RTWorkoutScheduler *)self lastPruneDistanceMatrixDate];

      if (!v7)
      {
        v8 = [MEMORY[0x1E4F1C9C8] now];
        [(RTWorkoutScheduler *)self setLastPruneDistanceMatrixDate:v8];
      }
      v9 = [(RTWorkoutScheduler *)self healthKitManager];
      v10 = +[RTNotification notificationName];
      [v9 addObserver:self selector:sel_onHealthKitNotification name:v10];

      v11 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:1 allowBattery:86400.0 powerNap:60.0];
      v12 = [(RTWorkoutScheduler *)self xpcActivityManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __28__RTWorkoutScheduler__setup__block_invoke;
      v22[3] = &unk_1E6B9D0C0;
      v22[4] = self;
      [v12 registerActivityWithIdentifier:@"com.apple.routined.workoutScheduler.daily" criteria:v11 handler:v22];

      [(RTWorkoutScheduler *)self _registerForCircularRegionEvents];
      [(RTWorkoutScheduler *)self _getCurrentLocationAndMonitorForRegion];
      if ([(RTWorkoutScheduler *)self _isPasscodeDisabled])
      {
        [(RTWorkoutScheduler *)self _setupDisplayLayoutMonitor];
      }
      else
      {
        dataProtectionManager = self->_dataProtectionManager;
        id v18 = +[RTNotification notificationName];
        [(RTNotifier *)dataProtectionManager addObserver:self selector:sel_onDataProtectionNotification_ name:v18];
      }
    }
    else
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v19 = (objc_class *)objc_opt_class();
        id v20 = NSStringFromClass(v19);
        id v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v24 = v20;
        __int16 v25 = 2112;
        v26 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, feature not supported on this device", buf, 0x16u);
      }
      v11 = [(RTWorkoutScheduler *)self defaultsManager];
      [(RTXPCActivityCriteria *)v11 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"];
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = (RTXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v24 = v14;
      __int16 v25 = 2112;
      v26 = v15;
      _os_log_error_impl(&dword_1D9BFA000, &v11->super, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);
    }
  }
}

void __28__RTWorkoutScheduler__setup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__RTWorkoutScheduler__setup__block_invoke_2;
  v6[3] = &unk_1E6B90CE0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __28__RTWorkoutScheduler__setup__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _onDailyXPCActivity];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)_deviceEligible
{
  id v3 = [(RTWorkoutScheduler *)self platform];
  if ([v3 internalInstall])
  {
    v4 = [(RTWorkoutScheduler *)self defaultsManager];
    id v5 = [v4 objectForKey:@"RTDefaultsWorkoutSchedulerBypassPlatformCheckKey"];

    if (v5)
    {
      v6 = [(RTWorkoutScheduler *)self defaultsManager];
      id v7 = v6;
      v8 = @"RTDefaultsWorkoutSchedulerBypassPlatformCheckKey";
LABEL_8:
      v12 = [v6 objectForKey:v8];
      char v13 = [v12 BOOLValue];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v9 = [(RTWorkoutScheduler *)self platform];
  if ([v9 internalInstall])
  {
    v10 = [(RTWorkoutScheduler *)self defaultsManager];
    v11 = [v10 objectForKey:@"RTDefaultsWorkoutSchedulerBypassDeviceEligibility"];

    if (v11)
    {
      v6 = [(RTWorkoutScheduler *)self defaultsManager];
      id v7 = v6;
      v8 = @"RTDefaultsWorkoutSchedulerBypassDeviceEligibility";
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [(RTWorkoutScheduler *)self platform];
  if (![v7 iPhoneDevice])
  {
    BOOL v14 = 0;
    goto LABEL_14;
  }
  v12 = [(RTWorkoutScheduler *)self platform];
  char v13 = [v12 isWatchPaired];
LABEL_12:
  BOOL v14 = v13;

LABEL_14:
  return v14;
}

- (BOOL)_isPasscodeDisabled
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__172;
  id v37 = __Block_byref_object_dispose__172;
  id v38 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(RTWorkoutScheduler *)self dataProtectionManager];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __41__RTWorkoutScheduler__isPasscodeDisabled__block_invoke;
  v29 = &unk_1E6B92050;
  v31 = &v39;
  v32 = &v33;
  id v5 = v3;
  v30 = v5;
  [v4 fetchLockStateDisabledWithHandler:&v26];

  v6 = v5;
  id v7 = [MEMORY[0x1E4F1C9C8] now:v26, v27, v28, v29];
  dispatch_time_t v8 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v6, v8)) {
    goto LABEL_6;
  }
  v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSinceDate:v7];
  double v11 = v10;
  v12 = objc_opt_new();
  char v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_125];
  BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
  v15 = [v14 filteredArrayUsingPredicate:v13];
  v16 = [v15 firstObject];

  [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v43 count:1];
  id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v19];

  if (v20)
  {
    id v21 = v20;

    char v22 = 0;
  }
  else
  {
LABEL_6:
    id v21 = 0;
    char v22 = 1;
  }

  id v23 = v21;
  if ((v22 & 1) == 0) {
    objc_storeStrong(v34 + 5, v21);
  }
  BOOL v24 = *((unsigned char *)v40 + 24) != 0;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v24;
}

void __41__RTWorkoutScheduler__isPasscodeDisabled__block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isVersionChangeDetected
{
  v2 = [(RTWorkoutScheduler *)self defaultsManager];
  dispatch_semaphore_t v3 = [v2 objectForKey:@"RTDefaultsWorkoutSchedulerVersionRaceRouteKey"];

  if (v3) {
    BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 9;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_evaluateVersionChange
{
  if ([(RTWorkoutScheduler *)self _isVersionChangeDetected])
  {
    [(RTWorkoutScheduler *)self _handleVersionChange];
  }
}

- (void)_handleVersionChange
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  char v42 = __Block_byref_object_copy__172;
  uint64_t v43 = __Block_byref_object_dispose__172;
  id v44 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(RTWorkoutScheduler *)self workoutRouteManager];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __42__RTWorkoutScheduler__handleVersionChange__block_invoke;
  v36[3] = &unk_1E6B90728;
  id v38 = &v39;
  v6 = v4;
  id v37 = v6;
  LOBYTE(v35) = 1;
  [v5 processWorkoutsClearClusters:1 clearExistingDistanceMatrix:1 buildDistanceMatrix:0 syncClustersToHealhtKit:1 syncClustersToWatch:0 filteringDistanceThreshold:0x7FFFFFFFLL topNWorkouts:1.79769313e308 isSchedulerTriggered:v35 handler:v36];

  id v7 = v6;
  dispatch_time_t v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  double v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  char v13 = objc_opt_new();
  BOOL v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_125];
  v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  v16 = [v15 filteredArrayUsingPredicate:v14];
  id v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v19 = (void *)MEMORY[0x1E4F28C58];
  v50[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v50 count:1];
  id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

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
  if (v40[5])
  {
    BOOL v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = NSStringFromSelector(a2);
      v28 = (void *)v40[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v26;
      __int16 v46 = 2112;
      id v47 = v27;
      __int16 v48 = 2112;
      v49 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, %@, Failed to clear out Workout related Routine and HealthKit Data, error, %@", buf, 0x20u);
    }
  }
  else
  {
    [(RTWorkoutScheduler *)self _clearOutSchedulerState];
    v29 = [(RTWorkoutScheduler *)self defaultsManager];
    [v29 setObject:&unk_1F3452898 forKey:@"RTDefaultsWorkoutSchedulerVersionRaceRouteKey"];

    BOOL v24 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [(RTWorkoutScheduler *)self defaultsManager];
      v34 = [v33 objectForKey:@"RTDefaultsWorkoutSchedulerVersionRaceRouteKey"];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v46 = 2112;
      id v47 = v32;
      __int16 v48 = 2112;
      v49 = v34;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, Successfully cleared out Routine Workout Data, Scheduler State and HealthKit Cluster data; updated versi"
        "on-key to disk to %@",
        buf,
        0x20u);
    }
  }

  _Block_object_dispose(&v39, 8);
}

void __42__RTWorkoutScheduler__handleVersionChange__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_clearOutSchedulerState
{
  [(RTWorkoutScheduler *)self setCurrentNWorkouts:0];
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(RTWorkoutScheduler *)self setLastWorkoutComparisonDate:v3];

  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(RTWorkoutScheduler *)self setLastClusterAndSyncDate:v4];

  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(RTWorkoutScheduler *)self setLastRelevanceScoreUpdateDate:v5];

  v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(RTWorkoutScheduler *)self setLastSingleWorkoutClusteringDate:v6];

  [(RTWorkoutScheduler *)self setUpdateRelevanceScoreTaskState:0];

  [(RTWorkoutScheduler *)self setSingleWorkoutClusteringTaskState:0];
}

- (void)_startClusteringDeferralTimerWithLatency:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  clusteringDeferralTimer = self->_clusteringDeferralTimer;
  if (clusteringDeferralTimer)
  {
    [(RTTimer *)clusteringDeferralTimer invalidate];
    id v7 = self->_clusteringDeferralTimer;
    self->_clusteringDeferralTimer = 0;
  }
  timerManager = self->_timerManager;
  dispatch_time_t v9 = [(RTNotifier *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__RTWorkoutScheduler__startClusteringDeferralTimerWithLatency___block_invoke;
  v16[3] = &unk_1E6B90E70;
  v16[4] = self;
  double v10 = [(RTTimerManager *)timerManager timerWithIdentifier:@"RTWorkoutSchedulerClusteringTimer" queue:v9 handler:v16];
  double v11 = self->_clusteringDeferralTimer;
  self->_clusteringDeferralTimer = v10;

  [(RTTimer *)self->_clusteringDeferralTimer fireWithInterval:a3];
  [(RTTimer *)self->_clusteringDeferralTimer resume];
  double v12 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    char v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v15;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f", buf, 0x20u);
  }
}

uint64_t __63__RTWorkoutScheduler__startClusteringDeferralTimerWithLatency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onClusteringTimerExpiry];
}

- (void)_onClusteringTimerExpiry
{
  [(RTTimer *)self->_clusteringDeferralTimer invalidate];
  clusteringDeferralTimer = self->_clusteringDeferralTimer;
  self->_clusteringDeferralTimer = 0;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Shutdown Workout Scheduler", buf, 2u);
  }

  v6 = [(RTWorkoutScheduler *)self dataProtectionManager];
  [v6 removeObserver:self];

  id v7 = [(RTWorkoutScheduler *)self displayLayoutMonitor];
  [v7 invalidate];

  dispatch_time_t v8 = [(RTWorkoutScheduler *)self locationManager];
  uint64_t v10 = 0;
  [v8 stopMonitoringAllRegionsForClientIdentifier:@"RTWorkoutSchedulerRegionChange" error:&v10];

  dispatch_time_t v9 = [(RTWorkoutScheduler *)self healthKitManager];
  [v9 removeObserver:self];

  [(RTWorkoutScheduler *)self saveTaskStates];
  v4[2](v4, 0);
}

- (void)clearTaskStatesWithHandler:(id)a3
{
  id v5 = a3;
  v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTWorkoutScheduler_clearTaskStatesWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __49__RTWorkoutScheduler_clearTaskStatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    dispatch_semaphore_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v14 = 138412546;
    v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v14, 0x16u);
  }
  v6 = [*(id *)(a1 + 32) platform];
  int v7 = [v6 internalInstall];

  if (v7)
  {
    [*(id *)(a1 + 32) setSingleWorkoutClusteringTaskState:0];
    [*(id *)(a1 + 32) setUpdateRelevanceScoreTaskState:0];
    [*(id *)(a1 + 32) setCurrentNWorkouts:0];
    dispatch_time_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    [*(id *)(a1 + 32) setLastWorkoutComparisonDate:v8];

    id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    [*(id *)(a1 + 32) setLastClusterAndSyncDate:v9];

    SEL v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    [*(id *)(a1 + 32) setLastSingleWorkoutClusteringDate:v10];

    double v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    [*(id *)(a1 + 32) setLastRelevanceScoreUpdateDate:v11];

    double v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    [*(id *)(a1 + 32) setLastPruneDistanceMatrixDate:v12];

    [*(id *)(a1 + 32) saveTaskStates];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

- (void)saveTaskStates
{
  defaultsManager = self->_defaultsManager;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_singleWorkoutClusteringTaskState];
  [(RTDefaultsManager *)defaultsManager setObject:v4 forKey:@"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey"];

  id v5 = self->_defaultsManager;
  v6 = [NSNumber numberWithUnsignedInteger:self->_updateRelevanceScoreTaskState];
  [(RTDefaultsManager *)v5 setObject:v6 forKey:@"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey"];

  int v7 = self->_defaultsManager;
  dispatch_time_t v8 = [NSNumber numberWithUnsignedInteger:self->_currentNWorkouts];
  [(RTDefaultsManager *)v7 setObject:v8 forKey:@"RTDefaultsWorkoutSchedulerTopNWorkoutsKey"];

  [(RTDefaultsManager *)self->_defaultsManager setObject:self->_lastWorkoutComparisonDate forKey:@"RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"];
  [(RTDefaultsManager *)self->_defaultsManager setObject:self->_lastClusterAndSyncDate forKey:@"RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"];
  [(RTDefaultsManager *)self->_defaultsManager setObject:self->_lastSingleWorkoutClusteringDate forKey:@"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"];
  [(RTDefaultsManager *)self->_defaultsManager setObject:self->_lastRelevanceScoreUpdateDate forKey:@"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"];
  id v9 = self->_defaultsManager;
  lastPruneDistanceMatrixDate = self->_lastPruneDistanceMatrixDate;

  [(RTDefaultsManager *)v9 setObject:lastPruneDistanceMatrixDate forKey:@"RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"];
}

- (void)readTaskStates
{
  dispatch_semaphore_t v3 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey"];
  self->_singleWorkoutClusteringTaskState = [v3 unsignedIntegerValue];

  id v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey"];
  self->_updateRelevanceScoreTaskState = [v4 unsignedIntegerValue];

  id v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerTopNWorkoutsKey"];
  self->_currentNWorkouts = [v5 unsignedIntegerValue];

  v6 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"];
  lastWorkoutComparisonDate = self->_lastWorkoutComparisonDate;
  self->_lastWorkoutComparisonDate = v6;

  dispatch_time_t v8 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"];
  lastClusterAndSyncDate = self->_lastClusterAndSyncDate;
  self->_lastClusterAndSyncDate = v8;

  SEL v10 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"];
  lastSingleWorkoutClusteringDate = self->_lastSingleWorkoutClusteringDate;
  self->_lastSingleWorkoutClusteringDate = v10;

  double v12 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"];
  lastRelevanceScoreUpdateDate = self->_lastRelevanceScoreUpdateDate;
  self->_lastRelevanceScoreUpdateDate = v12;

  self->_lastPruneDistanceMatrixDate = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"];

  MEMORY[0x1F41817F8]();
}

- (void)logTaskStates
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    int v14 = NSStringFromClass(v5);
    v6 = NSStringFromSelector(a2);
    int v7 = [(NSDate *)self->_lastClusterAndSyncDate stringFromDate];
    dispatch_time_t v8 = [(NSDate *)self->_lastWorkoutComparisonDate stringFromDate];
    unint64_t currentNWorkouts = self->_currentNWorkouts;
    SEL v10 = +[RTWorkoutScheduler taskStateToString:self->_singleWorkoutClusteringTaskState];
    double v11 = [(NSDate *)self->_lastSingleWorkoutClusteringDate stringFromDate];
    double v12 = +[RTWorkoutScheduler taskStateToString:self->_updateRelevanceScoreTaskState];
    uint64_t v13 = [(NSDate *)self->_lastRelevanceScoreUpdateDate stringFromDate];
    *(_DWORD *)buf = 138414338;
    __int16 v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    double v22 = v8;
    __int16 v23 = 2048;
    unint64_t v24 = currentNWorkouts;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, lastClusterAndSyncDate, %@, lastWorkoutComparisonDate, %@, processed workouts, %lu, singleWorkoutClustering, %@, date, %@, relevanceScoreUpdate, %@, date, %@", buf, 0x5Cu);
  }
}

- (BOOL)_isSchedulingWorkDone
{
  uint64_t v3 = [(RTWorkoutScheduler *)self lastWorkoutComparisonDate];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(RTWorkoutScheduler *)self lastClusterAndSyncDate];

    if (!v5) {
      goto LABEL_8;
    }
    if ([(RTWorkoutScheduler *)self _isEligibleForPruneDistanceMatrix]) {
      goto LABEL_8;
    }
    if (![(RTWorkoutScheduler *)self totalWorkouts]) {
      goto LABEL_7;
    }
    unint64_t v6 = [(RTWorkoutScheduler *)self currentNWorkouts];
    if (v6 != [(RTWorkoutScheduler *)self totalWorkouts]) {
      goto LABEL_8;
    }
    int v7 = [(RTWorkoutScheduler *)self lastClusterAndSyncDate];
    dispatch_time_t v8 = [(RTWorkoutScheduler *)self lastWorkoutComparisonDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 <= 0.0)
    {
LABEL_8:
      LOBYTE(v3) = 0;
    }
    else
    {
LABEL_7:
      double v11 = [(RTWorkoutScheduler *)self defaultsManager];
      double v12 = [MEMORY[0x1E4F1C9C8] now];
      [v11 setObject:v12 forKey:@"RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"];

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_isEligibleForInitialClusterAndSync
{
  unint64_t v3 = [(RTWorkoutScheduler *)self currentNWorkouts];
  if (!v3)
  {
    id v4 = [(RTWorkoutScheduler *)self defaultsManager];
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    [v4 setObject:v5 forKey:@"RTDefaultsWorkoutSchedulerWorldBuildStartTimeKey"];

    unint64_t v6 = [(RTWorkoutScheduler *)self defaultsManager];
    int v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v6 setObject:v7 forKey:@"RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"];
  }
  return v3 == 0;
}

- (BOOL)_isEligibleForWorkoutComparison
{
  unint64_t v3 = [(RTWorkoutScheduler *)self currentNWorkouts];
  return v3 < [(RTWorkoutScheduler *)self totalWorkouts];
}

- (BOOL)_didClusterAndSyncOccurInLastInterval
{
  unint64_t v3 = [(RTWorkoutScheduler *)self platform];
  if ([v3 internalInstall])
  {
    id v4 = [(RTWorkoutScheduler *)self defaultsManager];
    id v5 = [v4 objectForKey:@"RTWorkoutSchedulerClusterAndSyncIntervalOverrideKey"];

    if (!v5)
    {
      double v8 = 86400.0;
      goto LABEL_7;
    }
    unint64_t v3 = [(RTWorkoutScheduler *)self defaultsManager];
    unint64_t v6 = [v3 objectForKey:@"RTWorkoutSchedulerClusterAndSyncIntervalOverrideKey"];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 86400.0;
  }

LABEL_7:
  double v9 = [MEMORY[0x1E4F1C9C8] date];
  double v10 = [(RTWorkoutScheduler *)self lastClusterAndSyncDate];
  [v9 timeIntervalSinceDate:v10];
  BOOL v12 = v11 < v8;

  return v12;
}

- (BOOL)_isEligibleForClusterAndSync
{
  unint64_t v3 = [(RTWorkoutScheduler *)self lastClusterAndSyncDate];
  if (v3)
  {
    if ([(RTWorkoutScheduler *)self _didClusterAndSyncOccurInLastInterval])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v5 = [(RTWorkoutScheduler *)self lastWorkoutComparisonDate];
      unint64_t v6 = [(RTWorkoutScheduler *)self lastClusterAndSyncDate];
      [v5 timeIntervalSinceDate:v6];
      BOOL v4 = v7 > 0.0;
    }
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)_isEligibibleForRelevanceScoreUpdateRetry
{
  uint64_t v3 = [(RTWorkoutScheduler *)self lastRelevanceScoreUpdateDate];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    id v5 = [(RTWorkoutScheduler *)self lastRelevanceScoreUpdateDate];
    unint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v7 = [v5 isEqualToDate:v6];

    if (v7) {
      goto LABEL_5;
    }
    double v8 = [MEMORY[0x1E4F1C9C8] date];
    double v9 = [(RTWorkoutScheduler *)self lastRelevanceScoreUpdateDate];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    if (v11 <= 86400.0) {
LABEL_5:
    }
      LOBYTE(v3) = 0;
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_isEligibleForPruneDistanceMatrix
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v4 = [(RTWorkoutScheduler *)self lastPruneDistanceMatrixDate];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 > 604800.0;

  return v6;
}

- (void)onDataProtectionNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__RTWorkoutScheduler_onDataProtectionNotification___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v8 = [v4 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    char v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      v15 = "-[RTWorkoutScheduler onDataProtectionNotification:]";
      __int16 v16 = 1024;
      int v17 = 588;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __51__RTWorkoutScheduler_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDataProtectionNotification:*(void *)(a1 + 40)];
}

- (void)_onDataProtectionNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      int v10 = 138412802;
      id v11 = v9;
      __int16 v12 = 2080;
      uint64_t v13 = "-[RTWorkoutScheduler _onDataProtectionNotification:]";
      __int16 v14 = 1024;
      int v15 = 595;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);
    }
  }
  -[RTWorkoutScheduler setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", [v4 availability]);
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = +[RTDataProtectionManager encryptedDataAvailabilityToString:[(RTWorkoutScheduler *)self encryptedDataAvailability]];
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Received keybag notification, %@", (uint8_t *)&v10, 0xCu);
  }
  if ([(RTWorkoutScheduler *)self encryptedDataAvailability] == 3)
  {
    [(RTWorkoutScheduler *)self _evaluateVersionChange];
    [(RTWorkoutScheduler *)self _evaluateSchedulingTaskPriority];
  }
}

- (void)_evaluateSchedulingTaskPriority
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(RTWorkoutScheduler *)self logTaskStates];
  if (self->_clusteringDeferralTimer)
  {
    id v4 = [(RTWorkoutScheduler *)self defaultsManager];
    double v5 = [v4 objectForKey:@"RTDefaultsWorkoutSchedulerBypassBackoffTimerKey"];
    char v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      id v26 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        __int16 v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v48 = v28;
        __int16 v49 = 2112;
        v50 = v29;
        __int16 v51 = 2048;
        uint64_t v52 = 0x40AC200000000000;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, defering attempt to perform tasks; pending backoff timer:  main entry point happens only once per %.2f sec",
          buf,
          0x20u);
      }
      __int16 v12 = [(RTWorkoutScheduler *)self metrics];
      id v13 = v12;
      __int16 v14 = @"RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount";
      goto LABEL_16;
    }
  }
  [(RTWorkoutScheduler *)self _startClusteringDeferralTimerWithLatency:3600.0];
  if ([(RTWorkoutScheduler *)self checkRoutinedFootprint])
  {
    char v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      int v10 = NSStringFromSelector(a2);
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413058;
      __int16 v48 = v9;
      __int16 v49 = 2112;
      v50 = v10;
      __int16 v51 = 2048;
      uint64_t v52 = v11;
      __int16 v53 = 2048;
      uint64_t v54 = 18;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, defering attempt to cluster; exceeding memory threshold, current footprint, %.4f MB, footprint threshold, %lu MB",
        buf,
        0x2Au);
    }
    __int16 v12 = [(RTWorkoutScheduler *)self metrics];
    id v13 = v12;
    __int16 v14 = @"RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount";
LABEL_16:
    [v12 incrementMetricDefaultForKey:v14];
    goto LABEL_17;
  }
  int v15 = [(RTWorkoutScheduler *)self healthKitManager];
  [v15 createNewWorkoutClusterStore];

  uint64_t v16 = [(RTWorkoutScheduler *)self healthKitManager];
  int v17 = [(RTWorkoutScheduler *)self healthKitManager];
  uint64_t v18 = [v17 _getWorkoutDefaultStartDateForRaceRoute];
  id v46 = 0;
  uint64_t v19 = [v16 getWorkoutsCountWithStartDate:v18 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:&v46 error:1.79769313e308];
  id v13 = v46;
  [(RTWorkoutScheduler *)self setTotalWorkouts:v19];

  id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = (objc_class *)objc_opt_class();
    double v22 = NSStringFromClass(v21);
    __int16 v23 = NSStringFromSelector(a2);
    unint64_t v24 = [(RTWorkoutScheduler *)self currentNWorkouts];
    unint64_t v25 = [(RTWorkoutScheduler *)self totalWorkouts];
    *(_DWORD *)buf = 138413314;
    __int16 v48 = v22;
    __int16 v49 = 2112;
    v50 = v23;
    __int16 v51 = 2048;
    uint64_t v52 = v24;
    __int16 v53 = 2048;
    uint64_t v54 = v25;
    __int16 v55 = 2112;
    id v56 = v13;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, remaining work, current, %lu, total, %lu, error, %@", buf, 0x34u);
  }
  if (!v13)
  {
    if ([(RTWorkoutScheduler *)self _isEligibibleForRelevanceScoreUpdateRetry])
    {
      [(RTWorkoutScheduler *)self setUpdateRelevanceScoreTaskState:2];
LABEL_12:
      [(RTWorkoutScheduler *)self _scheduleUpdateRelevanceScore];
LABEL_24:
      id v13 = 0;
      goto LABEL_17;
    }
    unint64_t v30 = [(RTWorkoutScheduler *)self currentNWorkouts];
    if (v30 > [(RTWorkoutScheduler *)self totalWorkouts])
    {
      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = (objc_class *)objc_opt_class();
        uint64_t v33 = NSStringFromClass(v32);
        v34 = NSStringFromSelector(a2);
        unint64_t v35 = [(RTWorkoutScheduler *)self currentNWorkouts];
        unint64_t v36 = [(RTWorkoutScheduler *)self totalWorkouts];
        *(_DWORD *)buf = 138413314;
        __int16 v48 = v33;
        __int16 v49 = 2112;
        v50 = v34;
        __int16 v51 = 2048;
        uint64_t v52 = v35;
        __int16 v53 = 2048;
        uint64_t v54 = v36;
        __int16 v55 = 2112;
        id v56 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, Failed Scheduler State; currentNWorkouts(topN) shouldn't be more than totalWorkouts, current %lu, tota"
          "l, %lu, error, %@",
          buf,
          0x34u);
      }
      goto LABEL_23;
    }
    if ([(RTWorkoutScheduler *)self _isSchedulingWorkDone])
    {
      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      uint64_t v45 = (objc_class *)objc_opt_class();
      char v42 = NSStringFromClass(v45);
      uint64_t v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v48 = v42;
      __int16 v49 = 2112;
      v50 = v43;
      id v44 = "%@, %@, scheduling work is done";
    }
    else
    {
      if ([(RTWorkoutScheduler *)self _isEligibleForInitialClusterAndSync])
      {
        [(RTWorkoutScheduler *)self _scheduleClusteringTask:1];
        goto LABEL_12;
      }
      if ([(RTWorkoutScheduler *)self _isEligibleForClusterAndSync])
      {
        [(RTWorkoutScheduler *)self _scheduleClusteringTask:3];
        id v37 = [MEMORY[0x1E4F1C9C8] date];
        id v38 = [(RTWorkoutScheduler *)self lastRelevanceScoreUpdateDate];
        [v37 timeIntervalSinceDate:v38];
        double v40 = v39;

        if (v40 <= 86400.0
          || [(RTWorkoutScheduler *)self updateRelevanceScoreTaskState] == 1)
        {
          goto LABEL_24;
        }
        goto LABEL_12;
      }
      if ([(RTWorkoutScheduler *)self _isEligibleForWorkoutComparison])
      {
        [(RTWorkoutScheduler *)self _scheduleClusteringTask:2];
        goto LABEL_24;
      }
      if ([(RTWorkoutScheduler *)self _isEligibleForPruneDistanceMatrix])
      {
        [(RTWorkoutScheduler *)self _schedulePruneDistanceMatrix];
        goto LABEL_24;
      }
      __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v41 = (objc_class *)objc_opt_class();
      char v42 = NSStringFromClass(v41);
      uint64_t v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v48 = v42;
      __int16 v49 = 2112;
      v50 = v43;
      id v44 = "%@, %@, no eligble tasks at this time";
    }
    _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, v44, buf, 0x16u);

    goto LABEL_23;
  }
LABEL_17:
}

- (BOOL)checkRoutinedFootprint
{
  +[RTRuntime footprint];
  return v2 > 18.0;
}

- (void)onHealthKitNotification
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__RTWorkoutScheduler_onHealthKitNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __45__RTWorkoutScheduler_onHealthKitNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onHealthKitNotification];
}

- (void)_onHealthKitNotification
{
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Received new workout from HK", v4, 2u);
  }

  if ([(RTWorkoutScheduler *)self encryptedDataAvailability] == 2)
  {
    [(RTWorkoutScheduler *)self _scheduleSingleWorkoutClustering];
  }
  else
  {
    [(RTWorkoutScheduler *)self setSingleWorkoutClusteringTaskState:2];
    if (self->_clusteringDeferralTimer) {
      [(RTWorkoutScheduler *)self _startClusteringDeferralTimerWithLatency:600.0];
    }
  }
}

- (void)_scheduleSingleWorkoutClustering
{
  [(RTWorkoutScheduler *)self setSingleWorkoutClusteringTaskState:3];
  id v4 = [(RTWorkoutScheduler *)self metrics];
  [v4 startCollectMetricsTaskType:6 totalNAtStart:-[RTWorkoutScheduler totalWorkouts]];

  double v5 = [(RTWorkoutScheduler *)self healthKitManager];
  char v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  char v7 = [(RTWorkoutScheduler *)self healthKitManager];
  double v8 = [v7 _getRTWorkoutDefaultTypesForRaceRoute];
  id v14 = 0;
  double v9 = [v5 getLatestWorkoutWithStartDate:v6 nearLocation:0 distanceThreshold:1 onlySourcedFromFitnessApp:0 includePastureModeRoutes:v8 workoutTypes:&v14 error:1.79769313e308];
  id v10 = v14;

  if (v9)
  {
    uint64_t v11 = [(RTWorkoutScheduler *)self workoutRouteManager];
    __int16 v12 = [v9 UUID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke;
    v13[3] = &unk_1E6B90CB8;
    v13[4] = self;
    v13[5] = a2;
    [v11 processNewlyAddedWorkout:v12 handler:v13];
  }
}

void __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke_2;
  block[3] = &unk_1E6B91220;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  block[4] = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) metrics];
  [v7 stopCollectMetricsTaskType:6];

  if (!*(void *)(a1 + 40))
  {
    double v8 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 32) setLastSingleWorkoutClusteringDate:v8];

    [*(id *)(a1 + 32) setSingleWorkoutClusteringTaskState:1];
  }
}

- (void)_scheduleClusteringTask:(unint64_t)a3
{
  uint64_t v6 = 1;
  switch(a3)
  {
    case 1uLL:
      uint64_t v7 = 30;
      goto LABEL_6;
    case 3uLL:
      uint64_t v9 = 0;
      unint64_t v8 = 0;
      unint64_t v10 = 1;
      goto LABEL_8;
    case 2uLL:
      uint64_t v6 = 0;
      uint64_t v7 = 10;
LABEL_6:
      unint64_t v8 = [(RTWorkoutScheduler *)self topNWorkoutsWithIncrement:v7];
      uint64_t v9 = 1;
      unint64_t v10 = a3;
LABEL_8:
      __int16 v11 = [(RTWorkoutScheduler *)self metrics];
      [v11 startCollectMetricsTaskType:v10 totalNAtStart:-[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts")];

      __int16 v12 = [(RTWorkoutScheduler *)self workoutRouteManager];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke;
      v15[3] = &unk_1E6B9D110;
      v15[4] = self;
      v15[5] = a2;
      v15[6] = a3;
      v15[7] = v8;
      v15[8] = v10;
      LOBYTE(v14) = 1;
      [v12 processWorkoutsClearClusters:0 clearExistingDistanceMatrix:0 buildDistanceMatrix:v9 syncClustersToHealhtKit:v6 syncClustersToWatch:v6 filteringDistanceThreshold:v8 topNWorkouts:1.79769313e308 isSchedulerTriggered:v14 handler:v15];

      return;
  }
  __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "RTWorkoutSchedulerTaskTypeUnknown Error", buf, 2u);
  }
}

void __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke_2;
  v8[3] = &unk_1E6B9D0E8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  long long v11 = *(_OWORD *)(a1 + 48);
  v8[4] = v5;
  uint64_t v12 = *(void *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = [(id)objc_opt_class() taskTypeToString:*(void *)(a1 + 56)];
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    int v19 = 138413314;
    id v20 = v4;
    __int16 v21 = 2112;
    double v22 = v5;
    __int16 v23 = 2112;
    unint64_t v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, taskType, %@, processed %lu workouts, error, %@", (uint8_t *)&v19, 0x34u);
  }
  id v9 = [*(id *)(a1 + 32) metrics];
  [v9 stopCollectMetricsTaskType:*(void *)(a1 + 72)];

  if (!*(void *)(a1 + 40))
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11 != 3)
    {
      if (v11 == 2)
      {
        [*(id *)(a1 + 32) setCurrentNWorkouts:*(void *)(a1 + 64)];
        [*(id *)(a1 + 32) setLastWorkoutComparisonDate:v10];
LABEL_10:
        [*(id *)(a1 + 32) logTaskStates];
        [*(id *)(a1 + 32) saveTaskStates];
        if (*(void *)(a1 + 56) != 1)
        {
          unint64_t v12 = [*(id *)(a1 + 32) currentNWorkouts];
          if (v12 < [*(id *)(a1 + 32) totalWorkouts])
          {
            uint64_t v13 = *(void *)(a1 + 56);
            if (v13 != 3)
            {
              if (v13 == 2)
              {
                [*(id *)(a1 + 32) _scheduleWorkoutComparisonIfCharging];
              }
              else
              {
                uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v15 = (objc_class *)objc_opt_class();
                  uint64_t v16 = NSStringFromClass(v15);
                  int v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
                  uint64_t v18 = *(void **)(a1 + 56);
                  int v19 = 138412802;
                  id v20 = v16;
                  __int16 v21 = 2112;
                  double v22 = v17;
                  __int16 v23 = 2048;
                  unint64_t v24 = v18;
                  _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, %@, Unhandled task state transition, taskType, %lu", (uint8_t *)&v19, 0x20u);
                }
              }
            }
          }
        }

        return;
      }
      if (v11 != 1) {
        goto LABEL_10;
      }
      [*(id *)(a1 + 32) setCurrentNWorkouts:*(void *)(a1 + 64)];
      [*(id *)(a1 + 32) setLastWorkoutComparisonDate:v10];
    }
    [*(id *)(a1 + 32) setLastClusterAndSyncDate:v10];
    goto LABEL_10;
  }
}

- (int64_t)_chargerConnectionState
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  batteryManager = self->_batteryManager;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__RTWorkoutScheduler__chargerConnectionState__block_invoke;
  v23[3] = &unk_1E6B9D138;
  __int16 v25 = &v26;
  uint64_t v5 = v3;
  unint64_t v24 = v5;
  [(RTBatteryManager *)batteryManager fetchCurrentChargerConnectionState:v23];
  uint64_t v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    id v9 = [MEMORY[0x1E4F1C9C8] now];
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;
    unint64_t v12 = objc_opt_new();
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_125];
    uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v15 = [v14 filteredArrayUsingPredicate:v13];
    uint64_t v16 = [v15 firstObject];

    [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
    int v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v30 count:1];
    id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v19];

    if (v20) {
  }
    }

  int64_t v21 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v21;
}

void __45__RTWorkoutScheduler__chargerConnectionState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Error fetching battery state, error ,%@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_scheduleWorkoutComparisonIfCharging
{
  v80[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = [(RTWorkoutScheduler *)self metrics];
  [v3 startCollectMetricsTaskType:3 totalNAtStart:-[RTWorkoutScheduler totalWorkouts]];

  v64 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v62 = *MEMORY[0x1E4F5CFE8];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  uint64_t v66 = 1;
  while (1)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2048;
      v78 = (uint64_t (*)(uint64_t, uint64_t))v66;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, iteration, %lu", buf, 0x20u);
    }
    if ([(RTWorkoutScheduler *)self encryptedDataAvailability] == 2) {
      break;
    }
    BOOL v8 = [(RTWorkoutScheduler *)self _chargerConnectionState] == 1;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (!v8)
    {
      if (v10)
      {
        v58 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v58);
        v60 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v60;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, no retry, reason, battery sate, disconnected", buf, 0x16u);
      }
      goto LABEL_28;
    }
    if (v10)
    {
      double v11 = (objc_class *)objc_opt_class();
      unint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(a2);
      unint64_t v14 = [(RTWorkoutScheduler *)self currentNWorkouts];
      unint64_t v15 = [(RTWorkoutScheduler *)self totalWorkouts];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      v78 = (uint64_t (*)(uint64_t, uint64_t))v14;
      LOWORD(v79) = 2048;
      *(void *)((char *)&v79 + 2) = v15;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, Battery State Connected and processing additional workout, current, %lu, total, %lu", buf, 0x2Au);
    }
    unint64_t v16 = [(RTWorkoutScheduler *)self topNWorkoutsWithIncrement:5];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v78 = __Block_byref_object_copy__172;
    *(void *)&long long v79 = __Block_byref_object_dispose__172;
    *((void *)&v79 + 1) = 0;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    uint64_t v18 = [(RTWorkoutScheduler *)self workoutRouteManager];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __58__RTWorkoutScheduler__scheduleWorkoutComparisonIfCharging__block_invoke;
    v67[3] = &unk_1E6B90728;
    v69 = buf;
    int v19 = v17;
    v68 = v19;
    LOBYTE(v61) = 1;
    [v18 processWorkoutsClearClusters:0 clearExistingDistanceMatrix:0 buildDistanceMatrix:1 syncClustersToHealhtKit:0 syncClustersToWatch:0 filteringDistanceThreshold:v16 topNWorkouts:1.79769313e308 isSchedulerTriggered:v61 handler:v67];

    id v20 = v19;
    int64_t v21 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v22 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v20, v22)) {
      goto LABEL_13;
    }
    __int16 v23 = [MEMORY[0x1E4F1C9C8] now];
    [v23 timeIntervalSinceDate:v21];
    double v25 = v24;
    uint64_t v26 = objc_opt_new();
    __int16 v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_125];
    uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v29 = [v28 filteredArrayUsingPredicate:v27];
    uint64_t v30 = [v29 firstObject];

    [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
    __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v70, 2u);
    }

    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    v80[0] = v63;
    *(void *)v70 = @"semaphore wait timeout";
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v80 count:1];
    v34 = [v32 errorWithDomain:v62 code:15 userInfo:v33];

    if (v34)
    {
      id v35 = v34;
    }
    else
    {
LABEL_13:
      id v35 = 0;
    }

    id v36 = v35;
    uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
    if (v37)
    {
      id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        double v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = NSStringFromSelector(a2);
        unint64_t v42 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v70 = 138412802;
        *(void *)&v70[4] = v40;
        __int16 v71 = 2112;
        id v72 = v41;
        __int16 v73 = 2112;
        unint64_t v74 = v42;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, incremental workout comparison failed, error, %@", v70, 0x20u);
      }
    }
    else
    {
      [(RTWorkoutScheduler *)self setCurrentNWorkouts:v16];
      uint64_t v43 = [MEMORY[0x1E4F1C9C8] now];
      [(RTWorkoutScheduler *)self setLastWorkoutComparisonDate:v43];

      id v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v47 = [(RTWorkoutScheduler *)self currentNWorkouts];
        unint64_t v48 = [(RTWorkoutScheduler *)self totalWorkouts];
        *(_DWORD *)v70 = 138413058;
        *(void *)&v70[4] = v45;
        __int16 v71 = 2112;
        id v72 = v46;
        __int16 v73 = 2048;
        unint64_t v74 = v47;
        __int16 v75 = 2048;
        unint64_t v76 = v48;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, completed incremental workout comparison, current %lu, total, %lu", v70, 0x2Au);
      }
    }

    BOOL v49 = [(RTWorkoutScheduler *)self _isEligibleForWorkoutComparison];
    if (v37) {
      BOOL v50 = 0;
    }
    else {
      BOOL v50 = v49;
    }
    __int16 v51 = [MEMORY[0x1E4F1C9C8] date];
    [v51 timeIntervalSinceDate:v64];
    double v53 = v52;

    _Block_object_dispose(buf, 8);
    ++v66;
    if (v53 > 600.0 || !v50)
    {
      uint64_t v9 = [(RTWorkoutScheduler *)self metrics];
      [v9 stopCollectMetricsTaskType:3];
      goto LABEL_28;
    }
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v54 = (objc_class *)objc_opt_class();
    __int16 v55 = NSStringFromClass(v54);
    id v56 = NSStringFromSelector(a2);
    uint64_t v57 = +[RTDataProtectionManager encryptedDataAvailabilityToString:[(RTWorkoutScheduler *)self encryptedDataAvailability]];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v55;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v56;
    *(_WORD *)&buf[22] = 2112;
    v78 = v57;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, no retry, reason, lock state, %@", buf, 0x20u);
  }
LABEL_28:
}

void __58__RTWorkoutScheduler__scheduleWorkoutComparisonIfCharging__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_scheduleUpdateRelevanceScore
{
  id v4 = [(RTWorkoutScheduler *)self metrics];
  [v4 startCollectMetricsTaskType:5 totalNAtStart:-[RTWorkoutScheduler totalWorkouts]];

  [(RTWorkoutScheduler *)self setUpdateRelevanceScoreTaskState:3];
  id v5 = [(RTWorkoutScheduler *)self workoutRouteManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke;
  v6[3] = &unk_1E6B90CB8;
  v6[4] = self;
  void v6[5] = a2;
  [v5 updateRelevanceScoresWithHandler:v6];
}

void __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke_2;
  block[3] = &unk_1E6B91220;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  block[4] = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    unint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) metrics];
  [v7 stopCollectMetricsTaskType:5];

  if (!*(void *)(a1 + 40))
  {
    BOOL v8 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 32) setLastRelevanceScoreUpdateDate:v8];

    [*(id *)(a1 + 32) setUpdateRelevanceScoreTaskState:1];
  }
}

- (void)_onDailyXPCActivity
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(RTWorkoutScheduler *)self updateRelevanceScoreTaskState] == 2
    || [(RTWorkoutScheduler *)self updateRelevanceScoreTaskState] == 3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = NSStringFromSelector(a2);
      BOOL v8 = +[RTWorkoutScheduler taskStateToString:[(RTWorkoutScheduler *)self updateRelevanceScoreTaskState]];
      int v9 = +[RTWorkoutScheduler taskStateToString:2];
      int v14 = 138413314;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      dispatch_semaphore_t v17 = v7;
      __int16 v18 = 2112;
      int v19 = @"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey";
      __int16 v20 = 2112;
      int64_t v21 = v8;
      __int16 v22 = 2112;
      __int16 v23 = v9;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, not changing task state, %@, from %@ to %@", (uint8_t *)&v14, 0x34u);
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v11 = [(RTWorkoutScheduler *)self lastRelevanceScoreUpdateDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 > 86400.0)
    {
      [(RTWorkoutScheduler *)self setUpdateRelevanceScoreTaskState:2];
      [(RTWorkoutScheduler *)self _scheduleUpdateRelevanceScore];
    }
  }
}

- (void)_getCurrentLocationAndMonitorForRegion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  locationManager = self->_locationManager;
  id v8 = 0;
  [(RTLocationManager *)locationManager stopMonitoringAllRegionsForClientIdentifier:@"RTWorkoutSchedulerRegionChange" error:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Error stopping monitoring for regions, %@", buf, 0xCu);
    }
  }
  uint64_t v6 = self->_locationManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__RTWorkoutScheduler__getCurrentLocationAndMonitorForRegion__block_invoke;
  v7[3] = &unk_1E6B96E38;
  v7[4] = self;
  [(RTLocationManager *)v6 fetchCurrentLocationWithHandler:v7];
}

void __60__RTWorkoutScheduler__getCurrentLocationAndMonitorForRegion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Error fetching current location, %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) onCurrentLocationUpdate:a2];
  }
}

- (void)onCurrentLocationUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RTWorkoutScheduler_onCurrentLocationUpdate___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__RTWorkoutScheduler_onCurrentLocationUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCurrentLocationUpdate:*(void *)(a1 + 40)];
}

- (void)_onCurrentLocationUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 horizontalAccuracy];
  if (v6 <= 200.0)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v5 coordinate];
    int v7 = [v15 initForLowPowerWithCenter:@"RTWorkoutSchedulerBoundingRegion"];
    locationManager = self->_locationManager;
    id v18 = 0;
    [(RTLocationManager *)locationManager startMonitoringForRegion:v7 clientIdentifier:@"RTWorkoutSchedulerRegionChange" error:&v18];
    id v9 = v18;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        double v12 = "error setting up fence, %@";
        double v13 = v10;
        uint32_t v14 = 12;
        goto LABEL_9;
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v5;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      double v12 = "Start Low Power Fence Monitoring for workouts, location, %@, region, %@";
      double v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = NSStringFromSelector(a2);
    [v5 horizontalAccuracy];
    *(_DWORD *)buf = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    double v12 = "%@, %@, Not monitoring for fence due to high location uncertainty, %f";
    double v13 = v7;
    uint32_t v14 = 32;
LABEL_9:
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  double v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[RTWorkoutScheduler handleCircularRegionCallback:region:clientIdentifier:]";
    __int16 v22 = 1024;
    int v23 = 1105;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_7:
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[RTWorkoutScheduler handleCircularRegionCallback:region:clientIdentifier:]";
      __int16 v22 = 1024;
      int v23 = 1106;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  if (a3 == 2)
  {
    uint32_t v14 = [(RTNotifier *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__RTWorkoutScheduler_handleCircularRegionCallback_region_clientIdentifier___block_invoke;
    v15[3] = &unk_1E6B97C78;
    uint64_t v18 = 2;
    id v16 = v9;
    BOOL v17 = self;
    SEL v19 = a2;
    dispatch_async(v14, v15);
  }
}

uint64_t __75__RTWorkoutScheduler_handleCircularRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = +[RTLocationManager stringForRegionCallbackType:*(void *)(a1 + 48)];
    id v4 = *(void **)(a1 + 32);
    int v12 = 138412546;
    double v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Received event, %@, region, %@", (uint8_t *)&v12, 0x16u);
  }
  if ([*(id *)(a1 + 40) updateRelevanceScoreTaskState] == 2
    || [*(id *)(a1 + 40) updateRelevanceScoreTaskState] == 3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = (objc_class *)objc_opt_class();
      int v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      id v9 = +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", [*(id *)(a1 + 40) updateRelevanceScoreTaskState]);
      id v10 = +[RTWorkoutScheduler taskStateToString:2];
      int v12 = 138413314;
      double v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      BOOL v17 = @"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey";
      __int16 v18 = 2112;
      SEL v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, not changing task state, %@, from %@ to %@", (uint8_t *)&v12, 0x34u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setUpdateRelevanceScoreTaskState:2];
  }
  return [*(id *)(a1 + 40) _getCurrentLocationAndMonitorForRegion];
}

- (void)_registerForCircularRegionEvents
{
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Registering for Circular Region Events", buf, 2u);
  }

  id v5 = [(RTWorkoutScheduler *)self locationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RTWorkoutScheduler__registerForCircularRegionEvents__block_invoke;
  v6[3] = &unk_1E6B911D0;
  v6[4] = self;
  void v6[5] = a2;
  [v5 registerForRegionEventsWithClientIdentifier:@"RTWorkoutSchedulerRegionChange" handler:v6];
}

void __54__RTWorkoutScheduler__registerForCircularRegionEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (a3 == 4)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = +[RTLocationManager stringForRegionCallbackType:4];
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      SEL v19 = v9;
      double v13 = "%@, regionMonitoring failure, %@, error, %@";
      goto LABEL_10;
    }
  }
  else if (a3 == 3)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = +[RTLocationManager stringForRegionCallbackType:3];
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      SEL v19 = v9;
      double v13 = "%@, regionMonitoring client registration failure, %@, error, %@";
LABEL_10:
      _os_log_fault_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    if (!v8)
    {
      [*(id *)(a1 + 32) handleCircularRegionCallback:a3 region:v7 clientIdentifier:@"RTWorkoutSchedulerRegionChange"];
      goto LABEL_12;
    }
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = +[RTLocationManager stringForRegionCallbackType:a3];
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      SEL v19 = v9;
      double v13 = "%@, regionMonitoring %@, error, %@";
      goto LABEL_10;
    }
  }

LABEL_12:
}

- (void)_schedulePruneDistanceMatrix
{
  id v4 = [(RTWorkoutScheduler *)self workoutRouteManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke;
  v5[3] = &unk_1E6B90CB8;
  v5[4] = self;
  v5[5] = a2;
  [v4 pruneDistanceMatrixWithHandler:v5];
}

void __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke_2;
  block[3] = &unk_1E6B91220;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  block[4] = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v8, 0x20u);
  }
  if (!*(void *)(a1 + 40))
  {
    id v7 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 32) setLastPruneDistanceMatrixDate:v7];
  }
}

- (unint64_t)topNWorkoutsWithIncrement:(unint64_t)a3
{
  unint64_t v4 = [(RTWorkoutScheduler *)self currentNWorkouts] + a3;
  unint64_t result = [(RTWorkoutScheduler *)self totalWorkouts];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (void)setSingleWorkoutClusteringTaskState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_singleWorkoutClusteringTaskState != a3)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = +[RTWorkoutScheduler taskStateToString:self->_singleWorkoutClusteringTaskState];
      id v7 = +[RTWorkoutScheduler taskStateToString:a3];
      int v8 = 138412802;
      id v9 = @"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v8, 0x20u);
    }
    self->_singleWorkoutClusteringTaskState = a3;
    [(RTWorkoutScheduler *)self saveTaskStates];
  }
}

- (void)setUpdateRelevanceScoreTaskState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_updateRelevanceScoreTaskState != a3)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = +[RTWorkoutScheduler taskStateToString:self->_updateRelevanceScoreTaskState];
      id v7 = +[RTWorkoutScheduler taskStateToString:a3];
      int v8 = 138412802;
      id v9 = @"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v8, 0x20u);
    }
    self->_updateRelevanceScoreTaskState = a3;
    [(RTWorkoutScheduler *)self saveTaskStates];
  }
}

- (void)setCurrentNWorkouts:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_currentNWorkouts != a3)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t currentNWorkouts = self->_currentNWorkouts;
      int v7 = 138412802;
      int v8 = @"RTDefaultsWorkoutSchedulerTopNWorkoutsKey";
      __int16 v9 = 2048;
      unint64_t v10 = currentNWorkouts;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, changed from %lu to %lu", (uint8_t *)&v7, 0x20u);
    }

    self->_unint64_t currentNWorkouts = a3;
    [(RTWorkoutScheduler *)self saveTaskStates];
  }
}

- (void)setLastWorkoutComparisonDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSDate *)a3;
  p_lastWorkoutComparisonDate = &self->_lastWorkoutComparisonDate;
  if (self->_lastWorkoutComparisonDate != v5)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(NSDate *)*p_lastWorkoutComparisonDate stringFromDate];
      __int16 v9 = [(NSDate *)v5 stringFromDate];
      int v10 = 138412802;
      __int16 v11 = @"RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)&self->_lastWorkoutComparisonDate, a3);
    [(RTDefaultsManager *)self->_defaultsManager setObject:*p_lastWorkoutComparisonDate forKey:@"RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"];
  }
}

- (void)setLastClusterAndSyncDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSDate *)a3;
  p_lastClusterAndSyncDate = &self->_lastClusterAndSyncDate;
  if (self->_lastClusterAndSyncDate != v5)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(NSDate *)*p_lastClusterAndSyncDate stringFromDate];
      __int16 v9 = [(NSDate *)v5 stringFromDate];
      int v10 = 138412802;
      __int16 v11 = @"RTDefaultsWorkoutSchedulerClusterAndSyncDateKey";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)&self->_lastClusterAndSyncDate, a3);
    [(RTDefaultsManager *)self->_defaultsManager setObject:*p_lastClusterAndSyncDate forKey:@"RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"];
  }
}

- (void)setLastSingleWorkoutClusteringDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSDate *)a3;
  p_lastSingleWorkoutClusteringDate = &self->_lastSingleWorkoutClusteringDate;
  if (self->_lastSingleWorkoutClusteringDate != v5)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(NSDate *)*p_lastSingleWorkoutClusteringDate stringFromDate];
      __int16 v9 = [(NSDate *)v5 stringFromDate];
      int v10 = 138412802;
      __int16 v11 = @"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)&self->_lastSingleWorkoutClusteringDate, a3);
    [(RTDefaultsManager *)self->_defaultsManager setObject:*p_lastSingleWorkoutClusteringDate forKey:@"RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"];
  }
}

- (void)setLastRelevanceScoreUpdateDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSDate *)a3;
  p_lastRelevanceScoreUpdateDate = &self->_lastRelevanceScoreUpdateDate;
  if (self->_lastRelevanceScoreUpdateDate != v5)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(NSDate *)*p_lastRelevanceScoreUpdateDate stringFromDate];
      __int16 v9 = [(NSDate *)v5 stringFromDate];
      int v10 = 138412802;
      __int16 v11 = @"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)&self->_lastRelevanceScoreUpdateDate, a3);
    [(RTDefaultsManager *)self->_defaultsManager setObject:*p_lastRelevanceScoreUpdateDate forKey:@"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"];
  }
}

- (void)setLastPruneDistanceMatrixDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSDate *)a3;
  p_lastPruneDistanceMatrixDate = &self->_lastPruneDistanceMatrixDate;
  if (self->_lastPruneDistanceMatrixDate != v5)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(NSDate *)*p_lastPruneDistanceMatrixDate stringFromDate];
      __int16 v9 = [(NSDate *)v5 stringFromDate];
      int v10 = 138412802;
      __int16 v11 = @"RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)&self->_lastPruneDistanceMatrixDate, a3);
    [(RTDefaultsManager *)self->_defaultsManager setObject:*p_lastPruneDistanceMatrixDate forKey:@"RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"];
  }
}

- (void)_setupDisplayLayoutMonitor
{
  id v3 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  int v7 = __48__RTWorkoutScheduler__setupDisplayLayoutMonitor__block_invoke;
  int v8 = &unk_1E6B9D160;
  objc_copyWeak(&v9, &location);
  [v3 setTransitionHandler:&v5];
  unint64_t v4 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v3, v5, v6, v7, v8];
  [(RTWorkoutScheduler *)self setDisplayLayoutMonitor:v4];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__RTWorkoutScheduler__setupDisplayLayoutMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained layoutMonitorDidUpdateDisplayLayout:v7 withContext:v6];
}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 elements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x1E4F625B0];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) identifier];
        int v13 = [v12 isEqualToString:v10];

        if (v13)
        {
          __int16 v14 = [(RTNotifier *)self queue];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __70__RTWorkoutScheduler_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke;
          v15[3] = &unk_1E6B90BF0;
          void v15[4] = self;
          id v16 = v5;
          dispatch_async(v14, v15);

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __70__RTWorkoutScheduler_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) displayBacklightLevel];

  return [v1 _onLayoutMonitorUpdateDisplayBacklightLevelNotification:v2];
}

- (void)_onLayoutMonitorUpdateDisplayBacklightLevelNotification:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "Received display backlight level notification, %lu", (uint8_t *)&v6, 0xCu);
  }

  if (!a3)
  {
    [(RTWorkoutScheduler *)self _evaluateVersionChange];
    [(RTWorkoutScheduler *)self _evaluateSchedulingTaskPriority];
  }
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (void)setBatteryManager:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTWorkoutRouteManager)workoutRouteManager
{
  return self->_workoutRouteManager;
}

- (void)setWorkoutRouteManager:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (unint64_t)singleWorkoutClusteringTaskState
{
  return self->_singleWorkoutClusteringTaskState;
}

- (unint64_t)updateRelevanceScoreTaskState
{
  return self->_updateRelevanceScoreTaskState;
}

- (unint64_t)currentNWorkouts
{
  return self->_currentNWorkouts;
}

- (unint64_t)totalWorkouts
{
  return self->_totalWorkouts;
}

- (void)setTotalWorkouts:(unint64_t)a3
{
  self->_totalWorkouts = a3;
}

- (NSDate)lastClusterAndSyncDate
{
  return self->_lastClusterAndSyncDate;
}

- (NSDate)lastWorkoutComparisonDate
{
  return self->_lastWorkoutComparisonDate;
}

- (NSDate)lastRelevanceScoreUpdateDate
{
  return self->_lastRelevanceScoreUpdateDate;
}

- (NSDate)lastSingleWorkoutClusteringDate
{
  return self->_lastSingleWorkoutClusteringDate;
}

- (NSDate)lastPruneDistanceMatrixDate
{
  return self->_lastPruneDistanceMatrixDate;
}

- (RTTimer)clusteringDeferralTimer
{
  return self->_clusteringDeferralTimer;
}

- (void)setClusteringDeferralTimer:(id)a3
{
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTWorkoutSchedulerMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_clusteringDeferralTimer, 0);
  objc_storeStrong((id *)&self->_lastPruneDistanceMatrixDate, 0);
  objc_storeStrong((id *)&self->_lastSingleWorkoutClusteringDate, 0);
  objc_storeStrong((id *)&self->_lastRelevanceScoreUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastWorkoutComparisonDate, 0);
  objc_storeStrong((id *)&self->_lastClusterAndSyncDate, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_workoutRouteManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);

  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end