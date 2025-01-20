@interface SMSessionMonitor
+ (id)riskStateToString:(unint64_t)a3;
- (CLLocation)currentLocation;
- (NSSet)triggers;
- (OS_dispatch_queue)queue;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTTimer)pendingSafeArrivalTimer;
- (RTTimerManager)timerManager;
- (RTWatchWristStateManager)wristStateManager;
- (RTXPCTimerAlarm)regionInsidePendingTimer;
- (SMCMNoMovementMonitor)noMovementMonitor;
- (SMSessionConfiguration)configuration;
- (SMSessionManagerMonitorProtocol)sessionManagerDelegate;
- (SMSessionMetricManager)sessionMetricManager;
- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 noMovementMonitor:(id)a12;
- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 timerManager:(id)a12 noMovementMonitor:(id)a13;
- (SMSessionMonitorContext)mostRecentTriggerContext;
- (SMSessionMonitorState)sessionMonitorState;
- (SMSessionStore)sessionStore;
- (double)sessionMonitorRegionInsidePendingTimerDelay;
- (id)_createTriggersWithConfiguration:(id)a3;
- (unint64_t)riskState;
- (void)_addObservers;
- (void)_bootstrap;
- (void)_handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5;
- (void)_initializeSessionWithConfiguration:(id)a3;
- (void)_initializeTriggersForRemoteSessionIfNecessary;
- (void)_onBecomingActiveDevice:(id)a3;
- (void)_onBecomingNonActiveDevice:(id)a3;
- (void)_onRegionExit;
- (void)_onRegionInsidePendingTimerExpiry;
- (void)_persistState;
- (void)_processSessionEnd;
- (void)_processSessionResumeWithState:(id)a3;
- (void)_processTriggerEstimatedEndDateUpdateNotification:(id)a3;
- (void)_processTriggerNotification:(id)a3;
- (void)_processUserTriggerResponse:(int64_t)a3;
- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3;
- (void)_promptDirectTriggerWithContext:(id)a3;
- (void)_promptEstimatedEndDateUpdateWithContext:(id)a3;
- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3;
- (void)_promptSafeArrivalWithContext:(id)a3;
- (void)_promptTimerEndedVerificationWithContext:(id)a3;
- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3;
- (void)_registerForCircularRegionEventsForIdentifier:(id)a3;
- (void)_registerForTriggersWithConfiguration:(id)a3;
- (void)_removeObservers;
- (void)_reset;
- (void)_setup;
- (void)_setupGeofenceWithLocation:(id)a3 regionIdentifier:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForCircularRegionEventsForIdentifier:(id)a3;
- (void)_unregisterForTriggers;
- (void)_updateDestinationBoundRegionStateWithCircularRegionCallback:(int64_t)a3;
- (void)_updateGeofenceWithConfiguration:(id)a3;
- (void)_updateRegionStateWithCircularRegionCallback:(int64_t)a3;
- (void)_updateRoundTripRegionStateWithCircularRegionCallback:(int64_t)a3;
- (void)_updateTriggersWithConfiguration:(id)a3;
- (void)_updateTriggersWithUserResponse:(int64_t)a3;
- (void)_updateUserWithTriggerContext:(id)a3;
- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5;
- (void)onBecomingActiveDevice:(id)a3;
- (void)onBecomingNonActiveDevice:(id)a3;
- (void)onLocationNotification:(id)a3;
- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3;
- (void)onSessionChangedWithConfiguration:(id)a3;
- (void)onSessionEndedForActiveDevice:(BOOL)a3;
- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStartedWithConfiguration:(id)a3;
- (void)onTriggerNotification:(id)a3;
- (void)onUserTriggerResponse:(int64_t)a3;
- (void)onWorkoutPause;
- (void)onWorkoutResume;
- (void)setConfiguration:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMostRecentTriggerContext:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setNoMovementMonitor:(id)a3;
- (void)setPendingSafeArrivalTimer:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegionInsidePendingTimer:(id)a3;
- (void)setRiskState:(unint64_t)a3;
- (void)setSessionManagerDelegate:(id)a3;
- (void)setSessionMetricManager:(id)a3;
- (void)setSessionMonitorRegionInsidePendingTimerDelay:(double)a3;
- (void)setSessionMonitorState:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWristStateManager:(id)a3;
@end

@implementation SMSessionMonitor

- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 noMovementMonitor:(id)a12
{
  id v28 = a12;
  id v27 = a11;
  id v26 = a10;
  id v17 = a9;
  id v25 = a8;
  id v18 = a7;
  id v19 = a6;
  id v24 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  v31 = [(SMSessionMonitor *)self initWithDefaultsManager:v21 dataProtectionManager:v20 healthKitManager:v24 locationManager:v19 motionActivityManager:v18 platform:v25 sessionMetricManager:v17 sessionStore:v26 wristStateManager:v27 timerManager:v22 noMovementMonitor:v28];

  return v31;
}

- (SMSessionMonitor)initWithDefaultsManager:(id)a3 dataProtectionManager:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 wristStateManager:(id)a11 timerManager:(id)a12 noMovementMonitor:(id)a13
{
  id v18 = a3;
  id v52 = a4;
  id v19 = a4;
  id v53 = a5;
  id v59 = a5;
  id v54 = a6;
  id v20 = a6;
  id v55 = a7;
  id v21 = a7;
  id v60 = a8;
  id v62 = a9;
  id v63 = a10;
  id v57 = a11;
  id v61 = a12;
  id v22 = a13;
  id v58 = v18;
  if (!v18)
  {
    v35 = v22;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v37 = 0;
    v38 = 0;
    id v24 = v59;
    v23 = v19;
    id v25 = v21;
    goto LABEL_20;
  }
  v23 = v19;
  if (!v19)
  {
    v35 = v22;
    v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v24 = v59;
    id v25 = v21;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager", buf, 2u);
    }

    v37 = 0;
    v38 = v58;
LABEL_20:
    id v26 = v60;
LABEL_37:
    v43 = self;
    v42 = v57;
    goto LABEL_38;
  }
  id v24 = v59;
  id v25 = v21;
  if (!v59)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v26 = v60;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: healthKitManager";
LABEL_35:
    _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_36;
  }
  id v26 = v60;
  if (!v20)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_35;
  }
  if (!v25)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_35;
  }
  if (!v60)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: platform";
    goto LABEL_35;
  }
  if (!v63)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_35;
  }
  if (!v62)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: sessionMetricManager";
    goto LABEL_35;
  }
  if (!v61)
  {
    v35 = v22;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v41 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_35;
    }
LABEL_36:

    v37 = 0;
    v38 = v58;
    goto LABEL_37;
  }
  id v50 = v22;
  if (v22)
  {
    v66.receiver = self;
    v66.super_class = (Class)SMSessionMonitor;
    id v27 = [(SMSessionMonitor *)&v66 init];
    if (v27)
    {
      id v28 = v27;
      objc_storeStrong((id *)&v27->_defaultsManager, a3);
      objc_storeStrong((id *)&v28->_dataProtectionManager, v52);
      uint64_t v29 = objc_opt_new();
      distanceCalculator = v28->_distanceCalculator;
      v28->_distanceCalculator = (RTDistanceCalculator *)v29;

      objc_storeStrong((id *)&v28->_healthKitManager, v53);
      objc_storeStrong((id *)&v28->_locationManager, v54);
      objc_storeStrong((id *)&v28->_motionActivityManager, v55);
      objc_storeStrong((id *)&v28->_platform, a8);
      objc_storeStrong((id *)&v28->_sessionMetricManager, a9);
      objc_storeStrong((id *)&v28->_sessionStore, a10);
      objc_storeStrong((id *)&v28->_wristStateManager, a11);
      objc_storeStrong((id *)&v28->_timerManager, a12);
      objc_storeStrong((id *)&v28->_noMovementMonitor, a13);
      v31 = v28;
      v32 = v28;
      v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = (const char *)[(SMSessionMonitor *)v32 UTF8String];
      }
      else
      {
        id v46 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v32];
        v34 = (const char *)[v46 UTF8String];

        id v26 = v60;
      }
      dispatch_queue_t v47 = dispatch_queue_create(v34, v33);

      queue = v32->_queue;
      v32->_queue = (OS_dispatch_queue *)v47;

      v49 = [(SMSessionMonitor *)v32 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __213__SMSessionMonitor_initWithDefaultsManager_dataProtectionManager_healthKitManager_locationManager_motionActivityManager_platform_sessionMetricManager_sessionStore_wristStateManager_timerManager_noMovementMonitor___block_invoke;
      block[3] = &unk_1E6B90E70;
      v65 = v32;
      dispatch_async(v49, block);

      id v27 = v31;
    }
    v43 = v27;
    v37 = v43;
    v42 = v57;
    v38 = v58;
    v35 = v50;
  }
  else
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = v57;
    v38 = v58;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: noMovementMonitor", buf, 2u);
    }

    v37 = 0;
    v35 = 0;
    v43 = self;
  }
LABEL_38:

  return v37;
}

uint64_t __213__SMSessionMonitor_initWithDefaultsManager_dataProtectionManager_healthKitManager_locationManager_motionActivityManager_platform_sessionMetricManager_sessionStore_wristStateManager_timerManager_noMovementMonitor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v3 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsSessionMonitorRegionInsidePendingTimerDelay" value:&unk_1F3453688];
    [v3 doubleValue];
    self->_double sessionMonitorRegionInsidePendingTimerDelay = v4;

    if (self->_sessionMonitorRegionInsidePendingTimerDelay == 30.0) {
      return;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double sessionMonitorRegionInsidePendingTimerDelay = self->_sessionMonitorRegionInsidePendingTimerDelay;
      int v7 = 136316162;
      v8 = "-[SMSessionMonitor _setup]";
      __int16 v9 = 2080;
      v10 = "overriding session monitor region inside pending timer delay";
      __int16 v11 = 2048;
      uint64_t v12 = 0x403E000000000000;
      __int16 v13 = 2048;
      double v14 = sessionMonitorRegionInsidePendingTimerDelay;
      __int16 v15 = 2112;
      v16 = @"RTDefaultsSessionMonitorRegionInsidePendingTimerDelay";
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v7, 0x34u);
    }
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[SMSessionMonitor _setup]";
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%s, feature not enabled", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_shutdownWithHandler:(id)a3
{
}

- (void)_bootstrap
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  dispatch_queue_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__24;
  id v50 = __Block_byref_object_dispose__24;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__24;
  v44 = __Block_byref_object_dispose__24;
  id v45 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  double v4 = [(SMSessionMonitor *)self sessionStore];
  v5 = [(SMSessionMonitor *)self configuration];
  v6 = [v5 sessionID];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __30__SMSessionMonitor__bootstrap__block_invoke;
  v36[3] = &unk_1E6B92E50;
  v38 = &v46;
  v39 = &v40;
  int v7 = v3;
  v37 = v7;
  [v4 fetchMostRecentSessionMonitorStateWithSessionID:v6 handler:v36];

  v8 = v7;
  __int16 v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  __int16 v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  double v14 = objc_opt_new();
  __int16 v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_398];
  v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
  }

  id v20 = (void *)MEMORY[0x1E4F28C58];
  v55[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v55 count:1];
  id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v41 + 5, v23);
  }
  if (v41[5])
  {
    id v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = v41[5];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      __int16 v53 = 2112;
      id v54 = v27;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, Error while fetching sessionMonitor state, error, %@", buf, 0x16u);
    }
  }
  else
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = (void *)v47[5];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      __int16 v53 = 2112;
      id v54 = v29;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%s, most recent sessionMonitor state, %@", buf, 0x16u);
    }

    if (v47[5])
    {
      -[SMSessionMonitor setSessionMonitorState:](self, "setSessionMonitorState:");
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x1E4F99970]);
      v31 = [(SMSessionMonitor *)self configuration];
      v32 = [v31 sessionID];
      v33 = [MEMORY[0x1E4F1C9C8] date];
      v34 = (void *)[v30 initWithSessionIdentifier:v32 currentRegionState:0 triggerPending:0 triggerConfirmed:0 date:v33];
      [(SMSessionMonitor *)self setSessionMonitorState:v34];

      [(SMSessionMonitor *)self _persistState];
    }
    id v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v35 = [(SMSessionMonitor *)self sessionMonitorState];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SMSessionMonitor _bootstrap]";
      __int16 v53 = 2112;
      id v54 = v35;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s     , %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
}

void __30__SMSessionMonitor__bootstrap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SMSessionMonitor _reset]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  double v4 = [(SMSessionMonitor *)self sessionMonitorState];
  [v4 setTriggerPending:0];

  id v5 = [(SMSessionMonitor *)self sessionMonitorState];
  [v5 setTriggerConfirmed:0];

  [(SMSessionMonitor *)self setConfiguration:0];
  id v6 = [(SMSessionMonitor *)self sessionMonitorState];
  [v6 setCurrentRegionState:0];

  [(SMSessionMonitor *)self setRiskState:0];
  uint64_t v7 = [(SMSessionMonitor *)self regionInsidePendingTimer];
  [v7 invalidate];

  [(SMSessionMonitor *)self setRegionInsidePendingTimer:0];
  [(SMSessionMonitor *)self _persistState];
}

- (void)setSessionManagerDelegate:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F34B6ED8]
    && ([v4 conformsToProtocol:&unk_1F34B70B0] & 1) != 0)
  {
    objc_storeWeak((id *)&self->_sessionManagerDelegate, v4);
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [sessionManagerDelegate conformsToProtocol:@protocol(SMSessionManagerMonitorProtocol)] && [sessionManagerDelegate conformsToProtocol:@protocol(SMSessionManagerRegistrationProtocol)]", v6, 2u);
    }
  }
}

- (void)setRiskState:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F99968];
  id v6 = [(SMSessionMonitor *)self mostRecentTriggerContext];
  int v7 = [v5 isSOSTriggerCategory:[v6 triggerCategory]];

  unint64_t riskState = self->_riskState;
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v10 = v9;
  if (riskState != a3 || (v7 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = +[SMSessionMonitor riskStateToString:self->_riskState];
      id v12 = +[SMSessionMonitor riskStateToString:a3];
      int v28 = 136315650;
      uint64_t v29 = "-[SMSessionMonitor setRiskState:]";
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, riskState change detected, from, %@, to, %@", (uint8_t *)&v28, 0x20u);
    }
    switch(a3)
    {
      case 4uLL:
        double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
        [(SMSessionMonitor *)self _promptSafeArrivalWithContext:v14];
        break;
      case 3uLL:
        __int16 v15 = [(SMSessionMonitor *)self sessionMonitorState];
        int v16 = [v15 triggerConfirmed] ^ 1 | v7;

        double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
        if (v16 != 1)
        {
LABEL_19:
          [(SMSessionMonitor *)self _updateUserWithTriggerContext:v14];
          break;
        }
        [(SMSessionMonitor *)self _promptDirectTriggerWithContext:v14];
        break;
      case 2uLL:
        if (self->_riskState == 3)
        {
LABEL_13:
          double v13 = [(SMSessionMonitor *)self mostRecentTriggerContext];
          [(SMSessionMonitor *)self _updateUserWithTriggerContext:v13];

          return;
        }
        uint64_t v17 = [(SMSessionMonitor *)self sessionMonitorState];
        int v18 = [v17 triggerPending];

        if (!v18)
        {
          id v19 = (void *)MEMORY[0x1E4F99968];
          id v20 = [(SMSessionMonitor *)self mostRecentTriggerContext];
          LODWORD(v19) = [v19 isRoundTripTriggerCategory:[v20 triggerCategory]];

          if (v19)
          {
            double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
            [(SMSessionMonitor *)self _promptRoundTripAnomalyVerificationWithContext:v14];
          }
          else
          {
            id v22 = (void *)MEMORY[0x1E4F99968];
            id v23 = [(SMSessionMonitor *)self mostRecentTriggerContext];
            LODWORD(v22) = [v22 isDestinationTriggerCategory:[v23 triggerCategory]];

            if (v22)
            {
              double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
              [(SMSessionMonitor *)self _promptDestinationAnomalyVerificationWithContext:v14];
            }
            else
            {
              char v24 = (void *)MEMORY[0x1E4F99968];
              id v25 = [(SMSessionMonitor *)self mostRecentTriggerContext];
              LODWORD(v24) = [v24 isDurationTriggerCategory:[v25 triggerCategory]];

              if (v24)
              {
                double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
                [(SMSessionMonitor *)self _promptTimerEndedVerificationWithContext:v14];
              }
              else
              {
                id v26 = (void *)MEMORY[0x1E4F99968];
                id v27 = [(SMSessionMonitor *)self mostRecentTriggerContext];
                LODWORD(v26) = [v26 isWorkoutTriggerCategory:[v27 triggerCategory]];

                if (!v26) {
                  goto LABEL_21;
                }
                double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
                [(SMSessionMonitor *)self _promptWorkoutAnomalyVerificationWithContext:v14];
              }
            }
          }
          break;
        }
        double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
        goto LABEL_19;
      default:
LABEL_21:
        self->_unint64_t riskState = a3;
        return;
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v21 = +[SMSessionMonitor riskStateToString:self->_riskState];
    int v28 = 136315394;
    uint64_t v29 = "-[SMSessionMonitor setRiskState:]";
    __int16 v30 = 2112;
    v31 = v21;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%s, no change to current session monitor riskState, %@, proceeding to update user with context", (uint8_t *)&v28, 0x16u);
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    goto LABEL_13;
  }
}

+ (id)riskStateToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"SMSessionMonitorRiskStateUnknown";
  }
  else {
    return off_1E6B92EC0[a3 - 1];
  }
}

- (id)_createTriggersWithConfiguration:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v44 = (id)objc_opt_new();
  id v4 = [SMTriggerSOS alloc];
  id v5 = [(SMSessionMonitor *)self queue];
  id v6 = [(SMSessionMonitor *)self sessionStore];
  int v7 = [(SMTriggerSOS *)v4 initWithQueue:v5 sessionStore:v6];

  if (!v7)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
      __int16 v47 = 1024;
      LODWORD(v48) = 338;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sosTrigger (in %s:%d)", buf, 0x12u);
    }
  }
  [v44 addObject:v7];
  uint64_t v9 = [v43 sessionType];
  if ((unint64_t)(v9 - 2) < 2)
  {
    v38 = [SMTriggerDestination alloc];
    v41 = [(SMSessionMonitor *)self queue];
    uint64_t v17 = [(SMSessionMonitor *)self defaultsManager];
    int v18 = [(SMSessionMonitor *)self dataProtectionManager];
    id v19 = [(SMSessionMonitor *)self locationManager];
    id v20 = [(SMSessionMonitor *)self motionActivityManager];
    id v21 = [(SMSessionMonitor *)self distanceCalculator];
    [(SMSessionMonitor *)self platform];
    id v22 = v40 = v7;
    id v23 = [(SMSessionMonitor *)self sessionStore];
    char v24 = [(SMSessionMonitor *)self timerManager];
    id v25 = [(SMSessionMonitor *)self sessionMetricManager];
    double v14 = [(SMTriggerDestination *)v38 initWithQueue:v41 defaultsManager:v17 dataProtectionManager:v18 locationManager:v19 motionActivityManager:v20 distanceCalculator:v21 platform:v22 sessionStore:v23 timerManager:v24 sessionMetricManager:v25];

    int v7 = v40;
    if (!v14)
    {
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        __int16 v47 = 1024;
        LODWORD(v48) = 364;
        int v16 = "Invalid parameter not satisfying: destinationTrigger (in %s:%d)";
        goto LABEL_24;
      }
LABEL_16:

      double v14 = 0;
    }
  }
  else if (v9 == 4)
  {
    v37 = [SMSessionWorkoutMonitor alloc];
    uint64_t v42 = [(SMSessionMonitor *)self queue];
    v39 = [(SMSessionMonitor *)self defaultsManager];
    id v26 = [(SMSessionMonitor *)self distanceCalculator];
    id v27 = [(SMSessionMonitor *)self locationManager];
    int v28 = [(SMSessionMonitor *)self healthKitManager];
    uint64_t v29 = [(SMSessionMonitor *)self platform];
    __int16 v30 = [(SMSessionMonitor *)self sessionMetricManager];
    v31 = [(SMSessionMonitor *)self sessionStore];
    __int16 v32 = [(SMSessionMonitor *)self timerManager];
    v33 = [(SMSessionMonitor *)self noMovementMonitor];
    double v14 = [(SMSessionWorkoutMonitor *)v37 initWithQueue:v42 defaultsManager:v39 distanceCalculator:v26 locationManager:v27 healthKitManager:v28 platform:v29 sessionMetricManager:v30 sessionStore:v31 timerManager:v32 noMovementMonitor:v33];

    if (!v14)
    {
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        __int16 v47 = 1024;
        LODWORD(v48) = 380;
        int v16 = "Invalid parameter not satisfying: workoutMonitor (in %s:%d)";
        goto LABEL_24;
      }
      goto LABEL_16;
    }
  }
  else
  {
    if (v9 != 1) {
      goto LABEL_18;
    }
    uint64_t v10 = [SMTriggerDuration alloc];
    id v11 = [(SMSessionMonitor *)self queue];
    id v12 = [(SMSessionMonitor *)self defaultsManager];
    double v13 = [(SMSessionMonitor *)self sessionStore];
    double v14 = [(SMTriggerDuration *)v10 initWithQueue:v11 defaultsManager:v12 sessionStore:v13];

    if (!v14)
    {
      __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
        __int16 v47 = 1024;
        LODWORD(v48) = 347;
        int v16 = "Invalid parameter not satisfying: durationTrigger (in %s:%d)";
LABEL_24:
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  [v44 addObject:v14];

LABEL_18:
  uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = [MEMORY[0x1E4F99918] sessionTypeToString:[v43 sessionType]];
    *(_DWORD *)buf = 136315650;
    uint64_t v46 = "-[SMSessionMonitor _createTriggersWithConfiguration:]";
    __int16 v47 = 2112;
    uint64_t v48 = v35;
    __int16 v49 = 2112;
    id v50 = v44;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%s, type, %@, triggers, %@", buf, 0x20u);
  }

  return v44;
}

- (void)_processTriggerNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      int v16 = "-[SMSessionMonitor _processTriggerNotification:]";
      __int16 v17 = 1024;
      LODWORD(v18) = 409;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F99968]);
  uint64_t v7 = [v4 triggerCategory];
  int v8 = [(SMSessionMonitor *)self configuration];
  uint64_t v9 = [v8 sessionID];
  uint64_t v10 = (void *)[v6 initWithUpdateReason:1 triggerCategory:v7 sessionID:v9];

  [(SMSessionMonitor *)self setMostRecentTriggerContext:v10];
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "-[SMSessionMonitor _processTriggerNotification:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, processing trigger notification, %@", (uint8_t *)&v15, 0x16u);
  }

  if ([v4 SOSState] == 2)
  {
    id v12 = self;
    uint64_t v13 = 3;
  }
  else
  {
    if ([v4 SOSState] != 1)
    {
      double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
      [(SMSessionMonitor *)self _updateUserWithTriggerContext:v14];

      goto LABEL_13;
    }
    id v12 = self;
    uint64_t v13 = 2;
  }
  [(SMSessionMonitor *)v12 setRiskState:v13];
LABEL_13:
}

- (void)_processTriggerEstimatedEndDateUpdateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      int v16 = "-[SMSessionMonitor _processTriggerEstimatedEndDateUpdateNotification:]";
      __int16 v17 = 1024;
      LODWORD(v18) = 432;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: triggerEndDateUpdateNotification (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F99968]);
  uint64_t v7 = [v4 triggerCategory];
  int v8 = [v4 estimatedEndDate];
  uint64_t v9 = [v4 coarseEstimatedEndDate];
  uint64_t v10 = [(SMSessionMonitor *)self configuration];
  id v11 = [v10 sessionID];
  id v12 = (void *)[v6 initWithUpdateReason:5 triggerCategory:v7 estimatedEndDate:v8 coarseEstimatedEndDate:v9 sessionID:v11];

  [(SMSessionMonitor *)self setMostRecentTriggerContext:v12];
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "-[SMSessionMonitor _processTriggerEstimatedEndDateUpdateNotification:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, processing trigger notification, %@", (uint8_t *)&v15, 0x16u);
  }

  double v14 = [(SMSessionMonitor *)self mostRecentTriggerContext];
  [(SMSessionMonitor *)self _promptEstimatedEndDateUpdateWithContext:v14];
}

- (void)_processUserTriggerResponse:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    id v5 = [(SMSessionMonitor *)self sessionMonitorState];
    [v5 setTriggerConfirmed:0];
    uint64_t v6 = 1;
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
      goto LABEL_6;
    }
    id v5 = [(SMSessionMonitor *)self sessionMonitorState];
    [v5 setTriggerConfirmed:1];
    uint64_t v6 = 3;
  }

  uint64_t v7 = [(SMSessionMonitor *)self sessionMonitorState];
  [v7 setTriggerPending:0];

  [(SMSessionMonitor *)self setRiskState:v6];
LABEL_6:
  [(SMSessionMonitor *)self _persistState];
  [(SMSessionMonitor *)self _updateTriggersWithUserResponse:a3];
  int v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [MEMORY[0x1E4F99968] userTriggerResponseToString:a3];
    int v10 = 136315394;
    id v11 = "-[SMSessionMonitor _processUserTriggerResponse:]";
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, passing response, %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_processSessionEnd
{
  [(SMSessionMonitor *)self _reset];
  dispatch_semaphore_t v3 = [(SMSessionMonitor *)self locationManager];
  uint64_t v4 = 0;
  [v3 stopMonitoringAllRegionsForClientIdentifier:@"SMDestinationRegionClientIdentifier" error:&v4];

  [(SMSessionMonitor *)self _unregisterForTriggers];
  [(SMSessionMonitor *)self _shutdownWithHandler:&__block_literal_global_19];
}

void __38__SMSessionMonitor__processSessionEnd__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  dispatch_semaphore_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[SMSessionMonitor _processSessionEnd]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, session ended, shutting down safety monitor, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_processSessionResumeWithState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v16 = 136315394;
      *(void *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 487;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state (in %s:%d)", v16, 0x12u);
    }
  }
  __int16 v6 = [v4 configuration];
  [(SMSessionMonitor *)self _initializeSessionWithConfiguration:v6];

  id v7 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v4 sessionState]];
  switch([v4 sessionState])
  {
    case 0:
      [(SMSessionMonitor *)self setRiskState:0];
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      goto LABEL_17;
    case 1:
    case 12:
      [(SMSessionMonitor *)self setRiskState:0];
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 2:
      int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v16 = 136315394;
        *(void *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }

      id v11 = self;
      uint64_t v12 = 1;
      goto LABEL_28;
    case 4:
      uint64_t v13 = [(SMSessionMonitor *)self sessionMonitorState];
      [v13 setTriggerConfirmed:1];

      [(SMSessionMonitor *)self setRiskState:3];
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_17:
        *(_DWORD *)int v16 = 136315394;
        *(void *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_18:

      goto LABEL_29;
    case 7:
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 8:
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 9:
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 10:
    case 11:
      [(SMSessionMonitor *)self setRiskState:0];
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        *(_DWORD *)int v16 = 136315394;
        *(void *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_10:

      goto LABEL_30;
    case 14:
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_26:
        *(_DWORD *)int v16 = 136315394;
        *(void *)&v16[4] = "-[SMSessionMonitor _processSessionResumeWithState:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, session resumed to, %@", v16, 0x16u);
      }
LABEL_27:

      int v15 = [(SMSessionMonitor *)self sessionMonitorState];
      [v15 setTriggerPending:1];

      id v11 = self;
      uint64_t v12 = 2;
LABEL_28:
      -[SMSessionMonitor setRiskState:](v11, "setRiskState:", v12, *(void *)v16, *(_OWORD *)&v16[8], v17);
      goto LABEL_29;
    default:
LABEL_29:
      [(SMSessionMonitor *)self _persistState];
LABEL_30:

      return;
  }
}

- (void)_registerForTriggersWithConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SMSessionMonitor *)self _unregisterForTriggers];
  id v5 = [(SMSessionMonitor *)self _createTriggersWithConfiguration:v4];
  [(SMSessionMonitor *)self setTriggers:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  __int16 v6 = [(SMSessionMonitor *)self triggers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          [v11 setSessionMonitorDelegate:self];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __58__SMSessionMonitor__registerForTriggersWithConfiguration___block_invoke;
          v12[3] = &unk_1E6B90840;
          v12[4] = v11;
          [v11 startMonitoringWithConfiguration:v4 handler:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __58__SMSessionMonitor__registerForTriggersWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[SMSessionMonitor _registerForTriggersWithConfiguration:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%s, register for trigger, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_unregisterForTriggers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(SMSessionMonitor *)self triggers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          [v7 setSessionMonitorDelegate:0];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __42__SMSessionMonitor__unregisterForTriggers__block_invoke;
          v9[3] = &unk_1E6B90840;
          v9[4] = v7;
          [v7 stopMonitoringWithHandler:v9];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [(SMSessionMonitor *)self setTriggers:0];
}

void __42__SMSessionMonitor__unregisterForTriggers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[SMSessionMonitor _unregisterForTriggers]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%s, unregister for trigger, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_updateGeofenceWithConfiguration:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
      __int16 v24 = 1024;
      LODWORD(v25) = 598;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
    }
  }
  int v6 = [v4 destination];
  uint64_t v7 = [v6 clLocation];

  if (v7)
  {
    __int16 v8 = [(SMSessionMonitor *)self configuration];
    uint64_t v9 = [v8 destination];
    __int16 v10 = [v9 clLocation];

    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, current configuration destination, %@, updated configuration destination, %@", buf, 0x20u);
    }

    if (v10 && ([v10 distanceFromLocation:v7], v12 < 10.0))
    {
      long long v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, current configuration destination matches updated configuration destination, exiting geofence update", buf, 0xCu);
      }
    }
    else
    {
      long long v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, proceed to update destination geofence", buf, 0xCu);
      }

      uint64_t v15 = [(SMSessionMonitor *)self locationManager];
      id v21 = 0;
      [v15 stopMonitoringAllRegionsForClientIdentifier:@"SMDestinationRegionClientIdentifier" error:&v21];
      long long v13 = v21;

      if (v13)
      {
        long long v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v23 = "-[SMSessionMonitor _updateGeofenceWithConfiguration:]";
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%s, Error stopping monitoring for regions, %@", buf, 0x16u);
        }
      }
      uint64_t v17 = [v4 destination];
      [v17 radius];
      double v19 = v18;

      if (v19 <= 0.0)
      {
        double v19 = *MEMORY[0x1E4F99B18];
      }
      else if (v19 < *MEMORY[0x1E4F99B28])
      {
        double v19 = *MEMORY[0x1E4F99B28];
      }
      id v20 = [v4 destination];
      -[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:](self, "_setupGeofenceWithLocation:regionIdentifier:radius:destinationType:", v7, @"SMDestinationRegionIdentifier", [v20 destinationType], v19);
    }
  }
}

- (void)_initializeSessionWithConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v10 = 136315394;
      *(void *)&v10[4] = "-[SMSessionMonitor _initializeSessionWithConfiguration:]";
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = 642;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", v10, 0x12u);
    }
  }
  [(SMSessionMonitor *)self _addObservers];
  [(SMSessionMonitor *)self _registerForCircularRegionEventsForIdentifier:@"SMDestinationRegionClientIdentifier"];
  [(SMSessionMonitor *)self _registerForTriggersWithConfiguration:v4];
  int v6 = [(SMSessionMonitor *)self locationManager];
  int v7 = [v6 isMonitoringForRegionWithClientIdentifier:@"SMDestinationRegionClientIdentifier" regionIdentifier:@"SMDestinationRegionIdentifier"];

  __int16 v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = @"NO";
    *(_DWORD *)__int16 v10 = 136315650;
    *(void *)&v10[4] = "-[SMSessionMonitor _initializeSessionWithConfiguration:]";
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = v4;
    if (v7) {
      uint64_t v9 = @"YES";
    }
    *(_WORD *)&v10[22] = 2112;
    id v11 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, configuration, %@, monitoringForConfiguration, %@", v10, 0x20u);
  }

  if ((v7 & 1) == 0) {
    [(SMSessionMonitor *)self _updateGeofenceWithConfiguration:v4];
  }
  -[SMSessionMonitor setConfiguration:](self, "setConfiguration:", v4, *(_OWORD *)v10, *(void *)&v10[16]);
  [(SMSessionMonitor *)self _bootstrap];
}

- (void)_initializeTriggersForRemoteSessionIfNecessary
{
  id v3 = [(SMSessionMonitor *)self triggers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SMSessionMonitor *)self _registerForTriggersWithConfiguration:0];
  }
}

- (void)_addObservers
{
  id v4 = [(SMSessionMonitor *)self locationManager];
  id v3 = +[RTNotification notificationName];
  [v4 addObserver:self selector:sel_onLocationNotification_ name:v3];
}

- (void)_removeObservers
{
  id v3 = [(SMSessionMonitor *)self locationManager];
  [v3 removeObserver:self];
}

- (void)_persistState
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SMSessionMonitor *)self sessionMonitorState];
  int v4 = [v3 dirty];

  if (v4)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__24;
    v38 = __Block_byref_object_dispose__24;
    id v39 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    int v6 = [(SMSessionMonitor *)self sessionStore];
    int v7 = [(SMSessionMonitor *)self sessionMonitorState];
    id v45 = v7;
    __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __33__SMSessionMonitor__persistState__block_invoke;
    v31[3] = &unk_1E6B90728;
    v33 = &v34;
    uint64_t v9 = v5;
    __int16 v32 = v9;
    [v6 storeSessionMonitorStates:v8 handler:v31];

    __int16 v10 = (id *)(v35 + 5);
    id v11 = (id)v35[5];
    uint64_t v12 = v9;
    long long v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      __int16 v30 = [MEMORY[0x1E4F1C9C8] now];
      [v30 timeIntervalSinceDate:v13];
      double v16 = v15;
      uint64_t v17 = objc_opt_new();
      double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_398];
      double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 filteredArrayUsingPredicate:v18];
      id v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
      }

      id v23 = (void *)MEMORY[0x1E4F28C58];
      v46[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v46 count:1];
      id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

      if (v25)
      {
        id v11 = v25;
      }
    }

    objc_storeStrong(v10, v11);
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [(SMSessionMonitor *)self sessionMonitorState];
      uint64_t v28 = v35[5];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SMSessionMonitor _persistState]";
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = v28;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, persisted state, %@, error, %@", buf, 0x20u);
    }
    uint64_t v29 = [(SMSessionMonitor *)self sessionMonitorState];
    [v29 setDirty:0];

    _Block_object_dispose(&v34, 8);
  }
}

void __33__SMSessionMonitor__persistState__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onBecomingActiveDevice:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SMSessionMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SMSessionMonitor_onBecomingActiveDevice___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__SMSessionMonitor_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBecomingActiveDevice:*(void *)(a1 + 40)];
}

- (void)_onBecomingActiveDevice:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[SMSessionMonitor _onBecomingActiveDevice:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, state, %@, initiating actions to become an active device", (uint8_t *)&v6, 0x16u);
  }

  [(SMSessionMonitor *)self onSessionResumedWithState:v4 forActiveDevice:1];
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SMSessionMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SMSessionMonitor_onBecomingNonActiveDevice___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__SMSessionMonitor_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBecomingNonActiveDevice:*(void *)(a1 + 40)];
}

- (void)_onBecomingNonActiveDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SMSessionMonitor _onBecomingNonActiveDevice:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, state, %@, initiating actions to become a non active device", buf, 0x16u);
  }

  id v6 = [(SMSessionMonitor *)self locationManager];
  uint64_t v7 = 0;
  [v6 stopMonitoringAllRegionsForClientIdentifier:@"SMDestinationRegionClientIdentifier" error:&v7];

  [(SMSessionMonitor *)self _unregisterForTriggers];
  [(SMSessionMonitor *)self _reset];
  [(SMSessionMonitor *)self _initializeTriggersForRemoteSessionIfNecessary];
}

- (void)onSessionStartedWithConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SMSessionMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SMSessionMonitor_onSessionStartedWithConfiguration___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__SMSessionMonitor_onSessionStartedWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SMSessionMonitor onSessionStartedWithConfiguration:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%s, configuration, %@", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 40) _initializeSessionWithConfiguration:*(void *)(a1 + 32)];
}

- (void)onSessionChangedWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  __int16 v10 = __54__SMSessionMonitor_onSessionChangedWithConfiguration___block_invoke;
  id v11 = &unk_1E6B90BF0;
  id v12 = v4;
  long long v13 = self;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v8);
  __int16 v7 = [(SMSessionMonitor *)self queue];
  dispatch_async(v7, v6);
}

uint64_t __54__SMSessionMonitor_onSessionChangedWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SMSessionMonitor onSessionChangedWithConfiguration:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, configuration, %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 40) _reset];
  [*(id *)(a1 + 40) _updateTriggersWithConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _updateGeofenceWithConfiguration:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) setConfiguration:*(void *)(a1 + 32)];
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SMSessionMonitor_onSessionResumedWithState_forActiveDevice___block_invoke;
  v10[3] = &unk_1E6B91328;
  BOOL v13 = a4;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x1E016DB00](v10);
  uint64_t v9 = [(SMSessionMonitor *)self queue];
  dispatch_async(v9, v8);
}

void __62__SMSessionMonitor_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isActiveState])
  {
    int v2 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v11 = 136315394;
        id v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, state, %@", (uint8_t *)&v11, 0x16u);
      }

      [*(id *)(a1 + 40) _processSessionResumeWithState:*(void *)(a1 + 32)];
    }
    else
    {
      if (v4)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = *(unsigned __int8 *)(a1 + 48);
        int v11 = 136315650;
        id v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
        __int16 v13 = 2112;
        uint64_t v14 = v9;
        __int16 v15 = 1024;
        int v16 = v10;
        _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, state, %@ only initialize triggers for remote session since active device %d", (uint8_t *)&v11, 0x1Cu);
      }

      [*(id *)(a1 + 40) _initializeTriggersForRemoteSessionIfNecessary];
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(unsigned __int8 *)(a1 + 48);
      int v11 = 136315650;
      id v12 = "-[SMSessionMonitor onSessionResumedWithState:forActiveDevice:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, not initializing monitor for inactive state, %@, activeDevice, %d", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SMSessionMonitor_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E6B90E70;
  v6[4] = self;
  BOOL v4 = (void *)MEMORY[0x1E016DB00](v6, a2, a3);
  uint64_t v5 = [(SMSessionMonitor *)self queue];
  dispatch_async(v5, v4);
}

uint64_t __50__SMSessionMonitor_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SMSessionMonitor onSessionEndedForActiveDevice:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _removeObservers];
  return [*(id *)(a1 + 32) _processSessionEnd];
}

- (void)onUserTriggerResponse:(int64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SMSessionMonitor_onUserTriggerResponse___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  void v6[5] = a3;
  int v4 = (void *)MEMORY[0x1E016DB00](v6, a2);
  uint64_t v5 = [(SMSessionMonitor *)self queue];
  dispatch_async(v5, v4);
}

uint64_t __42__SMSessionMonitor_onUserTriggerResponse___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SMSessionMonitor onUserTriggerResponse:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) _processUserTriggerResponse:*(void *)(a1 + 40)];
}

- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SMSessionMonitor_onRemoteEmergencyContactsNotified___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  void v6[5] = a3;
  int v4 = (void *)MEMORY[0x1E016DB00](v6, a2);
  uint64_t v5 = [(SMSessionMonitor *)self queue];
  dispatch_async(v5, v4);
}

void __54__SMSessionMonitor_onRemoteEmergencyContactsNotified___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[SMSessionMonitor onRemoteEmergencyContactsNotified:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) triggers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 onRemoteEmergencyContactsNotified:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)onWorkoutPause
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SMSessionMonitor_onWorkoutPause__block_invoke;
  v5[3] = &unk_1E6B90E70;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1E016DB00](v5, a2);
  uint64_t v4 = [(SMSessionMonitor *)self queue];
  dispatch_async(v4, v3);
}

void __34__SMSessionMonitor_onWorkoutPause__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[SMSessionMonitor onWorkoutPause]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) triggers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 onWorkoutTriggerControlUpdate:1];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)onWorkoutResume
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SMSessionMonitor_onWorkoutResume__block_invoke;
  v5[3] = &unk_1E6B90E70;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1E016DB00](v5, a2);
  uint64_t v4 = [(SMSessionMonitor *)self queue];
  dispatch_async(v4, v3);
}

void __35__SMSessionMonitor_onWorkoutResume__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[SMSessionMonitor onWorkoutResume]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) triggers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 onWorkoutTriggerControlUpdate:2];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_promptEstimatedEndDateUpdateWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    int v8 = "-[SMSessionMonitor _promptEstimatedEndDateUpdateWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v6 promptEstimatedEndDateUpdateWithContext:v4];
}

- (void)_promptTimerEndedVerificationWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SMSessionMonitor *)self sessionMonitorState];
  [v5 setTriggerPending:1];

  [(SMSessionMonitor *)self _persistState];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    __int16 v9 = "-[SMSessionMonitor _promptTimerEndedVerificationWithContext:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  int v7 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v7 promptTimerEndedVerificationWithContext:v4];
}

- (void)_promptDestinationAnomalyVerificationWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SMSessionMonitor *)self sessionMonitorState];
  [v5 setTriggerPending:1];

  [(SMSessionMonitor *)self _persistState];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    __int16 v9 = "-[SMSessionMonitor _promptDestinationAnomalyVerificationWithContext:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  int v7 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v7 promptDestinationAnomalyVerificationWithContext:v4];
}

- (void)_promptRoundTripAnomalyVerificationWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SMSessionMonitor *)self sessionMonitorState];
  [v5 setTriggerPending:1];

  [(SMSessionMonitor *)self _persistState];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    __int16 v9 = "-[SMSessionMonitor _promptRoundTripAnomalyVerificationWithContext:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v8, 0x16u);
  }

  int v7 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v7 promptRoundTripAnomalyVerificationWithContext:v4];
}

- (void)_promptWorkoutAnomalyVerificationWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    int v8 = "-[SMSessionMonitor _promptWorkoutAnomalyVerificationWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v6 promptWorkoutAnomalyVerificationWithContext:v4];
}

- (void)_promptDirectTriggerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    int v8 = "-[SMSessionMonitor _promptDirectTriggerWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v6 promptDirectTriggerWithContext:v4];
}

- (void)_promptSafeArrivalWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SMSessionMonitor _promptSafeArrivalWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, context, %@", (uint8_t *)&v7, 0x16u);
  }

  [(SMSessionMonitor *)self _processSessionEnd];
  uint64_t v6 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v6 promptSafeArrivalWithContext:v4];
}

- (void)_updateUserWithTriggerContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    int v8 = "-[SMSessionMonitor _updateUserWithTriggerContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s, sessionMonitorContext, %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self sessionManagerDelegate];
  [v6 updateUserWithTriggerContext:v4];
}

- (void)onTriggerNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SMSessionMonitor onTriggerNotification:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, notification, %@", buf, 0x16u);
  }

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __42__SMSessionMonitor_onTriggerNotification___block_invoke;
  uint64_t v12 = &unk_1E6B90BF0;
  id v13 = v4;
  uint64_t v14 = self;
  id v6 = v4;
  int v7 = (void *)MEMORY[0x1E016DB00](&v9);
  int v8 = [(SMSessionMonitor *)self queue];
  dispatch_async(v8, v7);
}

void __42__SMSessionMonitor_onTriggerNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    [v6 _processTriggerNotification:v5];
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) name];
    int v8 = +[RTNotification notificationName];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 40);
      [v10 _processTriggerEstimatedEndDateUpdateNotification:v11];
    }
    else
    {
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [*(id *)(a1 + 32) name];
        int v14 = 136315394;
        __int16 v15 = "-[SMSessionMonitor onTriggerNotification:]_block_invoke";
        __int16 v16 = 2112;
        __int16 v17 = v13;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, notification not supported, %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)_updateTriggersWithConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(SMSessionMonitor *)self triggers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v17 = "-[SMSessionMonitor _updateTriggersWithConfiguration:]";
            __int16 v18 = 2112;
            uint64_t v19 = v10;
            _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, registering trigger, %@", buf, 0x16u);
          }

          [v10 modifyMonitoringWithConfiguration:v4 handler:&__block_literal_global_156];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v7);
  }
}

void __53__SMSessionMonitor__updateTriggersWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SMSessionMonitor _updateTriggersWithConfiguration:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%s, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_updateTriggersWithUserResponse:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = [(SMSessionMonitor *)self triggers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 onUserTriggerResponse:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setupGeofenceWithLocation:(id)a3 regionIdentifier:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    __int16 v29 = 1024;
    LODWORD(v30) = 1012;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_7:
    long long v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
      __int16 v29 = 1024;
      LODWORD(v30) = 1013;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: regionIdentifier (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = [MEMORY[0x1E4F99928] destinationTypeToString:a6];
    *(_DWORD *)buf = 136316162;
    uint64_t v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    __int16 v32 = v12;
    __int16 v33 = 2048;
    double v34 = a5;
    __int16 v35 = 2112;
    uint64_t v36 = v16;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, regionLocation, %@, regionIdentifier, %@, radius, %.3f, destinationType, %@", buf, 0x34u);
  }
  [v10 coordinate];
  double v18 = v17;
  [v10 coordinate];
  id v20 = (Class *)0x1E4F1E6A0;
  if (a6 != 1) {
    id v20 = (Class *)0x1E4F1E5A8;
  }
  uint64_t v21 = [objc_alloc(*v20) initWithCenter:v12 radius:v18 identifier:v19];
  [v21 setGeoReferenceFrame:[v10 referenceFrame]];
  id v22 = [(SMSessionMonitor *)self locationManager];
  id v26 = 0;
  [v22 startMonitoringForRegion:v21 clientIdentifier:@"SMDestinationRegionClientIdentifier" error:&v26];
  id v23 = v26;

  __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
    __int16 v29 = 2112;
    id v30 = v21;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%s, registered geofence for region, %@", buf, 0x16u);
  }

  if (v23)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SMSessionMonitor _setupGeofenceWithLocation:regionIdentifier:radius:destinationType:]";
      __int16 v29 = 2112;
      id v30 = v23;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%s, error setting up fence for safety buddy trip notifier, %@", buf, 0x16u);
    }
  }
}

- (void)_registerForCircularRegionEventsForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Registering for circular region events with identifier, %@", buf, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self locationManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SMSessionMonitor__registerForCircularRegionEventsForIdentifier___block_invoke;
  v8[3] = &unk_1E6B92E78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 registerForRegionEventsWithClientIdentifier:v7 handler:v8];
}

void __66__SMSessionMonitor__registerForCircularRegionEventsForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = [v7 identifier];
  int v10 = [v9 isEqualToString:@"SMDestinationRegionIdentifier"];

  if (!v10)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v17 = [v7 identifier];
      __int16 v16 = +[RTLocationManager stringForRegionCallbackType:a3];
      int v19 = 136315906;
      id v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, received region monitoring event for unsupported region identifier, %@, regionCallbackType, %@, error, %@", (uint8_t *)&v19, 0x2Au);

      goto LABEL_18;
    }
LABEL_7:

    goto LABEL_10;
  }
  if (a3 == 4)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = +[RTLocationManager stringForRegionCallbackType:4];
      int v19 = 136315650;
      id v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v8;
      id v13 = "%s, regionMonitoring failure, %@, error, %@";
      goto LABEL_20;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (a3 == 3)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = +[RTLocationManager stringForRegionCallbackType:3];
      int v19 = 136315650;
      id v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v8;
      id v13 = "%s, regionMonitoring client registration failure, %@, error, %@";
LABEL_20:
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v14 = v15;
  if (v8)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = +[RTLocationManager stringForRegionCallbackType:a3];
      int v19 = 136315650;
      id v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, regionMonitoring %@, error, %@", (uint8_t *)&v19, 0x20u);
LABEL_18:

      goto LABEL_7;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    double v18 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v19 = 136315650;
    id v20 = "-[SMSessionMonitor _registerForCircularRegionEventsForIdentifier:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v18;
    __int16 v23 = 2112;
    id v24 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%s, regionMonitoring success %@, error, %@", (uint8_t *)&v19, 0x20u);
  }
  [*(id *)(a1 + 32) handleCircularRegionCallback:a3 region:v7 clientIdentifier:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)_unregisterForCircularRegionEventsForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Unregistering for circular region events with identifier, %@", buf, 0x16u);
  }

  uint64_t v6 = [(SMSessionMonitor *)self locationManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SMSessionMonitor__unregisterForCircularRegionEventsForIdentifier___block_invoke;
  v8[3] = &unk_1E6B90840;
  id v9 = v4;
  id v7 = v4;
  [v6 unregisterForRegionEventsWithClientIdentifier:v7 handler:v8];
}

void __68__SMSessionMonitor__unregisterForCircularRegionEventsForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%s, regionMonitoring client unregistration failed with error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    int v7 = 136315650;
    id v8 = "-[SMSessionMonitor _unregisterForCircularRegionEventsForIdentifier:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, unregistered for region event with client identifier, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SMSessionMonitor *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SMSessionMonitor_handleCircularRegionCallback_region_clientIdentifier___block_invoke;
  v13[3] = &unk_1E6B917F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__SMSessionMonitor_handleCircularRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCircularRegionCallback:*(void *)(a1 + 56) region:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48)];
}

- (void)_handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (__CFString *)a5;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    double v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
    __int16 v18 = 1024;
    LODWORD(v19) = 1150;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region (in %s:%d)", (uint8_t *)&v16, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      double v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
      __int16 v18 = 1024;
      LODWORD(v19) = 1151;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }
  }
LABEL_10:
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v16 = 136315906;
    double v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
    __int16 v18 = 2112;
    int v19 = v14;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, Received event, %@, region, %@, clientIdentifier, %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v10 == @"SMDestinationRegionClientIdentifier")
  {
    if ((unint64_t)(a3 - 1) <= 1) {
      [(SMSessionMonitor *)self _updateRegionStateWithCircularRegionCallback:a3];
    }
  }
  else
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315394;
      double v17 = "-[SMSessionMonitor _handleCircularRegionCallback:region:clientIdentifier:]";
      __int16 v18 = 2112;
      int v19 = @"SMDestinationRegionClientIdentifier";
      _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%s, unrecognized clientIdentifier, %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_updateRegionStateWithCircularRegionCallback:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v7 = [(SMSessionMonitor *)self currentLocation];
    id v8 = [(SMSessionMonitor *)self configuration];
    id v9 = [v8 destination];
    id v10 = [v9 clLocation];
    [v7 distanceFromLocation:v10];
    int v16 = 136315650;
    double v17 = "-[SMSessionMonitor _updateRegionStateWithCircularRegionCallback:]";
    __int16 v18 = 2112;
    int v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, distance to destination, %.3f", (uint8_t *)&v16, 0x20u);
  }
  id v12 = [(SMSessionMonitor *)self configuration];
  uint64_t v13 = [v12 sessionType];

  if (v13 == 2)
  {
    [(SMSessionMonitor *)self _updateDestinationBoundRegionStateWithCircularRegionCallback:a3];
  }
  else
  {
    id v14 = [(SMSessionMonitor *)self configuration];
    uint64_t v15 = [v14 sessionType];

    if (v15 == 3) {
      [(SMSessionMonitor *)self _updateRoundTripRegionStateWithCircularRegionCallback:a3];
    }
  }
}

- (void)_updateDestinationBoundRegionStateWithCircularRegionCallback:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v7 = (void *)MEMORY[0x1E4F99970];
    id v8 = [(SMSessionMonitor *)self sessionMonitorState];
    id v9 = [v7 regionStateToString:[v8 currentRegionState]];
    *(_DWORD *)buf = 136315650;
    __int16 v29 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]";
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    __int16 v33 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, currentRegionState, %@", buf, 0x20u);
  }
  if (a3 == 1)
  {
    id v10 = [(SMSessionMonitor *)self sessionMonitorState];
    unint64_t v11 = [v10 currentRegionState];

    if (v11 <= 2)
    {
      id v12 = [(SMSessionMonitor *)self sessionMonitorState];
      [v12 setCurrentRegionState:2];

      [(SMSessionMonitor *)self _persistState];
      uint64_t v13 = [(SMSessionMonitor *)self regionInsidePendingTimer];
      [v13 invalidate];

      [(SMSessionMonitor *)self setRegionInsidePendingTimer:0];
      objc_initWeak(&location, self);
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v15 = [RTXPCTimerAlarm alloc];
      int v16 = [(SMSessionMonitor *)self queue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __81__SMSessionMonitor__updateDestinationBoundRegionStateWithCircularRegionCallback___block_invoke;
      v24[3] = &unk_1E6B92EA0;
      id v17 = v14;
      id v25 = v17;
      objc_copyWeak(&v26, &location);
      __int16 v18 = [(RTXPCTimerAlarm *)v15 initWithIdentifier:@"com.apple.routined.SMSessionMonitor.insidePendingTimer" queue:v16 handler:v24];
      [(SMSessionMonitor *)self setRegionInsidePendingTimer:v18];

      int v19 = [(SMSessionMonitor *)self regionInsidePendingTimer];
      [(SMSessionMonitor *)self sessionMonitorRegionInsidePendingTimerDelay];
      __int16 v20 = [v17 dateByAddingTimeInterval:];
      id v23 = 0;
      [v19 fireWithDate:v20 error:&v23];
      id v21 = v23;

      if (v21)
      {
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v29 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]";
          __int16 v30 = 2112;
          id v31 = v21;
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
        }
      }
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
    }
  }
  else if (a3 == 2)
  {
    [(SMSessionMonitor *)self _onRegionExit];
  }
}

void __81__SMSessionMonitor__updateDestinationBoundRegionStateWithCircularRegionCallback___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 136315650;
    int v7 = "-[SMSessionMonitor _updateDestinationBoundRegionStateWithCircularRegionCallback:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = @"com.apple.routined.SMSessionMonitor.insidePendingTimer";
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v6, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _onRegionInsidePendingTimerExpiry];
}

- (void)_updateRoundTripRegionStateWithCircularRegionCallback:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v7 = (void *)MEMORY[0x1E4F99970];
    __int16 v8 = [(SMSessionMonitor *)self sessionMonitorState];
    id v9 = [v7 regionStateToString:[v8 currentRegionState]];
    *(_DWORD *)buf = 136315650;
    __int16 v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    __int16 v33 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Received event, %@, currentRegionState, %@", buf, 0x20u);
  }
  if (a3 == 2)
  {
    [(SMSessionMonitor *)self _onRegionExit];
  }
  else
  {
    __int16 v10 = [(SMSessionMonitor *)self sessionMonitorState];
    uint64_t v11 = [v10 currentRegionState];

    if ((unint64_t)(v11 - 2) >= 2 && v11)
    {
      if (v11 == 1)
      {
        if (a3 == 1)
        {
          uint64_t v12 = [(SMSessionMonitor *)self sessionMonitorState];
          [v12 setCurrentRegionState:2];

          [(SMSessionMonitor *)self _persistState];
          objc_initWeak(&location, self);
          uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
          id v14 = [RTXPCTimerAlarm alloc];
          uint64_t v15 = [(SMSessionMonitor *)self queue];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __74__SMSessionMonitor__updateRoundTripRegionStateWithCircularRegionCallback___block_invoke;
          v24[3] = &unk_1E6B92EA0;
          id v16 = v13;
          id v25 = v16;
          objc_copyWeak(&v26, &location);
          id v17 = [(RTXPCTimerAlarm *)v14 initWithIdentifier:@"com.apple.routined.SMSessionMonitor.insidePendingTimer" queue:v15 handler:v24];
          [(SMSessionMonitor *)self setRegionInsidePendingTimer:v17];

          __int16 v18 = [(SMSessionMonitor *)self regionInsidePendingTimer];
          [(SMSessionMonitor *)self sessionMonitorRegionInsidePendingTimerDelay];
          int v19 = [v16 dateByAddingTimeInterval:];
          id v23 = 0;
          [v18 fireWithDate:v19 error:&v23];
          id v20 = v23;

          if (v20)
          {
            id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
              __int16 v30 = 2112;
              id v31 = v20;
              _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
            }
          }
          objc_destroyWeak(&v26);

          objc_destroyWeak(&location);
        }
      }
      else
      {
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v29 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]";
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%s, Invalid region state", buf, 0xCu);
        }
      }
    }
  }
}

void __74__SMSessionMonitor__updateRoundTripRegionStateWithCircularRegionCallback___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 136315650;
    int v7 = "-[SMSessionMonitor _updateRoundTripRegionStateWithCircularRegionCallback:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = @"com.apple.routined.SMSessionMonitor.insidePendingTimer";
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v6, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _onRegionInsidePendingTimerExpiry];
}

- (void)_onRegionInsidePendingTimerExpiry
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F99970];
    uint64_t v5 = [(SMSessionMonitor *)self sessionMonitorState];
    int v6 = [v4 regionStateToString:[v5 currentRegionState]];
    int v17 = 136315394;
    __int16 v18 = "-[SMSessionMonitor _onRegionInsidePendingTimerExpiry]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, currentRegionState, %@", (uint8_t *)&v17, 0x16u);
  }
  int v7 = [(SMSessionMonitor *)self sessionMonitorState];
  __int16 v8 = (void *)[v7 currentRegionState];

  if (v8 == (void *)2)
  {
    id v9 = [(SMSessionMonitor *)self sessionMonitorState];
    [v9 setCurrentRegionState:3];

    [(SMSessionMonitor *)self _persistState];
    id v10 = objc_alloc(MEMORY[0x1E4F99968]);
    uint64_t v11 = [(SMSessionMonitor *)self mostRecentTriggerContext];
    if (v11)
    {
      __int16 v8 = [(SMSessionMonitor *)self mostRecentTriggerContext];
      uint64_t v12 = [v8 triggerCategory];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [(SMSessionMonitor *)self configuration];
    id v14 = [v13 sessionID];
    uint64_t v15 = (void *)[v10 initWithUpdateReason:4 triggerCategory:v12 sessionID:v14];

    if (v11) {
    [(SMSessionMonitor *)self setMostRecentTriggerContext:v15];
    }
    [(SMSessionMonitor *)self setRiskState:4];
  }
  id v16 = [(SMSessionMonitor *)self regionInsidePendingTimer];
  [v16 invalidate];

  [(SMSessionMonitor *)self setRegionInsidePendingTimer:0];
}

- (void)_onRegionExit
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "-[SMSessionMonitor _onRegionExit]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Received region exit event", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [(SMSessionMonitor *)self sessionMonitorState];
  [v4 setCurrentRegionState:1];

  [(SMSessionMonitor *)self _persistState];
  uint64_t v5 = [(SMSessionMonitor *)self regionInsidePendingTimer];
  [v5 invalidate];

  [(SMSessionMonitor *)self setRegionInsidePendingTimer:0];
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __43__SMSessionMonitor_onLocationNotification___block_invoke;
  uint64_t v11 = &unk_1E6B90BF0;
  id v12 = v4;
  uint64_t v13 = self;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1E016DB00](&v8);
  int v7 = [(SMSessionMonitor *)self queue];
  dispatch_async(v7, v6);
}

void __43__SMSessionMonitor_onLocationNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [*(id *)(a1 + 32) leechedLocations];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [v2 reverseObjectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if (+[SMTriggerDestination validLocation:*(void *)(*((void *)&v9 + 1) + 8 * i)])
          {
            uint64_t v8 = [v2 lastObject];
            [*(id *)(a1 + 40) setCurrentLocation:v8];

            goto LABEL_14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }
  }
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

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
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

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SMSessionManagerMonitorProtocol)sessionManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionManagerDelegate);

  return (SMSessionManagerMonitorProtocol *)WeakRetained;
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
}

- (unint64_t)riskState
{
  return self->_riskState;
}

- (SMSessionMonitorContext)mostRecentTriggerContext
{
  return self->_mostRecentTriggerContext;
}

- (void)setMostRecentTriggerContext:(id)a3
{
}

- (RTTimer)pendingSafeArrivalTimer
{
  return self->_pendingSafeArrivalTimer;
}

- (void)setPendingSafeArrivalTimer:(id)a3
{
}

- (NSSet)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (SMSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (RTXPCTimerAlarm)regionInsidePendingTimer
{
  return self->_regionInsidePendingTimer;
}

- (void)setRegionInsidePendingTimer:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (SMSessionMonitorState)sessionMonitorState
{
  return self->_sessionMonitorState;
}

- (void)setSessionMonitorState:(id)a3
{
}

- (double)sessionMonitorRegionInsidePendingTimerDelay
{
  return self->_sessionMonitorRegionInsidePendingTimerDelay;
}

- (void)setSessionMonitorRegionInsidePendingTimerDelay:(double)a3
{
  self->_double sessionMonitorRegionInsidePendingTimerDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionMonitorState, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_regionInsidePendingTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_pendingSafeArrivalTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentTriggerContext, 0);
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_destroyWeak((id *)&self->_sessionManagerDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end