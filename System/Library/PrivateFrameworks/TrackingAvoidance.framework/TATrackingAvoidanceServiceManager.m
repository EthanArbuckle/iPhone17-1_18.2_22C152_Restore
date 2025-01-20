@interface TATrackingAvoidanceServiceManager
+ (id)managerStateToString:(unint64_t)a3;
- (BOOL)_shouldSuspendAvengerScanner;
- (BOOL)_shouldTerminateService;
- (NSHashTable)dataSources;
- (NSHashTable)observers;
- (NSUUID)sessionID;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (TAAnalyticsManager)analyticsManager;
- (TAPersistenceManager)persistenceManager;
- (TASettings)serviceSettings;
- (TATrackingAvoidanceService)service;
- (TATrackingAvoidanceServiceManager)initWithQueue:(id)a3 settings:(id)a4;
- (TATrackingAvoidanceServiceStateContext)stateContext;
- (unint64_t)persistenceManagerLastSaveTime;
- (unint64_t)state;
- (void)_changeSession;
- (void)_fetchAndIngestLastVisit;
- (void)_fetchAndIngestNextPredictedLocationOfInterestFromLocation:(id)a3 startDate:(id)a4 interval:(double)a5;
- (void)_fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState;
- (void)_fetchStoreAndSave;
- (void)_handleStateUpdateIfNecessary;
- (void)_loadAndBootstrap;
- (void)_onAirplaneMode:(BOOL)a3;
- (void)_onAllowSimulatedEvents:(BOOL)a3;
- (void)_onBatterySaverMode:(BOOL)a3;
- (void)_onDeviceUnlockedSinceBoot:(BOOL)a3;
- (void)_onHasKoreaCountryCode:(BOOL)a3;
- (void)_onHighThermalState:(BOOL)a3;
- (void)_onLocationAndPrivacyReset:(BOOL)a3;
- (void)_onLocationServicesEnabled:(BOOL)a3;
- (void)_onLocationSimulationInProgress:(BOOL)a3;
- (void)_onServiceEnabled:(BOOL)a3;
- (void)_onUserLocationInsideKorea:(BOOL)a3;
- (void)_registerForAvengerScanner;
- (void)_registerForTATrackingAvoidanceServiceWithSettings:(id)a3;
- (void)_schedulePeriodicSaveAfterTimeInterval:(double)a3;
- (void)_setLastSaveTime;
- (void)_setState:(unint64_t)a3;
- (void)_unregisterForAvengerScanner;
- (void)_unregisterForTATrackingAvoidanceService;
- (void)addDataSource:(id)a3;
- (void)addObserver:(id)a3;
- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5;
- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5;
- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4;
- (void)ingestTAEvent:(id)a3;
- (void)notifyObserversOfStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)onUpdatedSettings:(id)a3;
- (void)removeDataSource:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPersistenceManagerLastSaveTime:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceSettings:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStateContext:(id)a3;
- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4;
- (void)visitStateChangedForTrackingAvoidanceService:(id)a3;
@end

@implementation TATrackingAvoidanceServiceManager

- (void)ingestTAEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    switch([v5 systemStateType])
    {
      case 3:
        -[TATrackingAvoidanceServiceManager _onAirplaneMode:](self, "_onAirplaneMode:", [v5 isOn]);
        break;
      case 4:
        -[TATrackingAvoidanceServiceManager _onBatterySaverMode:](self, "_onBatterySaverMode:", [v5 isOn]);
        break;
      case 7:
        -[TATrackingAvoidanceServiceManager _onHighThermalState:](self, "_onHighThermalState:", [v5 isOn]);
        break;
      case 8:
        -[TATrackingAvoidanceServiceManager _onLocationServicesEnabled:](self, "_onLocationServicesEnabled:", [v5 isOn]);
        break;
      case 9:
        -[TATrackingAvoidanceServiceManager _onLocationSimulationInProgress:](self, "_onLocationSimulationInProgress:", [v5 isOn]);
        break;
      case 10:
        -[TATrackingAvoidanceServiceManager _onAllowSimulatedEvents:](self, "_onAllowSimulatedEvents:", [v5 isOn]);
        break;
      case 11:
        -[TATrackingAvoidanceServiceManager _onDeviceUnlockedSinceBoot:](self, "_onDeviceUnlockedSinceBoot:", [v5 isOn]);
        break;
      case 12:
        -[TATrackingAvoidanceServiceManager _onLocationAndPrivacyReset:](self, "_onLocationAndPrivacyReset:", [v5 isOn]);
        break;
      case 13:
        -[TATrackingAvoidanceServiceManager _onHasKoreaCountryCode:](self, "_onHasKoreaCountryCode:", [v5 isOn]);
        break;
      case 14:
        -[TATrackingAvoidanceServiceManager _onUserLocationInsideKorea:](self, "_onUserLocationInsideKorea:", [v5 isOn]);
        break;
      default:
        break;
    }
  }
  service = self->_service;
  if (service)
  {
    [(TATrackingAvoidanceService *)service ingestTAEvent:v4];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager ingestTAEvent:]();
  }
}

- (TATrackingAvoidanceServiceManager)initWithQueue:(id)a3 settings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)TATrackingAvoidanceServiceManager;
  v9 = [(TATrackingAvoidanceServiceManager *)&v30 init];
  if (v9)
  {
    TARegisterLogs();
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    dataSources = v9->_dataSources;
    v9->_dataSources = (NSHashTable *)v12;

    service = v9->_service;
    v9->_service = 0;

    v9->_state = 0;
    v15 = objc_alloc_init(TATrackingAvoidanceServiceStateContext);
    stateContext = v9->_stateContext;
    v9->_stateContext = v15;

    v17 = [TAPersistenceManager alloc];
    v18 = [v8 persistenceManagerSettings];
    uint64_t v19 = [(TAPersistenceManager *)v17 initWithSettings:v18];
    persistenceManager = v9->_persistenceManager;
    v9->_persistenceManager = (TAPersistenceManager *)v19;

    uint64_t v21 = [MEMORY[0x263F08C38] UUID];
    sessionID = v9->_sessionID;
    v9->_sessionID = (NSUUID *)v21;

    v23 = [TAAnalyticsManager alloc];
    v24 = [v8 analyticsManagerSettings];
    uint64_t v25 = [(TAAnalyticsManager *)v23 initWithSettings:v24];
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = (TAAnalyticsManager *)v25;

    v27 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x263F37F08]);
    routineManager = v9->_routineManager;
    v9->_routineManager = v27;

    [(TATrackingAvoidanceServiceManager *)v9 addObserver:v9];
    [(TATrackingAvoidanceServiceManager *)v9 addObserver:v9->_analyticsManager];
    [(TAPersistenceManager *)v9->_persistenceManager addObserver:v9->_analyticsManager];
    [(TATrackingAvoidanceServiceManager *)v9 onUpdatedSettings:v8];
  }

  return v9;
}

- (void)_onServiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received service enable notification\", \"serviceEnabled\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setServiceEnabled:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onHighThermalState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received thermal state notification\", \"isHighThermalState\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setHighThermalState:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received airplane mode notification\", \"airplaneMode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setAirplaneMode:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onBatterySaverMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received battery saver mode notification\", \"batterySaverMode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setBatterySaverMode:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onLocationServicesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location services notification\", \"locationServicesEnabled\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setLocationServicesEnabled:v3];
  if (!v3)
  {
    [(TAPersistenceManager *)self->_persistenceManager reset];
    [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setRestartRequired:1];
  }
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onLocationSimulationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location simulation notification\", \"locationSimulationInProgress\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setLocationSimulationInProgress:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onAllowSimulatedEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received allow simulated events notification\", \"allowSimulatedEvents\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setAllowSimulatedEvents:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onDeviceUnlockedSinceBoot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received device unlocked since boot notification\", \"deviceUnlockedSinceBoot\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setDeviceUnlockedSinceBoot:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onLocationAndPrivacyReset:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl(&dword_22345C000, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location and privacy reset notification. Resetting persistence store and restarting service.\"}", (uint8_t *)v5, 0x12u);
  }
  [(TAPersistenceManager *)self->_persistenceManager reset];
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setRestartRequired:1];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onHasKoreaCountryCode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received country code notification\", \"hasKoreaCountryCode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setHasKoreaCountryCode:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)_onUserLocationInsideKorea:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received user location inside Korea notification\", \"userLocationInsideKorea\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setUserLocationInsideKorea:v3];
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (void)onUpdatedSettings:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TATrackingAvoidanceServiceManager onUpdatedSettings:]();
  }
  if (!self->_serviceSettings || (objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serviceSettings, a3);
    [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setServiceEnabled:[(TASettings *)self->_serviceSettings trackingAvoidanceEnabled]];
    BOOL v6 = [(TATrackingAvoidanceServiceStateContext *)self->_stateContext serviceEnabled];
    BOOL v7 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v7) {
        -[TATrackingAvoidanceServiceManager onUpdatedSettings:]();
      }
    }
    else if (v7)
    {
      -[TATrackingAvoidanceServiceManager onUpdatedSettings:]();
    }
    [(TATrackingAvoidanceServiceStateContext *)self->_stateContext setRestartRequired:v6];
  }
  [(TATrackingAvoidanceServiceManager *)self _handleStateUpdateIfNecessary];
}

- (BOOL)_shouldSuspendAvengerScanner
{
  return [(TATrackingAvoidanceServiceStateContext *)self->_stateContext highThermalState];
}

- (BOOL)_shouldTerminateService
{
  if (![(TATrackingAvoidanceServiceStateContext *)self->_stateContext serviceEnabled]
    || [(TATrackingAvoidanceServiceStateContext *)self->_stateContext airplaneMode]
    || ![(TATrackingAvoidanceServiceStateContext *)self->_stateContext locationServicesEnabled]|| !self->_serviceSettings|| ![(TATrackingAvoidanceServiceStateContext *)self->_stateContext allowSimulatedEvents]&& [(TATrackingAvoidanceServiceStateContext *)self->_stateContext locationSimulationInProgress]|| ![(TATrackingAvoidanceServiceStateContext *)self->_stateContext deviceUnlockedSinceBoot]|| [(TATrackingAvoidanceServiceStateContext *)self->_stateContext hasKoreaCountryCode])
  {
    return 1;
  }
  stateContext = self->_stateContext;
  return [(TATrackingAvoidanceServiceStateContext *)stateContext userLocationInsideKorea];
}

- (void)_handleStateUpdateIfNecessary
{
  id v1 = a1;
  v2 = +[TATrackingAvoidanceServiceManager managerStateToString:2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22345C000, v3, v4, "#ut no state update necessary at %@ state", v5, v6, v7, v8, v9);
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state != a3) {
    self->_state = a3;
  }
}

- (void)_changeSession
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    uint64_t v6 = v4;
    id v7 = [(NSUUID *)sessionID UUIDString];
    uint64_t v8 = [v7 UTF8String];
    id v9 = [(NSUUID *)v3 UUIDString];
    v11[0] = 68289538;
    v11[1] = 0;
    __int16 v12 = 2082;
    v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = v8;
    __int16 v16 = 2082;
    uint64_t v17 = [v9 UTF8String];
    _os_log_impl(&dword_22345C000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut session change\", \"oldSessionID\":\"%{public}s\", \"newSessionID\":\"%{public}s\"}", (uint8_t *)v11, 0x26u);
  }
  BOOL v10 = self->_sessionID;
  self->_sessionID = v3;
}

- (void)_registerForTATrackingAvoidanceServiceWithSettings:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_service)
  {
    uint64_t v5 = [[TATrackingAvoidanceService alloc] initWithTASettings:v4];
    service = self->_service;
    self->_service = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_observers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[TATrackingAvoidanceService addObserver:](self->_service, "addObserver:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(TATrackingAvoidanceServiceManager *)self _changeSession];
    [(TATrackingAvoidanceServiceManager *)self _loadAndBootstrap];
    [(TATrackingAvoidanceServiceManager *)self _fetchAndIngestLastVisit];
    [(TASettings *)self->_serviceSettings persistenceInterval];
    -[TATrackingAvoidanceServiceManager _schedulePeriodicSaveAfterTimeInterval:](self, "_schedulePeriodicSaveAfterTimeInterval:");
  }
}

- (void)_unregisterForTATrackingAvoidanceService
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_service)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = self->_observers;
    uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          -[TATrackingAvoidanceService removeObserver:](self->_service, "removeObserver:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(TATrackingAvoidanceServiceManager *)self _changeSession];
    service = self->_service;
    self->_service = 0;
  }
}

- (void)_fetchAndIngestLastVisit
{
  id v3 = objc_alloc(MEMORY[0x263F37F10]);
  uint64_t v4 = [NSNumber numberWithDouble:*MEMORY[0x263F37F30]];
  uint64_t v5 = (void *)[v3 initWithAscending:0 confidence:v4 dateInterval:0 labelVisit:1 limit:&unk_26D684350];

  uint64_t v6 = [(TATrackingAvoidanceServiceManager *)self routineManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke;
  v7[3] = &unk_2646AAEE8;
  v7[4] = self;
  [v6 fetchStoredVisitsWithOptions:v5 handler:v7];
}

void __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke_2;
  v7[3] = &unk_2646AAEC0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 count])
  {
    id v3 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v24 = 68289283;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2113;
      uint64_t v29 = v4;
      _os_log_impl(&dword_22345C000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit got last visit\", \"visits\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
    }
    uint64_t v5 = [*(id *)(a1 + 32) firstObject];
    id v6 = [v5 location];
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    uint64_t v9 = [v5 location];
    [v9 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v8, v10);

    long long v12 = [TACLVisit alloc];
    long long v13 = [v5 location];
    [v13 horizontalUncertainty];
    double v15 = v14;
    __int16 v16 = [v5 entry];
    uint64_t v17 = [v5 exit];
    uint64_t v18 = [v5 date];
    uint64_t v19 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v12, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v16, v17, v18, 2, v11.latitude, v11.longitude, v15);

    v20 = [*(id *)(a1 + 40) service];

    if (v20)
    {
      uint64_t v21 = [*(id *)(a1 + 40) service];
      [v21 ingestTAEvent:v19];
    }
    else
    {
      v23 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        int v24 = 68289026;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        _os_log_impl(&dword_22345C000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:visit not ingesting TAEvent as TA service is down\"}", (uint8_t *)&v24, 0x12u);
      }
    }
  }
  else
  {
    v22 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 68289026;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit no last visit to bootstrap onto\"}", (uint8_t *)&v24, 0x12u);
    }
  }
}

- (void)_fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(TATrackingAvoidanceServiceManager *)self service];
  uint64_t v4 = [v3 store];
  uint64_t v5 = [v4 visitState];
  id v6 = [v5 getLatestValidVisit];

  double v7 = [(TATrackingAvoidanceServiceManager *)self service];
  CLLocationDegrees v8 = [v7 store];
  uint64_t v9 = [v8 clock];

  if (v6 && v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F00A50]);
    [v6 coordinate];
    double v12 = v11;
    double v14 = v13;
    [v6 horizontalAccuracy];
    double v16 = v15;
    uint64_t v17 = [v6 detectionDate];
    uint64_t v18 = objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v12, v14, 0.0, v16, -1.0);

    [(TATrackingAvoidanceServiceManager *)self _fetchAndIngestNextPredictedLocationOfInterestFromLocation:v18 startDate:v9 interval:7200.0];
  }
  else
  {
    uint64_t v19 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 68289539;
      v20[1] = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2113;
      int v24 = v6;
      __int16 v25 = 2113;
      __int16 v26 = v9;
      _os_log_impl(&dword_22345C000, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:nextPLOI missing required info to query\", \"latestVisit\":\"%{private}@\", \"startDate\":\"%{private}@\"}", (uint8_t *)v20, 0x26u);
    }
  }
}

- (void)_fetchAndIngestNextPredictedLocationOfInterestFromLocation:(id)a3 startDate:(id)a4 interval:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TATrackingAvoidanceServiceManager *)self routineManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke;
  v11[3] = &unk_2646AAEE8;
  v11[4] = self;
  [v10 fetchNextPredictedLocationsOfInterestFromLocation:v9 startDate:v8 timeInterval:v11 withHandler:a5];
}

void __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke_2;
  v7[3] = &unk_2646AAEC0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v1 = *(void **)(a1 + 32);
  if (v1 && [v1 count])
  {
    v2 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t buf = 68289283;
      __int16 v47 = 2082;
      v48 = "";
      __int16 v49 = 2113;
      v50 = v3;
      _os_log_impl(&dword_22345C000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:nextPLOI got nextPLOI\", \"nextPLOI\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v42;
      *(void *)&long long v5 = 68289283;
      long long v32 = v5;
      do
      {
        uint64_t v8 = 0;
        uint64_t v34 = v6;
        do
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
          objc_msgSend(v9, "confidence", v32);
          if (v10 >= 1.0)
          {
            double v12 = [v9 locationOfInterest];
            unint64_t v37 = +[TALocationOfInterest convertRTToTALocationOfInterestType:](TALocationOfInterest, "convertRTToTALocationOfInterestType:", [v12 type]);

            v36 = [TAPredictedLocationOfInterest alloc];
            v40 = [v9 locationOfInterest];
            v39 = [v40 location];
            [v39 latitude];
            double v14 = v13;
            v38 = [v9 locationOfInterest];
            double v15 = [v38 location];
            [v15 longitude];
            double v17 = v16;
            uint64_t v18 = [v9 locationOfInterest];
            uint64_t v19 = [v18 location];
            [v19 horizontalUncertainty];
            double v21 = v20;
            v22 = [v9 locationOfInterest];
            __int16 v23 = [v22 location];
            uint64_t v24 = [v23 referenceFrame];
            [v9 confidence];
            double v26 = v25;
            uint64_t v27 = [v9 nextEntryTime];
            __int16 v28 = [MEMORY[0x263EFF910] date];
            uint64_t v29 = [(TAPredictedLocationOfInterest *)v36 initWithType:v37 latitude:v24 longitude:v27 horizontalAccuracy:v28 referenceFrame:v14 confidence:v17 nextEntryTime:v21 date:v26];

            uint64_t v30 = [*(id *)(a1 + 40) service];
            [v30 ingestTAEvent:v29];

            uint64_t v6 = v34;
          }
          else
          {
            double v11 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            {
              uint64_t buf = v32;
              __int16 v47 = 2082;
              v48 = "";
              __int16 v49 = 2113;
              v50 = v9;
              _os_log_impl(&dword_22345C000, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:nextPLOI ignoring low confidence PLOI\", \"nextPLOI\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v31 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v47 = 2082;
      v48 = "";
      _os_log_impl(&dword_22345C000, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:nextPLOI no next PLOI\"}", (uint8_t *)&buf, 0x12u);
    }
  }
}

- (void)_registerForAvengerScanner
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_dataSources;
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "registerForAvengerScanner", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_unregisterForAvengerScanner
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_dataSources;
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "unregisterForAvengerScanner", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)notifyObserversOfStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_dataSources;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "onManagerStateChangeFrom:to:", a3, a4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_loadAndBootstrap
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)os_transaction_create();
  if (![(TAPersistenceManager *)self->_persistenceManager load])
  {
    uint64_t v13 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v17 = 68289026;
    int v18 = 0;
    __int16 v19 = 2082;
    double v20 = "";
    long long v14 = "{\"msg%{public}.0s\":\"#manager:persistence failed to load persistence store, aborting bootstrap\"}";
    long long v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_22345C000, v15, v16, v14, (uint8_t *)&v17, 0x12u);
    goto LABEL_11;
  }
  uint64_t v4 = [(TAPersistenceManager *)self->_persistenceManager store];
  uint64_t v5 = [v4 deviceRecord];

  uint64_t v6 = TAStatusLog;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    int v17 = 68289026;
    int v18 = 0;
    __int16 v19 = 2082;
    double v20 = "";
    long long v14 = "{\"msg%{public}.0s\":\"#manager:persistence no device record to bootstrap onto\"}";
    long long v15 = v6;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 68289026;
    int v18 = 0;
    __int16 v19 = 2082;
    double v20 = "";
    _os_log_impl(&dword_22345C000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence bootstrapping onto loaded store\"}", (uint8_t *)&v17, 0x12u);
  }
  service = self->_service;
  uint64_t v8 = [(TAPersistenceManager *)self->_persistenceManager store];
  uint64_t v9 = [v8 deviceRecord];
  [(TATrackingAvoidanceService *)service bootstrapDeviceRecord:v9];

  uint64_t v10 = self->_service;
  long long v11 = [(TAPersistenceManager *)self->_persistenceManager store];
  long long v12 = [v11 visitState];
  [(TATrackingAvoidanceService *)v10 bootstrapVisitState:v12];

LABEL_11:
}

- (void)_fetchStoreAndSave
{
  id v5 = (id)os_transaction_create();
  persistenceManager = self->_persistenceManager;
  uint64_t v4 = [(TATrackingAvoidanceService *)self->_service store];
  [(TAPersistenceManager *)persistenceManager onUpdatedTAStore:v4];

  [(TAPersistenceManager *)self->_persistenceManager save];
  [(TATrackingAvoidanceServiceManager *)self _setLastSaveTime];
}

- (void)_schedulePeriodicSaveAfterTimeInterval:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    uint64_t v7 = v5;
    id v8 = [(NSUUID *)sessionID UUIDString];
    *(_DWORD *)uint64_t buf = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    __int16 v19 = "";
    __int16 v20 = 2050;
    double v21 = a3;
    __int16 v22 = 2082;
    uint64_t v23 = [v8 UTF8String];
    _os_log_impl(&dword_22345C000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence scheduling save\", \"interval\":\"%{public}f\", \"currentSession\":\"%{public}s\"}", buf, 0x26u);
  }
  uint64_t v9 = self->_sessionID;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__TATrackingAvoidanceServiceManager__schedulePeriodicSaveAfterTimeInterval___block_invoke;
  block[3] = &unk_2646AAF10;
  double v15 = a3;
  block[4] = self;
  long long v14 = v9;
  long long v12 = v9;
  dispatch_after(v10, queue, block);
}

void __76__TATrackingAvoidanceServiceManager__schedulePeriodicSaveAfterTimeInterval___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(double *)(a1 + 48);
    int v25 = 68289282;
    int v26 = 0;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2050;
    double v30 = v3;
    _os_log_impl(&dword_22345C000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence begin scheduled save\", \"interval\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 80) isEqual:*(void *)(a1 + 40)])
  {
    if (*(void *)(*(void *)(a1 + 32) + 8) == 1)
    {
      mach_continuous_time();
      TMConvertTicksToSeconds();
      double v5 = v4;
      [*(id *)(*(void *)(a1 + 32) + 48) persistenceInterval];
      if (v5 >= v6)
      {
        __int16 v20 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          double v21 = *(void **)(*(void *)(a1 + 32) + 48);
          __int16 v22 = v20;
          [v21 persistenceInterval];
          int v25 = 68289282;
          int v26 = 0;
          __int16 v27 = 2082;
          __int16 v28 = "";
          __int16 v29 = 2050;
          double v30 = v23;
          _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence save and schedule next save\", \"secondsToNextSave\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);
        }
        [*(id *)(a1 + 32) _fetchStoreAndSave];
        uint64_t v24 = *(id **)(a1 + 32);
        [v24[6] persistenceInterval];
        dispatch_time_t v10 = v24;
      }
      else
      {
        [*(id *)(*(void *)(a1 + 32) + 48) persistenceInterval];
        double v8 = v7 - v5;
        uint64_t v9 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 68289282;
          int v26 = 0;
          __int16 v27 = 2082;
          __int16 v28 = "";
          __int16 v29 = 2050;
          double v30 = v8;
          _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence push out save schedule\", \"secondsToNextSave\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);
        }
        dispatch_time_t v10 = *(id **)(a1 + 32);
        double v11 = v8;
      }
      [v10 _schedulePeriodicSaveAfterTimeInterval:v11];
    }
    else
    {
      __int16 v19 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 68289026;
        int v26 = 0;
        __int16 v27 = 2082;
        __int16 v28 = "";
        _os_log_impl(&dword_22345C000, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:persistence scheduled save running but not in running state, discontinuing scheduled saves\"}", (uint8_t *)&v25, 0x12u);
      }
    }
  }
  else
  {
    long long v12 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 80);
      long long v14 = v12;
      id v15 = [v13 UUIDString];
      *(double *)&uint64_t v16 = COERCE_DOUBLE([v15 UTF8String]);
      id v17 = [*(id *)(a1 + 40) UUIDString];
      uint64_t v18 = [v17 UTF8String];
      int v25 = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      double v30 = *(double *)&v16;
      __int16 v31 = 2082;
      uint64_t v32 = v18;
      _os_log_impl(&dword_22345C000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:persistence canceling scheduled save due to session change\", \"currentSession\":\"%{public}s\", \"sessionAtTimeOfSchedule\":\"%{public}s\"}", (uint8_t *)&v25, 0x26u);
    }
  }
}

- (void)_setLastSaveTime
{
  self->_persistenceManagerLastSaveTime = mach_continuous_time();
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:");
  service = self->_service;
  if (service) {
    [(TATrackingAvoidanceService *)service addObserver:v5];
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  -[NSHashTable removeObject:](self->_observers, "removeObject:");
  service = self->_service;
  if (service) {
    [(TATrackingAvoidanceService *)service addObserver:v5];
  }
}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  service = self->_service;
  if (service)
  {
    [(TATrackingAvoidanceService *)service fetchTAUnknownBeacon:v6 withCompletion:v7];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager fetchTAUnknownBeacon:withCompletion:]();
  }
}

- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  service = self->_service;
  if (service)
  {
    [(TATrackingAvoidanceService *)service debugForceSurfaceStagedDetections:v8 deviceType:a4 detailsBitmask:v5];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager debugForceSurfaceStagedDetections:deviceType:detailsBitmask:]();
  }
}

- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  service = self->_service;
  if (service)
  {
    [(TATrackingAvoidanceService *)service debugStageTADetection:v8 deviceType:a4 detailsBitmask:v5];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager debugStageTADetection:deviceType:detailsBitmask:]();
  }
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_dataSources addObject:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 registerForLeechedEvents];
  }
  if (self->_state == 1 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 registerForAvengerScanner];
  }
  MEMORY[0x270F9A790]();
}

- (void)removeDataSource:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    [v6 unregisterForLeechedEvents];
  }
  id v4 = v6;
  if (self->_state == 1)
  {
    char v5 = objc_opt_respondsToSelector();
    id v4 = v6;
    if (v5)
    {
      [v6 unregisterForAvengerScanner];
      id v4 = v6;
    }
  }
  [(NSHashTable *)self->_dataSources removeObject:v4];
}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "count", a3))
  {
    char v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didFindSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    [(TATrackingAvoidanceServiceManager *)self _fetchStoreAndSave];
  }
}

- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "count", a3))
  {
    char v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didStageSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    [(TATrackingAvoidanceServiceManager *)self _fetchStoreAndSave];
  }
}

- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "count", a3))
  {
    char v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didUnstageSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    [(TATrackingAvoidanceServiceManager *)self _fetchStoreAndSave];
  }
}

- (void)visitStateChangedForTrackingAvoidanceService:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl(&dword_22345C000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence visitStateChangedForTrackingAvoidanceService called, saving state\"}", (uint8_t *)v5, 0x12u);
  }
  [(TATrackingAvoidanceServiceManager *)self _fetchStoreAndSave];
  [(TATrackingAvoidanceServiceManager *)self _fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState];
}

+ (id)managerStateToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"UnknownState";
  }
  else {
    return off_2646AAF30[a3];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (TATrackingAvoidanceService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (TASettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
}

- (TATrackingAvoidanceServiceStateContext)stateContext
{
  return self->_stateContext;
}

- (void)setStateContext:(id)a3
{
}

- (TAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (unint64_t)persistenceManagerLastSaveTime
{
  return self->_persistenceManagerLastSaveTime;
}

- (void)setPersistenceManagerLastSaveTime:(unint64_t)a3
{
  self->_persistenceManagerLastSaveTime = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (TAAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_stateContext, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)onUpdatedSettings:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut settings changed or weren't set; restart service required",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)onUpdatedSettings:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut settings have disabled TA", v2, v3, v4, v5, v6);
}

- (void)onUpdatedSettings:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_22345C000, v1, OS_LOG_TYPE_DEBUG, "#ut new settings %{private}@, old settings %{private}@", v2, 0x16u);
}

- (void)ingestTAEvent:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut not ingesting TAEvent as TA service is down", v2, v3, v4, v5, v6);
}

- (void)fetchTAUnknownBeacon:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut not fetching unknown beacon as TA service is down", v2, v3, v4, v5, v6);
}

- (void)debugForceSurfaceStagedDetections:deviceType:detailsBitmask:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut not ForceSurfaceStagedDetections as TA service is down", v2, v3, v4, v5, v6);
}

- (void)debugStageTADetection:deviceType:detailsBitmask:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_22345C000, v0, v1, "#ut not debugStageTADetection as TA service is down", v2, v3, v4, v5, v6);
}

@end