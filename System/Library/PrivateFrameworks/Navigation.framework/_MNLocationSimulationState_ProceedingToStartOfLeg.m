@interface _MNLocationSimulationState_ProceedingToStartOfLeg
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)onEnterState;
@end

@implementation _MNLocationSimulationState_ProceedingToStartOfLeg

- (int64_t)type
{
  return 1;
}

- (void)onEnterState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(_MNLocationSimulationState *)self data];
    int v9 = 67109120;
    LODWORD(v10) = [v4 currentLegIndex];
  }
  v5 = [(_MNLocationSimulationState *)self data];
  v6 = [v5 lastLocation];

  if (!v6)
  {
    v7 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
    }

    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      v10 = "-[_MNLocationSimulationState_ProceedingToStartOfLeg onEnterState]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Simulation/MNSimulatedLocationGenerator.m";
      __int16 v13 = 1024;
      int v14 = 538;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  v5 = [(_MNLocationSimulationState *)self data];
  v6 = [v5 routeToFollow];

  v7 = [(_MNLocationSimulationState *)self data];
  unint64_t v8 = [v7 currentLegIndex];
  int v9 = [v6 legs];
  unint64_t v10 = [v9 count];

  if (v8 >= v10)
  {
    v39 = 0;
  }
  else
  {
    __int16 v11 = [v6 legs];
    v12 = [(_MNLocationSimulationState *)self data];
    __int16 v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "currentLegIndex"));

    objc_msgSend(v6, "pointAt:", objc_msgSend(v13, "startPointIndex"));
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v41 = 0.0;
    double v42 = -1.0;
    v20 = [(_MNLocationSimulationState *)self data];
    v21 = [v20 lastLocation];
    objc_msgSend(v21, "_navigation_geoCoordinate3D");
    double v23 = v22;
    double v25 = v24;

    v26 = [(_MNLocationSimulationState *)self data];
    v27 = [v26 lastLocation];
    [v27 altitude];
    double v29 = v28;

    -[_MNLocationSimulationState _projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:](self, "_projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:", &v42, &v41, v23, v25, v29, v15, v17, v19, a3);
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    GEOCalculateDistance();
    if (v36 < 0.000001)
    {
      v37 = [(_MNLocationSimulationState *)self delegate];
      v38 = -[_MNLocationSimulationState _followRouteStateWithStartRouteCoordinate:](self, "_followRouteStateWithStartRouteCoordinate:", [v13 startRouteCoordinate]);
      [v37 changeState:v38];
    }
    v39 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v31, v33, v35, v42, v41);
  }
  return v39;
}

@end