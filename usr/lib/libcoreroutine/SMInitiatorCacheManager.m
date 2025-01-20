@interface SMInitiatorCacheManager
+ (id)getTelemetryEventStringForEvent:(int64_t)a3;
- (BOOL)_isEffectivePairedDeviceNearby;
- (BOOL)_isEligibleForCacheUpdateAndPerformRecoveryIfNecessary;
- (BOOL)_isKeyReleaseScheduled;
- (BOOL)_shouldIncludeWorkoutSnapshotInCache:(id)a3;
- (BOOL)_shouldPerformFirstCacheUpdateCKOperation;
- (BOOL)_shouldScheduleKeyReleaseMessage;
- (BOOL)cellularLinkQualityFetchInProgress;
- (BOOL)initializationCompletionCalled;
- (BOOL)initializationInProgress;
- (BOOL)initializationWasAborted;
- (BOOL)initiatorContactStoreInProgress;
- (BOOL)initiatorContactStored;
- (BOOL)initiatorContactUpdatePending;
- (BOOL)isActiveDevice;
- (BOOL)isCellularActivated;
- (BOOL)isPeriodicallyUpdatingCache;
- (BOOL)isStandalone;
- (BOOL)registeredForActiveNotifications;
- (BOOL)registeredForGeneralNotifications;
- (BOOL)scheduledSendInProgress;
- (BOOL)wifiLinkQualityFetchInProgress;
- (NSUUID)cacheUploadInProgress;
- (NSUUID)sessionUUID;
- (OS_dispatch_queue)initiatorEligibilityQueue;
- (OS_dispatch_queue)queue;
- (RTAuthorizationManager)authorizationManager;
- (RTBatteryManager)batteryManager;
- (RTDefaultsManager)defaultsManager;
- (RTHealthKitManager)healthKitManager;
- (RTLocationAwarenessManager)locationAwarenessManager;
- (RTLocationManager)locationManager;
- (RTNetworkOfInterestManager)networkOfInterestManager;
- (RTPlatform)platform;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTWatchWristStateManager)wristStateManager;
- (RTXPCActivityManager)xpcActivityManager;
- (RTXPCTimerAlarm)cacheUpdateBackstopTimerAlarm;
- (RTXPCTimerAlarm)cleanupCacheTimerAlarm;
- (RTXPCTimerAlarm)scheduledSendFireTimerAlarm;
- (SMActiveSessionZone)activeSessionDetailsZone;
- (SMAppDeletionManager)appDeletionManager;
- (SMCAMetricCacheUpdate)caMetricCacheUpdate;
- (SMInitiatorCacheManager)initWithInitiatorContact:(id)a3 loadedFromDisk:(BOOL)a4 safetyCacheStore:(id)a5 sessionStore:(id)a6 defaultsManager:(id)a7 locationManager:(id)a8 queue:(id)a9 batteryManager:(id)a10 xpcActivityManager:(id)a11 messagingService:(id)a12 networkOfInterestManager:(id)a13 authorizationManager:(id)a14 wristStateManager:(id)a15 vehicleLocationProvider:(id)a16 activeSessionDetailsZone:(id)a17 healthKitManager:(id)a18 platform:(id)a19 appDeletionManager:(id)a20;
- (SMInitiatorCacheManager)initWithSafetyCacheStore:(id)a3 sessionStore:(id)a4 defaultsManager:(id)a5 locationManager:(id)a6 queue:(id)a7 batteryManager:(id)a8 xpcActivityManager:(id)a9 messagingService:(id)a10 networkOfInterestManager:(id)a11 authorizationManager:(id)a12 sessionID:(id)a13 wristStateManager:(id)a14 vehicleLocationProvider:(id)a15 activeSessionDetailsZone:(id)a16 healthKitManager:(id)a17 platform:(id)a18 appDeletionManager:(id)a19;
- (SMInitiatorCacheManagerDelegateProtocol)delegate;
- (SMInitiatorContact)initiatorContact;
- (SMMessagingService)messagingService;
- (SMSafetyCacheStore)safetyCacheStore;
- (SMSafetyCacheZone)activeSessionZone;
- (SMScreenLockMonitor)screenLockMonitor;
- (SMSessionManagerState)sessionManagerState;
- (SMSessionStore)sessionStore;
- (double)_scheduledSendTimeAdvance;
- (double)cacheUpdateBackstopTimeout;
- (double)getCacheUpdateBackstopTimeout;
- (double)requestTimeFromTimed;
- (id)_getScheduleSendCancelRetryXpcActivityIdentifier;
- (id)_scheduleKeyReleaseWithCompletion:(id)a3;
- (id)deviceStatusReturnBlock;
- (id)getXpcActivityIdentifier;
- (id)initializationCompletion;
- (int64_t)initiatorEligibility;
- (int64_t)receiverEligibility;
- (unint64_t)cellularStrength;
- (unint64_t)wifiStrength;
- (void)_cancelScheduledKeyRelease;
- (void)_cancelScheduledKeyReleaseForConversation:(id)a3;
- (void)_checkConversationEligibilityWithCompletion:(id)a3;
- (void)_checkInitiatorEligibilityWithCompletion:(id)a3;
- (void)_cleanUpInitiatorContact;
- (void)_cleanUpInitiatorContactLocalStore;
- (void)_cleanupActiveSessionZone;
- (void)_deleteActiveSessionDetails:(int64_t)a3;
- (void)_evaluateAndManagePeriodicCacheUpdate;
- (void)_fetchDeviceStatusWithCompletion:(id)a3;
- (void)_fetchLocationWithCompletion:(id)a3;
- (void)_handleScheduledSendTimerFired;
- (void)_onHealthKitManagerWorkoutSnapshotUpdate:(id)a3;
- (void)_onNearbyEffectivePairedDeviceChangedNotification:(id)a3;
- (void)_periodicCacheUpdateWithCompletion:(id)a3;
- (void)_processCancelScheduledKeyReleaseResponseWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_processScheduleKeyReleaseResponseScheduledSendDate:(id)a3 messageID:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)_processUploadCacheResponseForCache:(id)a3 hashString:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)_registerForActiveNotifications;
- (void)_registerForGeneralNotifications;
- (void)_requestSmoothedLocationsWithCompletion:(id)a3;
- (void)_schedulePeriodicCacheUpdate;
- (void)_scheduleScheduleSendCancelRetry;
- (void)_sendCacheUpdatedMessage;
- (void)_sendKeyReleaseMessageForIsSecondarySOSTrigger:(BOOL)a3;
- (void)_setupActiveSessionZone;
- (void)_setupFetchOnZoneUpdates;
- (void)_setupShareZoneWithCompletion:(id)a3;
- (void)_stopCleanupCacheTimerAlarm;
- (void)_stopPeriodicCacheUpdate;
- (void)_stopScheduleSendCancelRetry;
- (void)_storeInitiatorContactInStore:(unint64_t)a3;
- (void)_teardownFetchOnZoneUpdates;
- (void)_transitionToActiveState;
- (void)_transitionToCacheReleaseStateForIsSecondarySOSTrigger:(BOOL)a3;
- (void)_transitionToNotActiveState:(BOOL)a3;
- (void)_unregisterForActiveNotifications;
- (void)_unregisterForGeneralNotifications;
- (void)_updateCacheDataForNonActiveDeviceWithCompletion:(id)a3;
- (void)_updateCacheDataWithCompletion:(id)a3;
- (void)_updateInitiatorContactInStore;
- (void)_updateInitiatorContactWithConversation:(id)a3;
- (void)_updateLockState:(BOOL)a3 location:(id)a4;
- (void)_updateScheduledSendFireTimer;
- (void)_updateVehicleParkingLocation:(id)a3;
- (void)_uploadCache:(id)a3 completion:(id)a4;
- (void)_uploadCacheForNonActiveDevice:(id)a3 completion:(id)a4;
- (void)_writeActiveSessionDetails:(int64_t)a3 qos:(id)a4 completion:(id)a5;
- (void)cleanupNonActiveSession;
- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 metricsDict:(id *)a5;
- (void)deleteZoneFromDatabaseWithRetry:(int64_t)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6;
- (void)eraseCacheDataInMemory;
- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4;
- (void)initializeSessionWithCompletion:(id)a3;
- (void)notifyObserversSafetyCacheDidUpdate;
- (void)onBecomingActiveDevice:(id)a3;
- (void)onBecomingNonActiveDevice:(id)a3;
- (void)onCellLinkQualityChangedNotification:(id)a3;
- (void)onHealthKitManagerNotification:(id)a3;
- (void)onLockStateChange:(BOOL)a3;
- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3;
- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onVehicleEventNotification:(id)a3;
- (void)onWifiLinkQualityChangedNotification:(id)a3;
- (void)processKeyReleaseInfoRequest:(id)a3;
- (void)processSessionStartInfoRequest:(id)a3;
- (void)setActiveSessionDetailsZone:(id)a3;
- (void)setActiveSessionZone:(id)a3;
- (void)setCaMetricCacheUpdate:(id)a3;
- (void)setCacheUpdateBackstopTimeout:(double)a3;
- (void)setCacheUpdateBackstopTimerAlarm:(id)a3;
- (void)setCacheUploadInProgress:(id)a3;
- (void)setCellularLinkQualityFetchInProgress:(BOOL)a3;
- (void)setCellularStrength:(unint64_t)a3;
- (void)setCleanupCacheTimerAlarm:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStatusReturnBlock:(id)a3;
- (void)setInitializationCompletion:(id)a3;
- (void)setInitializationCompletionCalled:(BOOL)a3;
- (void)setInitializationInProgress:(BOOL)a3;
- (void)setInitializationWasAborted:(BOOL)a3;
- (void)setInitiatorContactStoreInProgress:(BOOL)a3;
- (void)setInitiatorContactStored:(BOOL)a3;
- (void)setInitiatorContactUpdatePending:(BOOL)a3;
- (void)setInitiatorEligibility:(int64_t)a3;
- (void)setInitiatorEligibilityQueue:(id)a3;
- (void)setIsPeriodicallyUpdatingCache:(BOOL)a3;
- (void)setReceiverEligibility:(int64_t)a3;
- (void)setRegisteredForActiveNotifications:(BOOL)a3;
- (void)setRegisteredForGeneralNotifications:(BOOL)a3;
- (void)setScheduledSendFireTimerAlarm:(id)a3;
- (void)setScheduledSendInProgress:(BOOL)a3;
- (void)setScreenLockMonitor:(id)a3;
- (void)setSessionManagerState:(id)a3;
- (void)setWifiLinkQualityFetchInProgress:(BOOL)a3;
- (void)setWifiStrength:(unint64_t)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)stopCacheUpdateBackstopTimer;
- (void)storeCAMetricForAllLocations:(id)a3;
- (void)submitCAMetricInitiatorSession;
- (void)submitCacheUpdateCAMetricForCache:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)submitPowerTelemetryMetricForEvent:(int64_t)a3;
- (void)updateCacheUpdateBackstopTimer;
- (void)updateNonActiveSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 qos:(id)a5 completion:(id)a6;
- (void)updateSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 cacheReleaseTime:(id)a5 qos:(id)a6 completion:(id)a7;
@end

@implementation SMInitiatorCacheManager

- (SMInitiatorCacheManager)initWithInitiatorContact:(id)a3 loadedFromDisk:(BOOL)a4 safetyCacheStore:(id)a5 sessionStore:(id)a6 defaultsManager:(id)a7 locationManager:(id)a8 queue:(id)a9 batteryManager:(id)a10 xpcActivityManager:(id)a11 messagingService:(id)a12 networkOfInterestManager:(id)a13 authorizationManager:(id)a14 wristStateManager:(id)a15 vehicleLocationProvider:(id)a16 activeSessionDetailsZone:(id)a17 healthKitManager:(id)a18 platform:(id)a19 appDeletionManager:(id)a20
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v82 = a3;
  id v63 = a5;
  id v24 = a5;
  id v81 = a6;
  id v65 = a7;
  id v80 = a7;
  id v79 = a8;
  id v78 = a9;
  id v70 = a10;
  id v77 = a11;
  id v76 = a12;
  id v75 = a13;
  id v74 = a14;
  id v69 = a15;
  id v68 = a16;
  id v67 = a17;
  id v73 = a18;
  id v72 = a19;
  id v25 = a20;
  v71 = v25;
  if (!v82)
  {
    v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiatorContact", buf, 2u);
    }

    v46 = 0;
    v47 = 0;
    v26 = v24;
    goto LABEL_56;
  }
  v26 = v24;
  if (!v24)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: safetyCacheStore";
LABEL_54:
    _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, v54, buf, 2u);
    goto LABEL_55;
  }
  if (!v81)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_54;
  }
  if (!v80)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_54;
  }
  if (!v79)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_54;
  }
  if (!v78)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: queue";
    goto LABEL_54;
  }
  if (!v77)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: xpcActivityManager";
    goto LABEL_54;
  }
  if (!v76)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: messagingService";
    goto LABEL_54;
  }
  if (!v75)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: networkOfInterestManager";
    goto LABEL_54;
  }
  if (!v74)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: authorizationManager";
    goto LABEL_54;
  }
  if (!v73)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_54;
  }
  if (!v72)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v54 = "Invalid parameter not satisfying: platform";
      goto LABEL_54;
    }
LABEL_55:

    v46 = 0;
    v47 = v82;
LABEL_56:
    v49 = v69;
    v48 = v70;
    v51 = v67;
    v50 = v68;
LABEL_57:
    v45 = self;
    goto LABEL_58;
  }
  if (!v25)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = v82;
    v49 = v69;
    v48 = v70;
    v51 = v67;
    v50 = v68;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appDeletionManager", buf, 2u);
    }

    v46 = 0;
    goto LABEL_57;
  }
  v85.receiver = self;
  v85.super_class = (Class)SMInitiatorCacheManager;
  v27 = [(SMInitiatorCacheManager *)&v85 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_initiatorContact, a3);
    v28->_initiatorContactStored = a4;
    objc_storeStrong((id *)&v28->_safetyCacheStore, v63);
    objc_storeStrong((id *)&v28->_sessionStore, a6);
    objc_storeStrong((id *)&v28->_defaultsManager, v65);
    objc_storeStrong((id *)&v28->_locationManager, a8);
    objc_storeStrong((id *)&v28->_batteryManager, a10);
    objc_storeStrong((id *)&v28->_queue, a9);
    objc_storeStrong((id *)&v28->_xpcActivityManager, a11);
    objc_storeStrong((id *)&v28->_messagingService, a12);
    objc_storeStrong((id *)&v28->_networkOfInterestManager, a13);
    objc_storeStrong((id *)&v28->_authorizationManager, a14);
    v28->_initiatorEligibility = 0;
    v28->_receiverEligibility = 0;
    objc_storeStrong((id *)&v28->_wristStateManager, a15);
    objc_storeStrong((id *)&v28->_vehicleLocationProvider, a16);
    objc_storeStrong((id *)&v28->_activeSessionDetailsZone, a17);
    objc_storeStrong((id *)&v28->_healthKitManager, a18);
    objc_storeStrong((id *)&v28->_platform, a19);
    objc_storeStrong((id *)&v28->_appDeletionManager, a20);
    v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v57 = [(SMInitiatorContact *)v28->_initiatorContact sessionUUID];
      v58 = (objc_class *)objc_opt_class();
      NSStringFromClass(v58);
      v59 = (char *)objc_claimAutoreleasedReturnValue();
      v60 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v87 = v57;
      __int16 v88 = 2112;
      v89 = v59;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v60;
      _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,created SMInitiatorCacheManager", buf, 0x20u);
    }
    if (!v28->_initiatorContactStored) {
      [(SMInitiatorCacheManager *)v28 _updateInitiatorContactInStore];
    }
    v31 = [(SMInitiatorCacheManager *)v28 initiatorContact];
    v32 = [v31 shouldBeCleanedUpDate];

    if (v32)
    {
      v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(SMInitiatorCacheManager *)v30 sessionUUID];
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v87 = v34;
        __int16 v88 = 2112;
        v89 = v36;
        __int16 v90 = 2112;
        uint64_t v91 = (uint64_t)v37;
        _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,SMInitiatorCacheManager should be cleaned up", buf, 0x20u);
      }
      v38 = [(SMInitiatorCacheManager *)v30 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __344__SMInitiatorCacheManager_initWithInitiatorContact_loadedFromDisk_safetyCacheStore_sessionStore_defaultsManager_locationManager_queue_batteryManager_xpcActivityManager_messagingService_networkOfInterestManager_authorizationManager_wristStateManager_vehicleLocationProvider_activeSessionDetailsZone_healthKitManager_platform_appDeletionManager___block_invoke;
      block[3] = &unk_1E6B90E70;
      v84 = v30;
      dispatch_async(v38, block);
    }
    v39 = [(RTDefaultsManager *)v30->_defaultsManager objectForKey:@"RTDefaultsSMDefaultCacheUpdateBackstopTimeout" value:&unk_1F3453918];
    [v39 doubleValue];
    v30->_double cacheUpdateBackstopTimeout = v40;

    if (v30->_cacheUpdateBackstopTimeout != 900.0)
    {
      v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        double cacheUpdateBackstopTimeout = v30->_cacheUpdateBackstopTimeout;
        *(_DWORD *)buf = 136316162;
        v87 = "-[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsMa"
              "nager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:au"
              "thorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:pla"
              "tform:appDeletionManager:]";
        __int16 v88 = 2080;
        v89 = "overriding cache backstop timeouts";
        __int16 v90 = 2048;
        uint64_t v91 = 0x408C200000000000;
        __int16 v92 = 2048;
        double v93 = cacheUpdateBackstopTimeout;
        __int16 v94 = 2112;
        v95 = @"RTDefaultsSMDefaultCacheUpdateBackstopTimeout";
        _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }
    }
    [(SMInitiatorCacheManager *)v30 _setupActiveSessionZone];
    messagingService = v30->_messagingService;
    v44 = +[RTNotification notificationName];
    [(RTNotifier *)messagingService addObserver:v30 selector:sel_onNearbyEffectivePairedDeviceChangedNotification_ name:v44];

    v28 = v30;
  }
  v45 = v28;
  v46 = v45;
  v47 = v82;
  v49 = v69;
  v48 = v70;
  v51 = v67;
  v50 = v68;
LABEL_58:

  return v46;
}

uint64_t __344__SMInitiatorCacheManager_initWithInitiatorContact_loadedFromDisk_safetyCacheStore_sessionStore_defaultsManager_locationManager_queue_batteryManager_xpcActivityManager_messagingService_networkOfInterestManager_authorizationManager_wristStateManager_vehicleLocationProvider_activeSessionDetailsZone_healthKitManager_platform_appDeletionManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpInitiatorContact];
}

- (SMInitiatorCacheManager)initWithSafetyCacheStore:(id)a3 sessionStore:(id)a4 defaultsManager:(id)a5 locationManager:(id)a6 queue:(id)a7 batteryManager:(id)a8 xpcActivityManager:(id)a9 messagingService:(id)a10 networkOfInterestManager:(id)a11 authorizationManager:(id)a12 sessionID:(id)a13 wristStateManager:(id)a14 vehicleLocationProvider:(id)a15 activeSessionDetailsZone:(id)a16 healthKitManager:(id)a17 platform:(id)a18 appDeletionManager:(id)a19
{
  v33 = (objc_class *)MEMORY[0x1E4F99890];
  id v40 = a19;
  id v39 = a18;
  id v38 = a17;
  id v37 = a16;
  id v36 = a15;
  id v35 = a14;
  id v19 = a13;
  id v20 = a12;
  id v21 = a11;
  id v34 = a10;
  id v43 = a9;
  id v55 = a8;
  id v53 = a7;
  id v51 = a6;
  id v49 = a5;
  id v47 = a4;
  id v45 = a3;
  id v22 = [v33 alloc];
  v23 = objc_opt_new();
  id v24 = +[SMCryptoUtilities createSafetyCacheKey];
  id v25 = +[SMCryptoUtilities createAllowReadToken];
  v26 = objc_opt_new();
  v27 = [v26 UUIDString];
  v28 = objc_opt_new();
  LOBYTE(v32) = 1;
  LOWORD(v31) = 0;
  v29 = objc_msgSend(v22, "initWithIdentifier:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v23, 0, 0, 0, 0, 0, -1.0, -1.0, -1.0,
                  0,
                  0,
                  v19,
                  v24,
                  v25,
                  v27,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  -1,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v31,
                  0,
                  0,
                  v32,
                  0,
                  v28,
                  0,
                  0,
                  0,
                  0);

  v42 = -[SMInitiatorCacheManager initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:](self, "initWithInitiatorContact:loadedFromDisk:safetyCacheStore:sessionStore:defaultsManager:locationManager:queue:batteryManager:xpcActivityManager:messagingService:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:activeSessionDetailsZone:healthKitManager:platform:appDeletionManager:", v29, 0, v45, v47, v49, v51, v53, v55, v43, v34, v21, v20, v35, v36, v37,
          v38,
          v39,
          v40);

  return v42;
}

- (NSUUID)sessionUUID
{
  v2 = [(SMInitiatorCacheManager *)self initiatorContact];
  v3 = [v2 sessionUUID];

  return (NSUUID *)v3;
}

- (BOOL)isActiveDevice
{
  v3 = [(SMInitiatorCacheManager *)self sessionManagerState];
  v4 = [v3 activeDeviceIdentifier];
  v5 = [(SMInitiatorCacheManager *)self messagingService];
  v6 = [v5 deviceIdentifier];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (BOOL)isCellularActivated
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = dispatch_get_global_queue(2, 0);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __46__SMInitiatorCacheManager_isCellularActivated__block_invoke;
  uint64_t v31 = &unk_1E6B979A8;
  v33 = &v34;
  v4 = v2;
  uint64_t v32 = v4;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:v3 handler:&v28];

  v5 = v4;
  v6 = [MEMORY[0x1E4F1C9C8] now:v28, v29, v30, v31];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7)) {
    goto LABEL_6;
  }
  v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  v11 = objc_opt_new();
  v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_950];
  v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  v14 = [v13 filteredArrayUsingPredicate:v12];
  v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: safetyCacheStore", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E4F28C58];
  v43[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v43 count:1];
  id v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

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
  if (v21)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = [v21 description];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v26;
      __int16 v39 = 2080;
      id v40 = "-[SMInitiatorCacheManager isCellularActivated]";
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@,%s,sema error,%@", buf, 0x20u);
    }
  }
  BOOL v23 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(&v34, 8);
  return v23;
}

intptr_t __46__SMInitiatorCacheManager_isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isStandalone
{
  id v3 = objc_alloc(MEMORY[0x1E4F99850]);
  v4 = [(SMInitiatorCacheManager *)self queue];
  v5 = (void *)[v3 initWithQueue:v4];

  LOBYTE(v4) = [v5 isEffectivePairedDeviceNearby] ^ 1;
  return (char)v4;
}

- (void)notifyObserversSafetyCacheDidUpdate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(SMInitiatorCacheManager *)self sessionUUID];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = NSStringFromSelector(a2);
    int v19 = 138412802;
    id v20 = v15;
    __int16 v21 = 2112;
    id v22 = v17;
    __int16 v23 = 2112;
    id v24 = v18;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sending safety cache update to observers", (uint8_t *)&v19, 0x20u);
  }
  v5 = [(SMInitiatorCacheManager *)self delegate];
  v6 = [(SMInitiatorCacheManager *)self sessionUUID];
  dispatch_time_t v7 = [(SMInitiatorCacheManager *)self initiatorContact];
  v8 = [v7 phoneCache];
  double v9 = [(SMInitiatorCacheManager *)self initiatorContact];
  double v10 = [v9 watchCache];
  v11 = [(SMInitiatorCacheManager *)self initiatorContact];
  v12 = [v11 shouldBeCleanedUpDate];
  v13 = [(SMInitiatorCacheManager *)self initiatorContact];
  v14 = [v13 keyReleaseMessageSendDate];
  [v5 cacheManagerDidUpdateCacheForSessionID:v6 phoneCache:v8 watchCache:v10 cacheExpiryDate:v12 cacheReleaseDate:v14];
}

- (void)initializeSessionWithCompletion:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(SMInitiatorCacheManager *)self initializationInProgress])
    {
      v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v44 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        NSStringFromSelector(a2);
        id v47 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2112;
        v87 = v47;
        _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initialization already in progress", buf, 0x20u);
      }
      v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v48 = (objc_class *)objc_opt_class();
        id v49 = NSStringFromClass(v48);
        v50 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_fault_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,initialization already in progress", buf, 0x16u);
      }
      id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v92 = *MEMORY[0x1E4F28568];
      v8 = [NSString stringWithFormat:@"Initialization already in progress"];
      v93[0] = v8;
      double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];
      double v10 = (void *)[v7 initWithDomain:*MEMORY[0x1E4F99A48] code:22 userInfo:v9];

      (*((void (**)(id, void, void, void, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, 0, 0, 0, v10);
    }
    else
    {
      v12 = [(SMInitiatorCacheManager *)self sessionManagerState];
      BOOL v13 = [v12 sessionState] == 10;

      v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [(SMInitiatorCacheManager *)self sessionUUID];
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          NSStringFromSelector(a2);
          int v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2112;
          v87 = v19;
          _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,starting initialization sequence", buf, 0x20u);
        }
        [(SMInitiatorCacheManager *)self setInitializationInProgress:1];
        [(SMInitiatorCacheManager *)self setInitializationWasAborted:0];
        [(SMInitiatorCacheManager *)self setInitializationCompletionCalled:0];
        [(SMInitiatorCacheManager *)self setInitializationCompletion:v4];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v87 = __Block_byref_object_copy__81;
        __int16 v88 = __Block_byref_object_dispose__81;
        id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v58 = *(void **)(*(void *)&buf[8] + 40);
        id v20 = NSNumber;
        __int16 v21 = (void *)MEMORY[0x1E4F99888];
        id v22 = [(SMInitiatorCacheManager *)self sessionManagerState];
        __int16 v23 = [v22 configuration];
        id v24 = [v23 conversation];
        uint64_t v25 = [v24 receiverHandles];
        id v26 = [v25 firstObject];
        v27 = [v26 primaryHandle];
        uint64_t v28 = [v20 numberWithInteger:[v21 getSMHandleTypeWithHandle:v27]];
        [v58 setValue:v28 forKey:@"receiverHandleType"];

        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        v30 = dispatch_group_create();
        v84[0] = 0;
        v84[1] = v84;
        v84[2] = 0x3032000000;
        v84[3] = __Block_byref_object_copy__81;
        v84[4] = __Block_byref_object_dispose__81;
        id v85 = 0;
        v82[0] = 0;
        v82[1] = v82;
        v82[2] = 0x3032000000;
        v82[3] = __Block_byref_object_copy__81;
        v82[4] = __Block_byref_object_dispose__81;
        id v83 = 0;
        objc_initWeak(&location, self);
        dispatch_group_enter(v30);
        CFAbsoluteTime v31 = CFAbsoluteTimeGetCurrent();
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke;
        v75[3] = &unk_1E6B979D0;
        objc_copyWeak(v80, &location);
        v80[1] = *(id *)&v31;
        v80[2] = (id)a2;
        id v77 = buf;
        id v78 = v84;
        id v79 = v82;
        uint64_t v32 = v30;
        id v76 = v32;
        [(SMInitiatorCacheManager *)self _checkInitiatorEligibilityWithCompletion:v75];
        dispatch_group_enter(v32);
        CFAbsoluteTime v33 = CFAbsoluteTimeGetCurrent();
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_178;
        v69[3] = &unk_1E6B979D0;
        objc_copyWeak(v74, &location);
        v74[1] = *(id *)&v33;
        v74[2] = (id)a2;
        v71 = buf;
        id v72 = v82;
        id v73 = v84;
        uint64_t v34 = v32;
        id v70 = v34;
        [(SMInitiatorCacheManager *)self _checkConversationEligibilityWithCompletion:v69];
        dispatch_group_enter(v34);
        CFAbsoluteTime v35 = CFAbsoluteTimeGetCurrent();
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_188;
        v65[3] = &unk_1E6B979F8;
        v65[4] = self;
        objc_copyWeak(v68, &location);
        id v67 = buf;
        v68[1] = *(id *)&v35;
        v68[2] = (id)a2;
        uint64_t v36 = v34;
        v66 = v36;
        [(SMInitiatorCacheManager *)self _setupShareZoneWithCompletion:v65];
        char v37 = [(SMInitiatorCacheManager *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_203;
        block[3] = &unk_1E6B97A20;
        v61 = v36;
        id v38 = v36;
        objc_copyWeak(v64, &location);
        v64[1] = *(id *)&Current;
        v62 = self;
        id v63 = buf;
        v64[2] = (id)a2;
        dispatch_group_notify(v38, v37, block);

        objc_destroyWeak(v64);
        objc_destroyWeak(v68);

        objc_destroyWeak(v74);
        objc_destroyWeak(v80);
        objc_destroyWeak(&location);
        _Block_object_dispose(v82, 8);

        _Block_object_dispose(v84, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v51 = [(SMInitiatorCacheManager *)self sessionUUID];
          v52 = (objc_class *)objc_opt_class();
          id v53 = NSStringFromClass(v52);
          NSStringFromSelector(a2);
          v54 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v51;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v53;
          *(_WORD *)&buf[22] = 2112;
          v87 = v54;
          _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,not in initializing state", buf, 0x20u);
        }
        __int16 v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          id v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          v57 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v57;
          _os_log_fault_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_FAULT, "#SafetyCache,Initiator,%@,%@,not in initializing state", buf, 0x16u);
        }
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v90 = *MEMORY[0x1E4F28568];
        __int16 v41 = [NSString stringWithFormat:@"Not in Initializing state"];
        uint64_t v91 = v41;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v43 = (void *)[v40 initWithDomain:*MEMORY[0x1E4F99A48] code:41 userInfo:v42];

        (*((void (**)(id, void, void, void, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, 0, 0, 0, v43);
      }
    }
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72)];
  [v6 setValue:v7 forKey:@"initiatorCheckDuration"];

  v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  double v9 = [NSNumber numberWithInteger:[WeakRetained initiatorEligibility]];
  [v8 setValue:v9 forKey:@"initiatorEligibility"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:&unk_1F3451398 forKey:@"lastStepToComplete"];
  double v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [WeakRetained sessionUUID];
    v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(*(SEL *)(a1 + 80));
    [WeakRetained initiatorEligibility];
    v15 = initiatorEligiblityStatusToString();
    *(_DWORD *)buf = 138413314;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched initiator eligibility,%@,error,%@", buf, 0x34u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (([WeakRetained initializationCompletionCalled] & 1) == 0
    && [WeakRetained receiverEligibility]
    && (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
     || [WeakRetained initiatorEligibility] != 1
     || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
     || [WeakRetained receiverEligibility] != 1))
  {
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v16 = _SMSafeArray();
    v17 = _SMMultiErrorCreate();

    [WeakRetained setInitializationCompletionCalled:1, v19, 1];
    v18 = [WeakRetained initializationCompletion];
    ((void (**)(void, void, void, void, void, uint64_t, uint64_t, void *))v18)[2](v18, 0, 0, 0, 0, [WeakRetained initiatorEligibility], [WeakRetained receiverEligibility], v17);

    [WeakRetained setInitializationCompletion:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72)];
  [v6 setValue:v7 forKey:@"receiverCheckDuration"];

  v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  double v9 = [NSNumber numberWithInt:[WeakRetained receiverEligibility] == 1];
  [v8 setValue:v9 forKey:@"wasReceiverEligible"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:&unk_1F34513B0 forKey:@"lastStepToComplete"];
  double v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [WeakRetained sessionUUID];
    v12 = (objc_class *)objc_opt_class();
    BOOL v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(*(SEL *)(a1 + 80));
    v15 = [MEMORY[0x1E4F99860] convertEligibilityTypeToString:[WeakRetained receiverEligibility]];
    *(_DWORD *)buf = 138413314;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched receiver eligibility,%@,error,%@", buf, 0x34u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (([WeakRetained initializationCompletionCalled] & 1) == 0
    && [WeakRetained initiatorEligibility]
    && (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
     || [WeakRetained initiatorEligibility] != 1
     || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
     || [WeakRetained receiverEligibility] != 1))
  {
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v16 = _SMSafeArray();
    v17 = _SMMultiErrorCreate();

    [WeakRetained setInitializationCompletionCalled:1, v19, 1];
    v18 = [WeakRetained initializationCompletion];
    [WeakRetained initiatorEligibility:0 receiverEligibility:[WeakRetained receiverEligibility] eligibilityData:v17];

    [WeakRetained setInitializationCompletion:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_188(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_2;
  block[3] = &unk_1E6B97A20;
  objc_copyWeak(v11, (id *)(a1 + 56));
  v11[1] = *(id *)(a1 + 64);
  id v9 = v3;
  v11[2] = *(id *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(v11);
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64)];
  [v3 setValue:v4 forKey:@"zoneSetupDuration"];

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = [NSNumber numberWithInt:*(void *)(a1 + 32) == 0];
  [v5 setValue:v6 forKey:@"wasZoneSetupSuccessful"];

  long long v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v9 = NSString;
    long long v10 = [v7 domain];
    v11 = [v9 stringWithFormat:@"%@:%d", v10, [*(id *)(a1 + 32) code]];
    [v8 setValue:v11 forKey:@"zoneSetupError"];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setValue:&unk_1F34513C8 forKey:@"lastStepToComplete"];
  v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = [WeakRetained sessionUUID];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    id v20 = v13;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    __int16 v24 = v16;
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone setup completed,error,%@", buf, 0x2Au);
  }
  if (([WeakRetained initializationCompletionCalled] & 1) == 0 && *(void *)(a1 + 32))
  {
    [WeakRetained setInitializationCompletionCalled:1];
    v18 = [WeakRetained initializationCompletion];
    v18[2](v18, 0, 0, 0, 0, [WeakRetained initiatorEligibility], [WeakRetained receiverEligibility], *(void *)(a1 + 32));

    [WeakRetained setInitializationCompletion:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__SMInitiatorCacheManager_initializeSessionWithCompletion___block_invoke_203(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setInitializationInProgress:0];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64)];
  [v3 setValue:v4 forKey:@"initializationDuration"];

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = [NSNumber numberWithInt:objc_msgSend(WeakRetained, "initializationCompletionCalled") ^ 1];
  [v5 setValue:v6 forKey:@"initializationResult"];

  long long v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v8 = [NSNumber numberWithBool:[WeakRetained initializationWasAborted]];
  [v7 setValue:v8 forKey:@"wasAborted"];

  id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  long long v10 = [[NSNumber numberWithBool:[*(id *)(a1 + 40) isCellularActivated]];
  [v9 setValue:v10 forKey:@"isCellularActivated"];

  v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v12 = [NSNumber numberWithBool:[*(id *)(a1 + 40) isStandalone]];
  [v11 setValue:v12 forKey:@"isStandalone"];

  BOOL v13 = [*(id *)(a1 + 40) sessionManagerState];
  v14 = [v13 configuration];
  v15 = [v14 conversation];
  v16 = [v15 receiverHandles];
  uint64_t v17 = [v16 count];

  v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v17];
  [v18 setValue:v19 forKey:@"numRecipients"];

  AnalyticsSendEvent();
  id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [WeakRetained sessionUUID];
    __int16 v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    __int16 v24 = NSStringFromSelector(*(SEL *)(a1 + 72));
    if ([WeakRetained initializationCompletionCalled])
    {
      int v25 = [WeakRetained initializationWasAborted];
      uint64_t v26 = @"failed";
      if (v25) {
        uint64_t v26 = @"was aborted";
      }
    }
    else
    {
      uint64_t v26 = @"succeeded";
    }
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    id v40 = v21;
    __int16 v41 = 2112;
    v42 = v23;
    __int16 v43 = 2112;
    v44 = v24;
    __int16 v45 = 2112;
    v46 = v26;
    __int16 v47 = 2112;
    uint64_t v48 = v27;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initialization %@,metric,%@", buf, 0x34u);
  }
  if (([WeakRetained initializationCompletionCalled] & 1) == 0)
  {
    [WeakRetained setInitializationCompletionCalled:1];
    __int16 v28 = [WeakRetained initializationCompletion];
    id v38 = [WeakRetained initiatorContact];
    id v29 = [v38 allowReadToken];
    uint64_t v30 = [WeakRetained initiatorContact];
    CFAbsoluteTime v31 = [v30 safetyCacheKey];
    uint64_t v32 = [WeakRetained initiatorContact];
    CFAbsoluteTime v33 = [v32 scheduleSendMessageGUID];
    uint64_t v34 = [WeakRetained activeSessionZone];
    CFAbsoluteTime v35 = [v34 invitationTokenMap];
    [WeakRetained initiatorEligibility:objc_msgSend(WeakRetained, "receiverEligibility")];

    [WeakRetained setInitializationCompletion:0];
  }
  uint64_t v36 = [WeakRetained initiatorContact];
  char v37 = [v36 shouldBeCleanedUpDate];

  if (v37) {
    [WeakRetained _cleanupActiveSessionZone];
  }
}

- (void)_setupActiveSessionZone
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = [SMSafetyCacheZone alloc];
  id v5 = [(SMInitiatorCacheManager *)self sessionUUID];
  id v6 = [(SMInitiatorCacheManager *)self initiatorContact];
  long long v7 = [v6 allowReadToken];
  v8 = [v7 base64EncodedStringWithOptions:0];
  id v9 = [(SMInitiatorCacheManager *)self defaultsManager];
  long long v10 = [(SMInitiatorCacheManager *)self queue];
  v11 = [(SMSafetyCacheZone *)v4 initWithSessionID:v5 token:v8 defaultsManager:v9 queue:v10];
  [(SMInitiatorCacheManager *)self setActiveSessionZone:v11];

  v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL v13 = [(SMInitiatorCacheManager *)self sessionUUID];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    uint64_t v17 = [(SMInitiatorCacheManager *)self activeSessionZone];
    int v18 = 138413058;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    __int16 v21 = v15;
    __int16 v22 = 2112;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    int v25 = v17;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Setting up share zone,%@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)_setupFetchOnZoneUpdates
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMInitiatorCacheManager *)self activeSessionZone];

  if (!v4)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v18 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      __int16 v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      int v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No zone to setup", buf, 0x20u);
    }
    goto LABEL_5;
  }
  id v5 = [(SMInitiatorCacheManager *)self activeSessionZone];
  id v6 = [v5 zoneUpdateHandler];

  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(SMInitiatorCacheManager *)self sessionUUID];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      int v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetch already active", buf, 0x20u);
    }
LABEL_5:

    return;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(SMInitiatorCacheManager *)self sessionUUID];
    long long v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    int v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Registering for zone updates", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  BOOL v13 = [(SMInitiatorCacheManager *)self activeSessionZone];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke;
  v22[3] = &unk_1E6B97A70;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  [v13 registerForZoneUpdatesWithHandler:v22];

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

void __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained sessionUUID];
    long long v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138413058;
    int v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Received zone update,%@", buf, 0x2Au);
  }
  long long v10 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  v11 = [WeakRetained activeSessionZone];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke_236;
  v14[3] = &unk_1E6B97A48;
  objc_copyWeak(v16, (id *)(a1 + 32));
  id v12 = WeakRetained;
  BOOL v13 = *(void **)(a1 + 40);
  id v15 = v12;
  v16[1] = v13;
  [v11 fetchSafetyCacheRecordsWithQos:v10 completion:v14];

  objc_destroyWeak(v16);
}

void __51__SMInitiatorCacheManager__setupFetchOnZoneUpdates__block_invoke_236(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [WeakRetained sessionUUID];
    id v9 = (objc_class *)objc_opt_class();
    long long v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v16 = 138413058;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetchSafetyCacheRecordsWithQos,error,%@", (uint8_t *)&v16, 0x2Au);
  }
  if (a2)
  {
    id v12 = [WeakRetained activeSessionZone];
    BOOL v13 = [v12 phoneSafetyCache];
    v14 = [WeakRetained activeSessionZone];
    id v15 = [v14 watchSafetyCache];
    [WeakRetained decryptAndStoreSafetyCacheDataWithPhoneCacheData:v13 watchCacheData:v15 metricsDict:0];
  }
}

- (void)_teardownFetchOnZoneUpdates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMInitiatorCacheManager *)self activeSessionZone];
  id v5 = [v4 zoneUpdateHandler];

  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  long long v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v9 = (objc_class *)objc_opt_class();
      long long v10 = NSStringFromClass(v9);
      v11 = NSStringFromSelector(a2);
      int v16 = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Deregistering for zone updates", (uint8_t *)&v16, 0x20u);
    }
    long long v7 = [(SMInitiatorCacheManager *)self activeSessionZone];
    [v7 deregisterForZoneUpdates];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(SMInitiatorCacheManager *)self sessionUUID];
    BOOL v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    int v16 = 138412802;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v14;
    __int16 v20 = 2112;
    __int16 v21 = v15;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,No fetch in progress to deregister", (uint8_t *)&v16, 0x20u);
  }
}

- (void)_setupShareZoneWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_initWeak(location, self);
    id v6 = [SMCloudKitQosOptions alloc];
    long long v7 = [(SMCloudKitQosOptions *)v6 initWithDefaultQos:1 masqueradeBundleID:*MEMORY[0x1E4F99AA8] xpcActivity:0];
    v8 = [(SMInitiatorCacheManager *)self activeSessionZone];
    id v9 = [(SMInitiatorCacheManager *)self sessionManagerState];
    long long v10 = [v9 configuration];
    v11 = [v10 conversation];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke;
    v15[3] = &unk_1E6B97AC0;
    objc_copyWeak(v18, location);
    id v12 = v5;
    v18[1] = (id)a2;
    id v17 = v12;
    v15[4] = self;
    BOOL v13 = v7;
    int v16 = v13;
    [v8 setupZoneAndShareWithConversation:v11 qos:v13 completion:v15];

    objc_destroyWeak(v18);
    objc_destroyWeak(location);
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }
  }
}

void __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = [WeakRetained sessionUUID];
      __int16 v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)__int16 v28 = 138413314;
      *(void *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2112;
      *(void *)&v28[14] = v21;
      *(_WORD *)&v28[22] = 2112;
      os_signpost_id_t v29 = (os_signpost_id_t)v22;
      __int16 v30 = 1024;
      int v31 = a2;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,success,%d,error,%@", v28, 0x30u);
    }
    if (a2)
    {
      *(void *)__int16 v28 = 0;
      *(void *)&v28[8] = v28;
      *(void *)&v28[16] = 0x2020000000;
      os_signpost_id_t v29 = 0;
      v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      os_signpost_id_t v9 = os_signpost_id_generate(v8);

      os_signpost_id_t v29 = v9;
      long long v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v11 = v10;
      os_signpost_id_t v12 = *(void *)(*(void *)&v28[8] + 24);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SMInitializationSequenceSetupZoneAndShareSubscribeToZoneChanges", " enableTelemetry=YES ", buf, 2u);
      }

      BOOL v13 = [*(id *)(a1 + 32) activeSessionZone];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      id v23[2] = __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke_241;
      v23[3] = &unk_1E6B97A98;
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v25 = v28;
      v23[4] = v14;
      uint64_t v26 = *(void *)(a1 + 64);
      id v24 = *(id *)(a1 + 48);
      [v13 subscribeToZoneChangesInPrivateDatabaseWithQoS:v15 completion:v23];

      _Block_object_dispose(v28, 8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = @"SMInitiatorCacheManger was destroyed before zone setup";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    __int16 v18 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F99A48] code:24 userInfo:v17];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __57__SMInitiatorCacheManager__setupShareZoneWithCompletion___block_invoke_241(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    unint64_t v9 = a2;
    id v10 = [v5 domain];
    int v20 = 134349570;
    unint64_t v21 = v9;
    __int16 v22 = 2082;
    uint64_t v23 = [v10 UTF8String];
    __int16 v24 = 2050;
    uint64_t v25 = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMInitializationSequenceSetupZoneAndShareSubscribeToZoneChanges", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v20, 0x20u);
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v12 = [*(id *)(a1 + 32) activeSessionZone];
    BOOL v13 = [v12 zoneID];
    uint64_t v14 = [v13 zoneName];
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    __int16 v18 = [*(id *)(a1 + 32) activeSessionZone];
    __int16 v19 = [v18 zoneID];
    int v20 = 138413314;
    unint64_t v21 = (unint64_t)v14;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v16;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v17;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, subscribed to zone changes for zoneID %@, with error %@", (uint8_t *)&v20, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 metricsDict:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  v62 = v8;
  if (v8)
  {
    if (v12)
    {
      BOOL v13 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v13;
      __int16 v67 = 2112;
      id v68 = v15;
      __int16 v69 = 2112;
      id v70 = v16;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,decrypting phone safety cache data", buf, 0x20u);
    }
    id v17 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v18 = [v17 safetyCacheKey];
    __int16 v19 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v64 = 0;
    uint64_t v20 = +[SMCryptoUtilities decryptSafetyCache:v62 key:v18 sessionID:v19 role:@"Initiator" device:1 metricsDict:a5 hashString:&v64];
    id v21 = v64;

    if (v20)
    {
      __int16 v22 = [(SMInitiatorCacheManager *)self sessionUUID];
      [(id)v20 logCacheForSessionID:v22 role:@"Initiator" deviceType:@"phone" transaction:v10 hashString:v21];
    }
    else
    {
      __int16 v28 = (void *)MEMORY[0x1E4F99818];
      __int16 v22 = [(SMInitiatorCacheManager *)self sessionUUID];
      [v28 logNoCacheDataForSessionID:v22 role:@"Initiator" deviceType:@"phone" transaction:v10];
    }
  }
  else
  {
    if (v12)
    {
      uint64_t v23 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      __int16 v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v23;
      __int16 v67 = 2112;
      id v68 = v25;
      __int16 v69 = 2112;
      id v70 = v26;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no phone safety cache data", buf, 0x20u);
    }
    uint64_t v27 = (void *)MEMORY[0x1E4F99818];
    id v21 = [(SMInitiatorCacheManager *)self sessionUUID];
    [v27 logNoCacheDataForSessionID:v21 role:@"Initiator" deviceType:@"phone" transaction:v10];
    uint64_t v20 = 0;
  }

  id v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v30)
    {
      int v31 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v32 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v32);
      uint64_t v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v31;
      __int16 v67 = 2112;
      id v68 = v33;
      __int16 v69 = 2112;
      id v70 = v34;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,decrypting watch safety cache data", buf, 0x20u);
    }
    CFAbsoluteTime v35 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v36 = [v35 safetyCacheKey];
    char v37 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v63 = 0;
    uint64_t v38 = +[SMCryptoUtilities decryptSafetyCache:v9 key:v36 sessionID:v37 role:@"Initiator" device:2 metricsDict:a5 hashString:&v63];
    id v39 = v63;

    if (v38)
    {
      id v40 = [(SMInitiatorCacheManager *)self sessionUUID];
      [(id)v38 logCacheForSessionID:v40 role:@"Initiator" deviceType:@"watch" transaction:v10 hashString:v39];
    }
    else
    {
      v46 = (void *)MEMORY[0x1E4F99818];
      id v40 = [(SMInitiatorCacheManager *)self sessionUUID];
      [v46 logNoCacheDataForSessionID:v40 role:@"Initiator" deviceType:@"watch" transaction:v10];
    }
  }
  else
  {
    if (v30)
    {
      __int16 v41 = [(SMInitiatorCacheManager *)self sessionUUID];
      v42 = (objc_class *)objc_opt_class();
      __int16 v43 = NSStringFromClass(v42);
      v44 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v41;
      __int16 v67 = 2112;
      id v68 = v43;
      __int16 v69 = 2112;
      id v70 = v44;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no watch safety cache data", buf, 0x20u);
    }
    if (a5) {
      [*a5 setValue:&unk_1F3451398 forKey:@"watchCacheDecryptionResult"];
    }
    __int16 v45 = (void *)MEMORY[0x1E4F99818];
    id v39 = [(SMInitiatorCacheManager *)self sessionUUID];
    [v45 logNoCacheDataForSessionID:v39 role:@"Initiator" deviceType:@"watch" transaction:v10];
    uint64_t v38 = 0;
  }

  __int16 v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v48 = v47;
  if (v20 | v38)
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v49 = [(SMInitiatorCacheManager *)self sessionUUID];
      v50 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v50);
      v52 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      v66 = v49;
      __int16 v67 = 2112;
      id v68 = v51;
      __int16 v69 = 2112;
      id v70 = v52;
      __int16 v71 = 2112;
      uint64_t v72 = v20;
      __int16 v73 = 2112;
      uint64_t v74 = v38;
      _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully decrypted safety cache data for,phone,%@,watch,%@", buf, 0x34u);
    }
    id v53 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v53 setPhoneCache:v20];

    v54 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v54 setWatchCache:v38];

    id v55 = [MEMORY[0x1E4F1C9C8] now];
    v56 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v56 setSyncDate:v55];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
  }
  else
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v57 = [(SMInitiatorCacheManager *)self sessionUUID];
      v58 = (objc_class *)objc_opt_class();
      v59 = NSStringFromClass(v58);
      v60 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v57;
      __int16 v67 = 2112;
      id v68 = v59;
      __int16 v69 = 2112;
      id v70 = v60;
      _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no safety cache data present", buf, 0x20u);
    }
  }
}

- (void)_checkInitiatorEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = NSString;
    id v6 = [(SMInitiatorCacheManager *)self sessionUUID];
    long long v7 = [v5 stringWithFormat:@"com.apple.SafetyMonitor.InitiatorEligibility.%@", v6];

    id v8 = v7;
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    [(SMInitiatorCacheManager *)self setInitiatorEligibilityQueue:v9];

    objc_initWeak(location, self);
    id v16 = [(SMInitiatorCacheManager *)self initiatorEligibilityQueue];
    id v10 = [(SMInitiatorCacheManager *)self authorizationManager];
    v11 = [(SMInitiatorCacheManager *)self messagingService];
    BOOL v12 = [v11 effectivePairedDevice];
    BOOL v13 = [(SMInitiatorCacheManager *)self defaultsManager];
    uint64_t v14 = [(SMInitiatorCacheManager *)self platform];
    uint64_t v15 = [(SMInitiatorCacheManager *)self appDeletionManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke;
    v17[3] = &unk_1E6B97AE8;
    objc_copyWeak(&v19, location);
    id v18 = v4;
    +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:v16 authorizationManager:v10 effectivePairedDevice:v12 isHandoff:0 defaultsManager:v13 platform:v14 appDeletionManager:v15 handler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }
  }
}

void __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke_2;
    block[3] = &unk_1E6B927F8;
    id v14 = v7;
    uint64_t v17 = a2;
    id v16 = *(id *)(a1 + 32);
    id v15 = v5;
    dispatch_async(v8, block);

    dispatch_queue_t v9 = v14;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F99A48];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"SMInitiatorCacheManger was destroyed before eligibility check";
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    dispatch_queue_t v9 = (void *)[v10 initWithDomain:v11 code:24 userInfo:v12];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __68__SMInitiatorCacheManager__checkInitiatorEligibilityWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitiatorEligibilityQueue:0];
  [*(id *)(a1 + 32) setInitiatorEligibility:*(void *)(a1 + 56)];
  dispatch_semaphore_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_checkConversationEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    id v5 = objc_alloc(MEMORY[0x1E4F99860]);
    id v6 = [(SMInitiatorCacheManager *)self queue];
    long long v7 = (void *)[v5 initWithQueue:v6];

    id v8 = [(SMInitiatorCacheManager *)self sessionManagerState];
    dispatch_queue_t v9 = [v8 configuration];
    id v10 = [v9 conversation];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__SMInitiatorCacheManager__checkConversationEligibilityWithCompletion___block_invoke;
    v13[3] = &unk_1E6B97B10;
    id v11 = v7;
    id v14 = v11;
    objc_copyWeak(&v16, location);
    id v15 = v4;
    [v11 checkConversationEligibility:v10 handler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)location, 2u);
    }
  }
}

void __71__SMInitiatorCacheManager__checkConversationEligibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setReceiverEligibility:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = *MEMORY[0x1E4F99A48];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"SMInitiatorCacheManger was destroyed before eligibility check";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v11 = (void *)[v8 initWithDomain:v9 code:24 userInfo:v10];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v127 = v4;
    group = dispatch_group_create();
    long long v7 = [(SMInitiatorCacheManager *)self sessionManagerState];
    [(SMInitiatorCacheManager *)self setSessionManagerState:v6];
    id v8 = [v7 configuration];
    uint64_t v9 = [v8 conversation];

    id v10 = [v6 configuration];
    id v11 = [v10 conversation];

    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = v125 = v9;
      id v16 = NSStringFromSelector(a2);
      [MEMORY[0x1E4F99950] convertSessionStateToString:[v7 sessionState]];
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v6 sessionState]];
      *(_DWORD *)buf = 138413570;
      v145 = v13;
      __int16 v146 = 2112;
      v147 = v15;
      __int16 v148 = 2112;
      v149 = v16;
      __int16 v150 = 2112;
      v151 = v17;
      __int16 v152 = 2112;
      v153 = v18;
      __int16 v154 = 1024;
      BOOL v155 = v7 == 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,from: %@ to: %@ onBoot: %d", buf, 0x3Au);

      uint64_t v9 = v125;
    }

    id v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v20 = [v19 earliestActiveDeviceIdentifier];
    id v21 = v20;
    if (!v20)
    {
      id v21 = [v6 activeDeviceIdentifier];
    }
    __int16 v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v22 setEarliestActiveDeviceIdentifier:v21];

    if (!v20) {
    uint64_t v23 = [v6 activeDeviceIdentifier];
    }
    __int16 v24 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v24 setLatestActiveDeviceIdentifier:v23];

    if (v127)
    {
      if ([v7 sessionState] == 11 && objc_msgSend(v6, "sessionState") == 2)
      {
        uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = [(SMInitiatorCacheManager *)self sessionUUID];
          uint64_t v27 = (objc_class *)objc_opt_class();
          __int16 v28 = NSStringFromClass(v27);
          id v29 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v145 = v26;
          __int16 v146 = 2112;
          v147 = v28;
          __int16 v148 = 2112;
          v149 = v29;
          _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session started", buf, 0x20u);
        }
        BOOL v30 = v11;

        if ([(SMInitiatorCacheManager *)self _shouldPerformFirstCacheUpdateCKOperation])
        {
          int v31 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
          __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
          id v33 = [(SMInitiatorCacheManager *)self sessionUUID];
          os_signpost_id_t v34 = os_signpost_id_make_with_pointer(v32, v33);

          CFAbsoluteTime v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
          uint64_t v36 = v35;
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "SMSessionCacheUploadWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
          }

          v140[0] = MEMORY[0x1E4F143A8];
          v140[1] = 3221225472;
          v140[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke;
          v140[3] = &unk_1E6B90D80;
          v140[4] = self;
          v140[5] = v34;
          v140[6] = a2;
          [(SMInitiatorCacheManager *)self _writeActiveSessionDetails:10 qos:v31 completion:v140];
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          int v31 = (SMCloudKitQosOptions *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_INFO))
          {
            v54 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            v57 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            v145 = v54;
            __int16 v146 = 2112;
            v147 = v56;
            __int16 v148 = 2112;
            v149 = v57;
            __int16 v150 = 2112;
            v151 = @"NO";
            _os_log_impl(&dword_1D9BFA000, &v31->super, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@, Active Session Details write to CK was skipped because session should soon handoff, shouldWriteActiveSessionDetails, %@", buf, 0x2Au);
          }
        }

        v58 = [(SMInitiatorCacheManager *)self sessionManagerState];
        v59 = [v58 configuration];
        uint64_t v60 = [v59 sessionType];

        id v11 = v30;
        if (v60 == 4)
        {
          v61 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            v119 = [(SMInitiatorCacheManager *)self sessionUUID];
            v120 = (objc_class *)objc_opt_class();
            v121 = NSStringFromClass(v120);
            v122 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v119;
            __int16 v146 = 2112;
            v147 = v121;
            __int16 v148 = 2112;
            v149 = v122;
            _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching current workout snapshot", buf, 0x20u);
          }
          v62 = [(SMInitiatorCacheManager *)self healthKitManager];
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_270;
          v139[3] = &unk_1E6B97B38;
          v139[4] = self;
          v139[5] = a2;
          [v62 fetchCurrentWorkoutSnapshotWithHandler:v139];
        }
      }
      else if (([v7 sessionState] == 2 {
              || [v7 sessionState] == 9
      }
              || [v7 sessionState] == 7
              || [v7 sessionState] == 14)
             && [v6 sessionState] == 4)
      {
        uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = [(SMInitiatorCacheManager *)self sessionUUID];
          id v40 = (objc_class *)objc_opt_class();
          __int16 v41 = NSStringFromClass(v40);
          v42 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v145 = v39;
          __int16 v146 = 2112;
          v147 = v41;
          __int16 v148 = 2112;
          v149 = v42;
          _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache released", buf, 0x20u);
        }
        [(SMInitiatorCacheManager *)self _transitionToCacheReleaseStateForIsSecondarySOSTrigger:0];
      }
      else if (v7 {
             && ([v7 isEndSessionState] & 1) == 0
      }
             && [v6 isEndSessionState])
      {
        if ([v7 isActiveState])
        {
          __int16 v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [(SMInitiatorCacheManager *)self sessionUUID];
            __int16 v45 = (objc_class *)objc_opt_class();
            v46 = NSStringFromClass(v45);
            __int16 v47 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v44;
            __int16 v146 = 2112;
            v147 = v46;
            __int16 v148 = 2112;
            v149 = v47;
            _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session has ended", buf, 0x20u);
          }
          [(SMInitiatorCacheManager *)self _deleteActiveSessionDetails:2];
          [(SMInitiatorCacheManager *)self submitCAMetricInitiatorSession];
          [(SMInitiatorCacheManager *)self submitPowerTelemetryMetricForEvent:2];
        }
        else if ([(SMInitiatorCacheManager *)self initializationInProgress] {
               && ![(SMInitiatorCacheManager *)self initializationCompletionCalled])
        }
        {
          v107 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            v108 = [(SMInitiatorCacheManager *)self sessionUUID];
            v109 = (objc_class *)objc_opt_class();
            v110 = NSStringFromClass(v109);
            v111 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v108;
            __int16 v146 = 2112;
            v147 = v110;
            __int16 v148 = 2112;
            v149 = v111;
            _os_log_impl(&dword_1D9BFA000, v107, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session was aborted during initialization", buf, 0x20u);
          }
          [(SMInitiatorCacheManager *)self setInitializationCompletionCalled:1];
          [(SMInitiatorCacheManager *)self setInitializationWasAborted:1];
          id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v113 = *MEMORY[0x1E4F99A48];
          uint64_t v142 = *MEMORY[0x1E4F28568];
          v114 = [NSString stringWithFormat:@"Initialization was canceled"];
          v143 = v114;
          v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          v116 = (void *)[v112 initWithDomain:v113 code:24 userInfo:v115];

          v117 = [(SMInitiatorCacheManager *)self initializationCompletion];
          ((void (**)(void, void, void, void, void, void, void, void *))v117)[2](v117, 0, 0, 0, 0, 0, 0, v116);

          [(SMInitiatorCacheManager *)self setInitializationCompletion:0];
        }
        else
        {
          uint64_t v96 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            v97 = [(SMInitiatorCacheManager *)self sessionUUID];
            v98 = (objc_class *)objc_opt_class();
            v99 = NSStringFromClass(v98);
            v100 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v97;
            __int16 v146 = 2112;
            v147 = v99;
            __int16 v148 = 2112;
            v149 = v100;
            _os_log_impl(&dword_1D9BFA000, v96, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session was aborted", buf, 0x20u);
          }
        }
        [(SMInitiatorCacheManager *)self _transitionToNotActiveState:1];
      }
      else
      {
        uint64_t v48 = [v7 sessionState];
        if (v48 != [v6 sessionState]
          || ([v6 isEndSessionState] & 1) != 0
          || +[SMMessagingUtilities handlesInConversation1:v11 canonicallyEqualsHandlesInConversation2:v9])
        {
          uint64_t v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v51 = (objc_class *)objc_opt_class();
            v52 = NSStringFromClass(v51);
            id v53 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v50;
            __int16 v146 = 2112;
            v147 = v52;
            __int16 v148 = 2112;
            v149 = v53;
            _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,noop", buf, 0x20u);
          }
        }
        else
        {
          v124 = v11;
          v126 = v9;
          id v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            id v64 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v65 = (objc_class *)objc_opt_class();
            v66 = NSStringFromClass(v65);
            __int16 v67 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v145 = v64;
            __int16 v146 = 2112;
            v147 = v66;
            __int16 v148 = 2112;
            v149 = v67;
            _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self state transition with change in conversation handles", buf, 0x20u);
          }
          id v68 = (void *)MEMORY[0x1E4F1CA80];
          v128 = v7;
          __int16 v69 = [v7 configuration];
          id v70 = [v69 conversation];
          __int16 v71 = [v70 receiverPrimaryHandles];
          uint64_t v72 = [v68 setWithArray:v71];

          __int16 v73 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v74 = [v6 configuration];
          uint64_t v75 = [v74 conversation];
          id v76 = [v75 receiverPrimaryHandles];
          uint64_t v77 = [v73 setWithArray:v76];

          v123 = (void *)v77;
          [v72 minusSet:v77];
          id v78 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v72 count]];
          long long v135 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v79 = v72;
          uint64_t v80 = [v79 countByEnumeratingWithState:&v135 objects:v141 count:16];
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = *(void *)v136;
            uint64_t v83 = MEMORY[0x1E4F1CBF0];
            do
            {
              for (uint64_t i = 0; i != v81; ++i)
              {
                if (*(void *)v136 != v82) {
                  objc_enumerationMutation(v79);
                }
                id v85 = (void *)[objc_alloc(MEMORY[0x1E4F99888]) initWithPrimaryHandle:*(void *)(*((void *)&v135 + 1) + 8 * i) secondaryHandles:v83];
                [v78 addObject:v85];
              }
              uint64_t v81 = [v79 countByEnumeratingWithState:&v135 objects:v141 count:16];
            }
            while (v81);
          }

          id v86 = objc_alloc(MEMORY[0x1E4F99838]);
          v87 = (void *)[v78 copy];
          __int16 v88 = (void *)[v86 initWithReceiverHandles:v87 identifier:0 displayName:0];

          LODWORD(v86) = [(SMInitiatorCacheManager *)self _isKeyReleaseScheduled];
          id v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
          if (v86)
          {
            uint64_t v9 = v126;
            if (v90)
            {
              uint64_t v91 = [(SMInitiatorCacheManager *)self sessionUUID];
              uint64_t v92 = (objc_class *)objc_opt_class();
              double v93 = NSStringFromClass(v92);
              __int16 v94 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v145 = v91;
              __int16 v146 = 2112;
              v147 = v93;
              __int16 v148 = 2112;
              v149 = v94;
              _os_log_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,rescheduling key release with new recipients", buf, 0x20u);
            }
            [(SMInitiatorCacheManager *)self _cancelScheduledKeyReleaseForConversation:v88];
            id v95 = [(SMInitiatorCacheManager *)self _scheduleKeyReleaseWithCompletion:&__block_literal_global_66];
          }
          else
          {
            uint64_t v9 = v126;
            if (v90)
            {
              v101 = [(SMInitiatorCacheManager *)self sessionUUID];
              v102 = (objc_class *)objc_opt_class();
              v103 = NSStringFromClass(v102);
              v104 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v145 = v101;
              __int16 v146 = 2112;
              v147 = v103;
              __int16 v148 = 2112;
              v149 = v104;
              _os_log_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no key release was scheduled to begin with", buf, 0x20u);
            }
          }
          dispatch_group_enter(group);
          v105 = [(SMInitiatorCacheManager *)self activeSessionZone];
          v106 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_280;
          v132[3] = &unk_1E6B97B60;
          v132[4] = self;
          SEL v134 = a2;
          v133 = group;
          [v105 removeShareParticipantsInConversation:v88 qos:v106 withCompletion:v132];

          long long v7 = v128;
          id v11 = v124;
        }
      }
    }
    else if (v7 {
           && ([v7 isEndSessionState] & 1) == 0
    }
           && [v6 isEndSessionState])
    {
      [(SMInitiatorCacheManager *)self _transitionToNotActiveState:0];
      [(SMInitiatorCacheManager *)self submitCAMetricInitiatorSession];
    }
    v118 = [(SMInitiatorCacheManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_282;
    block[3] = &unk_1E6B90E70;
    void block[4] = self;
    char v37 = group;
    dispatch_group_notify(group, v118, block);

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
  }
  else
  {
    char v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newState", buf, 2u);
    }
  }
}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  long long v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 40);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMSessionCacheUploadWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = [*(id *)(a1 + 32) sessionUUID];
      uint64_t v12 = (objc_class *)objc_opt_class();
      BOOL v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138412802;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored, calling _transitionToActiveState", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 32) _transitionToActiveState];
    [*(id *)(a1 + 32) submitPowerTelemetryMetricForEvent:1];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = [*(id *)(a1 + 32) sessionUUID];
      id v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138413058;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_2;
  v12[3] = &unk_1E6B917F0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  uint64_t v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 40) sessionUUID];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,error with current workout snapshot fetch %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 40) sessionUUID];
      id v6 = (objc_class *)objc_opt_class();
      long long v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 48);
      int v15 = 138413058;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched current workout snapshot, %@", (uint8_t *)&v15, 0x2Au);
    }
    [*(id *)(a1 + 40) _onHealthKitManagerWorkoutSnapshotUpdate:*(void *)(a1 + 48)];
  }
}

void __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(a1 + 32) sessionUUID];
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = [v5 participants];
    int v18 = 138413058;
    __int16 v19 = v8;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,remaining participants,%@", (uint8_t *)&v18, 0x2Au);
  }
  if (v6)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [*(id *)(a1 + 32) sessionUUID];
      int v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v18 = 138413314;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to remove participants from share,%@,error,%@", (uint8_t *)&v18, 0x34u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __65__SMInitiatorCacheManager_onSessionStateChanged_forActiveDevice___block_invoke_282(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateAndManagePeriodicCacheUpdate];
}

- (void)onSecondarySOSTriggerWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newState", (uint8_t *)&v25, 2u);
    }
    goto LABEL_14;
  }
  if (!a4)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    __int16 v17 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v24 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v24);
    __int16 v20 = NSStringFromSelector(a2);
    int v25 = 138413058;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    BOOL v30 = v20;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    __int16 v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@";
    __int16 v22 = v16;
    uint32_t v23 = 42;
LABEL_13:
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, v23);

    goto LABEL_14;
  }
  if ([v7 sessionState] == 4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F99968];
    id v10 = [v8 monitorContext];
    LODWORD(v9) = [v9 isSOSTriggerCategory:[v10 triggerCategory]];

    if (v9)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        int v15 = NSStringFromSelector(a2);
        int v25 = 138412802;
        __int16 v26 = v12;
        __int16 v27 = 2112;
        uint64_t v28 = v14;
        __int16 v29 = 2112;
        BOOL v30 = v15;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,secondary SOS trigger received", (uint8_t *)&v25, 0x20u);
      }
      [(SMInitiatorCacheManager *)self _transitionToCacheReleaseStateForIsSecondarySOSTrigger:1];
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v17 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      __int16 v20 = NSStringFromSelector(a2);
      int v25 = 138412802;
      __int16 v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      BOOL v30 = v20;
      __int16 v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache released for secondary SOS Trigger";
      __int16 v22 = v16;
      uint32_t v23 = 32;
      goto LABEL_13;
    }
  }
LABEL_15:
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      id v13 = [MEMORY[0x1E4F99950] convertSessionStateToString:[v7 sessionState]];
      int v32 = 138413058;
      uint64_t v33 = v9;
      __int16 v34 = 2112;
      CFAbsoluteTime v35 = v11;
      __int16 v36 = 2112;
      char v37 = v12;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,resuming state: %@", (uint8_t *)&v32, 0x2Au);
    }
    [(SMInitiatorCacheManager *)self setSessionManagerState:v7];
    [(SMInitiatorCacheManager *)self _evaluateAndManagePeriodicCacheUpdate];
    if (a4)
    {
      [(SMInitiatorCacheManager *)self _updateScheduledSendFireTimer];
      uint64_t v14 = [(SMInitiatorCacheManager *)self sessionManagerState];
      int v15 = [v14 isActiveState];

      if (v15)
      {
        [(SMInitiatorCacheManager *)self _transitionToActiveState];
        uint64_t v16 = [(SMInitiatorCacheManager *)self sessionManagerState];
        if ([v16 sessionState] == 4)
        {
          __int16 v17 = [(SMInitiatorCacheManager *)self initiatorContact];
          int v18 = [v17 keyReleaseMessageSendDate];

          if (!v18) {
            [(SMInitiatorCacheManager *)self _sendKeyReleaseMessageForIsSecondarySOSTrigger:0];
          }
        }
        else
        {
        }
        goto LABEL_16;
      }
      __int16 v29 = [(SMInitiatorCacheManager *)self sessionManagerState];
      int v30 = [v29 isEndSessionState];

      if (v30)
      {
        [(SMInitiatorCacheManager *)self _transitionToNotActiveState:1];
        goto LABEL_16;
      }
      __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v31 = (objc_class *)objc_opt_class();
        uint32_t v23 = NSStringFromClass(v31);
        __int16 v24 = NSStringFromSelector(a2);
        int v32 = 138412802;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        CFAbsoluteTime v35 = v23;
        __int16 v36 = 2112;
        char v37 = v24;
        int v25 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,noop";
        __int16 v26 = v20;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
        uint32_t v28 = 32;
        goto LABEL_14;
      }
    }
    else
    {
      __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v22 = (objc_class *)objc_opt_class();
        uint32_t v23 = NSStringFromClass(v22);
        __int16 v24 = NSStringFromSelector(a2);
        int v32 = 138413058;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        CFAbsoluteTime v35 = v23;
        __int16 v36 = 2112;
        char v37 = v24;
        __int16 v38 = 2112;
        id v39 = v7;
        int v25 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,not active device transition state, %@";
        __int16 v26 = v20;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        uint32_t v28 = 42;
LABEL_14:
        _os_log_impl(&dword_1D9BFA000, v26, v27, v25, (uint8_t *)&v32, v28);
      }
    }

    goto LABEL_16;
  }
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v32) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", (uint8_t *)&v32, 2u);
  }

LABEL_16:
}

- (void)onBecomingActiveDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isActiveState])
  {
    [(SMInitiatorCacheManager *)self setSessionManagerState:v5];
    id v6 = [v5 safetyCacheKey];
    id v7 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v7 setSafetyCacheKey:v6];

    uint64_t v8 = [v5 allowReadToken];
    uint64_t v9 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v9 setAllowReadToken:v8];

    id v10 = [v5 scheduledSendMessageDate];
    id v11 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v11 setScheduledSendExpiryDate:v10];

    uint64_t v12 = [v5 scheduledSendMessageGUID];
    id v13 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v13 setScheduleSendMessageGUID:v12];

    uint64_t v14 = [v5 configuration];
    int v15 = [v14 destination];
    uint64_t v16 = [v15 destinationMapItem];
    __int16 v17 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v17 setDestinationMapItem:v16];

    int v18 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v19 = [v18 sessionState];

    if (v19 == 4)
    {
      __int16 v20 = [v5 sessionStateTransitionDate];
      __int16 v21 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v21 setKeyReleaseMessageSendDate:v20];
    }
    __int16 v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v22 setNumberOfHandoffBecomingActive:[v22 numberOfHandoffBecomingActive] + 1];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    uint32_t v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v25 = (objc_class *)objc_opt_class();
      __int16 v26 = NSStringFromClass(v25);
      os_log_type_t v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      int v30 = v24;
      __int16 v31 = 2112;
      int v32 = v26;
      __int16 v33 = 2112;
      __int16 v34 = v27;
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,becoming active %@", buf, 0x2Au);
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__SMInitiatorCacheManager_onBecomingActiveDevice___block_invoke;
    v28[3] = &unk_1E6B91248;
    v28[4] = self;
    v28[5] = a2;
    [(SMInitiatorCacheManager *)self _periodicCacheUpdateWithCompletion:v28];
  }
  [(SMInitiatorCacheManager *)self _evaluateAndManagePeriodicCacheUpdate];
}

void __50__SMInitiatorCacheManager_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sessionUUID];
    BOOL v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);
  }
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  [(SMInitiatorCacheManager *)self _evaluateAndManagePeriodicCacheUpdate];
  BOOL v4 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v4 setNumberOfHandoffBecomingNonActive:[v4 numberOfHandoffBecomingNonActive] + 1];

  [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
}

- (void)cleanupNonActiveSession
{
  id v3 = [(SMInitiatorCacheManager *)self initiatorContact];
  BOOL v4 = [v3 shouldBeCleanedUpDate];

  if (!v4)
  {
    BOOL v5 = [(SMInitiatorCacheManager *)self isActiveDevice];
    [(SMInitiatorCacheManager *)self _transitionToNotActiveState:v5];
  }
}

- (void)_transitionToActiveState
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    __int16 v9 = (void *)MEMORY[0x1E4F99918];
    id v10 = [(SMInitiatorCacheManager *)self sessionManagerState];
    __int16 v11 = [v10 configuration];
    uint64_t v12 = [v9 sessionTypeToString:[v11 sessionType]];
    *(_DWORD *)buf = 138413058;
    v59 = v5;
    __int16 v60 = 2112;
    v61 = v7;
    __int16 v62 = 2112;
    id v63 = v8;
    __int16 v64 = 2112;
    id v65 = v12;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,transitionToActiveState type %@", buf, 0x2Au);
  }
  uint64_t v13 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v14 = [v13 destinationMapItem];
  BOOL v15 = v14 == 0;
  if (v14)
  {
    uint64_t v16 = (void *)v14;
LABEL_7:

    goto LABEL_8;
  }
  __int16 v17 = [(SMInitiatorCacheManager *)self sessionManagerState];
  int v18 = [v17 configuration];
  uint64_t v19 = [v18 destination];

  if (v19)
  {
    uint64_t v13 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v16 = [v13 configuration];
    __int16 v20 = [v16 destination];
    __int16 v21 = [v20 destinationMapItem];
    __int16 v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v22 setDestinationMapItem:v21];

    goto LABEL_7;
  }
  BOOL v15 = 0;
LABEL_8:
  uint32_t v23 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v24 = [v23 startingLocation];
  if ([v24 isValid])
  {
  }
  else
  {
    int v25 = (void *)MEMORY[0x1E4F998C8];
    __int16 v26 = [(SMInitiatorCacheManager *)self sessionManagerState];
    os_log_type_t v27 = [v26 location];
    LODWORD(v25) = [v25 isCLLocationValid:v27];

    if (v25)
    {
      uint32_t v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = [(SMInitiatorCacheManager *)self sessionUUID];
        int v30 = (objc_class *)objc_opt_class();
        __int16 v31 = NSStringFromClass(v30);
        int v32 = NSStringFromSelector(a2);
        v56 = [(SMInitiatorCacheManager *)self sessionManagerState];
        id v55 = [v56 location];
        [v55 coordinate];
        __int16 v34 = v33;
        __int16 v35 = [(SMInitiatorCacheManager *)self sessionManagerState];
        id v36 = [v35 location];
        [v36 coordinate];
        uint64_t v38 = v37;
        id v39 = [(SMInitiatorCacheManager *)self sessionManagerState];
        uint64_t v40 = [v39 location];
        [v40 horizontalAccuracy];
        *(_DWORD *)buf = 138413570;
        v59 = v29;
        __int16 v60 = 2112;
        v61 = v31;
        __int16 v62 = 2112;
        id v63 = v32;
        __int16 v64 = 2048;
        id v65 = v34;
        __int16 v66 = 2048;
        uint64_t v67 = v38;
        __int16 v68 = 2048;
        uint64_t v69 = v41;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saving starting location,lat,%.4f,lon,%.4f,hunc,%.1f", buf, 0x3Eu);
      }
      id v42 = objc_alloc(MEMORY[0x1E4F998C8]);
      __int16 v43 = [(SMInitiatorCacheManager *)self sessionManagerState];
      v44 = [v43 location];
      __int16 v45 = (void *)[v42 initWithCLLocation:v44];
      v46 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v46 setStartingLocation:v45];

      goto LABEL_15;
    }
  }
  if (v15) {
LABEL_15:
  }
    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
  BOOL v47 = [(SMInitiatorCacheManager *)self _shouldPerformFirstCacheUpdateCKOperation];
  uint64_t v48 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v49 = [v48 timeCacheUploadCompletion];

  if (!v49 && v47)
  {
    v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = [(SMInitiatorCacheManager *)self sessionUUID];
      v52 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v52);
      v54 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v59 = v51;
      __int16 v60 = 2112;
      v61 = v53;
      __int16 v62 = 2112;
      id v63 = v54;
      _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,starting initial cache upload", buf, 0x20u);
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __51__SMInitiatorCacheManager__transitionToActiveState__block_invoke;
    v57[3] = &unk_1E6B91248;
    v57[4] = self;
    v57[5] = a2;
    [(SMInitiatorCacheManager *)self _periodicCacheUpdateWithCompletion:v57];
  }
}

void __51__SMInitiatorCacheManager__transitionToActiveState__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sessionUUID];
    BOOL v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_transitionToCacheReleaseStateForIsSecondarySOSTrigger:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v8 = (objc_class *)objc_opt_class();
    __int16 v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    BOOL v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,releasing cache", buf, 0x20u);
  }
  [(SMInitiatorCacheManager *)self _sendKeyReleaseMessageForIsSecondarySOSTrigger:v3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__SMInitiatorCacheManager__transitionToCacheReleaseStateForIsSecondarySOSTrigger___block_invoke;
  id v11[3] = &unk_1E6B91248;
  v11[4] = self;
  v11[5] = a2;
  [(SMInitiatorCacheManager *)self _periodicCacheUpdateWithCompletion:v11];
}

void __82__SMInitiatorCacheManager__transitionToCacheReleaseStateForIsSecondarySOSTrigger___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) sessionUUID];
    BOOL v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updated cache due to cache release", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_transitionToNotActiveState:(BOOL)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SMInitiatorCacheManager *)self sessionUUID];
    int v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v44 = v6;
    __int16 v45 = 2112;
    v46 = v8;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,transitioning session to not active", buf, 0x20u);
  }
  id v10 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v11 = [v10 shouldBeCleanedUpDate];

  if (v11)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      BOOL v15 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = NSStringFromSelector(a2);
      __int16 v17 = [(SMInitiatorCacheManager *)self initiatorContact];
      uint64_t v18 = [v17 shouldBeCleanedUpDate];
      uint64_t v19 = [v18 stringFromDate];
      *(_DWORD *)buf = 138413058;
      v44 = v13;
      __int16 v45 = 2112;
      v46 = v15;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v16;
      __int16 v49 = 2112;
      double v50 = *(double *)&v19;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache cleanup already scheduled for after %@", buf, 0x2Au);
    }
    goto LABEL_18;
  }
  __int16 v20 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v21 = [v20 keyReleaseMessageSendDate];
  if (v21)
  {
    __int16 v22 = (void *)v21;
    uint32_t v23 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v24 = [v23 sessionEndReason];

    if (v24 == 3)
    {
      int v25 = [(SMInitiatorCacheManager *)self defaultsManager];
      __int16 v26 = [v25 objectForKey:@"RTDefaultsSafetyCachePersistenceTimeKey" value:&unk_1F3453928];
      [v26 doubleValue];
      double v28 = v27;

      if (v28 != 604800.0)
      {
        __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v44 = "-[SMInitiatorCacheManager _transitionToNotActiveState:]";
          __int16 v45 = 2080;
          v46 = "overriding cache persistence interval";
          __int16 v47 = 2048;
          uint64_t v48 = 0x4122750000000000;
          __int16 v49 = 2048;
          double v50 = v28;
          __int16 v51 = 2112;
          v52 = @"RTDefaultsSafetyCachePersistenceTimeKey";
          _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }
      }
      int v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v28];
      __int16 v31 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v31 setShouldBeCleanedUpDate:v30];

      int v32 = NSString;
      __int16 v33 = [(SMInitiatorCacheManager *)self initiatorContact];
      __int16 v34 = [v33 shouldBeCleanedUpDate];
      __int16 v35 = [v34 stringFromDate];
      uint64_t v12 = [v32 stringWithFormat:@"at %@", v35];

      [(SMInitiatorCacheManager *)self notifyObserversSafetyCacheDidUpdate];
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v36 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v37 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v37 setShouldBeCleanedUpDate:v36];

  uint64_t v12 = @"now";
LABEL_15:
  uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    uint64_t v41 = (char *)objc_claimAutoreleasedReturnValue();
    id v42 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v44 = v39;
    __int16 v45 = 2112;
    v46 = v41;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v42;
    __int16 v49 = 2112;
    double v50 = *(double *)&v12;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup cache %@", buf, 0x2Au);
  }
  [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
LABEL_18:

  [(SMInitiatorCacheManager *)self _cleanUpInitiatorContact];
}

- (void)processSessionStartInfoRequest:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMInitiatorCacheManager *)self sessionManagerState];
    if (v6)
    {
      int v7 = [(SMInitiatorCacheManager *)self sessionManagerState];
      if ([v7 isActiveState])
      {
        BOOL v8 = [(SMInitiatorCacheManager *)self isActiveDevice];

        if (v8)
        {
          __int16 v9 = [v5 sessionID];
          id v10 = [(SMInitiatorCacheManager *)self sessionManagerState];
          __int16 v11 = [v10 configuration];
          uint64_t v12 = [v11 sessionID];
          char v13 = [v9 isEqual:v12];

          __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
          if (v13)
          {
            if (v15)
            {
              __int16 v16 = [(SMInitiatorCacheManager *)self sessionUUID];
              __int16 v17 = (objc_class *)objc_opt_class();
              uint64_t v18 = NSStringFromClass(v17);
              uint64_t v19 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              id v78 = v16;
              __int16 v79 = 2112;
              id v80 = v18;
              __int16 v81 = 2112;
              uint64_t v82 = v19;
              _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,preparing SMSessionStartInfoMessage", buf, 0x20u);
            }
            __int16 v20 = [(SMInitiatorCacheManager *)self sessionManagerState];
            uint64_t v21 = [v20 configuration];
            uint64_t v22 = [v21 sessionType];

            LODWORD(v20) = v22 == 1;
            uint32_t v23 = [(SMInitiatorCacheManager *)self sessionManagerState];
            uint64_t v24 = v23;
            if (v20)
            {
              int v25 = [v23 configuration];
              __int16 v26 = [v25 time];
              double v27 = [v26 timeBound];

              double v28 = (void *)MEMORY[0x1E4F1C9C8];
              __int16 v29 = [(SMInitiatorCacheManager *)self sessionManagerState];
              int v30 = [v29 configuration];
              __int16 v31 = [v30 time];
              int v32 = [v31 timeBound];
              __int16 v33 = [v28 roundingUpDate:v32 bucketDurationMinute:*MEMORY[0x1E4F99A30]];
            }
            else
            {
              double v27 = [v23 estimatedEndDate];

              __int16 v29 = [(SMInitiatorCacheManager *)self sessionManagerState];
              __int16 v33 = [v29 coarseEstimatedEndDate];
            }

            objc_initWeak(&location, self);
            __int16 v45 = (objc_class *)objc_opt_class();
            v46 = NSStringFromClass(v45);
            __int16 v47 = [(SMInitiatorCacheManager *)self sessionUUID];
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke;
            v70[3] = &unk_1E6B97C00;
            objc_copyWeak(v75, &location);
            id v64 = v47;
            id v71 = v64;
            id v63 = v46;
            id v72 = v63;
            v75[1] = (id)a2;
            __int16 v14 = v27;
            __int16 v73 = v14;
            id v62 = v33;
            id v74 = v62;
            uint64_t v48 = (void (**)(void, void))MEMORY[0x1E016DB00](v70);
            __int16 v49 = [(SMInitiatorCacheManager *)self activeSessionZone];
            double v50 = [v49 invitationTokenMap];

            if (v50)
            {
              __int16 v51 = [(SMInitiatorCacheManager *)self activeSessionZone];
              v52 = [(SMCloudKitQosOptions *)v51 invitationTokenMap];
              ((void (**)(void, void *))v48)[2](v48, v52);
            }
            else
            {
              uint64_t v53 = [(SMInitiatorCacheManager *)self sessionManagerState];
              v54 = [v53 configuration];
              id v55 = [v54 conversation];
              uint64_t v56 = [v55 isGroup];

              if (v56)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                __int16 v51 = (SMCloudKitQosOptions *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v51->super, OS_LOG_TYPE_ERROR))
                {
                  v57 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412802;
                  id v78 = v64;
                  __int16 v79 = 2112;
                  id v80 = v63;
                  __int16 v81 = 2112;
                  uint64_t v82 = v57;
                  _os_log_error_impl(&dword_1D9BFA000, &v51->super, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cannot regenerate invitation token map for groups", buf, 0x20u);
                }
              }
              else
              {
                __int16 v51 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
                v58 = [(SMInitiatorCacheManager *)self activeSessionZone];
                v59 = [(SMInitiatorCacheManager *)self sessionManagerState];
                __int16 v60 = [v59 configuration];
                v61 = [v60 conversation];
                v65[0] = MEMORY[0x1E4F143A8];
                v65[1] = 3221225472;
                v65[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_304;
                v65[3] = &unk_1E6B97C28;
                id v66 = v64;
                id v67 = v63;
                SEL v69 = a2;
                __int16 v68 = v48;
                [v58 createNewInvitationTokensWithConversation:v61 qos:v51 completion:v65];
              }
            }

            objc_destroyWeak(v75);
            objc_destroyWeak(&location);
          }
          else if (v15)
          {
            uint64_t v41 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v42 = (objc_class *)objc_opt_class();
            __int16 v43 = NSStringFromClass(v42);
            v44 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v78 = v41;
            __int16 v79 = 2112;
            id v80 = v43;
            __int16 v81 = 2112;
            uint64_t v82 = v44;
            _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sessionID does not match", buf, 0x20u);
          }
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v34 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v35 = (objc_class *)objc_opt_class();
      id v36 = NSStringFromClass(v35);
      uint64_t v37 = NSStringFromSelector(a2);
      uint64_t v38 = (void *)MEMORY[0x1E4F99950];
      id v39 = [(SMInitiatorCacheManager *)self sessionManagerState];
      uint64_t v40 = [v38 convertSessionStateToString:[v39 sessionState]];
      *(_DWORD *)buf = 138413058;
      id v78 = v34;
      __int16 v79 = 2112;
      id v80 = v36;
      __int16 v81 = 2112;
      uint64_t v82 = v37;
      __int16 v83 = 2112;
      v84 = v40;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignore request,state:%@", buf, 0x2Au);
    }
  }
  else
  {
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionStartInfoRequest", buf, 2u);
    }
  }
LABEL_15:
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      int v25 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager is nil", buf, 0x20u);
    }
    goto LABEL_9;
  }
  if (!v3)
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: invitationTokenMap", buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  id v6 = [WeakRetained delegate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_298;
  v13[3] = &unk_1E6B97BD8;
  objc_copyWeak(v19, (id *)(a1 + 64));
  id v14 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  BOOL v8 = *(void **)(a1 + 72);
  id v15 = v7;
  v19[1] = v8;
  id v16 = v3;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  [v6 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v13];

  objc_destroyWeak(v19);
LABEL_10:
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_298(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_299;
    block[3] = &unk_1E6B97BB0;
    id v16 = v5;
    uint64_t v23 = a2;
    id v17 = *(id *)(a1 + 48);
    id v18 = v7;
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 80);
    id v22 = v9;
    uint64_t v24 = v10;
    dispatch_async(v8, block);

    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      int v30 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);
    }
  }
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_299(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = *(void *)(a1 + 88);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v27 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v46;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v45 + 1) + 8 * v2);
        id v4 = objc_alloc(MEMORY[0x1E4F99838]);
        id v5 = objc_alloc(MEMORY[0x1E4F99888]);
        id v6 = (void *)[v5 initWithPrimaryHandle:v3 secondaryHandles:MEMORY[0x1E4F1CBF0]];
        v59 = v6;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        id v39 = (void *)[v4 initWithReceiverHandles:v7 identifier:0 displayName:0];

        id v8 = objc_alloc(MEMORY[0x1E4F99980]);
        id v9 = [*(id *)(a1 + 48) sessionUUID];
        uint64_t v32 = v3;
        uint64_t v57 = v3;
        __int16 v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
        v58 = v35;
        int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        __int16 v34 = [*(id *)(a1 + 48) sessionManagerState];
        __int16 v33 = [v34 configuration];
        uint64_t v36 = [v33 sessionType];
        uint64_t v28 = *(void *)(a1 + 56);
        uint64_t v29 = *(void *)(a1 + 64);
        uint64_t v31 = [*(id *)(a1 + 48) sessionManagerState];
        uint64_t v10 = [v31 configuration];
        uint64_t v11 = [v10 destination];
        uint64_t v12 = [v11 destinationType];
        uint64_t v13 = [*(id *)(a1 + 48) sessionManagerState];
        [v13 configuration];
        v14 = uint64_t v38 = v2;
        id v15 = [v14 destination];
        id v16 = [v15 destinationMapItem];
        uint64_t v37 = (void *)[v8 initWithSessionID:v9 invitationTokenDict:v30 sessionType:v36 estimatedEndTime:v28 coarseEstimatedEndTime:v29 destinationType:v12 destinationMapItem:v16 lowPowerModeWarningState:v26];

        id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = *(void *)(a1 + 72);
          uint64_t v22 = *(void *)(a1 + 80);
          uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 96));
          *(_DWORD *)buf = 138413058;
          uint64_t v50 = v21;
          __int16 v51 = 2112;
          uint64_t v52 = v22;
          __int16 v53 = 2112;
          v54 = v23;
          __int16 v55 = 2112;
          uint64_t v56 = v32;
          _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sending message to %@", buf, 0x2Au);
        }
        id v18 = [*(id *)(a1 + 48) messagingService];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_302;
        v40[3] = &unk_1E6B97B88;
        id v41 = *(id *)(a1 + 72);
        id v19 = *(id *)(a1 + 80);
        uint64_t v20 = *(void *)(a1 + 96);
        uint64_t v43 = v32;
        uint64_t v44 = v20;
        id v42 = v19;
        [v18 sendIDSMessage:v37 toConversation:v39 completion:v40];

        uint64_t v2 = v38 + 1;
      }
      while (v27 != v38 + 1);
      uint64_t v27 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v27);
  }
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_302(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 138413570;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sendIDSMessage sent to %@ returned with status:%d, error:%@", (uint8_t *)&v11, 0x3Au);
  }
}

void __58__SMInitiatorCacheManager_processSessionStartInfoRequest___block_invoke_304(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a2 && (a3 & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 138413058;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,nil Invitation Token or fetch failed, error:%@", (uint8_t *)&v12, 0x2Au);
    }
  }
}

- (void)processKeyReleaseInfoRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMInitiatorCacheManager *)self sessionManagerState];
    if ([v6 sessionState] == 4)
    {
      BOOL v7 = [(SMInitiatorCacheManager *)self isActiveDevice];

      if (v7)
      {
        uint64_t v8 = [v5 sessionID];
        uint64_t v9 = [(SMInitiatorCacheManager *)self sessionUUID];
        char v10 = [v8 isEqual:v9];

        if (v10)
        {
          int v11 = [(SMInitiatorCacheManager *)self delegate];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          id v19[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke;
          v19[3] = &unk_1E6B97CA0;
          v19[4] = self;
          v19[5] = a2;
          [v11 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v19];
LABEL_13:

          goto LABEL_14;
        }
        int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          goto LABEL_13;
        }
        uint64_t v13 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v18 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v18);
        __int16 v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        __int16 v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,sessionID does not match";
LABEL_12:
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, v17, buf, 0x20u);

        goto LABEL_13;
      }
    }
    else
    {
    }
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v13 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    __int16 v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignore SMKeyReleaseInfoRequestMessage";
    goto LABEL_12;
  }
  int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseInfoRequest", buf, 2u);
  }

LABEL_14:
}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_2;
  v10[3] = &unk_1E6B97C78;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  uint64_t v13 = a2;
  uint64_t v14 = v8;
  id v9 = v5;
  dispatch_async(v6, v10);
}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = *(void *)(a1 + 48);
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F99968];
  uint64_t v3 = [*(id *)(a1 + 40) sessionManagerState];
  id v4 = [v3 monitorContext];
  LOBYTE(v2) = [v2 isSOSTriggerCategory:[v4 triggerCategory]];

  id v5 = objc_alloc(MEMORY[0x1E4F998A0]);
  uint64_t v31 = [*(id *)(a1 + 40) sessionUUID];
  int v30 = [*(id *)(a1 + 40) initiatorContact];
  id v6 = [v30 triggerDate];
  uint64_t v27 = [*(id *)(a1 + 40) initiatorContact];
  uint64_t v23 = [v27 locationOfTrigger];
  uint64_t v26 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v25 = [v26 monitorContext];
  uint64_t v21 = [v25 triggerCategory];
  __int16 v24 = [*(id *)(a1 + 40) initiatorContact];
  uint64_t v20 = [v24 safetyCacheKey];
  __int16 v22 = [*(id *)(a1 + 40) initiatorContact];
  id v19 = [v22 allowReadToken];
  uint64_t v7 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v8 = [v7 configuration];
  uint64_t v9 = [v8 sessionType];
  char v10 = [*(id *)(a1 + 40) sessionManagerState];
  id v11 = [v10 configuration];
  uint64_t v12 = [v11 destination];
  LOBYTE(v18) = (_BYTE)v2;
  uint64_t v29 = [v5 initWithSessionID:v31 triggerDate:v6 locationOfTrigger:v23 triggerType:v21 safetyCacheKey:v19 safetyCacheToken:v9 sessionType:objc_msgSend(v12, "destinationType") destinationType:v18 isSOSTrigger:v28];

  uint64_t v13 = [*(id *)(a1 + 40) messagingService];
  uint64_t v14 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v15 = [v14 configuration];
  __int16 v16 = [v15 conversation];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_3;
  v32[3] = &unk_1E6B97C50;
  uint64_t v17 = *(void *)(a1 + 56);
  v32[4] = *(void *)(a1 + 40);
  v32[5] = v17;
  [v13 sendIDSMessage:v29 toConversation:v16 completion:v32];
}

void __56__SMInitiatorCacheManager_processKeyReleaseInfoRequest___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) sessionUUID];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    char v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v11 = 138413314;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,sendIDSMessage returned with status:%d, error:%@", (uint8_t *)&v11, 0x30u);
  }
}

- (void)_sendKeyReleaseMessageForIsSecondarySOSTrigger:(BOOL)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(SMInitiatorCacheManager *)self _cancelScheduledKeyRelease];
  if (a3)
  {
LABEL_2:
    id v6 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v7 = [v6 monitorContext];
    uint64_t v8 = [v7 triggerCategory];

    if (v8 == 15)
    {
      uint64_t v9 = [(SMInitiatorCacheManager *)self sessionManagerState];
      char v10 = [v9 sessionStateTransitionDate];
      int v11 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v11 setKeyReleaseMessageSendDate:v10];

      [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    }
    else
    {
      objc_initWeak((id *)location, self);
      uint64_t v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      __int16 v16 = [(SMInitiatorCacheManager *)self sessionUUID];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke;
      v31[3] = &unk_1E6B97D68;
      objc_copyWeak(v34, (id *)location);
      id v17 = v16;
      id v32 = v17;
      id v18 = v15;
      id v33 = v18;
      v34[1] = (id)a2;
      BOOL v35 = a3;
      [(SMInitiatorCacheManager *)self _fetchLocationWithCompletion:v31];

      objc_destroyWeak(v34);
      objc_destroyWeak((id *)location);
    }
    return;
  }
  uint64_t v12 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v13 = [v12 keyReleaseMessageSendDate];
  if (v13)
  {
  }
  else
  {
    __int16 v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v20 = [v19 shouldBeCleanedUpDate];

    if (!v20) {
      goto LABEL_2;
    }
  }
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v23 = (objc_class *)objc_opt_class();
    __int16 v24 = NSStringFromClass(v23);
    uint64_t v25 = NSStringFromSelector(a2);
    uint64_t v26 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v27 = [v26 keyReleaseMessageSendDate];
    uint64_t v28 = [v27 stringFromDate];
    uint64_t v29 = [(SMInitiatorCacheManager *)self initiatorContact];
    int v30 = [v29 identifier];
    *(_DWORD *)id location = 138413314;
    *(void *)&location[4] = v22;
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    __int16 v39 = 2112;
    uint64_t v40 = v25;
    __int16 v41 = 2112;
    id v42 = v28;
    __int16 v43 = 2112;
    uint64_t v44 = v30;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,either Key Release message already sent,%@,or session ended and being cleaned up,%@", location, 0x34u);
  }
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained initiatorContact];
    char v10 = [v9 shouldBeCleanedUpDate];

    if (v10)
    {
      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412802;
        uint64_t v56 = v13;
        __int16 v57 = 2112;
        uint64_t v58 = v12;
        __int16 v59 = 2112;
        __int16 v60 = v14;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session ended during location fetch", buf, 0x20u);
      }
    }
    else
    {
      if (v6 || ![v5 isValid])
      {
        uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = *(void *)(a1 + 32);
          uint64_t v46 = *(void *)(a1 + 40);
          long long v48 = NSStringFromSelector(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 138413058;
          uint64_t v56 = v47;
          __int16 v57 = 2112;
          uint64_t v58 = v46;
          __int16 v59 = 2112;
          __int16 v60 = v48;
          __int16 v61 = 2112;
          id v62 = v6;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched nil location or error:%@", buf, 0x2Au);
        }
        int v30 = 0;
      }
      else
      {
        id v18 = objc_alloc(MEMORY[0x1E4F5CE00]);
        [v5 latitude];
        double v20 = v19;
        [v5 longitude];
        double v22 = v21;
        [v5 hunc];
        double v24 = v23;
        [v5 altitude];
        double v26 = v25;
        [v5 vunc];
        double v28 = v27;
        uint64_t v29 = [v5 date];
        int v30 = (void *)[v18 initWithLatitude:v29 longitude:1 horizontalUncertainty:v20 altitude:v22 verticalUncertainty:v24 date:v26 referenceFrame:v28 speed:0.0];
      }
      if (!*(unsigned char *)(a1 + 64))
      {
        id v32 = [v8 initiatorContact];
        [v32 setLocationOfTrigger:v30];

        id v33 = [v8 sessionManagerState];
        __int16 v34 = [v33 sessionStateTransitionDate];
        BOOL v35 = [v8 initiatorContact];
        [v35 setTriggerDate:v34];

        uint64_t v36 = [v8 sessionManagerState];
        __int16 v37 = [v36 configuration];
        uint64_t v38 = [v37 sessionStartDate];
        [v38 timeIntervalSinceNow];
        double v40 = v39;
        __int16 v41 = [v8 initiatorContact];
        [v41 setTimeTilCacheRelease:-v40];

        id v42 = [v8 initiatorContact];
        [v42 setWasCacheReleased:1];

        [v8 _updateInitiatorContactInStore];
      }
      __int16 v43 = [v8 delegate];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_308;
      v49[3] = &unk_1E6B97D40;
      objc_copyWeak(v53, (id *)(a1 + 48));
      id v50 = *(id *)(a1 + 32);
      id v44 = *(id *)(a1 + 40);
      uint64_t v45 = *(void **)(a1 + 56);
      id v51 = v44;
      v53[1] = v45;
      int v11 = v30;
      uint64_t v52 = v11;
      char v54 = *(unsigned char *)(a1 + 64);
      [v43 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v49];

      objc_destroyWeak(v53);
    }
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v56 = v16;
      __int16 v57 = 2112;
      uint64_t v58 = v15;
      __int16 v59 = 2112;
      __int16 v60 = v17;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during location fetch", buf, 0x20u);
    }
  }
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_308(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_309;
    block[3] = &unk_1E6B97D18;
    uint64_t v16 = v5;
    v21[1] = a2;
    id v17 = v7;
    id v18 = *(id *)(a1 + 48);
    objc_copyWeak(v21, (id *)(a1 + 56));
    id v19 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    char v10 = *(void **)(a1 + 64);
    id v20 = v9;
    v21[2] = v10;
    char v22 = *(unsigned char *)(a1 + 72);
    dispatch_async(v8, block);

    objc_destroyWeak(v21);
    int v11 = v16;
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      double v28 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);
    }
  }
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_309(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = *(void *)(a1 + 80);
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F99968];
  uint64_t v3 = [*(id *)(a1 + 40) sessionManagerState];
  id v4 = [v3 monitorContext];
  char v5 = [v2 isSOSTriggerCategory:[v4 triggerCategory]];

  id v30 = objc_alloc(MEMORY[0x1E4F998B0]);
  id v6 = [*(id *)(a1 + 40) sessionUUID];
  uint64_t v36 = [*(id *)(a1 + 40) sessionManagerState];
  double v28 = [v36 sessionStateTransitionDate];
  uint64_t v29 = *(void *)(a1 + 48);
  id v33 = [*(id *)(a1 + 40) sessionManagerState];
  id v32 = [v33 monitorContext];
  uint64_t v26 = [v32 triggerCategory];
  uint64_t v31 = [*(id *)(a1 + 40) initiatorContact];
  __int16 v25 = [v31 safetyCacheKey];
  __int16 v27 = [*(id *)(a1 + 40) initiatorContact];
  uint64_t v7 = [v27 allowReadToken];
  uint64_t v8 = [*(id *)(a1 + 40) sessionManagerState];
  id v9 = [v8 configuration];
  uint64_t v10 = [v9 sessionType];
  int v11 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v12 = [v11 configuration];
  uint64_t v13 = [v12 destination];
  LOBYTE(v24) = v5;
  BOOL v35 = [v30 initWithSessionID:v6 triggerDate:v28 locationOfTrigger:v29 triggerType:v26 safetyCacheKey:v25 safetyCacheToken:v7 sessionType:v10 destinationType:[v13 destinationType] isSOSTrigger:v24 lowPowerModeWarningState:v34];

  uint64_t v14 = [*(id *)(a1 + 40) messagingService];
  uint64_t v15 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v16 = [v15 startMessageGUID];
  id v17 = [*(id *)(a1 + 40) sessionManagerState];
  id v18 = [v17 configuration];
  id v19 = [v18 conversation];
  id v20 = [v35 summaryText];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_2;
  v37[3] = &unk_1E6B97CF0;
  objc_copyWeak(v41, (id *)(a1 + 72));
  id v38 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  char v22 = *(void **)(a1 + 88);
  id v39 = v21;
  v41[1] = v22;
  char v42 = *(unsigned char *)(a1 + 96);
  id v23 = v35;
  id v40 = v23;
  [v14 sendMadridMessage:v23 associatedGUID:v16 toConversation:v19 summaryText:v20 completion:v37];

  objc_destroyWeak(v41);
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    int v11 = [WeakRetained queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_311;
    v18[3] = &unk_1E6B97CC8;
    id v19 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 64);
    id v20 = v12;
    uint64_t v25 = v13;
    char v26 = a3;
    id v21 = v7;
    id v22 = v8;
    char v27 = *(unsigned char *)(a1 + 72);
    id v23 = v10;
    id v24 = *(id *)(a1 + 48);
    dispatch_async(v11, v18);

    uint64_t v14 = v19;
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during message send", buf, 0x20u);
    }
  }
}

void __74__SMInitiatorCacheManager__sendKeyReleaseMessageForIsSecondarySOSTrigger___block_invoke_311(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 80));
    id v6 = (void *)v5;
    id v7 = @"succeeded";
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    if (!*(unsigned char *)(a1 + 88)) {
      id v7 = @"failed";
    }
    int v12 = 138413570;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message send %@,messageGUID,%@,error,%@", (uint8_t *)&v12, 0x3Eu);
  }
  if (!*(unsigned char *)(a1 + 89))
  {
    uint64_t v10 = [*(id *)(a1 + 72) date];
    int v11 = [*(id *)(a1 + 64) initiatorContact];
    [v11 setKeyReleaseMessageSendDate:v10];

    [*(id *)(a1 + 64) _updateInitiatorContactInStore];
  }
}

- (void)_sendCacheUpdatedMessage
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v5 = [v4 shouldBeCleanedUpDate];

  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v7;
      __int16 v30 = 2112;
      uint64_t v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up", buf, 0x20u);
    }
  }
  else
  {
    int v11 = [(SMInitiatorCacheManager *)self initiatorContact];
    int v12 = [v11 keyReleaseMessageSendDate];

    if (!v12) {
      return;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F99820]);
    __int16 v14 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v6 = [v13 initWithSessionID:v14];

    uint64_t v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    uint64_t v17 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v18 = [(SMInitiatorCacheManager *)self messagingService];
    id v19 = [(SMInitiatorCacheManager *)self sessionManagerState];
    __int16 v20 = [v19 configuration];
    uint64_t v21 = [v20 conversation];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __51__SMInitiatorCacheManager__sendCacheUpdatedMessage__block_invoke;
    v24[3] = &unk_1E6B97D90;
    id v25 = v17;
    id v26 = v16;
    SEL v27 = a2;
    id v22 = v16;
    id v23 = v17;
    [v18 sendIDSMessage:v6 toConversation:v21 completion:v24];
  }
}

void __51__SMInitiatorCacheManager__sendCacheUpdatedMessage__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v10 = (void *)v9;
    int v12 = 138413314;
    int v11 = @"failed";
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    if (a2) {
      int v11 = @"succeeded";
    }
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message send %@ with error %@", (uint8_t *)&v12, 0x34u);
  }
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  uint64_t v2 = [(SMInitiatorCacheManager *)self messagingService];
  uint64_t v3 = [v2 effectivePairedDevice];
  char v4 = [v3 isNearby];

  return v4;
}

- (BOOL)_shouldPerformFirstCacheUpdateCKOperation
{
  return 1;
}

- (id)getXpcActivityIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(SMInitiatorCacheManager *)self sessionUUID];
  char v4 = [v2 stringWithFormat:@"%@.%@", @"com.apple.routined.cacheMaintenance.periodic", v3];

  return v4;
}

- (void)_evaluateAndManagePeriodicCacheUpdate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v4 = [(SMInitiatorCacheManager *)self sessionManagerState];
  int v5 = [v4 isActiveState];

  BOOL v6 = [(SMInitiatorCacheManager *)self isActiveDevice];
  BOOL v7 = ![(SMInitiatorCacheManager *)self isActiveDevice]
    && [(SMInitiatorCacheManager *)self _isEffectivePairedDeviceNearby];
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    int v12 = NSStringFromSelector(a2);
    int v13 = 138413826;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 1024;
    int v20 = v5;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v7;
    __int16 v25 = 1024;
    int v26 = v5 & (v6 || v7);
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,isActiveState,%d,isActiveDevice,%d,isNonActiveDeviceAndIsCompanionConnected,%d,shouldScheduleCacheUpdates,%d", (uint8_t *)&v13, 0x38u);
  }
  if (v5) {
    [(SMInitiatorCacheManager *)self _setupFetchOnZoneUpdates];
  }
  else {
    [(SMInitiatorCacheManager *)self _teardownFetchOnZoneUpdates];
  }
  if ((v5 & (v6 || v7)) != 0)
  {
    [(SMInitiatorCacheManager *)self _registerForGeneralNotifications];
    if (v6) {
      [(SMInitiatorCacheManager *)self _registerForActiveNotifications];
    }
    else {
      [(SMInitiatorCacheManager *)self _unregisterForActiveNotifications];
    }
    [(SMInitiatorCacheManager *)self _schedulePeriodicCacheUpdate];
  }
  else
  {
    [(SMInitiatorCacheManager *)self _unregisterForGeneralNotifications];
    [(SMInitiatorCacheManager *)self _unregisterForActiveNotifications];
    [(SMInitiatorCacheManager *)self _stopPeriodicCacheUpdate];
    [(SMInitiatorCacheManager *)self stopCacheUpdateBackstopTimer];
  }
}

- (void)_schedulePeriodicCacheUpdate
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (![(SMInitiatorCacheManager *)self isPeriodicallyUpdatingCache])
  {
    [(SMInitiatorCacheManager *)self setIsPeriodicallyUpdatingCache:1];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke;
    v35[3] = &unk_1E6B91248;
    v35[4] = self;
    v35[5] = a2;
    [(SMInitiatorCacheManager *)self _periodicCacheUpdateWithCompletion:v35];
    char v4 = (void *)MEMORY[0x1E4F1C9C8];
    [(SMInitiatorCacheManager *)self getCacheUpdateBackstopTimeout];
    int v5 = [v4 dateWithTimeIntervalSinceNow:x0];
    BOOL v6 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v6 setCacheUpdateBackstopExpiryDate:v5];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    [(SMInitiatorCacheManager *)self updateCacheUpdateBackstopTimer];
    BOOL v7 = [(SMInitiatorCacheManager *)self defaultsManager];
    uint64_t v8 = [v7 objectForKey:@"RTDefaultsSafetyCacheUpdateInterval"];

    if (v8)
    {
      [v8 doubleValue];
      double v10 = v9;
      double v11 = 300.0;
      if (v9 != 300.0)
      {
        int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v37 = "-[SMInitiatorCacheManager _schedulePeriodicCacheUpdate]";
          __int16 v38 = 2080;
          id v39 = "overriding cache update interval";
          __int16 v40 = 2048;
          uint64_t v41 = 0x4072C00000000000;
          __int16 v42 = 2048;
          double v43 = v10;
          __int16 v44 = 2112;
          uint64_t v45 = @"RTDefaultsSafetyCacheUpdateInterval";
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }

        double v11 = v10;
      }
    }
    else
    {
      double v11 = 300.0;
    }
    int v13 = [(SMInitiatorCacheManager *)self defaultsManager];
    __int16 v14 = [v13 objectForKey:@"RTDefaultsSafetyCacheUpdateGracePeriod"];

    if (v14)
    {
      [v14 doubleValue];
      double v16 = v15;
    }
    else
    {
      double v16 = 30.0;
    }
    LOBYTE(v30) = 0;
    __int16 v17 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:0 requireNetworkConnectivity:51200 requireInexpensiveNetworkConnectivity:51200 networkTransferUploadSize:1 networkTransferDownloadSize:v11 allowBattery:v16 powerNap:v11 - v16 delay:v30 requireBatteryLevel:&unk_1F34513E0];
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      __int16 v21 = (char *)objc_claimAutoreleasedReturnValue();
      BOOL v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      __int16 v37 = v19;
      __int16 v38 = 2112;
      id v39 = v21;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v22;
      __int16 v42 = 2048;
      double v43 = v11;
      __int16 v44 = 2048;
      uint64_t v45 = *(__CFString **)&v16;
      __int16 v46 = 2048;
      double v47 = v11 - v16;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule xpc activity,interval,%f,grace period,%f,delay,%lf", buf, 0x3Eu);
    }
    objc_initWeak((id *)buf, self);
    __int16 v23 = (objc_class *)objc_opt_class();
    BOOL v24 = NSStringFromClass(v23);
    __int16 v25 = [(SMInitiatorCacheManager *)self sessionUUID];
    int v26 = [(SMInitiatorCacheManager *)self xpcActivityManager];
    uint64_t v27 = [(SMInitiatorCacheManager *)self getXpcActivityIdentifier];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_329;
    v31[3] = &unk_1E6B97DB8;
    objc_copyWeak(v34, (id *)buf);
    id v28 = v25;
    id v32 = v28;
    id v29 = v24;
    id v33 = v29;
    v34[1] = (id)a2;
    [v26 registerActivityWithIdentifier:v27 criteria:v17 handler:v31];

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)buf);
  }
}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionUUID];
    char v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    BOOL v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    double v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed initial cache upload", (uint8_t *)&v7, 0x20u);
  }
}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_329(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_2;
    block[3] = &unk_1E6B90FA8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v12 = v7;
    uint64_t v14 = v8;
    id v13 = v3;
    dispatch_async(v6, block);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) initiatorContact];
  id v3 = [v2 shouldBeCleanedUpDate];

  char v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
      __int16 v9 = [*(id *)(a1 + 32) initiatorContact];
      id v10 = [v9 shouldBeCleanedUpDate];
      id v11 = [v10 stringFromDate];
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc fired,shouldBeCleanedUpDate %@", buf, 0x2Au);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
    [*(id *)(a1 + 32) _stopPeriodicCacheUpdate];
  }
  else
  {
    if (v5)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      double v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc fired", buf, 0x20u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v19[2] = __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_330;
    v19[3] = &unk_1E6B90C40;
    double v16 = *(void **)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    long long v18 = *(_OWORD *)(a1 + 56);
    id v17 = (id)v18;
    long long v22 = v18;
    [v16 _periodicCacheUpdateWithCompletion:v19];
  }
}

uint64_t __55__SMInitiatorCacheManager__schedulePeriodicCacheUpdate__block_invoke_330(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache xpc completed", (uint8_t *)&v7, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_stopPeriodicCacheUpdate
{
  if ([(SMInitiatorCacheManager *)self isPeriodicallyUpdatingCache])
  {
    [(SMInitiatorCacheManager *)self setIsPeriodicallyUpdatingCache:0];
    uint64_t v4 = [(SMInitiatorCacheManager *)self xpcActivityManager];
    BOOL v5 = [(SMInitiatorCacheManager *)self getXpcActivityIdentifier];
    [v4 deleteDefaultsForIdentifier:v5];

    uint64_t v6 = [(SMInitiatorCacheManager *)self xpcActivityManager];
    int v7 = [(SMInitiatorCacheManager *)self getXpcActivityIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SMInitiatorCacheManager__stopPeriodicCacheUpdate__block_invoke;
    v8[3] = &unk_1E6B90CB8;
    v8[4] = self;
    v8[5] = a2;
    [v6 unregisterActivityWithIdentifier:v7 handler:v8];
  }
}

void __51__SMInitiatorCacheManager__stopPeriodicCacheUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) sessionUUID];
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)_periodicCacheUpdateWithCompletion:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(void))a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v6, OS_SIGNPOST_EVENT, v8, "SMUpdateInitiatorSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  int v9 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9C8];
    [(SMInitiatorCacheManager *)self getCacheUpdateBackstopTimeout];
    long long v18 = [v17 dateWithTimeIntervalSinceNow:x0];
    __int16 v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v19 setCacheUpdateBackstopExpiryDate:v18];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    [(SMInitiatorCacheManager *)self updateCacheUpdateBackstopTimer];
    id v20 = objc_opt_new();
    [(SMInitiatorCacheManager *)self setCacheUploadInProgress:v20];
    id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      __int16 v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      char v54 = v22;
      __int16 v55 = 2112;
      id v56 = v24;
      __int16 v57 = 2112;
      uint64_t v58 = v25;
      __int16 v59 = 2112;
      __int16 v60 = v20;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache started %@", buf, 0x2Au);
    }
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke;
    block[3] = &unk_1E6B97DE0;
    objc_copyWeak(v51, &location);
    void block[4] = self;
    v51[1] = (id)a2;
    id v50 = v5;
    id v26 = v20;
    id v49 = v26;
    dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_332;
    v44[3] = &unk_1E6B90E20;
    objc_copyWeak(v47, &location);
    id v28 = v27;
    id v46 = v28;
    v47[1] = (id)a2;
    id v29 = v26;
    id v45 = v29;
    dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v44);
    dispatch_time_t v31 = dispatch_time(0, 60000000000);
    id v32 = [(SMInitiatorCacheManager *)self queue];
    dispatch_after(v31, v32, v30);

    if ([(SMInitiatorCacheManager *)self isActiveDevice])
    {
      if (![(SMInitiatorCacheManager *)self _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary])
      {
        BOOL v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          id v39 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          char v54 = v36;
          __int16 v55 = 2112;
          id v56 = v38;
          __int16 v57 = 2112;
          uint64_t v58 = v39;
          _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@, not eligible for cache update", buf, 0x20u);
        }
        v28[2](v28);
        goto LABEL_18;
      }
      id v33 = (id *)v42;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_333;
      v42[3] = &unk_1E6B97E30;
      uint64_t v34 = v43;
      objc_copyWeak(v43, &location);
      v42[5] = v30;
      v42[6] = v28;
      v43[1] = (id)a2;
      v42[4] = v29;
      [(SMInitiatorCacheManager *)self _updateCacheDataWithCompletion:v42];
    }
    else
    {
      id v33 = (id *)v40;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_336;
      v40[3] = &unk_1E6B97E30;
      uint64_t v34 = v41;
      objc_copyWeak(v41, &location);
      v40[5] = v30;
      v40[6] = v28;
      v41[1] = (id)a2;
      void v40[4] = v29;
      [(SMInitiatorCacheManager *)self _updateCacheDataForNonActiveDeviceWithCompletion:v40];
    }

    objc_destroyWeak(v34);
LABEL_18:

    objc_destroyWeak(v47);
    objc_destroyWeak(v51);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    __int16 v15 = NSStringFromSelector(a2);
    id v16 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
    *(_DWORD *)buf = 138413058;
    char v54 = v12;
    __int16 v55 = 2112;
    id v56 = v14;
    __int16 v57 = 2112;
    uint64_t v58 = v15;
    __int16 v59 = 2112;
    __int16 v60 = v16;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache already in progress %@", buf, 0x2Au);
  }
  v5[2](v5);
LABEL_19:
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    BOOL v5 = [WeakRetained cacheUploadInProgress];
    LODWORD(v4) = [v4 isEqual:v5];

    if (v4)
    {
      [v3 setCacheUploadInProgress:0];
      uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [v3 sessionUUID];
        os_signpost_id_t v8 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v8);
        BOOL v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v11 = *(void *)(a1 + 40);
        int v17 = 138413058;
        long long v18 = v7;
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2112;
        long long v22 = v10;
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache completed %@", (uint8_t *)&v17, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    uint64_t v14 = [*(id *)(a1 + 32) sessionUUID];
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v17 = 138412802;
      long long v18 = v14;
      __int16 v19 = 2112;
      id v20 = v13;
      __int16 v21 = 2112;
      long long v22 = v16;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before completion called", (uint8_t *)&v17, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_332(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [WeakRetained sessionUUID];
      BOOL v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      BOOL v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache timeout fired %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_333(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [WeakRetained sessionUUID];
      int v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v25 = v6;
      __int16 v26 = 2112;
      dispatch_block_t v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache updateCache completed %@, cache, %@", buf, 0x34u);
    }
    __int16 v11 = *(void **)(a1 + 32);
    uint64_t v12 = [WeakRetained cacheUploadInProgress];
    LODWORD(v11) = [v11 isEqual:v12];

    if (v11)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_334;
      v20[3] = &unk_1E6B97E08;
      id v21 = *(id *)(a1 + 40);
      objc_copyWeak(&v23, (id *)(a1 + 56));
      id v22 = *(id *)(a1 + 48);
      [WeakRetained _uploadCache:v3 completion:v20];

      objc_destroyWeak(&v23);
    }
    else
    {
      __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [WeakRetained sessionUUID];
        __int16 v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v18 = *(void *)(a1 + 32);
        __int16 v19 = [WeakRetained cacheUploadInProgress];
        *(_DWORD *)buf = 138413314;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        dispatch_block_t v27 = v16;
        __int16 v28 = 2112;
        id v29 = v17;
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        __int16 v32 = 2112;
        id v33 = v19;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploadCache was canceled %@, active %@", buf, 0x34u);
      }
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_334(uint64_t a1)
{
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = [WeakRetained initiatorContact];
  [v3 setTimeCacheUploadCompletion:v2];

  [WeakRetained _updateInitiatorContactInStore];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_336(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [WeakRetained sessionUUID];
      int v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v25 = v6;
      __int16 v26 = 2112;
      dispatch_block_t v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,non-active uploadCache updateCache completed %@, cache, %@", buf, 0x34u);
    }
    __int16 v11 = *(void **)(a1 + 32);
    uint64_t v12 = [WeakRetained cacheUploadInProgress];
    LODWORD(v11) = [v11 isEqual:v12];

    if (v11)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_337;
      v20[3] = &unk_1E6B97E08;
      id v21 = *(id *)(a1 + 40);
      objc_copyWeak(&v23, (id *)(a1 + 56));
      id v22 = *(id *)(a1 + 48);
      [WeakRetained _uploadCacheForNonActiveDevice:v3 completion:v20];

      objc_destroyWeak(&v23);
    }
    else
    {
      __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [WeakRetained sessionUUID];
        __int16 v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v18 = *(void *)(a1 + 32);
        __int16 v19 = [WeakRetained cacheUploadInProgress];
        *(_DWORD *)buf = 138413314;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        dispatch_block_t v27 = v16;
        __int16 v28 = 2112;
        id v29 = v17;
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        __int16 v32 = 2112;
        id v33 = v19;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,non-active uploadCache was canceled %@, active %@", buf, 0x34u);
      }
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __62__SMInitiatorCacheManager__periodicCacheUpdateWithCompletion___block_invoke_337(uint64_t a1)
{
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = [WeakRetained initiatorContact];
  [v3 setTimeCacheUploadCompletion:v2];

  [WeakRetained _updateInitiatorContactInStore];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCacheDataWithCompletion:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  if (!v57)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v73 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v73, 2u);
    }

    goto LABEL_21;
  }
  aSelector = a2;
  BOOL v5 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v6 = [v5 shouldBeCleanedUpDate];

  if (!v6)
  {
    uint64_t v79 = 0;
    id v80 = &v79;
    uint64_t v81 = 0x2020000000;
    uint64_t v82 = 0;
    *(void *)__int16 v73 = 0;
    id v74 = v73;
    uint64_t v75 = 0x3032000000;
    id v76 = __Block_byref_object_copy__81;
    uint64_t v77 = __Block_byref_object_dispose__81;
    id v78 = 0;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke;
    v69[3] = &unk_1E6B97E58;
    id v71 = &v79;
    id v70 = v57;
    id v72 = v73;
    id v38 = (void *)MEMORY[0x1E016DB00](v69);
    id v37 = objc_alloc(MEMORY[0x1E4F99818]);
    char v54 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v53 = [v54 cache];
    __int16 v55 = [v53 identifier];
    id v39 = v55;
    if (!v55)
    {
      id v39 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v52 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v51 = [v52 cache];
    id v45 = [v51 deviceStatus];
    __int16 v44 = objc_opt_new();
    id v50 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v40 = [v50 unlockLocation];
    id v49 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v43 = [v49 lockLocation];
    uint64_t v48 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v47 = [v48 cache];
    __int16 v42 = [v47 mostRecentLocation];
    id v46 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v41 = [v46 startingLocation];
    uint64_t v10 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v11 = [v10 offWristLocation];
    uint64_t v12 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v13 = [v12 parkedCarLocation];
    uint64_t v14 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v15 = [v14 destinationMapItem];
    uint64_t v16 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v17 = [v16 workoutEvents];
    uint64_t v18 = (void *)[v17 copy];
    uint64_t v19 = [v37 initWithIdentifier:v39 deviceStatus:v45 locationsDuringSession:v44 unlockLocation:v40 lockLocation:v43 mostRecentLocation:v42 startingLocation:v41 offWristLocation:v11 parkedCarLocation:v13 destinationMapItem:v15 workoutEvents:v18];
    id v20 = (void *)*((void *)v74 + 5);
    *((void *)v74 + 5) = v19;

    if (!v55) {
    if (!*((void *)v74 + 5))
    }
    {
      id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = [(SMInitiatorCacheManager *)self initiatorContact];
        *(_DWORD *)buf = 138413058;
        v84 = v32;
        __int16 v85 = 2112;
        id v86 = v34;
        __int16 v87 = 2112;
        id v88 = v35;
        __int16 v89 = 2112;
        BOOL v90 = v36;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,default initializing cache due to failure to extract existing initiator contact data,%@", buf, 0x2Au);
      }
      uint64_t v22 = objc_opt_new();
      id v23 = (void *)*((void *)v74 + 5);
      *((void *)v74 + 5) = v22;
    }
    int v24 = [MEMORY[0x1E4F998E0] shareAllLocations];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = [(SMInitiatorCacheManager *)self sessionUUID];
      dispatch_block_t v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138413058;
      v84 = v26;
      __int16 v85 = 2112;
      id v86 = v28;
      __int16 v87 = 2112;
      id v88 = v29;
      __int16 v89 = 1024;
      LODWORD(v90) = v24;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating cache data,shareAllLocations,%d", buf, 0x26u);
    }
    if (v24)
    {
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_339;
      v66[3] = &unk_1E6B97E80;
      v66[4] = self;
      __int16 v68 = v73;
      id v67 = v38;
      [(SMInitiatorCacheManager *)self _requestSmoothedLocationsWithCompletion:v66];
    }
    else
    {
      [*((id *)v74 + 5) setUnlockLocation:0];
      [*((id *)v74 + 5) setLockLocation:0];
      [*((id *)v74 + 5) setStartingLocation:0];
      [*((id *)v74 + 5) setOffWristLocation:0];
      [*((id *)v74 + 5) setParkedCarLocation:0];
      ++v80[3];
    }
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_2;
    v63[3] = &unk_1E6B97EA8;
    id v65 = v73;
    id v30 = v38;
    id v64 = v30;
    [(SMInitiatorCacheManager *)self _fetchDeviceStatusWithCompletion:v63];
    objc_initWeak((id *)buf, self);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_3;
    v58[3] = &unk_1E6B97ED0;
    objc_copyWeak(v61, (id *)buf);
    __int16 v60 = v73;
    v61[1] = (id)aSelector;
    char v62 = v24;
    id v31 = v30;
    id v59 = v31;
    [(SMInitiatorCacheManager *)self _fetchLocationWithCompletion:v58];

    objc_destroyWeak(v61);
    objc_destroyWeak((id *)buf);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(&v79, 8);
LABEL_21:
    uint64_t v8 = v57;
    goto LABEL_22;
  }
  int v7 = objc_opt_new();
  uint64_t v8 = v57;
  (*((void (**)(id, void *))v57 + 2))(v57, v7);

LABEL_22:
}

void *__58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke(void *result)
{
  if (++*(void *)(*(void *)(result[5] + 8) + 24) == 3) {
    return (void *)(*(uint64_t (**)(void, void))(result[4] + 16))(result[4], *(void *)(*(void *)(result[6] + 8) + 40));
  }
  return result;
}

uint64_t __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_339(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  [v3 storeCAMetricForAllLocations:v4];
  BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  [*(id *)(*(void *)(a1[6] + 8) + 40) setLocationsDuringSession:v5];
  uint64_t v6 = *(uint64_t (**)(void))(a1[5] + 16);

  return v6();
}

uint64_t __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDeviceStatus:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void __58__SMInitiatorCacheManager__updateCacheDataWithCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5 && !a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMostRecentLocation:v5];
    int v7 = [WeakRetained initiatorContact];
    uint64_t v8 = [v7 startingLocation];
    if ([v8 isValid])
    {
    }
    else
    {
      int v9 = [v5 isValid];

      if (v9)
      {
        uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v11 = [WeakRetained sessionUUID];
          uint64_t v12 = (objc_class *)objc_opt_class();
          __int16 v13 = NSStringFromClass(v12);
          uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
          [v5 latitude];
          uint64_t v16 = v15;
          [v5 longitude];
          uint64_t v18 = v17;
          [v5 hunc];
          int v21 = 138413570;
          uint64_t v22 = v11;
          __int16 v23 = 2112;
          int v24 = v13;
          __int16 v25 = 2112;
          __int16 v26 = v14;
          __int16 v27 = 2048;
          uint64_t v28 = v16;
          __int16 v29 = 2048;
          uint64_t v30 = v18;
          __int16 v31 = 2048;
          uint64_t v32 = v19;
          _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saving starting location,lat,%.4f,lon,%.4f,hunc,%.1f", (uint8_t *)&v21, 0x3Eu);
        }
        id v20 = [WeakRetained initiatorContact];
        [v20 setStartingLocation:v5];

        [WeakRetained _updateInitiatorContactInStore];
        if (*(unsigned char *)(a1 + 64)) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setStartingLocation:v5];
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestSmoothedLocationsWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    aSelector = a2;
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    int v7 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v8 = [v7 configuration];
    int v9 = [v8 sessionStartDate];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v11 = [v6 initWithStartDate:v9 endDate:v10];

    LOBYTE(v24) = 1;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v11 horizontalAccuracy:1000 batchSize:0 boundingBoxLocation:14 type:1 smoothingRequired:1 downsampleRequired:250.0 smoothingErrorThreshold:30.0 ascending:v24];
    objc_initWeak(&location, self);
    __int16 v13 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      id v37 = v20;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching smoothed locations", buf, 0x20u);
    }
    int v21 = [(SMInitiatorCacheManager *)self locationManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke;
    v26[3] = &unk_1E6B97F18;
    objc_copyWeak(v30, &location);
    id v29 = v5;
    id v22 = v13;
    id v27 = v22;
    id v23 = v15;
    id v28 = v23;
    v30[1] = (id)aSelector;
    [v21 fetchStoredLocationsWithOptions:v12 handler:v26];

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }
  }
}

void __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_2;
    v14[3] = &unk_1E6B916E0;
    id v15 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    id v16 = v10;
    uint64_t v20 = v11;
    id v17 = v6;
    id v18 = v5;
    id v19 = *(id *)(a1 + 48);
    dispatch_async(v9, v14);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    __int16 v13 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 56) count];
    *(_DWORD *)buf = 138413314;
    uint64_t v38 = v3;
    __int16 v39 = 2112;
    uint64_t v40 = v4;
    __int16 v41 = 2112;
    __int16 v42 = v5;
    __int16 v43 = 2112;
    uint64_t v44 = v6;
    __int16 v45 = 2048;
    uint64_t v46 = v7;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched smoothed locations with Error: %@, locationCount: %lu", buf, 0x34u);
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    int v9 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v31 = *(void *)v33;
      unint64_t v14 = 0x1E4F99000uLL;
      *(void *)&long long v12 = 138412802;
      long long v29 = v12;
      do
      {
        uint64_t v15 = 0;
        uint64_t v30 = v13;
        do
        {
          if (*(void *)v33 != v31) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * v15);
          if (objc_msgSend(*(id *)(v14 + 2248), "isCLLocationValid:", v16, v29))
          {
            [v9 addObject:v16];
          }
          else
          {
            id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = a1;
              uint64_t v19 = *(void *)(a1 + 32);
              id v20 = v10;
              int v21 = v9;
              uint64_t v22 = *(void *)(v18 + 40);
              NSStringFromSelector(*(SEL *)(v18 + 72));
              uint64_t v24 = v23 = v14;
              *(_DWORD *)buf = v29;
              uint64_t v38 = v19;
              __int16 v39 = 2112;
              uint64_t v40 = v22;
              int v9 = v21;
              id v10 = v20;
              __int16 v41 = 2112;
              __int16 v42 = v24;
              _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,filtering out invalid location", buf, 0x20u);

              a1 = v18;
              unint64_t v14 = v23;
              uint64_t v13 = v30;
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }

    if ([v9 count])
    {
      __int16 v25 = [[_RTMap alloc] initWithInput:v9];
      __int16 v26 = [(_RTMap *)v25 withBlock:&__block_literal_global_348];

      id v27 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      uint64_t v28 = *(void *)(a1 + 64);
      __int16 v26 = objc_opt_new();
      id v27 = *(void (**)(void))(v28 + 16);
    }
    v27();
  }
}

id __67__SMInitiatorCacheManager__requestSmoothedLocationsWithCompletion___block_invoke_345(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F998C8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithCLLocation:v3];

  return v4;
}

- (void)_fetchDeviceStatusWithCompletion:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  if (v31)
  {
    objc_initWeak(&location, self);
    *(void *)__int16 v55 = 0;
    id v56 = v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [(SMInitiatorCacheManager *)self sessionUUID];
    dispatch_time_t when = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke;
    block[3] = &unk_1E6B97F40;
    objc_copyWeak(v54, &location);
    id v8 = v7;
    id v52 = v8;
    id v9 = v6;
    id v53 = v9;
    v54[1] = (id)a2;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    id v47[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_350;
    v47[3] = &unk_1E6B97F40;
    objc_copyWeak(v50, &location);
    id v11 = v8;
    id v48 = v11;
    id v12 = v9;
    id v49 = v12;
    v50[1] = (id)a2;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v47);
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_351;
    v37[3] = &unk_1E6B97F68;
    objc_copyWeak(v45, &location);
    id v14 = v11;
    id v38 = v14;
    id v15 = v12;
    id v39 = v15;
    v45[1] = (id)a2;
    id v16 = v10;
    id v40 = v16;
    id v17 = v13;
    id v41 = v17;
    __int16 v43 = v46;
    uint64_t v44 = v55;
    id v42 = v31;
    [(SMInitiatorCacheManager *)self setDeviceStatusReturnBlock:v37];
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v19 = v16;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v61 = v20;
      __int16 v62 = 2112;
      id v63 = v22;
      __int16 v64 = 2112;
      id v65 = v23;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching device status", buf, 0x20u);
    }
    if ([(SMInitiatorCacheManager *)self wifiStrength])
    {
      uint64_t v24 = [(SMInitiatorCacheManager *)self deviceStatusReturnBlock];
      (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, 2);
    }
    else
    {
      [(SMInitiatorCacheManager *)self setWifiLinkQualityFetchInProgress:1];
      uint64_t v24 = [(SMInitiatorCacheManager *)self queue];
      dispatch_after(when, (dispatch_queue_t)v24, v19);
    }

    if ([(SMInitiatorCacheManager *)self cellularStrength])
    {
      uint64_t v26 = [(SMInitiatorCacheManager *)self deviceStatusReturnBlock];
      (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v26, 3);
    }
    else
    {
      [(SMInitiatorCacheManager *)self setCellularLinkQualityFetchInProgress:1];
      uint64_t v26 = [(SMInitiatorCacheManager *)self queue];
      dispatch_after(when, (dispatch_queue_t)v26, v17);
    }

    id v27 = [(SMInitiatorCacheManager *)self batteryManager];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_354;
    v32[3] = &unk_1E6B97FB8;
    objc_copyWeak(v36, &location);
    id v28 = v14;
    id v33 = v28;
    id v29 = v15;
    v36[1] = (id)a2;
    id v34 = v29;
    long long v35 = v55;
    [v27 fetchCurrentBatteryPercent:v32];

    objc_destroyWeak(v36);
    objc_destroyWeak(v45);
    _Block_object_dispose(v46, 8);

    objc_destroyWeak(v50);
    objc_destroyWeak(v54);

    _Block_object_dispose(v55, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v55 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v55, 2u);
    }
  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v12, 0x20u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D9BFA000, (os_log_t)v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,wifiDeviceStatusTimeoutBlock timeout fired", (uint8_t *)&v12, 0x20u);
  }
  id v8 = [WeakRetained deviceStatusReturnBlock];

  if (v8)
  {
    uint64_t v4 = [WeakRetained deviceStatusReturnBlock];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 2);
LABEL_8:
  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_350(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v12, 0x20u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D9BFA000, (os_log_t)v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cellularDeviceStatusTimeoutBlock timeout fired", (uint8_t *)&v12, 0x20u);
  }
  id v8 = [WeakRetained deviceStatusReturnBlock];

  if (v8)
  {
    uint64_t v4 = [WeakRetained deviceStatusReturnBlock];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 3);
LABEL_8:
  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_351(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138412802;
      id v28 = v8;
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      __int16 v31 = 2112;
      long long v32 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deviceStatusReturnBlock, object has been cleaned up", buf, 0x20u);
    }
    goto LABEL_19;
  }
  if (a2 == 3)
  {
    if (![WeakRetained cellularLinkQualityFetchInProgress]) {
      goto LABEL_11;
    }
    [v5 setCellularLinkQualityFetchInProgress:0];
    uint64_t v6 = (dispatch_block_t *)(a1 + 56);
    goto LABEL_10;
  }
  if (a2 == 2 && [WeakRetained wifiLinkQualityFetchInProgress])
  {
    [v5 setWifiLinkQualityFetchInProgress:0];
    uint64_t v6 = (dispatch_block_t *)(a1 + 48);
LABEL_10:
    dispatch_block_cancel(*v6);
  }
LABEL_11:
  if (++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 3)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F99858]);
    uint64_t v26 = [v5 initiatorContact];
    int v12 = [v26 cache];
    uint64_t v13 = [v12 deviceStatus];
    __int16 v14 = [v13 identifier];
    uint64_t v15 = v14;
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v17 = [v5 cellularStrength];
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v7 = [v11 initWithIdentifier:v15 batteryRemaining:v16 cellularStrength:v17 date:v18 wifiStrength:[v5 wifiStrength]];

    if (!v14) {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v5 sessionUUID];
      uint64_t v21 = *(void *)(a1 + 40);
      id v22 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v23 = [v5 wifiStrength];
      int v24 = [v5 cellularStrength];
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 138413570;
      id v28 = v20;
      __int16 v29 = 2112;
      uint64_t v30 = v21;
      __int16 v31 = 2112;
      long long v32 = v22;
      __int16 v33 = 1024;
      int v34 = v23;
      __int16 v35 = 1024;
      int v36 = v24;
      __int16 v37 = 1024;
      int v38 = v25;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,deviceStatusReturnBlock,wifistrength:%d,cellularstrength:%d,batteryRemaining:%d", buf, 0x32u);
    }
    [v5 setDeviceStatusReturnBlock:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_19:
  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_354(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_355;
    block[3] = &unk_1E6B97F90;
    uint64_t v15 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 64);
    int v19 = a2;
    uint64_t v9 = *(void *)(a1 + 48);
    id v16 = v7;
    uint64_t v17 = v9;
    uint64_t v18 = v8;
    dispatch_async(v6, block);

    uint64_t v10 = v15;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", buf, 0x20u);
    }
  }
}

void __60__SMInitiatorCacheManager__fetchDeviceStatusWithCompletion___block_invoke_355(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) sessionUUID];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v6 = *(_DWORD *)(a1 + 64);
    int v9 = 138413058;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Updating battery percent %d", (uint8_t *)&v9, 0x26u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(int *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) deviceStatusReturnBlock];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) deviceStatusReturnBlock];
    v8[2](v8, 1);
  }
}

- (BOOL)_isEligibleForCacheUpdateAndPerformRecoveryIfNecessary
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F99880] zelkovaHandoffEnabled])
  {
    uint64_t v4 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
    int v5 = [v4 isActiveSessionDetailsOutOfSync];

    if (v5)
    {
      int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v27 = (objc_class *)objc_opt_class();
        id v28 = NSStringFromClass(v27);
        __int16 v29 = NSStringFromSelector(a2);
        int v33 = 138412802;
        int v34 = v26;
        __int16 v35 = 2112;
        int v36 = v28;
        __int16 v37 = 2112;
        int v38 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@, activeSessionDetails is out of sync", (uint8_t *)&v33, 0x20u);
      }
      id v7 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
      [v7 updateActiveSessionDetailsFromCloudKitRecord];
    }
    uint64_t v8 = [(SMInitiatorCacheManager *)self messagingService];
    int v9 = [v8 deviceIdentifier];

    uint64_t v10 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
    __int16 v11 = [(SMInitiatorCacheManager *)self sessionManagerState];
    char v12 = [v10 isEligibleForCacheUpdateForCurrentDeviceIdentifier:v9 sessionManagerState:v11];

    if (v12)
    {
      __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      __int16 v14 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
      __int16 v15 = [v14 getLatestActiveSessionDetails];
      int v33 = 136315394;
      int v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
      __int16 v35 = 2112;
      int v36 = v15;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, activeSessionDetails, %@, isEligible YES", (uint8_t *)&v33, 0x16u);
    }
    else
    {
      int v16 = [(SMInitiatorCacheManager *)self sessionManagerState];
      uint64_t v17 = [v16 configuration];
      __int16 v15 = [v17 sessionID];

      uint64_t v18 = [(SMInitiatorCacheManager *)self sessionManagerState];
      int v19 = [v18 activePairedDeviceIdentifier];

      id v20 = objc_alloc(MEMORY[0x1E4F999A8]);
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      __int16 v22 = [MEMORY[0x1E4F29128] UUID];
      __int16 v13 = [v20 initWithDate:v21 messageID:v22 sessionID:v15 deviceToRequest:v19];

      uint64_t v23 = [(SMInitiatorCacheManager *)self messagingService];
      [v23 sendIDSMessageToPairedDevice:v13 completion:&__block_literal_global_360];

      __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        uint64_t v30 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
        __int16 v31 = [v30 getLatestActiveSessionDetails];
        long long v32 = [(SMInitiatorCacheManager *)self sessionManagerState];
        int v33 = 136315650;
        int v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
        __int16 v35 = 2112;
        int v36 = v31;
        __int16 v37 = 2112;
        int v38 = v32;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "%s, Error-Mismatch activeSessionDetails, %@, sessionManagerState: %@, current device thinks its active and try to perform cacheUpdate; have requested stateUpdate in order to become non-active. Stop cacheUpdate and cacheUpload.",
          (uint8_t *)&v33,
          0x20u);
      }
    }

    goto LABEL_15;
  }
  int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  char v12 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v33 = 136315138;
    int v34 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]";
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s: Zelkova Handoff is not enabled; skip the check for cache upload eligibility; return YES",
      (uint8_t *)&v33,
      0xCu);
  }
LABEL_16:

  return v12;
}

void __81__SMInitiatorCacheManager__isEligibleForCacheUpdateAndPerformRecoveryIfNecessary__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[SMInitiatorCacheManager _isEligibleForCacheUpdateAndPerformRecoveryIfNecessary]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, sent state update request message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)_updateInitiatorContactWithConversation:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", v6, 2u);
    }
  }
}

- (void)_uploadCache:(id)a3 completion:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (v8)
  {
    aSelector = a2;
    if (!v7)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v72 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v73 = (objc_class *)objc_opt_class();
        id v74 = NSStringFromClass(v73);
        uint64_t v75 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v100 = v72;
        __int16 v101 = 2112;
        id v102 = v74;
        __int16 v103 = 2112;
        id v104 = v75;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no cache to upload", buf, 0x20u);
      }
      goto LABEL_6;
    }
    int v9 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v10 = [v9 shouldBeCleanedUpDate];

    if (v10)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v13 = (objc_class *)objc_opt_class();
        __int16 v14 = NSStringFromClass(v13);
        __int16 v15 = NSStringFromSelector(a2);
        int v16 = [v7 identifier];
        *(_DWORD *)buf = 138413058;
        v100 = v12;
        __int16 v101 = 2112;
        id v102 = v14;
        __int16 v103 = 2112;
        id v104 = v15;
        __int16 v105 = 2112;
        uint64_t v106 = (uint64_t)v16;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up,cache identifier,%@", buf, 0x2Au);
      }
LABEL_6:

      v8[2](v8);
      goto LABEL_35;
    }
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x2020000000;
    v98[3] = 0;
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke;
    v95[3] = &unk_1E6B97FE0;
    v97 = v98;
    uint64_t v96 = v8;
    uint64_t v18 = (void *)MEMORY[0x1E016DB00](v95);
    int v19 = [(SMInitiatorCacheManager *)self _scheduleKeyReleaseWithCompletion:v18];
    id v20 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v21 = [v20 scheduledSendExpiryDate];
    __int16 v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (void *)v21;
    }
    else {
      uint64_t v23 = v19;
    }
    id v80 = v23;

    __int16 v24 = [(SMInitiatorCacheManager *)self xpcActivityManager];
    uint64_t v25 = [v24 runningTask];
    if (v25)
    {
      uint64_t v26 = [(SMInitiatorCacheManager *)self xpcActivityManager];
      id v27 = [v26 runningTask];
      id v28 = [v27 identifier];
      __int16 v29 = [(SMInitiatorCacheManager *)self getXpcActivityIdentifier];
      BOOL v30 = v28 == v29;

      if (v30)
      {
        __int16 v31 = [SMCloudKitQosOptions alloc];
        long long v32 = [(SMInitiatorCacheManager *)self xpcActivityManager];
        int v33 = [v32 runningTask];
        int v34 = [v33 activity];
        __int16 v35 = [(SMCloudKitQosOptions *)v31 initWithDefaultQos:0 masqueradeBundleID:0 xpcActivity:v34];

LABEL_21:
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_2;
        v92[3] = &unk_1E6B90DD0;
        v92[4] = self;
        __int16 v94 = aSelector;
        int v36 = v18;
        id v93 = v36;
        [(SMInitiatorCacheManager *)self _writeActiveSessionDetails:2 qos:v35 completion:v92];
        uint64_t v79 = v35;
        uint64_t v82 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v37 = (objc_class *)objc_opt_class();
        uint64_t v81 = NSStringFromClass(v37);
        int v38 = [(SMInitiatorCacheManager *)self queue];
        BOOL v39 = +[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:v38];

        if (v39)
        {
          id v40 = [v7 outputToDictionary];
          id v78 = +[SMCryptoUtilities getSerializedJsonData:v40];

          id v41 = [v78 md5];
          uint64_t v76 = [v41 hexString];

          id v42 = [(SMInitiatorCacheManager *)self initiatorContact];
          __int16 v43 = [v42 safetyCacheKey];
          __int16 v83 = +[SMCryptoUtilities encryptSafetyCache:v78 withKey:v43];

          uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v45 = [(SMInitiatorCacheManager *)self sessionUUID];
            uint64_t v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            id v48 = (id)objc_claimAutoreleasedReturnValue();
            id v49 = [v7 identifier];
            uint64_t v50 = [v7 identifierHash];
            *(_DWORD *)buf = 138413314;
            v100 = v45;
            __int16 v101 = 2112;
            id v102 = v47;
            __int16 v103 = 2112;
            id v104 = v48;
            __int16 v105 = 2112;
            uint64_t v106 = (uint64_t)v49;
            __int16 v107 = 2048;
            uint64_t v108 = v50;
            _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache identifier,%@,hash,%lu", buf, 0x34u);
          }
          id v51 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            id v52 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v53 = (objc_class *)objc_opt_class();
            NSStringFromClass(v53);
            id v54 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            id v55 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v56 = [v83 length];
            +[RTRuntime footprint];
            *(_DWORD *)buf = 138413314;
            v100 = v52;
            __int16 v101 = 2112;
            id v102 = v54;
            __int16 v103 = 2112;
            id v104 = v55;
            __int16 v105 = 2048;
            uint64_t v106 = v56;
            __int16 v107 = 2048;
            uint64_t v108 = v57;
            _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache size,%lu, current footprint, %.4f MB", buf, 0x34u);
          }
          unint64_t v58 = [v83 length];
          id v59 = [(SMInitiatorCacheManager *)self initiatorContact];
          [v59 maxCacheSize];
          BOOL v61 = v60 < (double)v58;

          if (v61)
          {
            unint64_t v62 = [v83 length];
            id v63 = [(SMInitiatorCacheManager *)self initiatorContact];
            [v63 setMaxCacheSize:(double)v62];

            [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
          }
          __int16 v64 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
          BOOL v65 = v64 == 0;

          if (v65)
          {
            uint64_t v66 = objc_alloc_init(SMCAMetricCacheUpdate);
            [(SMInitiatorCacheManager *)self setCaMetricCacheUpdate:v66];
          }
          unint64_t v67 = [v83 length];
          __int16 v68 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
          [v68 setCacheSize:(double)v67];

          objc_initWeak((id *)buf, self);
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_363;
          v85[3] = &unk_1E6B98008;
          objc_copyWeak(v91, (id *)buf);
          id v86 = v82;
          id v87 = v81;
          v91[1] = (id)aSelector;
          BOOL v90 = v36;
          id v88 = v7;
          id v69 = v77;
          id v89 = v69;
          [(SMInitiatorCacheManager *)self updateSafetyCacheWithRetry:2 data:v83 cacheReleaseTime:v80 qos:v79 completion:v85];

          objc_destroyWeak(v91);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          id v70 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            id v71 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            v100 = v82;
            __int16 v101 = 2112;
            id v102 = v81;
            __int16 v103 = 2112;
            id v104 = v71;
            _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed regulatory domain check", buf, 0x20u);
          }
          v36[2](v36);
        }

        _Block_object_dispose(v98, 8);
        goto LABEL_35;
      }
    }
    else
    {
    }
    __int16 v35 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
    goto LABEL_21;
  }
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
  }

LABEL_35:
}

uint64_t __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke(uint64_t result)
{
  if (++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) == 3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) sessionUUID];
      uint64_t v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v12 = 138413058;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) sessionUUID];
    id v11 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v11);
    __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v12 = 138412802;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Active Session Details stored successfully", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__SMInitiatorCacheManager__uploadCache_completion___block_invoke_363(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _processUploadCacheResponseForCache:*(void *)(a1 + 48) hashString:*(void *)(a1 + 56) success:a2 error:v5];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v12 = 138413314;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before update safety cache response,success,%d,error,%@", (uint8_t *)&v12, 0x30u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_updateCacheDataForNonActiveDeviceWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  if (v5)
  {
    int v6 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v7 = [v6 shouldBeCleanedUpDate];

    if (v7)
    {
      uint64_t v8 = objc_opt_new();
      v5[2](v5, v8);
    }
    else
    {
      *(void *)uint64_t v25 = 0;
      uint64_t v26 = v25;
      uint64_t v27 = 0x3032000000;
      id v28 = __Block_byref_object_copy__81;
      __int16 v29 = __Block_byref_object_dispose__81;
      id v30 = 0;
      uint64_t v10 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v11 = [v10 cache];
      uint64_t v12 = [v11 copy];
      uint64_t v13 = (void *)*((void *)v26 + 5);
      *((void *)v26 + 5) = v12;

      if (!*((void *)v26 + 5))
      {
        __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          int v19 = [(SMInitiatorCacheManager *)self initiatorContact];
          *(_DWORD *)buf = 138413058;
          long long v32 = v15;
          __int16 v33 = 2112;
          id v34 = v17;
          __int16 v35 = 2112;
          id v36 = v18;
          __int16 v37 = 2112;
          int v38 = v19;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,default initializing cache due to failure to extract existing initiator contact data,%@", buf, 0x2Au);
        }
        uint64_t v20 = objc_opt_new();
        id v21 = (void *)*((void *)v26 + 5);
        *((void *)v26 + 5) = v20;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __76__SMInitiatorCacheManager__updateCacheDataForNonActiveDeviceWithCompletion___block_invoke;
      v22[3] = &unk_1E6B97EA8;
      __int16 v24 = v25;
      uint64_t v23 = v5;
      [(SMInitiatorCacheManager *)self _fetchDeviceStatusWithCompletion:v22];

      _Block_object_dispose(v25, 8);
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v25, 2u);
    }
  }
}

uint64_t __76__SMInitiatorCacheManager__updateCacheDataForNonActiveDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDeviceStatus:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_uploadCacheForNonActiveDevice:(id)a3 completion:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (v8)
  {
    if (!v7)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = [(SMInitiatorCacheManager *)self sessionUUID];
        unint64_t v58 = (objc_class *)objc_opt_class();
        id v59 = NSStringFromClass(v58);
        double v60 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v70 = v57;
        __int16 v71 = 2112;
        id v72 = v59;
        __int16 v73 = 2112;
        id v74 = v60;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no cache to upload", buf, 0x20u);
      }
      goto LABEL_6;
    }
    uint64_t v9 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v10 = [v9 shouldBeCleanedUpDate];

    if (v10)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(SMInitiatorCacheManager *)self sessionUUID];
        uint64_t v13 = (objc_class *)objc_opt_class();
        __int16 v14 = NSStringFromClass(v13);
        uint64_t v15 = NSStringFromSelector(a2);
        __int16 v16 = [v7 identifier];
        *(_DWORD *)buf = 138413058;
        id v70 = v12;
        __int16 v71 = 2112;
        id v72 = v14;
        __int16 v73 = 2112;
        id v74 = v15;
        __int16 v75 = 2112;
        uint64_t v76 = (uint64_t)v16;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,initiatorContact should be cleaned up,cache identifier,%@", buf, 0x2Au);
      }
LABEL_6:

      v8[2](v8);
      goto LABEL_27;
    }
    id v18 = [(SMInitiatorCacheManager *)self xpcActivityManager];
    int v19 = [v18 runningTask];
    if (v19)
    {
      uint64_t v20 = [(SMInitiatorCacheManager *)self xpcActivityManager];
      id v21 = [v20 runningTask];
      uint64_t v22 = [v21 identifier];
      uint64_t v23 = [(SMInitiatorCacheManager *)self getXpcActivityIdentifier];

      if (v22 == v23)
      {
        __int16 v24 = [SMCloudKitQosOptions alloc];
        uint64_t v25 = [(SMInitiatorCacheManager *)self xpcActivityManager];
        uint64_t v26 = [v25 runningTask];
        uint64_t v27 = [v26 activity];
        unint64_t v62 = [(SMCloudKitQosOptions *)v24 initWithDefaultQos:0 masqueradeBundleID:0 xpcActivity:v27];

LABEL_18:
        id v28 = [v7 outputToDictionary];
        id v63 = +[SMCryptoUtilities getSerializedJsonData:v28];

        __int16 v29 = [v63 md5];
        BOOL v61 = [v29 hexString];

        id v30 = [(SMInitiatorCacheManager *)self initiatorContact];
        __int16 v31 = [v30 safetyCacheKey];
        long long v32 = +[SMCryptoUtilities encryptSafetyCache:v63 withKey:v31];

        __int16 v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v35 = (objc_class *)objc_opt_class();
          id v36 = NSStringFromClass(v35);
          __int16 v37 = NSStringFromSelector(a2);
          int v38 = [v7 identifier];
          *(_DWORD *)buf = 138413314;
          id v70 = v34;
          __int16 v71 = 2112;
          id v72 = v36;
          __int16 v73 = 2112;
          id v74 = v37;
          __int16 v75 = 2112;
          uint64_t v76 = (uint64_t)v38;
          __int16 v77 = 2048;
          uint64_t v78 = [v7 identifierHash];
          _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache identifier,%@,hash,%lu", buf, 0x34u);
        }
        uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [(SMInitiatorCacheManager *)self sessionUUID];
          id v41 = (objc_class *)objc_opt_class();
          id v42 = NSStringFromClass(v41);
          __int16 v43 = NSStringFromSelector(a2);
          uint64_t v44 = [v32 length];
          +[RTRuntime footprint];
          *(_DWORD *)buf = 138413314;
          id v70 = v40;
          __int16 v71 = 2112;
          id v72 = v42;
          __int16 v73 = 2112;
          id v74 = v43;
          __int16 v75 = 2048;
          uint64_t v76 = v44;
          __int16 v77 = 2048;
          uint64_t v78 = v45;
          _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,uploading cache,cache size,%lu, current footprint, %.4f MB", buf, 0x34u);
        }
        unint64_t v46 = [v32 length];
        id v47 = [(SMInitiatorCacheManager *)self initiatorContact];
        [v47 maxCacheSize];
        LODWORD(v46) = v48 < (double)v46;

        if (v46)
        {
          unint64_t v49 = [v32 length];
          uint64_t v50 = [(SMInitiatorCacheManager *)self initiatorContact];
          [v50 setMaxCacheSize:(double)v49];

          [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
        }
        id v51 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        BOOL v52 = v51 == 0;

        if (v52)
        {
          id v53 = objc_alloc_init(SMCAMetricCacheUpdate);
          [(SMInitiatorCacheManager *)self setCaMetricCacheUpdate:v53];
        }
        unint64_t v54 = [v32 length];
        id v55 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v55 setCacheSize:(double)v54];

        objc_initWeak((id *)buf, self);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __69__SMInitiatorCacheManager__uploadCacheForNonActiveDevice_completion___block_invoke;
        id v64[3] = &unk_1E6B98030;
        objc_copyWeak(v68, (id *)buf);
        v64[4] = self;
        v68[1] = (id)a2;
        unint64_t v67 = v8;
        id v65 = v7;
        id v56 = v61;
        id v66 = v56;
        [(SMInitiatorCacheManager *)self updateNonActiveSafetyCacheWithRetry:2 data:v32 qos:v62 completion:v64];

        objc_destroyWeak(v68);
        objc_destroyWeak((id *)buf);

        goto LABEL_27;
      }
    }
    else
    {
    }
    unint64_t v62 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
    goto LABEL_18;
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
  }

LABEL_27:
}

void __69__SMInitiatorCacheManager__uploadCacheForNonActiveDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _processUploadCacheResponseForCache:*(void *)(a1 + 40) hashString:*(void *)(a1 + 48) success:a2 error:v5];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [0 sessionUUID];
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v13 = 138413314;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 1024;
      int v20 = a2;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before update safety cache response,success,%d,error,%@", (uint8_t *)&v13, 0x30u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)updateSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 cacheReleaseTime:(id)a5 qos:(id)a6 completion:(id)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v38 = v14;
  uint64_t v39 = v15;
  if (v16)
  {
    if (v13 && v14 && v15)
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      __int16 v19 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v20 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
      objc_initWeak((id *)location, self);
      __int16 v21 = [(SMInitiatorCacheManager *)self activeSessionZone];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __91__SMInitiatorCacheManager_updateSafetyCacheWithRetry_data_cacheReleaseTime_qos_completion___block_invoke;
      v40[3] = &unk_1E6B98058;
      objc_copyWeak(v48, (id *)location);
      id v22 = v19;
      id v41 = v22;
      uint64_t v23 = v18;
      id v42 = v23;
      v48[1] = (id)a2;
      id v47 = v16;
      v48[2] = (id)a3;
      id v24 = v20;
      id v43 = v24;
      id v44 = v13;
      id v45 = v38;
      id v46 = v39;
      [v21 updateSafetyCacheWithData:v44 cacheReleaseTime:v45 qos:v46 completion:v40];

      objc_destroyWeak(v48);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v34 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v35 = (objc_class *)objc_opt_class();
        id v36 = NSStringFromClass(v35);
        __int16 v37 = NSStringFromSelector(a2);
        *(_DWORD *)id location = 138413570;
        *(void *)&location[4] = v34;
        __int16 v52 = 2112;
        id v53 = v36;
        __int16 v54 = 2112;
        id v55 = v37;
        __int16 v56 = 2112;
        id v57 = v13;
        __int16 v58 = 2112;
        id v59 = v38;
        __int16 v60 = 2112;
        BOOL v61 = v39;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,safetyCacheData,%@,cacheReleaseTime,%@,qos,%@", location, 0x3Eu);
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v49 = *MEMORY[0x1E4F28568];
      uint64_t v27 = NSString;
      id v28 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      __int16 v31 = NSStringFromSelector(a2);
      long long v32 = [v27 stringWithFormat:@"#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters", v28, v30, v31];
      uint64_t v50 = v32;
      __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v23 = [v26 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v33];

      (*((void (**)(id, void, NSObject *))v16 + 2))(v16, 0, v23);
    }
  }
  else
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }
}

void __91__SMInitiatorCacheManager_updateSafetyCacheWithRetry_data_cacheReleaseTime_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v30 = 138412802;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during safety cache update", (uint8_t *)&v30, 0x20u);
    }
    id v14 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    goto LABEL_21;
  }
  if (!v4)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v30 = 138412802;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      __int16 v35 = v17;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache data updated successfully", (uint8_t *)&v30, 0x20u);
    }
    goto LABEL_20;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 96));
    int v30 = 138413058;
    uint64_t v31 = v18;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    __int16 v35 = v12;
    __int16 v36 = 2112;
    id v37 = v4;
    int v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with non recoverable error %@";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v30, 0x2Au);
    goto LABEL_19;
  }
  if (*(uint64_t *)(a1 + 104) <= 0)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 96));
    int v30 = 138413058;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    __int16 v35 = v12;
    __int16 v36 = 2112;
    id v37 = v4;
    int v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data after retries with recoverable error %@";
    goto LABEL_18;
  }
  int v6 = *(void **)(a1 + 48);
  id v7 = [WeakRetained cacheUploadInProgress];

  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v30 = 138412802;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      __int16 v35 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache update timed out", (uint8_t *)&v30, 0x20u);
LABEL_19:
    }
LABEL_20:

    id v14 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_21:
    v14();
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    id v28 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v29 = *(void *)(a1 + 104);
    int v30 = 138413314;
    uint64_t v31 = v26;
    __int16 v32 = 2112;
    uint64_t v33 = v27;
    __int16 v34 = 2112;
    __int16 v35 = v28;
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 1024;
    int v39 = v29;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v30, 0x30u);
  }
  [WeakRetained updateSafetyCacheWithRetry:*(void *)(a1 + 104) - 1 data:*(void *)(a1 + 56) cacheReleaseTime:*(void *)(a1 + 64) qos:*(void *)(a1 + 72) completion:*(void *)(a1 + 80)];
LABEL_22:
}

- (void)updateNonActiveSafetyCacheWithRetry:(int64_t)a3 data:(id)a4 qos:(id)a5 completion:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v35 = v12;
  if (v13)
  {
    if (v11 && v12)
    {
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v17 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
      objc_initWeak((id *)location, self);
      uint64_t v18 = [(SMInitiatorCacheManager *)self activeSessionZone];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      id v36[2] = __83__SMInitiatorCacheManager_updateNonActiveSafetyCacheWithRetry_data_qos_completion___block_invoke;
      v36[3] = &unk_1E6B98080;
      objc_copyWeak(v43, (id *)location);
      id v19 = v16;
      id v37 = v19;
      int v20 = v15;
      __int16 v38 = v20;
      v43[1] = (id)a2;
      id v42 = v13;
      id v43[2] = (id)a3;
      id v21 = v17;
      id v39 = v21;
      id v40 = v11;
      id v41 = v35;
      [v18 updateSafetyCacheRecordWithData:v40 qos:v41 completion:v36];

      objc_destroyWeak(v43);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v32 = (objc_class *)objc_opt_class();
        uint64_t v33 = NSStringFromClass(v32);
        __int16 v34 = NSStringFromSelector(a2);
        *(_DWORD *)id location = 138413314;
        *(void *)&location[4] = v31;
        __int16 v47 = 2112;
        double v48 = v33;
        __int16 v49 = 2112;
        uint64_t v50 = v34;
        __int16 v51 = 2112;
        id v52 = v11;
        __int16 v53 = 2112;
        __int16 v54 = v35;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,safetyCacheData,%@,qos,%@", location, 0x34u);
      }
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F28568];
      uint64_t v24 = NSString;
      uint64_t v25 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      id v28 = NSStringFromSelector(a2);
      uint64_t v29 = [v24 stringWithFormat:@"#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters", v25, v27, v28];
      id v45 = v29;
      int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      int v20 = [v23 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v30];

      (*((void (**)(id, void, NSObject *))v13 + 2))(v13, 0, v20);
    }
  }
  else
  {
    int v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }
}

void __83__SMInitiatorCacheManager_updateNonActiveSafetyCacheWithRetry_data_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v30 = 138412802;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during safety cache update", (uint8_t *)&v30, 0x20u);
    }
    id v14 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_21;
  }
  if (!v4)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v30 = 138412802;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      __int16 v35 = v17;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache data updated successfully", (uint8_t *)&v30, 0x20u);
    }
    goto LABEL_20;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 88));
    int v30 = 138413058;
    uint64_t v31 = v18;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    __int16 v35 = v12;
    __int16 v36 = 2112;
    id v37 = v4;
    int v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with non recoverable error %@";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v30, 0x2Au);
    goto LABEL_19;
  }
  if (*(uint64_t *)(a1 + 96) <= 0)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 88));
    int v30 = 138413058;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    __int16 v35 = v12;
    __int16 v36 = 2112;
    id v37 = v4;
    int v20 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data after retries with recoverable error %@";
    goto LABEL_18;
  }
  int v6 = *(void **)(a1 + 48);
  id v7 = [WeakRetained cacheUploadInProgress];

  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v30 = 138412802;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      __int16 v35 = v12;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,safety cache update timed out", (uint8_t *)&v30, 0x20u);
LABEL_19:
    }
LABEL_20:

    id v14 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_21:
    v14();
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    id v28 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v29 = *(void *)(a1 + 96);
    int v30 = 138413314;
    uint64_t v31 = v26;
    __int16 v32 = 2112;
    uint64_t v33 = v27;
    __int16 v34 = 2112;
    __int16 v35 = v28;
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 1024;
    int v39 = v29;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to update safety cache data with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v30, 0x30u);
  }
  [WeakRetained updateNonActiveSafetyCacheWithRetry:*(void *)(a1 + 96) - 1 data:*(void *)(a1 + 56) qos:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_22:
}

- (void)_processUploadCacheResponseForCache:(id)a3 hashString:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    id v14 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v15 = [v14 numCacheUpdates] + 1;
    uint64_t v16 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v16 setNumCacheUpdates:v15];

    [(SMInitiatorCacheManager *)self submitCacheUpdateCAMetricForCache:v11 success:v7 error:v13];
    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    uint64_t v18 = v17;
    if (v7)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(SMInitiatorCacheManager *)self sessionUUID];
        int v20 = (objc_class *)objc_opt_class();
        uint64_t v21 = NSStringFromClass(v20);
        uint64_t v22 = NSStringFromSelector(a2);
        int v59 = 138412802;
        __int16 v60 = v19;
        __int16 v61 = 2112;
        uint64_t v62 = v21;
        __int16 v63 = 2112;
        __int16 v64 = v22;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully uploaded cache", (uint8_t *)&v59, 0x20u);
      }
      uint64_t v23 = [(SMInitiatorCacheManager *)self initiatorContact];
      uint64_t v24 = [v23 numberOfSuccessfulCacheUpdates] + 1;
      uint64_t v25 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v25 setNumberOfSuccessfulCacheUpdates:v24];

      uint64_t v26 = [(SMInitiatorCacheManager *)self initiatorContact];
      uint64_t v27 = [v26 syncDate];

      if (v27)
      {
        id v28 = [(SMInitiatorCacheManager *)self initiatorContact];
        uint64_t v29 = [v28 syncDate];
        [v29 timeIntervalSinceNow];
        double v31 = -v30;

        __int16 v32 = [(SMInitiatorCacheManager *)self initiatorContact];
        [v32 maxTimeBetweenCacheUpdates];
        double v34 = v33;

        if (v34 < v31)
        {
          __int16 v35 = [(SMInitiatorCacheManager *)self initiatorContact];
          [v35 setMaxTimeBetweenCacheUpdates:v31];
        }
      }
      __int16 v36 = [v11 locationsDuringSession];
      unint64_t v37 = [v36 count];
      __int16 v38 = [(SMInitiatorCacheManager *)self initiatorContact];
      unint64_t v39 = [v38 maxLocationsInTrace];

      if (v37 > v39)
      {
        uint64_t v40 = [v11 locationsDuringSession];
        uint64_t v41 = [v40 count];
        id v42 = [(SMInitiatorCacheManager *)self initiatorContact];
        [v42 setMaxLocationsInTrace:v41];
      }
      id v43 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v44 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v44 setSyncDate:v43];

      id v45 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v45 setPhoneCache:v11];

      [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
      [(SMInitiatorCacheManager *)self notifyObserversSafetyCacheDidUpdate];
      [(SMInitiatorCacheManager *)self _sendCacheUpdatedMessage];
      id v46 = [(SMInitiatorCacheManager *)self initiatorContact];
      __int16 v47 = [v46 phoneCache];
      double v48 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v49 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
      [v47 logCacheForSessionID:v48 role:@"Initiator" deviceType:@"phone" transaction:v49 hashString:v12];

      uint64_t v50 = [(SMInitiatorCacheManager *)self initiatorContact];
      __int16 v51 = [v50 watchCache];
      id v52 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v53 = [(SMInitiatorCacheManager *)self cacheUploadInProgress];
      [v51 logCacheForSessionID:v52 role:@"Initiator" deviceType:@"watch" transaction:v53 hashString:v12];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v55 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v56 = (objc_class *)objc_opt_class();
        id v57 = NSStringFromClass(v56);
        __int16 v58 = NSStringFromSelector(a2);
        int v59 = 138413058;
        __int16 v60 = v55;
        __int16 v61 = 2112;
        uint64_t v62 = v57;
        __int16 v63 = 2112;
        __int16 v64 = v58;
        __int16 v65 = 2112;
        id v66 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to upload cache with error %@", (uint8_t *)&v59, 0x2Au);
      }
      [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    }
  }
  else
  {
    __int16 v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v59) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cache", (uint8_t *)&v59, 2u);
    }
  }
}

- (BOOL)_shouldScheduleKeyReleaseMessage
{
  uint64_t v2 = [(SMInitiatorCacheManager *)self sessionManagerState];
  unint64_t v3 = [v2 sessionState];

  return (v3 < 0xF) & (0x4384u >> v3);
}

- (BOOL)_isKeyReleaseScheduled
{
  uint64_t v2 = [(SMInitiatorCacheManager *)self initiatorContact];
  unint64_t v3 = [v2 scheduledSendExpiryDate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (double)_scheduledSendTimeAdvance
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsSafetyCacheScheduledSendTimeAdvanceKey" value:&unk_1F3453938];
  [v3 doubleValue];
  double v5 = v4;

  if (v5 != 7200.0)
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v21 = 136316162;
      uint64_t v22 = "-[SMInitiatorCacheManager _scheduledSendTimeAdvance]";
      __int16 v23 = 2080;
      uint64_t v24 = "overriding scheduled send time advance";
      __int16 v25 = 2048;
      uint64_t v26 = 0x40BC200000000000;
      __int16 v27 = 2048;
      double v28 = v5;
      __int16 v29 = 2112;
      double v30 = @"RTDefaultsSafetyCacheScheduledSendTimeAdvanceKey";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v21, 0x34u);
    }
  }
  BOOL v7 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsSafetyCacheScheduledSendTimeAdvancePadding" value:&unk_1F3453948];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 != 1800.0)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v21 = 136316162;
      uint64_t v22 = "-[SMInitiatorCacheManager _scheduledSendTimeAdvance]";
      __int16 v23 = 2080;
      uint64_t v24 = "overriding scheduled send time padding";
      __int16 v25 = 2048;
      uint64_t v26 = 0x409C200000000000;
      __int16 v27 = 2048;
      double v28 = v9;
      __int16 v29 = 2112;
      double v30 = @"RTDefaultsSafetyCacheScheduledSendTimeAdvancePadding";
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v21, 0x34u);
    }
  }
  id v11 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v12 = [v11 configuration];
  uint64_t v13 = [v12 sessionType];

  if (v13 == 1)
  {
    id v14 = [(SMInitiatorCacheManager *)self sessionManagerState];
    uint64_t v15 = [v14 configuration];
    uint64_t v16 = [v15 time];
    __int16 v17 = [v16 timeBound];
    [v17 timeIntervalSinceNow];
    double v19 = v9 + v18;

    if (v5 < v19) {
      return v19;
    }
  }
  return v5;
}

- (id)_scheduleKeyReleaseWithCompletion:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  double v5 = (void (**)(void))a3;
  [(SMInitiatorCacheManager *)self _scheduledSendTimeAdvance];
  double v7 = v6;
  [(SMInitiatorCacheManager *)self requestTimeFromTimed];
  double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7 + v8];
  id v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7 + CFAbsoluteTimeGetCurrent()];
  if (!v5)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

    id v14 = v9;
    goto LABEL_12;
  }
  if (![(SMInitiatorCacheManager *)self _shouldScheduleKeyReleaseMessage])
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      double v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      double v19 = NSStringFromSelector(a2);
      int v20 = (void *)MEMORY[0x1E4F99950];
      int v21 = [(SMInitiatorCacheManager *)self sessionManagerState];
      uint64_t v22 = [v20 convertSessionStateToString:[v21 sessionState]];
      *(_DWORD *)buf = 138413058;
      uint64_t v54 = (uint64_t)v16;
      __int16 v55 = 2112;
      __int16 v56 = v18;
      __int16 v57 = 2112;
      __int16 v58 = v19;
      __int16 v59 = 2112;
      __int16 v60 = v22;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Scheduled Send not needed in state %@", buf, 0x2Au);
    }
    [(SMInitiatorCacheManager *)self _cancelScheduledKeyRelease];
    v5[2](v5);
    id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
LABEL_12:
    __int16 v23 = v14;
    goto LABEL_29;
  }
  uint64_t v10 = [(SMInitiatorCacheManager *)self defaultsManager];
  id v11 = [v10 objectForKey:@"RTDefaultsSafetyCacheScheduledSendEnabledKey"];

  if (v11)
  {
    if (objc_msgSend(v11, "BOOLValue", v45)) {
      int v12 = [MEMORY[0x1E4F99880] zelkovaScheduledSendEnabled];
    }
    else {
      int v12 = 0;
    }
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = NSStringFromSelector(a2);
      __int16 v29 = (void *)v28;
      double v30 = @"NO";
      if (v12) {
        double v30 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = v28;
      __int16 v55 = 2112;
      __int16 v56 = v30;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, overriding zelkova scheduled send enabled flag, BOOL value is, %@, read by defaultsManager", buf, 0x16u);
    }
  }
  else
  {
    int v12 = [MEMORY[0x1E4F99880] zelkovaScheduledSendEnabled:v45];
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = NSStringFromSelector(a2);
      uint64_t v26 = (void *)v25;
      __int16 v27 = @"NO";
      if (v12) {
        __int16 v27 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = v25;
      __int16 v55 = 2112;
      __int16 v56 = v27;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, zelkova scheduled send enabled feature flag, BOOL value is, %@", buf, 0x16u);
    }
  }

  if (v12)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v31 = (objc_class *)objc_opt_class();
    __int16 v32 = NSStringFromClass(v31);
    double v33 = [(SMInitiatorCacheManager *)self sessionUUID];
    [(SMInitiatorCacheManager *)self setScheduledSendInProgress:1];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke;
    v46[3] = &unk_1E6B98120;
    objc_copyWeak(v52, (id *)buf);
    id v34 = v33;
    id v47 = v34;
    id v35 = v32;
    id v48 = v35;
    v52[1] = (id)a2;
    __int16 v51 = v5;
    id v36 = v9;
    id v49 = v36;
    id v50 = v45;
    [(SMInitiatorCacheManager *)self _fetchLocationWithCompletion:v46];
    id v37 = v36;

    objc_destroyWeak(v52);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v39 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v42 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v54 = (uint64_t)v39;
      __int16 v55 = 2112;
      __int16 v56 = v41;
      __int16 v57 = 2112;
      __int16 v58 = v42;
      _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Scheduled Send not enabled", buf, 0x20u);
    }
    v5[2](v5);
    id v43 = v9;
  }

  __int16 v23 = v9;
LABEL_29:

  return v23;
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained _shouldScheduleKeyReleaseMessage] & 1) == 0)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        double v18 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)buf = 138412802;
        uint64_t v53 = v17;
        __int16 v54 = 2112;
        uint64_t v55 = v16;
        __int16 v56 = 2112;
        __int16 v57 = v18;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,state change during location fetch,scheduled send no longer needed", buf, 0x20u);
      }
      goto LABEL_6;
    }
    double v9 = [v8 initiatorContact];
    uint64_t v10 = [v9 shouldBeCleanedUpDate];

    if (v10)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        id v14 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)buf = 138412802;
        uint64_t v53 = v13;
        __int16 v54 = 2112;
        uint64_t v55 = v12;
        __int16 v56 = 2112;
        __int16 v57 = v14;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,session ended during location fetch", buf, 0x20u);
      }
LABEL_6:

      [v8 setScheduledSendInProgress:0];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_20;
    }
    if (!v5 || v6)
    {
      double v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = *(void *)(a1 + 32);
        uint64_t v41 = *(void *)(a1 + 40);
        id v43 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)buf = 138413058;
        uint64_t v53 = v42;
        __int16 v54 = 2112;
        uint64_t v55 = v41;
        __int16 v56 = 2112;
        __int16 v57 = v43;
        __int16 v58 = 2112;
        id v59 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched nil location or error:%@", buf, 0x2Au);
      }
      id v34 = [v8 initiatorContact];
      [v34 setLocationOfTrigger:0];
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F5CE00]);
      [v5 latitude];
      double v21 = v20;
      [v5 longitude];
      double v23 = v22;
      [v5 hunc];
      double v25 = v24;
      [v5 altitude];
      double v27 = v26;
      [v5 vunc];
      double v29 = v28;
      double v30 = [v5 date];
      uint64_t v31 = (void *)[v19 initWithLatitude:v30 longitude:1 horizontalUncertainty:v21 altitude:v23 verticalUncertainty:v25 date:v27 referenceFrame:v29 speed:0.0];
      __int16 v32 = [v8 initiatorContact];
      [v32 setLocationOfTrigger:v31];
    }
    id v35 = [v8 delegate];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_383;
    v44[3] = &unk_1E6B980F8;
    objc_copyWeak(v51, (id *)(a1 + 72));
    id v45 = *(id *)(a1 + 32);
    id v36 = *(id *)(a1 + 40);
    id v37 = *(void **)(a1 + 80);
    id v46 = v36;
    v51[1] = v37;
    id v47 = *(id *)(a1 + 48);
    id v48 = v8;
    id v49 = *(id *)(a1 + 56);
    id v50 = *(id *)(a1 + 64);
    [v35 fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:v44];

    objc_destroyWeak(v51);
  }
  else
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 40);
      uint64_t v40 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138412802;
      uint64_t v53 = v39;
      __int16 v54 = 2112;
      uint64_t v55 = v38;
      __int16 v56 = 2112;
      __int16 v57 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during location fetch", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_20:
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_383(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  double v7 = WeakRetained;
  if (WeakRetained)
  {
    double v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_384;
    block[3] = &unk_1E6B980D0;
    uint64_t v16 = v5;
    v24[1] = a2;
    id v17 = v7;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void **)(a1 + 88);
    id v21 = v9;
    v24[2] = v10;
    id v22 = *(id *)(a1 + 64);
    objc_copyWeak(v24, (id *)(a1 + 80));
    id v23 = *(id *)(a1 + 72);
    dispatch_async(v8, block);

    objc_destroyWeak(v24);
    id v11 = v16;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      double v30 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object released during fetchDeviceConfigurationLowPowerModeWarningStateWithHandler", buf, 0x20u);
    }
  }
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_384(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = *(void *)(a1 + 104);
  }
  unint64_t v3 = (uint64_t *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 48);
  double v4 = (id *)(a1 + 40);
  id v5 = [*(id *)(a1 + 40) initiatorContact];
  [v5 setTriggerDate:v2];

  id v6 = objc_alloc(MEMORY[0x1E4F998B0]);
  id v35 = [*v4 sessionUUID];
  uint64_t v34 = *v3;
  uint64_t v39 = [*v4 initiatorContact];
  double v33 = [v39 locationOfTrigger];
  id v37 = [*v4 initiatorContact];
  double v7 = [v37 safetyCacheKey];
  double v8 = [*v4 sessionManagerState];
  id v9 = [v8 configuration];
  uint64_t v10 = [v9 sessionType];
  id v11 = [*v4 sessionManagerState];
  uint64_t v12 = [v11 configuration];
  uint64_t v13 = [v12 destination];
  LOBYTE(v32) = 0;
  uint64_t v42 = [v6 initWithSessionID:v35 triggerDate:v34 locationOfTrigger:v33 triggerType:15 safetyCacheKey:v7 safetyCacheToken:0 sessionType:v10 destinationType:[v13 destinationType] isSOSTrigger:v32 lowPowerModeWarningState:v41];

  if (([*v4 _isKeyReleaseScheduled] & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 56) initiatorContact];
    [v15 setScheduledSendExpiryDate:v14];
  }
  [*(id *)(a1 + 40) _updateInitiatorContactInStore];
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 72);
    id v19 = NSStringFromSelector(*(SEL *)(a1 + 112));
    id v20 = [v42 messageID];
    id v21 = [*(id *)(a1 + 48) stringFromDate];
    *(_DWORD *)buf = 138413570;
    uint64_t v51 = v18;
    __int16 v52 = 2112;
    uint64_t v53 = v17;
    __int16 v54 = 2112;
    uint64_t v55 = v19;
    __int16 v56 = 2112;
    __int16 v57 = v20;
    __int16 v58 = 2112;
    id v59 = v21;
    __int16 v60 = 2112;
    uint64_t v61 = v42;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,scheduling Key Release for %@ with message %@", buf, 0x3Eu);
  }
  uint64_t v38 = [*(id *)(a1 + 40) messagingService];
  uint64_t v40 = [*(id *)(a1 + 40) initiatorContact];
  id v36 = [v40 scheduleSendMessageGUID];
  id v22 = [*(id *)(a1 + 40) sessionManagerState];
  id v23 = [v22 startMessageGUID];
  uint64_t v24 = *(void *)(a1 + 80);
  double v25 = [*(id *)(a1 + 40) sessionManagerState];
  uint64_t v26 = [v25 configuration];
  __int16 v27 = [v26 conversation];
  uint64_t v28 = [v42 summaryText];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  id v43[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_385;
  id v43[3] = &unk_1E6B980A8;
  objc_copyWeak(v49, (id *)(a1 + 96));
  id v44 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 72);
  double v30 = *(void **)(a1 + 112);
  id v45 = v29;
  v49[1] = v30;
  id v48 = *(id *)(a1 + 88);
  id v46 = *(id *)(a1 + 48);
  id v31 = v42;
  id v47 = v31;
  [v38 scheduleMadridMessageSendForMessage:v31 messageGUID:v36 associatedGUID:v23 sendDate:v24 toConversation:v27 summaryText:v28 completion:v43];

  objc_destroyWeak(v49);
}

void __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_385(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_386;
    v14[3] = &unk_1E6B96608;
    id v15 = v8;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    char v20 = a3;
    id v18 = v6;
    id v19 = *(id *)(a1 + 64);
    dispatch_async(v9, v14);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during message scheduling", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __61__SMInitiatorCacheManager__scheduleKeyReleaseWithCompletion___block_invoke_386(uint64_t a1)
{
  [*(id *)(a1 + 32) setScheduledSendInProgress:0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = [*(id *)(a1 + 48) messageID];
  [v2 _processScheduleKeyReleaseResponseScheduledSendDate:v3 messageID:v4 success:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 56)];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v5();
}

- (void)_processScheduleKeyReleaseResponseScheduledSendDate:(id)a3 messageID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    id v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    id v37 = "Invalid parameter not satisfying: scheduledSendDate";
LABEL_25:
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
    goto LABEL_10;
  }
  if (!v12)
  {
    id v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v37 = "Invalid parameter not satisfying: messageID";
    goto LABEL_25;
  }
  aSelector = a2;
  uint64_t v14 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v15 = [v14 numberOfMessageScheduling] + 1;
  id v16 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v16 setNumberOfMessageScheduling:v15];

  id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v18 = v17;
  if (a5)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(SMInitiatorCacheManager *)self sessionUUID];
      char v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      uint64_t v22 = NSStringFromSelector(a2);
      [v11 stringFromDate];
      v23 = id v63 = v13;
      uint64_t v24 = [(SMInitiatorCacheManager *)self initiatorContact];
      __int16 v25 = [v24 scheduleSendMessageGUID];
      *(_DWORD *)buf = 138413570;
      id v66 = v19;
      __int16 v67 = 2112;
      __int16 v68 = v21;
      __int16 v69 = 2112;
      id v70 = v22;
      __int16 v71 = 2112;
      id v72 = v12;
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v23;
      __int16 v75 = 2112;
      uint64_t v76 = v25;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,successfully scheduled Key Release message for %@ with GUID %@", buf, 0x3Eu);

      id v13 = v63;
    }

    uint64_t v26 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v26 setScheduledSendExpiryDate:v11];

    uint64_t v27 = [(SMInitiatorCacheManager *)self delegate];
    uint64_t v28 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v29 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v30 = [v29 scheduleSendMessageGUID];
    id v31 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v32 = [v31 scheduledSendExpiryDate];
    [v27 scheduledSendMessageScheduledForSessionID:v28 guid:v30 date:v32];

    double v33 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v34 = [v33 numberOfSuccessfulMessageScheduling] + 1;
    id v35 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v35 setNumberOfSuccessfulMessageScheduling:v34];

    [(SMInitiatorCacheManager *)self _updateScheduledSendFireTimer];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v54 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v55 = (objc_class *)objc_opt_class();
      __int16 v56 = NSStringFromClass(v55);
      __int16 v57 = NSStringFromSelector(a2);
      [v11 stringFromDate];
      v59 = id v58 = v13;
      *(_DWORD *)buf = 138413570;
      id v66 = v54;
      __int16 v67 = 2112;
      __int16 v68 = v56;
      __int16 v69 = 2112;
      id v70 = v57;
      __int16 v71 = 2112;
      id v72 = v12;
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v59;
      __int16 v75 = 2112;
      uint64_t v76 = v58;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,messageID:%@,failed to schedule Key Release message for %@ with error %@", buf, 0x3Eu);

      id v13 = v58;
    }

    if ([(SMInitiatorCacheManager *)self _isKeyReleaseScheduled])
    {
      uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = [(SMInitiatorCacheManager *)self sessionUUID];
        uint64_t v40 = (objc_class *)objc_opt_class();
        uint64_t v61 = NSStringFromClass(v40);
        uint64_t v41 = NSStringFromSelector(a2);
        uint64_t v62 = [(SMInitiatorCacheManager *)self initiatorContact];
        __int16 v60 = [v62 scheduleSendMessageGUID];
        uint64_t v42 = [(SMInitiatorCacheManager *)self initiatorContact];
        id v43 = [v42 scheduledSendExpiryDate];
        uint64_t v44 = [v43 stringFromDate];
        *(_DWORD *)buf = 138413314;
        id v66 = v39;
        __int16 v67 = 2112;
        __int16 v68 = v61;
        __int16 v69 = 2112;
        id v70 = v41;
        __int16 v71 = 2112;
        id v72 = v60;
        __int16 v73 = 2112;
        uint64_t v74 = v44;
        id v45 = (void *)v44;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,message %@ is still scheduled for %@", buf, 0x34u);
      }
    }
  }
  [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
  id v46 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v47 = [v46 shouldBeCleanedUpDate];
  if (v47)
  {
  }
  else
  {
    BOOL v48 = [(SMInitiatorCacheManager *)self _shouldScheduleKeyReleaseMessage];

    if (v48) {
      goto LABEL_23;
    }
  }
  id v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v51 = (objc_class *)objc_opt_class();
    __int16 v52 = NSStringFromClass(v51);
    uint64_t v53 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412802;
    id v66 = v50;
    __int16 v67 = 2112;
    __int16 v68 = v52;
    __int16 v69 = 2112;
    id v70 = v53;
    _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,state changed while scheduling message,canceling newly scheduled message and cleaning up", buf, 0x20u);
  }
  [(SMInitiatorCacheManager *)self _cancelScheduledKeyRelease];
LABEL_23:
}

- (void)_cancelScheduledKeyRelease
{
  id v5 = [(SMInitiatorCacheManager *)self sessionManagerState];
  uint64_t v3 = [v5 configuration];
  double v4 = [v3 conversation];
  [(SMInitiatorCacheManager *)self _cancelScheduledKeyReleaseForConversation:v4];
}

- (void)_cancelScheduledKeyReleaseForConversation:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SMInitiatorCacheManager *)self _stopScheduleSendCancelRetry];
  if ([(SMInitiatorCacheManager *)self _isKeyReleaseScheduled])
  {
    id v6 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v7 = [v6 scheduledSendExpiryDate];
    double v8 = (void *)MEMORY[0x1E4F1C9C8];
    [(SMInitiatorCacheManager *)self requestTimeFromTimed];
    id v9 = [v8 dateWithTimeIntervalSinceReferenceDate:x0];
    LODWORD(v8) = [v7 isBeforeDate:v9];

    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        id v12 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        uint64_t v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v47 = v12;
        __int16 v48 = 2112;
        id v49 = v14;
        __int16 v50 = 2112;
        uint64_t v51 = v15;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule send has already fired", buf, 0x20u);
      }
      id v16 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v16 setScheduledSendExpiryDate:0];

      id v17 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v18 = [v17 shouldBeCleanedUpDate];

      if (v18) {
LABEL_6:
      }
        [(SMInitiatorCacheManager *)self _cleanUpInitiatorContactLocalStore];
    }
    else
    {
      if (v11)
      {
        uint64_t v26 = [(SMInitiatorCacheManager *)self sessionUUID];
        uint64_t v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v27);
        id v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v47 = v26;
        __int16 v48 = 2112;
        id v49 = v28;
        __int16 v50 = 2112;
        uint64_t v51 = v29;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,canceling scheduled message", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      double v30 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v31 = (objc_class *)objc_opt_class();
      uint64_t v32 = NSStringFromClass(v31);
      double v33 = [(SMInitiatorCacheManager *)self initiatorContact];
      uint64_t v34 = [v33 scheduleSendMessageGUID];

      id v35 = [(SMInitiatorCacheManager *)self messagingService];
      id v36 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v37 = [v36 scheduleSendMessageGUID];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      id v41[2] = __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke;
      v41[3] = &unk_1E6B98148;
      objc_copyWeak(v45, (id *)buf);
      id v38 = v30;
      id v42 = v38;
      id v39 = v32;
      id v43 = v39;
      v45[1] = (id)a2;
      id v40 = v34;
      id v44 = v40;
      [v35 cancelMadridMessageSendForMessageGUID:v37 toConversation:v5 completion:v41];

      objc_destroyWeak(v45);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      __int16 v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v47 = v20;
      __int16 v48 = 2112;
      id v49 = v22;
      __int16 v50 = 2112;
      uint64_t v51 = v23;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,no messages to cancel, early return", buf, 0x20u);
    }
    uint64_t v24 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v25 = [v24 shouldBeCleanedUpDate];

    if (v25) {
      goto LABEL_6;
    }
  }
}

void __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v7 = WeakRetained;
  if (WeakRetained)
  {
    double v8 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke_387;
    block[3] = &unk_1E6B91328;
    uint64_t v15 = v7;
    char v17 = a2;
    id v16 = v5;
    dispatch_async(v8, block);

    id v9 = v15;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413570;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 1024;
      int v27 = a2;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released before scheduled send cancel response,GUID,%@,success,%d,error,%@", buf, 0x3Au);
    }
  }
}

uint64_t __69__SMInitiatorCacheManager__cancelScheduledKeyReleaseForConversation___block_invoke_387(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processCancelScheduledKeyReleaseResponseWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_processCancelScheduledKeyReleaseResponseWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v9 = [v8 numberOfMessageCancelling] + 1;
  uint64_t v10 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v10 setNumberOfMessageCancelling:v9];

  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v12 = v11;
  if (a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(a2);
      char v17 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v18 = [v17 scheduleSendMessageGUID];
      int v37 = 138413058;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v15;
      __int16 v41 = 2112;
      id v42 = v16;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully canceled scheduled Key Release message %@", (uint8_t *)&v37, 0x2Au);
    }
    uint64_t v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v19 setScheduledSendExpiryDate:0];

    __int16 v20 = [(SMInitiatorCacheManager *)self delegate];
    uint64_t v21 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v23 = [v22 scheduleSendMessageGUID];
    [v20 scheduledSendMessageCanceledForSessionID:v21 guid:v23];

    __int16 v24 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v25 = [v24 numberOfSuccessfulMessageCancelling] + 1;
    __int16 v26 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v26 setNumberOfSuccessfulMessageCancelling:v25];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    [(SMInitiatorCacheManager *)self _updateScheduledSendFireTimer];
    int v27 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v28 = [v27 shouldBeCleanedUpDate];

    if (v28) {
      [(SMInitiatorCacheManager *)self _cleanUpInitiatorContactLocalStore];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v31 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v32 = (objc_class *)objc_opt_class();
      double v33 = NSStringFromClass(v32);
      uint64_t v34 = NSStringFromSelector(a2);
      id v35 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v36 = [v35 scheduleSendMessageGUID];
      int v37 = 138413314;
      id v38 = v31;
      __int16 v39 = 2112;
      id v40 = v33;
      __int16 v41 = 2112;
      id v42 = v34;
      __int16 v43 = 2112;
      id v44 = v36;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to cancel scheduled Key Release message %@ with error %@", (uint8_t *)&v37, 0x34u);
    }
    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    id v29 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v30 = [v29 shouldBeCleanedUpDate];

    if (v30) {
      [(SMInitiatorCacheManager *)self _scheduleScheduleSendCancelRetry];
    }
  }
}

- (id)_getScheduleSendCancelRetryXpcActivityIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(SMInitiatorCacheManager *)self sessionUUID];
  double v4 = [v2 stringWithFormat:@"%@.%@", @"com.apple.routined.scheduleSend.cancelRetry", v3];

  return v4;
}

- (void)_scheduleScheduleSendCancelRetry
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v4 = [(SMInitiatorCacheManager *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsScheduleSendCancelRetryDelay"];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 60.0;
  }
  double v8 = [(SMInitiatorCacheManager *)self defaultsManager];
  uint64_t v9 = [v8 objectForKey:@"RTDefaultsScheduleSendCancelRetryGracePeriod"];

  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 60.0;
  }
  LOBYTE(v25) = 0;
  id v12 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:0 requireNetworkConnectivity:1024 requireInexpensiveNetworkConnectivity:1024 networkTransferUploadSize:1 networkTransferDownloadSize:-1.0 allowBattery:v11 powerNap:v7 delay:v25 requireBatteryLevel:&unk_1F34513E0];
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    char v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    id v31 = v14;
    __int16 v32 = 2112;
    double v33 = v16;
    __int16 v34 = 2112;
    id v35 = v17;
    __int16 v36 = 2048;
    unint64_t v37 = 0xBFF0000000000000;
    __int16 v38 = 2048;
    double v39 = v11;
    __int16 v40 = 2048;
    double v41 = v7;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule singleshot xpc activity,interval,%f,grace period,%f,delay,%f", buf, 0x3Eu);
  }
  objc_initWeak((id *)buf, self);
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  __int16 v20 = [(SMInitiatorCacheManager *)self sessionUUID];
  uint64_t v21 = [(SMInitiatorCacheManager *)self xpcActivityManager];
  __int16 v22 = [(SMInitiatorCacheManager *)self _getScheduleSendCancelRetryXpcActivityIdentifier];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke;
  v26[3] = &unk_1E6B97DB8;
  objc_copyWeak(v29, (id *)buf);
  id v23 = v20;
  id v27 = v23;
  id v24 = v19;
  id v28 = v24;
  v29[1] = (id)a2;
  [v21 registerActivityWithIdentifier:v22 criteria:v12 handler:v26];

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);
}

void __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke_2;
    block[3] = &unk_1E6B90FA8;
    id v10 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v11 = v7;
    uint64_t v14 = v8;
    id v12 = v5;
    id v13 = v3;
    dispatch_async(v6, block);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

uint64_t __59__SMInitiatorCacheManager__scheduleScheduleSendCancelRetry__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule send cancel retry xpc fired", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 48) _cancelScheduledKeyRelease];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_stopScheduleSendCancelRetry
{
  uint64_t v4 = [(SMInitiatorCacheManager *)self xpcActivityManager];
  id v5 = [(SMInitiatorCacheManager *)self _getScheduleSendCancelRetryXpcActivityIdentifier];
  [v4 deleteDefaultsForIdentifier:v5];

  double v6 = [(SMInitiatorCacheManager *)self xpcActivityManager];
  int v7 = [(SMInitiatorCacheManager *)self _getScheduleSendCancelRetryXpcActivityIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SMInitiatorCacheManager__stopScheduleSendCancelRetry__block_invoke;
  v8[3] = &unk_1E6B90CB8;
  v8[4] = self;
  v8[5] = a2;
  [v6 unregisterActivityWithIdentifier:v7 handler:v8];
}

void __55__SMInitiatorCacheManager__stopScheduleSendCancelRetry__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) sessionUUID];
    double v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregisterActivityWithIdentifier with error %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)_updateScheduledSendFireTimer
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SMInitiatorCacheManager *)self scheduledSendFireTimerAlarm];
  [v4 invalidate];

  [(SMInitiatorCacheManager *)self setScheduledSendFireTimerAlarm:0];
  if ([(SMInitiatorCacheManager *)self _isKeyReleaseScheduled])
  {
    [(SMInitiatorCacheManager *)self requestTimeFromTimed];
    double v6 = v5;
    int v7 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v8 = [v7 scheduledSendExpiryDate];
    int v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
    int v10 = [v8 isBeforeDate:v9];

    if (v10)
    {
      [(SMInitiatorCacheManager *)self _handleScheduledSendTimerFired];
    }
    else
    {
      objc_initWeak(&location, self);
      id v16 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      uint64_t v19 = NSString;
      __int16 v20 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v47 = [v19 stringWithFormat:@"%@.%@", @"com.apple.routined.SMInitiatorCacheManager.scheduledSendFireTimerAlarmIdentifier", v20];

      uint64_t v21 = [RTXPCTimerAlarm alloc];
      __int16 v22 = [(SMInitiatorCacheManager *)self queue];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      id v49[2] = __56__SMInitiatorCacheManager__updateScheduledSendFireTimer__block_invoke;
      v49[3] = &unk_1E6B97F40;
      objc_copyWeak(v52, &location);
      id v23 = v16;
      id v50 = v23;
      id v24 = v18;
      id v51 = v24;
      v52[1] = (id)a2;
      uint64_t v25 = [(RTXPCTimerAlarm *)v21 initWithIdentifier:v47 queue:v22 handler:v49];
      [(SMInitiatorCacheManager *)self setScheduledSendFireTimerAlarm:v25];

      double Current = CFAbsoluteTimeGetCurrent();
      id v27 = [(SMInitiatorCacheManager *)self initiatorContact];
      id v28 = [v27 scheduledSendExpiryDate];
      [v28 timeIntervalSinceReferenceDate];
      double v30 = v29;

      id v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:Current + v30 - v6];
      __int16 v32 = [(SMInitiatorCacheManager *)self scheduledSendFireTimerAlarm];
      id v48 = 0;
      [v32 fireWithDate:v31 error:&v48];
      id v33 = v48;

      if (v33)
      {
        __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          id v37 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          double v39 = [v33 localizedDescription];
          *(_DWORD *)buf = 138413058;
          uint64_t v55 = v35;
          __int16 v56 = 2112;
          id v57 = v37;
          __int16 v58 = 2112;
          id v59 = v38;
          __int16 v60 = 2112;
          uint64_t v61 = v39;
          _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduledSendFireTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
        }
      }
      else
      {
        __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v46 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v43 = [(SMInitiatorCacheManager *)self initiatorContact];
          id v44 = [v43 scheduledSendExpiryDate];
          __int16 v45 = [v44 stringFromDate];
          *(_DWORD *)buf = 138413058;
          uint64_t v55 = v46;
          __int16 v56 = 2112;
          id v57 = v41;
          __int16 v58 = 2112;
          id v59 = v42;
          __int16 v60 = 2112;
          uint64_t v61 = v45;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduledSendFireTimerAlarm scheduled for: %@", buf, 0x2Au);
        }
      }

      objc_destroyWeak(v52);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      __int16 v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v55 = v12;
      __int16 v56 = 2112;
      id v57 = v14;
      __int16 v58 = 2112;
      id v59 = v15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduled send not found", buf, 0x20u);
    }
  }
}

void __56__SMInitiatorCacheManager__updateScheduledSendFireTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,scheduled send timer fired", (uint8_t *)&v11, 0x20u);
    }
    [WeakRetained _handleScheduledSendTimerFired];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self not found", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)_handleScheduledSendTimerFired
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [(SMInitiatorCacheManager *)self scheduledSendFireTimerAlarm];
    int v10 = [v9 identifier];
    int v23 = 138413058;
    id v24 = v5;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    double v30 = v10;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,%@ expired", (uint8_t *)&v23, 0x2Au);
  }
  int v11 = [(SMInitiatorCacheManager *)self scheduledSendFireTimerAlarm];
  [v11 invalidate];

  [(SMInitiatorCacheManager *)self setScheduledSendFireTimerAlarm:0];
  uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
  [(SMInitiatorCacheManager *)self requestTimeFromTimed];
  __int16 v13 = [v12 dateWithTimeIntervalSinceReferenceDate:];
  uint64_t v14 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v15 = [v14 scheduledSendExpiryDate];
  [v13 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v17 >= -10.0)
  {
    id v18 = [(SMInitiatorCacheManager *)self delegate];
    uint64_t v19 = [(SMInitiatorCacheManager *)self sessionUUID];
    [v18 scheduledSendMessageSent:v19];

    __int16 v20 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v20 setWasScheduledSendTriggered:1];

    uint64_t v21 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v21 setWasCacheReleased:1];

    __int16 v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    [v22 setScheduledSendExpiryDate:0];

    [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
  }
  else
  {
    [(SMInitiatorCacheManager *)self _updateScheduledSendFireTimer];
  }
}

- (double)requestTimeFromTimed
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  TMGetReferenceTime();
  BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    double v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    int v23 = v16;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,TMGetReferenceTime returned invalid time, using time from CFAbsoluteTimeGetCurrent", buf, 0x20u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(SMInitiatorCacheManager *)self sessionUUID];
    int v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:Current];
    int v11 = [v10 stringFromDate];
    *(_DWORD *)buf = 138413314;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    int v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,referenceTime:%@,referenceTimeUnc:%f", buf, 0x34u);
  }
  return Current;
}

- (void)updateCacheUpdateBackstopTimer
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  [(SMInitiatorCacheManager *)self stopCacheUpdateBackstopTimer];
  BOOL v4 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v5 = [v4 cacheUpdateBackstopExpiryDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    id v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      double v39 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v40 = (objc_class *)objc_opt_class();
      id v41 = NSStringFromClass(v40);
      NSStringFromSelector(a2);
      id v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2112;
      __int16 v69 = v42;
      _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm expired in the past", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v69 = __Block_byref_object_copy__81;
    *(void *)&long long v70 = __Block_byref_object_dispose__81;
    __int16 v43 = NSString;
    id v44 = (objc_class *)objc_opt_class();
    __int16 v45 = NSStringFromClass(v44);
    id v46 = NSStringFromSelector(a2);
    id v47 = [v43 stringWithFormat:@"%@-%@", v45, v46];
    [v47 UTF8String];
    *((void *)&v70 + 1) = os_transaction_create();

    id v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      __int16 v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v56 = NSStringFromSelector(a2);
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v55;
      __int16 v66 = 2112;
      __int16 v67 = v56;
      _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", location, 0x16u);
    }
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke;
    id v64[3] = &unk_1E6B98170;
    v64[4] = self;
    void v64[5] = buf;
    v64[6] = a2;
    [(SMInitiatorCacheManager *)self _periodicCacheUpdateWithCompletion:v64];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v9 = [v8 cacheUpdateBackstopExpiryDate];
    [v9 timeIntervalSinceNow];
    double v11 = v10;
    [(SMInitiatorCacheManager *)self getCacheUpdateBackstopTimeout];
    double v13 = v12;

    if (v11 > v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
      [(SMInitiatorCacheManager *)self getCacheUpdateBackstopTimeout];
      __int16 v15 = [v14 dateWithTimeIntervalSinceNow:x0];
      double v16 = [(SMInitiatorCacheManager *)self initiatorContact];
      [v16 setCacheUpdateBackstopExpiryDate:v15];

      [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
    }
    objc_initWeak((id *)location, self);
    double v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v20 = NSString;
    uint64_t v21 = [(SMInitiatorCacheManager *)self sessionUUID];
    __int16 v22 = [v20 stringWithFormat:@"%@.%@", @"com.apple.routined.SMInitiatorCacheManager.cacheUpdateBackstopTimerIdentifierBase", v21];

    int v23 = [RTXPCTimerAlarm alloc];
    __int16 v24 = [(SMInitiatorCacheManager *)self queue];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_398;
    v60[3] = &unk_1E6B97F40;
    objc_copyWeak(v63, (id *)location);
    id v25 = v19;
    id v61 = v25;
    id v26 = v18;
    id v62 = v26;
    v63[1] = (id)a2;
    uint64_t v27 = [(RTXPCTimerAlarm *)v23 initWithIdentifier:v22 queue:v24 handler:v60];
    [(SMInitiatorCacheManager *)self setCacheUpdateBackstopTimerAlarm:v27];

    uint64_t v28 = [(SMInitiatorCacheManager *)self cacheUpdateBackstopTimerAlarm];
    __int16 v29 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v30 = [v29 cacheUpdateBackstopExpiryDate];
    id v59 = 0;
    [v28 fireWithDate:v30 error:&v59];
    id v31 = v59;

    if (v31)
    {
      __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        __int16 v36 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
        id v37 = [v31 localizedDescription];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2112;
        __int16 v69 = v36;
        LOWORD(v70) = 2112;
        *(void *)((char *)&v70 + 2) = v37;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
      }
    }
    else
    {
      __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v57 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v50 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
        id v51 = [(SMInitiatorCacheManager *)self initiatorContact];
        uint64_t v52 = [v51 cacheUpdateBackstopExpiryDate];
        uint64_t v53 = [v52 stringFromDate];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v58;
        *(_WORD *)&buf[22] = 2112;
        __int16 v69 = v50;
        LOWORD(v70) = 2112;
        *(void *)((char *)&v70 + 2) = v53;
        _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm scheduled for: %@", buf, 0x2Au);
      }
    }

    objc_destroyWeak(v63);
    objc_destroyWeak((id *)location);
  }
}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sessionUUID];
    BOOL v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    double v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = 138412802;
    double v10 = v3;
    __int16 v11 = 2112;
    double v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed cache upload due to cacheUpdateBackstopTimerAlarm expiry in the past", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_398(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      __int16 v32 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cacheUpdateBackstopTimerAlarm fired", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v32 = __Block_byref_object_copy__81;
    id v33 = __Block_byref_object_dispose__81;
    uint64_t v8 = NSString;
    int v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v12 = [v8 stringWithFormat:@"%@-%@", v10, v11];
    [v12 UTF8String];
    id v34 = (id)os_transaction_create();

    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)uint64_t v27 = 138412546;
      id v28 = v17;
      __int16 v29 = 2112;
      double v30 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", v27, 0x16u);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_399;
    v22[3] = &unk_1E6B98198;
    id v23 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 56);
    id v24 = v14;
    id v25 = buf;
    uint64_t v26 = v15;
    [WeakRetained _periodicCacheUpdateWithCompletion:v22];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      __int16 v32 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,self not found", buf, 0x20u);
    }
  }
}

void __57__SMInitiatorCacheManager_updateCacheUpdateBackstopTimer__block_invoke_399(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,completed cache upload due to cacheUpdateBackstopTimerAlarm firing", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)stopCacheUpdateBackstopTimer
{
  uint64_t v3 = [(SMInitiatorCacheManager *)self cacheUpdateBackstopTimerAlarm];

  if (v3)
  {
    uint64_t v4 = [(SMInitiatorCacheManager *)self cacheUpdateBackstopTimerAlarm];
    [v4 invalidate];

    [(SMInitiatorCacheManager *)self setCacheUpdateBackstopTimerAlarm:0];
  }
}

- (void)_storeInitiatorContactInStore:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(SMInitiatorCacheManager *)self initiatorContactStoreInProgress];
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      __int16 v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v9;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Update already in progress", buf, 0x20u);
    }
    [(SMInitiatorCacheManager *)self setInitiatorContactUpdatePending:1];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      double v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,storing SMInitiatorContact in store", buf, 0x20u);
    }
    [(SMInitiatorCacheManager *)self setInitiatorContactStoreInProgress:1];
    objc_initWeak((id *)buf, self);
    id v17 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v20 = [(SMInitiatorCacheManager *)self safetyCacheStore];
    uint64_t v21 = [(SMInitiatorCacheManager *)self initiatorContact];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke;
    id v24[3] = &unk_1E6B981E8;
    objc_copyWeak(v27, (id *)buf);
    id v22 = v17;
    id v25 = v22;
    id v23 = v19;
    id v26 = v23;
    v27[1] = (id)a2;
    v27[2] = (id)a3;
    [v20 storeInitiatorContact:v21 handler:v24];

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
}

void __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke_400;
    v14[3] = &unk_1E6B981C0;
    uint64_t v15 = v5;
    id v16 = v3;
    id v17 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v18 = v7;
    uint64_t v19 = v8;
    uint64_t v20 = v9;
    dispatch_async(v6, v14);

    __int16 v10 = v15;
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      __int16 v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", buf, 0x20u);
    }
  }
}

uint64_t __57__SMInitiatorCacheManager__storeInitiatorContactInStore___block_invoke_400(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setInitiatorContactStoreInProgress:0];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      __int16 v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 72);
      int v16 = 138413314;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Stored with error %@, retries left %d", (uint8_t *)&v16, 0x30u);
    }
    uint64_t v5 = *(void *)(a1 + 72);
    BOOL v6 = *(void **)(a1 + 32);
    if (v5) {
      return [v6 _storeInitiatorContactInStore:v5 - 1];
    }
    else {
      return [v6 setInitiatorContactUpdatePending:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v16 = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Successfully stored InitiatorContact", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 32) setInitiatorContactStored:1];
    uint64_t result = [*(id *)(a1 + 32) initiatorContactUpdatePending];
    if (result)
    {
      [*(id *)(a1 + 32) setInitiatorContactUpdatePending:0];
      return [*(id *)(a1 + 32) _updateInitiatorContactInStore];
    }
  }
  return result;
}

- (void)_updateInitiatorContactInStore
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(SMInitiatorCacheManager *)self initiatorContactStored])
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      uint64_t v35 = v4;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Updating InitiatorContact, transaction,%@", buf, 0x2Au);
    }
    __int16 v10 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    __int16 v13 = [(SMInitiatorCacheManager *)self safetyCacheStore];
    uint64_t v14 = [(SMInitiatorCacheManager *)self initiatorContact];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    id v23[2] = __57__SMInitiatorCacheManager__updateInitiatorContactInStore__block_invoke;
    v23[3] = &unk_1E6B98210;
    id v24 = v10;
    id v25 = v12;
    id v26 = v4;
    SEL v27 = a2;
    id v15 = v4;
    id v16 = v12;
    id v17 = v10;
    [v13 updateInitiatorContact:v14 handler:v23];
  }
  else
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [(SMInitiatorCacheManager *)self sessionUUID];
      __int16 v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      __int16 v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      id v31 = v21;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMInitiatorContact not yet stored", buf, 0x20u);
    }
    [(SMInitiatorCacheManager *)self _storeInitiatorContactInStore:2];
  }
}

void __57__SMInitiatorCacheManager__updateInitiatorContactInStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 48);
      int v13 = 138413314;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Update returned error %@, transaction,%@", (uint8_t *)&v13, 0x34u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v12 = *(void **)(a1 + 48);
    int v13 = 138413058;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Successfully updated InitiatorContact, transaction,%@", (uint8_t *)&v13, 0x2Au);
    goto LABEL_6;
  }
}

- (void)_cleanUpInitiatorContact
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup contact", (uint8_t *)&v9, 0x20u);
  }
  [(SMInitiatorCacheManager *)self _cancelScheduledKeyRelease];
  [(SMInitiatorCacheManager *)self _cleanupActiveSessionZone];
  [(SMInitiatorCacheManager *)self _cleanUpInitiatorContactLocalStore];
}

- (void)eraseCacheDataInMemory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v5 = [v4 phoneCache];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v7 = [v6 watchCache];

    if (!v7) {
      return;
    }
  }
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@", (uint8_t *)&v15, 0x20u);
  }
  __int16 v13 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v13 setPhoneCache:0];

  uint64_t v14 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v14 setWatchCache:0];

  [(SMInitiatorCacheManager *)self notifyObserversSafetyCacheDidUpdate];
}

- (void)_cleanupActiveSessionZone
{
  id v8 = [(SMInitiatorCacheManager *)self initiatorContact];
  if ([v8 cloudkitShareZoneCleanedUpSuccessfully])
  {
  }
  else
  {
    BOOL v4 = [(SMInitiatorCacheManager *)self initializationInProgress];

    if (!v4)
    {
      objc_initWeak(&location, self);
      uint64_t v5 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
      uint64_t v6 = [(SMInitiatorCacheManager *)self activeSessionZone];
      uint64_t v7 = [v6 privateDatabase];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__SMInitiatorCacheManager__cleanupActiveSessionZone__block_invoke;
      v9[3] = &unk_1E6B98238;
      objc_copyWeak(v10, &location);
      v10[1] = (id)a2;
      [(SMInitiatorCacheManager *)self deleteZoneFromDatabaseWithRetry:2 database:v7 qos:v5 withCompletion:v9];

      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }
}

void __52__SMInitiatorCacheManager__cleanupActiveSessionZone__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [WeakRetained sessionUUID];
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v13 = 138413314;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 1024;
      int v22 = a2;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanupCloudkit with error %@ and success %d", (uint8_t *)&v13, 0x30u);
    }
    uint64_t v12 = [WeakRetained initiatorContact];
    [v12 setCloudkitShareZoneCleanedUpSuccessfully:a2];

    [WeakRetained _updateInitiatorContactInStore];
    [WeakRetained _cleanUpInitiatorContactLocalStore];
  }
}

- (void)deleteZoneFromDatabaseWithRetry:(int64_t)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (v11 && v12)
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      uint64_t v16 = [(SMInitiatorCacheManager *)self sessionUUID];
      objc_initWeak((id *)location, self);
      __int16 v17 = [(SMInitiatorCacheManager *)self activeSessionZone];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __87__SMInitiatorCacheManager_deleteZoneFromDatabaseWithRetry_database_qos_withCompletion___block_invoke;
      v33[3] = &unk_1E6B98260;
      objc_copyWeak(v39, (id *)location);
      id v18 = v16;
      id v34 = v18;
      __int16 v19 = v15;
      uint64_t v35 = v19;
      v39[1] = (id)a2;
      id v38 = v13;
      v39[2] = (id)a3;
      id v36 = v11;
      id v37 = v12;
      [v17 deleteZoneFromDatabase:v36 qos:v37 withCompletion:v33];

      objc_destroyWeak(v39);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = [(SMInitiatorCacheManager *)self sessionUUID];
        __int16 v30 = (objc_class *)objc_opt_class();
        id v31 = NSStringFromClass(v30);
        __int16 v32 = NSStringFromSelector(a2);
        *(_DWORD *)id location = 138413314;
        *(void *)&location[4] = v29;
        __int16 v43 = 2112;
        id v44 = v31;
        __int16 v45 = 2112;
        id v46 = v32;
        __int16 v47 = 2112;
        id v48 = v11;
        __int16 v49 = 2112;
        id v50 = v12;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,missing required fields,database,%@,qos,%@", location, 0x34u);
      }
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F28568];
      int v22 = NSString;
      uint64_t v23 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      id v26 = NSStringFromSelector(a2);
      SEL v27 = [v22 stringWithFormat:@"#SafetyCache,Initiator,sessionID:%@,%@,%@,failed due to invalid parameters", v23, v25, v26];
      id v41 = v27;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      __int16 v19 = [v21 initWithDomain:*MEMORY[0x1E4F99A48] code:7 userInfo:v28];

      (*((void (**)(id, void, NSObject *))v13 + 2))(v13, 0, v19);
    }
  }
  else
  {
    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", location, 2u);
    }
  }
}

void __87__SMInitiatorCacheManager_deleteZoneFromDatabaseWithRetry_database_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v27 = 138412802;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      __int16 v32 = v20;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete", (uint8_t *)&v27, 0x20u);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_18;
  }
  if (!v4)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v27 = 138412802;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      __int16 v32 = v13;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone deleted successfully", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_17;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_18:
      v10();
      goto LABEL_19;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    int v27 = 138413058;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v16;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone with non recoverable error %@";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, 0x2Au);

    goto LABEL_17;
  }
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    int v27 = 138413058;
    uint64_t v28 = v25;
    __int16 v29 = 2112;
    uint64_t v30 = v26;
    __int16 v31 = 2112;
    __int16 v32 = v16;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone after retries with recoverable error %@";
    goto LABEL_21;
  }
  if (v8)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v24 = *(void *)(a1 + 88);
    int v27 = 138413314;
    uint64_t v28 = v21;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    __int16 v32 = v23;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 1024;
    int v36 = v24;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete zone with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v27, 0x30u);
  }
  [WeakRetained deleteZoneFromDatabaseWithRetry:*(void *)(a1 + 88) - 1 database:*(void *)(a1 + 48) qos:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 64)];
LABEL_19:
}

- (void)_cleanUpInitiatorContactLocalStore
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SMInitiatorCacheManager *)self initiatorContact];
  if ([v2 cloudkitShareZoneCleanedUpSuccessfully])
  {

    id v3 = self;
    BOOL v4 = [(SMInitiatorCacheManager *)self _isKeyReleaseScheduled];
  }
  else
  {
    id v5 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v6 = [v5 startingLocation];
    uint64_t v7 = [v6 date];
    if (v7)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1C9C8];
      int v9 = [(SMInitiatorCacheManager *)self initiatorContact];
      uint64_t v10 = [v9 startingLocation];
      uint64_t v11 = [v10 date];
      uint64_t v12 = [v8 dateWithTimeInterval:v11 sinceDate:604800.0];
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      char v14 = [v12 isAfterDate:v13];
    }
    else
    {
      char v14 = 0;
    }
    id v3 = self;

    BOOL v4 = [(SMInitiatorCacheManager *)self _isKeyReleaseScheduled];
    if (v14)
    {
      int v15 = 0;
      int v16 = 1;
      goto LABEL_11;
    }
  }
  int v16 = 0;
  int v15 = 0;
  if (![(SMInitiatorCacheManager *)v3 initializationInProgress] && !v4)
  {
    BOOL v4 = 0;
    int v16 = 0;
    int v15 = ![(SMInitiatorCacheManager *)v3 scheduledSendInProgress];
  }
LABEL_11:
  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v77 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v18 = (objc_class *)objc_opt_class();
    __int16 v75 = NSStringFromClass(v18);
    uint64_t v74 = NSStringFromSelector(a2);
    uint64_t v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v20 = [v19 identifier];
    BOOL v21 = [(SMInitiatorCacheManager *)self scheduledSendInProgress];
    uint64_t v22 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v23 = [v22 shouldBeCleanedUpDate];
    uint64_t v24 = [v23 stringFromDate];
    *(_DWORD *)buf = 138414338;
    id v93 = v77;
    __int16 v94 = 2112;
    id v95 = v75;
    __int16 v96 = 2112;
    id v97 = v74;
    __int16 v98 = 2112;
    v99 = v20;
    __int16 v100 = 1024;
    int v101 = v16;
    __int16 v102 = 1024;
    BOOL v103 = v4;
    __int16 v104 = 1024;
    BOOL v105 = v21;
    __int16 v106 = 1024;
    int v107 = v15;
    __int16 v108 = 2112;
    uint64_t v109 = v24;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,%@, cloudkit %d, scheduleSendMsgToCancel %d, scheduledSendInProgress %d, cleanupConditionsMet %d, shouldBeCleanedUpDate %@", buf, 0x4Cu);
  }
  uint64_t v25 = [(SMInitiatorCacheManager *)self sessionUUID];
  uint64_t v26 = (objc_class *)objc_opt_class();
  int v27 = NSStringFromClass(v26);
  if (v15)
  {
    uint64_t v28 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v29 = [v28 shouldBeCleanedUpDate];
    if (v29)
    {
      uint64_t v30 = [(SMInitiatorCacheManager *)self initiatorContact];
      __int16 v31 = [v30 shouldBeCleanedUpDate];
      __int16 v32 = [MEMORY[0x1E4F1C9C8] now];
      int v33 = [v31 isBeforeDate:v32];

      if (!v33)
      {
        id v34 = [(SMInitiatorCacheManager *)self initiatorContact];
        __int16 v35 = [v34 shouldBeCleanedUpDate];
        int v36 = [MEMORY[0x1E4F1C9C8] now];
        if ([v35 isAfterDate:v36])
        {
          uint64_t v37 = [(SMInitiatorCacheManager *)self cleanupCacheTimerAlarm];
          BOOL v38 = v37 == 0;

          if (v38)
          {
            objc_initWeak(&location, self);
            double v39 = NSString;
            uint64_t v40 = [(SMInitiatorCacheManager *)self sessionUUID];
            id v41 = [v39 stringWithFormat:@"%@.%@", @"com.apple.routined.SMInitiatorCacheManager.cachePersistenceTimerIdentifierBase", v40];

            id v42 = [RTXPCTimerAlarm alloc];
            __int16 v43 = [(SMInitiatorCacheManager *)self queue];
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_402;
            v82[3] = &unk_1E6B97F40;
            objc_copyWeak(v85, &location);
            id v83 = v25;
            id v84 = v27;
            v85[1] = (id)a2;
            id v44 = [(RTXPCTimerAlarm *)v42 initWithIdentifier:v41 queue:v43 handler:v82];
            [(SMInitiatorCacheManager *)self setCleanupCacheTimerAlarm:v44];

            __int16 v45 = [(SMInitiatorCacheManager *)self cleanupCacheTimerAlarm];
            id v46 = [(SMInitiatorCacheManager *)self initiatorContact];
            __int16 v47 = [v46 shouldBeCleanedUpDate];
            id v81 = 0;
            [v45 fireWithDate:v47 error:&v81];
            id v48 = v81;

            if (v48)
            {
              __int16 v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                __int16 v69 = [(SMInitiatorCacheManager *)self sessionUUID];
                long long v70 = (objc_class *)objc_opt_class();
                NSStringFromClass(v70);
                id v71 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v72 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v73 = [v48 localizedDescription];
                *(_DWORD *)buf = 138413058;
                id v93 = v69;
                __int16 v94 = 2112;
                id v95 = v71;
                __int16 v96 = 2112;
                id v97 = v72;
                __int16 v98 = 2112;
                v99 = v73;
                _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cachePersistenceTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
              }
              [(SMInitiatorCacheManager *)self setCleanupCacheTimerAlarm:0];
            }
            else
            {
              id v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v76 = [(SMInitiatorCacheManager *)self sessionUUID];
                __int16 v64 = (objc_class *)objc_opt_class();
                NSStringFromClass(v64);
                id v78 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                id v65 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v66 = [(SMInitiatorCacheManager *)self initiatorContact];
                __int16 v67 = [v66 shouldBeCleanedUpDate];
                __int16 v68 = [v67 stringFromDate];
                *(_DWORD *)buf = 138413058;
                id v93 = v76;
                __int16 v94 = 2112;
                id v95 = v78;
                __int16 v96 = 2112;
                id v97 = v65;
                __int16 v98 = 2112;
                v99 = v68;
                _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cachePersistenceTimerAlarm scheduled for: %@", buf, 0x2Au);
              }
            }

            objc_destroyWeak(v85);
            objc_destroyWeak(&location);
          }
        }
        else
        {
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    [(SMInitiatorCacheManager *)self _stopCleanupCacheTimerAlarm];
    id v55 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v56 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v57 = (objc_class *)objc_opt_class();
      id v58 = NSStringFromClass(v57);
      id v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v93 = v56;
      __int16 v94 = 2112;
      id v95 = v58;
      __int16 v96 = 2112;
      id v97 = v59;
      _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup starting", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    __int16 v60 = [(SMInitiatorCacheManager *)self safetyCacheStore];
    id v61 = [(SMInitiatorCacheManager *)self initiatorContact];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke;
    v87[3] = &unk_1E6B98288;
    objc_copyWeak(v91, (id *)buf);
    id v88 = v25;
    id v62 = v27;
    v91[1] = (id)a2;
    id v89 = v62;
    BOOL v90 = self;
    [v60 removeInitiatorContact:v61 handler:v87];

    objc_destroyWeak(v91);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v52 = (objc_class *)objc_opt_class();
      uint64_t v53 = NSStringFromClass(v52);
      __int16 v54 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v93 = v51;
      __int16 v94 = 2112;
      id v95 = v53;
      __int16 v96 = 2112;
      id v97 = v54;
      _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cleanup conditions not yet satisfied", buf, 0x20u);
    }
  }
LABEL_29:
}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained initiatorContact];

  if (v5)
  {
    uint64_t v6 = [WeakRetained queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_401;
    v15[3] = &unk_1E6B91E58;
    int v16 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 64);
    id v17 = v7;
    uint64_t v21 = v8;
    id v18 = v3;
    id v9 = WeakRetained;
    uint64_t v10 = *(void *)(a1 + 48);
    id v19 = v9;
    uint64_t v20 = v10;
    dispatch_async(v6, v15);

    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      char v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      int v27 = v14;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup finished with not valid initiatorContact %@", buf, 0x2Au);
    }
  }
}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_401(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v6 = *(void *)(a1 + 48);
    int v9 = 138413058;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    char v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,localCleanup with error %@", (uint8_t *)&v9, 0x2Au);
  }
  if (!*(void *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 56) delegate];
    uint64_t v8 = [*(id *)(a1 + 56) sessionUUID];
    [v7 cacheManagerCleanedUpForSessionID:v8];

    [*(id *)(a1 + 64) eraseCacheDataInMemory];
  }
}

void __61__SMInitiatorCacheManager__cleanUpInitiatorContactLocalStore__block_invoke_402(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained initiatorContact];

  if (v3)
  {
    [WeakRetained _stopCleanupCacheTimerAlarm];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 138412802;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule cleanup fired", (uint8_t *)&v12, 0x20u);
    }
    [WeakRetained _cleanUpInitiatorContactLocalStore];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,schedule cleanup fired not valid initiatorContact", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_stopCleanupCacheTimerAlarm
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SMInitiatorCacheManager *)self cleanupCacheTimerAlarm];

  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(SMInitiatorCacheManager *)self sessionUUID];
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = NSStringFromSelector(a2);
      int v11 = 138412802;
      int v12 = v6;
      __int16 v13 = 2112;
      __int16 v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalidate cleanupCacheTimerAlarm", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v10 = [(SMInitiatorCacheManager *)self cleanupCacheTimerAlarm];
    [v10 invalidate];

    [(SMInitiatorCacheManager *)self setCleanupCacheTimerAlarm:0];
  }
}

- (void)_registerForGeneralNotifications
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(SMInitiatorCacheManager *)self registeredForGeneralNotifications])
  {
    [(SMInitiatorCacheManager *)self setRegisteredForGeneralNotifications:1];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      int v13 = 138412802;
      __int16 v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,register for general notifications", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v9 = [(SMInitiatorCacheManager *)self networkOfInterestManager];
    uint64_t v10 = +[RTNotification notificationName];
    [v9 addObserver:self selector:sel_onCellLinkQualityChangedNotification_ name:v10];

    int v11 = [(SMInitiatorCacheManager *)self networkOfInterestManager];
    int v12 = +[RTNotification notificationName];
    [v11 addObserver:self selector:sel_onWifiLinkQualityChangedNotification_ name:v12];
  }
}

- (void)_registerForActiveNotifications
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (![(SMInitiatorCacheManager *)self registeredForActiveNotifications])
  {
    [(SMInitiatorCacheManager *)self setRegisteredForActiveNotifications:1];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = v5;
      __int16 v38 = 2112;
      double v39 = v7;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,register for active notifications", buf, 0x20u);
    }
    uint64_t v9 = [(SMInitiatorCacheManager *)self locationAwarenessManager];
    id v35 = 0;
    [v9 addLocationHeartbeatRequester:self interval:&v35 error:300.0];
    id v10 = v35;

    int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = [(SMInitiatorCacheManager *)self sessionUUID];
      int v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      __int16 v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v10 code];
      __int16 v17 = [v10 localizedDescription];
      *(_DWORD *)buf = 138413314;
      uint64_t v37 = v12;
      __int16 v38 = 2112;
      double v39 = v14;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2048;
      uint64_t v43 = v16;
      __int16 v44 = 2112;
      __int16 v45 = v17;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Request location heartbeat error, code, %ld, description, %@", buf, 0x34u);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v20 = [(SMInitiatorCacheManager *)self sessionUUID];
    uint64_t v21 = [SMScreenLockMonitor alloc];
    uint64_t v22 = [(SMInitiatorCacheManager *)self queue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__SMInitiatorCacheManager__registerForActiveNotifications__block_invoke;
    v31[3] = &unk_1E6B982B0;
    objc_copyWeak(v34, (id *)buf);
    id v23 = v20;
    id v32 = v23;
    id v24 = v19;
    id v33 = v24;
    v34[1] = (id)a2;
    uint64_t v25 = [(SMScreenLockMonitor *)v21 initWithQueue:v22 handler:v31];
    [(SMInitiatorCacheManager *)self setScreenLockMonitor:v25];

    __int16 v26 = [(SMInitiatorCacheManager *)self vehicleLocationProvider];
    int v27 = +[RTNotification notificationName];
    [v26 addObserver:self selector:sel_onVehicleEventNotification_ name:v27];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleShareAllLocationsChanged, (CFStringRef)*MEMORY[0x1E4F99B80], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if ([MEMORY[0x1E4F99880] zelkovaWorkoutEnabled])
    {
      id v29 = [(SMInitiatorCacheManager *)self healthKitManager];
      uint64_t v30 = +[RTNotification notificationName];
      [v29 addObserver:self selector:sel_onHealthKitManagerNotification_ name:v30];
    }
    objc_destroyWeak(v34);

    objc_destroyWeak((id *)buf);
  }
}

void __58__SMInitiatorCacheManager__registerForActiveNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained onLockStateChange:a2];
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,object has been cleaned up", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)_unregisterForGeneralNotifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(SMInitiatorCacheManager *)self registeredForGeneralNotifications])
  {
    [(SMInitiatorCacheManager *)self setRegisteredForGeneralNotifications:0];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      int v10 = 138412802;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregister for general notifications", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v9 = [(SMInitiatorCacheManager *)self networkOfInterestManager];
    [v9 removeObserver:self];
  }
}

- (void)_unregisterForActiveNotifications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(SMInitiatorCacheManager *)self registeredForActiveNotifications])
  {
    [(SMInitiatorCacheManager *)self setRegisteredForActiveNotifications:0];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = NSStringFromSelector(a2);
      int v14 = 138412802;
      __int16 v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unregister for active notifications", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v9 = [(SMInitiatorCacheManager *)self locationAwarenessManager];
    [v9 removeLocationHeartbeatRequester:self];

    int v10 = [(SMInitiatorCacheManager *)self screenLockMonitor];
    [v10 _unregisterForLockNotification];

    [(SMInitiatorCacheManager *)self setScreenLockMonitor:0];
    uint64_t v11 = [(SMInitiatorCacheManager *)self vehicleLocationProvider];
    [v11 removeObserver:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F99B80], 0);
    if ([MEMORY[0x1E4F99880] zelkovaWorkoutEnabled])
    {
      uint64_t v13 = [(SMInitiatorCacheManager *)self healthKitManager];
      [v13 removeObserver:self];
    }
  }
}

- (void)_fetchLocationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMInitiatorCacheManager *)self queue];
  BOOL v6 = +[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:v5];

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [RTLocationRequestOptions alloc];
    uint64_t v8 = [(RTLocationRequestOptions *)v7 initWithDesiredAccuracy:1 horizontalAccuracy:1 maxAge:*MEMORY[0x1E4F1E6D8] yieldLastLocation:35.0 timeout:10.0 fallback:10.0 fallbackHorizontalAccuracy:100.0 fallbackMaxAge:600.0];
    uint64_t v9 = [(SMInitiatorCacheManager *)self locationManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke;
    id v11[3] = &unk_1E6B982D8;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [v9 fetchCurrentLocationWithOptions:v8 handler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke_2;
    v14[3] = &unk_1E6B90660;
    id v15 = v6;
    id v16 = v5;
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);

    int v10 = v15;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F99A48];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"SMInitiatorCacheManger was destroyed before location fetch completed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v10 = (void *)[v11 initWithDomain:v12 code:24 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__SMInitiatorCacheManager__fetchLocationWithCompletion___block_invoke_2(void *a1)
{
  if (!a1[4] && a1[5] && (objc_msgSend(MEMORY[0x1E4F998C8], "isCLLocationValid:") & 1) != 0)
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F998C8]) initWithCLLocation:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(a1[6] + 16);
    v2();
  }
}

- (void)onCellLinkQualityChangedNotification:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMInitiatorCacheManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SMInitiatorCacheManager_onCellLinkQualityChangedNotification___block_invoke;
    block[3] = &unk_1E6B91220;
    uint64_t v9 = v5;
    int v10 = self;
    SEL v11 = a2;
    dispatch_async(v6, block);

    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }
}

void __64__SMInitiatorCacheManager_onCellLinkQualityChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  char v4 = [v2 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [*(id *)(a1 + 40) sessionUUID];
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v18 = [*(id *)(a1 + 32) name];
      int v19 = 138413058;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v18;
      _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTNetworkOfInterestManager notification,%@", (uint8_t *)&v19, 0x2Au);
    }
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) linkQuality];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 40) sessionUUID];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    SEL v11 = RTLinkQualityToString();
    int v19 = 138413058;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,link quality,%@", (uint8_t *)&v19, 0x2Au);
  }
  [*(id *)(a1 + 40) setCellularStrength:v5];
  if ([*(id *)(a1 + 40) cellularLinkQualityFetchInProgress])
  {
    uint64_t v12 = [*(id *)(a1 + 40) deviceStatusReturnBlock];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 40) deviceStatusReturnBlock];
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 3);
LABEL_9:
    }
  }
}

- (void)onWifiLinkQualityChangedNotification:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMInitiatorCacheManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SMInitiatorCacheManager_onWifiLinkQualityChangedNotification___block_invoke;
    block[3] = &unk_1E6B91220;
    uint64_t v9 = v5;
    int v10 = self;
    SEL v11 = a2;
    dispatch_async(v6, block);

    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }
}

void __64__SMInitiatorCacheManager_onWifiLinkQualityChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  char v4 = [v2 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [*(id *)(a1 + 40) sessionUUID];
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v18 = [*(id *)(a1 + 32) name];
      int v19 = 138413058;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v18;
      _os_log_error_impl(&dword_1D9BFA000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTNetworkOfInterestManager notification,%@", (uint8_t *)&v19, 0x2Au);
    }
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) linkQuality];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 40) sessionUUID];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    SEL v11 = RTLinkQualityToString();
    int v19 = 138413058;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,link quality,%@", (uint8_t *)&v19, 0x2Au);
  }
  [*(id *)(a1 + 40) setWifiStrength:v5];
  if ([*(id *)(a1 + 40) wifiLinkQualityFetchInProgress])
  {
    uint64_t v12 = [*(id *)(a1 + 40) deviceStatusReturnBlock];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 40) deviceStatusReturnBlock];
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 2);
LABEL_9:
    }
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMInitiatorCacheManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SMInitiatorCacheManager_onVehicleEventNotification___block_invoke;
    block[3] = &unk_1E6B91220;
    uint64_t v9 = v5;
    int v10 = self;
    SEL v11 = a2;
    dispatch_async(v6, block);

    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification", buf, 2u);
    }
  }
}

void __54__SMInitiatorCacheManager_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  char v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) vehicleEvents];
    id v33 = [v5 firstObject];

    id v6 = [v33 location];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F998C8]);
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = [v33 location];
      [v9 latitude];
      double v11 = v10;
      uint64_t v12 = [v33 location];
      [v12 longitude];
      double v14 = v13;
      id v15 = [v33 location];
      [v15 horizontalUncertainty];
      double v17 = v16;
      uint64_t v18 = [v33 location];
      [v18 altitude];
      double v20 = v19;
      __int16 v21 = [v33 location];
      [v21 verticalUncertainty];
      double v23 = v22;
      id v24 = [v33 location];
      __int16 v25 = [v24 date];
      __int16 v26 = (void *)[v7 initWithIdentifier:v8 latitude:v25 longitude:v11 hunc:v14 altitude:v17 vunc:v20 date:v23];
    }
    else
    {
      __int16 v26 = 0;
    }
    [*(id *)(a1 + 40) _updateVehicleParkingLocation:v26];
  }
  else
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [*(id *)(a1 + 40) sessionUUID];
      id v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      __int16 v31 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v32 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138413058;
      id v35 = v28;
      __int16 v36 = 2112;
      uint64_t v37 = v30;
      __int16 v38 = 2112;
      double v39 = v31;
      __int16 v40 = 2112;
      id v41 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,unhandled RTVehicleLocationProvider notification,%@", buf, 0x2Au);
    }
  }
}

- (void)_updateVehicleParkingLocation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v7 = [v6 shouldBeCleanedUpDate];

  if (v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_9;
    }
    id v15 = [(SMInitiatorCacheManager *)self sessionUUID];
    double v22 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v22);
    uint64_t v18 = NSStringFromSelector(a2);
    int v23 = 138412802;
    id v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    double v19 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,contact should be cleaned up";
    double v20 = v8;
    uint32_t v21 = 32;
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, v21);

    goto LABEL_3;
  }
  if (v5 && ([v5 isValid] & 1) == 0)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    id v15 = [(SMInitiatorCacheManager *)self sessionUUID];
    double v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    uint64_t v18 = NSStringFromSelector(a2);
    int v23 = 138413058;
    id v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    __int16 v29 = 2112;
    id v30 = v5;
    double v19 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,parking location is not valid %@";
    double v20 = v8;
    uint32_t v21 = 42;
    goto LABEL_13;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = [(SMInitiatorCacheManager *)self sessionUUID];
    double v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    double v13 = NSStringFromSelector(a2);
    int v23 = 138413058;
    id v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    __int16 v27 = 2112;
    __int16 v28 = v13;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating parked car location %@", (uint8_t *)&v23, 0x2Au);
  }
  double v14 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v14 setParkedCarLocation:v5];

  [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
LABEL_9:
}

- (void)onLockStateChange:(BOOL)a3
{
  BOOL v45 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  char v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v6 = [v5 sessionUUID];
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    double v10 = (void *)v9;
    double v11 = "NO";
    *(_DWORD *)buf = 138413058;
    id v50 = v6;
    if (v45) {
      double v11 = "YES";
    }
    __int16 v51 = 2112;
    uint64_t v52 = v8;
    __int16 v53 = 2112;
    uint64_t v54 = v9;
    __int16 v55 = 2080;
    __int16 v56 = v11;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,lock state changed isLocked:%s", buf, 0x2Au);
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v43 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v42 = [v43 sessionUUID];
    double v13 = (objc_class *)objc_opt_class();
    __int16 v40 = NSStringFromClass(v13);
    id v41 = NSStringFromSelector(a2);
    double v14 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v15 = [v14 unlockLocation];
    double v16 = [v15 date];
    double v39 = [v16 stringFromDate];
    double v17 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v18 = [v17 lockLocation];
    double v19 = [v18 date];
    double v20 = [v19 stringFromDate];
    uint32_t v21 = [(SMInitiatorCacheManager *)self initiatorContact];
    int v22 = [v21 lockState];
    *(_DWORD *)buf = 138413826;
    id v50 = v42;
    __int16 v51 = 2112;
    uint64_t v52 = v40;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v41;
    __int16 v55 = 2112;
    __int16 v56 = v39;
    __int16 v57 = 2112;
    id v58 = v20;
    __int16 v59 = 1024;
    BOOL v60 = v45;
    __int16 v61 = 1024;
    int v62 = v22;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,checking expected lock state, unlock date %@, lock date %@, new lock state %d, prev lock state %d ", buf, 0x40u);
  }
  int v23 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v24 = v23;
  if (v45)
  {
    __int16 v25 = [v23 lockLocation];
    if (([v25 isValid] & 1) == 0)
    {
LABEL_9:

LABEL_12:
      __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = [(SMInitiatorCacheManager *)self sessionUUID];
        id v30 = (objc_class *)objc_opt_class();
        uint64_t v31 = NSStringFromClass(v30);
        id v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v50 = v29;
        __int16 v51 = 2112;
        uint64_t v52 = v31;
        __int16 v53 = 2112;
        uint64_t v54 = (uint64_t)v32;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, update lock state required", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __45__SMInitiatorCacheManager_onLockStateChange___block_invoke;
      v46[3] = &unk_1E6B98300;
      objc_copyWeak(&v47, (id *)buf);
      BOOL v48 = v45;
      [(SMInitiatorCacheManager *)self _fetchLocationWithCompletion:v46];
      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {
    __int16 v25 = [v23 unlockLocation];
    if (![v25 isValid]) {
      goto LABEL_9;
    }
  }
  __int16 v26 = [(SMInitiatorCacheManager *)self initiatorContact];
  unsigned __int8 v27 = [v26 lockState];

  if ((v27 ^ v45)) {
    goto LABEL_12;
  }
  id v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [(SMInitiatorCacheManager *)self initiatorContact];
    id v35 = [v34 sessionUUID];
    __int16 v36 = (objc_class *)objc_opt_class();
    uint64_t v37 = NSStringFromClass(v36);
    __int16 v38 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v50 = v35;
    __int16 v51 = 2112;
    uint64_t v52 = v37;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v38;
    _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@, lock state changed no update needed", buf, 0x20u);
  }
}

void __45__SMInitiatorCacheManager_onLockStateChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6 && !a3) {
    [WeakRetained _updateLockState:*(unsigned __int8 *)(a1 + 40) location:v6];
  }
}

- (void)_updateLockState:(BOOL)a3 location:(id)a4
{
  BOOL v4 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 isValid])
    {
      uint64_t v9 = [(SMInitiatorCacheManager *)self initiatorContact];
      double v10 = [v9 shouldBeCleanedUpDate];

      double v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v12)
        {
          double v13 = [(SMInitiatorCacheManager *)self sessionUUID];
          double v14 = (objc_class *)objc_opt_class();
          id v15 = NSStringFromClass(v14);
          double v16 = NSStringFromSelector(a2);
          int v30 = 138412802;
          uint64_t v31 = v13;
          __int16 v32 = 2112;
          id v33 = v15;
          __int16 v34 = 2112;
          id v35 = v16;
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,contact should be cleaned up", (uint8_t *)&v30, 0x20u);
        }
      }
      else
      {
        if (v12)
        {
          int v23 = [(SMInitiatorCacheManager *)self sessionUUID];
          id v24 = (objc_class *)objc_opt_class();
          __int16 v25 = NSStringFromClass(v24);
          __int16 v26 = NSStringFromSelector(a2);
          int v30 = 138413314;
          uint64_t v31 = v23;
          __int16 v32 = 2112;
          id v33 = v25;
          __int16 v34 = 2112;
          id v35 = v26;
          __int16 v36 = 1024;
          BOOL v37 = v4;
          __int16 v38 = 2112;
          double v39 = v8;
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,update lock state %d with location %@", (uint8_t *)&v30, 0x30u);
        }
        unsigned __int8 v27 = [(SMInitiatorCacheManager *)self initiatorContact];
        __int16 v28 = v27;
        if (v4) {
          [v27 setLockLocation:v8];
        }
        else {
          [v27 setUnlockLocation:v8];
        }

        __int16 v29 = [(SMInitiatorCacheManager *)self initiatorContact];
        [v29 setLockState:v4];

        [(SMInitiatorCacheManager *)self _updateInitiatorContactInStore];
      }
    }
    else
    {
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        double v19 = [(SMInitiatorCacheManager *)self sessionUUID];
        double v20 = (objc_class *)objc_opt_class();
        uint32_t v21 = NSStringFromClass(v20);
        int v22 = NSStringFromSelector(a2);
        int v30 = 138412802;
        uint64_t v31 = v19;
        __int16 v32 = 2112;
        id v33 = v21;
        __int16 v34 = 2112;
        id v35 = v22;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalid location", (uint8_t *)&v30, 0x20u);
      }
    }
  }
  else
  {
    double v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v30) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)&v30, 2u);
    }
  }
}

- (double)getCacheUpdateBackstopTimeout
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(SMInitiatorCacheManager *)self cacheUpdateBackstopTimeout];
  if (v4 == 0.0)
  {
    id v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultCacheUpdateBackstopTimeout"];
    id v6 = v5;
    if (v5) {
      [v5 doubleValue];
    }
    else {
      double v7 = 900.0;
    }
    [(SMInitiatorCacheManager *)self setCacheUpdateBackstopTimeout:v7];
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SMInitiatorCacheManager *)self sessionUUID];
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      BOOL v12 = NSStringFromSelector(a2);
      double cacheUpdateBackstopTimeout = self->_cacheUpdateBackstopTimeout;
      int v15 = 138413058;
      double v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      double v20 = v12;
      __int16 v21 = 2048;
      double v22 = cacheUpdateBackstopTimeout;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Cache backstop timeout %lf", (uint8_t *)&v15, 0x2Au);
    }
  }
  [(SMInitiatorCacheManager *)self cacheUpdateBackstopTimeout];
  return result;
}

- (void)onHealthKitManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(SMInitiatorCacheManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SMInitiatorCacheManager_onHealthKitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__SMInitiatorCacheManager_onHealthKitManagerNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workoutSnapshot];
  [*(id *)(a1 + 40) _onHealthKitManagerWorkoutSnapshotUpdate:v2];
}

- (void)_onHealthKitManagerWorkoutSnapshotUpdate:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = [(SMInitiatorCacheManager *)self sessionManagerState];
  if (![v6 isActiveState]
    || ![(SMInitiatorCacheManager *)self isActiveDevice])
  {

LABEL_10:
    BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [(SMInitiatorCacheManager *)self sessionUUID];
      double v22 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v22);
      double v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      unsigned __int8 v27 = v17;
      __int16 v28 = 2112;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,invalid state for workout update, %@";
      goto LABEL_16;
    }
LABEL_11:

    goto LABEL_12;
  }
  double v7 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v8 = [v7 configuration];
  uint64_t v9 = [v8 sessionType];

  if (v9 != 4) {
    goto LABEL_10;
  }
  BOOL v10 = [(SMInitiatorCacheManager *)self _shouldIncludeWorkoutSnapshotInCache:v5];
  double v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [(SMInitiatorCacheManager *)self sessionUUID];
      uint64_t v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      double v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      unsigned __int8 v27 = v17;
      __int16 v28 = 2112;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v21 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,workout update not to be included in cache, %@";
LABEL_16:
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, v21, buf, 0x2Au);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = [(SMInitiatorCacheManager *)self sessionUUID];
    double v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    double v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    unsigned __int8 v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v15;
    __int16 v30 = 2112;
    uint64_t v31 = v16;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,updating workout event, %@", buf, 0x2Au);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v23[2] = __68__SMInitiatorCacheManager__onHealthKitManagerWorkoutSnapshotUpdate___block_invoke;
  v23[3] = &unk_1E6B98328;
  void v23[4] = self;
  SEL v25 = a2;
  id v24 = v5;
  [(SMInitiatorCacheManager *)self _fetchLocationWithCompletion:v23];

LABEL_12:
}

void __68__SMInitiatorCacheManager__onHealthKitManagerWorkoutSnapshotUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v62 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v48 = [*(id *)(a1 + 32) sessionUUID];
      __int16 v49 = (objc_class *)objc_opt_class();
      id v50 = NSStringFromClass(v49);
      __int16 v51 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v52 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      __int16 v64 = v48;
      __int16 v65 = 2112;
      __int16 v66 = v50;
      __int16 v67 = 2112;
      __int16 v68 = v51;
      __int16 v69 = 2112;
      long long v70 = v52;
      __int16 v71 = 2112;
      id v72 = v62;
      __int16 v73 = 2112;
      id v74 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,error with fetching location for workout event, %@, location, %@ error, %@", buf, 0x3Eu);
    }
  }
  double v7 = [*(id *)(a1 + 40) snapshotDate];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] now];
  }
  BOOL v10 = v9;

  double v11 = [*(id *)(a1 + 32) initiatorContact];
  BOOL v12 = [v11 workoutEvents];
  if ([v12 count] || objc_msgSend(*(id *)(a1 + 40), "sessionState") != 2)
  {
  }
  else
  {
    double v13 = [*(id *)(a1 + 40) workoutStartDate];

    if (!v13) {
      goto LABEL_14;
    }
    [*(id *)(a1 + 40) workoutStartDate];
    BOOL v10 = v11 = v10;
  }

LABEL_14:
  double v14 = [*(id *)(a1 + 32) initiatorContact];
  int v15 = [v14 workoutEvents];
  double v16 = [v15 lastObject];

  __int16 v61 = v5;
  if (!v16) {
    goto LABEL_24;
  }
  __int16 v17 = [v16 sessionIdentifier];
  uint64_t v18 = [*(id *)(a1 + 40) sessionIdentifier];
  if ([v17 isEqual:v18])
  {
    uint64_t v19 = [v16 activityType];
    if (v19 == [*(id *)(a1 + 40) activityType] && objc_msgSend(v16, "sessionState") == 4)
    {
      uint64_t v20 = [*(id *)(a1 + 40) sessionState];

      if (v20 == 2)
      {
        __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __int16 v55 = [*(id *)(a1 + 32) sessionUUID];
          __int16 v56 = (objc_class *)objc_opt_class();
          __int16 v57 = NSStringFromClass(v56);
          id v58 = NSStringFromSelector(*(SEL *)(a1 + 48));
          __int16 v59 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138413314;
          __int16 v64 = v55;
          __int16 v65 = 2112;
          __int16 v66 = v57;
          __int16 v67 = 2112;
          __int16 v68 = v58;
          __int16 v69 = 2112;
          long long v70 = v16;
          __int16 v71 = 2112;
          id v72 = v59;
          _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@, the new event is a Resume. Last event, %@, new workout snapshot, %@", buf, 0x34u);
        }
        char v21 = 1;
        goto LABEL_23;
      }
LABEL_24:
      char v21 = 0;
      goto LABEL_25;
    }
  }

  char v21 = 0;
LABEL_23:

LABEL_25:
  double v22 = [*(id *)(a1 + 40) sessionIdentifier];
  uint64_t v23 = [*(id *)(a1 + 40) activityType];
  uint64_t v24 = [*(id *)(a1 + 40) locationType];
  uint64_t v25 = [*(id *)(a1 + 40) swimmingLocationType];
  uint64_t v26 = [*(id *)(a1 + 40) sessionState];
  if (v16 && v26 == 3)
  {
    if (!v22)
    {
      double v22 = [v16 sessionIdentifier];

      if (v22)
      {
        double v22 = [v16 sessionIdentifier];
      }
    }
    if (v23)
    {
      if (v24) {
        goto LABEL_32;
      }
LABEL_40:
      if ([v16 locationType])
      {
        uint64_t v24 = [v16 locationType];
        if (v25) {
          goto LABEL_44;
        }
      }
      else
      {
        uint64_t v24 = 0;
        if (v25) {
          goto LABEL_44;
        }
      }
      goto LABEL_33;
    }
    if ([v16 activityType])
    {
      uint64_t v23 = [v16 activityType];
      if (!v24) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v23 = 0;
      if (!v24) {
        goto LABEL_40;
      }
    }
LABEL_32:
    if (v25) {
      goto LABEL_44;
    }
LABEL_33:
    if ([v16 swimmingLocationType]) {
      uint64_t v25 = [v16 swimmingLocationType];
    }
    else {
      uint64_t v25 = 0;
    }
  }
LABEL_44:
  id v27 = objc_alloc(MEMORY[0x1E4F999E0]);
  __int16 v28 = [MEMORY[0x1E4F29128] UUID];
  LOBYTE(v60) = v21;
  __int16 v29 = [v27 initWithIdentifier:v28 sessionIdentifier:v22 location:v62 activityType:v23 locationType:v24 swimmingLocationType:v25 sessionState:[*(id *)(a1 + 40) sessionState] isResumedSessionState:v60 date:v10];

  if (!v29)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = [*(id *)(a1 + 32) sessionUUID];
      __int16 v53 = (objc_class *)objc_opt_class();
      __int16 v38 = NSStringFromClass(v53);
      double v39 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v54 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      __int16 v64 = v36;
      __int16 v65 = 2112;
      __int16 v66 = v38;
      __int16 v67 = 2112;
      __int16 v68 = v39;
      __int16 v69 = 2112;
      long long v70 = v54;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to construct an SMWorkoutEvent with RTCurrentWorkoutSnapshot, %@", buf, 0x2Au);
      goto LABEL_59;
    }
LABEL_52:

    goto LABEL_57;
  }
  if (v16)
  {
    __int16 v30 = [v16 sessionIdentifier];
    uint64_t v31 = [v29 sessionIdentifier];
    if ([v30 isEqual:v31]
      && (uint64_t v32 = [v16 activityType], v32 == objc_msgSend(v29, "activityType")))
    {
      uint64_t v33 = [v16 sessionState];
      uint64_t v34 = [v29 sessionState];

      if (v33 == v34)
      {
        id v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          __int16 v36 = [*(id *)(a1 + 32) sessionUUID];
          BOOL v37 = (objc_class *)objc_opt_class();
          __int16 v38 = NSStringFromClass(v37);
          double v39 = NSStringFromSelector(*(SEL *)(a1 + 48));
          uint64_t v40 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138413314;
          __int16 v64 = v36;
          __int16 v65 = 2112;
          __int16 v66 = v38;
          __int16 v67 = 2112;
          __int16 v68 = v39;
          __int16 v69 = 2112;
          long long v70 = v16;
          __int16 v71 = 2112;
          id v72 = v40;
          _os_log_debug_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ignoring duplicated workout event, last event, %@, new workout snapshot, %@", buf, 0x34u);
LABEL_59:

          goto LABEL_52;
        }
        goto LABEL_52;
      }
    }
    else
    {
    }
  }
  id v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [*(id *)(a1 + 32) sessionUUID];
    uint64_t v43 = (objc_class *)objc_opt_class();
    __int16 v44 = NSStringFromClass(v43);
    BOOL v45 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    __int16 v64 = v42;
    __int16 v65 = 2112;
    __int16 v66 = v44;
    __int16 v67 = 2112;
    __int16 v68 = v45;
    __int16 v69 = 2112;
    long long v70 = v29;
    _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,adding workout event to intiator contact, %@", buf, 0x2Au);
  }
  uint64_t v46 = [*(id *)(a1 + 32) initiatorContact];
  id v47 = [v46 workoutEvents];
  [v47 addObject:v29];

  [*(id *)(a1 + 32) _updateInitiatorContactInStore];
LABEL_57:
}

- (BOOL)_shouldIncludeWorkoutSnapshotInCache:(id)a3
{
  unint64_t v3 = [a3 sessionState];
  return (v3 < 7) & (0x5Cu >> v3);
}

- (void)submitCAMetricInitiatorSession
{
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v3 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v4 = [v3 syncDate];
  id v5 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v6 = [v5 configuration];
  double v7 = [v6 sessionStartDate];
  [v4 timeIntervalSinceDate:v7];
  double v9 = v8;

  BOOL v10 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v11 = [v10 numCacheUpdates];

  if (v11 < 2)
  {
    [v92 setValue:&unk_1F34513F8 forKey:@"averageTimeBetweenCacheUpdates"];
  }
  else
  {
    BOOL v12 = NSNumber;
    double v13 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v14 = [v12 numberWithDouble:v9 / (double)[v13 numCacheUpdates] - 1]);
    [v92 setValue:v14 forKey:@"averageTimeBetweenCacheUpdates"];
  }
  int v15 = NSNumber;
  double v16 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v16 maxCacheSize];
  uint64_t v18 = [v15 numberWithDouble:v17 * 0.0009765625];
  [v92 setValue:v18 forKey:@"maxCacheSize"];

  uint64_t v19 = NSNumber;
  uint64_t v20 = [(SMInitiatorCacheManager *)self initiatorContact];
  char v21 = [v19 numberWithInteger:[v20 maxLocationsInTrace]];
  [v92 setValue:v21 forKey:@"maxLocationsInTrace"];

  double v22 = NSNumber;
  uint64_t v23 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v23 maxTimeBetweenCacheUpdates];
  uint64_t v24 = [v22 numberWithDouble:];
  [v92 setValue:v24 forKey:@"maxTimeBetweenCacheUpdates"];

  uint64_t v25 = NSNumber;
  uint64_t v26 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v27 = [v25 numberWithInteger:[v26 numCacheUpdates]];
  [v92 setValue:v27 forKey:@"numCacheUpdates"];

  __int16 v28 = NSNumber;
  __int16 v29 = [(SMInitiatorCacheManager *)self sessionManagerState];
  __int16 v30 = [v29 configuration];
  uint64_t v31 = [v30 sessionStartDate];
  [v31 timeIntervalSinceNow];
  uint64_t v33 = [v28 numberWithDouble:v32 / -60.0];
  [v92 setValue:v33 forKey:@"sessionDuration"];

  uint64_t v34 = NSNumber;
  id v35 = [(SMInitiatorCacheManager *)self initiatorContact];
  [v35 timeTilCacheRelease];
  BOOL v37 = [v34 numberWithDouble:v36 / 60.0];
  [v92 setValue:v37 forKey:@"timeTilCacheRelease"];

  __int16 v38 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v39 = [v38 numCacheUpdates];

  if (v39 < 1)
  {
    unint64_t v43 = 0;
  }
  else
  {
    uint64_t v40 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v41 = (double)[v40 numberOfSuccessfulCacheUpdates];
    uint64_t v42 = [(SMInitiatorCacheManager *)self initiatorContact];
    unint64_t v43 = vcvtpd_s64_f64(v41 / (double)[v42 numCacheUpdates] * 100.0);
  }
  __int16 v44 = [NSNumber numberWithInteger:v43];
  [v92 setValue:v44 forKey:@"percentageOfSuccessfulCacheUpdates"];

  BOOL v45 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v46 = [v45 numberOfMessageCancelling];

  if (v46 < 1)
  {
    unint64_t v50 = 0;
  }
  else
  {
    id v47 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v48 = (double)[v47 numberOfSuccessfulMessageCancelling];
    __int16 v49 = [(SMInitiatorCacheManager *)self initiatorContact];
    unint64_t v50 = vcvtpd_s64_f64(v48 / (double)[v49 numberOfMessageCancelling] * 100.0);
  }
  __int16 v51 = [NSNumber numberWithInteger:v50];
  [v92 setValue:v51 forKey:@"percentageOfSuccessfulMessageCanceling"];

  uint64_t v52 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v53 = [v52 numberOfMessageScheduling];

  if (v53 < 1)
  {
    unint64_t v57 = 0;
  }
  else
  {
    uint64_t v54 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v55 = (double)[v54 numberOfSuccessfulMessageScheduling];
    __int16 v56 = [(SMInitiatorCacheManager *)self initiatorContact];
    unint64_t v57 = vcvtpd_s64_f64(v55 / (double)[v56 numberOfMessageScheduling] * 100.0);
  }
  id v58 = [NSNumber numberWithInteger:v57];
  [v92 setValue:v58 forKey:@"percentageOfSuccessfulMessageScheduling"];

  __int16 v59 = NSNumber;
  uint64_t v60 = [(SMInitiatorCacheManager *)self sessionManagerState];
  __int16 v61 = [v60 configuration];
  id v62 = [v59 numberWithUnsignedInteger:[v61 sessionType]];
  [v92 setValue:v62 forKey:@"sessionType"];

  uint64_t v63 = NSNumber;
  __int16 v64 = [(SMInitiatorCacheManager *)self sessionManagerState];
  __int16 v65 = [v64 monitorContext];
  __int16 v66 = [v63 numberWithUnsignedInteger:[v65 triggerCategory]];
  [v92 setValue:v66 forKey:@"triggerType"];

  __int16 v67 = NSNumber;
  __int16 v68 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v69 = [v67 numberWithBool:[v68 wasCacheReleased]];
  [v92 setValue:v69 forKey:@"wasCacheReleased"];

  long long v70 = [NSNumber numberWithBool:[MEMORY[0x1E4F998E0] shareAllLocations]];
  [v92 setValue:v70 forKey:@"wasLocationHistoryEnabled"];

  __int16 v71 = NSNumber;
  id v72 = [(SMInitiatorCacheManager *)self initiatorContact];
  __int16 v73 = [v71 numberWithBool:[v72 wasScheduledSendTriggered]];
  [v92 setValue:v73 forKey:@"wasScheduledSendTriggered"];

  id v74 = NSNumber;
  uint64_t v75 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v76 = [v74 numberWithInteger:[v75 numberOfHandoffBecomingActive]];
  [v92 setValue:v76 forKey:@"numTakeover"];

  uint64_t v77 = NSNumber;
  id v78 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v79 = [v77 numberWithInteger:[v78 numberOfHandoffBecomingNonActive]];
  [v92 setValue:v79 forKey:@"numHandoff"];

  id v80 = NSNumber;
  id v81 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v82 = [v81 earliestActiveDeviceIdentifier];
  id v83 = [(SMInitiatorCacheManager *)self messagingService];
  id v84 = [v83 deviceIdentifier];
  __int16 v85 = [v80 numberWithBool:[v82 isEqual:v84]];
  [v92 setValue:v85 forKey:@"isActiveAtStart"];

  id v86 = NSNumber;
  id v87 = [(SMInitiatorCacheManager *)self initiatorContact];
  id v88 = [v87 latestActiveDeviceIdentifier];
  id v89 = [(SMInitiatorCacheManager *)self messagingService];
  BOOL v90 = [v89 deviceIdentifier];
  uint64_t v91 = [v86 numberWithBool:[v88 isEqual:v90]];
  [v92 setValue:v91 forKey:@"isActiveAtEnd"];

  AnalyticsSendEvent();
}

- (void)storeCAMetricForAllLocations:(id)a3
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];

  if (v6)
  {
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    double v7 = objc_alloc_init(SMCAMetricCacheUpdate);
    [(SMInitiatorCacheManager *)self setCaMetricCacheUpdate:v7];

    if (!v5)
    {
LABEL_10:
      __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = [(SMInitiatorCacheManager *)self sessionUUID];
        uint64_t v31 = (objc_class *)objc_opt_class();
        double v32 = NSStringFromClass(v31);
        uint64_t v33 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v141 = v30;
        __int16 v142 = 2112;
        v143 = v32;
        __int16 v144 = 2112;
        v145 = v33;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,empty list of locations", buf, 0x20u);
      }
      uint64_t v34 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v34 setNumLocationsInTrace:0];

      id v35 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v35 setAverageHuncForLocationsInTrace:-1.0];

      double v36 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v36 setAverageTimeBetweenLocationsInTrace:-1.0];

      BOOL v37 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v37 setAverageDistanceBetweenLocationsInTrace:-1.0];

      __int16 v38 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v38 setMinHuncForLocationsInTrace:-1.0];

      uint64_t v25 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v25 setMaxHuncForLocationsInTrace:-1.0];
      goto LABEL_37;
    }
  }
  if (![v5 count]) {
    goto LABEL_10;
  }
  if ((unint64_t)[v5 count] > 1)
  {
    aSelector = a2;
    uint64_t v39 = objc_alloc_init(RTDistanceCalculator);
    uint64_t v40 = [v5 count];
    double v41 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v41 setNumLocationsInTrace:v40];

    uint64_t v25 = v39;
    [v5 count];
    uint64_t v42 = 0;
    double v43 = 0.0;
    *(void *)&long long v44 = 138413058;
    long long v134 = v44;
    double v45 = 0.0;
    double v46 = 0.0;
    long long v136 = v39;
    do
    {
      id v47 = [v5 objectAtIndexedSubscript:v42];
      [v47 hunc];
      double v49 = v48;
      [v47 hunc];
      double v51 = v50;
      uint64_t v52 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v52 minHuncForLocationsInTrace];
      double v54 = v53;

      if (v51 < v54)
      {
        [v47 hunc];
        double v56 = v55;
        unint64_t v57 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v57 setMinHuncForLocationsInTrace:v56];
      }
      [v47 hunc];
      double v59 = v58;
      uint64_t v60 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v60 maxHuncForLocationsInTrace];
      double v62 = v61;

      if (v59 > v62)
      {
        [v47 hunc];
        double v64 = v63;
        __int16 v65 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v65 setMaxHuncForLocationsInTrace:v64];
      }
      v139.latitude = 0.0;
      v139.longitude = 0.0;
      [v47 latitude];
      CLLocationDegrees v67 = v66;
      [v47 longitude];
      CLLocationCoordinate2D v139 = CLLocationCoordinate2DMake(v67, v68);
      __int16 v69 = [v5 objectAtIndexedSubscript:++v42];
      v138.latitude = 0.0;
      v138.longitude = 0.0;
      [v69 latitude];
      CLLocationDegrees v71 = v70;
      [v69 longitude];
      CLLocationCoordinate2D v138 = CLLocationCoordinate2DMake(v71, v72);
      id v137 = 0;
      [v25 distanceFromLocationCoordinate:&v139 toLocationCoordinate:&v138 error:&v137];
      double v74 = v73;
      id v75 = v137;
      if (v75)
      {
        uint64_t v76 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          id v97 = [(SMInitiatorCacheManager *)self sessionUUID];
          __int16 v98 = (objc_class *)objc_opt_class();
          v99 = NSStringFromClass(v98);
          __int16 v100 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = v134;
          v141 = v97;
          __int16 v142 = 2112;
          v143 = v99;
          __int16 v144 = 2112;
          v145 = v100;
          __int16 v146 = 2112;
          id v147 = v75;
          _os_log_error_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,distanceBetweenLocations,error %@", buf, 0x2Au);

          uint64_t v25 = v136;
        }
      }
      else
      {
        double v45 = v45 + v74;
      }
      uint64_t v77 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v77 minDistanceBetweenLocationsInTrace];
      double v79 = v78;

      if (v74 < v79)
      {
        id v80 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v80 setMinDistanceBetweenLocationsInTrace:v74];
      }
      id v81 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v81 maxDistanceBetweenLocationsInTrace];
      double v83 = v82;

      if (v74 > v83)
      {
        id v84 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v84 setMaxDistanceBetweenLocationsInTrace:v74];
      }
      __int16 v85 = [v47 date];
      id v86 = [v69 date];
      [v85 timeIntervalSinceDate:v86];
      double v88 = v87 / -60.0;

      id v89 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v89 minTimeBetweenLocationsInTrace];
      double v91 = v90;

      if (v88 < v91)
      {
        id v92 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v92 setMinTimeBetweenLocationsInTrace:v88];
      }
      id v93 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v93 maxTimeBetweenLocationsInTrace];
      double v95 = v94;

      if (v88 > v95)
      {
        __int16 v96 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
        [v96 setMaxTimeBetweenLocationsInTrace:v88];
      }
      double v43 = v43 + v49;
      double v46 = v46 + v88;
    }
    while ([v5 count] - 2 > (unint64_t)(v42 - 1));
    int v101 = [v5 objectAtIndexedSubscript:[v5 count] - 1];
    [v101 hunc];
    double v103 = v102;

    __int16 v104 = [v5 objectAtIndexedSubscript:[v5 count] - 1];
    [v104 hunc];
    double v106 = v105;
    int v107 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v107 minHuncForLocationsInTrace];
    double v109 = v108;

    if (v106 < v109)
    {
      uint64_t v110 = [v5 objectAtIndexedSubscript:[v5 count] - 1];
      [v110 hunc];
      double v112 = v111;
      uint64_t v113 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v113 setMinHuncForLocationsInTrace:v112];
    }
    double v114 = v43 + v103;
    v115 = [v5 objectAtIndexedSubscript:[v5 count] - 1];
    [v115 hunc];
    double v117 = v116;
    v118 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v118 maxHuncForLocationsInTrace];
    double v120 = v119;

    if (v117 > v120)
    {
      v121 = [v5 objectAtIndexedSubscript:[v5 count] - 1];
      [v121 hunc];
      double v123 = v122;
      v124 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
      [v124 setMaxHuncForLocationsInTrace:v123];
    }
    v125 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    double v126 = v114 / (double)[v125 numLocationsInTrace];
    BOOL v127 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v127 setAverageHuncForLocationsInTrace:v126];

    v128 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    double v129 = v46 / (double)([v128 numLocationsInTrace] - 1);
    v130 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v130 setAverageTimeBetweenLocationsInTrace:v129];

    v131 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    double v132 = v45 / (double)([v131 numLocationsInTrace] - 1);
    v133 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v133 setAverageDistanceBetweenLocationsInTrace:v132];
  }
  else
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [(SMInitiatorCacheManager *)self sessionUUID];
      BOOL v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      BOOL v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v141 = v9;
      __int16 v142 = 2112;
      v143 = v11;
      __int16 v144 = 2112;
      v145 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,one location available", buf, 0x20u);
    }
    uint64_t v13 = [v5 count];
    double v14 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v14 setNumLocationsInTrace:v13];

    int v15 = [v5 objectAtIndex:0];
    [v15 hunc];
    double v17 = v16;
    uint64_t v18 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v18 setAverageHuncForLocationsInTrace:v17];

    uint64_t v19 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v19 setAverageTimeBetweenLocationsInTrace:-1.0];

    uint64_t v20 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v20 setAverageDistanceBetweenLocationsInTrace:-1.0];

    char v21 = [v5 objectAtIndex:0];
    [v21 hunc];
    double v23 = v22;
    uint64_t v24 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v24 setMinHuncForLocationsInTrace:v23];

    uint64_t v25 = [v5 objectAtIndex:0];
    [v25 hunc];
    double v27 = v26;
    __int16 v28 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
    [v28 setMaxHuncForLocationsInTrace:v27];
  }
LABEL_37:
}

- (void)submitCacheUpdateCAMetricForCache:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v115 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_alloc_init(RTDistanceCalculator);
  uint64_t v12 = [v9 startingLocation];
  if (v12
    && (uint64_t v13 = (void *)v12,
        [v9 mostRecentLocation],
        double v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    int v15 = [v9 startingLocation];
    [v15 latitude];
    CLLocationDegrees v17 = v16;
    uint64_t v18 = [v9 startingLocation];
    [v18 longitude];
    CLLocationCoordinate2D v118 = CLLocationCoordinate2DMake(v17, v19);

    uint64_t v20 = [v9 mostRecentLocation];
    [v20 latitude];
    CLLocationDegrees v22 = v21;
    double v23 = [v9 mostRecentLocation];
    [v23 longitude];
    CLLocationCoordinate2D v117 = CLLocationCoordinate2DMake(v22, v24);

    id v116 = 0;
    [(RTDistanceCalculator *)v11 distanceFromLocationCoordinate:&v118 toLocationCoordinate:&v117 error:&v116];
    double v26 = v25;
    id v27 = v116;
    if (v27)
    {
      __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v110 = [(SMInitiatorCacheManager *)self sessionUUID];
        double v111 = (objc_class *)objc_opt_class();
        NSStringFromClass(v111);
        double v112 = v114 = v11;
        uint64_t v113 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        double v120 = v110;
        __int16 v121 = 2112;
        double v122 = v112;
        __int16 v123 = 2112;
        v124 = v113;
        __int16 v125 = 2112;
        id v126 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,distanceFromStartingLocation,error %@", buf, 0x2Au);

        uint64_t v11 = v114;
      }

      [v10 setValue:&unk_1F34513F8 forKey:@"distanceFromStartingLocation"];
    }
    else
    {
      __int16 v30 = [NSNumber numberWithDouble:v26];
      [v10 setValue:v30 forKey:@"distanceFromStartingLocation"];
    }
    __int16 v29 = v11;
  }
  else
  {
    __int16 v29 = v11;
    [v10 setValue:&unk_1F34513F8 forKey:@"distanceFromStartingLocation"];
  }
  uint64_t v31 = NSNumber;
  double v32 = [v9 mostRecentLocation];
  uint64_t v33 = [v32 date];
  [v33 timeIntervalSinceNow];
  id v35 = [v31 numberWithDouble:-v34];
  [v10 setValue:v35 forKey:@"mostRecentLocationAge"];

  double v36 = NSNumber;
  BOOL v37 = [v9 mostRecentLocation];
  [v37 hunc];
  __int16 v38 = [v36 numberWithDouble:];
  [v10 setValue:v38 forKey:@"mostRecentLocationHunc"];

  uint64_t v39 = NSNumber;
  uint64_t v40 = [(SMInitiatorCacheManager *)self sessionManagerState];
  double v41 = [v40 configuration];
  uint64_t v42 = [v41 sessionStartDate];
  [v42 timeIntervalSinceNow];
  long long v44 = [v39 numberWithDouble:-v43];
  [v10 setValue:v44 forKey:@"sessionDuration"];

  double v45 = NSNumber;
  double v46 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v47 = [v45 numberWithInt:objc_msgSend(v46, "sessionState") == 4];
  [v10 setValue:v47 forKey:@"hasCacheBeenReleased"];

  double v48 = NSNumber;
  double v49 = [(SMInitiatorCacheManager *)self sessionManagerState];
  double v50 = [v49 configuration];
  double v51 = [v48 numberWithUnsignedInteger:[v50 sessionType]];
  [v10 setValue:v51 forKey:@"sessionType"];

  uint64_t v52 = v115;
  if (v115)
  {
    double v53 = NSString;
    double v54 = [v115 domain];
    double v55 = [v53 stringWithFormat:@"%@:%d", v54, [v115 code]];
    [v10 setValue:v55 forKey:@"uploadError"];
  }
  double v56 = [NSNumber numberWithBool:v6];
  [v10 setValue:v56 forKey:@"wasSuccessful"];

  unint64_t v57 = [NSNumber numberWithBool:[MEMORY[0x1E4F998E0] shareAllLocations]];
  [v10 setValue:v57 forKey:@"wasLocationHistoryEnabled"];

  double v58 = [(SMInitiatorCacheManager *)self sessionManagerState];
  double v59 = [v58 configuration];
  uint64_t v60 = [v59 sessionType];

  double v61 = [(SMInitiatorCacheManager *)self sessionManagerState];
  double v62 = [v61 configuration];
  double v63 = v62;
  if (v60 == 1)
  {
    double v64 = [v62 time];
    __int16 v65 = [v64 timeBound];
    [v65 timeIntervalSinceNow];
    double v67 = v66;

    uint64_t v52 = v115;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v68 = [v62 sessionType];

  double v67 = -1.0;
  if (v68 == 2)
  {
    double v61 = [(SMInitiatorCacheManager *)self sessionManagerState];
    double v63 = [v61 estimatedEndDate];
    [v63 timeIntervalSinceNow];
    double v67 = v69;
    goto LABEL_16;
  }
LABEL_17:
  double v70 = [NSNumber numberWithDouble:ceil(v67 / 60.0)];
  [v10 setValue:v70 forKey:@"timeLeftInSession"];

  CLLocationDegrees v71 = NSNumber;
  CLLocationDegrees v72 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v72 cacheSize];
  double v74 = [v71 numberWithDouble:v73 * 0.0009765625];
  [v10 setValue:v74 forKey:@"cacheSize"];

  id v75 = NSNumber;
  uint64_t v76 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v76 averageDistanceBetweenLocationsInTrace];
  uint64_t v77 = [v75 numberWithDouble:];
  [v10 setValue:v77 forKey:@"averageDistanceBetweenLocationsInTrace"];

  double v78 = NSNumber;
  double v79 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v79 averageHuncForLocationsInTrace];
  id v80 = [v78 numberWithDouble:];
  [v10 setValue:v80 forKey:@"averageHuncForLocationsInTrace"];

  id v81 = NSNumber;
  double v82 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v82 averageTimeBetweenLocationsInTrace];
  double v83 = [v81 numberWithDouble:x0];
  [v10 setValue:v83 forKey:@"averageTimeBetweenLocationsInTrace"];

  id v84 = NSNumber;
  __int16 v85 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v85 maxDistanceBetweenLocationsInTrace];
  id v86 = [v84 numberWithDouble:];
  [v10 setValue:v86 forKey:@"maxDistanceBetweenLocationsInTrace"];

  double v87 = NSNumber;
  double v88 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v88 maxHuncForLocationsInTrace];
  id v89 = [v87 numberWithDouble:];
  [v10 setValue:v89 forKey:@"maxHuncForLocationsInTrace"];

  double v90 = NSNumber;
  double v91 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v91 maxTimeBetweenLocationsInTrace];
  id v92 = [v90 numberWithDouble:];
  [v10 setValue:v92 forKey:@"maxTimeBetweenLocationsInTrace"];

  id v93 = NSNumber;
  double v94 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v94 minDistanceBetweenLocationsInTrace];
  double v95 = [v93 numberWithDouble:];
  [v10 setValue:v95 forKey:@"minDistanceBetweenLocationsInTrace"];

  __int16 v96 = NSNumber;
  id v97 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v97 minHuncForLocationsInTrace];
  __int16 v98 = [v96 numberWithDouble:];
  [v10 setValue:v98 forKey:@"minHuncForLocationsInTrace"];

  v99 = NSNumber;
  __int16 v100 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  [v100 minTimeBetweenLocationsInTrace];
  int v101 = [v99 numberWithDouble:];
  [v10 setValue:v101 forKey:@"minTimeBetweenLocationsInTrace"];

  double v102 = NSNumber;
  double v103 = [(SMInitiatorCacheManager *)self caMetricCacheUpdate];
  __int16 v104 = [v102 numberWithInteger:[v103 numLocationsInTrace]];
  [v10 setValue:v104 forKey:@"numLocationsInTrace"];

  double v105 = NSNumber;
  +[RTRuntime footprint];
  double v106 = [v105 numberWithDouble:];
  [v10 setValue:v106 forKey:@"processFootprint"];

  int v107 = [[NSNumber numberWithBool:-[SMInitiatorCacheManager isActiveDevice](self, "isActiveDevice")];
  [v10 setValue:v107 forKey:@"isActive"];

  double v108 = [NSNumber numberWithBool:-[SMInitiatorCacheManager isCellularActivated](self, "isCellularActivated")];
  [v10 setValue:v108 forKey:@"isCellularActivated"];

  double v109 = [[NSNumber numberWithBool:-[SMInitiatorCacheManager isStandalone](self, "isStandalone")];
  [v10 setValue:v109 forKey:@"isStandalone"];

  AnalyticsSendEvent();
  [(SMInitiatorCacheManager *)self setCaMetricCacheUpdate:0];
}

- (void)submitPowerTelemetryMetricForEvent:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_98 != -1) {
    dispatch_once(&_MergedGlobals_98, &__block_literal_global_552);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v7 = +[SMInitiatorCacheManager getTelemetryEventStringForEvent:a3];
  [v6 setValue:v7 forKey:@"event"];

  double v8 = NSNumber;
  id v9 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v10 = [v9 configuration];
  uint64_t v11 = [v8 numberWithUnsignedInteger:[v10 sessionType]];
  [v6 setValue:v11 forKey:@"sessionType"];

  uint64_t v12 = [(SMInitiatorCacheManager *)self sessionUUID];
  uint64_t v13 = [v12 UUIDString];
  [v6 setValue:v13 forKey:@"sessionid"];

  if (a3 == 2)
  {
    double v14 = NSNumber;
    int v15 = [(SMInitiatorCacheManager *)self initiatorContact];
    double v16 = [v14 numberWithInteger:[v15 numCacheUpdates]];
    [v6 setValue:v16 forKey:@"numCacheUploads"];
  }
  CLLocationDegrees v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(SMInitiatorCacheManager *)self sessionUUID];
    CLLocationDegrees v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    double v21 = NSStringFromSelector(a2);
    int v22 = 138413058;
    double v23 = v18;
    __int16 v24 = 2112;
    double v25 = v20;
    __int16 v26 = 2112;
    id v27 = v21;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,eventDict:%@", (uint8_t *)&v22, 0x2Au);
  }
  PPSSendTelemetry();
}

uint64_t __62__SMInitiatorCacheManager_submitPowerTelemetryMetricForEvent___block_invoke()
{
  uint64_t result = PPSCreateTelemetryIdentifier();
  qword_1EBE38858 = result;
  return result;
}

+ (id)getTelemetryEventStringForEvent:(int64_t)a3
{
  unint64_t v3 = @"unknown";
  if (a3 == 2) {
    unint64_t v3 = @"stop";
  }
  if (a3 == 1) {
    return @"start";
  }
  else {
    return v3;
  }
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void (**)(id, id, void *, void *, void *, void *, void))a4;
  id v9 = [(SMInitiatorCacheManager *)self sessionUUID];
  int v10 = [v9 isEqual:v7];

  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v7 UUIDString];
      double v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      double v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v35 = v13;
      __int16 v36 = 2112;
      BOOL v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v16;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Returning the initiator safety cache", buf, 0x20u);
    }
    CLLocationDegrees v17 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v18 = [v17 phoneCache];
    CLLocationDegrees v19 = [(SMInitiatorCacheManager *)self initiatorContact];
    uint64_t v20 = [v19 watchCache];
    double v21 = [(SMInitiatorCacheManager *)self initiatorContact];
    int v22 = [v21 shouldBeCleanedUpDate];
    double v23 = [(SMInitiatorCacheManager *)self initiatorContact];
    __int16 v24 = [v23 keyReleaseMessageSendDate];
    v8[2](v8, v7, v18, v20, v22, v24, 0);

    double v8 = (void (**)(id, id, void *, void *, void *, void *, void))v19;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [v7 UUIDString];
      id v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      uint64_t v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v35 = v28;
      __int16 v36 = 2112;
      BOOL v37 = v30;
      __int16 v38 = 2112;
      uint64_t v39 = v31;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,SessionID mismatched", buf, 0x20u);
    }
    uint64_t v32 = *MEMORY[0x1E4F28568];
    double v25 = NSString;
    __int16 v26 = [(SMInitiatorCacheManager *)self sessionUUID];
    id v27 = [v25 stringWithFormat:@"SessionID mismatched, requestd cache for %@, found cache for %@", v7, v26];
    uint64_t v33 = v27;
    CLLocationDegrees v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];
    ((void (**)(id, id, void *, void *, void *, void *, void *))v8)[2](v8, v7, 0, 0, 0, 0, v18);
  }
}

- (void)_writeActiveSessionDetails:(int64_t)a3 qos:(id)a4 completion:(id)a5
{
  id v25 = a4;
  id v23 = a5;
  id v7 = (objc_class *)objc_opt_class();
  int v22 = NSStringFromClass(v7);
  double v8 = [(SMInitiatorCacheManager *)self sessionUUID];
  id v27 = objc_alloc(MEMORY[0x1E4F99800]);
  uint64_t v30 = [(SMInitiatorCacheManager *)self sessionManagerState];
  id v9 = [v30 activeDeviceIdentifier];
  id v29 = [(SMInitiatorCacheManager *)self initiatorContact];
  int v10 = [v29 keyReleaseMessageSendDate];
  uint64_t v11 = [(SMInitiatorCacheManager *)self initiatorContact];
  uint64_t v12 = [v11 scheduleSendMessageGUID];
  uint64_t v13 = [(SMInitiatorCacheManager *)self sessionManagerState];
  double v14 = [v13 configuration];
  int v15 = [v14 conversation];
  double v16 = [v15 receiverPrimaryHandles];
  __int16 v28 = (void *)[v27 initWithSessionID:v8 activeDeviceIdentifier:v9 cacheReleasedDate:v10 scheduledSendGUID:v12 receiverHandles:v16];

  objc_initWeak(location, self);
  CLLocationDegrees v17 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__SMInitiatorCacheManager__writeActiveSessionDetails_qos_completion___block_invoke;
  v31[3] = &unk_1E6B98260;
  objc_copyWeak(v37, location);
  id v18 = v8;
  id v32 = v18;
  id v19 = v22;
  id v33 = v19;
  v37[1] = (id)a2;
  id v20 = v23;
  v37[2] = (id)a3;
  id v36 = v20;
  double v34 = self;
  id v21 = v25;
  id v35 = v21;
  [v17 writeActiveSessionDetailsRecord:v28 qos:v21 completion:v31];

  objc_destroyWeak(v37);
  objc_destroyWeak(location);
}

void __69__SMInitiatorCacheManager__writeActiveSessionDetails_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v27 = 138412802;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      id v32 = v20;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete", (uint8_t *)&v27, 0x20u);
    }
    int v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_18;
  }
  if (!v4)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v27 = 138412802;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,active session details stored", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_17;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      int v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_18:
      v10();
      goto LABEL_19;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    double v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    int v27 = 138413058;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v4;
    CLLocationDegrees v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with non recoverable error %@";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, 0x2Au);

    goto LABEL_17;
  }
  uint64_t v6 = *(void *)(a1 + 88);
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    double v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    int v27 = 138413058;
    uint64_t v28 = v25;
    __int16 v29 = 2112;
    uint64_t v30 = v26;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v4;
    CLLocationDegrees v17 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details after retries with recoverable error %@";
    goto LABEL_21;
  }
  if (v8)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v24 = *(void *)(a1 + 88);
    int v27 = 138413314;
    uint64_t v28 = v21;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 1024;
    int v36 = v24;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to write active session details with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v27, 0x30u);
  }
  [*(id *)(a1 + 48) _writeActiveSessionDetails:*(void *)(a1 + 88) - 1 qos:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
LABEL_19:
}

- (void)_deleteActiveSessionDetails:(int64_t)a3
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  BOOL v8 = [(SMInitiatorCacheManager *)self sessionUUID];
  id v9 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
  objc_initWeak(&location, self);
  int v10 = [(SMInitiatorCacheManager *)self activeSessionDetailsZone];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __55__SMInitiatorCacheManager__deleteActiveSessionDetails___block_invoke;
  v13[3] = &unk_1E6B98350;
  objc_copyWeak(v17, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v7;
  v17[1] = (id)a2;
  v17[2] = (id)a3;
  id v15 = v12;
  double v16 = self;
  [v10 deleteActiveSessionDetailsRecordWithQos:v9 completion:v13];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __55__SMInitiatorCacheManager__deleteActiveSessionDetails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v25 = 138412802;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      id v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,cache manager released during zone delete";
      uint64_t v13 = v7;
      uint32_t v14 = 32;
LABEL_17:
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v25, v14);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!v4)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v25 = 138412802;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,active session details record deleted successfully", (uint8_t *)&v25, 0x20u);
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:v4])
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v25 = 138413058;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      id v32 = v4;
      id v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record with non recoverable error %@";
LABEL_16:
      uint64_t v13 = v7;
      uint32_t v14 = 42;
      goto LABEL_17;
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v6 = *(void *)(a1 + 72);
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6 <= 0)
  {
    if (v8)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v25 = 138413058;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      id v32 = v4;
      id v12 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record after retries with "
            "recoverable error %@";
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (v8)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v24 = *(void *)(a1 + 72);
    int v25 = 138413314;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    uint64_t v30 = v23;
    __int16 v31 = 2112;
    id v32 = v4;
    __int16 v33 = 1024;
    int v34 = v24;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed to delete active session details record with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v25, 0x30u);
  }
  [*(id *)(a1 + 48) _deleteActiveSessionDetails:*(void *)(a1 + 72) - 1];
LABEL_20:
}

- (void)onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(SMInitiatorCacheManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SMInitiatorCacheManager_onNearbyEffectivePairedDeviceChangedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __76__SMInitiatorCacheManager_onNearbyEffectivePairedDeviceChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNearbyEffectivePairedDeviceChangedNotification:*(void *)(a1 + 40)];
}

- (void)_onNearbyEffectivePairedDeviceChangedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v13 = 138412802;
    uint32_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,on paired device notification %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [v5 name];
  id v11 = +[RTNotification notificationName];
  int v12 = [v10 isEqualToString:v11];

  if (v12) {
    [(SMInitiatorCacheManager *)self _evaluateAndManagePeriodicCacheUpdate];
  }
}

- (SMInitiatorCacheManagerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SMInitiatorCacheManagerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)initializationInProgress
{
  return self->_initializationInProgress;
}

- (void)setInitializationInProgress:(BOOL)a3
{
  self->_initializationInProgress = a3;
}

- (BOOL)initializationWasAborted
{
  return self->_initializationWasAborted;
}

- (void)setInitializationWasAborted:(BOOL)a3
{
  self->_initializationWasAborted = a3;
}

- (BOOL)initializationCompletionCalled
{
  return self->_initializationCompletionCalled;
}

- (void)setInitializationCompletionCalled:(BOOL)a3
{
  self->_initializationCompletionCalled = a3;
}

- (id)initializationCompletion
{
  return self->_initializationCompletion;
}

- (void)setInitializationCompletion:(id)a3
{
}

- (OS_dispatch_queue)initiatorEligibilityQueue
{
  return self->_initiatorEligibilityQueue;
}

- (void)setInitiatorEligibilityQueue:(id)a3
{
}

- (RTXPCTimerAlarm)scheduledSendFireTimerAlarm
{
  return self->_scheduledSendFireTimerAlarm;
}

- (void)setScheduledSendFireTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)cacheUpdateBackstopTimerAlarm
{
  return self->_cacheUpdateBackstopTimerAlarm;
}

- (void)setCacheUpdateBackstopTimerAlarm:(id)a3
{
}

- (BOOL)scheduledSendInProgress
{
  return self->_scheduledSendInProgress;
}

- (void)setScheduledSendInProgress:(BOOL)a3
{
  self->_scheduledSendInProgress = a3;
}

- (SMCAMetricCacheUpdate)caMetricCacheUpdate
{
  return self->_caMetricCacheUpdate;
}

- (void)setCaMetricCacheUpdate:(id)a3
{
}

- (id)deviceStatusReturnBlock
{
  return self->_deviceStatusReturnBlock;
}

- (void)setDeviceStatusReturnBlock:(id)a3
{
}

- (BOOL)wifiLinkQualityFetchInProgress
{
  return self->_wifiLinkQualityFetchInProgress;
}

- (void)setWifiLinkQualityFetchInProgress:(BOOL)a3
{
  self->_wifiLinkQualityFetchInProgress = a3;
}

- (BOOL)cellularLinkQualityFetchInProgress
{
  return self->_cellularLinkQualityFetchInProgress;
}

- (void)setCellularLinkQualityFetchInProgress:(BOOL)a3
{
  self->_cellularLinkQualityFetchInProgress = a3;
}

- (BOOL)initiatorContactStoreInProgress
{
  return self->_initiatorContactStoreInProgress;
}

- (void)setInitiatorContactStoreInProgress:(BOOL)a3
{
  self->_initiatorContactStoreInProgress = a3;
}

- (BOOL)isPeriodicallyUpdatingCache
{
  return self->_isPeriodicallyUpdatingCache;
}

- (void)setIsPeriodicallyUpdatingCache:(BOOL)a3
{
  self->_isPeriodicallyUpdatingCache = a3;
}

- (BOOL)registeredForActiveNotifications
{
  return self->_registeredForActiveNotifications;
}

- (void)setRegisteredForActiveNotifications:(BOOL)a3
{
  self->_registeredForActiveNotifications = a3;
}

- (BOOL)registeredForGeneralNotifications
{
  return self->_registeredForGeneralNotifications;
}

- (void)setRegisteredForGeneralNotifications:(BOOL)a3
{
  self->_registeredForGeneralNotifications = a3;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (SMSafetyCacheZone)activeSessionZone
{
  return self->_activeSessionZone;
}

- (void)setActiveSessionZone:(id)a3
{
}

- (SMInitiatorContact)initiatorContact
{
  return self->_initiatorContact;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (SMSessionManagerState)sessionManagerState
{
  return self->_sessionManagerState;
}

- (void)setSessionManagerState:(id)a3
{
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTNetworkOfInterestManager)networkOfInterestManager
{
  return self->_networkOfInterestManager;
}

- (unint64_t)cellularStrength
{
  return self->_cellularStrength;
}

- (void)setCellularStrength:(unint64_t)a3
{
  self->_cellularStrength = a3;
}

- (unint64_t)wifiStrength
{
  return self->_wifiStrength;
}

- (void)setWifiStrength:(unint64_t)a3
{
  self->_wifiStrength = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (BOOL)initiatorContactStored
{
  return self->_initiatorContactStored;
}

- (void)setInitiatorContactStored:(BOOL)a3
{
  self->_initiatorContactStored = a3;
}

- (BOOL)initiatorContactUpdatePending
{
  return self->_initiatorContactUpdatePending;
}

- (void)setInitiatorContactUpdatePending:(BOOL)a3
{
  self->_initiatorContactUpdatePending = a3;
}

- (NSUUID)cacheUploadInProgress
{
  return self->_cacheUploadInProgress;
}

- (void)setCacheUploadInProgress:(id)a3
{
}

- (int64_t)initiatorEligibility
{
  return self->_initiatorEligibility;
}

- (void)setInitiatorEligibility:(int64_t)a3
{
  self->_initiatorEligibility = a3;
}

- (int64_t)receiverEligibility
{
  return self->_receiverEligibility;
}

- (void)setReceiverEligibility:(int64_t)a3
{
  self->_receiverEligibility = a3;
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTXPCTimerAlarm)cleanupCacheTimerAlarm
{
  return self->_cleanupCacheTimerAlarm;
}

- (void)setCleanupCacheTimerAlarm:(id)a3
{
}

- (SMScreenLockMonitor)screenLockMonitor
{
  return self->_screenLockMonitor;
}

- (void)setScreenLockMonitor:(id)a3
{
}

- (double)cacheUpdateBackstopTimeout
{
  return self->_cacheUpdateBackstopTimeout;
}

- (void)setCacheUpdateBackstopTimeout:(double)a3
{
  self->_double cacheUpdateBackstopTimeout = a3;
}

- (SMActiveSessionZone)activeSessionDetailsZone
{
  return self->_activeSessionDetailsZone;
}

- (void)setActiveSessionDetailsZone:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMAppDeletionManager)appDeletionManager
{
  return self->_appDeletionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDeletionManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsZone, 0);
  objc_storeStrong((id *)&self->_screenLockMonitor, 0);
  objc_storeStrong((id *)&self->_cleanupCacheTimerAlarm, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_cacheUploadInProgress, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_networkOfInterestManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_sessionManagerState, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_initiatorContact, 0);
  objc_storeStrong((id *)&self->_activeSessionZone, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong(&self->_deviceStatusReturnBlock, 0);
  objc_storeStrong((id *)&self->_caMetricCacheUpdate, 0);
  objc_storeStrong((id *)&self->_cacheUpdateBackstopTimerAlarm, 0);
  objc_storeStrong((id *)&self->_scheduledSendFireTimerAlarm, 0);
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, 0);
  objc_storeStrong(&self->_initializationCompletion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end