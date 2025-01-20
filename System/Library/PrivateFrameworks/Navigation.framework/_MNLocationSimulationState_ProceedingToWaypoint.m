@interface _MNLocationSimulationState_ProceedingToWaypoint
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
@end

@implementation _MNLocationSimulationState_ProceedingToWaypoint

- (int64_t)type
{
  return 3;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  v5 = [(_MNLocationSimulationState *)self data];
  v6 = [v5 routeToFollow];

  v7 = [(_MNLocationSimulationState *)self data];
  unint64_t v8 = [v7 currentLegIndex];
  v9 = [v6 legs];
  unint64_t v10 = [v9 count];

  if (v8 >= v10)
  {
    v52 = 0;
  }
  else
  {
    v11 = [v6 legs];
    v12 = [(_MNLocationSimulationState *)self data];
    v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "currentLegIndex"));

    v14 = [v13 destination];
    [v14 coordinate];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    double v54 = 0.0;
    double v55 = -1.0;
    v21 = [(_MNLocationSimulationState *)self data];
    v22 = [v21 lastLocation];

    if (v22)
    {
      v23 = [(_MNLocationSimulationState *)self data];
      v24 = [v23 lastLocation];
      objc_msgSend(v24, "_navigation_geoCoordinate3D");
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      -[_MNLocationSimulationState _projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:](self, "_projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:", &v55, &v54, v26, v28, v30, v16, v18, v20, a3);
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
    }
    else
    {
      objc_msgSend(v6, "pointAt:", objc_msgSend(v13, "endPointIndex"));
      double v32 = v37;
      double v34 = v38;
      double v36 = v39;
      objc_msgSend(v6, "courseAtRouteCoordinateIndex:", objc_msgSend(v13, "endPointIndex"));
      double v55 = v40;
    }
    GEOCalculateDistance();
    if (v41 < 0.000001)
    {
      v42 = [(_MNLocationSimulationState *)self data];
      unint64_t v43 = [v42 currentLegIndex];
      v44 = [v6 legs];
      unint64_t v45 = [v44 count] - 1;

      if (v43 >= v45
        && ([(_MNLocationSimulationState *)self data],
            v46 = objc_claimAutoreleasedReturnValue(),
            int v47 = [v46 endAtFinalDestination],
            v46,
            v47))
      {
        v48 = objc_alloc_init(_MNLocationSimulationState_End);
      }
      else
      {
        v49 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
        v50 = [(_MNLocationSimulationState *)self data];
        [v50 currentTime];
        v48 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v49, "initWithStartTime:waitDuration:");
      }
      v51 = [(_MNLocationSimulationState *)self delegate];
      [v51 changeState:v48];
    }
    v52 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v32, v34, v36, v55, v54);
  }
  return v52;
}

@end