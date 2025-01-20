@interface RTIntermittentGNSSManager
+ (BOOL)validLocation:(id)a3;
+ (id)overrideStateToString:(unint64_t)a3;
- (BOOL)_dutyCyclingConditionMet;
- (BOOL)_frequentlyVisitedLocationOfInterest:(id)a3;
- (BOOL)_motionActivityConditionsSatisifed:(id)a3;
- (BOOL)_wifiDenseConditionsMet;
- (BOOL)activeWifiScan;
- (BOOL)awayFromFrequentlyVisitedLOI;
- (BOOL)completedInitialWifiScan;
- (BOOL)motionActivityTypeSatisfied;
- (BOOL)platformSupported;
- (BOOL)registeredForIntermittentGNSS;
- (BOOL)settledStateLOIVerified;
- (BOOL)signalEnvironmentAtRisk;
- (BOOL)unsettled;
- (BOOL)wifiLocationStarved;
- (NSDate)lastDenseWifiScanResultDate;
- (NSDate)lastLOINearbyCheckDate;
- (NSDate)lastRegisteredForIntermittentGNSSVariableFlipDate;
- (NSDate)lastSettledStateChangeDate;
- (NSDate)lastWifiLocationDate;
- (NSMutableArray)accessPoints;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10;
- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 vehicleLocationProvider:(id)a8 wifiManager:(id)a9;
- (RTIntermittentGNSSManagerMetrics)metrics;
- (RTInvocationDispatcher)remoteStatusDispatcher;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTTimer)conditionCheckTimer;
- (RTTimer)remoteStatusTimeoutTimer;
- (RTTimer)wifiLocationStarvedTimer;
- (RTTimer)wifiScanTimer;
- (RTTimerManager)timerManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTWiFiManager)wifiManager;
- (double)totalDailyDuration;
- (id)_initializeWifiLocationStarvedTimer;
- (id)_locationsOfInterestNearLocation:(id)a3 error:(id *)a4;
- (int)currentSignalEnvironment;
- (unint64_t)currentDominantMotionType;
- (unint64_t)intermittentGNSSOverrideState;
- (unint64_t)remoteStatusChecklist;
- (void)_checkWifiDenseArea;
- (void)_completeRemoteStatusChecklistItem:(unint64_t)a3;
- (void)_considerRegisteringForIntermittentGNSS;
- (void)_onLocationStarvedTimerExpiry;
- (void)_processWifiScanResults;
- (void)_registerForRhythmicNonWakingLocation;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForRhythmicNonWakingLocation;
- (void)_updateLocationNearLOI:(id)a3;
- (void)_updateSignalEnvironmentRiskStatus:(int)a3;
- (void)_updateWifiLocationAvailabilityStatus:(id)a3;
- (void)_updateWifiLocationStarvedTimer;
- (void)fetchIntermittentGNSSRegistrationStateWithHandler:(id)a3;
- (void)fetchRemoteStatusWithHandler:(id)a3;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onLeechedLocationNotification:(id)a3;
- (void)onMotionActivityManagerNotification:(id)a3;
- (void)onVehicleEventNotification:(id)a3;
- (void)onWifiScanResultsNotification:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setActiveWifiScan:(BOOL)a3;
- (void)setAwayFromFrequentlyVisitedLOI:(BOOL)a3;
- (void)setCompletedInitialWifiScan:(BOOL)a3;
- (void)setConditionCheckTimer:(id)a3;
- (void)setCurrentDominantMotionType:(unint64_t)a3;
- (void)setCurrentSignalEnvironment:(int)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setIntermittentGNSSOverrideState:(unint64_t)a3;
- (void)setLastDenseWifiScanResultDate:(id)a3;
- (void)setLastLOINearbyCheckDate:(id)a3;
- (void)setLastRegisteredForIntermittentGNSSVariableFlipDate:(id)a3;
- (void)setLastSettledStateChangeDate:(id)a3;
- (void)setLastWifiLocationDate:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setMotionActivityTypeSatisfied:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setRegisteredForIntermittentGNSS:(BOOL)a3;
- (void)setRemoteStatusChecklist:(unint64_t)a3;
- (void)setRemoteStatusDispatcher:(id)a3;
- (void)setRemoteStatusTimeoutTimer:(id)a3;
- (void)setSettledStateLOIVerified:(BOOL)a3;
- (void)setSignalEnvironmentAtRisk:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)setTotalDailyDuration:(double)a3;
- (void)setUnsettled:(BOOL)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)setWifiLocationStarved:(BOOL)a3;
- (void)setWifiLocationStarvedTimer:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setWifiScanTimer:(id)a3;
- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 handler:(id)a4;
@end

@implementation RTIntermittentGNSSManager

- (void)onLeechedLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __59__RTIntermittentGNSSManager_onLeechedLocationNotification___block_invoke;
  v11 = &unk_1E6B90BF0;
  id v12 = v4;
  v13 = self;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1E016DB00](&v8);
  v7 = [(RTNotifier *)self queue];
  dispatch_async(v7, v6);
}

- (void)_updateWifiLocationAvailabilityStatus:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (!v5) {
    goto LABEL_22;
  }
  uint64_t v7 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v19;
  *(void *)&long long v6 = 136315394;
  long long v17 = v6;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([(id)objc_opt_class() validLocation:v11])
      {
        if ([v11 type] == 4
          || [v11 type] == 11
          || [v11 type] == 13)
        {
          if (!self->_lastWifiLocationDate
            || ([v11 timestamp],
                id v12 = objc_claimAutoreleasedReturnValue(),
                [v12 timeIntervalSinceDate:self->_lastWifiLocationDate],
                double v14 = v13,
                v12,
                v14 >= 0.0))
          {
            [v11 timestamp:v17];
            uint64_t v8 = v15 = v8;
LABEL_17:

            continue;
          }
        }
        if (objc_msgSend(v11, "type", v17) == 1 || objc_msgSend(v11, "type") == 9)
        {
          v15 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = [v11 toString];
            *(_DWORD *)buf = v17;
            v23 = "-[RTIntermittentGNSSManager _updateWifiLocationAvailabilityStatus:]";
            __int16 v24 = 2112;
            v25 = v16;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, gps location received, %@", buf, 0x16u);
          }
          goto LABEL_17;
        }
      }
    }
    uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  }
  while (v7);
  if (v8)
  {
    [(RTIntermittentGNSSManager *)self setLastWifiLocationDate:v8];
  }
LABEL_22:
}

void __59__RTIntermittentGNSSManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [*(id *)(a1 + 32) leechedLocations];
    v2 = [*(id *)(a1 + 40) metrics];
    [v2 updateSessionLocationCount:[v10 count]];

    [*(id *)(a1 + 40) _updateWifiLocationAvailabilityStatus:v10];
    v3 = *(void **)(a1 + 40);
    id v4 = [v10 lastObject];
    [v3 _updateSignalEnvironmentRiskStatus:[v4 signalEnvironmentType]];

    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = objc_alloc(MEMORY[0x1E4F5CE00]);
    uint64_t v7 = [v10 lastObject];
    uint64_t v8 = (void *)[v6 initWithCLLocation:v7];
    [v5 _updateLocationNearLOI:v8];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }
  }
}

- (void)setSignalEnvironmentAtRisk:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_signalEnvironmentAtRisk != a3)
  {
    BOOL v3 = a3;
    self->_signalEnvironmentAtRisk = a3;
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v8 = 136315394;
      uint64_t v9 = "-[RTIntermittentGNSSManager setSignalEnvironmentAtRisk:]";
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, signalEnvironmentAtRisk, %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v7 = [(RTIntermittentGNSSManager *)self metrics];
    [v7 processSignalSwitch:3];

    [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];
  }
}

- (RTIntermittentGNSSManagerMetrics)metrics
{
  return self->_metrics;
}

- (void)_updateSignalEnvironmentRiskStatus:(int)a3
{
  -[RTIntermittentGNSSManager setCurrentSignalEnvironment:](self, "setCurrentSignalEnvironment:");
  BOOL v5 = 1;
  if ((a3 - 1) >= 2 && a3 != 6)
  {
    if (a3) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = [(RTIntermittentGNSSManager *)self signalEnvironmentAtRisk];
    }
  }

  [(RTIntermittentGNSSManager *)self setSignalEnvironmentAtRisk:v5];
}

- (void)_updateLocationNearLOI:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL unsettled = self->_unsettled;
  if (self->_unsettled
    || (lastSettledStateChangeDate = self->_lastSettledStateChangeDate,
        [(RTIntermittentGNSSManager *)self lastLOINearbyCheckDate],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [(NSDate *)lastSettledStateChangeDate timeIntervalSinceDate:v3],
        v8 >= 0.0))
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v10 = [(RTIntermittentGNSSManager *)self lastLOINearbyCheckDate];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    if (!unsettled) {
    if (v12 >= 300.0)
    }
    {
      id v27 = 0;
      double v13 = [(RTIntermittentGNSSManager *)self _locationsOfInterestNearLocation:v5 error:&v27];
      id v14 = v27;
      if (v14)
      {
        v15 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[RTIntermittentGNSSManager _updateLocationNearLOI:]";
          __int16 v31 = 2112;
          id v32 = v14;
          _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%s, loi fetch error, %@", buf, 0x16u);
        }
      }
      else
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if (-[RTIntermittentGNSSManager _frequentlyVisitedLocationOfInterest:](self, "_frequentlyVisitedLocationOfInterest:", v20, (void)v23))
              {
                [(RTIntermittentGNSSManager *)self setAwayFromFrequentlyVisitedLOI:0];
                long long v21 = [v5 date];
                [(RTIntermittentGNSSManager *)self setLastLOINearbyCheckDate:v21];

                v22 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v30 = "-[RTIntermittentGNSSManager _updateLocationNearLOI:]";
                  __int16 v31 = 2112;
                  id v32 = v20;
                  _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%s, near frequently visited LOI, %@", buf, 0x16u);
                }

                goto LABEL_22;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        [(RTIntermittentGNSSManager *)self setAwayFromFrequentlyVisitedLOI:1];
        v15 = [v5 date];
        [(RTIntermittentGNSSManager *)self setLastLOINearbyCheckDate:v15];
      }
LABEL_22:
    }
  }
  else
  {
  }
}

- (NSDate)lastLOINearbyCheckDate
{
  return self->_lastLOINearbyCheckDate;
}

+ (BOOL)validLocation:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 horizontalAccuracy], v5 >= 0.0))
  {
    [v4 horizontalAccuracy];
    BOOL v6 = v7 <= 250.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setWifiLocationStarved:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(RTIntermittentGNSSManager *)self _completeRemoteStatusChecklistItem:4];
  if (self->_wifiLocationStarved != v3)
  {
    self->_wifiLocationStarved = v3;
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      int v8 = 136315394;
      uint64_t v9 = "-[RTIntermittentGNSSManager setWifiLocationStarved:]";
      __int16 v10 = 2112;
      double v11 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, wifiLocationStarved, %@", (uint8_t *)&v8, 0x16u);
    }

    double v7 = [(RTIntermittentGNSSManager *)self metrics];
    [v7 processSignalSwitch:5];

    [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];
  }
}

- (void)setCurrentSignalEnvironment:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(RTIntermittentGNSSManager *)self _completeRemoteStatusChecklistItem:1];
  if (self->_currentSignalEnvironment != a3)
  {
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int currentSignalEnvironment = self->_currentSignalEnvironment;
      int v7 = 136315650;
      int v8 = "-[RTIntermittentGNSSManager setCurrentSignalEnvironment:]";
      __int16 v9 = 1024;
      int v10 = currentSignalEnvironment;
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, signal environment change detected, from, %d, to, %d", (uint8_t *)&v7, 0x18u);
    }

    self->_int currentSignalEnvironment = a3;
  }
}

- (void)_completeRemoteStatusChecklistItem:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((a3 & ~[(RTIntermittentGNSSManager *)self remoteStatusChecklist]) != 0)
  {
    [(RTIntermittentGNSSManager *)self setRemoteStatusChecklist:[(RTIntermittentGNSSManager *)self remoteStatusChecklist] | a3];
    if ([(RTIntermittentGNSSManager *)self remoteStatusChecklist] == 15)
    {
      double v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        int v12 = "-[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:]";
        __int16 v13 = 2048;
        unint64_t v14 = a3;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, completed %lu which completes the checklist", (uint8_t *)&v11, 0x16u);
      }

      BOOL v6 = [(RTIntermittentGNSSManager *)self remoteStatusDispatcher];

      if (v6)
      {
        int v7 = [(RTIntermittentGNSSManager *)self remoteStatusTimeoutTimer];
        [v7 invalidate];

        [(RTIntermittentGNSSManager *)self setRemoteStatusTimeoutTimer:0];
        int v8 = [(RTIntermittentGNSSManager *)self remoteStatusDispatcher];
        [v8 dispatchPendingInvocations];

        [(RTIntermittentGNSSManager *)self setRemoteStatusDispatcher:0];
      }
    }
    else
    {
      char v9 = [(RTIntermittentGNSSManager *)self remoteStatusChecklist];
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315650;
        int v12 = "-[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:]";
        __int16 v13 = 2048;
        unint64_t v14 = a3;
        __int16 v15 = 2048;
        uint64_t v16 = ~v9 & 0xF;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, completed %lu, still waiting on %lu", (uint8_t *)&v11, 0x20u);
      }
    }
  }
}

- (unint64_t)remoteStatusChecklist
{
  return self->_remoteStatusChecklist;
}

- (void)setLastWifiLocationDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastWifiLocationDate, a3);
  BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 stringFromDate];
    int v8 = 136315394;
    char v9 = "-[RTIntermittentGNSSManager setLastWifiLocationDate:]";
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, lastWifiLocationDate, %@", (uint8_t *)&v8, 0x16u);
  }
  [(RTIntermittentGNSSManager *)self _updateWifiLocationStarvedTimer];
  [(RTIntermittentGNSSManager *)self setWifiLocationStarved:0];
}

- (void)_updateWifiLocationStarvedTimer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(RTIntermittentGNSSManager *)self wifiLocationStarvedTimer];

  if (v3)
  {
    id v4 = [(RTIntermittentGNSSManager *)self wifiLocationStarvedTimer];
    [v4 invalidate];

    [(RTIntermittentGNSSManager *)self setWifiLocationStarvedTimer:0];
  }
  id v5 = [(RTIntermittentGNSSManager *)self lastWifiLocationDate];
  if (v5)
  {
  }
  else
  {
    BOOL v6 = [(RTIntermittentGNSSManager *)self lastDenseWifiScanResultDate];

    if (!v6) {
      return;
    }
  }
  int v7 = [(RTIntermittentGNSSManager *)self _initializeWifiLocationStarvedTimer];
  [(RTIntermittentGNSSManager *)self setWifiLocationStarvedTimer:v7];

  int v8 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = [(RTIntermittentGNSSManager *)self lastWifiLocationDate];
    __int16 v10 = [v9 stringFromDate];
    int v11 = [(RTIntermittentGNSSManager *)self lastDenseWifiScanResultDate];
    uint64_t v12 = [v11 stringFromDate];
    int v13 = 136316162;
    unint64_t v14 = "-[RTIntermittentGNSSManager _updateWifiLocationStarvedTimer]";
    __int16 v15 = 2112;
    uint64_t v16 = @"RTIntermittentGNSSLocationStarvedTimer";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v12;
    __int16 v21 = 2048;
    uint64_t v22 = 0x408A400000000000;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, %@, lastWifiLocationDate, %@, lastDenseWifiScanResultDate, %@, interval, %.2f", (uint8_t *)&v13, 0x34u);
  }
}

- (NSDate)lastWifiLocationDate
{
  return self->_lastWifiLocationDate;
}

- (RTTimer)wifiLocationStarvedTimer
{
  return self->_wifiLocationStarvedTimer;
}

- (void)setWifiLocationStarvedTimer:(id)a3
{
}

- (BOOL)signalEnvironmentAtRisk
{
  return self->_signalEnvironmentAtRisk;
}

- (id)_initializeWifiLocationStarvedTimer
{
  objc_initWeak(&location, self);
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(RTIntermittentGNSSManager *)self timerManager];
  id v5 = [(RTNotifier *)self queue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __64__RTIntermittentGNSSManager__initializeWifiLocationStarvedTimer__block_invoke;
  uint64_t v16 = &unk_1E6B9A160;
  id v6 = v3;
  id v17 = v6;
  uint64_t v18 = self;
  objc_copyWeak(&v19, &location);
  int v7 = [v4 timerWithIdentifier:@"RTIntermittentGNSSLocationStarvedTimer" queue:v5 handler:&v13];

  int v8 = [(RTIntermittentGNSSManager *)self lastWifiLocationDate];
  char v9 = [(RTIntermittentGNSSManager *)self lastDenseWifiScanResultDate];
  __int16 v10 = [v8 laterDate:v9];

  [v6 timeIntervalSinceDate:v10];
  [v7 fireAfterDelay:fmax(840.0 - v11, 1.0)];
  [v7 resume];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v7;
}

- (NSDate)lastDenseWifiScanResultDate
{
  return self->_lastDenseWifiScanResultDate;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 vehicleLocationProvider:(id)a8 wifiManager:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = objc_opt_new();
  long long v24 = [(RTIntermittentGNSSManager *)self initWithDefaultsManager:v22 learnedLocationManager:v21 locationManager:v20 motionActivityManager:v19 platform:v18 timerManager:v23 vehicleLocationProvider:v17 wifiManager:v16];

  return v24;
}

- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v18 = a10;
  if (!v16)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_26:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_26;
  }
  if (!v36)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_26;
  }
  if (!v35)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_26;
  }
  if (!v34)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_26;
  }
  if (!v33)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    long long v26 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_26;
  }
  if (!v32)
  {
    long long v24 = v18;
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v26 = "Invalid parameter not satisfying: vehicleLocationProvider";
      goto LABEL_26;
    }
LABEL_27:

    uint64_t v23 = 0;
    id v22 = self;
    goto LABEL_28;
  }
  id v29 = v18;
  if (v18)
  {
    v37.receiver = self;
    v37.super_class = (Class)RTIntermittentGNSSManager;
    id v19 = [(RTNotifier *)&v37 init];
    if (v19)
    {
      __int16 v31 = v19;
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_learnedLocationManager, a4);
      objc_storeStrong((id *)&v31->_locationManager, a5);
      id v20 = [[RTIntermittentGNSSManagerMetrics alloc] initWithDefaultsManager:v16 timerManager:v33];
      metrics = v31->_metrics;
      v31->_metrics = v20;

      objc_storeStrong((id *)&v31->_motionActivityManager, a6);
      objc_storeStrong((id *)&v31->_platform, a7);
      objc_storeStrong((id *)&v31->_timerManager, a8);
      objc_storeStrong((id *)&v31->_vehicleLocationProvider, a9);
      objc_storeStrong((id *)&v31->_wifiManager, a10);
      [(RTService *)v31 setup];
      id v19 = v31;
    }
    id v22 = v19;
    uint64_t v23 = v22;
    long long v24 = v29;
  }
  else
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    uint64_t v23 = 0;
    long long v24 = 0;
    id v22 = self;
  }
LABEL_28:

  return v23;
}

- (BOOL)platformSupported
{
  BOOL v3 = [(RTIntermittentGNSSManager *)self platform];
  if ([v3 internalInstall])
  {
    id v4 = [(RTIntermittentGNSSManager *)self defaultsManager];
    id v5 = [v4 objectForKey:@"RTDefaultsIntermittentGNSSBypassPlatformCheck"];

    if (v5)
    {
      id v6 = [(RTIntermittentGNSSManager *)self defaultsManager];
      int v7 = [v6 objectForKey:@"RTDefaultsIntermittentGNSSBypassPlatformCheck"];
      char v8 = [v7 BOOLValue];

      return v8;
    }
  }
  else
  {
  }

  return MGGetBoolAnswer();
}

- (void)_setup
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(RTIntermittentGNSSManager *)self defaultsManager];
  id v4 = [v3 objectForKey:@"RTDefaultsIntermittentGNSSBypassSetup"];
  if (v4)
  {
  }
  else
  {
    char v5 = _os_feature_enabled_impl();

    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[RTIntermittentGNSSManager _setup]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, IntermittentGNSS registration and setup blocked by user defaults or feature flag", (uint8_t *)&buf, 0xCu);
  }

LABEL_7:
  [(RTIntermittentGNSSManager *)self setRemoteStatusChecklist:0];
  int v7 = [(RTIntermittentGNSSManager *)self _initializeWifiLocationStarvedTimer];
  [(RTIntermittentGNSSManager *)self setWifiLocationStarvedTimer:v7];

  char v8 = [(RTIntermittentGNSSManager *)self locationManager];
  char v9 = +[RTNotification notificationName];
  [v8 addObserver:self selector:sel_onLeechedLocationNotification_ name:v9];

  __int16 v10 = [(RTIntermittentGNSSManager *)self motionActivityManager];
  double v11 = +[RTNotification notificationName];
  [v10 addObserver:self selector:sel_onMotionActivityManagerNotification_ name:v11];

  uint64_t v12 = [(RTIntermittentGNSSManager *)self motionActivityManager];
  uint64_t v13 = +[RTNotification notificationName];
  [v12 addObserver:self selector:sel_onMotionActivityManagerNotification_ name:v13];

  uint64_t v14 = [(RTIntermittentGNSSManager *)self motionActivityManager];
  __int16 v15 = +[RTNotification notificationName];
  [v14 addObserver:self selector:sel_onMotionActivityManagerNotification_ name:v15];

  id v16 = [(RTIntermittentGNSSManager *)self vehicleLocationProvider];
  id v17 = +[RTNotification notificationName];
  [v16 addObserver:self selector:sel_onVehicleEventNotification_ name:v17];

  id v18 = [(RTIntermittentGNSSManager *)self wifiManager];
  id v19 = +[RTNotification notificationName];
  [v18 addObserver:self selector:sel_onWifiScanResultsNotification_ name:v19];

  id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__158;
  v68 = __Block_byref_object_dispose__158;
  id v69 = 0;
  uint64_t v59 = 0;
  v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__158;
  v63 = __Block_byref_object_dispose__158;
  id v64 = 0;
  motionActivityManager = self->_motionActivityManager;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __35__RTIntermittentGNSSManager__setup__block_invoke;
  v55[3] = &unk_1E6B9C590;
  p_long long buf = &buf;
  v58 = &v59;
  uint64_t v23 = v21;
  v56 = v23;
  [(RTMotionActivityManager *)motionActivityManager fetchPredominantMotionActivityWithHandler:v55];
  long long v24 = v23;
  long long v25 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v26 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v24, v26)) {
    goto LABEL_12;
  }
  id v27 = [MEMORY[0x1E4F1C9C8] now];
  [v27 timeIntervalSinceDate:v25];
  double v29 = v28;
  v30 = objc_opt_new();
  __int16 v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_116];
  id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v33 = [v32 filteredArrayUsingPredicate:v31];
  id v34 = [v33 firstObject];

  [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
  id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v71 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v71, 2u);
  }

  id v36 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  *(void *)v71 = @"semaphore wait timeout";
  objc_super v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
  v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

  if (v38)
  {
    id v39 = v38;

    char v40 = 0;
  }
  else
  {
LABEL_12:
    id v39 = 0;
    char v40 = 1;
  }

  id v41 = v39;
  if ((v40 & 1) == 0) {
    objc_storeStrong(v60 + 5, v39);
  }
  if (!v60[5])
  {
    BOOL v42 = [(RTIntermittentGNSSManager *)self _motionActivityConditionsSatisifed:*(void *)(*((void *)&buf + 1) + 40)];
    self->_BOOL unsettled = v42;
    self->_motionActivityTypeSatisfied = v42;
  }
  v43 = (NSMutableArray *)objc_opt_new();
  accessPoints = self->_accessPoints;
  self->_accessPoints = v43;

  v45 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastLOINearbyCheckDate = self->_lastLOINearbyCheckDate;
  self->_lastLOINearbyCheckDate = v45;

  v47 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastSettledStateChangeDate = self->_lastSettledStateChangeDate;
  self->_lastSettledStateChangeDate = v47;

  v49 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastWifiLocationDate = self->_lastWifiLocationDate;
  self->_lastWifiLocationDate = v49;

  v51 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastDenseWifiScanResultDate = self->_lastDenseWifiScanResultDate;
  self->_lastDenseWifiScanResultDate = v51;

  v53 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastRegisteredForIntermittentGNSSVariableFlipDate = self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
  self->_lastRegisteredForIntermittentGNSSVariableFlipDate = v53;

  self->_signalEnvironmentAtRisk = 1;
  self->_awayFromFrequentlyVisitedLOI = 1;
  self->_wifiLocationStarved = 1;
  [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&buf, 8);
}

void __35__RTIntermittentGNSSManager__setup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_shutdownWithHandler:(id)a3
{
  id v12 = a3;
  id v4 = [(RTIntermittentGNSSManager *)self locationManager];
  [v4 removeObserver:self];

  id v5 = [(RTIntermittentGNSSManager *)self motionActivityManager];
  [v5 removeObserver:self];

  id v6 = [(RTIntermittentGNSSManager *)self vehicleLocationProvider];
  [v6 removeObserver:self];

  uint64_t v7 = [(RTIntermittentGNSSManager *)self wifiManager];
  [v7 removeObserver:self];

  char v8 = [(RTIntermittentGNSSManager *)self wifiLocationStarvedTimer];
  [v8 invalidate];

  [(RTIntermittentGNSSManager *)self setWifiLocationStarvedTimer:0];
  uint64_t v9 = [(RTIntermittentGNSSManager *)self wifiScanTimer];
  [v9 invalidate];

  [(RTIntermittentGNSSManager *)self setWifiScanTimer:0];
  __int16 v10 = [(RTIntermittentGNSSManager *)self metrics];
  [v10 shutdown];

  id v11 = v12;
  if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    id v11 = v12;
  }
}

- (void)setCompletedInitialWifiScan:(BOOL)a3
{
  self->_completedInitialWifiScan = a3;
}

- (void)setUnsettled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_unsettled != a3)
  {
    self->_BOOL unsettled = a3;
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    lastSettledStateChangeDate = self->_lastSettledStateChangeDate;
    self->_lastSettledStateChangeDate = v4;

    id v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_unsettled) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      int v9 = 136315394;
      __int16 v10 = "-[RTIntermittentGNSSManager setUnsettled:]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, unsettled, %@", (uint8_t *)&v9, 0x16u);
    }

    char v8 = [(RTIntermittentGNSSManager *)self metrics];
    [v8 processSignalSwitch:2];

    [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];
  }
}

- (void)setLastDenseWifiScanResultDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastDenseWifiScanResultDate, a3);
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v5 stringFromDate];
    int v8 = 136315394;
    int v9 = "-[RTIntermittentGNSSManager setLastDenseWifiScanResultDate:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, lastDenseWifiScanResultDate, %@", (uint8_t *)&v8, 0x16u);
  }
  [(RTIntermittentGNSSManager *)self _updateWifiLocationStarvedTimer];
  [(RTIntermittentGNSSManager *)self setWifiLocationStarved:0];
}

- (void)setMotionActivityTypeSatisfied:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_motionActivityTypeSatisfied != a3)
  {
    BOOL v3 = a3;
    self->_motionActivityTypeSatisfied = a3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v8 = 136315394;
      int v9 = "-[RTIntermittentGNSSManager setMotionActivityTypeSatisfied:]";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, motionActivityTypeSatisfied, %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v7 = [(RTIntermittentGNSSManager *)self metrics];
    [v7 processSignalSwitch:1];

    [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];
  }
}

- (void)setAwayFromFrequentlyVisitedLOI:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(RTIntermittentGNSSManager *)self _completeRemoteStatusChecklistItem:2];
  if (self->_awayFromFrequentlyVisitedLOI != v3)
  {
    self->_awayFromFrequentlyVisitedLOI = v3;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v8 = 136315394;
      int v9 = "-[RTIntermittentGNSSManager setAwayFromFrequentlyVisitedLOI:]";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, awayFromFrequentlyVisitedLOI, %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v7 = [(RTIntermittentGNSSManager *)self metrics];
    [v7 processSignalSwitch:4];

    [(RTIntermittentGNSSManager *)self _considerRegisteringForIntermittentGNSS];
  }
}

- (void)setRegisteredForIntermittentGNSS:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_registeredForIntermittentGNSS != a3)
  {
    self->_registeredForIntermittentGNSS = a3;
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    lastRegisteredForIntermittentGNSSVariableFlipDate = self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
    self->_lastRegisteredForIntermittentGNSSVariableFlipDate = v4;

    notify_post((const char *)[@"RTIntermittentGNSSRegistrationStateDidChangeNotification" UTF8String]);
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_registeredForIntermittentGNSS) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      int v14 = 136315394;
      __int16 v15 = "-[RTIntermittentGNSSManager setRegisteredForIntermittentGNSS:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, register for intermittent gnss, %@", (uint8_t *)&v14, 0x16u);
    }

    if (self->_registeredForIntermittentGNSS)
    {
      [(RTIntermittentGNSSManager *)self _registerForRhythmicNonWakingLocation];
    }
    else
    {
      int v8 = [(RTIntermittentGNSSManager *)self metrics];
      int v9 = [v8 getLastRegistrationDate];

      __int16 v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:v9];
      uint64_t v12 = v11;

      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        __int16 v15 = "-[RTIntermittentGNSSManager setRegisteredForIntermittentGNSS:]";
        __int16 v16 = 2048;
        id v17 = v12;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, intermittent gnss duration, %.2f", (uint8_t *)&v14, 0x16u);
      }

      [(RTIntermittentGNSSManager *)self _unregisterForRhythmicNonWakingLocation];
    }
  }
}

- (void)_checkWifiDenseArea
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v4 = [(RTIntermittentGNSSManager *)self timerManager];
  id v5 = [(RTNotifier *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__RTIntermittentGNSSManager__checkWifiDenseArea__block_invoke;
  v12[3] = &unk_1E6B9A3F8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  id v6 = [v4 timerWithIdentifier:@"RTIntermittentGNSSWifiScanTimer" queue:v5 handler:v12];
  [(RTIntermittentGNSSManager *)self setWifiScanTimer:v6];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412290;
    __int16 v16 = v8;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, scheduling active wifi scan", buf, 0xCu);
  }
  int v9 = [(RTIntermittentGNSSManager *)self wifiManager];
  [v9 scheduleScanWithChannels:&unk_1F3453450];

  [(RTIntermittentGNSSManager *)self setActiveWifiScan:1];
  __int16 v10 = [(RTIntermittentGNSSManager *)self wifiScanTimer];
  [v10 fireAfterDelay:1.0];

  __int16 v11 = [(RTIntermittentGNSSManager *)self wifiScanTimer];
  [v11 resume];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __48__RTIntermittentGNSSManager__checkWifiDenseArea__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained wifiScanTimer];
  [v3 invalidate];

  [WeakRetained setWifiScanTimer:0];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, active wifi scan timer expiry", (uint8_t *)&v6, 0xCu);
  }
  [WeakRetained _processWifiScanResults];
}

- (BOOL)_frequentlyVisitedLocationOfInterest:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 location];
    int v6 = [v5 location];
    [v6 horizontalUncertainty];
    double v8 = v7;

    if (v8 <= 250.0)
    {
      __int16 v10 = [v4 visits];
      __int16 v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = [v10 firstObject];
      uint64_t v13 = [v12 entryDate];
      int v14 = [v11 dateByAddingTimeInterval:-604800.0];
      [v13 timeIntervalSinceDate:v14];
      if (v15 <= 0.0)
      {
        uint64_t v16 = [v10 count];

        if (v16)
        {
          uint64_t v17 = [v10 firstObject];
          uint64_t v18 = [v17 entryDate];

          id v36 = v11;
          id v19 = [v11 dateByAddingTimeInterval:-2419200.0];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          objc_super v37 = v10;
          id v20 = v10;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v39;
            double v24 = 1.0;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v39 != v23) {
                  objc_enumerationMutation(v20);
                }
                dispatch_time_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                id v27 = [v26 entryDate];
                char v28 = [v27 isBeforeDate:v19];

                if ((v28 & 1) == 0)
                {
                  double v29 = [v26 entryDate];
                  [v29 timeIntervalSinceDate:v18];
                  double v31 = v30;

                  if (v31 >= 14400.0)
                  {
                    double v24 = v24 + 1.0;
                    uint64_t v32 = [v26 entryDate];

                    uint64_t v18 = (void *)v32;
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v52 count:16];
            }
            while (v22);
          }
          else
          {
            double v24 = 1.0;
          }

          id v33 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = [v19 stringFromDate];
            *(_DWORD *)long long buf = 136316162;
            v43 = "-[RTIntermittentGNSSManager _frequentlyVisitedLocationOfInterest:]";
            __int16 v44 = 2112;
            v45 = v4;
            __int16 v46 = 2112;
            v47 = v34;
            __int16 v48 = 2048;
            double v49 = v24 * 0.25;
            __int16 v50 = 2048;
            double v51 = v24;
            _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%s, loi, %@, lookbackWindowStartDate, %@, visitDensityPastFourWeeks, %.2f, numVisitsPastFourWeeks, %.2f", buf, 0x34u);
          }
          BOOL v9 = v24 * 0.25 >= 0.75;

          __int16 v11 = v36;
          __int16 v10 = v37;
          goto LABEL_23;
        }
      }
      else
      {
      }
      BOOL v9 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  BOOL v9 = 0;
LABEL_24:

  return v9;
}

- (id)_locationsOfInterestNearLocation:(id)a3 error:(id *)a4
{
  aSelector = a2;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v49 = 0;
  __int16 v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__158;
  uint64_t v53 = __Block_byref_object_dispose__158;
  id v54 = 0;
  uint64_t v43 = 0;
  __int16 v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  __int16 v46 = __Block_byref_object_copy__158;
  v47 = __Block_byref_object_dispose__158;
  id v48 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  double v8 = [(RTIntermittentGNSSManager *)self learnedLocationManager];
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  long long v38 = __68__RTIntermittentGNSSManager__locationsOfInterestNearLocation_error___block_invoke;
  long long v39 = &unk_1E6B905F0;
  long long v41 = &v49;
  BOOL v42 = &v43;
  BOOL v9 = v7;
  long long v40 = v9;
  [v8 fetchLocationsOfInterestWithinDistance:v6 ofLocation:&v36 handler:1000.0];

  __int16 v10 = v9;
  __int16 v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] now:aSelector, v36, v37, v38, v39];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  uint64_t v16 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_116];
  uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v19 = [v18 filteredArrayUsingPredicate:v17];
  id v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  *(void *)long long buf = @"semaphore wait timeout";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
  double v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_6:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v44 + 5, v25);
  }
  if (v44[5])
  {
    char v28 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v34 = NSStringFromSelector(aSelector);
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTIntermittentGNSSManager _locationsOfInterestNearLocation:error:]";
      __int16 v56 = 2112;
      id v57 = v34;
      _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);
    }
    id v29 = 0;
    if (a4) {
      *a4 = v44[5];
    }
  }
  else
  {
    double v30 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = [(id)v50[5] count];
      uint64_t v32 = v50[5];
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[RTIntermittentGNSSManager _locationsOfInterestNearLocation:error:]";
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 2048;
      uint64_t v59 = v31;
      __int16 v60 = 2112;
      uint64_t v61 = v32;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%s, location, %@, loi count, %lu, LOIs, %@", buf, 0x2Au);
    }

    id v29 = (id)v50[5];
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v29;
}

void __68__RTIntermittentGNSSManager__locationsOfInterestNearLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_motionActivityConditionsSatisifed:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 type] == 2 || objc_msgSend(v5, "type") == 3 || objc_msgSend(v5, "type") == 5) {
      BOOL v6 = [v5 confidence] == 2
    }
        || [v5 confidence] == 3
        || [(RTIntermittentGNSSManager *)self motionActivityTypeSatisfied]
        || [(RTIntermittentGNSSManager *)self currentDominantMotionType] == 6;
    else {
      BOOL v6 = [v5 type] == 6
    }
        && [(RTIntermittentGNSSManager *)self motionActivityTypeSatisfied];
    -[RTIntermittentGNSSManager setCurrentDominantMotionType:](self, "setCurrentDominantMotionType:", [v5 type]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_processWifiScanResults
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(RTIntermittentGNSSManager *)self _wifiDenseConditionsMet];
  id v4 = [(RTIntermittentGNSSManager *)self accessPoints];
  [v4 removeAllObjects];

  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    [(RTIntermittentGNSSManager *)self setLastDenseWifiScanResultDate:v5];
  }
  [(RTIntermittentGNSSManager *)self setCompletedInitialWifiScan:1];
  if ([(RTIntermittentGNSSManager *)self activeWifiScan])
  {
    if (!v3) {
      [(RTIntermittentGNSSManager *)self setWifiLocationStarved:1];
    }
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[RTIntermittentGNSSManager _processWifiScanResults]";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Cancelling wifi scan", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [(RTIntermittentGNSSManager *)self wifiManager];
    [v7 cancelScan];

    [(RTIntermittentGNSSManager *)self setActiveWifiScan:0];
  }
}

- (BOOL)_wifiDenseConditionsMet
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(RTIntermittentGNSSManager *)self accessPoints];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * i) rssi] > -96) {
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromSelector(a2);
    if (v7 <= 5) {
      id v12 = @"NO";
    }
    else {
      id v12 = @"YES";
    }
    uint64_t v13 = [(RTIntermittentGNSSManager *)self accessPoints];
    uint64_t v14 = [v13 count];
    double v15 = [(RTIntermittentGNSSManager *)self accessPoints];
    *(_DWORD *)long long buf = 138413314;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    double v24 = v12;
    __int16 v25 = 2048;
    unint64_t v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    double v30 = v15;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, wifiDense, %@, strong access points count, %lu/%lu, accessPoints, %@", buf, 0x34u);
  }
  return v7 > 5;
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = [(RTIntermittentGNSSManager *)self metrics];
  uint64_t v5 = [v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTIntermittentGNSSManager_onDailyMetricsNotification___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v5, block);
}

void __56__RTIntermittentGNSSManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) metrics];
  [v1 submitDailyMetricsToCoreAnalytics];
}

- (void)onMotionActivityManagerNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __65__RTIntermittentGNSSManager_onMotionActivityManagerNotification___block_invoke;
  id v11 = &unk_1E6B90BF0;
  id v12 = v4;
  uint64_t v13 = self;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1E016DB00](&v8);
  unint64_t v7 = [(RTNotifier *)self queue];
  dispatch_async(v7, v6);
}

void __65__RTIntermittentGNSSManager_onMotionActivityManagerNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  BOOL v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 settledState];
    if (v6 == 1)
    {
      unint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = 1;
    }
    else
    {
      if (v6 != 2) {
        return;
      }
      unint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = 0;
    }
    [v7 setUnsettled:v8];
  }
  else
  {
    uint64_t v9 = [v5 name];
    uint64_t v10 = +[RTNotification notificationName];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) dominantMotionActivity];
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        double v15 = "-[RTIntermittentGNSSManager onMotionActivityManagerNotification:]_block_invoke";
        __int16 v16 = 2112;
        long long v17 = v12;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, dominantMotionActivityNotification activity, %@", (uint8_t *)&v14, 0x16u);
      }

      [*(id *)(a1 + 40) setMotionActivityTypeSatisfied:objc_msgSend(*(id *)(a1 + 40), "_motionActivityConditionsSatisifed:", v12)];
    }
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __56__RTIntermittentGNSSManager_onVehicleEventNotification___block_invoke;
  int v11 = &unk_1E6B90BF0;
  id v12 = v4;
  uint64_t v13 = self;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1E016DB00](&v8);
  unint64_t v7 = [(RTNotifier *)self queue];
  dispatch_async(v7, v6);
}

void __56__RTIntermittentGNSSManager_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  BOOL v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 vehicleEvents];
    unint64_t v7 = [v6 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 date];

    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v8 stringFromDate];
      int v15 = 136315394;
      __int16 v16 = "-[RTIntermittentGNSSManager onVehicleEventNotification:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, received vehicle event with date, %@, ", (uint8_t *)&v15, 0x16u);
    }
    int v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:v8];
    if (v12 <= 600.0)
    {
      char v14 = [*(id *)(a1 + 40) wifiLocationStarved];

      if ((v14 & 1) == 0) {
        [*(id *)(a1 + 40) _checkWifiDenseArea];
      }
    }
    else
    {
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [*(id *)(a1 + 32) name];
      int v15 = 136315394;
      __int16 v16 = "-[RTIntermittentGNSSManager onVehicleEventNotification:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, notification not supported, %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)onWifiScanResultsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RTIntermittentGNSSManager_onWifiScanResultsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__RTIntermittentGNSSManager_onWifiScanResultsNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) scanResults];
    v2 = [*(id *)(a1 + 40) accessPoints];
    [v2 addObjectsFromArray:v3];

    [*(id *)(a1 + 40) _processWifiScanResults];
  }
}

+ (id)overrideStateToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"RTIntermittentGNSSManagerRegistrationOverrideUnsupported";
  }
  else {
    return off_1E6B9C5B0[a3];
  }
}

- (void)fetchIntermittentGNSSRegistrationStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__RTIntermittentGNSSManager_fetchIntermittentGNSSRegistrationStateWithHandler___block_invoke;
    v7[3] = &unk_1E6B90D08;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);

    id v6 = v8;
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __79__RTIntermittentGNSSManager_fetchIntermittentGNSSRegistrationStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 34), 0);
}

- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    if (a3 < 3)
    {
      double v12 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__RTIntermittentGNSSManager_updateIntermittentGNSSRegistrationOverrideState_handler___block_invoke;
      block[3] = &unk_1E6B921E0;
      block[4] = self;
      unint64_t v15 = a3;
      id v14 = v6;
      dispatch_async(v12, block);
    }
    else
    {
      unint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F5CFE8];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"intermittent gnss override state out of range.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v10 = [v7 errorWithDomain:v8 code:7 userInfo:v9];
      (*((void (**)(id, void *))v6 + 2))(v6, v10);
    }
  }
  else
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __85__RTIntermittentGNSSManager_updateIntermittentGNSSRegistrationOverrideState_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) platform];
  int v3 = [v2 internalInstall];

  if (v3)
  {
    *(void *)(*(void *)(a1 + 32) + 240) = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) _considerRegisteringForIntermittentGNSS];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __64__RTIntermittentGNSSManager__initializeWifiLocationStarvedTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    uint64_t v5 = v4;
    id v6 = [*(id *)(a1 + 40) lastWifiLocationDate];
    [v2 timeIntervalSinceDate:v6];
    int v9 = 136315906;
    uint64_t v10 = "-[RTIntermittentGNSSManager _initializeWifiLocationStarvedTimer]_block_invoke";
    __int16 v11 = 2112;
    double v12 = @"RTIntermittentGNSSLocationStarvedTimer";
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, location starved timer fired, timerIdentifier, %@,  %.2f since created, %.2f since lastWifiLocationDate", (uint8_t *)&v9, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _onLocationStarvedTimerExpiry];
}

- (void)_onLocationStarvedTimerExpiry
{
}

- (BOOL)_dutyCyclingConditionMet
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int v3 = [(RTIntermittentGNSSManager *)self platform];
  int v4 = [v3 internalInstall];

  if (!v4) {
    goto LABEL_31;
  }
  uint64_t v5 = [(RTIntermittentGNSSManager *)self defaultsManager];
  id v6 = [v5 objectForKey:@"RTDefaultsIntermittentGNSSBypassAllSignals"];
  if (v6)
  {

    goto LABEL_5;
  }
  char v7 = _os_feature_enabled_impl();

  if (v7)
  {
LABEL_5:
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315138;
      long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      uint64_t v10 = "%s, defaults override: bypassing all signals, should register for intermittent gnss";
LABEL_34:
      __int16 v27 = v8;
      uint32_t v28 = 12;
LABEL_35:
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v38, v28);
      goto LABEL_65;
    }
    goto LABEL_65;
  }
  __int16 v11 = [(RTIntermittentGNSSManager *)self defaultsManager];
  double v12 = [v11 objectForKey:@"RTDefaultsIntermittentGNSSBypassDominantMotionCheck"];
  if (v12)
  {
  }
  else
  {
    char v13 = _os_feature_enabled_impl();

    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
  }
  self->_motionActivityTypeSatisfied = 1;
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v38 = 136315138;
    long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing dominant motion check", (uint8_t *)&v38, 0xCu);
  }

LABEL_13:
  __int16 v15 = [(RTIntermittentGNSSManager *)self defaultsManager];
  uint64_t v16 = [v15 objectForKey:@"RTDefaultsIntermittentGNSSBypassSettledStateCheck"];
  if (v16)
  {
  }
  else
  {
    char v17 = _os_feature_enabled_impl();

    if ((v17 & 1) == 0) {
      goto LABEL_19;
    }
  }
  self->_BOOL unsettled = 1;
  uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v38 = 136315138;
    long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing settled state check", (uint8_t *)&v38, 0xCu);
  }

LABEL_19:
  uint64_t v19 = [(RTIntermittentGNSSManager *)self defaultsManager];
  long long v20 = [v19 objectForKey:@"RTDefaultsIntermittentGNSSBypassFrequentLOICheck"];
  if (v20)
  {

LABEL_22:
    self->_BOOL awayFromFrequentlyVisitedLOI = 1;
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315138;
      long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing frequent LOI check", (uint8_t *)&v38, 0xCu);
    }

    goto LABEL_25;
  }
  char v21 = _os_feature_enabled_impl();

  if (v21) {
    goto LABEL_22;
  }
LABEL_25:
  __int16 v23 = [(RTIntermittentGNSSManager *)self defaultsManager];
  double v24 = [v23 objectForKey:@"RTDefaultsIntermittentGNSSBypassWifiAvailabilityCheck"];
  if (v24)
  {
  }
  else
  {
    char v25 = _os_feature_enabled_impl();

    if ((v25 & 1) == 0) {
      goto LABEL_31;
    }
  }
  self->_BOOL wifiLocationStarved = 1;
  unint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    int v38 = 136315138;
    long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing wifi availability check", (uint8_t *)&v38, 0xCu);
  }

LABEL_31:
  if ([(RTIntermittentGNSSManager *)self intermittentGNSSOverrideState] == 1)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315138;
      long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      uint64_t v10 = "%s, ignoring conditions, user set intermittent gnss to ON until further user action";
      goto LABEL_34;
    }
  }
  else if ([(RTIntermittentGNSSManager *)self intermittentGNSSOverrideState] == 2)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315138;
      long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, ignoring conditions, user set intermittent gnss to OFF until further user action", (uint8_t *)&v38, 0xCu);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    BOOL v9 = self->_motionActivityTypeSatisfied
      && self->_unsettled
      && self->_signalEnvironmentAtRisk
      && self->_awayFromFrequentlyVisitedLOI
      && self->_wifiLocationStarved;
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v29 = @"NO";
      if (v9) {
        double v30 = @"YES";
      }
      else {
        double v30 = @"NO";
      }
      if (self->_motionActivityTypeSatisfied) {
        uint64_t v31 = @"YES";
      }
      else {
        uint64_t v31 = @"NO";
      }
      BOOL awayFromFrequentlyVisitedLOI = self->_awayFromFrequentlyVisitedLOI;
      if (self->_unsettled) {
        id v33 = @"YES";
      }
      else {
        id v33 = @"NO";
      }
      BOOL wifiLocationStarved = self->_wifiLocationStarved;
      if (self->_signalEnvironmentAtRisk) {
        id v35 = @"YES";
      }
      else {
        id v35 = @"NO";
      }
      int v38 = 136316674;
      long long v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      if (awayFromFrequentlyVisitedLOI) {
        uint64_t v36 = @"YES";
      }
      else {
        uint64_t v36 = @"NO";
      }
      __int16 v40 = 2112;
      if (wifiLocationStarved) {
        __int16 v29 = @"YES";
      }
      long long v41 = v30;
      __int16 v42 = 2112;
      uint64_t v43 = v31;
      __int16 v44 = 2112;
      uint64_t v45 = v33;
      __int16 v46 = 2112;
      v47 = v35;
      __int16 v48 = 2112;
      uint64_t v49 = v36;
      __int16 v50 = 2112;
      uint64_t v51 = v29;
      uint64_t v10 = "%s, conditions satisfied, %@, motionActivityTypeSatisfied, %@, unsettled, %@, signalEnvironmentAtRisk, %@, a"
            "wayFromFrequentlyVisitedLOI, %@, locationStarved, %@";
      __int16 v27 = v8;
      uint32_t v28 = 72;
      goto LABEL_35;
    }
  }
LABEL_65:

  return v9;
}

- (void)_considerRegisteringForIntermittentGNSS
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v3 = [(RTIntermittentGNSSManager *)self conditionCheckTimer];

  if (!v3)
  {
    int v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = [(RTIntermittentGNSSManager *)self lastRegisteredForIntermittentGNSSVariableFlipDate];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    double v8 = fmax(v7, 0.0);
    if (v8 >= 120.0)
    {
      BOOL v18 = [(RTIntermittentGNSSManager *)self _dutyCyclingConditionMet];
      [(RTIntermittentGNSSManager *)self setRegisteredForIntermittentGNSS:v18];
    }
    else
    {
      BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      double v10 = fmax(120.0 - v8, 1.0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = [(RTIntermittentGNSSManager *)self lastRegisteredForIntermittentGNSSVariableFlipDate];
        double v12 = [v11 stringFromDate];
        *(_DWORD *)long long buf = 136315906;
        unint64_t v26 = "-[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS]";
        __int16 v27 = 2048;
        uint64_t v28 = 0x405E000000000000;
        __int16 v29 = 2112;
        double v30 = v12;
        __int16 v31 = 2048;
        double v32 = v10;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, minimum required time for gnss registration flip not met, RTIntermittentGNSSDutyCycleMinFlipTime, %.2f, lastDutyCyclingConditionCheckDate, %@, time until next allowed flip, %.2f", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, self);
      char v13 = [(RTIntermittentGNSSManager *)self timerManager];
      uint64_t v14 = [(RTNotifier *)self queue];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      char v21 = __68__RTIntermittentGNSSManager__considerRegisteringForIntermittentGNSS__block_invoke;
      uint64_t v22 = &unk_1E6B917C8;
      objc_copyWeak(&v24, (id *)buf);
      __int16 v23 = self;
      __int16 v15 = [v13 timerWithIdentifier:@"RTIntermittentGNSSConditionCheckTimer" queue:v14 handler:&v19];
      -[RTIntermittentGNSSManager setConditionCheckTimer:](self, "setConditionCheckTimer:", v15, v19, v20, v21, v22);

      uint64_t v16 = [(RTIntermittentGNSSManager *)self conditionCheckTimer];
      [v16 fireAfterDelay:v10];

      char v17 = [(RTIntermittentGNSSManager *)self conditionCheckTimer];
      [v17 resume];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __68__RTIntermittentGNSSManager__considerRegisteringForIntermittentGNSS__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = [WeakRetained conditionCheckTimer];
  [v3 invalidate];

  [WeakRetained setConditionCheckTimer:0];
  [*(id *)(a1 + 32) setRegisteredForIntermittentGNSS:[WeakRetained _dutyCyclingConditionMet]];
  int v4 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 34)) {
      uint64_t v5 = @"YES";
    }
    else {
      uint64_t v5 = @"NO";
    }
    int v6 = 136315394;
    double v7 = "-[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS]_block_invoke";
    __int16 v8 = 2112;
    BOOL v9 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, condition check timer expired and conditions for intermittentGNSS registration checked, registeredForIntermittentGNSS, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_registerForRhythmicNonWakingLocation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(RTIntermittentGNSSManager *)self platformSupported])
  {
    int v3 = [(RTIntermittentGNSSManager *)self locationManager];
    int v4 = +[RTNotification notificationName];
    [v3 addObserver:self selector:sel_onNoOpLocationNotification_ name:v4];
  }
  else
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[RTIntermittentGNSSManager _registerForRhythmicNonWakingLocation]";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, platform not supported, skipping actual registration for rhythmic location", (uint8_t *)&v6, 0xCu);
    }
  }

  uint64_t v5 = [(RTIntermittentGNSSManager *)self metrics];
  [v5 updateMetricsForKey:@"register"];
}

- (void)_unregisterForRhythmicNonWakingLocation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(RTIntermittentGNSSManager *)self platformSupported])
  {
    int v3 = [(RTIntermittentGNSSManager *)self locationManager];
    int v4 = +[RTNotification notificationName];
    [v3 removeObserver:self fromNotification:v4];
  }
  else
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      double v7 = "-[RTIntermittentGNSSManager _unregisterForRhythmicNonWakingLocation]";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, platform not supported, skipping actual unregistration for rhythmic location since no registration occurred", (uint8_t *)&v6, 0xCu);
    }
  }

  uint64_t v5 = [(RTIntermittentGNSSManager *)self metrics];
  [v5 updateMetricsForKey:@"unregister"];
}

- (void)fetchRemoteStatusWithHandler:(id)a3
{
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke;
    v14[3] = &unk_1E6B90CE0;
    v14[4] = self;
    id v15 = v5;
    double v7 = (void *)MEMORY[0x1E016DB00](v14);
    uint64_t v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_105;
    block[3] = &unk_1E6B921E0;
    block[4] = self;
    id v12 = v7;
    SEL v13 = a2;
    id v9 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) remoteStatusChecklist] != 15)
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, checklist not yet complete, status unknown", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_19;
  }
  int v2 = [*(id *)(a1 + 32) currentSignalEnvironment];
  if ((v2 - 2) < 3
    || (v2 != 1 ? (BOOL v5 = v2 == 6) : (BOOL v5 = 1),
        !v5 && (char v9 = [*(id *)(a1 + 32) signalEnvironmentAtRisk], (v9 & 1) == 0)))
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      int v4 = "%s, signal environment does not appear to be remote, status accessible";
LABEL_18:
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v18, 0xCu);
    }
LABEL_19:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  if (([*(id *)(a1 + 32) wifiLocationStarved] & 1) == 0)
  {
    int v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      int v4 = "%s, recent WiFi location, status accessible";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v6 = [*(id *)(a1 + 32) lastDenseWifiScanResultDate];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v10 = v8;

  __int16 v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;

  if (v13 <= 840.0)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      char v17 = "%s, dense WiFi, status accessible";
LABEL_32:
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    char v14 = [*(id *)(a1 + 32) awayFromFrequentlyVisitedLOI];
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        int v18 = 136315138;
        uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, status remote", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_33;
    }
    if (v16)
    {
      int v18 = 136315138;
      uint64_t v19 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      char v17 = "%s, near loi, status accessible";
      goto LABEL_32;
    }
  }
LABEL_33:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_105(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) remoteStatusChecklist] == 15)
  {
    int v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) remoteStatusDispatcher];
    if (v3)
    {
      int v4 = (RTInvocationDispatcher *)v3;
      BOOL v5 = @"NO";
    }
    else
    {
      int v6 = [RTInvocationDispatcher alloc];
      double v7 = [*(id *)(a1 + 32) queue];
      int v4 = [(RTInvocationDispatcher *)v6 initWithQueue:v7];

      [*(id *)(a1 + 32) setRemoteStatusDispatcher:v4];
      if (([*(id *)(a1 + 32) completedInitialWifiScan] & 1) == 0)
      {
        id v8 = [*(id *)(a1 + 32) wifiManager];
        [v8 scheduleScan];
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_2;
      v18[3] = &unk_1E6B90E70;
      v18[4] = *(void *)(a1 + 32);
      char v9 = (void *)MEMORY[0x1E016DB00](v18);
      uint64_t v10 = [*(id *)(a1 + 32) timerManager];
      __int16 v11 = [*(id *)(a1 + 32) queue];
      double v12 = [v10 timerWithIdentifier:@"RTIntermittentGNSSFetchRemoteStatusTimeoutTimer" queue:v11 handler:v9];

      [v12 fireAfterDelay:660.0];
      [v12 resume];
      [*(id *)(a1 + 32) setRemoteStatusTimeoutTimer:v12];

      BOOL v5 = @"YES";
    }
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v20 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, enqueueing handler, created dispatcher? %@", buf, 0x16u);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = (objc_class *)objc_opt_class();
    BOOL v16 = NSStringFromClass(v15);
    char v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [(RTInvocationDispatcher *)v4 enqueueBlock:v14, @"%@-%@", v16, v17 description];
  }
}

void __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) remoteStatusDispatcher];

  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      int v6 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, timing out enqueued handlers", (uint8_t *)&v5, 0xCu);
    }

    int v4 = [*(id *)(a1 + 32) remoteStatusDispatcher];
    [v4 dispatchPendingInvocations];

    [*(id *)(a1 + 32) setRemoteStatusDispatcher:0];
    [*(id *)(a1 + 32) setRemoteStatusTimeoutTimer:0];
  }
}

- (void)setRemoteStatusChecklist:(unint64_t)a3
{
  self->_remoteStatusChecklist = a3;
}

- (RTInvocationDispatcher)remoteStatusDispatcher
{
  return self->_remoteStatusDispatcher;
}

- (void)setRemoteStatusDispatcher:(id)a3
{
}

- (RTTimer)remoteStatusTimeoutTimer
{
  return self->_remoteStatusTimeoutTimer;
}

- (void)setRemoteStatusTimeoutTimer:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
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

- (void)setMetrics:(id)a3
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

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (RTTimer)conditionCheckTimer
{
  return self->_conditionCheckTimer;
}

- (void)setConditionCheckTimer:(id)a3
{
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (NSDate)lastRegisteredForIntermittentGNSSVariableFlipDate
{
  return self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
}

- (void)setLastRegisteredForIntermittentGNSSVariableFlipDate:(id)a3
{
}

- (void)setLastLOINearbyCheckDate:(id)a3
{
}

- (NSDate)lastSettledStateChangeDate
{
  return self->_lastSettledStateChangeDate;
}

- (void)setLastSettledStateChangeDate:(id)a3
{
}

- (BOOL)awayFromFrequentlyVisitedLOI
{
  return self->_awayFromFrequentlyVisitedLOI;
}

- (BOOL)motionActivityTypeSatisfied
{
  return self->_motionActivityTypeSatisfied;
}

- (BOOL)registeredForIntermittentGNSS
{
  return self->_registeredForIntermittentGNSS;
}

- (BOOL)settledStateLOIVerified
{
  return self->_settledStateLOIVerified;
}

- (void)setSettledStateLOIVerified:(BOOL)a3
{
  self->_settledStateLOIVerified = a3;
}

- (BOOL)unsettled
{
  return self->_unsettled;
}

- (BOOL)completedInitialWifiScan
{
  return self->_completedInitialWifiScan;
}

- (BOOL)wifiLocationStarved
{
  return self->_wifiLocationStarved;
}

- (BOOL)activeWifiScan
{
  return self->_activeWifiScan;
}

- (void)setActiveWifiScan:(BOOL)a3
{
  self->_activeWifiScan = a3;
}

- (double)totalDailyDuration
{
  return self->_totalDailyDuration;
}

- (void)setTotalDailyDuration:(double)a3
{
  self->_totalDailyDuration = a3;
}

- (int)currentSignalEnvironment
{
  return self->_currentSignalEnvironment;
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
}

- (unint64_t)currentDominantMotionType
{
  return self->_currentDominantMotionType;
}

- (void)setCurrentDominantMotionType:(unint64_t)a3
{
  self->_currentDominantMotionType = a3;
}

- (unint64_t)intermittentGNSSOverrideState
{
  return self->_intermittentGNSSOverrideState;
}

- (void)setIntermittentGNSSOverrideState:(unint64_t)a3
{
  self->_intermittentGNSSOverrideState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_lastDenseWifiScanResultDate, 0);
  objc_storeStrong((id *)&self->_lastWifiLocationDate, 0);
  objc_storeStrong((id *)&self->_lastSettledStateChangeDate, 0);
  objc_storeStrong((id *)&self->_lastLOINearbyCheckDate, 0);
  objc_storeStrong((id *)&self->_lastRegisteredForIntermittentGNSSVariableFlipDate, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_wifiLocationStarvedTimer, 0);
  objc_storeStrong((id *)&self->_conditionCheckTimer, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_remoteStatusTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_remoteStatusDispatcher, 0);
}

@end