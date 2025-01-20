@interface _MNLocationSimulationState_FollowingRoute
- ($212C09783140BCCD23384160D545CE0D)_projectedCoordinateOnRouteFrom:(id)a3 overTimeDelta:(double)a4 outSpeed:(double *)a5;
- (BOOL)_isCoordinate:(id)a3 atEndOfLeg:(id)a4;
- (BOOL)_shouldProceedToWaypointForLeg:(id)a3;
- (_MNLocationSimulationState_FollowingRoute)initWithStartRouteCoordinate:(id)a3;
- (id)_routeToFollow;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)onEnterState;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation _MNLocationSimulationState_FollowingRoute

- (_MNLocationSimulationState_FollowingRoute)initWithStartRouteCoordinate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MNLocationSimulationState_FollowingRoute;
  v4 = [(_MNLocationSimulationState_FollowingRoute *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)type
{
  return 2;
}

- (void)onEnterState
{
  if (GEOPolylineCoordinateIsValid())
  {
    $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = self->_startRouteCoordinate;
    v4 = [(_MNLocationSimulationState *)self data];
    [v4 setLastRouteCoordinate:startRouteCoordinate];

    id v7 = [(_MNLocationSimulationState_FollowingRoute *)self _routeToFollow];
    uint64_t v5 = [v7 legIndexForRouteCoordinate:*(void *)&self->_startRouteCoordinate];
    v6 = [(_MNLocationSimulationState *)self data];
    [v6 setCurrentLegIndex:v5];
  }
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  double v44 = 0.0;
  uint64_t v5 = [(_MNLocationSimulationState *)self data];
  $212C09783140BCCD23384160D545CE0D v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", [v5 lastRouteCoordinate], &v44, a3);

  if (GEOPolylineCoordinateIsValid())
  {
    id v7 = [(_MNLocationSimulationState_FollowingRoute *)self _routeToFollow];
    [v7 pointAtRouteCoordinate:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v7 courseAtRouteCoordinateIndex:v6];
    v15 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v14, v44);
    v16 = [(_MNLocationSimulationState *)self data];
    [v16 setLastRouteCoordinate:v6];

    v17 = [v7 legs];
    v18 = [(_MNLocationSimulationState *)self data];
    v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));

    unint64_t v20 = [v19 legIndex];
    v21 = [v7 legs];
    unint64_t v22 = [v21 count] - 1;

    int v23 = [v7 transportType];
    v24 = [(_MNLocationSimulationState *)self data];
    uint64_t v25 = [v24 simulationType];

    BOOL v28 = v20 >= v22 && v23 == 0 && v25 == 2;
    uint64_t Integer = GEOConfigGetInteger();
    uint64_t v30 = Integer;
    if (v28
      && Integer == 1
      && ([v19 arrivalParameters],
          v31 = objc_claimAutoreleasedReturnValue(),
          int v32 = objc_msgSend(v31, "containsCoordinate:arrivalRegionType:", 6, v9, v11, v13),
          v31,
          v32))
    {
      v33 = [(_MNLocationSimulationState *)self delegate];
      v34 = _MNLocationSimulationState_SearchingForParkingBeforeArrival;
    }
    else
    {
      if (![(_MNLocationSimulationState_FollowingRoute *)self _isCoordinate:v6 atEndOfLeg:v19])
      {
LABEL_27:

        goto LABEL_28;
      }
      if ((v30 & 0xFFFFFFFFFFFFFFFELL) == 2 && v28)
      {
        v33 = [(_MNLocationSimulationState *)self delegate];
        v34 = _MNLocationSimulationState_SearchingForParkingAfterArrival;
      }
      else if ([(_MNLocationSimulationState_FollowingRoute *)self _shouldProceedToWaypointForLeg:v19])
      {
        v33 = [(_MNLocationSimulationState *)self delegate];
        v34 = _MNLocationSimulationState_ProceedingToWaypoint;
      }
      else
      {
        GEOConfigGetDouble();
        if (v36 >= 0.0)
        {
          v33 = [(_MNLocationSimulationState *)self delegate];
          v42 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
          id v40 = [(_MNLocationSimulationState *)self data];
          [v40 currentTime];
          v43 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v42, "initWithStartTime:waitDuration:");
          [v33 changeState:v43];

          goto LABEL_26;
        }
        v37 = [(_MNLocationSimulationState *)self data];
        uint64_t v38 = [v37 currentLegIndex] + 1;
        v39 = [(_MNLocationSimulationState *)self data];
        [v39 setCurrentLegIndex:v38];

        v33 = [(_MNLocationSimulationState *)self delegate];
        v34 = _MNLocationSimulationState_ProceedingToStartOfLeg;
      }
    }
    id v40 = objc_alloc_init(v34);
    [v33 changeState:v40];
LABEL_26:

    goto LABEL_27;
  }
  v15 = 0;
LABEL_28:
  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_MNLocationSimulationState *)self data];
  uint64_t v8 = [v7 simulationType];

  if (v8 == 2)
  {
    if (a4 == 12)
    {
      double v9 = [(_MNLocationSimulationState *)self data];
      [v9 setCurrentLegIndex:0];

      double v10 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
      double v11 = [(_MNLocationSimulationState *)self delegate];
      [v11 changeState:v10];
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F649E0]);
      double v13 = [v6 route];
      double v10 = (_MNLocationSimulationState_ProceedingToStartOfLeg *)[v12 initWithRoute:v13 auditToken:0];

      id v14 = objc_alloc(MEMORY[0x1E4F64660]);
      v15 = [(_MNLocationSimulationState *)self data];
      v16 = [v15 lastLocation];
      v17 = (void *)[v14 initWithCLLocation:v16];

      v18 = [(_MNLocationSimulationState_ProceedingToStartOfLeg *)v10 matchToRouteWithLocation:v17];
      uint64_t v19 = [v18 routeCoordinate];
      unint64_t v20 = [(_MNLocationSimulationState *)self data];
      [v20 setLastRouteCoordinate:v19];

      uint64_t v21 = [v18 legIndex];
      unint64_t v22 = [(_MNLocationSimulationState *)self data];
      [v22 setCurrentLegIndex:v21];

      int v23 = MNGetMNNavigationSimulationLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(_MNLocationSimulationState *)self data];
        int v25 = [v24 lastRouteCoordinate];
        v26 = [(_MNLocationSimulationState *)self data];
        double v27 = COERCE_FLOAT((unint64_t)[v26 lastRouteCoordinate] >> 32);
        BOOL v28 = [(_MNLocationSimulationState *)self data];
        int v29 = [v28 currentLegIndex];
        [v18 distanceFromRoute];
        v31[0] = 67109888;
        v31[1] = v25;
        __int16 v32 = 2048;
        double v33 = v27;
        __int16 v34 = 1024;
        int v35 = v29;
        __int16 v36 = 2048;
        uint64_t v37 = v30;
        _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEFAULT, "Putting location at [%u, %0.2f] and leg %d on new route. Was %0.1f meters away", (uint8_t *)v31, 0x22u);
      }
    }
  }
}

- ($212C09783140BCCD23384160D545CE0D)_projectedCoordinateOnRouteFrom:(id)a3 overTimeDelta:(double)a4 outSpeed:(double *)a5
{
  if (GEOPolylineCoordinateIsValid())
  {
    double v9 = [(_MNLocationSimulationState_FollowingRoute *)self _routeToFollow];
    double v10 = [v9 legs];
    double v11 = [(_MNLocationSimulationState *)self data];
    id v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "currentLegIndex"));

    if ([(_MNLocationSimulationState_FollowingRoute *)self _isCoordinate:a3 atEndOfLeg:v12])
    {
      if (a5) {
        *a5 = 0.0;
      }
      $212C09783140BCCD23384160D545CE0D v13 = ($212C09783140BCCD23384160D545CE0D)([v9 pointCount] - 1);
    }
    else
    {
      id v14 = [v9 stepForPointIndex:a3];
      v15 = [(_MNLocationSimulationState *)self data];
      [v15 speedOverride];
      double v17 = v16;

      if (v17 >= 0.0)
      {
        double v27 = [(_MNLocationSimulationState *)self data];
        [v27 speedOverride];
        double v19 = v28;

        v24 = [(_MNLocationSimulationState *)self data];
        [v24 speedOverride];
        double v26 = v29;
      }
      else
      {
        [v14 distance];
        double v19 = v18 / (double)[v14 duration];
        unint64_t v20 = [(_MNLocationSimulationState *)self data];
        [v20 minimumSpeed];
        double v22 = v21;

        double v23 = fmin(v19, 50.0);
        if (v22 < v23) {
          double v22 = v23;
        }
        v24 = [(_MNLocationSimulationState *)self data];
        [v24 speedMultiplier];
        double v26 = v22 * v25;
      }

      if (a5) {
        *a5 = v19;
      }
      $212C09783140BCCD23384160D545CE0D v13 = ($212C09783140BCCD23384160D545CE0D)[v9 routeCoordinateForDistance:a3 afterRouteCoordinate:v26 * a4];
      uint64_t v30 = [v14 endRouteCoordinate];
      if (GEOPolylineCoordinateIsABeforeB()) {
        $212C09783140BCCD23384160D545CE0D v13 = ($212C09783140BCCD23384160D545CE0D)v30;
      }
    }
  }
  else
  {
    return ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E4F64198];
  }
  return v13;
}

- (BOOL)_shouldProceedToWaypointForLeg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MNLocationSimulationState_FollowingRoute *)self _routeToFollow];
  id v6 = [v5 legs];
  id v7 = [v6 lastObject];

  if (v7 == v4 || (GEOConfigGetBOOL() & 1) != 0)
  {
    BOOL v8 = 1;
  }
  else
  {
    double v9 = [v4 destination];
    double v10 = [v9 chargingInfo];
    BOOL v8 = v10 != 0;
  }
  return v8;
}

- (BOOL)_isCoordinate:(id)a3 atEndOfLeg:(id)a4
{
  return [a4 endPointIndex] <= a3.var0;
}

- (id)_routeToFollow
{
  v2 = [(_MNLocationSimulationState *)self data];
  v3 = [v2 routeToFollow];

  return v3;
}

@end