@interface MNArrivalUpdater
- (BOOL)_checkForParkingDetectionRegion;
- (BOOL)isApproachingWaypoint;
- (BOOL)isInPreArrivalRegion;
- (GEOComposedRoute)route;
- (GEOComposedRouteLeg)targetLeg;
- (MNArrivalUpdater)init;
- (MNNavigationSessionState)navigationSessionState;
- (MNObserverHashTable)safeDelegate;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_updateForParkingDetectionRegion;
- (void)_updateTimeoutRegions;
- (void)arrivalRegionTimerDidFire:(id)a3;
- (void)changeState:(id)a3;
- (void)dealloc;
- (void)evChargingStateMonitor:(id)a3 didChangeChargingState:(BOOL)a4;
- (void)evChargingStateMonitor:(id)a3 didReachTargetBatteryCharge:(id)a4;
- (void)evChargingStateMonitorShouldShowChargingInfo:(id)a3;
- (void)forceDepartureForCurrentLeg:(unint64_t)a3;
- (void)parkedVehicleDetectorDidDetectParkedVehicle:(id)a3;
- (void)parkedVehicleDetectorDidDetectResumeDriving:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)start;
- (void)startMonitoringForEV;
- (void)stop;
- (void)stopMonitoringForEV;
- (void)updateForLocation:(id)a3;
@end

@implementation MNArrivalUpdater

- (MNArrivalUpdater)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNArrivalUpdater;
  v2 = [(MNArrivalUpdater *)&v6 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(MNArrivalUpdater *)self stop];
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNArrivalUpdater;
  [(MNArrivalUpdater *)&v3 dealloc];
}

- (MNNavigationSessionState)navigationSessionState
{
  return [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
}

- (void)setNavigationSessionState:(id)a3
{
  id v24 = a3;
  v4 = [v24 currentRouteInfo];
  v5 = [v4 routeID];
  objc_super v6 = [(MNArrivalUpdater *)self route];
  v7 = [v6 uniqueRouteID];
  char v8 = [v5 isEqual:v7];

  uint64_t v9 = [v24 targetLegIndex];
  v10 = [(MNArrivalUpdater *)self navigationSessionState];
  uint64_t v11 = [v10 targetLegIndex];

  if (!self->_details)
  {
    v12 = objc_alloc_init(_MNArrivalUpdaterDetails);
    details = self->_details;
    self->_details = v12;

    [(_MNArrivalUpdaterState *)self->_currentState setDetails:self->_details];
  }
  v14 = (void *)[v24 copy];
  [(_MNArrivalUpdaterDetails *)self->_details setNavigationSessionState:v14];

  if (v9 == v11) {
    char v15 = v8;
  }
  else {
    char v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    [(MNArrivalUpdater *)self _updateTimeoutRegions];
    v16 = [(MNArrivalUpdater *)self route];
    int v17 = [v16 transportType];

    parkedVehicleDetector = self->_parkedVehicleDetector;
    if (v17)
    {
      if (parkedVehicleDetector)
      {
        [(MNParkedVehicleDetector *)parkedVehicleDetector stopMonitoring];
        [(MNParkedVehicleDetector *)self->_parkedVehicleDetector setDelegate:0];
        v19 = self->_parkedVehicleDetector;
        self->_parkedVehicleDetector = 0;
      }
    }
    else if (!parkedVehicleDetector)
    {
      v20 = objc_alloc_init(MNParkedVehicleDetector);
      v21 = self->_parkedVehicleDetector;
      self->_parkedVehicleDetector = v20;

      [(MNParkedVehicleDetector *)self->_parkedVehicleDetector setDelegate:self];
      [(MNParkedVehicleDetector *)self->_parkedVehicleDetector startMonitoring];
    }
  }
  v22 = self->_parkedVehicleDetector;
  v23 = [v24 location];
  [(MNParkedVehicleDetector *)v22 updateForLocation:v23];
}

- (void)setDelegate:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v4 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E3CDA8];
    safeDelegate = self->_safeDelegate;
    self->_safeDelegate = v4;

    [(MNObserverHashTable *)self->_safeDelegate registerObserver:v7];
  }
  else
  {
    objc_super v6 = self->_safeDelegate;
    self->_safeDelegate = 0;
  }
}

- (void)start
{
  if (!self->_currentState)
  {
    objc_super v3 = objc_alloc_init(_MNArrivalUpdaterState_None);
    [(MNArrivalUpdater *)self changeState:v3];
  }
}

- (void)stop
{
  currentState = self->_currentState;
  self->_currentState = 0;

  [(MNParkedVehicleDetector *)self->_parkedVehicleDetector stopMonitoring];
  parkedVehicleDetector = self->_parkedVehicleDetector;
  [(MNParkedVehicleDetector *)parkedVehicleDetector setDelegate:0];
}

- (void)updateForLocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MNArrivalUpdater *)self _updateForParkingDetectionRegion];
  [(_MNArrivalUpdaterState *)self->_currentState updateForLocation];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_timeoutRegions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "updateForLocation:", v4, (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10 = [(_MNArrivalUpdaterDetails *)self->_details evChargingStateMonitor];
  [v10 updateForLocation:v4];
}

- (void)forceDepartureForCurrentLeg:(unint64_t)a3
{
  id v4 = [[_MNArrivalUpdaterState_None alloc] initWithDepartureReason:a3];
  [(MNArrivalUpdater *)self changeState:v4];
}

- (void)_updateForParkingDetectionRegion
{
  BOOL v3 = [(MNArrivalUpdater *)self _checkForParkingDetectionRegion];
  if (v3 != [(_MNArrivalUpdaterDetails *)self->_details isInParkingDetectionRegion])
  {
    [(_MNArrivalUpdaterDetails *)self->_details setIsInParkingDetectionRegion:v3];
    id v4 = GEOFindOrCreateLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Entered parking detection region.", buf, 2u);
      }

      [(MNObserverHashTable *)self->_safeDelegate arrivalUpdaterDidEnterParkingDetectionRegion:self];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Left parking detection region.", v6, 2u);
      }

      [(MNObserverHashTable *)self->_safeDelegate arrivalUpdaterDidLeaveParkingDetectionRegion:self];
    }
  }
}

- (BOOL)_checkForParkingDetectionRegion
{
  BOOL v3 = [(MNArrivalUpdater *)self route];
  int v4 = [v3 transportType];

  if (v4) {
    return 0;
  }
  BOOL v5 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  int v6 = [v5 isOnLastLeg];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  uint64_t v8 = [v7 location];

  uint64_t v9 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  v10 = [v9 targetLeg];
  long long v11 = [v10 arrivalParameters];

  long long v12 = objc_opt_new();
  [(_MNArrivalUpdaterState *)self->_currentState parkingDetectionExcludeRadius];
  objc_msgSend(v12, "setExcludeDistancePadding:");
  if ([v11 containsLocation:v8 arrivalRegionType:6 parameters:v12]) {
    char v13 = 1;
  }
  else {
    char v13 = [v11 containsLocation:v8 arrivalRegionType:8 parameters:v12];
  }

  return v13;
}

- (BOOL)isInPreArrivalRegion
{
  return [(_MNArrivalUpdaterState *)self->_currentState state] == 3;
}

- (BOOL)isApproachingWaypoint
{
  return [(_MNArrivalUpdaterState *)self->_currentState state] == 2;
}

- (void)_updateTimeoutRegions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  timeoutRegions = self->_timeoutRegions;
  self->_timeoutRegions = 0;

  int v4 = [(MNArrivalUpdater *)self route];
  if (v4)
  {
    BOOL v5 = [(MNArrivalUpdater *)self targetLeg];
    int v6 = [v5 arrivalParameters];

    if (v6)
    {
      uint64_t v7 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
      uint64_t v8 = [v7 location];

      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v19 = v6;
      v10 = [v6 arrivalMapRegions];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            char v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ([v15 arrivalRegionAction] == 4)
            {
              uint64_t v16 = [[MNArrivalRegionTimer alloc] initWithArrivalRegion:v15];
              int v17 = v16;
              if (v16)
              {
                [(MNArrivalRegionTimer *)v16 setDelegate:self];
                [(NSMutableArray *)v9 addObject:v17];
                if (v8) {
                  [(MNArrivalRegionTimer *)v17 updateForLocation:v8];
                }
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }

      v18 = self->_timeoutRegions;
      self->_timeoutRegions = v9;

      int v6 = v19;
    }
  }
}

- (void)changeState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_currentState = &self->_currentState;
  currentState = self->_currentState;
  if (currentState && (uint64_t v8 = -[_MNArrivalUpdaterState state](currentState, "state"), v8 == [v5 state]))
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (_MNArrivalUpdaterState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      LODWORD(v16) = [v5 state];
      _os_log_impl(&dword_1B542B000, &v9->super, OS_LOG_TYPE_DEFAULT, "Arrival updater trying to change state to (%d), but is already in that state. This is allowed for now to support server auto advance.", (uint8_t *)&v15, 8u);
    }
  }
  else
  {
    [v5 setArrivalUpdater:self];
    [v5 setDetails:self->_details];
    uint64_t v9 = self->_currentState;
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [(_MNArrivalUpdaterState *)v9 state];
      if (v11 > 6) {
        uint64_t v12 = @"MNArrivalState_Unknown";
      }
      else {
        uint64_t v12 = off_1E60FBCA8[v11];
      }
      unint64_t v13 = [v5 state];
      if (v13 > 6) {
        long long v14 = @"MNArrivalState_Unknown";
      }
      else {
        long long v14 = off_1E60FBCA8[v13];
      }
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "Arrival updater change state: '%@' => '%@'", (uint8_t *)&v15, 0x16u);
    }

    objc_storeStrong((id *)p_currentState, a3);
    [(_MNArrivalUpdaterState *)v9 onLeaveState:v5];
    [v5 onEnterState:v9];
  }
}

- (void)startMonitoringForEV
{
  BOOL v3 = [(_MNArrivalUpdaterDetails *)self->_details evChargingStateMonitor];

  if (!v3)
  {
    int v4 = [(MNArrivalUpdater *)self route];
    int v5 = [v4 isEVRoute];

    if (v5)
    {
      id v14 = [(MNArrivalUpdater *)self targetLeg];
      int v6 = [v14 chargingStationInfo];
      [v6 batteryChargeAfterCharging];
      double v8 = v7 / 1000.0;
      if (v7 / 1000.0 > 0.0)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F28E28]);
        v10 = [MEMORY[0x1E4F291B0] kilowattHours];
        unint64_t v11 = (void *)[v9 initWithDoubleValue:v10 unit:v8];

        uint64_t v12 = [[MNEVChargingStateMonitor alloc] initWithTargetBatteryCharge:v11];
        [(_MNArrivalUpdaterDetails *)self->_details setEvChargingStateMonitor:v12];

        unint64_t v13 = [(_MNArrivalUpdaterDetails *)self->_details evChargingStateMonitor];
        [v13 setDelegate:self];
      }
    }
  }
}

- (void)stopMonitoringForEV
{
  BOOL v3 = [(_MNArrivalUpdaterDetails *)self->_details evChargingStateMonitor];
  [v3 setDelegate:0];

  details = self->_details;
  [(_MNArrivalUpdaterDetails *)details setEvChargingStateMonitor:0];
}

- (GEOComposedRoute)route
{
  v2 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  BOOL v3 = [v2 currentRouteInfo];
  int v4 = [v3 route];

  return (GEOComposedRoute *)v4;
}

- (GEOComposedRouteLeg)targetLeg
{
  v2 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  BOOL v3 = [v2 targetLeg];

  return (GEOComposedRouteLeg *)v3;
}

- (void)arrivalRegionTimerDidFire:(id)a3
{
  int v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "Arrival region timeout fired.", v7, 2u);
  }

  safeDelegate = self->_safeDelegate;
  int v6 = [(MNArrivalUpdater *)self targetLeg];
  -[MNObserverHashTable arrivalUpdater:didTimeoutAtLegIndex:withReason:](safeDelegate, "arrivalUpdater:didTimeoutAtLegIndex:withReason:", self, [v6 legIndex], 0);
}

- (void)evChargingStateMonitorShouldShowChargingInfo:(id)a3
{
  int v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Should show EV charging info", v7, 2u);
  }

  int v5 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  int v6 = [v5 currentWaypoint];

  [(MNObserverHashTable *)self->_safeDelegate arrivalUpdater:self shouldShowChargingInfoForWaypoint:v6];
}

- (void)evChargingStateMonitor:(id)a3 didReachTargetBatteryCharge:(id)a4
{
}

- (void)evChargingStateMonitor:(id)a3 didChangeChargingState:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(_MNArrivalUpdaterDetails *)self->_details isEVCharging] != a4)
  {
    [(_MNArrivalUpdaterDetails *)self->_details setIsEVCharging:v4];
    currentState = self->_currentState;
    [(_MNArrivalUpdaterState *)currentState updateForEVChargingState:v4];
  }
}

- (void)parkedVehicleDetectorDidDetectParkedVehicle:(id)a3
{
  BOOL v4 = [(_MNArrivalUpdaterDetails *)self->_details navigationSessionState];
  int v5 = [v4 isOnLastLeg];

  if (v5 && [(_MNArrivalUpdaterDetails *)self->_details isInParkingDetectionRegion])
  {
    int v6 = objc_alloc_init(_MNArrivalUpdaterState_Parked);
    [(MNArrivalUpdater *)self changeState:v6];
  }
}

- (void)parkedVehicleDetectorDidDetectResumeDriving:(id)a3
{
  BOOL v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Detected resume driving.", v5, 2u);
  }

  [(_MNArrivalUpdaterState *)self->_currentState updateForResumeDriving];
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"state";
  BOOL v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[_MNArrivalUpdaterState state](self->_currentState, "state", a3));
  v15[0] = v4;
  v14[1] = @"targetLegIndex";
  int v5 = NSNumber;
  int v6 = [(MNArrivalUpdater *)self targetLeg];
  double v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "legIndex"));
  v15[1] = v7;
  v14[2] = @"isMonitoringWaypoint";
  double v8 = NSNumber;
  id v9 = [(_MNArrivalUpdaterDetails *)self->_details evChargingStateMonitor];
  v10 = [v8 numberWithInt:v9 != 0];
  v15[2] = v10;
  v14[3] = @"isCharging";
  unint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_MNArrivalUpdaterDetails isEVCharging](self->_details, "isEVCharging"));
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

- (MNObserverHashTable)safeDelegate
{
  return self->_safeDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedVehicleDetector, 0);
  objc_storeStrong((id *)&self->_evChargingStateMonitor, 0);
  objc_storeStrong((id *)&self->_timeoutRegions, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_safeDelegate, 0);
}

@end