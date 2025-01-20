@interface _MNArrivalUpdaterState_Arrived
- (BOOL)_checkForDeparture;
- (BOOL)_updateForDeparture;
- (double)parkingDetectionExcludeRadius;
- (int64_t)state;
- (void)dealloc;
- (void)onEnterState:(id)a3;
- (void)updateForEVChargingState:(BOOL)a3;
- (void)updateForEVReachedTargetBatteryCharge;
- (void)updateForLocation;
@end

@implementation _MNArrivalUpdaterState_Arrived

- (void)dealloc
{
  [(NSTimer *)self->_departureTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_MNArrivalUpdaterState_Arrived;
  [(_MNArrivalUpdaterState_Arrived *)&v3 dealloc];
}

- (int64_t)state
{
  return 4;
}

- (void)onEnterState:(id)a3
{
  id v4 = a3;
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  v5 = [(_MNArrivalUpdaterState *)self targetLeg];
  v6 = (void *)[v5 legIndex];

  v7 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v8 = [v7 safeDelegate];
  v9 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v8 arrivalUpdater:v9 didArriveAtEndOfLegIndex:v6];

  GEOConfigGetDouble();
  double v11 = v10 * 60.0;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E4F1CB00];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47___MNArrivalUpdaterState_Arrived_onEnterState___block_invoke;
  v18[3] = &unk_1E60F6558;
  objc_copyWeak(v19, &location);
  v19[1] = v6;
  v13 = [v12 scheduledTimerWithTimeInterval:0 repeats:v18 block:v11];
  departureTimer = self->_departureTimer;
  self->_departureTimer = v13;

  v15 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v15 startMonitoringForEV];

  v16 = [(_MNArrivalUpdaterState *)self details];
  v17 = [v16 evChargingStateMonitor];
  [v17 updateForArrival];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)updateForLocation
{
  if (![(_MNArrivalUpdaterState_Arrived *)self _updateForDeparture]
    && ![(_MNArrivalUpdaterState *)self _checkForArrival])
  {
    [(_MNArrivalUpdaterState *)self _updateForSearchingForParking];
  }
}

- (void)updateForEVChargingState:(BOOL)a3
{
  if (!a3)
  {
    id v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    id v4 = [[_MNArrivalUpdaterState_None alloc] initWithDepartureReason:2];
    [v5 changeState:v4];
  }
}

- (void)updateForEVReachedTargetBatteryCharge
{
  id v3 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v2 = [[_MNArrivalUpdaterState_None alloc] initWithDepartureReason:2];
  [v3 changeState:v2];
}

- (double)parkingDetectionExcludeRadius
{
  v2 = [(_MNArrivalUpdaterState *)self location];
  [v2 horizontalAccuracy];
  double v4 = v3 + 10.0;

  return v4;
}

- (BOOL)_updateForDeparture
{
  BOOL v3 = [(_MNArrivalUpdaterState_Arrived *)self _checkForDeparture];
  if (v3)
  {
    double v4 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    id v5 = [[_MNArrivalUpdaterState_None alloc] initWithDepartureReason:1];
    [v4 changeState:v5];
  }
  return v3;
}

- (BOOL)_checkForDeparture
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MNArrivalUpdaterState *)self targetLeg];
  unint64_t v4 = [v3 legIndex];

  id v5 = [(_MNArrivalUpdaterState *)self route];
  v6 = [v5 legs];
  uint64_t v7 = [v6 count] - 1;

  if (v4 == v7) {
    goto LABEL_4;
  }
  v8 = [v5 legs];
  unint64_t v9 = [v8 count];

  if (v4 >= v9)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v4;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Checking departure when target leg index is not valid (%d). Allowing departure", (uint8_t *)v19, 8u);
    }

    char v12 = 1;
  }
  else
  {
    double v10 = [(_MNArrivalUpdaterState *)self details];
    char v11 = [v10 isEVCharging];

    if (v11)
    {
LABEL_4:
      char v12 = 0;
      goto LABEL_11;
    }
    departureUpdater = self->_departureUpdater;
    if (!departureUpdater)
    {
      v15 = [[MNDepartureUpdater alloc] initWithRoute:v5 arrivalLegIndex:v4];
      v16 = self->_departureUpdater;
      self->_departureUpdater = v15;

      departureUpdater = self->_departureUpdater;
    }
    v17 = [(_MNArrivalUpdaterState *)self location];
    char v12 = [(MNDepartureUpdater *)departureUpdater allowDepartureForLocation:v17];
  }
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureTimer, 0);
  objc_storeStrong((id *)&self->_departureUpdater, 0);
}

@end