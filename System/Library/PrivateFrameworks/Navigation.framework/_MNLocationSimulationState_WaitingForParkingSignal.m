@interface _MNLocationSimulationState_WaitingForParkingSignal
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation _MNLocationSimulationState_WaitingForParkingSignal

- (int64_t)type
{
  return 9;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  v4 = [(_MNLocationSimulationState *)self data];
  v5 = [v4 lastLocation];
  objc_msgSend(v5, "_navigation_geoCoordinate3D");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_MNLocationSimulationState *)self data];
  v13 = [v12 lastLocation];
  [v13 course];
  v15 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v7, v9, v11, v14, 0.0);

  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  v5 = [a3 route];
  int v6 = [v5 transportType];

  if (v6 == 2)
  {
    id v8 = [(_MNLocationSimulationState *)self delegate];
    double v7 = [(_MNLocationSimulationState *)self _followRouteStateWithStartRouteCoordinate:*MEMORY[0x1E4F641A8]];
    [v8 changeState:v7];
  }
}

@end