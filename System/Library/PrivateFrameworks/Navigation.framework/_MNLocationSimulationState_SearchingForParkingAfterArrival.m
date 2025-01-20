@interface _MNLocationSimulationState_SearchingForParkingAfterArrival
- (double)_scoreForRoad:(id)a3 coordinate:(id)a4;
- (int64_t)type;
- (void)_handleReachedParkingLocation;
@end

@implementation _MNLocationSimulationState_SearchingForParkingAfterArrival

- (int64_t)type
{
  return 7;
}

- (double)_scoreForRoad:(id)a3 coordinate:(id)a4
{
  id v4 = a3;
  v5 = [v4 internalRoadName];

  double v6 = 0.0;
  if (v5)
  {
    if ([v4 roadClass] != 9)
    {
      [v4 coordinates3d];
      [v4 coordinateCount];
      GEOCalculateDistance();
      double v8 = v7;
      if (v7 <= 300.0)
      {
        if ([v4 travelDirection] != 1
          || ([v4 coordinates3d], GEOCalculateDistance(), v9 < v8))
        {
          double v6 = v8;
        }
      }
    }
  }

  return v6;
}

- (void)_handleReachedParkingLocation
{
  if (GEOConfigGetInteger() == 3)
  {
    double v6 = objc_alloc_init(_MNLocationSimulationState_ReturnToDestination);
  }
  else
  {
    v3 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
    id v4 = [(_MNLocationSimulationState *)self data];
    [v4 currentTime];
    double v6 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v3, "initWithStartTime:waitDuration:");
  }
  v5 = [(_MNLocationSimulationState *)self delegate];
  [v5 changeState:v6];
}

@end