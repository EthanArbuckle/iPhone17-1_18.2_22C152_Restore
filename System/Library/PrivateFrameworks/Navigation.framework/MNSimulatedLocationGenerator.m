@interface MNSimulatedLocationGenerator
- ($212C09783140BCCD23384160D545CE0D)_simulationStartRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)lastRouteCoordinate;
- (BOOL)endAtFinalDestination;
- (MNLocation)lastLocation;
- (MNSimulatedLocationGenerator)initWithSimulationParameters:(id)a3;
- (double)speedOverride;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)currentStateType;
- (void)_updateStartState;
- (void)changeState:(id)a3;
- (void)setEndAtFinalDestination:(BOOL)a3;
- (void)setSpeedOverride:(double)a3;
- (void)updatePosition:(double)a3;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation MNSimulatedLocationGenerator

- (MNSimulatedLocationGenerator)initWithSimulationParameters:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MNSimulatedLocationGenerator;
  v5 = [(MNSimulatedLocationGenerator *)&v19 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MNLocationSimulationData);
    data = v5->_data;
    v5->_data = v6;

    -[_MNLocationSimulationData setSimulationType:](v5->_data, "setSimulationType:", [v4 simulationType]);
    v8 = [v4 initialRoute];
    [(_MNLocationSimulationData *)v5->_data setRouteInfo:v8];

    v9 = [v4 initialRoute];
    [(_MNLocationSimulationData *)v5->_data setInitialRouteInfo:v9];

    v10 = [v4 startingLocation];
    [(_MNLocationSimulationData *)v5->_data setLastLocation:v10];

    [(_MNLocationSimulationData *)v5->_data setCurrentTime:0.0];
    [(_MNLocationSimulationData *)v5->_data setCurrentLegIndex:0];
    [(_MNLocationSimulationData *)v5->_data setEndAtFinalDestination:1];
    v11 = [v4 auditToken];
    [(_MNLocationSimulationData *)v5->_data setAuditToken:v11];

    v12 = [v4 requestingAppIdentifier];
    [(_MNLocationSimulationData *)v5->_data setRequestingAppIdentifier:v12];

    GEOConfigGetDouble();
    -[_MNLocationSimulationData setSpeedOverride:](v5->_data, "setSpeedOverride:");
    [(_MNLocationSimulationData *)v5->_data speedOverride];
    if (v13 == 0.0) {
      [(_MNLocationSimulationData *)v5->_data setSpeedOverride:-1.0];
    }
    GEOConfigGetDouble();
    -[_MNLocationSimulationData setSpeedMultiplier:](v5->_data, "setSpeedMultiplier:");
    GEOConfigGetDouble();
    -[_MNLocationSimulationData setMinimumSpeed:](v5->_data, "setMinimumSpeed:");
    [(MNSimulatedLocationGenerator *)v5 _updateStartState];
    v14 = [(_MNLocationSimulationData *)v5->_data routeInfo];
    v15 = [v14 route];

    if ([v15 pointCount])
    {
      v16 = (void *)MEMORY[0x1E4F64670];
      [v15 pointAt:0];
      uint64_t v17 = objc_msgSend(v16, "isLocationShiftRequiredForCoordinate:");
    }
    else
    {
      uint64_t v17 = 0;
    }
    [(_MNLocationSimulationData *)v5->_data setIsChinaShifted:v17];
  }
  return v5;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(_MNLocationSimulationData *)self->_data setRouteInfo:v6];
  v7 = [v6 route];
  if ([v7 pointCount])
  {
    v8 = (void *)MEMORY[0x1E4F64670];
    [v7 pointAt:0];
    uint64_t v9 = objc_msgSend(v8, "isLocationShiftRequiredForCoordinate:");
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(_MNLocationSimulationData *)self->_data setIsChinaShifted:v9];
  v10 = [(_MNLocationSimulationData *)self->_data lastLocation];

  if (v10)
  {
    v11 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v6 route];
      double v13 = [v12 name];
      if (a4 - 1 > 0xE) {
        v14 = @"Unknown";
      }
      else {
        v14 = off_1E60F8490[a4 - 1];
      }
      unint64_t v16 = [(_MNLocationSimulationState *)self->_currentState type];
      if (v16 > 0xA) {
        uint64_t v17 = @"Unknown";
      }
      else {
        uint64_t v17 = off_1E60F8508[v16];
      }
      int v18 = 138412802;
      objc_super v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Route changed to %@. Reason: %@. Current state: %@", (uint8_t *)&v18, 0x20u);
    }
    [(_MNLocationSimulationState *)self->_currentState updateWithRouteInfo:v6 rerouteReason:a4];
  }
  else
  {
    [(MNSimulatedLocationGenerator *)self _updateStartState];
    v15 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Route changed but no previous location.", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)updatePosition:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  v5 = [(_MNLocationSimulationData *)self->_data routeToFollow];
  [v5 distance];
  double v7 = v6;

  double v8 = v4 * v7;
  uint64_t v9 = [(_MNLocationSimulationData *)self->_data routeToFollow];
  uint64_t v10 = [v9 routeCoordinateForDistanceAfterStart:v8];

  v11 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = GEOPolylineCoordinateAsShortString();
    v15[0] = 67109634;
    v15[1] = (int)(v4 * 100.0);
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    double v19 = v8;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Setting simulation position to %d%% / [%@] / %0.1f meters.", (uint8_t *)v15, 0x1Cu);
  }
  if ([(_MNLocationSimulationState *)self->_currentState type] == 2)
  {
    double v13 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
    [(MNSimulatedLocationGenerator *)self changeState:v13];
  }
  v14 = [(_MNLocationSimulationState *)self->_currentState _followRouteStateWithStartRouteCoordinate:v10];
  [(MNSimulatedLocationGenerator *)self changeState:v14];
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  v5 = [(_MNLocationSimulationData *)self->_data routeToFollow];

  if (v5)
  {
    double v6 = [(_MNLocationSimulationData *)self->_data routeToFollow];
    if ([v6 pointCount])
    {
      data = self->_data;
      [(_MNLocationSimulationData *)data currentTime];
      [(_MNLocationSimulationData *)data setCurrentTime:v8 + a3];
      uint64_t v9 = self->_currentState;
      uint64_t v10 = [(_MNLocationSimulationState *)v9 nextSimulatedLocationWithElapsedTime:a3];
      [(_MNLocationSimulationData *)self->_data setLastLocation:v10];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "MNSimulatedLocationGenerator cannot simulate with no route.", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v12, 2u);
    }
    uint64_t v10 = 0;
  }
  return v10;
}

- (int64_t)currentStateType
{
  return [(_MNLocationSimulationState *)self->_currentState type];
}

- (double)speedOverride
{
  [(_MNLocationSimulationData *)self->_data speedOverride];
  return result;
}

- (void)setSpeedOverride:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0)
  {
    [(_MNLocationSimulationData *)self->_data setSpeedOverride:a3];
    double v8 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      double v13 = a3;
      uint64_t v9 = "Setting speed override to %0.1f m/s.";
      goto LABEL_7;
    }
  }
  else
  {
    GEOConfigGetDouble();
    data = self->_data;
    if (v5 <= 0.0)
    {
      [(_MNLocationSimulationData *)data setSpeedOverride:a3];
      double v8 = MNGetMNNavigationSimulationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        uint64_t v9 = "Removing speed override.";
        uint64_t v10 = v8;
        uint32_t v11 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      double v7 = v5;
      -[_MNLocationSimulationData setSpeedOverride:](data, "setSpeedOverride:");
      double v8 = MNGetMNNavigationSimulationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        double v13 = v7;
LABEL_7:
        uint64_t v10 = v8;
        uint32_t v11 = 12;
LABEL_10:
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
      }
    }
  }
}

- (BOOL)endAtFinalDestination
{
  return [(_MNLocationSimulationData *)self->_data endAtFinalDestination];
}

- (void)setEndAtFinalDestination:(BOOL)a3
{
}

- (MNLocation)lastLocation
{
  return [(_MNLocationSimulationData *)self->_data lastLocation];
}

- ($212C09783140BCCD23384160D545CE0D)lastRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)[(_MNLocationSimulationData *)self->_data lastRouteCoordinate];
}

- (void)changeState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_currentState = &self->_currentState;
  int64_t v7 = [(_MNLocationSimulationState *)self->_currentState type];
  if (v7 != [v5 type])
  {
    [(_MNLocationSimulationState *)self->_currentState setDelegate:0];
    [v5 setDelegate:self];
    [v5 setData:self->_data];
    double v8 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = [(_MNLocationSimulationState *)*p_currentState type];
      if (v9 > 0xA) {
        uint64_t v10 = @"Unknown";
      }
      else {
        uint64_t v10 = off_1E60F8508[v9];
      }
      unint64_t v11 = [v5 type];
      if (v11 > 0xA) {
        int v12 = @"Unknown";
      }
      else {
        int v12 = off_1E60F8508[v11];
      }
      int v13 = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      __int16 v16 = v12;
    }

    [(_MNLocationSimulationState *)*p_currentState onLeaveState];
    objc_storeStrong((id *)p_currentState, a3);
    [v5 onEnterState];
  }
}

- (void)_updateStartState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(_MNLocationSimulationData *)self->_data routeToFollow];

  if (!v3)
  {
    uint64_t v14 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Location simulation starting at end state because no route was provided.", (uint8_t *)&v18, 2u);
    }

    [(_MNLocationSimulationData *)self->_data setLastRouteCoordinate:*MEMORY[0x1E4F64198]];
    int64_t v7 = _MNLocationSimulationState_End;
    goto LABEL_13;
  }
  $212C09783140BCCD23384160D545CE0D v4 = [(MNSimulatedLocationGenerator *)self _simulationStartRouteCoordinate];
  if ((GEOPolylineCoordinateIsValid() & 1) == 0)
  {
    id v5 = [(_MNLocationSimulationData *)self->_data lastLocation];

    if (v5)
    {
      double v6 = MNGetMNNavigationSimulationLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
      }

      [(_MNLocationSimulationData *)self->_data setLastRouteCoordinate:*MEMORY[0x1E4F64198]];
      int64_t v7 = _MNLocationSimulationState_ProceedingToStartOfLeg;
LABEL_13:
      id v15 = objc_alloc_init(v7);
      goto LABEL_20;
    }
  }
  double v8 = [(_MNLocationSimulationData *)self->_data routeToFollow];
  int v9 = [v8 legIndexForRouteCoordinate:v4];

  int IsValid = GEOPolylineCoordinateIsValid();
  unint64_t v11 = MNGetMNNavigationSimulationLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (IsValid)
  {
    if (v12)
    {
      int v13 = GEOPolylineCoordinateAsFullString();
      int v18 = 138412546;
      double v19 = v13;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Location simulation starting on route due to debug settings. Route coordinate: [%@] | Leg: %d", (uint8_t *)&v18, 0x12u);
    }
  }
  else if (v12)
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Location simulation starting on route because there is no initial location.", (uint8_t *)&v18, 2u);
  }

  if ([(_MNLocationSimulationData *)self->_data simulationType] == 4) {
    __int16 v16 = _MNLocationSimulationState_SearchingForOffRoute;
  }
  else {
    __int16 v16 = _MNLocationSimulationState_FollowingRoute;
  }
  id v15 = (id)[[v16 alloc] initWithStartRouteCoordinate:v4];
LABEL_20:
  uint64_t v17 = v15;
  [(MNSimulatedLocationGenerator *)self changeState:v15];
}

- ($212C09783140BCCD23384160D545CE0D)_simulationStartRouteCoordinate
{
  v2 = [(_MNLocationSimulationData *)self->_data routeToFollow];
  uint64_t Integer = GEOConfigGetInteger();
  if (Integer < 0 || (uint64_t v4 = Integer) == 0)
  {
    LODWORD(v13) = *MEMORY[0x1E4F64198];
    unint64_t v14 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
  }
  else
  {
    GEOConfigGetDouble();
    double v6 = v5;
    int64_t v7 = [v2 legs];
    uint64_t v8 = [v7 count];
    if (v6 <= 0.0)
    {

      id v15 = [v2 legs];
      __int16 v16 = v15;
      if (v4 >= v8)
      {
        uint64_t v17 = [v15 lastObject];
        int v18 = [v17 endPointIndex];
      }
      else
      {
        uint64_t v17 = [v15 objectAtIndexedSubscript:v4];
        int v18 = [v17 startPointIndex];
      }
      LODWORD(v13) = v18;

      unint64_t v14 = 0;
    }
    else
    {

      if (v4 >= (unint64_t)v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v4;
      }
      uint64_t v10 = v9 - 1;
      unint64_t v11 = [v2 legs];
      BOOL v12 = [v11 objectAtIndexedSubscript:v10];

      unint64_t v13 = objc_msgSend(v2, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v12, "endRouteCoordinate"), v6);
      if ([v12 startPointIndex] > v13) {
        unint64_t v13 = [v12 startRouteCoordinate];
      }

      unint64_t v14 = HIDWORD(v13);
    }
  }

  return ($212C09783140BCCD23384160D545CE0D)(v13 | (v14 << 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end