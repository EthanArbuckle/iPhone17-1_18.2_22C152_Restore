@interface SAMonitoringSessionManager
+ (id)convertSAMonitoringSessionStateToString:(unint64_t)a3;
- (BOOL)_isOnlyMonitoringCompanionDevice;
- (BOOL)_isOnlyMonitoringDisconnectedCompanionDevice;
- (BOOL)addTravelFenceForDevice:(id)a3;
- (BOOL)allDevicesInSafeLocation;
- (BOOL)anyDeviceInUnsafeLocation;
- (BOOL)caIsVehicularBTHintOn;
- (BOOL)checkIfAlertWasTriggeredAtHome:(id)a3 isEarlyVehicularTrigger:(BOOL)a4;
- (BOOL)checkIfCloseToAnySafeLocations:(id)a3 leftBehindLocation:(id)a4;
- (BOOL)deviceShouldTransitionWithLastScenarioChangeDate:(id)a3 lastWithYouDate:(id)a4;
- (BOOL)enabled;
- (BOOL)enoughTimeHasPassedBeforeSurfacingAlert:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5;
- (BOOL)isAnyInTrackedInUnsafeLocation;
- (BOOL)isAnyTrackedWhileTraveling;
- (BOOL)isCompanionConnected;
- (BOOL)isInAirplaneMode;
- (BOOL)isWithinCurrentVisitOrLOI:(id)a3;
- (BOOL)monitoringSessionState:(unint64_t)a3 matchesWithScenarioClass:(unint64_t)a4;
- (BOOL)needPeriodicScan;
- (BOOL)requestedPeriodicScan;
- (BOOL)shouldIssueBookendedNotificationBasedOnLocationForDevice:(id)a3;
- (BOOL)shouldIssueBookendedNotificationBasedOnTimeForDevice:(id)a3;
- (BOOL)shouldIssueBookendedNotificationForDevice:(id)a3;
- (BOOL)shouldSuppressDueToRepeatedAlertsInOneTravelingSession:(id)a3 context:(id)a4;
- (BOOL)standby;
- (NSDate)timeOfAttemptToLoadFromPersistence;
- (NSHashTable)clients;
- (NSMutableDictionary)caLastAlertDate;
- (NSMutableDictionary)deviceUUIDtoAlertContext;
- (NSMutableDictionary)deviceUUIDtoMonitoringSession;
- (NSMutableDictionary)deviceUUIDtoSafeLocationUUIDs;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)safeLocations;
- (NSMutableSet)devicesWithPendingTransition;
- (NSMutableSet)devicesWithToBePopulatedTrackedTravelingStartLocation;
- (NSUUID)nextScheduledAlarmForPersistenceWrite;
- (NSUUID)scheduledAlarmForForceUpdateWithYouStatus;
- (SAAnalyticsServiceProtocol)analytics;
- (SAAudioAccessory)audioAccessoryManager;
- (SADeviceRecord)deviceRecord;
- (SAFenceManagerServiceProtocol)fenceManager;
- (SAGeoFenceRequestProtocol)fenceRequestServicer;
- (SAMonitoringSessionManager)initWithWithYouDetector:(id)a3 fenceRequestServicer:(id)a4 fenceManager:(id)a5 travelTypeClassifier:(id)a6 clock:(id)a7 deviceRecord:(id)a8 analytics:(id)a9 persistenceManager:(id)a10 audioAccessoryManager:(id)a11;
- (SAPersistenceManager)persistenceManager;
- (SATimeServiceProtocol)clock;
- (SATravelTypeClassifierServiceProtocol)travelTypeClassifier;
- (SAWithYouDetectorServiceProtocol)withYouDetector;
- (TAEventProtocol)currentVisitOrLOIEvent;
- (TAEventProtocol)previousVisitOrLOIEvent;
- (TALocationLite)lastLocation;
- (double)minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4;
- (double)timeDelayForRetryScanForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4;
- (id)computeRemovedSafeLocations:(id)a3;
- (id)createLocationFromCircularRegion:(id)a3 forDevice:(id)a4 withContext:(unint64_t)a5;
- (id)getLastScenarioChangeDateAmongAllDevices;
- (int64_t)caBroughtOutOnTravel;
- (int64_t)checkInEarStatus:(id)a3;
- (int64_t)determineTrackedTravelingCount;
- (int64_t)earlyVehicularTriggerForDeviceUUID:(id)a3;
- (unint64_t)caCurrentVehicularState;
- (unint64_t)disabledReasons;
- (unint64_t)getMoreSpecificSADeviceType:(id)a3;
- (unint64_t)scenarioClassForDeviceUUID:(id)a3;
- (unint64_t)stateForDeviceUUID:(id)a3;
- (void)addClient:(id)a3;
- (void)addDevice:(id)a3 isLastDeviceEvent:(BOOL)a4;
- (void)addDevicesIfNeededPerEvent:(id)a3;
- (void)addDisableReason:(unint64_t)a3;
- (void)alarmFiredForUUID:(id)a3;
- (void)attemptToPopulateTrackedTravelingStartLocationForDevice:(id)a3;
- (void)bootstrapMonitoringSessionRecord:(id)a3;
- (void)cancelMonitoringDevice:(id)a3;
- (void)changeMonitoringSessionState:(id)a3 toState:(unint64_t)a4;
- (void)checkForDevicesNeedingTransition;
- (void)checkReunion:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5;
- (void)configureBackgroundScanning;
- (void)createMonitoringDevice:(id)a3;
- (void)didChangeScenarioClassFrom:(unint64_t)a3 to:(unint64_t)a4 forDevice:(id)a5;
- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5;
- (void)didForceUpdateWithYouStatus;
- (void)forceStandbyMode:(id)a3;
- (void)handleGeofenceEvent:(id)a3;
- (void)handleGeofenceExitedForDeviceUUID:(id)a3;
- (void)handleSeparationForDeviceUUID:(id)a3 withSafeLocationRecommendation:(id)a4 context:(id)a5;
- (void)handleSystemStateChanged:(id)a3;
- (void)ingestTAEvent:(id)a3;
- (void)notifyEarlyLeftBehind:(id)a3;
- (void)notifyLeftBehind:(id)a3 withRegion:(id)a4 isEarlyVehicularTrigger:(BOOL)a5;
- (void)notifyWhenLeftBehind:(id)a3;
- (void)notifyWhileTraveling:(id)a3 isBookendingTravel:(BOOL)a4;
- (void)removeAndStopSafeLocationsForDeviceUUID:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeDeviceWithUUID:(id)a3 isLastDeviceEvent:(BOOL)a4;
- (void)removeDevicesIfNeededPerEvent:(id)a3;
- (void)removeDisableReason:(unint64_t)a3;
- (void)removeSafeLocation:(id)a3 forDeviceUUID:(id)a4;
- (void)removeSafeLocationsIfNeededPerNewSet:(id)a3 forDevice:(id)a4;
- (void)removeTravelFenceForDevice:(id)a3;
- (void)requestToFetchLastVisit;
- (void)requestToStartBackgroundScanning;
- (void)requestToStopBackgroundScanning;
- (void)scheduleNextForceUpdateWithYouStatusFromReferenceDate:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5;
- (void)scheduleNextPersistenceWrite;
- (void)setAnalytics:(id)a3;
- (void)setAudioAccessoryManager:(id)a3;
- (void)setCaBroughtOutOnTravel:(int64_t)a3;
- (void)setCaCurrentVehicularState:(unint64_t)a3;
- (void)setCaIsVehicularBTHintOn:(BOOL)a3;
- (void)setCaLastAlertDate:(id)a3;
- (void)setClients:(id)a3;
- (void)setClock:(id)a3;
- (void)setCurrentVisitOrLOIEvent:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setDeviceUUIDtoAlertContext:(id)a3;
- (void)setDeviceUUIDtoMonitoringSession:(id)a3;
- (void)setDeviceUUIDtoSafeLocationUUIDs:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDevicesWithPendingTransition:(id)a3;
- (void)setDevicesWithToBePopulatedTrackedTravelingStartLocation:(id)a3;
- (void)setDisabledReasons:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFenceManager:(id)a3;
- (void)setFenceRequestServicer:(id)a3;
- (void)setIsCompanionConnected:(BOOL)a3;
- (void)setIsInAirplaneMode:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setNextScheduledAlarmForPersistenceWrite:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPreviousVisitOrLOIEvent:(id)a3;
- (void)setRequestedPeriodicScan:(BOOL)a3;
- (void)setSafeLocations:(id)a3;
- (void)setSafeLocations:(id)a3 forDeviceUUID:(id)a4;
- (void)setScheduledAlarmForForceUpdateWithYouStatus:(id)a3;
- (void)setTimeOfAttemptToLoadFromPersistence:(id)a3;
- (void)setTravelTypeClassifier:(id)a3;
- (void)setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded;
- (void)setWithYouDetector:(id)a3;
- (void)startPeriodicScans;
- (void)startPeriodicScansIfNeeded;
- (void)startSafeLocation:(id)a3 forDevice:(id)a4;
- (void)stopPeriodicScans;
- (void)stopPeriodicScansIfNotNeeded;
- (void)stopSafeLocation:(id)a3 forDevice:(id)a4;
- (void)storeSeparationLocation:(id)a3;
- (void)updateDevicesWithSafeLocations:(id)a3;
- (void)updateLocation:(id)a3;
- (void)updateSafeLocations:(id)a3;
- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5;
@end

@implementation SAMonitoringSessionManager

- (void)ingestTAEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SAMonitoringSessionManager *)self updateDevicesWithSafeLocations:v4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SAMonitoringSessionManager *)self updateSafeLocations:v4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SAMonitoringSessionManager *)self updateLocation:v4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SAMonitoringSessionManager *)self handleGeofenceEvent:v4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SAMonitoringSessionManager *)self analytics];
    [v5 horizontalAccuracy];
    [v6 addVisit:1 withRadius:(unint64_t)v7];

    [(SAMonitoringSessionManager *)self setCurrentVisitOrLOIEvent:v5];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) scenarioClassifier];
          [v14 ingestTAEvent:v5];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![v5 hasArrivalDate]) {
      goto LABEL_18;
    }
    if ([v5 hasDepartureDate])
    {
      [(SAMonitoringSessionManager *)self setCurrentVisitOrLOIEvent:0];
      [(SAMonitoringSessionManager *)self setPreviousVisitOrLOIEvent:v5];
      goto LABEL_18;
    }
    v15 = [(SAMonitoringSessionManager *)self analytics];
    [v5 horizontalAccuracy];
    [v15 addVisit:0 withRadius:(unint64_t)v16];

    [(SAMonitoringSessionManager *)self setCurrentVisitOrLOIEvent:v5];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    v9 = [v17 allValues];

    uint64_t v18 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v9);
          }
          v22 = [*(id *)(*((void *)&v23 + 1) + 8 * j) scenarioClassifier];
          [v22 ingestTAEvent:v5];
        }
        uint64_t v19 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SAMonitoringSessionManager *)self handleSystemStateChanged:v4];
  }
LABEL_19:
}

- (void)updateLocation:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lastLocation = &self->_lastLocation;
  lastLocation = self->_lastLocation;
  if (lastLocation)
  {
    v8 = [(TALocationLite *)lastLocation getDate];
    v9 = [v5 getDate];
    BOOL v10 = [v8 compare:v9] != 0;

    if (!v5) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v10 = 1;
    if (!v5) {
      goto LABEL_22;
    }
  }
  [v5 horizontalAccuracy];
  if (!v10 || v11 >= 70.0)
  {
LABEL_22:
    v32 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = *p_lastLocation;
      v34 = v32;
      v35 = [(TALocationLite *)v33 description];
      v36 = [v5 description];
      uint64_t buf = 68289539;
      __int16 v44 = 2082;
      v45 = "";
      __int16 v46 = 2113;
      uint64_t v47 = (uint64_t)v35;
      __int16 v48 = 2113;
      v49 = v36;
      _os_log_impl(&dword_1D15FC000, v34, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation update criteria not satisfied\", \"lastLocation\":\"%{private}@\", \"newLocation\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);
    }
    goto LABEL_24;
  }
  objc_storeStrong((id *)&self->_lastLocation, a3);
  uint64_t v12 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v13 = *p_lastLocation;
    v14 = v12;
    v15 = [(TALocationLite *)v13 description];
    uint64_t buf = 68289283;
    __int16 v44 = 2082;
    v45 = "";
    __int16 v46 = 2113;
    uint64_t v47 = (uint64_t)v15;
    _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation updated\", \"lastLocation\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  double v16 = [(SAMonitoringSessionManager *)self devicesWithToBePopulatedTrackedTravelingStartLocation];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    uint64_t v18 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289283;
      __int16 v44 = 2082;
      v45 = "";
      __int16 v46 = 2049;
      uint64_t v47 = v17;
      _os_log_impl(&dword_1D15FC000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation populating tracked traveling start location\", \"device count\":%{private}lu}", (uint8_t *)&buf, 0x1Cu);
    }
    uint64_t v19 = [(SAMonitoringSessionManager *)self devicesWithToBePopulatedTrackedTravelingStartLocation];
    uint64_t v20 = [v19 allObjects];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v22)
    {
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v39;
      *(void *)&long long v23 = 68289283;
      long long v37 = v23;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v21);
          }
          long long v27 = *(void **)(*((void *)&v38 + 1) + 8 * v26);
          long long v28 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t buf = v37;
            __int16 v44 = 2082;
            v45 = "";
            __int16 v46 = 2113;
            uint64_t v47 = (uint64_t)v27;
            _os_log_impl(&dword_1D15FC000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updateLocation populating tracked traveling start location\", \"device\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
          }
          long long v29 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
          long long v30 = [v29 objectForKeyedSubscript:v27];
          [v30 setTrackedTravelingStartLocation:v5];

          v31 = [(SAMonitoringSessionManager *)self devicesWithToBePopulatedTrackedTravelingStartLocation];
          [v31 removeObject:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }
  }
LABEL_24:
}

- (NSMutableSet)devicesWithToBePopulatedTrackedTravelingStartLocation
{
  return self->_devicesWithToBePopulatedTrackedTravelingStartLocation;
}

- (SAMonitoringSessionManager)initWithWithYouDetector:(id)a3 fenceRequestServicer:(id)a4 fenceManager:(id)a5 travelTypeClassifier:(id)a6 clock:(id)a7 deviceRecord:(id)a8 analytics:(id)a9 persistenceManager:(id)a10 audioAccessoryManager:(id)a11
{
  id v53 = a3;
  id v52 = a4;
  id v51 = a5;
  id v48 = a6;
  id v50 = a7;
  id v49 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  v54.receiver = self;
  v54.super_class = (Class)SAMonitoringSessionManager;
  uint64_t v18 = [(SAMonitoringSessionManager *)&v54 init];
  uint64_t v19 = v18;
  if (!v18) {
    goto LABEL_8;
  }
  uint64_t v20 = 0;
  if (v53 && v52 && v51 && v50 && v49)
  {
    *(_WORD *)&v18->_enabled = 0;
    objc_storeStrong((id *)&v18->_clock, a7);
    objc_storeStrong((id *)&v19->_analytics, a9);
    objc_storeStrong((id *)&v19->_withYouDetector, a3);
    id v21 = [(SAMonitoringSessionManager *)v19 withYouDetector];
    [v21 addClient:v19];

    objc_storeStrong((id *)&v19->_deviceRecord, a8);
    objc_storeStrong((id *)&v19->_fenceManager, a5);
    objc_storeStrong((id *)&v19->_fenceRequestServicer, a4);
    objc_storeStrong((id *)&v19->_travelTypeClassifier, a6);
    uint64_t v22 = [(SAMonitoringSessionManager *)v19 travelTypeClassifier];
    [v22 addClient:v19];

    uint64_t v23 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v19->_clients;
    v19->_clients = (NSHashTable *)v23;

    objc_storeStrong((id *)&v19->_persistenceManager, a10);
    objc_storeStrong((id *)&v19->_audioAccessoryManager, a11);
    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    devices = v19->_devices;
    v19->_devices = v25;

    long long v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    safeLocations = v19->_safeLocations;
    v19->_safeLocations = v27;

    long long v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDtoSafeLocationUUIDs = v19->_deviceUUIDtoSafeLocationUUIDs;
    v19->_deviceUUIDtoSafeLocationUUIDs = v29;

    v19->_requestedPeriodicScan = 0;
    timeOfAttemptToLoadFromPersistence = v19->_timeOfAttemptToLoadFromPersistence;
    v19->_timeOfAttemptToLoadFromPersistence = 0;

    [(SAMonitoringSessionManager *)v19 addDisableReason:64];
    [(SAMonitoringSessionManager *)v19 addDisableReason:128];
    [(SAMonitoringSessionManager *)v19 addDisableReason:1];
    [(SAMonitoringSessionManager *)v19 addDisableReason:2];
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    caLastAlertDate = v19->_caLastAlertDate;
    v19->_caLastAlertDate = v32;

    v19->_caBroughtOutOnTravel = -1;
    v19->_caCurrentVehicularState = 0;
    v19->_caIsVehicularBTHintOn = 0;
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDtoAlertContext = v19->_deviceUUIDtoAlertContext;
    v19->_deviceUUIDtoAlertContext = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDtoMonitoringSession = v19->_deviceUUIDtoMonitoringSession;
    v19->_deviceUUIDtoMonitoringSession = v36;

    nextScheduledAlarmForPersistenceWrite = v19->_nextScheduledAlarmForPersistenceWrite;
    v19->_nextScheduledAlarmForPersistenceWrite = 0;

    currentVisitOrLOIEvent = v19->_currentVisitOrLOIEvent;
    v19->_currentVisitOrLOIEvent = 0;

    v19->_isCompanionConnected = 0;
    long long v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    devicesWithToBePopulatedTrackedTravelingStartLocation = v19->_devicesWithToBePopulatedTrackedTravelingStartLocation;
    v19->_devicesWithToBePopulatedTrackedTravelingStartLocation = v40;

    v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    devicesWithPendingTransition = v19->_devicesWithPendingTransition;
    v19->_devicesWithPendingTransition = v42;

LABEL_8:
    uint64_t v20 = v19;
  }

  return v20;
}

- (void)requestToStartBackgroundScanning
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_clients;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "startBackgroundScanning", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)requestToStopBackgroundScanning
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_clients;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "stopBackgroundScanning", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)requestToFetchLastVisit
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_clients;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "fetchLastVisit", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)configureBackgroundScanning
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SAMonitoringSessionManager *)self enabled];
  uint64_t v4 = TASALog;
  BOOL v5 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      long long v9 = "";
      _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager request to start scanning\"}", (uint8_t *)&v6, 0x12u);
    }
    [(SAMonitoringSessionManager *)self requestToStartBackgroundScanning];
  }
  else
  {
    if (v5)
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      long long v9 = "";
      _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager request to stop scanning\"}", (uint8_t *)&v6, 0x12u);
    }
    [(SAMonitoringSessionManager *)self requestToStopBackgroundScanning];
  }
}

- (void)bootstrapMonitoringSessionRecord:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v32;
    long long v9 = (os_log_t *)&TASALog;
    *(void *)&long long v6 = 68289795;
    long long v29 = v6;
    id v30 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, v29);
        uint64_t v13 = [(SAMonitoringSessionManager *)self fenceManager];
        v14 = [v12 scenarioClassifier];
        [v13 addClient:v14];

        v15 = [(SAMonitoringSessionManager *)self travelTypeClassifier];
        double v16 = [v12 scenarioClassifier];
        [v15 addClient:v16];

        uint64_t v17 = [v12 scenarioClassifier];
        [v17 addClient:self];

        uint64_t v18 = [(SAMonitoringSessionManager *)self fenceManager];
        uint64_t v19 = [v12 scenarioClassifier];
        [v19 setDelegate:v18];

        uint64_t v20 = [(SAMonitoringSessionManager *)self clock];
        id v21 = [v12 scenarioClassifier];
        [v21 setTimeDelegate:v20];

        [(SAMonitoringSessionManager *)self attemptToPopulateTrackedTravelingStartLocationForDevice:v11];
        os_log_t v22 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = v22;
          uint64_t v24 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", [v12 state]);
          uint64_t v25 = v7;
          uint64_t v26 = v8;
          long long v27 = v9;
          long long v28 = +[SAScenarioClassifier convertSAScenarioClassToString:](SAScenarioClassifier, "convertSAScenarioClassToString:", [v12 scenario]);
          *(_DWORD *)uint64_t buf = v29;
          int v36 = 0;
          __int16 v37 = 2082;
          long long v38 = "";
          __int16 v39 = 2113;
          uint64_t v40 = v11;
          __int16 v41 = 2113;
          v42 = v24;
          __int16 v43 = 2113;
          __int16 v44 = v28;
          _os_log_impl(&dword_1D15FC000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager bootstraped from persisted data\", \"uuid\":\"%{private}@\", \"state\":\"%{private}@\", \"scenario\":\"%{private}@\"}", buf, 0x30u);

          long long v9 = v27;
          uint64_t v8 = v26;
          uint64_t v7 = v25;
          id v4 = v30;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v7);
  }
  [(SAMonitoringSessionManager *)self startPeriodicScansIfNeeded];
}

- (BOOL)monitoringSessionState:(unint64_t)a3 matchesWithScenarioClass:(unint64_t)a4
{
  if (a3 - 3 < 2) {
    return a4 == 3;
  }
  if (a3 != 5)
  {
    if (a3 != 1) {
      return 1;
    }
    return a4 == 3;
  }
  return a4 == 2;
}

- (void)checkForDevicesNeedingTransition
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v5 = [v4 allKeys];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v11 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        uint64_t v13 = [v12 scenario];

        v14 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        v15 = [v14 objectForKeyedSubscript:v10];
        uint64_t v16 = [v15 state];

        if (!-[SAMonitoringSessionManager monitoringSessionState:matchesWithScenarioClass:](self, "monitoringSessionState:matchesWithScenarioClass:", v16, v13))[v3 addObject:v10]; {
        ++v9;
        }
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v7);
  }

  uint64_t v17 = [v3 count];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v30 = 2049;
      uint64_t v31 = v18;
      _os_log_impl(&dword_1D15FC000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long scan on enable with devices needing transition\", \"count of devices needing transition\":%{private}ld}", buf, 0x1Cu);
    }
    uint64_t v20 = [(SAMonitoringSessionManager *)self withYouDetector];
    [v20 forceUpdateWithYouStatusToFindDevices:v3 withContext:10];
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    uint64_t v5 = TASALog;
    BOOL v6 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        uint64_t buf = 68289026;
        __int16 v44 = 2082;
        id v45 = "";
        _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager enabling sa\"}", (uint8_t *)&buf, 0x12u);
      }
      uint64_t v7 = [(SAMonitoringSessionManager *)self withYouDetector];
      [v7 resetAllWithYouStatusAndScanStates];

      [(SAMonitoringSessionManager *)self configureBackgroundScanning];
      [(SAMonitoringSessionManager *)self requestToFetchLastVisit];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v8 = [(SAMonitoringSessionManager *)self devices];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            [(SAMonitoringSessionManager *)self createMonitoringDevice:v13];
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v14 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
            v15 = [v14 objectForKeyedSubscript:v13];

            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v33;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v33 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  [(SAMonitoringSessionManager *)self startSafeLocation:*(void *)(*((void *)&v32 + 1) + 8 * j) forDevice:v13];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
              }
              while (v17);
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v10);
      }

      [(SAMonitoringSessionManager *)self startPeriodicScansIfNeeded];
      [(SAMonitoringSessionManager *)self checkForDevicesNeedingTransition];
    }
    else
    {
      if (v6)
      {
        uint64_t buf = 68289026;
        __int16 v44 = 2082;
        id v45 = "";
        _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager disabling sa\"}", (uint8_t *)&buf, 0x12u);
      }
      [(SAMonitoringSessionManager *)self stopPeriodicScans];
      uint64_t v20 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      id v21 = [v20 allKeys];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v29;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v29 != v25) {
              objc_enumerationMutation(v22);
            }
            -[SAMonitoringSessionManager cancelMonitoringDevice:](self, "cancelMonitoringDevice:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v24);
      }

      [(SAMonitoringSessionManager *)self setCurrentVisitOrLOIEvent:0];
      [(SAMonitoringSessionManager *)self configureBackgroundScanning];
      int v27 = [(SAMonitoringSessionManager *)self withYouDetector];
      [v27 resetAllWithYouStatusAndScanStates];
    }
  }
}

- (void)forceStandbyMode:(id)a3
{
  id v11 = a3;
  id v4 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v5 = [v4 objectForKeyedSubscript:v11];

  if (v5)
  {
    [v5 setEarlyVehicularTrigger:0];
    [v5 setEarlyAirplaneTrigger:0];
    BOOL v6 = [v5 geofence];

    if (v6)
    {
      uint64_t v7 = [(SAMonitoringSessionManager *)self fenceRequestServicer];
      uint64_t v8 = [v5 geofence];
      [v7 removeGeofence:v8];

      uint64_t v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      uint64_t v10 = [v9 objectForKeyedSubscript:v11];
      [v10 setGeofence:0];

      [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v11 toState:2];
    }
  }
}

- (BOOL)allDevicesInSafeLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        uint64_t v11 = [v10 scenario];

        if (v11 != 1)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)anyDeviceInUnsafeLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        uint64_t v11 = [v10 scenario];

        if (v11 == 2)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)createMonitoringDevice:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v31 = 0;
    __int16 v32 = 2082;
    long long v33 = "";
    uint64_t v9 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice nil UUID\"}";
LABEL_10:
    _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_22;
  }
  if (![(SAMonitoringSessionManager *)self enabled])
  {
    uint64_t v8 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v31 = 0;
    __int16 v32 = 2082;
    long long v33 = "";
    uint64_t v9 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice while not enabled\"}";
    goto LABEL_10;
  }
  uint64_t v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = TASALog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v31 = 0;
      __int16 v32 = 2082;
      long long v33 = "";
      __int16 v34 = 2113;
      id v35 = v4;
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice monitoring session already exists\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v31 = 0;
      __int16 v32 = 2082;
      long long v33 = "";
      __int16 v34 = 2113;
      id v35 = v4;
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager createMonitoringDevice\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    uint64_t v10 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
    if (v10) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 3;
    }

    BOOL v12 = [[SAMonitoringSession alloc] initWithDeviceUUID:v4 state:0 geofence:0 scenario:v11 trackedTravelingStartDate:0];
    uint64_t v13 = [(SAMonitoringSessionManager *)self fenceManager];
    long long v14 = [(SAMonitoringSession *)v12 scenarioClassifier];
    [v13 addClient:v14];

    long long v15 = [(SAMonitoringSessionManager *)self travelTypeClassifier];
    long long v16 = [(SAMonitoringSession *)v12 scenarioClassifier];
    [v15 addClient:v16];

    long long v17 = [(SAMonitoringSession *)v12 scenarioClassifier];
    [v17 addClient:self];

    uint64_t v18 = [(SAMonitoringSessionManager *)self fenceManager];
    uint64_t v19 = [(SAMonitoringSession *)v12 scenarioClassifier];
    [v19 setDelegate:v18];

    uint64_t v20 = [(SAMonitoringSessionManager *)self clock];
    id v21 = [(SAMonitoringSession *)v12 scenarioClassifier];
    [v21 setTimeDelegate:v20];

    id v22 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    [v22 setObject:v12 forKeyedSubscript:v4];

    [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v4 toState:2];
    [(SAMonitoringSessionManager *)self didChangeScenarioClassFrom:0 to:v11 forDevice:v4];
    uint64_t v23 = [(SAMonitoringSession *)v12 scenarioClassifier];
    uint64_t v24 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
    [v23 ingestTAEvent:v24];

    LOBYTE(v24) = [(SAMonitoringSessionManager *)self standby];
    uint64_t v25 = [(SAMonitoringSessionManager *)self withYouDetector];
    uint64_t v26 = v25;
    if (v24)
    {
      [v25 forceUpdateWithYouStatusWithShortScan:0];
    }
    else
    {
      id v29 = v4;
      int v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      [v26 forceUpdateWithYouStatusToFindDevices:v27 withContext:5];
    }
  }
  if (![(SAMonitoringSessionManager *)self standby])
  {
    long long v28 = [(SAMonitoringSessionManager *)self analytics];
    [v28 setActiveState:1];
  }
LABEL_22:
}

- (void)cancelMonitoringDevice:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v27 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t buf = 68289026;
    __int16 v38 = 2082;
    long long v39 = "";
    long long v28 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager cancelMonitoringDevice nil UUID\"}";
    id v29 = v27;
    uint32_t v30 = 18;
LABEL_20:
    _os_log_impl(&dword_1D15FC000, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v30);
    goto LABEL_21;
  }
  [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v4 toState:6];
  uint64_t v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v31 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t buf = 68289283;
    __int16 v38 = 2082;
    long long v39 = "";
    __int16 v40 = 2113;
    id v41 = v4;
    long long v28 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager cancelMonitoringDevice monitoring session does not exist\","
          " \"uuid\":\"%{private}@\"}";
    id v29 = v31;
    uint32_t v30 = 28;
    goto LABEL_20;
  }
  uint64_t v7 = [v6 geofence];

  if (v7)
  {
    uint64_t v8 = [(SAMonitoringSessionManager *)self fenceRequestServicer];
    uint64_t v9 = [v6 geofence];
    [v8 removeGeofence:v9];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  uint64_t v11 = [v10 objectForKeyedSubscript:v4];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        [(SAMonitoringSessionManager *)self stopSafeLocation:*(void *)(*((void *)&v32 + 1) + 8 * i) forDevice:v4];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }

  long long v16 = [(SAMonitoringSessionManager *)self fenceManager];
  long long v17 = [v6 scenarioClassifier];
  [v16 removeClient:v17];

  uint64_t v18 = [(SAMonitoringSessionManager *)self travelTypeClassifier];
  uint64_t v19 = [v6 scenarioClassifier];
  [v18 removeClient:v19];

  uint64_t v20 = [v6 scenarioClassifier];
  [v20 removeClient:self];

  [v6 setScenarioClassifier:0];
  [v6 setDeviceUUID:0];

  id v21 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  [v21 setObject:0 forKeyedSubscript:v4];

  id v22 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  [v22 removeObjectForKey:v4];

  uint64_t v23 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289283;
    __int16 v38 = 2082;
    long long v39 = "";
    __int16 v40 = 2113;
    id v41 = v4;
    _os_log_impl(&dword_1D15FC000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager canceled monitoring session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  uint64_t v24 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    uint64_t v26 = [(SAMonitoringSessionManager *)self analytics];
    [v26 setActiveState:0];
  }
LABEL_21:
}

- (void)attemptToPopulateTrackedTravelingStartLocationForDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  unint64_t v7 = [v6 state];
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    uint64_t v10 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      uint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = v4;
      uint64_t v11 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice n"
            "ot in one of the traveling states\", \"uuid\":\"%{private}@\"}";
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = [v6 trackedTravelingStartLocation];

    if (v9)
    {
      uint64_t v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 68289283;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = v4;
        uint64_t v11 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice"
              " already set\", \"uuid\":\"%{private}@\"}";
LABEL_16:
        _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v20, 0x1Cu);
      }
    }
    else
    {
      uint64_t v12 = [(SAMonitoringSessionManager *)self lastLocation];
      uint64_t v13 = [v12 getDate];
      uint64_t v14 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      [v13 timeIntervalSinceDate:v14];
      double v16 = v15;

      double v17 = -v16;
      if (v16 >= 0.0) {
        double v17 = v16;
      }
      if (v17 <= 10.0)
      {
        uint64_t v19 = [(SAMonitoringSessionManager *)self lastLocation];
        [v6 setTrackedTravelingStartLocation:v19];
      }
      else
      {
        uint64_t v18 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 68289283;
          int v21 = 0;
          __int16 v22 = 2082;
          uint64_t v23 = "";
          __int16 v24 = 2113;
          id v25 = v4;
          _os_log_impl(&dword_1D15FC000, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager attemptToPopulateTrackedTravelingStartLocationForDevice lastLocation is not recent enough, adding to set to be populated\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v20, 0x1Cu);
        }
        uint64_t v19 = [(SAMonitoringSessionManager *)self devicesWithToBePopulatedTrackedTravelingStartLocation];
        [v19 addObject:v4];
      }
    }
  }
}

- (void)changeMonitoringSessionState:(id)a3 toState:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    uint64_t v9 = [v8 state];
    uint64_t v10 = (void *)TASALog;
    if (v9 == a4)
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v10;
        uint64_t v12 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", [v8 state]);
        uint64_t v13 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:a4];
        uint64_t buf = 68289795;
        __int16 v35 = 2082;
        uint64_t v36 = "";
        __int16 v37 = 2113;
        id v38 = v6;
        __int16 v39 = 2113;
        __int16 v40 = v12;
        __int16 v41 = 2113;
        uint64_t v42 = v13;
        _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState no state change necessary\", \"uuid\":\"%{private}@\", \"fromState\":\"%{private}@\", \"toState\":\"%{private}@\"}", (uint8_t *)&buf, 0x30u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = v10;
        double v16 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:](SAMonitoringSessionManager, "convertSAMonitoringSessionStateToString:", [v8 state]);
        double v17 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:a4];
        uint64_t buf = 68289795;
        __int16 v35 = 2082;
        uint64_t v36 = "";
        __int16 v37 = 2113;
        id v38 = v6;
        __int16 v39 = 2113;
        __int16 v40 = v16;
        __int16 v41 = 2113;
        uint64_t v42 = v17;
        _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState\", \"uuid\":\"%{private}@\", \"fromState\":\"%{private}@\", \"toState\":\"%{private}@\"}", (uint8_t *)&buf, 0x30u);
      }
      uint64_t v18 = [(SAMonitoringSessionManager *)self deviceRecord];
      [v18 updateMonitoringSessionState:a4 forDeviceWithUUID:v6];

      uint64_t v19 = [(SAMonitoringSessionManager *)self devicesWithPendingTransition];
      [v19 removeObject:v6];

      if (a4 - 5 < 2 || a4 == 2)
      {
        [v8 setTrackedTravelingStartDate:0];
        [v8 setTrackedTravelingStartLocation:0];
      }
      else if (a4 == 1 && [v8 state] != 3 && objc_msgSend(v8, "state") != 4)
      {
        int v20 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
        [v8 setTrackedTravelingStartDate:v20];
      }
      [v8 setState:a4];
      [(SAMonitoringSessionManager *)self attemptToPopulateTrackedTravelingStartLocationForDevice:v6];
      [v8 setEarlyVehicularTrigger:0];
      [v8 setEarlyAirplaneTrigger:0];
      int v21 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      [v8 setCaLastStateTransition:v21];

      unint64_t v28 = a4;
      if (a4 == 3) {
        [(SAMonitoringSessionManager *)self storeSeparationLocation:v6];
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      __int16 v22 = self->_clients;
      uint64_t v23 = [(NSHashTable *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v27, "updatedMonitoringState:forDeviceUUID:", objc_msgSend(v8, "state"), v6);
            }
          }
          uint64_t v24 = [(NSHashTable *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v24);
      }

      if (v28 <= 4 && ((1 << v28) & 0x1A) != 0) {
        [(SAMonitoringSessionManager *)self startPeriodicScans];
      }
      else {
        [(SAMonitoringSessionManager *)self stopPeriodicScansIfNotNeeded];
      }
      [(SAMonitoringSessionManager *)self scheduleNextPersistenceWrite];
    }
  }
  else
  {
    uint64_t v14 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289283;
      __int16 v35 = 2082;
      uint64_t v36 = "";
      __int16 v37 = 2113;
      id v38 = v6;
      _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager changeMonitoringSessionState UUID doesn't map to monitoring session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
  }
}

- (int64_t)determineTrackedTravelingCount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 state];

        if (v12 == 1) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)needPeriodicScan
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(SAMonitoringSessionManager *)self enabled] || [(SAMonitoringSessionManager *)self standby]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        unint64_t v12 = [v11 state];

        if (v12 <= 4 && ((1 << v12) & 0x1A) != 0)
        {
          BOOL v3 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v3 = 0;
    }
    while (v6);
  }
  else
  {
    BOOL v3 = 0;
  }
LABEL_18:

  return v3;
}

- (void)stopPeriodicScans
{
  if ([(SAMonitoringSessionManager *)self requestedPeriodicScan])
  {
    [(SAMonitoringSessionManager *)self setRequestedPeriodicScan:0];
    withYouDetector = self->_withYouDetector;
    [(SAWithYouDetectorServiceProtocol *)withYouDetector pausePeriodicScan];
  }
}

- (void)stopPeriodicScansIfNotNeeded
{
  if ([(SAMonitoringSessionManager *)self requestedPeriodicScan]
    && ![(SAMonitoringSessionManager *)self needPeriodicScan])
  {
    [(SAMonitoringSessionManager *)self stopPeriodicScans];
  }
}

- (void)startPeriodicScans
{
  if (![(SAMonitoringSessionManager *)self requestedPeriodicScan]
    && [(SAMonitoringSessionManager *)self enabled]
    && ![(SAMonitoringSessionManager *)self standby])
  {
    [(SAMonitoringSessionManager *)self setRequestedPeriodicScan:1];
    withYouDetector = self->_withYouDetector;
    [(SAWithYouDetectorServiceProtocol *)withYouDetector resumePeriodicScan];
  }
}

- (void)startPeriodicScansIfNeeded
{
  if (![(SAMonitoringSessionManager *)self requestedPeriodicScan]
    && [(SAMonitoringSessionManager *)self needPeriodicScan])
  {
    [(SAMonitoringSessionManager *)self startPeriodicScans];
  }
}

- (unint64_t)getMoreSpecificSADeviceType:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 deviceType];
  if ([v3 deviceType] == 1)
  {
    uint64_t v5 = [v3 model];
    char v6 = [v5 hasPrefix:@"iPhone"];

    if (v6)
    {
      unint64_t v4 = 64;
    }
    else
    {
      uint64_t v7 = [v3 model];
      char v8 = [v7 hasPrefix:@"iPad"];

      if (v8)
      {
        unint64_t v4 = 32;
      }
      else
      {
        uint64_t v9 = [v3 model];
        int v10 = [v9 hasPrefix:@"MacBook"];

        if (v10) {
          unint64_t v4 = 128;
        }
      }
    }
  }
  else if ([v3 deviceType] == 4)
  {
    if ([v3 isAppleAudioAccessory]) {
      unint64_t v4 = 256;
    }
    else {
      unint64_t v4 = 4;
    }
  }

  return v4;
}

- (int64_t)checkInEarStatus:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SAMonitoringSessionManager *)self audioAccessoryManager];

  if (v5)
  {
    if (v4)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [v6 setString:v4];
      if ([v6 length])
      {
        unint64_t v7 = 0;
        do
        {
          if (3 * (v7 / 3) + 2 == v7) {
            [v6 insertString:@":" atIndex:v7];
          }
          ++v7;
        }
        while ([v6 length] > v7);
      }
      char v8 = [(SAMonitoringSessionManager *)self audioAccessoryManager];
      [v8 setBTAddress:v6];

      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v9 = [(SAMonitoringSessionManager *)self audioAccessoryManager];
      [v9 getInEarStatus:&v19 secondary:&v18];

      int v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = "";
        __int16 v24 = 2113;
        uint64_t v25 = (uint64_t)v6;
        __int16 v26 = 2049;
        uint64_t v27 = v19;
        __int16 v28 = 2049;
        uint64_t v29 = v18;
        _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received in ear status\", \"macAddress\":\"%{private}@\", \"primary\":%{private}ld, \"secondary\":%{private}ld}", buf, 0x30u);
      }
      uint64_t v11 = [(SAMonitoringSessionManager *)self audioAccessoryManager];
      uint64_t v12 = [v11 getPrimaryBudSide];

      uint64_t v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289283;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = "";
        __int16 v24 = 2049;
        uint64_t v25 = v12;
        _os_log_impl(&dword_1D15FC000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa received primary bud side\", \"bud side\":%{private}ld}", buf, 0x1Cu);
      }
      if (v19 != 3 && v18 != 3)
      {
        int64_t v14 = 3;
LABEL_34:

        goto LABEL_35;
      }
      if (v12 == 1)
      {
        if (v19 == 3) {
          int64_t v14 = 1;
        }
        else {
          int64_t v14 = 2;
        }
        if (v19 != 3) {
          goto LABEL_34;
        }
      }
      else
      {
        if (v12) {
          goto LABEL_33;
        }
        if (v19 == 3) {
          int64_t v14 = 2;
        }
        else {
          int64_t v14 = 1;
        }
        if (v19 != 3) {
          goto LABEL_34;
        }
      }
      if (v18 != 3) {
        goto LABEL_34;
      }
LABEL_33:
      int64_t v14 = 0;
      goto LABEL_34;
    }
    long long v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      uint64_t v23 = "";
      long long v16 = "{\"msg%{public}.0s\":\"#sa check in ear status received unknown macAddress\"}";
      goto LABEL_19;
    }
  }
  else
  {
    long long v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      uint64_t v23 = "";
      long long v16 = "{\"msg%{public}.0s\":\"#sa check in ear status received unknown audioAccessoryManager\"}";
LABEL_19:
      _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
  }
  int64_t v14 = 0;
LABEL_35:

  return v14;
}

- (BOOL)checkIfCloseToAnySafeLocations:(id)a3 leftBehindLocation:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  unint64_t v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  char v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t buf = 68289283;
    __int16 v43 = 2082;
    __int16 v44 = "";
    __int16 v45 = 2113;
    id v46 = v6;
    _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager checking if close to any safe locations before surfacing the alert\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v34 = v6;
    uint64_t v12 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        long long v15 = [(SAMonitoringSessionManager *)self safeLocations];
        long long v16 = [v15 objectForKeyedSubscript:v14];

        if (v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          uint64_t v18 = [(SAMonitoringSessionManager *)self safeLocations];
          uint64_t v19 = [v18 objectForKeyedSubscript:v14];
          [v19 latitude];
          double v21 = v20;
          __int16 v22 = [(SAMonitoringSessionManager *)self safeLocations];
          uint64_t v23 = [v22 objectForKeyedSubscript:v14];
          [v23 longitude];
          uint64_t v25 = (void *)[v17 initWithLatitude:v21 longitude:v24];

          [v25 distanceFromLocation:v36];
          double v27 = v26;
          __int16 v28 = [(SAMonitoringSessionManager *)self safeLocations];
          uint64_t v29 = [v28 objectForKeyedSubscript:v14];
          [v29 radius];
          double v31 = v30;

          if (v31 < 100.0) {
            double v31 = 100.0;
          }

          if (v27 <= v31)
          {
            BOOL v32 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v32 = 0;
LABEL_16:
    id v6 = v34;
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)checkIfAlertWasTriggeredAtHome:(id)a3 isEarlyVehicularTrigger:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v24[0] = 68289539;
    v24[1] = 0;
    __int16 v25 = 2082;
    double v26 = "";
    __int16 v27 = 2113;
    id v28 = v6;
    __int16 v29 = 1025;
    BOOL v30 = v4;
    _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager checking if alert was triggered at home\", \"location\":\"%{private}@\", \"isEarlyVehicularTrigger\":%{private}d}", (uint8_t *)v24, 0x22u);
  }
  if (!v4)
  {
    uint64_t v11 = [(SAMonitoringSessionManager *)self previousVisitOrLOIEvent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [(SAMonitoringSessionManager *)self previousVisitOrLOIEvent];
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v13 = 0;
LABEL_14:
    BOOL v22 = 0;
    goto LABEL_15;
  }
  char v8 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v10 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
LABEL_8:
  uint64_t v13 = v10;
  if (!v10 || [v10 type] != 1) {
    goto LABEL_14;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v13 latitude];
  double v16 = v15;
  [v13 longitude];
  uint64_t v18 = (void *)[v14 initWithLatitude:v16 longitude:v17];
  [v6 distanceFromLocation:v18];
  double v20 = v19;
  [v18 horizontalAccuracy];
  if (v21 < 100.0) {
    double v21 = 100.0;
  }
  BOOL v22 = v20 <= v21;

LABEL_15:
  return v22;
}

- (BOOL)shouldSuppressDueToRepeatedAlertsInOneTravelingSession:(id)a3 context:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  char v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v7 objectForKeyedSubscript:&unk_1F27FBF60];
  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:&unk_1F27FBF60];
    int v12 = [v11 BOOLValue] ^ 1;
  }
  else
  {
    int v12 = 1;
  }

  uint64_t v13 = [v7 objectForKeyedSubscript:&unk_1F27FBF78];
  uint64_t v14 = [v13 integerValue];

  if (v14 != 2)
  {
LABEL_20:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  double v15 = [v9 lastAlertDateInCurrentTravelingSession];

  if (v15)
  {
    double v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2113;
      id v37 = v6;
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager suppressing alerts due to repeated alerts in one traveling session\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    BOOL v17 = 1;
    goto LABEL_21;
  }
  uint64_t v31 = v9;
  uint64_t v18 = [(SADeviceRecord *)self->_deviceRecord getRelatedDevices:v6];
  double v19 = v18;
  if (!v18 || ![v18 count])
  {
LABEL_15:
    char v9 = v31;
    if (v12)
    {
      __int16 v27 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289283;
        int v33 = 0;
        __int16 v34 = 2082;
        __int16 v35 = "";
        __int16 v36 = 2113;
        id v37 = v6;
        _os_log_impl(&dword_1D15FC000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager gating number of alerts in one traveling session \", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
      }
      id v28 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      [v31 setLastAlertDateInCurrentTravelingSession:v28];
    }
    goto LABEL_20;
  }
  uint64_t v20 = 0;
  while (1)
  {
    double v21 = [v19 objectAtIndexedSubscript:v20];
    BOOL v22 = [(NSMutableDictionary *)self->_deviceUUIDtoMonitoringSession objectForKeyedSubscript:v21];
    if (v22)
    {
      uint64_t v23 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      double v24 = [v22 lastAlertDateInCurrentTravelingSession];
      [v23 timeIntervalSinceDate:v24];
      double v26 = v25;

      if (v26 > 60.0) {
        break;
      }
    }

    if (++v20 >= (unint64_t)[v19 count]) {
      goto LABEL_15;
    }
  }
  BOOL v30 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v33 = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2113;
    id v37 = v6;
    __int16 v38 = 2113;
    long long v39 = v21;
    _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager suppressing alerts due to related device alert in current traveling session\", \"uuid\":\"%{private}@\", \"relatedDeviceUUID\":\"%{private}@\"}", buf, 0x26u);
  }

  BOOL v17 = 1;
  char v9 = v31;
LABEL_21:

  return v17;
}

- (void)handleSeparationForDeviceUUID:(id)a3 withSafeLocationRecommendation:(id)a4 context:(id)a5
{
  v216[16] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SAMonitoringSessionManager *)self devices];
  int v12 = [v11 objectForKeyedSubscript:v8];

  BOOL v191 = [(SAMonitoringSessionManager *)self checkIfCloseToAnySafeLocations:v8 leftBehindLocation:v9];
  BOOL v13 = [(SAMonitoringSessionManager *)self shouldSuppressDueToRepeatedAlertsInOneTravelingSession:v8 context:v10];
  if (v12)
  {
    BOOL v190 = v13;
    if (![v12 isAppleAudioAccessory])
    {
      unsigned int v189 = 0;
      unsigned int v187 = 0;
      goto LABEL_33;
    }
    uint64_t v14 = [v12 macAddress];
    int64_t v15 = [(SAMonitoringSessionManager *)self checkInEarStatus:v14];

    double v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v200 = 0;
      __int16 v201 = 2082;
      v202 = "";
      __int16 v203 = 2049;
      int64_t v204 = v15;
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager in ear status before notifying\", \"state\":%{private}ld}", buf, 0x1Cu);
    }
    switch(v15)
    {
      case 1:
        double v19 = [v12 name];
        char v20 = [v19 isEqualToString:@"left"];

        if (v20) {
          goto LABEL_16;
        }
        break;
      case 2:
        BOOL v22 = [v12 name];
        int v23 = [v22 isEqualToString:@"right"];

        if (v23) {
          goto LABEL_16;
        }
        break;
      case 3:
        BOOL v17 = [v12 name];
        if ([v17 isEqualToString:@"left"])
        {

LABEL_16:
          double v24 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            double v25 = v24;
            double v26 = [v12 identifier];
            __int16 v27 = [v26 UUIDString];
            *(_DWORD *)uint64_t buf = 68289283;
            int v200 = 0;
            __int16 v201 = 2082;
            v202 = "";
            __int16 v203 = 2113;
            int64_t v204 = (int64_t)v27;
            _os_log_impl(&dword_1D15FC000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for classically connected device\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
          }
          int v21 = 1;
LABEL_19:
          unint64_t v28 = [v12 productId] - 8212;
          unsigned int v187 = v21;
          if (v28 > 0x10 || ((1 << v28) & 0x10013) == 0)
          {
            unsigned int v189 = 0;
LABEL_33:
            unint64_t v184 = [(SAMonitoringSessionManager *)self getMoreSpecificSADeviceType:v12];
            __int16 v44 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
            __int16 v45 = [v44 objectForKeyedSubscript:v8];

            v188 = [v10 objectForKeyedSubscript:&unk_1F27FBF78];
            id v46 = [v45 caLastStateTransition];

            double v47 = -1.0;
            double v48 = -1.0;
            if (v46)
            {
              id v49 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
              id v50 = [v45 caLastStateTransition];
              [v49 timeIntervalSinceDate:v50];
              double v48 = v51;
            }
            id v52 = [(SAMonitoringSessionManager *)self caLastAlertDate];
            id v53 = [v52 objectForKeyedSubscript:v8];

            v178 = v45;
            if (v53)
            {
              objc_super v54 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
              v55 = [(SAMonitoringSessionManager *)self caLastAlertDate];
              v56 = [v55 objectForKeyedSubscript:v8];
              [v54 timeIntervalSinceDate:v56];
              double v47 = v57;

              __int16 v45 = v178;
            }
            if (v9)
            {
              [v9 horizontalAccuracy];
              int v59 = (int)v58;
              v60 = [v45 caSeparationLocation];

              if (v60)
              {
                v61 = [v45 caSeparationLocation];
                [v9 distanceFromLocation:v61];
                int v63 = (int)v62;

                unsigned int v169 = v63;
                int v64 = v63 - v59;
              }
              else
              {
                int v64 = -1;
                unsigned int v169 = -1;
              }
              unsigned int v167 = v64;
              v65 = [(SAMonitoringSessionManager *)self lastLocation];

              if (v65)
              {
                id v66 = objc_alloc(MEMORY[0x1E4F1E5F0]);
                v67 = [(SAMonitoringSessionManager *)self lastLocation];
                [v67 latitude];
                double v69 = v68;
                v70 = [(SAMonitoringSessionManager *)self lastLocation];
                [v70 longitude];
                v72 = (void *)[v66 initWithLatitude:v69 longitude:v71];

                [v9 distanceFromLocation:v72];
                unsigned int v163 = (int)v73;
                unsigned int v165 = (int)v73 - v59;

LABEL_45:
                v74 = [(SAMonitoringSessionManager *)self deviceRecord];
                v75 = [v74 getLatestAdvertisement:v8];

                uint64_t v76 = [v75 scanDate];
                if (v76)
                {
                  v77 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
                  [v77 timeIntervalSinceDate:v76];
                  double v79 = v78;
                }
                else
                {
                  double v79 = -1.0;
                }
                uint64_t v179 = [v75 rssi];
                v177 = v75;
                unsigned int v171 = v59;
                if (v75) {
                  uint64_t v182 = [v75 getBatteryState];
                }
                else {
                  uint64_t v182 = -1;
                }
                v80 = [(SAMonitoringSessionManager *)self deviceRecord];
                v81 = [v80 getLatestNOAdvertisement:v8];
                uint64_t v82 = [v81 scanDate];

                double v83 = -1.0;
                double v84 = -1.0;
                if (v82)
                {
                  v85 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
                  [v85 timeIntervalSinceDate:v82];
                  double v84 = v86;
                }
                v175 = (void *)v82;
                v87 = [(SAMonitoringSessionManager *)self deviceRecord];
                v88 = [v87 getLatestWildAdvertisement:v8];
                uint64_t v89 = [v88 scanDate];

                if (v89)
                {
                  v90 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
                  [v90 timeIntervalSinceDate:v89];
                  double v83 = v91;
                }
                v92 = [(SAMonitoringSessionManager *)self deviceRecord];
                uint64_t v93 = [v92 getLastWithYouDate:v8];

                if (v93)
                {
                  v94 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
                  [v94 timeIntervalSinceDate:v93];
                  double v96 = v95;
                }
                else
                {
                  double v96 = -1.0;
                }
                v97 = [v10 objectForKeyedSubscript:&unk_1F27FBF60];
                if (v97)
                {
                  v98 = [v10 objectForKeyedSubscript:&unk_1F27FBF60];
                }
                else
                {
                  v98 = &unk_1F27FBF90;
                }
                v173 = (void *)v93;

                v99 = [v10 objectForKeyedSubscript:&unk_1F27FBFA8];
                id v185 = v8;
                v186 = v12;
                v176 = (void *)v76;
                v174 = (void *)v89;
                if (v99)
                {
                  v100 = [v10 objectForKeyedSubscript:&unk_1F27FBFA8];
                  uint64_t v101 = [v100 BOOLValue];
                }
                else
                {
                  uint64_t v101 = 0;
                }
                unsigned int v149 = v101;

                BOOL v102 = [(SAMonitoringSessionManager *)self checkIfAlertWasTriggeredAtHome:v9 isEarlyVehicularTrigger:v101];
                BOOL v159 = v102;
                v216[0] = v188;
                v215[0] = @"lastAlertType";
                v215[1] = @"lastAlert";
                v160 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
                v216[1] = v160;
                v215[2] = @"tLastWithYou";
                v157 = [MEMORY[0x1E4F28ED0] numberWithDouble:v96];
                v216[2] = v157;
                v216[3] = v9;
                v215[3] = @"lLastWithYou";
                v215[4] = @"lastAlertIsBookendingTravel";
                v181 = v98;
                v216[4] = v98;
                v215[5] = @"lastAlertIsEarlyVehicularTrigger";
                v155 = [MEMORY[0x1E4F28ED0] numberWithBool:v101];
                v216[5] = v155;
                v215[6] = @"lastAlertVehicularState";
                v153 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAMonitoringSessionManager caCurrentVehicularState](self, "caCurrentVehicularState"));
                v216[6] = v153;
                v215[7] = @"lastAlertIsVehicularBTHintOn";
                v151 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SAMonitoringSessionManager caIsVehicularBTHintOn](self, "caIsVehicularBTHintOn"));
                v216[7] = v151;
                v215[8] = @"lastAlertIsClassicallyConnected";
                v147 = [MEMORY[0x1E4F28ED0] numberWithBool:v187];
                v216[8] = v147;
                v215[9] = @"noCaseAdvSuppressed";
                v145 = [MEMORY[0x1E4F28ED0] numberWithBool:v189];
                v216[9] = v145;
                v215[10] = @"lastAlertBatteryState";
                v103 = [MEMORY[0x1E4F28ED0] numberWithInteger:v182];
                v216[10] = v103;
                v215[11] = @"closeToAnySafeLocations";
                v104 = [MEMORY[0x1E4F28ED0] numberWithBool:v191];
                v216[11] = v104;
                v215[12] = @"timeSinceLastAlert";
                v105 = [MEMORY[0x1E4F28ED0] numberWithDouble:v47];
                v216[12] = v105;
                v215[13] = @"triggeredAtHome";
                v106 = [MEMORY[0x1E4F28ED0] numberWithBool:v102];
                v216[13] = v106;
                v215[14] = @"lastAlertRssiValue";
                v107 = [MEMORY[0x1E4F28ED0] numberWithInteger:v179];
                v216[14] = v107;
                v215[15] = @"travelingSuppressed";
                [MEMORY[0x1E4F28ED0] numberWithBool:v190];
                v108 = v193 = self;
                v216[15] = v108;
                v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v216 forKeys:v215 count:16];

                v109 = [(SAMonitoringSessionManager *)v193 deviceUUIDtoAlertContext];
                [v109 setObject:v162 forKeyedSubscript:v8];

                v214[0] = v188;
                v213[0] = @"alertType";
                v213[1] = @"itemType";
                v161 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v184];
                v214[1] = v161;
                v213[2] = @"productID";
                v158 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v12, "productId"));
                v214[2] = v158;
                v213[3] = @"vendorId";
                v156 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v12, "vendorId"));
                v214[3] = v156;
                v213[4] = @"tSinceLastTransition";
                v154 = [MEMORY[0x1E4F28ED0] numberWithDouble:v48];
                v214[4] = v154;
                v213[5] = @"tSincePriorAlert";
                v152 = [MEMORY[0x1E4F28ED0] numberWithDouble:v47];
                v214[5] = v152;
                v213[6] = @"radius";
                v172 = [MEMORY[0x1E4F28ED0] numberWithInt:v171];
                v214[6] = v172;
                v213[7] = @"t1centerDistance";
                v170 = [MEMORY[0x1E4F28ED0] numberWithInt:v169];
                v214[7] = v170;
                v213[8] = @"t1boundaryDistance";
                v168 = [MEMORY[0x1E4F28ED0] numberWithInt:v167];
                v214[8] = v168;
                v213[9] = @"t2centerDistance";
                v164 = [MEMORY[0x1E4F28ED0] numberWithInt:v163];
                v214[9] = v164;
                v213[10] = @"t2boundaryDistance";
                v166 = [MEMORY[0x1E4F28ED0] numberWithInt:v165];
                v214[10] = v166;
                v213[11] = @"lastUpdateAge";
                v148 = [MEMORY[0x1E4F28ED0] numberWithDouble:v79];
                v214[11] = v148;
                v213[12] = @"lastAdvRSSI";
                v180 = [MEMORY[0x1E4F28ED0] numberWithInteger:v179];
                v214[12] = v180;
                v213[13] = @"airplaneEnabled";
                v146 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SAMonitoringSessionManager isInAirplaneMode](v193, "isInAirplaneMode"));
                v214[13] = v146;
                v214[14] = v181;
                v213[14] = @"isBookendingTravel";
                v213[15] = @"isEarlyVehicularTrigger";
                v150 = [MEMORY[0x1E4F28ED0] numberWithBool:v149];
                v214[15] = v150;
                v213[16] = @"vehicularState";
                v144 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAMonitoringSessionManager caCurrentVehicularState](v193, "caCurrentVehicularState"));
                v214[16] = v144;
                v213[17] = @"isVehicularBTHintOn";
                v143 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SAMonitoringSessionManager caIsVehicularBTHintOn](v193, "caIsVehicularBTHintOn"));
                v214[17] = v143;
                v213[18] = @"lastNOAdvertisementAge";
                v142 = [MEMORY[0x1E4F28ED0] numberWithDouble:v84];
                v214[18] = v142;
                v213[19] = @"lastWildAdvertisementAge";
                v141 = [MEMORY[0x1E4F28ED0] numberWithDouble:v83];
                v214[19] = v141;
                v213[20] = @"classicallyConnected";
                v110 = [MEMORY[0x1E4F28ED0] numberWithBool:v187];
                v214[20] = v110;
                v213[21] = @"noCaseAdvSuppressed";
                v111 = [MEMORY[0x1E4F28ED0] numberWithBool:v189];
                v214[21] = v111;
                v213[22] = @"lastBatteryStateBeforeAlert";
                v112 = [MEMORY[0x1E4F28ED0] numberWithInteger:v182];
                v214[22] = v112;
                v213[23] = @"closeToAnySafeLocations";
                v113 = [MEMORY[0x1E4F28ED0] numberWithBool:v191];
                v214[23] = v113;
                v213[24] = @"systemVersion";
                uint64_t v114 = [v12 systemVersion];
                v115 = (void *)v114;
                v116 = @"unknown";
                if (v114) {
                  v116 = (__CFString *)v114;
                }
                v214[24] = v116;
                v213[25] = @"isHome";
                v117 = [MEMORY[0x1E4F28ED0] numberWithBool:v159];
                v214[25] = v117;
                v213[26] = @"hasSurfacedInCurrentTravelingSession";
                v118 = [MEMORY[0x1E4F28ED0] numberWithBool:v190];
                v214[26] = v118;
                v183 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:27];

                p_isa = (id *)&v193->super.isa;
                id v8 = v185;

                v120 = [(SAMonitoringSessionManager *)v193 analytics];
                [v120 submitEvent:@"com.apple.clx.alert.alertEvent" content:v183];

                v121 = [(SAMonitoringSessionManager *)v193 analytics];
                v122 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v184];
                [v121 submitAlertRateEvent:v122 alertType:v188];

                if (((v189 | v187 | v191 | v190) & 1) == 0)
                {
                  v123 = (void *)TASALog;
                  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
                  {
                    v192 = v123;
                    v124 = [v12 identifier];
                    v125 = [v12 name];
                    v126 = [v10 objectForKeyedSubscript:&unk_1F27FBF78];
                    uint64_t v127 = [v126 integerValue];
                    uint64_t v128 = [(SAMonitoringSessionManager *)v193 getMoreSpecificSADeviceType:v12];
                    v129 = [v12 systemVersion];
                    *(_DWORD *)uint64_t buf = 68290307;
                    int v200 = 0;
                    __int16 v201 = 2082;
                    v202 = "";
                    __int16 v203 = 2113;
                    int64_t v204 = (int64_t)v124;
                    __int16 v205 = 2113;
                    v206 = v125;
                    __int16 v207 = 2049;
                    uint64_t v208 = v127;
                    __int16 v209 = 2049;
                    uint64_t v210 = v128;
                    __int16 v211 = 2113;
                    v212 = v129;
                    p_isa = (id *)&v193->super.isa;
                    _os_log_impl(&dword_1D15FC000, v192, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa notify separation\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"type\":%{private}ld, \"deviceType\":%{private}ld, \"systemVersion\":\"%{private}@\"}", buf, 0x44u);

                    int v12 = v186;
                  }
                  v130 = [p_isa[2] getCurrentTime];
                  v131 = [p_isa caLastAlertDate];
                  [v131 setObject:v130 forKeyedSubscript:v185];

                  v132 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v12, 0);
                  long long v194 = 0u;
                  long long v195 = 0u;
                  long long v196 = 0u;
                  long long v197 = 0u;
                  id v133 = p_isa[6];
                  uint64_t v134 = [v133 countByEnumeratingWithState:&v194 objects:v198 count:16];
                  if (v134)
                  {
                    uint64_t v135 = v134;
                    uint64_t v136 = *(void *)v195;
                    do
                    {
                      for (uint64_t i = 0; i != v135; ++i)
                      {
                        if (*(void *)v195 != v136) {
                          objc_enumerationMutation(v133);
                        }
                        v138 = *(void **)(*((void *)&v194 + 1) + 8 * i);
                        if (objc_opt_respondsToSelector()) {
                          [v138 notifySeparationsForDevices:v132 withLocation:v9 withContext:v10];
                        }
                      }
                      uint64_t v135 = [v133 countByEnumeratingWithState:&v194 objects:v198 count:16];
                    }
                    while (v135);
                  }

                  id v8 = v185;
                  int v12 = v186;
                }
                goto LABEL_79;
              }
            }
            else
            {
              int v59 = -1;
              unsigned int v169 = -1;
              unsigned int v167 = -1;
            }
            unsigned int v163 = -1;
            unsigned int v165 = -1;
            goto LABEL_45;
          }
          __int16 v29 = [(SAMonitoringSessionManager *)self deviceRecord];
          BOOL v30 = [v29 getLatestCaseAdvertisementDate:v8];

          if (v30)
          {
            uint64_t v31 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
            [v31 timeIntervalSinceDate:v30];
            double v33 = v32;

            __int16 v34 = (void *)TASALog;
            BOOL v35 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
            if (v33 <= 129600.0)
            {
              if (v35)
              {
                __int16 v41 = v34;
                uint64_t v42 = [v12 identifier];
                __int16 v43 = [v42 UUIDString];
                *(_DWORD *)uint64_t buf = 68289283;
                int v200 = 0;
                __int16 v201 = 2082;
                v202 = "";
                __int16 v203 = 2113;
                int64_t v204 = (int64_t)v43;
                _os_log_impl(&dword_1D15FC000, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa separation for device with recent case advertisement\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
              }
              unsigned int v189 = 0;
              goto LABEL_32;
            }
            if (v35)
            {
              __int16 v36 = v34;
              id v37 = [v12 identifier];
              __int16 v38 = [v37 UUIDString];
              *(_DWORD *)uint64_t buf = 68289283;
              int v200 = 0;
              __int16 v201 = 2082;
              v202 = "";
              __int16 v203 = 2113;
              int64_t v204 = (int64_t)v38;
              long long v39 = "{\"msg%{public}.0s\":\"#sa separation for device with too old case advertisement - suppressing alert"
                    "\", \"device\":\"%{private}@\"}";
LABEL_27:
              _os_log_impl(&dword_1D15FC000, v36, OS_LOG_TYPE_DEFAULT, v39, buf, 0x1Cu);
            }
          }
          else
          {
            uint64_t v40 = (void *)TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v36 = v40;
              id v37 = [v12 identifier];
              __int16 v38 = [v37 UUIDString];
              *(_DWORD *)uint64_t buf = 68289283;
              int v200 = 0;
              __int16 v201 = 2082;
              v202 = "";
              __int16 v203 = 2113;
              int64_t v204 = (int64_t)v38;
              long long v39 = "{\"msg%{public}.0s\":\"#sa separation for device with no recent case advertisement - suppressing ale"
                    "rt\", \"device\":\"%{private}@\"}";
              goto LABEL_27;
            }
          }
          unsigned int v189 = 1;
LABEL_32:

          goto LABEL_33;
        }
        v139 = [v12 name];
        char v140 = [v139 isEqualToString:@"right"];

        if (v140) {
          goto LABEL_16;
        }
        break;
    }
    int v21 = 0;
    goto LABEL_19;
  }
  uint64_t v18 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v200 = 0;
    __int16 v201 = 2082;
    v202 = "";
    __int16 v203 = 2113;
    int64_t v204 = (int64_t)v8;
    _os_log_impl(&dword_1D15FC000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa Service tried to notify with no corresponding device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
  }
LABEL_79:
}

- (void)handleGeofenceExitedForDeviceUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SAMonitoringSessionManager *)self standby])
  {
    uint64_t v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      BOOL v17 = "";
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel exit while in standby\"}", buf, 0x12u);
    }
    [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v4 toState:2];
  }
  else
  {
    id v6 = [(SAMonitoringSessionManager *)self clock];
    id v7 = [v6 getCurrentTime];
    id v8 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    id v9 = [v8 objectForKeyedSubscript:v4];
    [v9 setTravelingGeofenceExitDate:v7];

    [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v4 toState:4];
    if ([(SAMonitoringSessionManager *)self _isOnlyMonitoringDisconnectedCompanionDevice])
    {
      id v10 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        BOOL v17 = "";
        _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager is only monitoring disconnected companion device, skipping force update all WithYouStatus\"}", buf, 0x12u);
      }
      [(SAMonitoringSessionManager *)self didForceUpdateWithYouStatus];
    }
    else
    {
      uint64_t v11 = [(SAMonitoringSessionManager *)self withYouDetector];
      id v13 = v4;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v11 forceUpdateWithYouStatusToFindDevices:v12 withContext:3];
    }
  }
}

- (BOOL)_isOnlyMonitoringDisconnectedCompanionDevice
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v4 = [v3 allKeys];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10, (void)v20);

        if (v11)
        {
          int v12 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
          id v13 = [v12 objectForKeyedSubscript:v10];

          unint64_t v14 = [v13 state];
          if (v14 <= 5 && ((1 << v14) & 0x3A) != 0)
          {
            __int16 v16 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v10];
            uint64_t v17 = [v16 deviceType];

            if (v17 != 8)
            {

              BOOL v18 = 0;
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)addTravelFenceForDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v22 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      int v28 = 68289283;
      int v29 = 0;
      __int16 v30 = 2082;
      uint64_t v31 = "";
      __int16 v32 = 2113;
      id v33 = v4;
      long long v23 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to set while traveling fence due to no session\", "
            "\"uuid\":\"%{private}@\"}";
      double v24 = v22;
      os_log_type_t v25 = OS_LOG_TYPE_FAULT;
LABEL_8:
      _os_log_impl(&dword_1D15FC000, v24, v25, v23, (uint8_t *)&v28, 0x1Cu);
    }
LABEL_9:
    BOOL v21 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v8 = [v7 objectForKeyedSubscript:v4];
  id v9 = [v8 firstNotWithYouLocation];

  if (!v9)
  {
    lastLocation = self->_lastLocation;
    if (lastLocation)
    {
      id v9 = lastLocation;
      goto LABEL_5;
    }
    uint64_t v27 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      int v28 = 68289283;
      int v29 = 0;
      __int16 v30 = 2082;
      uint64_t v31 = "";
      __int16 v32 = 2113;
      id v33 = v4;
      long long v23 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to set while traveling fence due to no last locati"
            "on\", \"uuid\":\"%{private}@\"}";
      double v24 = v27;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_5:
  [(TALocationLite *)v9 latitude];
  double v12 = v11;
  [(TALocationLite *)v9 longitude];
  double v14 = v13;
  id v15 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  __int16 v16 = [v4 UUIDString];
  uint64_t v17 = objc_msgSend(v15, "initWithCenter:radius:identifier:", v16, v12, v14, 100.0);

  BOOL v18 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v19 = [v18 objectForKeyedSubscript:v4];
  [v19 setGeofence:v17];

  long long v20 = [(SAMonitoringSessionManager *)self fenceRequestServicer];
  [v20 addGeofence:v17];

  BOOL v21 = 1;
LABEL_10:

  return v21;
}

- (void)removeTravelFenceForDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    id v9 = [v8 geofence];

    if (v9)
    {
      uint64_t v10 = [(SAMonitoringSessionManager *)self fenceRequestServicer];
      double v11 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      double v12 = [v11 objectForKeyedSubscript:v4];
      double v13 = [v12 geofence];
      [v10 removeGeofence:v13];
    }
    double v14 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    id v15 = [v14 objectForKeyedSubscript:v4];
    [v15 setGeofence:0];
  }
  else
  {
    __int16 v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 68289283;
      v17[1] = 0;
      __int16 v18 = 2082;
      double v19 = "";
      __int16 v20 = 2113;
      id v21 = v4;
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to remove while traveling fence due to no session\", \"uuid\":\"%{private}@\"}", (uint8_t *)v17, 0x1Cu);
    }
  }
}

- (void)storeSeparationLocation:(id)a3
{
  id v14 = a3;
  id v4 = [(SAMonitoringSessionManager *)self lastLocation];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v6 = [(SAMonitoringSessionManager *)self lastLocation];
    [v6 latitude];
    double v8 = v7;
    id v9 = [(SAMonitoringSessionManager *)self lastLocation];
    [v9 longitude];
    double v11 = (void *)[v5 initWithLatitude:v8 longitude:v10];
    double v12 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    double v13 = [v12 objectForKeyedSubscript:v14];
    [v13 setCaSeparationLocation:v11];
  }
}

- (void)notifyWhileTraveling:(id)a3 isBookendingTravel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SAMonitoringSessionManager *)self standby])
  {
    double v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      int v29 = "";
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify\"}", (uint8_t *)&v26, 0x12u);
    }
    [(SAMonitoringSessionManager *)self removeTravelFenceForDevice:v6];
    goto LABEL_16;
  }
  double v8 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:&unk_1F27FBFA8 forKeyedSubscript:&unk_1F27FBF78];
    double v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    [v10 setObject:v11 forKeyedSubscript:&unk_1F27FBF60];

    id v12 = [(SADeviceRecord *)self->_deviceRecord getLastWithYouLocation:v6];
    if (!v12)
    {
      double v13 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      id v14 = [v13 objectForKeyedSubscript:v6];
      id v15 = [v14 geofence];

      if (v15)
      {
        id v12 = v15;
      }
      else
      {
        lastLocation = self->_lastLocation;
        if (!lastLocation)
        {
          os_log_type_t v25 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
          {
            int v26 = 68289026;
            int v27 = 0;
            __int16 v28 = 2082;
            int v29 = "";
            _os_log_impl(&dword_1D15FC000, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager notifyWhileTraveling with nil location\"}", (uint8_t *)&v26, 0x12u);
          }
          goto LABEL_15;
        }
        [(TALocationLite *)lastLocation latitude];
        double v19 = v18;
        [(TALocationLite *)self->_lastLocation longitude];
        double v21 = v20;
        id v22 = objc_alloc(MEMORY[0x1E4F1E5A8]);
        long long v23 = [v6 UUIDString];
        id v12 = (id)objc_msgSend(v22, "initWithCenter:radius:identifier:", v23, v19, v21, 100.0);
      }
    }
    double v24 = [(SAMonitoringSessionManager *)self createLocationFromCircularRegion:v12 forDevice:v6 withContext:2];
    [(SAMonitoringSessionManager *)self removeTravelFenceForDevice:v6];
    [(SAMonitoringSessionManager *)self handleSeparationForDeviceUUID:v6 withSafeLocationRecommendation:v24 context:v10];

LABEL_15:
    goto LABEL_16;
  }
  __int16 v16 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    int v26 = 68289283;
    int v27 = 0;
    __int16 v28 = 2082;
    int v29 = "";
    __int16 v30 = 2113;
    id v31 = v6;
    _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify while traveling due to no session\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v26, 0x1Cu);
  }
LABEL_16:
}

- (void)notifyWhenLeftBehind:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SAMonitoringSessionManager *)self standby])
  {
    uint64_t v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      id v22 = "";
      id v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify\"}";
      double v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 18;
LABEL_13:
      _os_log_impl(&dword_1D15FC000, v7, v8, v6, (uint8_t *)&v19, v9);
    }
  }
  else
  {
    id v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    double v11 = [v10 objectForKeyedSubscript:v4];

    if (v11)
    {
      id v12 = [(SADeviceRecord *)self->_deviceRecord getLastWithYouLocation:v4];
      if (!v12)
      {
        double v13 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        id v14 = [v13 objectForKeyedSubscript:v4];
        id v15 = [v14 scenarioClassifier];
        __int16 v16 = [v15 lastUnsafeLocation];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v12 = v17;
      }
      [(SAMonitoringSessionManager *)self notifyLeftBehind:v4 withRegion:v12 isEarlyVehicularTrigger:0];
    }
    else
    {
      uint64_t v18 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        int v19 = 68289283;
        int v20 = 0;
        __int16 v21 = 2082;
        id v22 = "";
        __int16 v23 = 2113;
        id v24 = v4;
        id v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify when left behind due to no session\", \""
             "uuid\":\"%{private}@\"}";
        double v7 = v18;
        os_log_type_t v8 = OS_LOG_TYPE_FAULT;
        uint32_t v9 = 28;
        goto LABEL_13;
      }
    }
  }
}

- (void)notifyLeftBehind:(id)a3 withRegion:(id)a4 isEarlyVehicularTrigger:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:&unk_1F27FBF60 forKeyedSubscript:&unk_1F27FBF78];
  double v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  [v10 setObject:v11 forKeyedSubscript:&unk_1F27FBFA8];

  if (v9) {
    goto LABEL_10;
  }
  id v12 = [(SAMonitoringSessionManager *)self previousVisitOrLOIEvent];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  id v14 = [(SAMonitoringSessionManager *)self previousVisitOrLOIEvent];
  if (isKindOfClass)
  {
    id v15 = [NSString alloc];
    __int16 v16 = [v8 UUIDString];
    uint64_t v17 = (void *)[v15 initWithFormat:@"unsafe_%@", v16];

    [v14 horizontalAccuracy];
    id v18 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v14 coordinate];
    id v9 = (id)objc_msgSend(v18, "initWithCenter:radius:identifier:", v17);
  }
  else
  {
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0) {
      goto LABEL_12;
    }
    id v14 = [(SAMonitoringSessionManager *)self previousVisitOrLOIEvent];
    [v14 latitude];
    CLLocationDegrees v21 = v20;
    [v14 longitude];
    CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v21, v22);
    [v14 horizontalAccuracy];
    if (v24 >= 100.0) {
      double v25 = v24;
    }
    else {
      double v25 = 100.0;
    }
    id v26 = [NSString alloc];
    int v27 = [v8 UUIDString];
    uint64_t v17 = (void *)[v26 initWithFormat:@"unsafe_%@", v27];

    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v17, v23.latitude, v23.longitude, v25);
    objc_msgSend(v9, "setGeoReferenceFrame:", objc_msgSend(v14, "referenceFrame"));
  }

  if (v9)
  {
LABEL_10:
    __int16 v28 = [(SAMonitoringSessionManager *)self createLocationFromCircularRegion:v9 forDevice:v8 withContext:1];
    [(SAMonitoringSessionManager *)self handleSeparationForDeviceUUID:v8 withSafeLocationRecommendation:v28 context:v10];

    goto LABEL_11;
  }
LABEL_12:
  int v29 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v31 = 0;
    __int16 v32 = 2082;
    id v33 = "";
    _os_log_impl(&dword_1D15FC000, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager notifyWhenLeftBehind without suggesting location\"}", buf, 0x12u);
  }
LABEL_11:
}

- (void)notifyEarlyLeftBehind:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SAMonitoringSessionManager *)self standby])
  {
    uint64_t v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      CLLocationDegrees v22 = "";
      id v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager standby notify early\"}";
      double v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 18;
LABEL_13:
      _os_log_impl(&dword_1D15FC000, v7, v8, v6, (uint8_t *)&v19, v9);
    }
  }
  else
  {
    id v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    double v11 = [v10 objectForKeyedSubscript:v4];

    if (v11)
    {
      id v12 = [(SADeviceRecord *)self->_deviceRecord getLastWithYouLocation:v4];
      if (!v12)
      {
        double v13 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        id v14 = [v13 objectForKeyedSubscript:v4];
        id v15 = [v14 scenarioClassifier];
        __int16 v16 = [v15 currentUnsafeLocation];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v12 = v17;
      }
      [(SAMonitoringSessionManager *)self notifyLeftBehind:v4 withRegion:v12 isEarlyVehicularTrigger:1];
    }
    else
    {
      uint64_t v18 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        int v19 = 68289283;
        int v20 = 0;
        __int16 v21 = 2082;
        CLLocationDegrees v22 = "";
        __int16 v23 = 2113;
        id v24 = v4;
        id v6 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to notify early left behind due to no session\", "
             "\"uuid\":\"%{private}@\"}";
        double v7 = v18;
        os_log_type_t v8 = OS_LOG_TYPE_FAULT;
        uint32_t v9 = 28;
        goto LABEL_13;
      }
    }
  }
}

- (id)createLocationFromCircularRegion:(id)a3 forDevice:(id)a4 withContext:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_5;
  }
  [v8 radius];
  double v11 = 75.0;
  if (v10 >= 75.0)
  {
    double v11 = v10;
    if (v10 <= 0.0) {
      goto LABEL_5;
    }
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v8 center];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  uint64_t v18 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v17, objc_msgSend(v8, "geoReferenceFrame"), v14, v16, 0.0, v11, -1.0);

  if (!v18)
  {
LABEL_5:
    int v19 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      int v20 = (void *)MEMORY[0x1E4F28ED0];
      __int16 v21 = v19;
      CLLocationDegrees v22 = [v20 numberWithUnsignedInteger:a5];
      v24[0] = 68289539;
      v24[1] = 0;
      __int16 v25 = 2082;
      id v26 = "";
      __int16 v27 = 2113;
      id v28 = v9;
      __int16 v29 = 2113;
      __int16 v30 = v22;
      _os_log_impl(&dword_1D15FC000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager unable to create/recommend location\", \"uuid\":\"%{private}@\", \"context\":\"%{private}@\"}", (uint8_t *)v24, 0x26u);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)addDevice:(id)a3 isLastDeviceEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 identifier];
  id v8 = [(SAMonitoringSessionManager *)self devices];
  [v8 setObject:v6 forKeyedSubscript:v7];

  id v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = [v6 name];
    v16[0] = 68289539;
    v16[1] = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2113;
    int v20 = v7;
    __int16 v21 = 2113;
    CLLocationDegrees v22 = v11;
    _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager new device\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\"}", (uint8_t *)v16, 0x26u);
  }
  id v12 = [SADeviceUpdateEvent alloc];
  double v13 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  double v14 = [(SADeviceUpdateEvent *)v12 initWithDevice:v6 eventType:0 lastEvent:v4 date:v13];

  double v15 = [(SAMonitoringSessionManager *)self deviceRecord];
  [v15 ingestTAEvent:v14];

  if ([(SAMonitoringSessionManager *)self enabled]) {
    [(SAMonitoringSessionManager *)self createMonitoringDevice:v7];
  }
}

- (void)removeDeviceWithUUID:(id)a3 isLastDeviceEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SAMonitoringSessionManager *)self devices];
  id v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = [v8 name];
    v19[0] = 68289539;
    v19[1] = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2113;
    id v23 = v6;
    __int16 v24 = 2113;
    __int16 v25 = v11;
    _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager remove device\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\"}", (uint8_t *)v19, 0x26u);
  }
  [(SAMonitoringSessionManager *)self removeAndStopSafeLocationsForDeviceUUID:v6];
  id v12 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v13 = [v12 objectForKeyedSubscript:v6];

  if (v13) {
    [(SAMonitoringSessionManager *)self cancelMonitoringDevice:v6];
  }
  double v14 = [(SAMonitoringSessionManager *)self devices];
  [v14 setObject:0 forKeyedSubscript:v6];

  double v15 = [SADeviceUpdateEvent alloc];
  double v16 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  __int16 v17 = [(SADeviceUpdateEvent *)v15 initWithDevice:v8 eventType:1 lastEvent:v4 date:v16];

  uint64_t v18 = [(SAMonitoringSessionManager *)self deviceRecord];
  [v18 ingestTAEvent:v17];
}

- (void)setSafeLocations:(id)a3 forDeviceUUID:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v6 = a4;
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  double v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  id v8 = [v7 objectForKeyedSubscript:v6];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v72 objects:v88 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v73;
    *(void *)&long long v10 = 138477827;
    long long v50 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v15 = v54;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v87 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v69;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v69 != v18) {
                objc_enumerationMutation(v15);
              }
              if (objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * j), "isEqual:", v14, v50))
              {

                goto LABEL_18;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v68 objects:v87 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        __int16 v20 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = v20;
          __int16 v22 = [v14 UUIDString];
          *(_DWORD *)uint64_t buf = v50;
          *(void *)v77 = v22;
          _os_log_impl(&dword_1D15FC000, v21, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found removed location, for deviceId, %{private}@", buf, 0xCu);
        }
        objc_msgSend(v51, "addObject:", v14, v50);
LABEL_18:
        ;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
    }
    while (v11);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v23 = v51;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v86 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v65 != v26) {
          objc_enumerationMutation(v23);
        }
        [(SAMonitoringSessionManager *)self stopSafeLocation:*(void *)(*((void *)&v64 + 1) + 8 * k) forDevice:v6];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v86 count:16];
    }
    while (v25);
  }
  id v52 = v23;

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v55 = v54;
  uint64_t v29 = [v55 countByEnumeratingWithState:&v60 objects:v85 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v61;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v61 != v31) {
          objc_enumerationMutation(v55);
        }
        uint64_t v33 = *(void *)(*((void *)&v60 + 1) + 8 * v32);
        uint64_t v34 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
        BOOL v35 = [v34 objectForKeyedSubscript:v6];
        char v36 = [v35 containsObject:v33];

        if ((v36 & 1) == 0)
        {
          id v37 = [(SAMonitoringSessionManager *)self safeLocations];
          __int16 v38 = [v37 objectForKeyedSubscript:v33];

          if (v38)
          {
            [v28 addObject:v33];
          }
          else
          {
            long long v39 = (void *)TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
              [(SAMonitoringSessionManager *)v83 setSafeLocations:v6 forDeviceUUID:&v84];
            }
          }
        }
        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v55 countByEnumeratingWithState:&v60 objects:v85 count:16];
    }
    while (v30);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v40 = v28;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v82 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v57;
    do
    {
      for (uint64_t m = 0; m != v42; ++m)
      {
        if (*(void *)v57 != v43) {
          objc_enumerationMutation(v40);
        }
        [(SAMonitoringSessionManager *)self startSafeLocation:*(void *)(*((void *)&v56 + 1) + 8 * m) forDevice:v6];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v82 count:16];
    }
    while (v42);
  }

  __int16 v45 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = v45;
    uint64_t v47 = [v40 count];
    *(_DWORD *)uint64_t buf = 68289539;
    *(_DWORD *)v77 = 0;
    *(_WORD *)&v77[4] = 2082;
    *(void *)&v77[6] = "";
    __int16 v78 = 2113;
    id v79 = v6;
    __int16 v80 = 2049;
    uint64_t v81 = v47;
    _os_log_impl(&dword_1D15FC000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update safe locations\", \"device\":\"%{private}@\", \"count\":%{private}ld}", buf, 0x26u);
  }
  double v48 = (void *)[v55 copy];
  id v49 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  [v49 setObject:v48 forKeyedSubscript:v6];
}

- (void)removeSafeLocation:(id)a3 forDeviceUUID:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (v18)
  {
    if (v6)
    {
      double v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
      id v8 = [v7 objectForKeyedSubscript:v6];
      int v9 = [v8 containsObject:v18];

      if (v9)
      {
        long long v10 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v11 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
        uint64_t v12 = [v11 objectForKeyedSubscript:v6];
        double v13 = [v10 setWithSet:v12];

        double v14 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        id v15 = [v14 objectForKeyedSubscript:v6];

        id v16 = v18;
        if (v15)
        {
          [(SAMonitoringSessionManager *)self stopSafeLocation:v18 forDevice:v6];
          id v16 = v18;
        }
        [v13 removeObject:v16];
        uint64_t v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
        [v17 setObject:v13 forKeyedSubscript:v6];
      }
    }
  }
}

- (void)removeAndStopSafeLocationsForDeviceUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  id v6 = [v5 objectForKeyedSubscript:v4];
  double v7 = [v6 allObjects];

  id v8 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  int v9 = [v8 objectForKeyedSubscript:v4];

  if (v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[SAMonitoringSessionManager stopSafeLocation:forDevice:](self, "stopSafeLocation:forDevice:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), v4, (void)v16);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  id v15 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  [v15 setObject:0 forKeyedSubscript:v4];
}

- (void)startSafeLocation:(id)a3 forDevice:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAMonitoringSessionManager *)self safeLocations];
  int v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v20 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v25 = 68289539;
    int v26 = 0;
    __int16 v27 = 2082;
    id v28 = "";
    __int16 v29 = 2113;
    id v30 = v6;
    __int16 v31 = 2113;
    id v32 = v7;
    uint64_t v21 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location error\", \"location\":\"%{private}@\", \"dev"
          "ice\":\"%{private}@\"}";
    __int16 v22 = v20;
    uint32_t v23 = 38;
LABEL_10:
    _os_log_impl(&dword_1D15FC000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v25, v23);
    goto LABEL_11;
  }
  id v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11)
  {
    uint64_t v24 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v25 = 68289283;
    int v26 = 0;
    __int16 v27 = 2082;
    id v28 = "";
    __int16 v29 = 2113;
    id v30 = v7;
    uint64_t v21 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location device error\", \"device\":\"%{private}@\"}";
    __int16 v22 = v24;
    uint32_t v23 = 28;
    goto LABEL_10;
  }
  uint64_t v12 = [SASafeLocationUpdateEvent alloc];
  uint64_t v13 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  uint64_t v14 = [(SASafeLocationUpdateEvent *)v12 initWithSafeLocation:v9 eventType:0 lastEvent:1 date:v13];

  id v15 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = v15;
    int v25 = 68289795;
    int v26 = 0;
    __int16 v27 = 2082;
    id v28 = "";
    __int16 v29 = 2113;
    id v30 = v6;
    __int16 v31 = 2113;
    id v32 = v7;
    __int16 v33 = 2049;
    uint64_t v34 = [v9 referenceFrame];
    _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager start location\", \"location\":\"%{private}@\", \"device\":\"%{private}@\", \"refFrame\":%{private}lu}", (uint8_t *)&v25, 0x30u);
  }
  long long v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  long long v18 = [v17 objectForKeyedSubscript:v7];
  long long v19 = [v18 scenarioClassifier];
  [v19 ingestTAEvent:v14];

LABEL_11:
}

- (void)stopSafeLocation:(id)a3 forDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAMonitoringSessionManager *)self safeLocations];
  int v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v19 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v24 = 68289539;
    *(_DWORD *)int v25 = 0;
    *(_WORD *)&v25[4] = 2082;
    *(void *)&v25[6] = "";
    *(_WORD *)&v25[14] = 2113;
    *(void *)&v25[16] = v6;
    __int16 v26 = 2113;
    id v27 = v7;
    uint64_t v20 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager stop location error\", \"location\":\"%{private}@\", \"devi"
          "ce\":\"%{private}@\"}";
    uint64_t v21 = v19;
    uint32_t v22 = 38;
LABEL_10:
    _os_log_impl(&dword_1D15FC000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);
    goto LABEL_11;
  }
  id v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11)
  {
    uint64_t v23 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v24 = 68289283;
    *(_DWORD *)int v25 = 0;
    *(_WORD *)&v25[4] = 2082;
    *(void *)&v25[6] = "";
    *(_WORD *)&v25[14] = 2113;
    *(void *)&v25[16] = v7;
    uint64_t v20 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager stop location device error\", \"device\":\"%{private}@\"}";
    uint64_t v21 = v23;
    uint32_t v22 = 28;
    goto LABEL_10;
  }
  uint64_t v12 = [SASafeLocationUpdateEvent alloc];
  uint64_t v13 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  uint64_t v14 = [(SASafeLocationUpdateEvent *)v12 initWithSafeLocation:v9 eventType:1 lastEvent:1 date:v13];

  id v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138478083;
    *(void *)int v25 = v6;
    *(_WORD *)&v25[8] = 2113;
    *(void *)&v25[10] = v7;
    _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager stop location %{private}@ for device %{private}@", (uint8_t *)&v24, 0x16u);
  }
  long long v16 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  long long v17 = [v16 objectForKeyedSubscript:v7];
  long long v18 = [v17 scenarioClassifier];
  [v18 ingestTAEvent:v14];

LABEL_11:
}

- (void)removeDevicesIfNeededPerEvent:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v4 = [(SAMonitoringSessionManager *)self devices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v72 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v10 = [v50 devices];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v68;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v68 != v13) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v67 + 1) + 8 * j) isEqual:v9])
              {

                goto LABEL_18;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v81 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v15 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = v15;
          long long v17 = [v9 UUIDString];
          *(_DWORD *)uint64_t buf = 138477827;
          __int16 v80 = v17;
          _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found unpaired device, clearing deviceId, %{private}@", buf, 0xCu);
        }
        [obj addObject:v9];
LABEL_18:
        ;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v6);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v18 = obj;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v64 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v63 + 1) + 8 * k);
        int v24 = [v18 lastObject];
        [(SAMonitoringSessionManager *)self removeDeviceWithUUID:v23 isLastDeviceEvent:v23 == v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v63 objects:v78 count:16];
    }
    while (v20);
  }

  int v25 = [(SAMonitoringSessionManager *)self devices];
  [v25 removeObjectsForKeys:v18];

  __int16 v26 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
  [v26 removeObjectsForKeys:v18];

  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obja = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v27 = [obja countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v60;
    *(void *)&long long v28 = 138477827;
    long long v46 = v28;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v60 != v30) {
          objc_enumerationMutation(obja);
        }
        id v32 = *(void **)(*((void *)&v59 + 1) + 8 * m);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        __int16 v33 = objc_msgSend(v50, "devices", v46);
        uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v76 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v56;
          while (2)
          {
            for (uint64_t n = 0; n != v35; ++n)
            {
              if (*(void *)v56 != v36) {
                objc_enumerationMutation(v33);
              }
              if ([*(id *)(*((void *)&v55 + 1) + 8 * n) isEqual:v32])
              {

                goto LABEL_44;
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v55 objects:v76 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        __int16 v38 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          long long v39 = v38;
          id v40 = [v32 UUIDString];
          *(_DWORD *)uint64_t buf = v46;
          __int16 v80 = v40;
          _os_log_impl(&dword_1D15FC000, v39, OS_LOG_TYPE_DEFAULT, "#SAMonitoringSessionManager found unpaired device in monitoring session record, clearing deviceId, %{private}@", buf, 0xCu);
        }
        [v47 addObject:v32];
LABEL_44:
        ;
      }
      uint64_t v29 = [obja countByEnumeratingWithState:&v59 objects:v77 count:16];
    }
    while (v29);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v41 = v47;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v51 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0; ii != v43; ++ii)
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(v41);
        }
        [(SAMonitoringSessionManager *)self cancelMonitoringDevice:*(void *)(*((void *)&v51 + 1) + 8 * ii)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v51 objects:v75 count:16];
    }
    while (v43);
  }
}

- (void)addDevicesIfNeededPerEvent:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = [v4 devices];
  uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v45;
    uint64_t v35 = v4;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v7 = [v4 devices];
        id v8 = [v7 objectForKeyedSubscript:v6];

        int v9 = [(SAMonitoringSessionManager *)self devices];
        id v10 = [v9 objectForKeyedSubscript:v6];

        if (v10)
        {
          if ([v10 isReallyEqual:v8])
          {
            uint64_t v11 = [v4 safeLocations];
            uint64_t v12 = [v11 objectForKeyedSubscript:v6];
            uint64_t v13 = [(SAMonitoringSessionManager *)self deviceUUIDtoSafeLocationUUIDs];
            uint64_t v14 = [v13 objectForKeyedSubscript:v6];
            char v15 = [v12 isEqualToSet:v14];

            id v4 = v35;
            if (v15) {
              goto LABEL_13;
            }
            long long v16 = [v35 safeLocations];
            long long v17 = [v16 objectForKeyedSubscript:v6];
            [(SAMonitoringSessionManager *)self removeSafeLocationsIfNeededPerNewSet:v17 forDevice:v6];

            id v18 = [v35 safeLocations];
            uint64_t v19 = [v18 objectForKeyedSubscript:v6];
            [(SAMonitoringSessionManager *)self addSafeLocationsIfNeededPerNewSet:v19 forDevice:v6];
          }
          else
          {
            [(SAMonitoringSessionManager *)self removeAndStopSafeLocationsForDeviceUUID:v6];
            uint64_t v20 = [(SAMonitoringSessionManager *)self devices];
            uint64_t v21 = [v10 identifier];
            [v20 setObject:0 forKeyedSubscript:v21];

            id v18 = [v4 devices];
            uint64_t v19 = [v18 objectForKeyedSubscript:v6];
            [v37 addObject:v19];
          }
        }
        else
        {
          [v37 addObject:v8];
        }
LABEL_13:
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v39);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v37;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        long long v28 = [v22 lastObject];
        [(SAMonitoringSessionManager *)self addDevice:v27 isLastDeviceEvent:v27 == v28];

        uint64_t v29 = [v4 safeLocations];
        uint64_t v30 = [v27 identifier];
        __int16 v31 = [v29 objectForKeyedSubscript:v30];
        id v32 = [v27 identifier];
        [(SAMonitoringSessionManager *)self setSafeLocations:v31 forDeviceUUID:v32];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v24);
  }

  __int16 v33 = [(SAMonitoringSessionManager *)self devices];
  uint64_t v34 = [v33 count];

  if (v34) {
    [(SAMonitoringSessionManager *)self removeDisableReason:64];
  }
  else {
    [(SAMonitoringSessionManager *)self addDisableReason:64];
  }
}

- (void)removeSafeLocationsIfNeededPerNewSet:(id)a3 forDevice:(id)a4
{
}

- (BOOL)isWithinCurrentVisitOrLOI:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 latitude];
  double v8 = v7;
  [v5 longitude];
  double v10 = v9;

  uint64_t v11 = (void *)[v6 initWithLatitude:v8 longitude:v10];
  uint64_t v12 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v14 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
  if (isKindOfClass)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v14 coordinate];
    double v17 = v16;
    [v14 coordinate];
  }
  else
  {
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
    {
      BOOL v26 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v14 latitude];
    double v17 = v20;
    [v14 longitude];
    double v18 = v21;
  }
  id v22 = (void *)[v15 initWithLatitude:v17 longitude:v18];
  [v22 distanceFromLocation:v11];
  double v24 = v23;
  [v14 horizontalAccuracy];
  if (v25 < 100.0) {
    double v25 = 100.0;
  }
  BOOL v26 = v24 <= v25;

LABEL_9:
  return v26;
}

- (BOOL)shouldIssueBookendedNotificationBasedOnLocationForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v8 = [v5 objectForKeyedSubscript:v4];

  id v6 = [v8 trackedTravelingStartLocation];

  double v7 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
  LOBYTE(v8) = 0;
  if (v7 && v6) {
    LODWORD(v8) = ![(SAMonitoringSessionManager *)self isWithinCurrentVisitOrLOI:v6];
  }

  return (char)v8;
}

- (BOOL)shouldIssueBookendedNotificationBasedOnTimeForDevice:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v6 = [v5 objectForKeyedSubscript:v4];

  double v7 = [v6 trackedTravelingStartDate];
  double v8 = [v6 scenarioClassifier];
  double v9 = [v8 scenarioChangeDate];

  if (v7)
  {
    [v9 timeIntervalSinceDate:v7];
    BOOL v11 = v10 >= 360.0;
  }
  else
  {
    BOOL v11 = 1;
  }
  uint64_t v12 = [(SAMonitoringSessionManager *)self timeOfAttemptToLoadFromPersistence];
  uint64_t v13 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 < 0.0) {
    double v15 = -v15;
  }
  if (!v7)
  {
    double v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      double v23 = "";
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager no tracked traveling start date\"}", (uint8_t *)&v20, 0x12u);
    }
  }
  double v17 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 68289539;
    int v21 = 0;
    __int16 v22 = 2082;
    double v23 = "";
    __int16 v24 = 1025;
    BOOL v25 = v11;
    __int16 v26 = 1025;
    BOOL v27 = v15 >= 150.0;
    _os_log_impl(&dword_1D15FC000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager shouldIssueBookendedNotificationBasedOnTimeForDevice\", \"min travel satisified\":%{private}hhd, \"min duration after persistence\":%{private}hhd}", (uint8_t *)&v20, 0x1Eu);
  }
  BOOL v18 = v15 >= 150.0 && v11;

  return v18;
}

- (BOOL)shouldIssueBookendedNotificationForDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SAMonitoringSessionManager *)self shouldIssueBookendedNotificationBasedOnLocationForDevice:v4];
  BOOL v6 = [(SAMonitoringSessionManager *)self shouldIssueBookendedNotificationBasedOnTimeForDevice:v4];

  double v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    __int16 v10 = 2082;
    BOOL v11 = "";
    __int16 v12 = 1025;
    BOOL v13 = v5;
    __int16 v14 = 1025;
    BOOL v15 = v6;
    _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager shouldIssueBookendedNotificationForDevice\", \"based on location\":%{private}hhd, \"based on time\":%{private}hhd}", (uint8_t *)v9, 0x1Eu);
  }
  return v5 && v6;
}

- (void)updateDevicesWithSafeLocations:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    double v7 = [v4 devices];
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = [v7 count];
    _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update devices\", \"count\":%{private}ld}", (uint8_t *)v8, 0x1Cu);
  }
  [(SAMonitoringSessionManager *)self removeDevicesIfNeededPerEvent:v4];
  [(SAMonitoringSessionManager *)self addDevicesIfNeededPerEvent:v4];
}

- (id)computeRemovedSafeLocations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAMonitoringSessionManager *)self safeLocations];
  if (v5
    && (BOOL v6 = (void *)v5,
        [(SAMonitoringSessionManager *)self safeLocations],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    __int16 v9 = (void *)MEMORY[0x1E4F1CA80];
    __int16 v10 = [(SAMonitoringSessionManager *)self safeLocations];
    __int16 v11 = [v10 allKeys];
    uint64_t v12 = [v9 setWithArray:v11];

    if (v4 && [v4 count]) {
      [v12 minusSet:v4];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  }

  return v12;
}

- (void)updateSafeLocations:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v6 = [v4 safeLocations];
  double v7 = [v6 allKeys];
  uint64_t v8 = [v5 setWithArray:v7];
  __int16 v9 = [(SAMonitoringSessionManager *)self computeRemovedSafeLocations:v8];

  if ([v9 count])
  {
    uint64_t v28 = v9;
    id v29 = v4;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * v14);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v16 = [(SAMonitoringSessionManager *)self devices];
          double v17 = [v16 allKeys];

          uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v31;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v31 != v20) {
                  objc_enumerationMutation(v17);
                }
                [(SAMonitoringSessionManager *)self removeSafeLocation:v15 forDeviceUUID:*(void *)(*((void *)&v30 + 1) + 8 * v21++)];
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
            }
            while (v19);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v12);
    }

    __int16 v9 = v28;
    id v4 = v29;
  }
  __int16 v22 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = v22;
    __int16 v24 = [v4 safeLocations];
    uint64_t v25 = [v24 count];
    *(_DWORD *)uint64_t buf = 68289283;
    int v39 = 0;
    __int16 v40 = 2082;
    long long v41 = "";
    __int16 v42 = 2049;
    uint64_t v43 = v25;
    _os_log_impl(&dword_1D15FC000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager update safe locations\", \"count\":%{private}ld}", buf, 0x1Cu);
  }
  __int16 v26 = objc_msgSend(v4, "safeLocations", v28, v29);
  BOOL v27 = (void *)[v26 copy];
  [(SAMonitoringSessionManager *)self setSafeLocations:v27];
}

- (void)handleGeofenceEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 region];
    if (v6)
    {
      double v7 = (void *)v6;
      uint64_t v8 = [v5 region];
      __int16 v9 = [v8 identifier];

      if (v9)
      {
        id v10 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = v10;
          uint64_t v12 = [v5 description];
          int v30 = 68289283;
          int v31 = 0;
          __int16 v32 = 2082;
          long long v33 = "";
          __int16 v34 = 2113;
          long long v35 = v12;
          _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent received geofenceEvent\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
        }
        id v13 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v14 = [v5 region];
        uint64_t v15 = [v14 identifier];
        uint64_t v16 = [v13 initWithUUIDString:v15];

        double v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        uint64_t v18 = [v17 objectForKeyedSubscript:v16];

        if (v18)
        {
          uint64_t v19 = [v5 eventType];
          if (v19 == 2 || v19 == 4)
          {
            __int16 v26 = [v18 geofence];

            if (v26)
            {
              BOOL v27 = [(SAMonitoringSessionManager *)self fenceRequestServicer];
              uint64_t v28 = [v18 geofence];
              [v27 removeGeofence:v28];
            }
            if ([v18 state] == 3)
            {
              [(SAMonitoringSessionManager *)self handleGeofenceExitedForDeviceUUID:v16];
            }
            else if ([v5 eventType] == 4)
            {
              id v29 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
              {
                int v30 = 68289283;
                int v31 = 0;
                __int16 v32 = 2082;
                long long v33 = "";
                __int16 v34 = 2113;
                long long v35 = v16;
                _os_log_impl(&dword_1D15FC000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent ignored (recent crash?)\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
              }
            }
          }
          else if (v19 == 6)
          {
            uint64_t v20 = [v18 geofence];

            if (v20) {
              [v18 setGeofence:0];
            }
            if ([v18 state] == 3) {
              [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v16 toState:1];
            }
          }
        }
        else
        {
          double v23 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            __int16 v24 = v23;
            uint64_t v25 = [v5 description];
            int v30 = 68289283;
            int v31 = 0;
            __int16 v32 = 2082;
            long long v33 = "";
            __int16 v34 = 2113;
            long long v35 = v25;
            _os_log_impl(&dword_1D15FC000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent geofenceEvent cannot be mapped to monitoring session\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
          }
        }

        goto LABEL_26;
      }
    }
  }
  uint64_t v21 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v16 = v21;
    __int16 v22 = [v5 description];
    int v30 = 68289283;
    int v31 = 0;
    __int16 v32 = 2082;
    long long v33 = "";
    __int16 v34 = 2113;
    long long v35 = v22;
    _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager handleGeofenceEvent invalid geofenceEvent\", \"geofence\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);

LABEL_26:
  }
}

- (void)setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        __int16 v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        id v10 = [v9 objectForKeyedSubscript:v8];

        if ([v10 state] == 1)
        {
          uint64_t v11 = [v10 firstNotWithYouLocation];

          if (v11)
          {
            if ([(SAMonitoringSessionManager *)self addTravelFenceForDevice:v8]) {
              [(SAMonitoringSessionManager *)self changeMonitoringSessionState:v8 toState:3];
            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)removeDisableReason:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2049;
    unint64_t v12 = a3;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager removeDisableReason\", \"reason\":%{private}lu}", (uint8_t *)v8, 0x1Cu);
  }
  unint64_t disabledReasons = self->_disabledReasons;
  if ((disabledReasons & a3) != 0)
  {
    unint64_t v7 = disabledReasons & ~a3;
    self->_unint64_t disabledReasons = v7;
    if (!v7) {
      [(SAMonitoringSessionManager *)self setEnabled:1];
    }
  }
}

- (void)addDisableReason:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2049;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager addDisableReason\", \"reason\":%{private}lu}", (uint8_t *)v7, 0x1Cu);
  }
  unint64_t disabledReasons = self->_disabledReasons;
  if ((disabledReasons & a3) == 0)
  {
    if (a3)
    {
      if (!disabledReasons)
      {
        [(SAMonitoringSessionManager *)self setEnabled:0];
        unint64_t disabledReasons = self->_disabledReasons;
      }
    }
    self->_unint64_t disabledReasons = disabledReasons | a3;
  }
}

- (void)handleSystemStateChanged:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL isInAirplaneMode = self->_isInAirplaneMode;
  switch([v4 systemStateType])
  {
    case 3:
      -[SAMonitoringSessionManager setIsInAirplaneMode:](self, "setIsInAirplaneMode:", [v4 isOn]);
      if (![(SAMonitoringSessionManager *)self standby])
      {
        if (isInAirplaneMode && ([v4 isOn] & 1) == 0) {
          [(SAMonitoringSessionManager *)self setUpTravelingGeofencesOnAirplaneModeToggleOffIfNeeded];
        }
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        unint64_t v7 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        __int16 v8 = [v7 allKeys];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * v13);
              long long v15 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
              uint64_t v16 = [v15 objectForKeyedSubscript:v14];

              if ([v16 state] == 1)
              {
                [v16 setEarlyAirplaneTrigger:1];
                [v6 addObject:v14];
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v11);
        }

        uint64_t v17 = [v6 count];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v40 = 0;
            __int16 v41 = 2082;
            __int16 v42 = "";
            __int16 v43 = 2049;
            uint64_t v44 = v18;
            _os_log_impl(&dword_1D15FC000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long aggressive scan on Airplane Mode toggle\", \"count of devices to find\":%{private}ld}", buf, 0x1Cu);
          }
          uint64_t v20 = [(SAMonitoringSessionManager *)self withYouDetector];
          [v20 forceUpdateWithYouStatusToFindDevices:v6 withContext:6];
        }
      }
      goto LABEL_38;
    case 5:
      if ([v4 isOn])
      {
        uint64_t v21 = self;
        uint64_t v22 = 2;
        goto LABEL_31;
      }
      long long v33 = self;
      uint64_t v34 = 2;
      goto LABEL_37;
    case 6:
      if ([v4 isOn])
      {
        uint64_t v21 = self;
        uint64_t v22 = 4;
        goto LABEL_31;
      }
      long long v33 = self;
      uint64_t v34 = 4;
      goto LABEL_37;
    case 8:
      if ([v4 isOn])
      {
        uint64_t v21 = self;
        uint64_t v22 = 1;
        goto LABEL_31;
      }
      long long v33 = self;
      uint64_t v34 = 1;
      goto LABEL_37;
    case 11:
      if ([v4 isOn])
      {
        double v23 = [(SAMonitoringSessionManager *)self timeOfAttemptToLoadFromPersistence];

        if (!v23)
        {
          __int16 v24 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
          [(SAMonitoringSessionManager *)self setTimeOfAttemptToLoadFromPersistence:v24];

          uint64_t v25 = [(SAMonitoringSessionManager *)self persistenceManager];
          int v26 = [v25 load];

          if (v26)
          {
            BOOL v27 = [(SAMonitoringSessionManager *)self persistenceManager];
            uint64_t v28 = [v27 store];
            id v29 = [v28 monitoringSessionRecord];
            [(SAMonitoringSessionManager *)self setDeviceUUIDtoMonitoringSession:v29];

            int v30 = [(SAMonitoringSessionManager *)self persistenceManager];
            int v31 = [v30 store];
            __int16 v32 = [v31 monitoringSessionRecord];
            [(SAMonitoringSessionManager *)self bootstrapMonitoringSessionRecord:v32];
          }
        }
        uint64_t v21 = self;
        uint64_t v22 = 128;
LABEL_31:
        [(SAMonitoringSessionManager *)v21 removeDisableReason:v22];
      }
      else
      {
        long long v33 = self;
        uint64_t v34 = 128;
LABEL_37:
        [(SAMonitoringSessionManager *)v33 addDisableReason:v34];
      }
LABEL_38:

      return;
    case 16:
      -[SAMonitoringSessionManager setIsCompanionConnected:](self, "setIsCompanionConnected:", [v4 isOn]);
      goto LABEL_38;
    default:
      goto LABEL_38;
  }
}

- (void)didChangeScenarioClassFrom:(unint64_t)a3 to:(unint64_t)a4 forDevice:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  uint64_t v11 = [v10 state];

  if (v11 == 6)
  {
    uint64_t v12 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v66 = 0;
      __int16 v67 = 2082;
      long long v68 = "";
      _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager didChangeScenarioClass end monitoring skip\"}", buf, 0x12u);
    }
    goto LABEL_59;
  }
  uint64_t v13 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v14 = [v13 objectForKeyedSubscript:v8];
  uint64_t v15 = [v14 scenario];

  if (v15 == a4) {
    goto LABEL_59;
  }
  if (a3 == 3)
  {
    uint64_t v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v66 = 0;
      __int16 v67 = 2082;
      long long v68 = "";
      __int16 v69 = 2113;
      id v70 = v8;
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager end current traveling session\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    uint64_t v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    uint64_t v18 = [v17 objectForKeyedSubscript:v8];
    [v18 setLastAlertDateInCurrentTravelingSession:0];
  }
  uint64_t v19 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    uint64_t v21 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:[(SAMonitoringSessionManager *)self stateForDeviceUUID:v8]];
    uint64_t v22 = +[SAScenarioClassifier convertSAScenarioClassToString:a3];
    double v23 = +[SAScenarioClassifier convertSAScenarioClassToString:a4];
    *(_DWORD *)uint64_t buf = 68290051;
    int v66 = 0;
    __int16 v67 = 2082;
    long long v68 = "";
    __int16 v69 = 2113;
    id v70 = v21;
    __int16 v71 = 2113;
    long long v72 = v22;
    __int16 v73 = 2113;
    long long v74 = v23;
    __int16 v75 = 2113;
    id v76 = v8;
    _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager didChangeScenarioClass\", \"sessionState\":\"%{private}@\", \"fromScenario\":\"%{private}@\", \"toScenario\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x3Au);
  }
  __int16 v24 = [(SAMonitoringSessionManager *)self deviceRecord];
  [v24 updateScenario:a4 forDeviceWithUUID:v8];

  uint64_t v25 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  int v26 = [v25 objectForKeyedSubscript:v8];
  [v26 setScenario:a4];

  BOOL v27 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v28 = [v27 objectForKeyedSubscript:v8];
  uint64_t v29 = [v28 state];

  int v30 = [(SAMonitoringSessionManager *)self withYouDetector];
  uint64_t v31 = [v30 statusForDeviceWithUUID:v8];

  if (a4 - 2 < 3 || !a4)
  {
    switch(a3)
    {
      case 3uLL:
        BOOL v38 = [(SAMonitoringSessionManager *)self standby];
        int v39 = TASALog;
        BOOL v40 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
        if (!v38 && (v29 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          if (v40)
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v66 = 0;
            __int16 v67 = 2082;
            long long v68 = "";
            __int16 v69 = 2113;
            id v70 = v8;
            _os_log_impl(&dword_1D15FC000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting a terminable long aggressive scan to find tracked device when ending traveling scenario\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          long long v36 = [(SAMonitoringSessionManager *)self withYouDetector];
          id v63 = v8;
          __int16 v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
          __int16 v42 = v36;
          __int16 v43 = v41;
          uint64_t v44 = 2;
          goto LABEL_36;
        }
        if (v40)
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v66 = 0;
          __int16 v67 = 2082;
          long long v68 = "";
          __int16 v69 = 2113;
          id v70 = v8;
          _os_log_impl(&dword_1D15FC000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, ending traveling scenario and device is not tracked\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        long long v36 = [(SAMonitoringSessionManager *)self withYouDetector];
        BOOL v48 = [(SAMonitoringSessionManager *)self isAnyTrackedWhileTraveling];
        break;
      case 2uLL:
        BOOL v45 = [(SAMonitoringSessionManager *)self standby];
        uint64_t v46 = TASALog;
        BOOL v47 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
        if (!v45 && v29 == 5)
        {
          if (v47)
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v66 = 0;
            __int16 v67 = 2082;
            long long v68 = "";
            __int16 v69 = 2113;
            id v70 = v8;
            _os_log_impl(&dword_1D15FC000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting a terminable long aggressive scan to find tracked device when exiting unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          long long v36 = [(SAMonitoringSessionManager *)self withYouDetector];
          id v64 = v8;
          __int16 v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
          __int16 v42 = v36;
          __int16 v43 = v41;
          uint64_t v44 = 1;
LABEL_36:
          [v42 forceUpdateWithYouStatusToFindDevices:v43 withContext:v44];

LABEL_45:
          goto LABEL_46;
        }
        if (v47)
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v66 = 0;
          __int16 v67 = 2082;
          long long v68 = "";
          __int16 v69 = 2113;
          id v70 = v8;
          _os_log_impl(&dword_1D15FC000, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, exiting unsafe location and device is not tracked\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        long long v36 = [(SAMonitoringSessionManager *)self withYouDetector];
        BOOL v48 = [(SAMonitoringSessionManager *)self isAnyInTrackedInUnsafeLocation];
        break;
      case 1uLL:
        uint64_t v34 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v66 = 0;
          __int16 v67 = 2082;
          long long v68 = "";
          __int16 v69 = 2113;
          id v70 = v8;
          _os_log_impl(&dword_1D15FC000, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting short aggressive scan, exiting safe location for device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
        }
        long long v35 = [(SAMonitoringSessionManager *)self withYouDetector];
        long long v36 = v35;
        BOOL v37 = 0;
        goto LABEL_44;
      default:
LABEL_46:
        switch(a4)
        {
          case 0uLL:
          case 4uLL:
            goto LABEL_55;
          case 1uLL:
            goto LABEL_47;
          case 2uLL:
            long long v51 = [(SAMonitoringSessionManager *)self analytics];
            [v51 setInTravelState:0];

            long long v52 = [(SAMonitoringSessionManager *)self analytics];
            [v52 setInSafeLocationState:0];

            long long v53 = [(SAMonitoringSessionManager *)self analytics];
            long long v54 = v53;
            uint64_t v55 = 1;
            goto LABEL_57;
          case 3uLL:
            long long v56 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];

            if (v56)
            {
              long long v57 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                long long v58 = v57;
                long long v59 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
                *(_DWORD *)uint64_t buf = 68289283;
                int v66 = 0;
                __int16 v67 = 2082;
                long long v68 = "";
                __int16 v69 = 2113;
                id v70 = v59;
                _os_log_impl(&dword_1D15FC000, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager removing currentVisitOrLOIEvent due to scenario change\", \"currentVisitOrLOIEvent\":\"%{private}@\"}", buf, 0x1Cu);
              }
              long long v60 = [(SAMonitoringSessionManager *)self currentVisitOrLOIEvent];
              [(SAMonitoringSessionManager *)self setPreviousVisitOrLOIEvent:v60];

              [(SAMonitoringSessionManager *)self setCurrentVisitOrLOIEvent:0];
            }
            long long v61 = [(SAMonitoringSessionManager *)self analytics];
            [v61 setInTravelState:1];

LABEL_55:
            long long v62 = [(SAMonitoringSessionManager *)self analytics];
            [v62 setInSafeLocationState:0];

            if (![(SAMonitoringSessionManager *)self anyDeviceInUnsafeLocation]) {
              goto LABEL_56;
            }
            goto LABEL_58;
          default:
            goto LABEL_58;
        }
    }
    BOOL v37 = v48;
    long long v35 = v36;
LABEL_44:
    [v35 forceUpdateWithYouStatusWithShortScan:v37];
    goto LABEL_45;
  }
  if (a4 == 1)
  {
    __int16 v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v66 = 0;
      __int16 v67 = 2082;
      long long v68 = "";
      __int16 v69 = 2113;
      id v70 = v8;
      _os_log_impl(&dword_1D15FC000, v32, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not requesting aggressive scan, entering safe location for device\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
    }
    uint64_t v33 = v31 == 1 ? 1 : 2;
    [(SAMonitoringSessionManager *)self updatedWithYouStatusFrom:v33 to:v33 forDeviceWithUUID:v8];
LABEL_47:
    if ([(SAMonitoringSessionManager *)self allDevicesInSafeLocation])
    {
      id v49 = [(SAMonitoringSessionManager *)self analytics];
      [v49 setInTravelState:0];

      uint64_t v50 = [(SAMonitoringSessionManager *)self analytics];
      [v50 setInSafeLocationState:1];

LABEL_56:
      long long v53 = [(SAMonitoringSessionManager *)self analytics];
      long long v54 = v53;
      uint64_t v55 = 0;
LABEL_57:
      [v53 setInUnsafeLocationState:v55];
    }
  }
LABEL_58:
  [(SAMonitoringSessionManager *)self scheduleNextPersistenceWrite];
LABEL_59:
}

- (BOOL)isAnyInTrackedInUnsafeLocation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_deviceUUIDtoMonitoringSession allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) state] == 5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAnyTrackedWhileTraveling
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMutableDictionary *)self->_deviceUUIDtoMonitoringSession allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 state] == 1 || objc_msgSend(v7, "state") == 3)
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAMonitoringSessionManager *)self clients];
  [v5 addObject:v4];

  [(SAMonitoringSessionManager *)self configureBackgroundScanning];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self clients];
  [v5 removeObject:v4];
}

- (unint64_t)stateForDeviceUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 state];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)scenarioClassForDeviceUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 scenario];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)earlyVehicularTriggerForDeviceUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int64_t v7 = [v6 earlyVehicularTrigger];
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

+ (id)convertSAMonitoringSessionStateToString:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E68D73A8[a3 - 1];
  }
}

- (void)didForceUpdateWithYouStatus
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_deviceUUIDtoMonitoringSession allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 68289283;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = -[SAWithYouDetectorServiceProtocol statusForDeviceWithUUID:](self->_withYouDetector, "statusForDeviceWithUUID:", v9, v17);
        uint64_t v11 = v10;
        if ((unint64_t)(v10 - 1) < 2)
        {
          [(SAMonitoringSessionManager *)self updatedWithYouStatusFrom:v10 to:v10 forDeviceWithUUID:v9];
          continue;
        }
        if ((unint64_t)(v10 - 3) >= 2)
        {
          if (v10) {
            continue;
          }
          uint64_t v15 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v17;
            int v23 = 0;
            __int16 v24 = 2082;
            uint64_t v25 = "";
            __int16 v26 = 2113;
            uint64_t v27 = v9;
            _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager got unknown with-you status\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
        }
        else
        {
          long long v12 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = v12;
            uint64_t v14 = +[SAWithYouDetector convertSAWithYouStatusToString:v11];
            *(_DWORD *)uint64_t buf = 68289539;
            int v23 = 0;
            __int16 v24 = 2082;
            uint64_t v25 = "";
            __int16 v26 = 2113;
            uint64_t v27 = v9;
            __int16 v28 = 2113;
            uint64_t v29 = v14;
            _os_log_impl(&dword_1D15FC000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager got to be verified with-you status at the end of a force update\", \"uuid\":\"%{private}@\", \"status\":\"%{private}@\"}", buf, 0x26u);
          }
        }
        uint64_t v16 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
        [(SAMonitoringSessionManager *)self scheduleNextForceUpdateWithYouStatusFromReferenceDate:v16 forAlertForDevice:v9 alertType:0];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v6);
  }
}

- (void)checkReunion:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(SAMonitoringSessionManager *)self deviceUUIDtoAlertContext];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    uint64_t v11 = [(SAMonitoringSessionManager *)self deviceUUIDtoAlertContext];
    long long v12 = [v11 objectForKeyedSubscript:v8];

    long long v13 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    uint64_t v14 = [v12 objectForKeyedSubscript:@"lastAlert"];
    [v13 timeIntervalSinceDate:v14];
    double v16 = v15;

    if (v16 <= 86400.0)
    {
      if (a3 != 2 || a4 != 1)
      {
LABEL_24:

        goto LABEL_25;
      }
      BOOL v37 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289283;
        __int16 v81 = 2082;
        uint64_t v82 = "";
        __int16 v83 = 2113;
        id v84 = v8;
        _os_log_impl(&dword_1D15FC000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager reunion update\", \"uuid\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    long long v17 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v8];
    unint64_t v18 = [(SAMonitoringSessionManager *)self getMoreSpecificSADeviceType:v17];
    long long v19 = [v12 objectForKeyedSubscript:@"tLastWithYou"];
    [v19 doubleValue];
    double v21 = v20;

    BOOL v22 = v16 < 0.0 || v21 < 0.0;
    double v23 = -1.0;
    if (v22) {
      double v24 = -1.0;
    }
    else {
      double v24 = v16 + v21;
    }
    uint64_t v25 = [v12 objectForKeyedSubscript:@"lLastWithYou"];
    if (self->_lastLocation)
    {
      __int16 v26 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      uint64_t v27 = [(TALocationLite *)self->_lastLocation timestamp];
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;

      id v30 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [(TALocationLite *)self->_lastLocation latitude];
      double v32 = v31;
      [(TALocationLite *)self->_lastLocation longitude];
      uint64_t v34 = (void *)[v30 initWithLatitude:v32 longitude:v33];
      [v34 horizontalAccuracy];
      double v36 = v35;
    }
    else
    {
      uint64_t v34 = 0;
      double v29 = -1.0;
      double v36 = -1.0;
    }
    double v38 = -1.0;
    if (v25)
    {
      [v25 horizontalAccuracy];
      double v38 = v39;
      [v34 distanceFromLocation:v25];
      double v23 = v40;
    }
    __int16 v41 = [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v8];
    id v76 = v25;
    id v77 = v8;
    long long v74 = v41;
    __int16 v75 = v34;
    if (v41) {
      uint64_t v42 = [v41 getBatteryState];
    }
    else {
      uint64_t v42 = -1;
    }
    v78[0] = @"deviceType";
    __int16 v73 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v18];
    v79[0] = v73;
    v78[1] = @"productId";
    long long v72 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "productId"));
    v79[1] = v72;
    v78[2] = @"vendorId";
    __int16 v71 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "vendorId"));
    v79[2] = v71;
    v78[3] = @"tReunion";
    id v70 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
    v79[3] = v70;
    v78[4] = @"tLastObserved";
    __int16 v69 = [MEMORY[0x1E4F28ED0] numberWithDouble:v21];
    v79[4] = v69;
    v78[5] = @"tMissingAdv";
    long long v68 = [MEMORY[0x1E4F28ED0] numberWithDouble:v24];
    v79[5] = v68;
    v78[6] = @"leftBehindReunionDistance";
    __int16 v67 = [MEMORY[0x1E4F28ED0] numberWithDouble:v23];
    v79[6] = v67;
    v78[7] = @"reunionAge";
    int v66 = [MEMORY[0x1E4F28ED0] numberWithDouble:v29];
    v79[7] = v66;
    v78[8] = @"lastLeftBehindRadius";
    long long v65 = [MEMORY[0x1E4F28ED0] numberWithDouble:v38];
    v79[8] = v65;
    v78[9] = @"reunionRadius";
    id v64 = [MEMORY[0x1E4F28ED0] numberWithDouble:v36];
    v79[9] = v64;
    v78[10] = @"lastAlertType";
    id v63 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[10] = v63;
    v78[11] = @"lastAlertIsBookendingTravel";
    long long v62 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[11] = v62;
    v78[12] = @"lastAlertIsEarlyVehicularTrigger";
    long long v61 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[12] = v61;
    v78[13] = @"lastAlertVehicularState";
    long long v59 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[13] = v59;
    v78[14] = @"lastAlertIsVehicularBTHintOn";
    long long v58 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[14] = v58;
    v78[15] = @"classicallyConnected";
    long long v57 = [v12 objectForKeyedSubscript:@"lastAlertIsClassicallyConnected"];
    v79[15] = v57;
    v78[16] = @"noCaseAdvSuppressed";
    long long v56 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[16] = v56;
    v78[17] = @"lastBatteryStateBeforeAlert";
    __int16 v43 = [v12 objectForKeyedSubscript:@"lastAlertBatteryState"];
    v79[17] = v43;
    v78[18] = @"reunionBatteryState";
    uint64_t v44 = [MEMORY[0x1E4F28ED0] numberWithInteger:v42];
    v79[18] = v44;
    v78[19] = @"closeToAnySafeLocations";
    BOOL v45 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[19] = v45;
    v78[20] = @"systemVersion";
    uint64_t v46 = [v17 systemVersion];
    BOOL v47 = (void *)v46;
    BOOL v48 = @"unknown";
    if (v46) {
      BOOL v48 = (__CFString *)v46;
    }
    v79[20] = v48;
    v78[21] = @"timeSinceLastAlert";
    id v49 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[21] = v49;
    v78[22] = @"triggeredAtHome";
    uint64_t v50 = objc_msgSend(v12, "objectForKeyedSubscript:");
    v79[22] = v50;
    v78[23] = @"rssi";
    [v12 objectForKeyedSubscript:@"lastAlertRssiValue"];
    long long v51 = v60 = v17;
    v79[23] = v51;
    v78[24] = @"hasSurfacedInCurrentTravelingSession";
    long long v52 = [v12 objectForKeyedSubscript:@"travelingSuppressed"];
    v79[24] = v52;
    uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:25];

    long long v53 = [(SAMonitoringSessionManager *)self analytics];
    [v53 submitEvent:@"com.apple.clx.alert.reunionEvent" content:v55];

    long long v54 = [(SAMonitoringSessionManager *)self deviceUUIDtoAlertContext];
    id v8 = v77;
    [v54 setObject:0 forKeyedSubscript:v77];

    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)deviceShouldTransitionWithLastScenarioChangeDate:(id)a3 lastWithYouDate:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  return v4 >= 0.0;
}

- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [(SAMonitoringSessionManager *)self checkReunion:a3 to:a4 forDeviceWithUUID:v8];
  unint64_t v110 = a3;
  if (a3 != a4)
  {
    uint64_t v9 = [(SAMonitoringSessionManager *)self devicesWithPendingTransition];
    [v9 removeObject:v8];
  }
  unint64_t v113 = [(SAMonitoringSessionManager *)self stateForDeviceUUID:v8];
  unint64_t v112 = [(SAMonitoringSessionManager *)self scenarioClassForDeviceUUID:v8];
  uint64_t v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];
  long long v12 = [v11 scenarioClassifier];
  long long v13 = [v12 scenarioChangeDate];

  uint64_t v14 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v15 = [v14 objectForKeyedSubscript:v8];
  double v16 = [v15 travelingGeofenceExitDate];

  long long v17 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  unint64_t v18 = [v17 objectForKeyedSubscript:v8];
  long long v19 = [v18 earlyVehicularStateChangeDate];

  double v20 = [(SADeviceRecord *)self->_deviceRecord getLastWithYouDate:v8];
  double v21 = (void *)TASALog;
  v111 = self;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = v21;
    double v23 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:v113];
    v109 = v20;
    double v24 = v19;
    uint64_t v25 = v16;
    __int16 v26 = v13;
    id v27 = v8;
    double v28 = +[SAWithYouDetector convertSAWithYouStatusToString:v110];
    double v29 = +[SAWithYouDetector convertSAWithYouStatusToString:a4];
    id v30 = +[SAScenarioClassifier convertSAScenarioClassToString:v112];
    *(_DWORD *)uint64_t buf = 68290307;
    int v115 = 0;
    __int16 v116 = 2082;
    v117 = "";
    __int16 v118 = 2113;
    id v119 = v23;
    __int16 v120 = 2113;
    v121 = v28;
    __int16 v122 = 2113;
    v123 = v29;
    __int16 v124 = 2113;
    v125 = v30;
    __int16 v126 = 2113;
    id v127 = v27;
    _os_log_impl(&dword_1D15FC000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager updatedWithYouStatus\", \"sessionState\":\"%{private}@\", \"fromStatus\":\"%{private}@\", \"toStatus\":\"%{private}@\", \"scenario\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x44u);

    id v8 = v27;
    long long v13 = v26;
    double v16 = v25;
    long long v19 = v24;
    double v20 = v109;

    self = v111;
  }
  switch(a4)
  {
    case 0uLL:
      double v38 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        id v39 = v8;
        double v40 = v38;
        __int16 v41 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:v113];
        uint64_t v42 = +[SAWithYouDetector convertSAWithYouStatusToString:v110];
        __int16 v43 = +[SAWithYouDetector convertSAWithYouStatusToString:0];
        *(_DWORD *)uint64_t buf = 68290051;
        int v115 = 0;
        __int16 v116 = 2082;
        v117 = "";
        __int16 v118 = 2113;
        id v119 = v41;
        __int16 v120 = 2113;
        v121 = v42;
        __int16 v122 = 2113;
        v123 = v43;
        __int16 v124 = 2113;
        v125 = v39;
        _os_log_impl(&dword_1D15FC000, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager Unknown signal state\", \"sessionState\":\"%{private}@\", \"fromStatus\":\"%{private}@\", \"toStatus\":\"%{private}@\", \"uuid\":\"%{private}@\"}", buf, 0x3Au);

        id v8 = v39;
LABEL_100:
      }
      goto LABEL_132;
    case 2uLL:
      [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      v32 = id v31 = v8;
      double v33 = [v32 objectForKeyedSubscript:v31];
      uint64_t v34 = [v33 firstNotWithYouLocation];

      id v8 = v31;
      if (!v34)
      {
        double v35 = [(SAMonitoringSessionManager *)self lastLocation];
        double v36 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        BOOL v37 = [v36 objectForKeyedSubscript:v31];
        [v37 setFirstNotWithYouLocation:v35];

        id v8 = v31;
LABEL_13:
      }
      break;
    case 1uLL:
      double v35 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
      double v36 = [v35 objectForKeyedSubscript:v8];
      [v36 setFirstNotWithYouLocation:0];
      goto LABEL_13;
  }
  switch(v113)
  {
    case 1uLL:
      switch(v112)
      {
        case 3uLL:
          if ((a4 == 4 || a4 == 2)
            && ![(SAMonitoringSessionManager *)v111 standby]
            && ![(SAMonitoringSessionManager *)v111 isInAirplaneMode]
            && [(SAMonitoringSessionManager *)v111 addTravelFenceForDevice:v8])
          {
            [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:3];
          }
          [(SAMonitoringSessionManager *)v111 deviceUUIDtoMonitoringSession];
          v75 = id v74 = v8;
          id v76 = [v75 objectForKeyedSubscript:v74];
          [v76 setEarlyAirplaneTrigger:0];

          id v8 = v74;
          break;
        case 2uLL:
          if (a4 == 1)
          {
            uint64_t v46 = v111;
            if (![(SAMonitoringSessionManager *)v111 deviceShouldTransitionWithLastScenarioChangeDate:v13 lastWithYouDate:v20])goto LABEL_117; {
            [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:5];
            }
            [(SAMonitoringSessionManager *)v111 deviceUUIDtoMonitoringSession];
            __int16 v78 = v77 = v8;
            id v79 = [v78 objectForKeyedSubscript:v77];
            __int16 v80 = [v79 scenarioClassifier];
            __int16 v81 = [v80 currentUnsafeLocation];

            uint64_t v82 = [(SAMonitoringSessionManager *)v111 deviceRecord];
            id v83 = v77;
            id v84 = v111;
            [v82 updateLastWithYouLocation:v81 forDeviceWithUUID:v77];
          }
          else
          {
            if (v110 != 2 || a4 != 2) {
              goto LABEL_132;
            }
            id v84 = v111;
            if ([(SAMonitoringSessionManager *)v111 shouldIssueBookendedNotificationForDevice:v8])
            {
              if ([(SAMonitoringSessionManager *)v111 enoughTimeHasPassedBeforeSurfacingAlert:v13 forAlertForDevice:v8 alertType:2])
              {
                v92 = TASALog;
                if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t buf = 68289283;
                  int v115 = 0;
                  __int16 v116 = 2082;
                  v117 = "";
                  __int16 v118 = 2113;
                  id v119 = v8;
                  _os_log_impl(&dword_1D15FC000, v92, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
                }
                [(SAMonitoringSessionManager *)v111 storeSeparationLocation:v8];
                [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
                id v83 = v8;
                [(SAMonitoringSessionManager *)v111 notifyWhileTraveling:v8 isBookendingTravel:1];
              }
              else
              {
                id v83 = v8;
                [(SAMonitoringSessionManager *)v111 scheduleNextForceUpdateWithYouStatusFromReferenceDate:v13 forAlertForDevice:v8 alertType:2];
              }
            }
            else
            {
              v106 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 68289283;
                int v115 = 0;
                __int16 v116 = 2082;
                v117 = "";
                __int16 v118 = 2113;
                id v119 = v8;
                _os_log_impl(&dword_1D15FC000, v106, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
              }
              id v83 = v8;
              [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:5];
            }
          }
          if (([(SAMonitoringSessionManager *)v84 caBroughtOutOnTravel] & 0x8000000000000000) == 0)
          {
            v108 = [(SAMonitoringSessionManager *)v84 analytics];
            objc_msgSend(v108, "addNumDevicesWithYou:", -[SAMonitoringSessionManager caBroughtOutOnTravel](v84, "caBroughtOutOnTravel"));
          }
          [(SAMonitoringSessionManager *)v84 setCaBroughtOutOnTravel:-1];
          id v8 = v83;
          break;
        case 1uLL:
          if (a4 == 2)
          {
            uint64_t v44 = TASALog;
            BOOL v45 = v111;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289283;
              int v115 = 0;
              __int16 v116 = 2082;
              v117 = "";
              __int16 v118 = 2113;
              id v119 = v8;
              _os_log_impl(&dword_1D15FC000, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel bookending into a safe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }
            [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
            [(SAMonitoringSessionManager *)v111 removeTravelFenceForDevice:v8];
          }
          else
          {
            BOOL v45 = v111;
            [(SAMonitoringSessionManager *)v111 removeTravelFenceForDevice:v8];
            [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
          }
          if (([(SAMonitoringSessionManager *)v45 caBroughtOutOnTravel] & 0x8000000000000000) == 0)
          {
            [(SAMonitoringSessionManager *)v45 analytics];
            double v91 = v90 = v8;
            objc_msgSend(v91, "addNumDevicesWithYou:", -[SAMonitoringSessionManager caBroughtOutOnTravel](v45, "caBroughtOutOnTravel"));

            id v8 = v90;
          }
          BOOL v48 = v45;
          uint64_t v47 = -1;
          goto LABEL_85;
      }
      goto LABEL_132;
    case 2uLL:
      if (v112 == 2)
      {
        if (a4 == 1)
        {
          long long v65 = v111;
          if ([(SAMonitoringSessionManager *)v111 deviceShouldTransitionWithLastScenarioChangeDate:v13 lastWithYouDate:v20])
          {
            goto LABEL_61;
          }
          v98 = v111;
          goto LABEL_118;
        }
      }
      else if (v112 == 3)
      {
        uint64_t v46 = v111;
        if (a4 == 1)
        {
          if (![(SAMonitoringSessionManager *)v111 deviceShouldTransitionWithLastScenarioChangeDate:v13 lastWithYouDate:v20])goto LABEL_117; {
          [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:1];
          }
        }
        uint64_t v47 = [(SAMonitoringSessionManager *)v111 determineTrackedTravelingCount];
        BOOL v48 = v111;
LABEL_85:
        [(SAMonitoringSessionManager *)v48 setCaBroughtOutOnTravel:v47];
      }
      goto LABEL_132;
    case 3uLL:
      if (a4 == 1) {
        goto LABEL_53;
      }
      if (a4 == 2)
      {
        if (v112 == 2)
        {
          if (v110 == 2)
          {
            if (![(SAMonitoringSessionManager *)v111 shouldIssueBookendedNotificationForDevice:v8])
            {
              v107 = TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 68289283;
                int v115 = 0;
                __int16 v116 = 2082;
                v117 = "";
                __int16 v118 = 2113;
                id v119 = v8;
                _os_log_impl(&dword_1D15FC000, v107, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager not issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
              }
              int v66 = v111;
              id v88 = v8;
              uint64_t v89 = 5;
              goto LABEL_114;
            }
            if (![(SAMonitoringSessionManager *)v111 enoughTimeHasPassedBeforeSurfacingAlert:v13 forAlertForDevice:v8 alertType:2])
            {
              v98 = v111;
              v103 = v13;
              goto LABEL_136;
            }
            v97 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289283;
              int v115 = 0;
              __int16 v116 = 2082;
              v117 = "";
              __int16 v118 = 2113;
              id v119 = v8;
              _os_log_impl(&dword_1D15FC000, v97, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager issuing travel bookending notification into an unsafe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }
            [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
            uint64_t v93 = v111;
            id v94 = v8;
            uint64_t v95 = 1;
            goto LABEL_107;
          }
        }
        else if (v112 == 1)
        {
          id v49 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v115 = 0;
            __int16 v116 = 2082;
            v117 = "";
            __int16 v118 = 2113;
            id v119 = v8;
            _os_log_impl(&dword_1D15FC000, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager travel bookending into a safe location\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
          [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
          [(SAMonitoringSessionManager *)v111 removeTravelFenceForDevice:v8];
        }
      }
      goto LABEL_132;
    case 4uLL:
      if (a4 - 3 < 2)
      {
        __int16 v67 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
        {
          id v60 = v8;
          double v40 = v67;
          long long v61 = +[SAWithYouDetector convertSAWithYouStatusToString:a4];
          *(_DWORD *)uint64_t buf = 68289539;
          int v115 = 0;
          __int16 v116 = 2082;
          v117 = "";
          __int16 v118 = 2113;
          id v119 = v60;
          __int16 v120 = 2113;
          v121 = v61;
          long long v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager received unexpected status in verification stage\", \""
                "uuid\":\"%{private}@\", \"status\":\"%{private}@\"}";
          goto LABEL_98;
        }
      }
      else if (a4 == 1)
      {
LABEL_53:
        long long v65 = v111;
        [(SAMonitoringSessionManager *)v111 removeTravelFenceForDevice:v8];
        switch(v112)
        {
          case 3uLL:
            int v66 = v111;
            goto LABEL_80;
          case 2uLL:
LABEL_61:
            [(SAMonitoringSessionManager *)v65 changeMonitoringSessionState:v8 toState:5];
            [(SAMonitoringSessionManager *)v65 deviceUUIDtoMonitoringSession];
            v69 = id v68 = v8;
            id v70 = [v69 objectForKeyedSubscript:v68];
            __int16 v71 = [v70 scenarioClassifier];
            long long v72 = [v71 currentUnsafeLocation];

            __int16 v73 = [(SAMonitoringSessionManager *)v65 deviceRecord];
            [v73 updateLastWithYouLocation:v72 forDeviceWithUUID:v68];

            id v8 = v68;
            break;
          case 1uLL:
            int v66 = v111;
            goto LABEL_113;
        }
      }
      else if (a4 == 2)
      {
        if (v112 == 1)
        {
          uint64_t v50 = v111;
          [(SAMonitoringSessionManager *)v111 removeTravelFenceForDevice:v8];
          goto LABEL_112;
        }
        if (v110 == 2)
        {
          if (![(SAMonitoringSessionManager *)v111 enoughTimeHasPassedBeforeSurfacingAlert:v16 forAlertForDevice:v8 alertType:2])
          {
            v98 = v111;
            v103 = v16;
LABEL_136:
            id v104 = v8;
            uint64_t v105 = 2;
            goto LABEL_119;
          }
          [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v8 toState:2];
          uint64_t v93 = v111;
          id v94 = v8;
          uint64_t v95 = 0;
LABEL_107:
          [(SAMonitoringSessionManager *)v93 notifyWhileTraveling:v94 isBookendingTravel:v95];
        }
      }
      goto LABEL_132;
    case 5uLL:
      if (v112 == 1)
      {
        if (a4 == 2)
        {
          uint64_t v85 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v115 = 0;
            __int16 v116 = 2082;
            v117 = "";
            __int16 v118 = 2113;
            id v119 = v8;
            _os_log_impl(&dword_1D15FC000, v85, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager lost from unsafe to safe\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }
        }
        int v66 = v111;
        goto LABEL_113;
      }
      if (v112 == 2)
      {
        if (a4 != 2) {
          goto LABEL_132;
        }
        double v86 = [(SAMonitoringSessionManager *)v111 deviceUUIDtoMonitoringSession];
        v87 = [v86 objectForKeyedSubscript:v8];
        if ([v87 earlyVehicularTrigger])
        {
        }
        else
        {
          [(SAMonitoringSessionManager *)v111 deviceUUIDtoMonitoringSession];
          v100 = id v99 = v8;
          uint64_t v101 = [v100 objectForKeyedSubscript:v99];
          int v102 = [v101 earlyAirplaneTrigger];

          id v8 = v99;
          if (!v102) {
            goto LABEL_132;
          }
        }
        uint64_t v50 = v111;
        if (![(SAMonitoringSessionManager *)v111 enoughTimeHasPassedBeforeSurfacingAlert:v19 forAlertForDevice:v8 alertType:1])
        {
          v98 = v111;
          v103 = v19;
          id v104 = v8;
          uint64_t v105 = 1;
          goto LABEL_119;
        }
        [(SAMonitoringSessionManager *)v111 storeSeparationLocation:v8];
        [(SAMonitoringSessionManager *)v111 notifyEarlyLeftBehind:v8];
LABEL_112:
        int v66 = v50;
LABEL_113:
        id v88 = v8;
        uint64_t v89 = 2;
LABEL_114:
        [(SAMonitoringSessionManager *)v66 changeMonitoringSessionState:v88 toState:v89];
        goto LABEL_132;
      }
      if (v112 != 3) {
        goto LABEL_132;
      }
      if (a4 - 3 >= 2)
      {
        if (a4 != 1)
        {
          if (a4 == 2 && v110 == 2)
          {
            id v51 = v13;
            long long v52 = [(SAMonitoringSessionManager *)v111 deviceUUIDtoMonitoringSession];
            id v53 = v8;
            long long v54 = v52;
            uint64_t v55 = v53;
            long long v56 = objc_msgSend(v52, "objectForKeyedSubscript:");
            int v57 = [v56 earlyVehicularTrigger];

            if (v57)
            {
              uint64_t v58 = [v19 earlierDate:v51];

              id v51 = (id)v58;
            }
            id v8 = v55;
            if ([(SAMonitoringSessionManager *)v111 enoughTimeHasPassedBeforeSurfacingAlert:v51 forAlertForDevice:v55 alertType:1])
            {
              [(SAMonitoringSessionManager *)v111 storeSeparationLocation:v55];
              [(SAMonitoringSessionManager *)v111 notifyWhenLeftBehind:v55];
              [(SAMonitoringSessionManager *)v111 changeMonitoringSessionState:v55 toState:2];
            }
            else
            {
              [(SAMonitoringSessionManager *)v111 scheduleNextForceUpdateWithYouStatusFromReferenceDate:v51 forAlertForDevice:v55 alertType:1];
            }
          }
          goto LABEL_132;
        }
        uint64_t v46 = v111;
        if ([(SAMonitoringSessionManager *)v111 deviceShouldTransitionWithLastScenarioChangeDate:v13 lastWithYouDate:v20])
        {
          int v66 = v111;
LABEL_80:
          id v88 = v8;
          uint64_t v89 = 1;
          goto LABEL_114;
        }
LABEL_117:
        v98 = v46;
LABEL_118:
        v103 = 0;
        id v104 = v8;
        uint64_t v105 = 0;
LABEL_119:
        [(SAMonitoringSessionManager *)v98 scheduleNextForceUpdateWithYouStatusFromReferenceDate:v103 forAlertForDevice:v104 alertType:v105];
        goto LABEL_132;
      }
      double v96 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        id v60 = v8;
        double v40 = v96;
        long long v61 = +[SAWithYouDetector convertSAWithYouStatusToString:a4];
        *(_DWORD *)uint64_t buf = 68289539;
        int v115 = 0;
        __int16 v116 = 2082;
        v117 = "";
        __int16 v118 = 2113;
        id v119 = v60;
        __int16 v120 = 2113;
        v121 = v61;
        long long v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager received unexpected status in left location stage\", \""
              "uuid\":\"%{private}@\", \"status\":\"%{private}@\"}";
LABEL_98:
        id v63 = v40;
        os_log_type_t v64 = OS_LOG_TYPE_ERROR;
        goto LABEL_99;
      }
LABEL_132:

      return;
    case 6uLL:
      long long v59 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        id v60 = v8;
        double v40 = v59;
        long long v61 = +[SAMonitoringSessionManager convertSAMonitoringSessionStateToString:6];
        *(_DWORD *)uint64_t buf = 68289539;
        int v115 = 0;
        __int16 v116 = 2082;
        v117 = "";
        __int16 v118 = 2113;
        id v119 = v61;
        __int16 v120 = 2113;
        v121 = v60;
        long long v62 = "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager session already finished\", \"sessionState\":\"%{privat"
              "e}@\", \"uuid\":\"%{private}@\"}";
        id v63 = v40;
        os_log_type_t v64 = OS_LOG_TYPE_FAULT;
LABEL_99:
        _os_log_impl(&dword_1D15FC000, v63, v64, v62, buf, 0x26u);

        id v8 = v60;
        goto LABEL_100;
      }
      goto LABEL_132;
    default:
      goto LABEL_132;
  }
}

- (id)getLastScenarioChangeDateAmongAllDevices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v4 = [v3 allKeys];

  long long v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
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
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
        long long v13 = [v12 objectForKeyedSubscript:v11];

        uint64_t v14 = [v13 scenarioClassifier];
        double v15 = [v14 scenarioChangeDate];

        if ([v5 compare:v15] == -1)
        {
          id v16 = v15;

          long long v5 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)scheduleNextForceUpdateWithYouStatusFromReferenceDate:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5
{
  id v22 = a3;
  id v8 = a4;
  uint64_t v9 = [(SAMonitoringSessionManager *)self devicesWithPendingTransition];
  [v9 addObject:v8];

  if (!self->_scheduledAlarmForForceUpdateWithYouStatus)
  {
    uint64_t v10 = (uint64_t)v22;
    if (!v22)
    {
      uint64_t v10 = [(SAMonitoringSessionManager *)self getLastScenarioChangeDateAmongAllDevices];
    }
    id v22 = (id)v10;
    if ([(SAMonitoringSessionManager *)self _isOnlyMonitoringCompanionDevice])
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
      double v12 = 30.0;
    }
    else
    {
      if ([(SAMonitoringSessionManager *)self standby]) {
        double v13 = 6.0;
      }
      else {
        double v13 = 39.0;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
      [(SAMonitoringSessionManager *)self timeDelayForRetryScanForAlertForDeviceUUID:v8 alertType:a5];
      double v12 = v15 - v13;
      uint64_t v11 = v14;
    }
    id v16 = [v11 dateWithTimeInterval:v22 sinceDate:v12];
    long long v17 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    uint64_t v18 = [v16 compare:v17];

    if (v18 == -1)
    {
      BOOL v20 = [(SAMonitoringSessionManager *)self standby];
      long long v21 = [(SAMonitoringSessionManager *)self withYouDetector];
      long long v19 = v21;
      if (v20) {
        [v21 forceUpdateWithYouStatusWithShortScan:0];
      }
      else {
        [v21 forceUpdateWithYouStatus];
      }
    }
    else
    {
      long long v19 = [(SATimeServiceProtocol *)self->_clock setupAlarmFireAt:v16 forClient:self];
      [(SAMonitoringSessionManager *)self setScheduledAlarmForForceUpdateWithYouStatus:v19];
    }
  }
}

- (BOOL)_isOnlyMonitoringCompanionDevice
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
  double v4 = [v3 allKeys];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v10, (void)v16);

        if (v11)
        {
          double v12 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v10];
          uint64_t v13 = [v12 deviceType];

          if (v13 != 8)
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)scheduleNextPersistenceWrite
{
  uint64_t v3 = [(SAMonitoringSessionManager *)self nextScheduledAlarmForPersistenceWrite];

  if (!v3)
  {
    id v8 = [(SAMonitoringSessionManager *)self clock];
    double v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    uint64_t v6 = [v4 dateWithTimeInterval:v5 sinceDate:1.0];
    uint64_t v7 = [v8 setupAlarmFireAt:v6 forClient:self];
    [(SAMonitoringSessionManager *)self setNextScheduledAlarmForPersistenceWrite:v7];
  }
}

- (double)timeDelayForRetryScanForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SAMonitoringSessionManager *)self devices];
  id v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [(SAWithYouDetectorServiceProtocol *)self->_withYouDetector statusForDeviceWithUUID:v6];
  uint64_t v10 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 68289795;
    v13[1] = 0;
    __int16 v14 = 2082;
    double v15 = "";
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2049;
    unint64_t v19 = a4;
    __int16 v20 = 2049;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager schedule retry scan\", \"uuid\":\"%{private}@\", \"alertType\":%{private}ld, \"withYouStatus\":%{private}ld}", (uint8_t *)v13, 0x30u);
  }
  if (![v8 isAppleAudioAccessory]
    || (double v11 = 360.0, a4 != 2) && (a4 || (v9 & 0xFFFFFFFFFFFFFFFBLL) != 0))
  {
    double v11 = 120.0;
  }

  return v11;
}

- (BOOL)enoughTimeHasPassedBeforeSurfacingAlert:(id)a3 forAlertForDevice:(id)a4 alertType:(unint64_t)a5
{
  if (!a3) {
    return 1;
  }
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(SAMonitoringSessionManager *)self clock];
  double v11 = [v10 getCurrentTime];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;

  [(SAMonitoringSessionManager *)self minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:v8 alertType:a5];
  double v15 = v14;

  BOOL v16 = v13 >= v15;
  return v16;
}

- (double)minimumTimeSinceScenarioTransitionForAlertForDeviceUUID:(id)a3 alertType:(unint64_t)a4
{
  id v5 = [(SADeviceRecord *)self->_deviceRecord getSADevice:a3];
  uint64_t v6 = [v5 deviceType];
  unsigned __int8 v7 = [v5 isAppleAudioAccessory];
  double v8 = 108.0;
  if (v6 != 16) {
    double v8 = 30.0;
  }
  if (((a4 == 2) & v7) != 0) {
    double v9 = 324.0;
  }
  else {
    double v9 = v8;
  }

  return v9;
}

- (void)alarmFiredForUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqual:self->_nextScheduledAlarmForPersistenceWrite])
  {
    persistenceManager = self->_persistenceManager;
    uint64_t v6 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    [(SAPersistenceManager *)persistenceManager onUpdatedMonitoringSessionRecord:v6];

    nextScheduledAlarmForPersistenceWrite = self->_nextScheduledAlarmForPersistenceWrite;
    self->_nextScheduledAlarmForPersistenceWrite = 0;
  }
  if ([v4 isEqual:self->_scheduledAlarmForForceUpdateWithYouStatus])
  {
    double v8 = [(SAMonitoringSessionManager *)self devicesWithPendingTransition];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      BOOL v10 = [(SAMonitoringSessionManager *)self standby];
      double v11 = TASALog;
      BOOL v12 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          int v17 = 68289026;
          int v18 = 0;
          __int16 v19 = 2082;
          __int16 v20 = "";
          _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager alarm fired while standby, requesting short aggressive scan\"}", (uint8_t *)&v17, 0x12u);
        }
        [(SAWithYouDetectorServiceProtocol *)self->_withYouDetector forceUpdateWithYouStatusWithShortScan:0];
      }
      else
      {
        if (v12)
        {
          int v17 = 68289283;
          int v18 = 0;
          __int16 v19 = 2082;
          __int16 v20 = "";
          __int16 v21 = 2049;
          uint64_t v22 = v9;
          _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager alarm fired while not standby, requesting a terminable long aggressive scan\", \"devices pending transition count\":%{private}ld}", (uint8_t *)&v17, 0x1Cu);
        }
        withYouDetector = self->_withYouDetector;
        double v14 = [(SAMonitoringSessionManager *)self devicesWithPendingTransition];
        double v15 = [v14 allObjects];
        [(SAWithYouDetectorServiceProtocol *)withYouDetector forceUpdateWithYouStatusToFindDevices:v15 withContext:8];
      }
    }
    scheduledAlarmForForceUpdateWithYouStatus = self->_scheduledAlarmForForceUpdateWithYouStatus;
    self->_scheduledAlarmForForceUpdateWithYouStatus = 0;
  }
}

- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  [(SAMonitoringSessionManager *)self setCaCurrentVehicularState:a4];
  [(SAMonitoringSessionManager *)self setCaIsVehicularBTHintOn:(a5 >> 4) & 1];
  BOOL v8 = [(SAMonitoringSessionManager *)self standby];
  if (a4 == 1 && !v8 && [(SAMonitoringSessionManager *)self enabled])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v10 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    double v11 = [v10 allKeys];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v37;
      *(void *)&long long v13 = 68289026;
      long long v34 = v13;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
          int v18 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
          __int16 v19 = [v18 objectForKeyedSubscript:v17];

          __int16 v20 = [(SAMonitoringSessionManager *)self devices];
          __int16 v21 = [v20 objectForKeyedSubscript:v17];

          if (v21)
          {
            if ([v19 state] == 5)
            {
              [v19 setEarlyVehicularTrigger:1];
              uint64_t v22 = [(SAMonitoringSessionManager *)self clock];
              uint64_t v23 = [v22 getCurrentTime];
              [v19 setEarlyVehicularStateChangeDate:v23];

              [v9 addObject:v17];
            }
          }
          else
          {
            double v24 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = v34;
              int v45 = 0;
              __int16 v46 = 2082;
              uint64_t v47 = "";
              _os_log_impl(&dword_1D15FC000, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAMonitoringSessionManager device found in monitoringSession list, but not in devices list\"}", buf, 0x12u);
            }
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v14);
    }

    uint64_t v25 = [v9 count];
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289283;
        int v45 = 0;
        __int16 v46 = 2082;
        uint64_t v47 = "";
        __int16 v48 = 2049;
        uint64_t v49 = v26;
        _os_log_impl(&dword_1D15FC000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMonitoringSessionManager requesting terminable long aggressive scan on travel type change\", \"count of devices to find\":%{private}ld}", buf, 0x1Cu);
      }
      double v28 = [(SAMonitoringSessionManager *)self withYouDetector];
      [v28 forceUpdateWithYouStatusToFindDevices:v9 withContext:7];
    }
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v29 = [(SAMonitoringSessionManager *)self deviceUUIDtoMonitoringSession];
    id v9 = [v29 allValues];

    uint64_t v30 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v41;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v33++) setEarlyVehicularTrigger:0];
        }
        while (v31 != v33);
        uint64_t v31 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v31);
    }
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)standby
{
  return self->_standby;
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (SAWithYouDetectorServiceProtocol)withYouDetector
{
  return self->_withYouDetector;
}

- (void)setWithYouDetector:(id)a3
{
}

- (SAGeoFenceRequestProtocol)fenceRequestServicer
{
  return self->_fenceRequestServicer;
}

- (void)setFenceRequestServicer:(id)a3
{
}

- (SAFenceManagerServiceProtocol)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableDictionary)deviceUUIDtoMonitoringSession
{
  return self->_deviceUUIDtoMonitoringSession;
}

- (void)setDeviceUUIDtoMonitoringSession:(id)a3
{
}

- (TALocationLite)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (SATravelTypeClassifierServiceProtocol)travelTypeClassifier
{
  return self->_travelTypeClassifier;
}

- (void)setTravelTypeClassifier:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableDictionary)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
}

- (NSMutableDictionary)deviceUUIDtoSafeLocationUUIDs
{
  return self->_deviceUUIDtoSafeLocationUUIDs;
}

- (void)setDeviceUUIDtoSafeLocationUUIDs:(id)a3
{
}

- (BOOL)requestedPeriodicScan
{
  return self->_requestedPeriodicScan;
}

- (void)setRequestedPeriodicScan:(BOOL)a3
{
  self->_requestedPeriodicScauint64_t n = a3;
}

- (unint64_t)disabledReasons
{
  return self->_disabledReasons;
}

- (void)setDisabledReasons:(unint64_t)a3
{
  self->_unint64_t disabledReasons = a3;
}

- (NSMutableDictionary)caLastAlertDate
{
  return self->_caLastAlertDate;
}

- (void)setCaLastAlertDate:(id)a3
{
}

- (int64_t)caBroughtOutOnTravel
{
  return self->_caBroughtOutOnTravel;
}

- (void)setCaBroughtOutOnTravel:(int64_t)a3
{
  self->_caBroughtOutOnTravel = a3;
}

- (NSMutableDictionary)deviceUUIDtoAlertContext
{
  return self->_deviceUUIDtoAlertContext;
}

- (void)setDeviceUUIDtoAlertContext:(id)a3
{
}

- (unint64_t)caCurrentVehicularState
{
  return self->_caCurrentVehicularState;
}

- (void)setCaCurrentVehicularState:(unint64_t)a3
{
  self->_caCurrentVehicularState = a3;
}

- (BOOL)caIsVehicularBTHintOn
{
  return self->_caIsVehicularBTHintOn;
}

- (void)setCaIsVehicularBTHintOn:(BOOL)a3
{
  self->_caIsVehicularBTHintOuint64_t n = a3;
}

- (SAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (SAAudioAccessory)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
}

- (NSUUID)nextScheduledAlarmForPersistenceWrite
{
  return self->_nextScheduledAlarmForPersistenceWrite;
}

- (void)setNextScheduledAlarmForPersistenceWrite:(id)a3
{
}

- (NSUUID)scheduledAlarmForForceUpdateWithYouStatus
{
  return self->_scheduledAlarmForForceUpdateWithYouStatus;
}

- (void)setScheduledAlarmForForceUpdateWithYouStatus:(id)a3
{
}

- (TAEventProtocol)currentVisitOrLOIEvent
{
  return self->_currentVisitOrLOIEvent;
}

- (void)setCurrentVisitOrLOIEvent:(id)a3
{
}

- (TAEventProtocol)previousVisitOrLOIEvent
{
  return self->_previousVisitOrLOIEvent;
}

- (void)setPreviousVisitOrLOIEvent:(id)a3
{
}

- (NSDate)timeOfAttemptToLoadFromPersistence
{
  return self->_timeOfAttemptToLoadFromPersistence;
}

- (void)setTimeOfAttemptToLoadFromPersistence:(id)a3
{
}

- (BOOL)isCompanionConnected
{
  return self->_isCompanionConnected;
}

- (void)setIsCompanionConnected:(BOOL)a3
{
  self->_isCompanionConnected = a3;
}

- (void)setDevicesWithToBePopulatedTrackedTravelingStartLocation:(id)a3
{
}

- (NSMutableSet)devicesWithPendingTransition
{
  return self->_devicesWithPendingTransition;
}

- (void)setDevicesWithPendingTransition:(id)a3
{
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  self->_BOOL isInAirplaneMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesWithPendingTransition, 0);
  objc_storeStrong((id *)&self->_devicesWithToBePopulatedTrackedTravelingStartLocation, 0);
  objc_storeStrong((id *)&self->_timeOfAttemptToLoadFromPersistence, 0);
  objc_storeStrong((id *)&self->_previousVisitOrLOIEvent, 0);
  objc_storeStrong((id *)&self->_currentVisitOrLOIEvent, 0);
  objc_storeStrong((id *)&self->_scheduledAlarmForForceUpdateWithYouStatus, 0);
  objc_storeStrong((id *)&self->_nextScheduledAlarmForPersistenceWrite, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoAlertContext, 0);
  objc_storeStrong((id *)&self->_caLastAlertDate, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoSafeLocationUUIDs, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_travelTypeClassifier, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_deviceUUIDtoMonitoringSession, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_fenceRequestServicer, 0);
  objc_storeStrong((id *)&self->_withYouDetector, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

- (void)setSafeLocations:(void *)a3 forDeviceUUID:(void *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  unsigned __int8 v7 = a2;
  BOOL v8 = [a3 UUIDString];
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_error_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "#SAMonitoringSessionManager attempted adding non-existing location, for deviceId, %{private}@", a1, 0xCu);
}

@end