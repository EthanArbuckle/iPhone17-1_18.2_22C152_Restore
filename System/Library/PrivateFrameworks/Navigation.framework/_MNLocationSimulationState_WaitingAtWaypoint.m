@interface _MNLocationSimulationState_WaitingAtWaypoint
- (_MNLocationSimulationState_WaitingAtWaypoint)initWithStartTime:(double)a3 waitDuration:(double)a4;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
@end

@implementation _MNLocationSimulationState_WaitingAtWaypoint

- (_MNLocationSimulationState_WaitingAtWaypoint)initWithStartTime:(double)a3 waitDuration:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_MNLocationSimulationState_WaitingAtWaypoint;
  v6 = [(_MNLocationSimulationState_WaitingAtWaypoint *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_startTime = a3;
    v6->_waitDuration = a4;
    v8 = v6;
  }

  return v7;
}

- (int64_t)type
{
  return 4;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  v4 = [(_MNLocationSimulationState *)self data];
  v5 = [v4 lastLocation];

  if (v5)
  {
    if (self->_startTime <= 0.0)
    {
      v6 = [(_MNLocationSimulationState *)self data];
      [v6 currentTime];
      self->_startTime = v7;
    }
    v8 = [(_MNLocationSimulationState *)self data];
    unint64_t v9 = [v8 currentLegIndex];
    objc_super v10 = [(_MNLocationSimulationState *)self data];
    v11 = [v10 routeToFollow];
    v12 = [v11 legs];
    unint64_t v13 = [v12 count] - 1;

    v14 = [(_MNLocationSimulationState *)self data];
    v15 = v14;
    if (v9 >= v13)
    {
      int v23 = [v14 endAtFinalDestination];

      if (v23)
      {
        v21 = [(_MNLocationSimulationState *)self delegate];
        v22 = _MNLocationSimulationState_End;
        goto LABEL_9;
      }
    }
    else
    {
      [v14 currentTime];
      double v17 = v16 - self->_startTime;

      if (v17 > self->_waitDuration)
      {
        v18 = [(_MNLocationSimulationState *)self data];
        uint64_t v19 = [v18 currentLegIndex] + 1;
        v20 = [(_MNLocationSimulationState *)self data];
        [v20 setCurrentLegIndex:v19];

        v21 = [(_MNLocationSimulationState *)self delegate];
        v22 = _MNLocationSimulationState_ProceedingToStartOfLeg;
LABEL_9:
        id v24 = objc_alloc_init(v22);
        [v21 changeState:v24];
      }
    }
    v25 = [(_MNLocationSimulationState *)self data];
    v26 = [v25 lastLocation];
    objc_msgSend(v26, "_navigation_geoCoordinate3D");
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    v33 = [(_MNLocationSimulationState *)self data];
    v34 = [v33 lastLocation];
    [v34 course];
    v36 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v28, v30, v32, v35, 0.0);

    goto LABEL_11;
  }
  v36 = 0;
LABEL_11:
  return v36;
}

@end