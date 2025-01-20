@interface RTVehicleLocationProvider
+ (int64_t)periodicPurgePolicy;
- (BOOL)_deleteLastVehicleEvent;
- (BOOL)_persistLastVehicleEvent;
- (BOOL)_persistVehicleEvent:(id)a3;
- (BOOL)_sameVehicleWithDeviceId:(id)a3 otherDeviceId:(id)a4;
- (BOOL)isEligibleDevice;
- (BOOL)isFeatureSupported;
- (BOOL)locationsOfInterestAvailable;
- (BOOL)monitorExternalVehicleLocation;
- (BOOL)monitorLocation;
- (BOOL)monitorVehicleConnection;
- (BOOL)monitorVehicleExit;
- (BOOL)monitorVehicleLocation;
- (BOOL)pairedWithEligibleDevices;
- (BOOL)vehicleEventPendingDeletion;
- (NSDate)lastCompanionSyncDate;
- (NSDate)lastCompanionSyncRequestDate;
- (NSManagedObjectContext)managedObjectContext;
- (NSMutableArray)locationsCache;
- (NSMutableArray)locationsCacheLeeched;
- (OS_dispatch_source)finalizeLocationEstimateTimer;
- (RTDefaultsManager)defaultsManager;
- (RTFMCScoreBoard)scoreBoard;
- (RTFMCScoreBoard)scoreBoardForUnusualLocation;
- (RTFMCScoreBoard)scoreBoardForUsualLocation;
- (RTKeychainManager)keychainManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTManagedConfiguration)managedConfiguration;
- (RTMapsSupportManager)mapsSupportManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPersistenceManager)persistenceManager;
- (RTVehicleEvent)lastVehicleParkedEvent;
- (RTVehicleEvent)pendingVehicleParkedEvent;
- (RTVehicleEvent)vehicleEventPendingPersist;
- (RTVehicleLocationCompanionLink)companionLink;
- (RTVehicleLocationHistoryController)vehicleLocationHistoryController;
- (RTVehicleLocationProvider)init;
- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13;
- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13 companionLink:(id)a14;
- (id)_createMetricFromParkingEvent:(id)a3;
- (id)_createMetricFromScoreBoard:(id)a3;
- (id)_getLastVehicleEvents;
- (id)createCompanionLink;
- (void)_clearAllVehicleEvents;
- (void)_clearBulletinNotifications;
- (void)_finalizeLastVehicleEventIfAppropriate;
- (void)_finalizeLocationEstimate;
- (void)_notifyClients;
- (void)_onDailyMetricNotification:(id)a3;
- (void)_onExternalVehicleEventReceived:(id)a3;
- (void)_onFinalizeLocationEstimateTimerExpiry;
- (void)_onLocation:(id)a3;
- (void)_onManagedObjectContextCreated:(id)a3;
- (void)_onVehicleConnectedNotification:(id)a3;
- (void)_onVehicleExit;
- (void)_onVehicleExitNotification:(id)a3;
- (void)_onVehicleParkedWithDeviceId:(id)a3;
- (void)_onVehicleStartedWithDeviceId:(id)a3;
- (void)_postBulletinNotificationIfAppropriate;
- (void)_postVehicleReplacementBulletinNotificationWithVehicleEvent:(id)a3 replacingEvent:(id)a4;
- (void)_processPendingVehicleEventAfterLocationFinalization;
- (void)_recordMetricAssistanceEvent:(id)a3;
- (void)_recordMetricEngagementEvent:(id)a3;
- (void)_recordMetricParkingEvent:(id)a3;
- (void)_recordMetricSuppressedEvent;
- (void)_registerScoreBoardSubmission;
- (void)_resendVehicleEventIfNecessary;
- (void)_restoreLastVehicleEvent;
- (void)_sendVehicleEventToCompanionDevice:(id)a3;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_submitFMCAssistanceInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4 assistanceType:(int)a5 assistanceValue:(int)a6;
- (void)_submitFMCCarParkedInstanceWithParkedEvents:(id)a3;
- (void)_submitFMCDailyAssessments;
- (void)_submitFMCDailyAssessmentsWithSubmissionHandler:(id)a3;
- (void)_submitFMCParkingEventMetric:(id)a3;
- (void)_submitFMCReturnToCarInstanceWithIdentifier:(id)a3 horizontalAccuracy:(int)a4 horizontalDistance:(int)a5;
- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3;
- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3 value:(double)a4;
- (void)_submitFMCViewedInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4;
- (void)_updateAuxiliaryDataIfAppropriate;
- (void)_updateFeatureEnablement;
- (void)_updateNearbyLocationOfInterestOfVehicleEvent:(id)a3 handler:(id)a4;
- (void)_updateUsualLocationOfVehicleEvent:(id)a3;
- (void)_vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5;
- (void)clearAllVehicleEvents;
- (void)didReceiveEffectiveSettingsChangedNotification;
- (void)engageInVehicleEventWithIdentifier:(id)a3;
- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3;
- (void)fetchFMCEnabledWithHandler:(id)a3;
- (void)fetchLastVehicleEventsWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onDailyMetricNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)onLeechedLocation:(id)a3;
- (void)onLocationNotification:(id)a3;
- (void)onNanoRegistryNotification:(id)a3;
- (void)onVehicleConnectedNotification:(id)a3;
- (void)onVehicleExitNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)persistLastVehicleEvent;
- (void)requestLocations;
- (void)restoreLastVehicleEvent;
- (void)setCompanionLink:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setFinalizeLocationEstimateTimer:(id)a3;
- (void)setKeychainManager:(id)a3;
- (void)setLastCompanionSyncDate:(id)a3;
- (void)setLastCompanionSyncRequestDate:(id)a3;
- (void)setLastVehicleParkedEvent:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationsCache:(id)a3;
- (void)setLocationsCacheLeeched:(id)a3;
- (void)setLocationsOfInterestAvailable:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMapsSupportManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setMonitorExternalVehicleLocation:(BOOL)a3;
- (void)setMonitorLocation:(BOOL)a3;
- (void)setMonitorVehicleConnection:(BOOL)a3;
- (void)setMonitorVehicleExit:(BOOL)a3;
- (void)setMonitorVehicleLocation:(BOOL)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPendingVehicleParkedEvent:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setScoreBoard:(id)a3;
- (void)setScoreBoardForUnusualLocation:(id)a3;
- (void)setScoreBoardForUsualLocation:(id)a3;
- (void)setVehicleEventPendingDeletion:(BOOL)a3;
- (void)setVehicleEventPendingPersist:(id)a3;
- (void)setVehicleLocationHistoryController:(id)a3;
- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 mapItem:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4;
- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5;
@end

@implementation RTVehicleLocationProvider

- (void)onLeechedLocation:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 type] == 1
    || [v7 type] == 3
    || [v7 type] == 2
    || [v7 type] == 10)
  {
    v3 = [*(id *)(a1 + 32) locationsCacheLeeched];
    unint64_t v4 = [v3 count];

    if (v4 >= 0xF)
    {
      v5 = [*(id *)(a1 + 32) locationsCacheLeeched];
      [v5 removeObjectAtIndex:0];
    }
    id v6 = [*(id *)(a1 + 32) locationsCacheLeeched];
    [v6 addObject:v7];
  }
}

void __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) name];
  v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) leechedLocations];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke_2;
    v6[3] = &unk_1E6B93A18;
    v6[4] = *(void *)(a1 + 40);
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  [v4 isEqualToString:v5];
}

- (void)fetchLastVehicleEventsWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__RTVehicleLocationProvider_fetchLastVehicleEventsWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __63__RTVehicleLocationProvider_fetchLastVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) monitorVehicleLocation] & 1) != 0
    || ([*(id *)(a1 + 32) monitorExternalVehicleLocation] & 1) != 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) _getLastVehicleEvents];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

- (BOOL)monitorVehicleLocation
{
  return self->_monitorVehicleLocation;
}

- (id)_getLastVehicleEvents
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  uint64_t v4 = [v3 location];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    int v7 = [v6 confirmed];

    if (v7)
    {
      id v8 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
      v9 = (void *)[v8 copy];
      v12[0] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (RTVehicleEvent)lastVehicleParkedEvent
{
  return self->_lastVehicleParkedEvent;
}

- (RTVehicleLocationProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink_);
}

- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  unint64_t v18 = (unint64_t)a7;
  unint64_t v19 = (unint64_t)a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v25 = (void *)v18;
  if (!(v18 | v19))
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:m"
            "anagedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfig"
            "uration:defaultsManager:keychainManager:]";
      __int16 v36 = 1024;
      int v37 = 196;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager (in %s:%d)", buf, 0x12u);
    }
  }
  v29 = [(RTVehicleLocationProvider *)self initWithLocationManager:v33 motionActivityManager:v32 mapsSupportManager:v31 metricManager:v30 managedObjectContext:v25 persistenceManager:v19 vehicleLocationHistoryController:v20 learnedLocationManager:v21 managedConfiguration:v22 defaultsManager:v23 keychainManager:v24 companionLink:0];

  return v29;
}

- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13 companionLink:(id)a14
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v52 = a4;
  id v62 = a4;
  id v61 = a5;
  id v53 = a6;
  id v60 = a6;
  unint64_t v19 = (unint64_t)a7;
  id v54 = a8;
  unint64_t v20 = (unint64_t)a8;
  id v21 = a9;
  id v58 = a10;
  id v57 = a11;
  id v56 = a12;
  id v22 = a13;
  id v23 = a14;
  v59 = (void *)v20;
  v64 = (void *)v19;
  if (!(v19 | v20))
  {
    id v40 = v23;
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:m"
            "anagedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfig"
            "uration:defaultsManager:keychainManager:companionLink:]";
      __int16 v70 = 1024;
      int v71 = 225;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager (in %s:%d)", buf, 0x12u);
    }

    v42 = 0;
    v27 = v21;
    id v24 = v22;
    id v23 = v40;
    goto LABEL_10;
  }
  id v24 = v22;
  if (!v22)
  {
    v42 = 0;
    v27 = v21;
LABEL_10:
    v43 = self;
    goto LABEL_16;
  }
  id v50 = v23;
  v67.receiver = self;
  v67.super_class = (Class)RTVehicleLocationProvider;
  v25 = [(RTNotifier *)&v67 init];
  v26 = v25;
  v27 = v21;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_locationManager, a3);
    objc_storeStrong((id *)&v26->_motionActivityManager, v52);
    objc_storeStrong((id *)&v26->_mapsSupportManager, a5);
    objc_storeStrong((id *)&v26->_metricManager, v53);
    objc_storeStrong((id *)&v26->_persistenceManager, v54);
    objc_storeStrong((id *)&v26->_learnedLocationManager, a10);
    objc_storeStrong((id *)&v26->_managedConfiguration, a11);
    objc_storeStrong((id *)&v26->_defaultsManager, a12);
    objc_storeStrong((id *)&v26->_keychainManager, a13);
    objc_storeStrong((id *)&v26->_companionLink, a14);
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastCompanionSyncDate = v26->_lastCompanionSyncDate;
    v26->_lastCompanionSyncDate = (NSDate *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastCompanionSyncRequestDate = v26->_lastCompanionSyncRequestDate;
    v26->_lastCompanionSyncRequestDate = (NSDate *)v30;

    id v32 = [[RTFMCScoreBoard alloc] initWithLocationType:0xFFFFFFFFLL];
    scoreBoard = v26->_scoreBoard;
    v26->_scoreBoard = v32;

    v34 = [[RTFMCScoreBoard alloc] initWithLocationType:1];
    scoreBoardForUsualLocation = v26->_scoreBoardForUsualLocation;
    v26->_scoreBoardForUsualLocation = v34;

    __int16 v36 = [[RTFMCScoreBoard alloc] initWithLocationType:0];
    scoreBoardForUnusualLocation = v26->_scoreBoardForUnusualLocation;
    v26->_scoreBoardForUnusualLocation = v36;

    if (v64)
    {
      uint64_t v38 = v64;
      managedObjectContext = v26->_managedObjectContext;
      v26->_managedObjectContext = v38;
    }
    else
    {
      persistenceManager = v26->_persistenceManager;
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke;
      v65[3] = &unk_1E6B95C10;
      v66 = v26;
      [(RTPersistenceManager *)persistenceManager createManagedObjectContext:v65];
      managedObjectContext = (NSManagedObjectContext *)v66;
    }

    if (v21) {
      objc_storeStrong((id *)&v26->_vehicleLocationHistoryController, a9);
    }
    uint64_t v45 = objc_opt_new();
    locationsCache = v26->_locationsCache;
    v26->_locationsCache = (NSMutableArray *)v45;

    uint64_t v47 = objc_opt_new();
    locationsCacheLeeched = v26->_locationsCacheLeeched;
    v26->_locationsCacheLeeched = (NSMutableArray *)v47;

    [(RTService *)v26 setup];
    [(RTManagedConfiguration *)v26->_managedConfiguration setDelegate:v26];
  }
  v43 = v26;
  v42 = v43;
  id v23 = v50;
LABEL_16:

  return v42;
}

void __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke_2;
  v6[3] = &unk_1E6B90BF0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onManagedObjectContextCreated:*(void *)(a1 + 40)];
}

- (void)_setup
{
  [(RTVehicleLocationProvider *)self _updateFeatureEnablement];
  if (!self->_companionLink)
  {
    id v3 = [(RTVehicleLocationProvider *)self createCompanionLink];
    companionLink = self->_companionLink;
    self->_companionLink = v3;
  }
  id v5 = [(RTVehicleLocationProvider *)self learnedLocationManager];
  id v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onLearnedLocationManagerNotification_ name:v6];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_onDailyMetricNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_onNanoRegistryNotification_ name:*MEMORY[0x1E4F79EA0] object:0];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_onNanoRegistryNotification_ name:*MEMORY[0x1E4F79EB8] object:0];
}

- (void)_updateFeatureEnablement
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(RTVehicleLocationProvider *)self setMonitorVehicleLocation:[(RTVehicleLocationProvider *)self isFeatureSupported]];
  self->_monitorExternalVehicleLocation = 0;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if ([(RTVehicleLocationProvider *)self monitorVehicleLocation]) {
      uint64_t v4 = @"yes";
    }
    else {
      uint64_t v4 = @"no";
    }
    if ([(RTVehicleLocationProvider *)self monitorExternalVehicleLocation]) {
      id v5 = @"yes";
    }
    else {
      id v5 = @"no";
    }
    if ([(RTVehicleLocationProvider *)self monitorVehicleConnection]) {
      id v6 = @"yes";
    }
    else {
      id v6 = @"no";
    }
    if ([(RTVehicleLocationProvider *)self monitorVehicleExit]) {
      id v7 = @"yes";
    }
    else {
      id v7 = @"no";
    }
    int v9 = 138413314;
    if ([(RTVehicleLocationProvider *)self monitorLocation]) {
      id v8 = @"yes";
    }
    else {
      id v8 = @"no";
    }
    v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2112;
    unint64_t v18 = v8;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "monitoring states, local vehicle event, %@, external vehicle event, %@, vehicle connection, %@, vehicle exit, %@, location, %@", (uint8_t *)&v9, 0x34u);
  }
}

- (BOOL)isFeatureSupported
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsVehicleEventSupportDynamicEnablementPolicy"];

  if (v3
    && (-[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", @"RTDefaultsVehicleEventSupportDynamicEnablementPolicy"), uint64_t v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 BOOLValue], v4, !v5))
  {
    v12 = [(RTVehicleLocationProvider *)self managedConfiguration];
    int v7 = [v12 isFindMyCarAllowed];

    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = @"no";
      if (v7) {
        __int16 v15 = @"yes";
      }
      int v16 = 138412290;
      __int16 v17 = v15;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "isFeatureSupported states, hasEligibleClient, %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v6 = [(RTVehicleLocationProvider *)self managedConfiguration];
    int v7 = [v6 isFindMyCarAllowed];

    BOOL v8 = [(RTVehicleLocationProvider *)self pairedWithEligibleDevices];
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = @"no";
      if (v7) {
        __int16 v11 = @"yes";
      }
      else {
        __int16 v11 = @"no";
      }
      if (v8) {
        v10 = @"yes";
      }
      int v16 = 138412546;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "isFeatureSupported states, hasEligibleClient, %@, hasEligibleDevices, %@", (uint8_t *)&v16, 0x16u);
    }

    LOBYTE(v7) = v7 | v8;
  }
  return v7;
}

- (BOOL)isEligibleDevice
{
  return 0;
}

- (BOOL)pairedWithEligibleDevices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v2 = (void *)_MergedGlobals_3_0;
  uint64_t v20 = _MergedGlobals_3_0;
  if (!_MergedGlobals_3_0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v16[3] = &unk_1E6B928F8;
    v16[4] = &v17;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v16);
    uint64_t v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  uint64_t v4 = [v3 sharedInstance:v12];
  int v5 = [v4 getPairedDevices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4AF61239-2126-4FD6-8E7A-CDA2D7A0BFE9"];
        LOBYTE(v9) = [v9 supportsCapability:v10];

        if (v9)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (id)createCompanionLink
{
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink init iphone", buf, 2u);
  }

  uint64_t v4 = [RTVehicleLocationCompanionLink alloc];
  int v5 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__RTVehicleLocationProvider_createCompanionLink__block_invoke;
  v8[3] = &unk_1E6B94CE0;
  v8[4] = self;
  uint64_t v6 = [(RTVehicleLocationCompanionLink *)v4 initWithQueue:v5 deviceConnectionUpdateHandler:v8];

  return v6;
}

uint64_t __48__RTVehicleLocationProvider_createCompanionLink__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _resendVehicleEventIfNecessary];
  }
  return result;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__RTVehicleLocationProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __73__RTVehicleLocationProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 2) {
    [*(id *)(a1 + 32) _clearAllVehicleEvents];
  }
  uint64_t v2 = [*(id *)(a1 + 32) vehicleLocationHistoryController];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) vehicleLocationHistoryController];
    [v4 performPurgeOfType:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  id v10 = a3;
  [(RTVehicleLocationProvider *)self setMonitorVehicleConnection:0];
  [(RTVehicleLocationProvider *)self setMonitorVehicleExit:0];
  id v4 = [(RTVehicleLocationProvider *)self locationManager];
  [v4 removeObserver:self];

  int v5 = [(RTVehicleLocationProvider *)self learnedLocationManager];
  [v5 removeObserver:self];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    dispatch_source_cancel(finalizeLocationEstimateTimer);
    id v8 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = 0;
  }
  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    id v9 = v10;
  }
}

- (void)setMonitorVehicleLocation:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_monitorVehicleLocation != a3)
  {
    BOOL v3 = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "monitorVehicleLocation changed to, %d", (uint8_t *)v9, 8u);
    }

    self->_monitorVehicleLocation = v3;
    if (v3)
    {
      [(RTVehicleLocationProvider *)self setMonitorVehicleConnection:1];
      [(RTVehicleLocationProvider *)self setMonitorVehicleExit:1];
      uint64_t v6 = [(RTVehicleLocationProvider *)self locationManager];
      uint64_t v7 = +[RTNotification notificationName];
      [v6 addObserver:self selector:sel_onLeechedLocation_ name:v7];
    }
    else
    {
      [(RTVehicleLocationProvider *)self setMonitorVehicleConnection:0];
      [(RTVehicleLocationProvider *)self setMonitorVehicleExit:0];
      id v8 = [(RTVehicleLocationProvider *)self locationManager];
      [v8 removeObserver:self];

      [(RTVehicleLocationProvider *)self _clearAllVehicleEvents];
    }
  }
}

- (void)setMonitorVehicleConnection:(BOOL)a3
{
  if (self->_monitorVehicleConnection != a3)
  {
    BOOL v3 = a3;
    self->_monitorVehicleConnection = a3;
    id v6 = [(RTVehicleLocationProvider *)self motionActivityManager];
    +[RTNotification notificationName];
    if (v3) {
      int v5 = {;
    }
      [v6 addObserver:self selector:sel_onVehicleConnectedNotification_ name:v5];
    }
    else {
      int v5 = {;
    }
      [v6 removeObserver:self fromNotification:v5];
    }
  }
}

- (void)setMonitorVehicleExit:(BOOL)a3
{
  if (self->_monitorVehicleExit != a3)
  {
    BOOL v3 = a3;
    self->_monitorVehicleExit = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Start monitoring vehicle exit.", buf, 2u);
      }

      uint64_t v7 = [(RTVehicleLocationProvider *)self motionActivityManager];
      id v8 = +[RTNotification notificationName];
      [v7 addObserver:self selector:sel_onVehicleExitNotification_ name:v8];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Stop monitoring vehicle exit.", v9, 2u);
      }

      uint64_t v7 = [(RTVehicleLocationProvider *)self motionActivityManager];
      id v8 = +[RTNotification notificationName];
      [v7 removeObserver:self fromNotification:v8];
    }
  }
}

- (void)setMonitorLocation:(BOOL)a3
{
  if (self->_monitorLocation != a3)
  {
    BOOL v3 = a3;
    self->_monitorLocation = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Start monitoring location", buf, 2u);
      }

      uint64_t v7 = [(RTVehicleLocationProvider *)self locationManager];
      id v8 = +[RTNotification notificationName];
      [v7 addObserver:self selector:sel_onLocationNotification_ name:v8];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Stop monitoring location", v9, 2u);
      }

      uint64_t v7 = [(RTVehicleLocationProvider *)self locationManager];
      id v8 = +[RTNotification notificationName];
      [v7 removeObserver:self fromNotification:v8];
    }
  }
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTVehicleLocationProvider_onLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__RTVehicleLocationProvider_onLocationNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  BOOL v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    int v5 = *(id *)(a1 + 32);
    id v6 = [v5 locations];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__RTVehicleLocationProvider_onLocationNotification___block_invoke_2;
    v8[3] = &unk_1E6B93A18;
    v8[4] = *(void *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "unhandled notification, %@", buf, 0xCu);
    }
  }
}

uint64_t __52__RTVehicleLocationProvider_onLocationNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _onLocation:a2];
}

- (void)_onLocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];

    if (v5)
    {
      id v6 = [(RTVehicleLocationProvider *)self locationsCache];
      [v6 addObject:v4];

      uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v4 toString];
        id v9 = [(RTVehicleLocationProvider *)self locationsCache];
        int v10 = 138412546;
        uint64_t v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = [v9 count];
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Adding new location, %@, total locations in cache, %lu", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      [(RTVehicleLocationProvider *)self setMonitorLocation:0];
    }
  }
}

- (void)_finalizeLocationEstimate
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(RTVehicleLocationProvider *)self setMonitorLocation:0];
  BOOL v3 = objc_opt_new();
  id v4 = [(RTVehicleLocationProvider *)self locationsCache];
  int v5 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  id v6 = [v5 date];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v7 = [v3 estimateVehicleLocationWithLocations:v4];

  if (v7)
  {
    [v7 horizontalAccuracy];
    if (v8 > 0.0)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v7];
      int v10 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
      [v10 setLocation:v9];
    }
  }
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    uint64_t v13 = [v12 date];
    uint64_t v14 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    id v15 = [v14 location];
    int v30 = 138412546;
    id v31 = v13;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v15;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Parking, timestamp, %@, final location, %@", (uint8_t *)&v30, 0x16u);
  }
  int64_t v16 = objc_opt_new();
  uint64_t v17 = [(RTVehicleLocationProvider *)self locationsCache];
  __int16 v18 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  uint64_t v19 = [v18 date];
  [v19 timeIntervalSinceReferenceDate];
  uint64_t v20 = [v16 calculateParkingQualityWithLocations:v17];

  id v21 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  [v21 setLocationQuality:v20];

  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    id v24 = [v23 date];
    v25 = [(RTVehicleLocationProvider *)self locationsCache];
    uint64_t v26 = [v25 count];
    int v30 = 138412802;
    id v31 = v24;
    __int16 v32 = 2048;
    uint64_t v33 = v26;
    __int16 v34 = 2048;
    uint64_t v35 = v20;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "Parking, timestamp, %@, quality based on %lu samples is %lu.", (uint8_t *)&v30, 0x20u);
  }
  v27 = [(RTVehicleLocationProvider *)self locationsCache];
  [v27 removeAllObjects];

  uint64_t v28 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  v29 = [v28 location];

  if (v29)
  {
    [(RTVehicleLocationProvider *)self _processPendingVehicleEventAfterLocationFinalization];
  }
  else
  {
    [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:0];
    [(RTVehicleLocationProvider *)self _recordMetricSuppressedEvent];
  }
}

- (void)_processPendingVehicleEventAfterLocationFinalization
{
  id v4 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__RTVehicleLocationProvider__processPendingVehicleEventAfterLocationFinalization__block_invoke;
  v5[3] = &unk_1E6B90CB8;
  v5[4] = self;
  v5[5] = a2;
  [(RTVehicleLocationProvider *)self _updateNearbyLocationOfInterestOfVehicleEvent:v4 handler:v5];
}

void __81__RTVehicleLocationProvider__processPendingVehicleEventAfterLocationFinalization__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v6 = [*(id *)(a1 + 32) pendingVehicleParkedEvent];
    uint64_t v7 = [v6 nearbyLocationOfInterest];
    int v11 = 138412802;
    __int16 v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, nearbyLOI, %@, error, %@", (uint8_t *)&v11, 0x20u);
  }
  double v8 = *(void **)(a1 + 32);
  id v9 = [v8 pendingVehicleParkedEvent];
  [v8 _updateUsualLocationOfVehicleEvent:v9];

  int v10 = [*(id *)(a1 + 32) pendingVehicleParkedEvent];
  [v10 setLocationFinalized:1];

  [*(id *)(a1 + 32) _finalizeLastVehicleEventIfAppropriate];
}

- (void)_onFinalizeLocationEstimateTimerExpiry
{
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "finalize location estimate timer expiry", v6, 2u);
  }

  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    dispatch_source_cancel(finalizeLocationEstimateTimer);
    int v5 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = 0;
  }
  [(RTVehicleLocationProvider *)self _finalizeLocationEstimate];
}

- (void)_finalizeLastVehicleEventIfAppropriate
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "_finalizeLastVehicleEventIfAppropriate called.", v27, 2u);
  }

  id v4 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  uint64_t v5 = [v4 location];
  if (!v5) {
    goto LABEL_9;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  if (([v7 locationFinalized] & 1) == 0)
  {

LABEL_9:
    return;
  }
  double v8 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  int v9 = [v8 confirmed];

  if (!v9) {
    return;
  }
  int v10 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  int v11 = [v10 nearbyLocationOfInterest];
  if (v11)
  {
    __int16 v12 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    __int16 v13 = [v12 nearbyLocationOfInterest];
    BOOL v14 = [v13 type] == 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  uint64_t v15 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  if (!v15) {
    goto LABEL_18;
  }
  id v16 = (void *)v15;
  uint64_t v17 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  __int16 v18 = [v17 vehicleIdentifier];
  uint64_t v19 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  uint64_t v20 = [v19 vehicleIdentifier];
  if ([(RTVehicleLocationProvider *)self _sameVehicleWithDeviceId:v18 otherDeviceId:v20])
  {

LABEL_17:
    goto LABEL_18;
  }
  id v21 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  char v22 = [v21 userSetLocation] | v14;

  if ((v22 & 1) == 0)
  {
    id v16 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    uint64_t v17 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    [(RTVehicleLocationProvider *)self _postVehicleReplacementBulletinNotificationWithVehicleEvent:v16 replacingEvent:v17];
    BOOL v14 = 1;
    goto LABEL_17;
  }
LABEL_18:
  id v23 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  [(RTVehicleLocationProvider *)self setLastVehicleParkedEvent:v23];

  [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:0];
  id v24 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  v28[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(RTVehicleLocationProvider *)self _submitFMCCarParkedInstanceWithParkedEvents:v25];

  uint64_t v26 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  [(RTVehicleLocationProvider *)self _submitFMCParkingEventMetric:v26];

  if (!v14) {
    [(RTVehicleLocationProvider *)self _postBulletinNotificationIfAppropriate];
  }
  [(RTVehicleLocationProvider *)self _persistLastVehicleEvent];
  [(RTVehicleLocationProvider *)self _notifyClients];
}

- (void)_onVehicleParkedWithDeviceId:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "onVehicleParked, deviceId, %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  if (v7) {
    [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  }
  else {
  double v8 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  }
  int v9 = [v8 date];

  if (v9 && ([v6 timeIntervalSinceDate:v9], v10 < 10.0))
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      [v6 timeIntervalSinceDate:v9];
      *(_DWORD *)buf = 134217984;
      id v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Got onVehicleParked too soon. Last event was %f seconds ago. Not updating.", buf, 0xCu);
    }
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F5CFC0]);
    BOOL v14 = [MEMORY[0x1E4F29128] UUID];
    LOBYTE(v16) = 0;
    uint64_t v15 = (void *)[v13 initWithDate:v6 location:0 vehicleIdentifier:v4 userSetLocation:0 notes:0 identifier:v14 photo:0 mapItem:0 confirmed:v16];
    [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:v15];

    [(RTVehicleLocationProvider *)self requestLocations];
  }
}

- (void)requestLocations
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(RTVehicleLocationProvider *)self locationsCache];
  id v4 = [(RTVehicleLocationProvider *)self locationsCacheLeeched];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(RTVehicleLocationProvider *)self locationsCacheLeeched];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = [v6 count];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Added %lu leeched locations to the locations array.", buf, 0xCu);
  }
  uint64_t v7 = [(RTVehicleLocationProvider *)self locationsCacheLeeched];
  [v7 removeAllObjects];

  [(RTVehicleLocationProvider *)self setMonitorLocation:1];
  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    dispatch_time_t v9 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(finalizeLocationEstimateTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  }
  else
  {
    double v10 = [(RTNotifier *)self queue];
    int v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
    __int16 v12 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = v11;

    id v13 = self->_finalizeLocationEstimateTimer;
    dispatch_time_t v14 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    objc_initWeak((id *)buf, self);
    uint64_t v15 = self->_finalizeLocationEstimateTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__RTVehicleLocationProvider_requestLocations__block_invoke;
    handler[3] = &unk_1E6B91900;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume((dispatch_object_t)self->_finalizeLocationEstimateTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = 0x402E000000000000;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "Set timer to fire in %f seconds", buf, 0xCu);
  }
}

void __45__RTVehicleLocationProvider_requestLocations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onFinalizeLocationEstimateTimerExpiry];
}

- (void)_onVehicleStartedWithDeviceId:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "onVehicleStarted, deviceId, %@", buf, 0xCu);
  }

  [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:0];
  id v6 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];

  if (v6)
  {
    uint64_t v7 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    double v8 = [v7 location];

    dispatch_time_t v9 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    double v10 = [v9 identifier];
    int v11 = [v10 UUIDString];

    __int16 v12 = [(RTVehicleLocationProvider *)self locationManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke;
    v22[3] = &unk_1E6B95C38;
    v22[4] = self;
    id v23 = v8;
    id v24 = v11;
    id v13 = v11;
    dispatch_time_t v14 = v8;
    [v12 fetchCachedLocationWithHandler:v22];

    uint64_t v15 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    uint64_t v16 = [v15 vehicleIdentifier];
    BOOL v17 = [(RTVehicleLocationProvider *)self _sameVehicleWithDeviceId:v4 otherDeviceId:v16];

    if (v17)
    {
      [(RTVehicleLocationProvider *)self setLastVehicleParkedEvent:0];
      [(RTVehicleLocationProvider *)self _deleteLastVehicleEvent];
      [(RTVehicleLocationProvider *)self _clearBulletinNotifications];
      [(RTVehicleLocationProvider *)self _notifyClients];
    }
    else
    {
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
        uint64_t v21 = [v20 vehicleIdentifier];
        *(_DWORD *)buf = 138412546;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "onVehicleStarted, different vehicle, deviceId, %@, old deviceId, %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v18 = [(RTVehicleLocationProvider *)self managedObjectContext];

    if (!v18) {
      [(RTVehicleLocationProvider *)self _deleteLastVehicleEvent];
    }
    dispatch_time_t v14 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "Metric: No existing parking information. no return to car metric is submitted.", buf, 2u);
    }
  }
}

void __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke_2;
  block[3] = &unk_1E6B957F8;
  id v13 = v6;
  id v14 = v5;
  id v8 = a1[5];
  id v9 = a1[4];
  id v15 = v8;
  id v16 = v9;
  id v17 = a1[6];
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v1 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v2 = "Metric: No cached location is found. no return to car metric is submitted.";
      id v3 = v1;
      uint32_t v4 = 2;
LABEL_13:
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, v2, buf, v4);
    }
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7)
    {
      [v7 clientLocation];
      double v8 = v20;
    }
    else
    {
      double v8 = 0.0;
    }
    double v9 = Current - v8;
    v1 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    BOOL v10 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);
    if (v9 >= 15.0)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        double v22 = v9;
        uint64_t v2 = "Metric: The cached location is too old. no return to car metric is submitted. (%f seconds)";
        id v3 = v1;
        uint32_t v4 = 12;
        goto LABEL_13;
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        double v22 = v9;
        _os_log_impl(&dword_1D9BFA000, v1, OS_LOG_TYPE_INFO, "Metric: A valid cached location is found. a return to car metric will be submitted. (%f seconds)", buf, 0xCu);
      }

      id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [*(id *)(a1 + 48) latitude];
      double v13 = v12;
      [*(id *)(a1 + 48) longitude];
      v1 = [v11 initWithLatitude:v13 longitude:v14];
      [v1 distanceFromLocation:*(void *)(a1 + 40)];
      double v16 = v15;
      id v17 = *(void **)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 64);
      [*(id *)(a1 + 40) horizontalAccuracy];
      [v17 _submitFMCReturnToCarInstanceWithIdentifier:v18 horizontalAccuracy:(int)v19 horizontalDistance:(int)fmin(v16, 2147483650.0)];
    }
  }
}

- (void)_onVehicleConnectedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = v4;
    if ([v8 vehicleConnectedState] == 1)
    {
      double v9 = [v8 deviceId];
      [(RTVehicleLocationProvider *)self _onVehicleParkedWithDeviceId:v9];
      uint64_t v10 = 2;
    }
    else
    {
      if ([v8 vehicleConnectedState] != 2)
      {
LABEL_10:

        goto LABEL_11;
      }
      double v9 = [v8 deviceId];
      [(RTVehicleLocationProvider *)self _onVehicleStartedWithDeviceId:v9];
      uint64_t v10 = 1;
    }

    [(RTVehicleLocationProvider *)self _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:v10];
    goto LABEL_10;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v12 = [v4 name];
    int v13 = 138412290;
    double v14 = v12;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v13, 0xCu);
  }
LABEL_11:
}

- (void)onVehicleConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__RTVehicleLocationProvider_onVehicleConnectedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__RTVehicleLocationProvider_onVehicleConnectedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleConnectedNotification:*(void *)(a1 + 40)];
}

- (void)_onVehicleExit
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
  if (v4
    && ([(RTVehicleLocationProvider *)self pendingVehicleParkedEvent],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 confirmed],
        v5,
        v4,
        !v6))
  {
    id v8 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    double v9 = [v8 date];
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    double v12 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v22 = v13;
      __int16 v23 = 2048;
      double v24 = -v11;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@ called after %f seconds of the vehicle event.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke;
    v19[3] = &unk_1E6B91900;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v14 = MEMORY[0x1E016DB00](v19);
    uint64_t v15 = (void *)v14;
    if (v11 <= -300.0)
    {
      double v16 = [(RTVehicleLocationProvider *)self locationManager];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_144;
      v17[3] = &unk_1E6B93AD0;
      v17[4] = self;
      id v18 = v15;
      [v16 fetchCurrentLocationWithHandler:v17];
    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "No vehicle event to confirm or vehicle event already confirmed.", buf, 2u);
    }
  }
}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained pendingVehicleParkedEvent];
  if (v2
    && (id v3 = (void *)v2,
        [WeakRetained pendingVehicleParkedEvent],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 confirmed],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    int v7 = [WeakRetained pendingVehicleParkedEvent];
    [v7 setConfirmed:1];

    [WeakRetained _finalizeLastVehicleEventIfAppropriate];
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [WeakRetained pendingVehicleParkedEvent];
      int v9 = 138412290;
      double v10 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Confirming the vehicle event, %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "No vehicle event to confirm, or vehicle event already confirmed.", (uint8_t *)&v9, 2u);
    }
  }
}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_2;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 setPendingVehicleParkedEvent:0];
    [*(id *)(a1 + 40) _recordMetricSuppressedEvent];
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      id v5 = "Sanity check failed. No location fix on vehicle exit.";
LABEL_10:
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    id v6 = [v2 pendingVehicleParkedEvent];
    int v7 = [v6 location];
    [v7 latitude];
    uint64_t v8 = [*(id *)(a1 + 40) pendingVehicleParkedEvent];
    int v9 = [v8 location];
    [v9 longitude];
    [*(id *)(a1 + 48) coordinate];
    [*(id *)(a1 + 48) coordinate];
    RTCommonCalculateDistance();
    double v11 = v10;

    double v12 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      double v14 = v11;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Sanity check, distance between exit and disconnect, %f", (uint8_t *)&v13, 0xCu);
    }

    if (v11 < 700.0)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
    [*(id *)(a1 + 40) setPendingVehicleParkedEvent:0];
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      id v5 = "Sanity check failed. Removing pending vehicle event since we're not confident about it.";
      goto LABEL_10;
    }
  }
}

- (void)_onVehicleExitNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Got onVehicleExitNotification.", (uint8_t *)&v11, 2u);
    }

    [(RTVehicleLocationProvider *)self _onVehicleExit];
    [(RTVehicleLocationProvider *)self _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:3];
  }
  else
  {
    if (v9)
    {
      double v10 = [v4 name];
      int v11 = 138412290;
      double v12 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)onVehicleExitNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTVehicleLocationProvider_onVehicleExitNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTVehicleLocationProvider_onVehicleExitNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleExitNotification:*(void *)(a1 + 40)];
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  [v4 isEqualToString:v5];
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__RTVehicleLocationProvider_vehicleEventAtLocation_notes_handler___block_invoke;
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

uint64_t __66__RTVehicleLocationProvider_vehicleEventAtLocation_notes_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _vehicleEventAtLocation:*(void *)(a1 + 40) notes:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  int v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "_vehicleEventAtLocation, %@, notes, %@", buf, 0x16u);
  }

  if ([(RTVehicleLocationProvider *)self monitorVehicleLocation])
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    if (!v13) {
      goto LABEL_17;
    }
    id v14 = (void *)v13;
    uint64_t v15 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    id v16 = [v15 date];
    [v12 timeIntervalSinceDate:v16];
    double v18 = v17;

    if (v18 < 10.0)
    {
      double v19 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Found recent parking event. Merging into existing event.", buf, 2u);
      }

      if (v8)
      {
        id v20 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v8];
        uint64_t v21 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
        [v21 setLocation:v20];

        double v22 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
        [v22 setUserSetLocation:1];
      }
      if (v9)
      {
        __int16 v23 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
        [v23 setNotes:v9];
      }
      double v24 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
      [v24 setConfirmed:1];
    }
    else
    {
LABEL_17:
      id v27 = objc_alloc(MEMORY[0x1E4F5CFC0]);
      double v24 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v8];
      uint64_t v28 = [MEMORY[0x1E4F29128] UUID];
      LOBYTE(v32) = 1;
      uint64_t v29 = (void *)[v27 initWithDate:v12 location:v24 vehicleIdentifier:0 userSetLocation:v8 != 0 notes:v9 identifier:v28 photo:0 mapItem:0 confirmed:v32];
      [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:v29];
    }
    int v30 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];
    id v31 = [v30 location];

    if (v31)
    {
      [(RTVehicleLocationProvider *)self _processPendingVehicleEventAfterLocationFinalization];
      if (!v10) {
        goto LABEL_24;
      }
    }
    else
    {
      [(RTVehicleLocationProvider *)self requestLocations];
      if (!v10)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    uint64_t v26 = 0;
LABEL_23:
    v10[2](v10, v26);
    goto LABEL_24;
  }
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "FMC disabled, not creating vehicle event.", buf, 2u);
  }

  if (v10)
  {
    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:0];
    id v12 = (void *)v26;
    goto LABEL_23;
  }
LABEL_25:
}

- (void)_clearAllVehicleEvents
{
  uint64_t v3 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  if (v3)
  {
  }
  else
  {
    id v4 = [(RTVehicleLocationProvider *)self pendingVehicleParkedEvent];

    if (!v4) {
      return;
    }
  }
  [(RTVehicleLocationProvider *)self setLastVehicleParkedEvent:0];
  [(RTVehicleLocationProvider *)self setPendingVehicleParkedEvent:0];
  [(RTVehicleLocationProvider *)self setMonitorLocation:0];
  [(RTVehicleLocationProvider *)self _deleteLastVehicleEvent];

  [(RTVehicleLocationProvider *)self _notifyClients];
}

- (void)clearAllVehicleEvents
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTVehicleLocationProvider_clearAllVehicleEvents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__RTVehicleLocationProvider_clearAllVehicleEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearAllVehicleEvents];
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_notes___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_notes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v6 setNotes:v5];

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) UUIDString];
    [v7 _submitFMCAssistanceInstanceWithIdentifier:v8 uiPlacement:0 assistanceType:1 assistanceValue:0];

    [*(id *)(a1 + 32) _persistLastVehicleEvent];
    id v9 = *(void **)(a1 + 32);
    [v9 _notifyClients];
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_photo___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_photo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v6 setPhoto:v5];

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) UUIDString];
    [v7 _submitFMCAssistanceInstanceWithIdentifier:v8 uiPlacement:0 assistanceType:2 assistanceValue:0];

    [*(id *)(a1 + 32) _persistLastVehicleEvent];
    id v9 = *(void **)(a1 + 32);
    [v9 _notifyClients];
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 mapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_mapItem___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_mapItem___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] lastVehicleParkedEvent];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqual:a1[5]];

  if (v4)
  {
    id v5 = a1[6];
    id v6 = [a1[4] lastVehicleParkedEvent];
    [v6 setMapItem:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v8 = [a1[4] lastVehicleParkedEvent];
    id v9 = [v8 location];
    [v9 latitude];
    double v11 = v10;
    id v12 = [a1[4] lastVehicleParkedEvent];
    id v13 = [v12 location];
    [v13 longitude];
    id v26 = (id)[v7 initWithLatitude:v11 longitude:v14];

    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v16 = [a1[6] location];
    [v16 latitude];
    double v18 = v17;
    double v19 = [a1[6] location];
    [v19 longitude];
    uint64_t v21 = (void *)[v15 initWithLatitude:v18 longitude:v20];

    [v26 distanceFromLocation:v21];
    uint64_t v23 = (int)v22;
    id v24 = a1[4];
    uint64_t v25 = [a1[5] UUIDString];
    [v24 _submitFMCAssistanceInstanceWithIdentifier:v25 uiPlacement:1 assistanceType:3 assistanceValue:v23];

    [a1[4] _persistLastVehicleEvent];
    [a1[4] _notifyClients];
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_location___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_location___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v6 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    id v7 = [v6 location];
    [v7 latitude];
    double v9 = v8;
    id v10 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    double v11 = [v10 location];
    [v11 longitude];
    id v21 = (id)[v5 initWithLatitude:v9 longitude:v12];

    [v21 distanceFromLocation:*(void *)(a1 + 48)];
    uint64_t v14 = (int)v13;
    id v15 = *(void **)(a1 + 32);
    id v16 = [*(id *)(a1 + 40) UUIDString];
    [v15 _submitFMCAssistanceInstanceWithIdentifier:v16 uiPlacement:1 assistanceType:4 assistanceValue:v14];

    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:*(void *)(a1 + 48)];
    double v18 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v18 setLocation:v17];

    double v19 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v19 setUserSetLocation:1];

    double v20 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v20 setLocationQuality:0];

    [*(id *)(a1 + 32) _persistLastVehicleEvent];
    [*(id *)(a1 + 32) _notifyClients];
  }
}

- (void)engageInVehicleEventWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTVehicleLocationProvider_engageInVehicleEventWithIdentifier___block_invoke;
  block[3] = &unk_1E6B917C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__RTVehicleLocationProvider_engageInVehicleEventWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained lastVehicleParkedEvent];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) UUIDString];
    [WeakRetained _submitFMCAssistanceInstanceWithIdentifier:v5 uiPlacement:1 assistanceType:5 assistanceValue:0];
  }
}

- (void)_postBulletinNotificationIfAppropriate
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "_postNotificationIfAppropriate called.", (uint8_t *)&v19, 2u);
  }

  int v4 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  if ([v4 userSetLocation]) {
    goto LABEL_6;
  }
  id v5 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  if ([v5 usualLocation])
  {

LABEL_6:
    goto LABEL_7;
  }
  double v13 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  uint64_t v14 = [v13 locationQuality];

  if (v14 != 1)
  {
LABEL_7:
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
      int v8 = [v7 userSetLocation];
      id v9 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
      int v10 = [v9 usualLocation];
      double v11 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
      uint64_t v12 = [v11 locationQuality];
      int v19 = 67109632;
      *(_DWORD *)double v20 = v8;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v10;
      v21[0] = 2048;
      *(void *)&v21[1] = v12;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Not posting bulletin board notification, userSetLocation, %d, usualLocation, %d, locationQuality, %lu", (uint8_t *)&v19, 0x18u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v6 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsVehicleEventBulletinNotificationPosted"];
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    *(void *)double v20 = @"RTDefaultsVehicleEventBulletinNotificationPosted";
    *(_WORD *)&v20[8] = 2112;
    *(void *)id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "default, %@, value, %@", (uint8_t *)&v19, 0x16u);
  }

  if (![v6 integerValue])
  {
    id v16 = [(RTVehicleLocationProvider *)self mapsSupportManager];
    double v17 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    [v16 showParkedCarBulletinForEvent:v17];

    defaultsManager = self->_defaultsManager;
    id v7 = [NSNumber numberWithInteger:-[NSObject integerValue](v6, "integerValue") + 1];
    [(RTDefaultsManager *)defaultsManager setObject:v7 forKey:@"RTDefaultsVehicleEventBulletinNotificationPosted"];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_postVehicleReplacementBulletinNotificationWithVehicleEvent:(id)a3 replacingEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTVehicleLocationProvider *)self mapsSupportManager];
  [v8 showParkedCarReplacementBulletinForEvent:v7 replacingEvent:v6];
}

- (void)_clearBulletinNotifications
{
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "_clearBulletinNotifications called.", v5, 2u);
  }

  int v4 = [(RTVehicleLocationProvider *)self mapsSupportManager];
  [v4 clearParkedCarBulletin];
}

- (void)_onExternalVehicleEventReceived:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Notifying clients about an external vehicle event. %@", buf, 0xCu);
  }

  if (v4)
  {
    [(RTVehicleLocationProvider *)self setLastVehicleParkedEvent:v4];
    [(RTVehicleLocationProvider *)self _persistLastVehicleEvent];
    id v6 = [RTVehicleEventNotification alloc];
    id v9 = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    id v8 = [(RTVehicleEventNotification *)v6 initWithVehicleEvents:v7];

    [(RTNotifier *)self postNotification:v8];
  }
  else
  {
    [(RTVehicleLocationProvider *)self _clearAllVehicleEvents];
  }
}

- (void)_notifyClients
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTVehicleLocationProvider *)self _getLastVehicleEvents];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v7++) setPhoto:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
  id v8 = [[RTVehicleEventNotification alloc] initWithVehicleEvents:v3];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Notifying clients about %lu vehicle events.", buf, 0xCu);
  }

  [(RTNotifier *)self postNotification:v8];
  id v11 = [v3 lastObject];
  [(RTVehicleLocationProvider *)self _sendVehicleEventToCompanionDevice:v11];
}

- (void)_sendVehicleEventToCompanionDevice:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(RTVehicleLocationProvider *)self companionLink];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    BOOL v7 = [(RTVehicleLocationProvider *)self monitorExternalVehicleLocation];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] now];
      [(RTVehicleLocationProvider *)self setLastCompanionSyncRequestDate:v8];

      id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v4 date];
        id v11 = [(RTVehicleLocationProvider *)self lastCompanionSyncDate];
        long long v12 = [(RTVehicleLocationProvider *)self lastCompanionSyncRequestDate];
        *(_DWORD *)buf = 138412802;
        double v18 = v10;
        __int16 v19 = 2112;
        double v20 = v11;
        __int16 v21 = 2112;
        double v22 = v12;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "CompanionSync, vehicle.date, %@, last.sync.date, %@, request.date, %@", buf, 0x20u);
      }
      long long v13 = [(RTVehicleLocationProvider *)self companionLink];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__RTVehicleLocationProvider__sendVehicleEventToCompanionDevice___block_invoke;
      v14[3] = &unk_1E6B91350;
      id v15 = v4;
      id v16 = self;
      [v13 sendVehicleEvent:v15 handler:v14];
    }
  }
}

void __64__RTVehicleLocationProvider__sendVehicleEventToCompanionDevice___block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) date];
    uint64_t v6 = [*(id *)(a1 + 40) lastCompanionSyncDate];
    uint64_t v7 = [*(id *)(a1 + 40) lastCompanionSyncRequestDate];
    id v8 = (void *)v7;
    id v9 = @"failure";
    int v11 = 138413058;
    long long v12 = v5;
    if (a2) {
      id v9 = @"success";
    }
    __int16 v13 = 2112;
    long long v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    double v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "CompanionSync, vehicle.date, %@, last.sync.date, %@, request.date, %@, result, %@", (uint8_t *)&v11, 0x2Au);
  }
  if (a2)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 40) setLastCompanionSyncDate:v10];
  }
}

- (void)_resendVehicleEventIfNecessary
{
  uint64_t v3 = [(RTVehicleLocationProvider *)self lastCompanionSyncDate];
  id v4 = [(RTVehicleLocationProvider *)self lastCompanionSyncRequestDate];
  int v5 = [v3 isBeforeDate:v4];

  if (v5)
  {
    id v7 = [(RTVehicleLocationProvider *)self _getLastVehicleEvents];
    uint64_t v6 = [v7 lastObject];
    [(RTVehicleLocationProvider *)self _sendVehicleEventToCompanionDevice:v6];
  }
}

- (BOOL)_deleteLastVehicleEvent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTVehicleLocationProvider *)self managedObjectContext];

  if (v3)
  {
    *(void *)long long v12 = 0;
    __int16 v13 = v12;
    uint64_t v14 = 0x3032000000;
    __int16 v15 = __Block_byref_object_copy__62;
    uint64_t v16 = __Block_byref_object_dispose__62;
    id v17 = 0;
    id v4 = [(RTVehicleLocationProvider *)self managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__RTVehicleLocationProvider__deleteLastVehicleEvent__block_invoke;
    v11[3] = &unk_1E6B90E98;
    v11[4] = self;
    v11[5] = v12;
    [v4 performBlockAndWait:v11];

    uint64_t v5 = *((void *)v13 + 5);
    BOOL v6 = v5 == 0;
    if (v5)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [*((id *)v13 + 5) description];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v8;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Error deleting last parked event, %@", buf, 0xCu);
      }
    }
    _Block_object_dispose(v12, 8);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "No managed object context, not deleting.", v12, 2u);
    }

    [(RTVehicleLocationProvider *)self setVehicleEventPendingPersist:0];
    [(RTVehicleLocationProvider *)self setVehicleEventPendingDeletion:1];
    return 0;
  }
  return v6;
}

void __52__RTVehicleLocationProvider__deleteLastVehicleEvent__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[NSManagedObject entityName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 deleteAllWithEntityName:v3 predicate:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(id *)(v6 + 40);
    [v5 save:&v7];
    objc_storeStrong((id *)(v6 + 40), v7);
  }
}

- (BOOL)_persistLastVehicleEvent
{
  uint64_t v2 = self;
  uint64_t v3 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  LOBYTE(v2) = [(RTVehicleLocationProvider *)v2 _persistVehicleEvent:v3];

  return (char)v2;
}

- (BOOL)_persistVehicleEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 date];
  if (!v5)
  {
LABEL_10:
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Not persisting last vehicle event without a date, location or identifier.", v23, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v6 = [v4 location];
  if (!v6)
  {

    goto LABEL_10;
  }
  id v7 = [v4 identifier];

  if (!v7) {
    goto LABEL_10;
  }
  id v8 = [(RTVehicleLocationProvider *)self managedObjectContext];

  if (!v8)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "No managed object context, not persisting.", v23, 2u);
    }

    double v18 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    [(RTVehicleLocationProvider *)self setVehicleEventPendingPersist:v18];

    goto LABEL_13;
  }
  if (![(RTVehicleLocationProvider *)self _deleteLastVehicleEvent])
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Can't delete previous parked event, not saving.", v23, 2u);
    }
LABEL_12:

LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  *(void *)uint64_t v23 = 0;
  id v24 = v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__62;
  id v27 = __Block_byref_object_dispose__62;
  id v28 = 0;
  id v9 = [(RTVehicleLocationProvider *)self managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__RTVehicleLocationProvider__persistVehicleEvent___block_invoke;
  v19[3] = &unk_1E6B91128;
  id v10 = v4;
  id v20 = v10;
  __int16 v21 = self;
  double v22 = v23;
  [v9 performBlockAndWait:v19];

  uint64_t v11 = *((void *)v24 + 5);
  BOOL v12 = v11 == 0;
  if (v11)
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [*((id *)v24 + 5) description];
      *(_DWORD *)buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      uint64_t v32 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "Error persisting last vehicle event, %@, error, %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "Persisted last vehicle event, %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(v23, 8);
LABEL_14:

  return v12;
}

void __50__RTVehicleLocationProvider__persistVehicleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[RTVehicleEventMO managedObjectWithVehicleEvent:v2 inManagedObjectContext:v3];

  uint64_t v5 = [*(id *)(a1 + 32) mapItem];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v4 mapItem];

    if (!v7)
    {
      id v8 = [*(id *)(a1 + 32) mapItem];
      id v9 = [*(id *)(a1 + 40) managedObjectContext];
      id v10 = +[RTMapItemMO managedObjectWithMapItem:v8 inManagedObjectContext:v9];
    }
  }
  uint64_t v11 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v12 + 40);
  [v11 save:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
}

- (void)persistLastVehicleEvent
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTVehicleLocationProvider_persistLastVehicleEvent__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__RTVehicleLocationProvider_persistLastVehicleEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistLastVehicleEvent];
}

- (void)_onManagedObjectContextCreated:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[RTVehicleLocationProvider setManagedObjectContext:](self, "setManagedObjectContext:");
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(RTVehicleLocationProvider *)self vehicleEventPendingPersist];
      v13[0] = 67109376;
      v13[1] = v5 != 0;
      __int16 v14 = 1024;
      BOOL v15 = [(RTVehicleLocationProvider *)self vehicleEventPendingDeletion];
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "_onManagedObjectContextCreated, vehicleEventPendingPersist, %d, vehicleEventPendingDeletion, %d.", (uint8_t *)v13, 0xEu);
    }
    uint64_t v6 = [(RTVehicleLocationProvider *)self vehicleEventPendingPersist];

    if (v6)
    {
      id v7 = [(RTVehicleLocationProvider *)self vehicleEventPendingPersist];
      [(RTVehicleLocationProvider *)self _persistVehicleEvent:v7];
    }
    else if ([(RTVehicleLocationProvider *)self vehicleEventPendingDeletion])
    {
      [(RTVehicleLocationProvider *)self _deleteLastVehicleEvent];
    }
    else
    {
      [(RTVehicleLocationProvider *)self _restoreLastVehicleEvent];
    }
    id v9 = [RTVehicleLocationHistoryController alloc];
    id v10 = [(RTNotifier *)self queue];
    uint64_t v11 = [(RTVehicleLocationProvider *)self managedObjectContext];
    uint64_t v12 = [(RTVehicleLocationHistoryController *)v9 initWithQueue:v10 managedObjectContext:v11];
    [(RTVehicleLocationProvider *)self setVehicleLocationHistoryController:v12];

    [(RTVehicleLocationProvider *)self _updateAuxiliaryDataIfAppropriate];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Failed to create managed object context.", (uint8_t *)v13, 2u);
    }
  }
}

- (void)_restoreLastVehicleEvent
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTVehicleLocationProvider *)self managedObjectContext];
  if (v3)
  {
    id v4 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];

    if (!v4)
    {
      v9[0] = 0;
      v9[1] = v9;
      _DWORD v9[2] = 0x3032000000;
      v9[3] = __Block_byref_object_copy__62;
      v9[4] = __Block_byref_object_dispose__62;
      id v10 = 0;
      uint64_t v5 = [(RTVehicleLocationProvider *)self managedObjectContext];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__RTVehicleLocationProvider__restoreLastVehicleEvent__block_invoke;
      v8[3] = &unk_1E6B90E98;
      v8[4] = self;
      void v8[5] = v9;
      [v5 performBlockAndWait:v8];

      uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v7;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Restored last vehicle event, %@.", buf, 0xCu);
      }
      _Block_object_dispose(v9, 8);
    }
  }
}

void __53__RTVehicleLocationProvider__restoreLastVehicleEvent__block_invoke(uint64_t a1)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v53[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];

  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v5 = +[NSManagedObject entityName];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v4 fetchAllWithEntityName:v5 predicate:0 sortDescriptors:v3 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  id v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v9;
    __int16 v51 = 2112;
    uint64_t v52 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Retrieved %lu vehicle events from disk, error, %@.", buf, 0x16u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && [v7 count])
  {
    uint64_t v11 = [v7 firstObject];
    uint64_t v12 = (void *)MEMORY[0x1E4F5CE38];
    uint64_t v13 = [v11 mapItem];
    uint64_t v47 = [v12 createWithManagedObject:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F5CE00]);
    BOOL v15 = [v11 locLatitude];
    [v15 doubleValue];
    double v17 = v16;
    double v18 = [v11 locLongitude];
    [v18 doubleValue];
    double v20 = v19;
    __int16 v21 = [v11 locUncertainty];
    [v21 doubleValue];
    double v23 = v22;
    id v24 = [v11 locDate];
    uint64_t v25 = [v11 locReferenceFrame];
    v46 = [v14 initWithLatitude:v24 longitude:objc_msgSend(v25, "intValue") horizontalUncertainty:v17 date:v20 referenceFrame:v23];

    id v43 = objc_alloc(MEMORY[0x1E4F5CFC0]);
    [v11 date];
    v26 = uint64_t v45 = v3;
    id v27 = [v11 vehicleIdentifier];
    v44 = [v11 userSetLocation];
    uint64_t v28 = [v44 BOOLValue];
    uint64_t v29 = [v11 notes];
    id v30 = objc_alloc(MEMORY[0x1E4F29128]);
    __int16 v31 = [v11 identifier];
    uint64_t v32 = (void *)[v30 initWithUUIDString:v31];
    uint64_t v33 = [v11 photoData];
    LOBYTE(v42) = 1;
    id v34 = (void *)[v43 initWithDate:v26 location:v46 vehicleIdentifier:v27 userSetLocation:v28 notes:v29 identifier:v32 photo:v33 mapItem:v47 confirmed:v42];
    [*(id *)(a1 + 32) setLastVehicleParkedEvent:v34];

    uint64_t v3 = v45;
    __int16 v35 = [v11 locationQuality];
    uint64_t v36 = [v35 integerValue];
    uint64_t v37 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v37 setLocationQuality:v36];

    uint64_t v38 = [v11 usualLocation];
    uint64_t v39 = [v38 BOOLValue];
    id v40 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v40 setUsualLocation:v39];

    v41 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    [v41 setLocationFinalized:1];
  }
}

- (void)restoreLastVehicleEvent
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTVehicleLocationProvider_restoreLastVehicleEvent__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__RTVehicleLocationProvider_restoreLastVehicleEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreLastVehicleEvent];
}

- (void)_updateNearbyLocationOfInterestOfVehicleEvent:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 location];

  if (v8)
  {
    uint64_t v9 = [(RTVehicleLocationProvider *)self learnedLocationManager];
    uint64_t v10 = [v6 location];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke;
    v11[3] = &unk_1E6B95C88;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v9 fetchLocationOfInterestAtLocation:v10 handler:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke_2;
  v11[3] = &unk_1E6B95C60;
  id v12 = a1[5];
  id v13 = v5;
  id v8 = a1[6];
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setNearbyLocationOfInterest:v2];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_updateUsualLocationOfVehicleEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(RTVehicleLocationProvider *)self vehicleLocationHistoryController];
  [v5 setUsualLocation:[v6 _evaluateUsualLocationWithVehicleEvent:v5]];

  id v7 = [(RTVehicleLocationProvider *)self vehicleLocationHistoryController];
  [v7 _persistVehicleEventToHistory:v5];

  id v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(a2);
    id v10 = [(RTVehicleLocationProvider *)self vehicleLocationHistoryController];
    int v11 = 138412802;
    id v12 = v9;
    __int16 v13 = 1024;
    BOOL v14 = v10 != 0;
    __int16 v15 = 1024;
    int v16 = [v5 usualLocation];
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, vehicleLocationHistoryController created, %d, usualLocation, %d", (uint8_t *)&v11, 0x18u);
  }
}

- (void)_updateAuxiliaryDataIfAppropriate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(RTVehicleLocationProvider *)self managedObjectContext];
    if (v6)
    {
      id v7 = (void *)v6;
      BOOL v8 = [(RTVehicleLocationProvider *)self locationsOfInterestAvailable];

      if (v8)
      {
        id v9 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        _DWORD v13[2] = __62__RTVehicleLocationProvider__updateAuxiliaryDataIfAppropriate__block_invoke;
        v13[3] = &unk_1E6B90CB8;
        v13[4] = self;
        void v13[5] = a2;
        [(RTVehicleLocationProvider *)self _updateNearbyLocationOfInterestOfVehicleEvent:v9 handler:v13];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    int v11 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];
    id v12 = [(RTVehicleLocationProvider *)self managedObjectContext];
    *(_DWORD *)buf = 138413058;
    __int16 v15 = v10;
    __int16 v16 = 1024;
    BOOL v17 = v11 != 0;
    __int16 v18 = 1024;
    BOOL v19 = v12 != 0;
    __int16 v20 = 1024;
    BOOL v21 = [(RTVehicleLocationProvider *)self locationsOfInterestAvailable];
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, lastVehicleParkedEvent, %d, managedObjectContext, %d, locationsOfInterestAvailable, %d", buf, 0x1Eu);
  }
LABEL_8:
}

void __62__RTVehicleLocationProvider__updateAuxiliaryDataIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
    id v7 = [v6 nearbyLocationOfInterest];
    int v15 = 138412802;
    __int16 v16 = v5;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, nearbyLOI, %@, error, %@", (uint8_t *)&v15, 0x20u);
  }
  BOOL v8 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  int v9 = [v8 usualLocation];

  id v10 = *(void **)(a1 + 32);
  int v11 = [v10 lastVehicleParkedEvent];
  [v10 _updateUsualLocationOfVehicleEvent:v11];

  id v12 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  if (v9 != [v12 usualLocation])
  {

LABEL_6:
    [*(id *)(a1 + 32) _notifyClients];
    goto LABEL_7;
  }
  __int16 v13 = [*(id *)(a1 + 32) lastVehicleParkedEvent];
  BOOL v14 = [v13 nearbyLocationOfInterest];

  if (v14) {
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)_sameVehicleWithDeviceId:(id)a3 otherDeviceId:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqualToString:a4];
  }
  else {
    return 1;
  }
}

- (void)didReceiveEffectiveSettingsChangedNotification
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTVehicleLocationProvider_didReceiveEffectiveSettingsChangedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __75__RTVehicleLocationProvider_didReceiveEffectiveSettingsChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFeatureEnablement];
}

- (void)onNanoRegistryNotification:(id)a3
{
  uint64_t v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTVehicleLocationProvider_onNanoRegistryNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __56__RTVehicleLocationProvider_onNanoRegistryNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFeatureEnablement];
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__RTVehicleLocationProvider_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__RTVehicleLocationProvider_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "received %@", (uint8_t *)&v11, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) available];
    id v8 = *(void **)(a1 + 40);
    if (v7)
    {
      [v8 setLocationsOfInterestAvailable:1];
      [*(id *)(a1 + 40) _updateAuxiliaryDataIfAppropriate];
    }
    else
    {
      [v8 setLocationsOfInterestAvailable:0];
    }
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 32) name];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "unhandled notification, %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__RTVehicleLocationProvider_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke;
    block[3] = &unk_1E6B90868;
    id v8 = v4;
    dispatch_async(v5, block);

    int v6 = v8;
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[RTVehicleLocationProvider fetchAutomaticVehicleEventDetectionSupportedWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 1508;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __85__RTVehicleLocationProvider_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F222C0] isAvailable];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (void)fetchFMCEnabledWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__RTVehicleLocationProvider_fetchFMCEnabledWithHandler___block_invoke;
    v7[3] = &unk_1E6B90D08;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);

    int v6 = v8;
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[RTVehicleLocationProvider fetchFMCEnabledWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 1528;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __56__RTVehicleLocationProvider_fetchFMCEnabledWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) monitorVehicleLocation];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

- (void)_submitFMCParkingEventMetric:(id)a3
{
  id v6 = [(RTVehicleLocationProvider *)self _createMetricFromParkingEvent:a3];
  id v3 = [NSString alloc];
  id v4 = (void *)[v3 initWithCString:RTAnalyticsEventFindMyCarParkingEvent encoding:1];
  log_analytics_submission(v4, v6);
  id v5 = [NSString stringWithFormat:@"com.apple.%@", v4];
  AnalyticsSendEvent();
}

- (id)_createMetricFromParkingEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = NSNumber;
  id v6 = [v3 location];
  [v6 horizontalUncertainty];
  int v7 = [v5 numberWithDouble:];
  [v4 setObject:v7 forKeyedSubscript:@"horizontalAccuracy"];

  id v8 = [NSNumber numberWithUnsignedInteger:[v3 locationQuality]];
  [v4 setObject:v8 forKeyedSubscript:@"qualityIndicator"];

  int v9 = NSNumber;
  LODWORD(v6) = [v3 userSetLocation];

  if (v6) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  __int16 v11 = [v9 numberWithUnsignedInteger:v10];
  [v4 setObject:v11 forKeyedSubscript:@"triggerType"];

  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"userAssistanceRequired"];

  return v4;
}

- (void)_onDailyMetricNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v6 & 1) == 0)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [v4 name];
      *(_DWORD *)buf = 138412802;
      id v20 = v18;
      __int16 v21 = 2080;
      uint64_t v22 = "-[RTVehicleLocationProvider _onDailyMetricNotification:]";
      __int16 v23 = 1024;
      int v24 = 1560;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  id v8 = [v4 name];
  char v9 = [v8 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v9)
  {
    uint64_t v10 = [(RTVehicleLocationProvider *)self scoreBoard];
    __int16 v11 = [(RTVehicleLocationProvider *)self _createMetricFromScoreBoard:v10];

    int v12 = [(RTVehicleLocationProvider *)self scoreBoardForUnusualLocation];
    [v12 clearScoreBoard];

    uint64_t v13 = [(RTVehicleLocationProvider *)self scoreBoardForUsualLocation];
    [v13 clearScoreBoard];

    BOOL v14 = [(RTVehicleLocationProvider *)self scoreBoard];
    [v14 clearScoreBoard];

    id v15 = [NSString alloc];
    __int16 v16 = (void *)[v15 initWithCString:RTAnalyticsEventFindMyCarReports encoding:1];
    log_analytics_submission(v16, v11);
    __int16 v17 = [NSString stringWithFormat:@"com.apple.%@", v16];
    AnalyticsSendEvent();
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    __int16 v16 = [v4 name];
    *(_DWORD *)buf = 138412290;
    id v20 = v16;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
  }

LABEL_9:
}

- (void)onDailyMetricNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTVehicleLocationProvider_onDailyMetricNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTVehicleLocationProvider_onDailyMetricNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricNotification:*(void *)(a1 + 40)];
}

- (id)_createMetricFromScoreBoard:(id)a3
{
  id v3 = a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "create mertric from scoreBoard", v20, 2u);
  }

  id v5 = objc_opt_new();
  id v6 = NSNumber;
  int v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v3 creationDate];
  [v7 timeIntervalSinceDate:v8];
  uint64_t v10 = [v6 numberWithInt:(int)v9];
  [v5 setObject:v10 forKeyedSubscript:@"duration"];

  __int16 v11 = [NSNumber numberWithInt:[v3 parkingEvents]];
  [v5 setObject:v11 forKeyedSubscript:@"parkingEvents"];

  int v12 = [NSNumber numberWithInt:[v3 engagedParkingEvents]];
  [v5 setObject:v12 forKeyedSubscript:@"engagedParkingEvents"];

  uint64_t v13 = [NSNumber numberWithInt:[v3 assistedParkingEvents]];
  [v5 setObject:v13 forKeyedSubscript:@"assistedParkingEvents"];

  BOOL v14 = [NSNumber numberWithInt:[v3 engagements]];
  [v5 setObject:v14 forKeyedSubscript:@"engagements"];

  id v15 = [NSNumber numberWithInt:[v3 assistances]];
  [v5 setObject:v15 forKeyedSubscript:@"assistances"];

  __int16 v16 = NSNumber;
  uint64_t v17 = [v3 suppressedEvents];

  __int16 v18 = [v16 numberWithInt:v17];
  [v5 setObject:v18 forKeyedSubscript:@"suppressedParkingEvents"];

  return v5;
}

- (OS_dispatch_source)finalizeLocationEstimateTimer
{
  return self->_finalizeLocationEstimateTimer;
}

- (void)setFinalizeLocationEstimateTimer:(id)a3
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

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (void)setMapsSupportManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (RTVehicleLocationHistoryController)vehicleLocationHistoryController
{
  return self->_vehicleLocationHistoryController;
}

- (void)setVehicleLocationHistoryController:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (RTVehicleLocationCompanionLink)companionLink
{
  return self->_companionLink;
}

- (void)setCompanionLink:(id)a3
{
}

- (NSDate)lastCompanionSyncRequestDate
{
  return self->_lastCompanionSyncRequestDate;
}

- (void)setLastCompanionSyncRequestDate:(id)a3
{
}

- (NSDate)lastCompanionSyncDate
{
  return self->_lastCompanionSyncDate;
}

- (void)setLastCompanionSyncDate:(id)a3
{
}

- (BOOL)monitorExternalVehicleLocation
{
  return self->_monitorExternalVehicleLocation;
}

- (void)setMonitorExternalVehicleLocation:(BOOL)a3
{
  self->_monitorExternalVehicleLocation = a3;
}

- (BOOL)monitorVehicleConnection
{
  return self->_monitorVehicleConnection;
}

- (BOOL)monitorVehicleExit
{
  return self->_monitorVehicleExit;
}

- (BOOL)monitorLocation
{
  return self->_monitorLocation;
}

- (void)setLastVehicleParkedEvent:(id)a3
{
}

- (RTVehicleEvent)pendingVehicleParkedEvent
{
  return self->_pendingVehicleParkedEvent;
}

- (void)setPendingVehicleParkedEvent:(id)a3
{
}

- (RTVehicleEvent)vehicleEventPendingPersist
{
  return self->_vehicleEventPendingPersist;
}

- (void)setVehicleEventPendingPersist:(id)a3
{
}

- (BOOL)vehicleEventPendingDeletion
{
  return self->_vehicleEventPendingDeletion;
}

- (void)setVehicleEventPendingDeletion:(BOOL)a3
{
  self->_vehicleEventPendingDeletion = a3;
}

- (BOOL)locationsOfInterestAvailable
{
  return self->_locationsOfInterestAvailable;
}

- (void)setLocationsOfInterestAvailable:(BOOL)a3
{
  self->_locationsOfInterestAvailable = a3;
}

- (NSMutableArray)locationsCache
{
  return self->_locationsCache;
}

- (void)setLocationsCache:(id)a3
{
}

- (NSMutableArray)locationsCacheLeeched
{
  return self->_locationsCacheLeeched;
}

- (void)setLocationsCacheLeeched:(id)a3
{
}

- (RTFMCScoreBoard)scoreBoard
{
  return self->_scoreBoard;
}

- (void)setScoreBoard:(id)a3
{
}

- (RTFMCScoreBoard)scoreBoardForUnusualLocation
{
  return self->_scoreBoardForUnusualLocation;
}

- (void)setScoreBoardForUnusualLocation:(id)a3
{
}

- (RTFMCScoreBoard)scoreBoardForUsualLocation
{
  return self->_scoreBoardForUsualLocation;
}

- (void)setScoreBoardForUsualLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreBoardForUsualLocation, 0);
  objc_storeStrong((id *)&self->_scoreBoardForUnusualLocation, 0);
  objc_storeStrong((id *)&self->_scoreBoard, 0);
  objc_storeStrong((id *)&self->_locationsCacheLeeched, 0);
  objc_storeStrong((id *)&self->_locationsCache, 0);
  objc_storeStrong((id *)&self->_vehicleEventPendingPersist, 0);
  objc_storeStrong((id *)&self->_pendingVehicleParkedEvent, 0);
  objc_storeStrong((id *)&self->_lastVehicleParkedEvent, 0);
  objc_storeStrong((id *)&self->_lastCompanionSyncDate, 0);
  objc_storeStrong((id *)&self->_lastCompanionSyncRequestDate, 0);
  objc_storeStrong((id *)&self->_companionLink, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationHistoryController, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_finalizeLocationEstimateTimer, 0);
}

- (void)_recordMetricParkingEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(RTVehicleLocationProvider *)self scoreBoard];
  [v5 parkingEvent];

  LODWORD(v5) = [v4 usualLocation];
  if (v5) {
    [(RTVehicleLocationProvider *)self scoreBoardForUsualLocation];
  }
  else {
  id v6 = [(RTVehicleLocationProvider *)self scoreBoardForUnusualLocation];
  }
  [v6 parkingEvent];
}

- (void)_recordMetricAssistanceEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(RTVehicleLocationProvider *)self scoreBoard];
  [v5 assistanceEvent];

  LODWORD(v5) = [v4 usualLocation];
  if (v5) {
    [(RTVehicleLocationProvider *)self scoreBoardForUsualLocation];
  }
  else {
  id v6 = [(RTVehicleLocationProvider *)self scoreBoardForUnusualLocation];
  }
  [v6 assistanceEvent];
}

- (void)_recordMetricEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(RTVehicleLocationProvider *)self scoreBoard];
  [v5 engagementEvent];

  LODWORD(v5) = [v4 usualLocation];
  if (v5) {
    [(RTVehicleLocationProvider *)self scoreBoardForUsualLocation];
  }
  else {
  id v6 = [(RTVehicleLocationProvider *)self scoreBoardForUnusualLocation];
  }
  [v6 engagementEvent];
}

- (void)_recordMetricSuppressedEvent
{
  id v2 = [(RTVehicleLocationProvider *)self scoreBoard];
  [v2 suppressedEvent];
}

- (void)_submitFMCDailyAssessments
{
}

- (void)_submitFMCDailyAssessmentsWithSubmissionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTVehicleLocationProvider *)self metricManager];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke;
  v8[3] = &unk_1E6B95CB0;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v9 = v7;
  [v7 fetchDiagnosticsEnabled:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke(id *a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke_2;
    block[3] = &unk_1E6B92668;
    void block[4] = WeakRetained;
    id v7 = a1[5];
    id v6 = a1[4];
    dispatch_async(v4, block);
  }
}

void __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = +[RTMetricManager metricForType:3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [*(id *)(a1 + 32) scoreBoard];
  v18[0] = v3;
  id v4 = [*(id *)(a1 + 32) scoreBoardForUsualLocation];
  v18[1] = v4;
  id v5 = [*(id *)(a1 + 32) scoreBoardForUnusualLocation];
  v18[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = +[RTMetricManager metricForType:2];
        [v11 copyToMetric:v12];
        [v11 clearScoreBoard];
        [v2 addAssessment:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void *, void, void *))(v13 + 16))(v13, v2, 0, &__block_literal_global_46);
  }
  else {
    [*(id *)(a1 + 40) submitMetric:v2 withHandler:&__block_literal_global_46];
  }
}

- (void)_registerScoreBoardSubmission
{
  objc_initWeak(&location, self);
  id v3 = [(RTVehicleLocationProvider *)self metricManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke;
  v4[3] = &unk_1E6B95D00;
  objc_copyWeak(&v5, &location);
  [v3 registerQueriableMetric:3 withHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (!a3)
  {
    uint64_t v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v7);
    uint64_t v9 = [WeakRetained queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke_2;
    v10[3] = &unk_1E6B95CD8;
    objc_copyWeak(&v12, v7);
    id v11 = v6;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }
}

void __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _submitFMCDailyAssessmentsWithSubmissionHandler:*(void *)(a1 + 32)];
}

- (void)_submitFMCCarParkedInstanceWithParkedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(RTVehicleLocationProvider *)self metricManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke;
  v8[3] = &unk_1E6B95D50;
  void v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 fetchDiagnosticsEnabled:v8];
}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke(id *a1, int a2)
{
  if (a2)
  {
    id v3 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_2;
    block[3] = &unk_1E6B92F80;
    id v7 = a1[5];
    id v4 = a1[6];
    id v5 = a1[4];
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v3, block);
  }
}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_3;
  v5[3] = &unk_1E6B95D28;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTMetricManager metricForType:1];
  id v5 = [v3 location];
  [v5 horizontalUncertainty];
  [v4 setHorizontalAccuracy:(int)v6];

  unint64_t v7 = [v3 locationQuality];
  if (v7 >> 31)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[RTVehicleLocationProvider(RTMetricManager) _submitFMCCarParkedInstanceWithParkedEvents:]_block_invoke_3";
      __int16 v12 = 1024;
      int v13 = 1709;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "locationQuality cannot be greater than INT32_MAX (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  [v4 setQualityIndicator:v7];
  if ([v3 userSetLocation]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v4 setTriggerTypes:v9];
  [v4 setUserAssistanceRequired:0];
  [v4 setLocationType:[v3 usualLocation]];
  [*(id *)(a1 + 32) submitMetric:v4];
  [*(id *)(a1 + 40) _recordMetricParkingEvent:v3];
}

- (void)_submitFMCViewedInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4
{
  double v6 = [(RTVehicleLocationProvider *)self metricManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke;
  v8[3] = &unk_1E6B95DA0;
  int v10 = a4;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 fetchDiagnosticsEnabled:v8];
}

void __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke_2;
    v4[3] = &unk_1E6B95D78;
    int v6 = *(_DWORD *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

void __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke_2(uint64_t a1)
{
  id v2 = +[RTMetricManager metricForType:6];
  [v2 setUiPlacement:*(unsigned int *)(a1 + 40)];
  [*(id *)(a1 + 32) submitMetric:v2];
}

- (void)_submitFMCAssistanceInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4 assistanceType:(int)a5 assistanceValue:(int)a6
{
  int v10 = [(RTVehicleLocationProvider *)self metricManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke;
  v12[3] = &unk_1E6B95DF0;
  int v14 = a4;
  int v15 = a5;
  int v16 = a6;
  void v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [v11 fetchDiagnosticsEnabled:v12];
}

void __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke_2;
    v6[3] = &unk_1E6B95DC8;
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = *(_DWORD *)(a1 + 56);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(v3, v6);
  }
}

void __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke_2(uint64_t a1)
{
  id v5 = +[RTMetricManager metricForType:0];
  [v5 setUiPlacement:*(unsigned int *)(a1 + 48)];
  [v5 setAssistanceType:*(unsigned int *)(a1 + 52)];
  [v5 setAssistanceValue:*(unsigned int *)(a1 + 56)];
  [*(id *)(a1 + 32) submitMetric:v5];
  int v2 = *(_DWORD *)(a1 + 52);
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 lastVehicleParkedEvent];
  if (v2 == 5) {
    [v3 _recordMetricEngagementEvent:v4];
  }
  else {
    [v3 _recordMetricAssistanceEvent:v4];
  }
}

- (void)_submitFMCReturnToCarInstanceWithIdentifier:(id)a3 horizontalAccuracy:(int)a4 horizontalDistance:(int)a5
{
  uint64_t v8 = [(RTVehicleLocationProvider *)self metricManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke;
  v10[3] = &unk_1E6B95E18;
  int v12 = a4;
  int v13 = a5;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v9 fetchDiagnosticsEnabled:v10];
}

void __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke_2;
    v4[3] = &unk_1E6B91248;
    uint64_t v6 = *(void *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

void __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke_2(uint64_t a1)
{
  id v2 = +[RTMetricManager metricForType:4];
  [v2 setHorizontalAccuracy:*(unsigned int *)(a1 + 40)];
  [v2 setHorizontalDistance:*(unsigned int *)(a1 + 44)];
  [*(id *)(a1 + 32) submitMetric:v2];
}

- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3
{
  id v3 = self;
  if (a3 != 3)
  {
    double v7 = 0.0;
    goto LABEL_9;
  }
  id v4 = [(RTVehicleLocationProvider *)self lastVehicleParkedEvent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [(RTVehicleLocationProvider *)v3 lastVehicleParkedEvent];
  }
  else
  {
    uint64_t v8 = [(RTVehicleLocationProvider *)v3 pendingVehicleParkedEvent];

    if (!v8)
    {
      double v12 = -1.0;
      goto LABEL_8;
    }
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [(RTVehicleLocationProvider *)v3 pendingVehicleParkedEvent];
  }
  id v9 = v6;
  int v10 = [v6 date];
  [v5 timeIntervalSinceDate:v10];
  double v12 = v11;

LABEL_8:
  self = v3;
  *(void *)&a3 = 3;
  double v7 = v12;
LABEL_9:

  [(RTVehicleLocationProvider *)self _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:*(void *)&a3 value:v7];
}

- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3 value:(double)a4
{
  double v7 = [(RTVehicleLocationProvider *)self metricManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke;
  v9[3] = &unk_1E6B95DF0;
  int v12 = a3;
  double v11 = a4;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v8 fetchDiagnosticsEnabled:v9];
}

void __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke_2;
    block[3] = &unk_1E6B95E40;
    int v7 = *(_DWORD *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, block);
  }
}

void __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke_2(uint64_t a1)
{
  id v4 = +[RTMetricManager metricForType:5];
  [v4 setEventType:*(unsigned int *)(a1 + 48)];
  double v2 = *(double *)(a1 + 40);
  if (v2 < 0.0) {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v3 = (10 * (int)(v2 * 10.0));
  }
  [v4 setValue:v3];
  [*(id *)(a1 + 32) submitMetric:v4];
}

@end