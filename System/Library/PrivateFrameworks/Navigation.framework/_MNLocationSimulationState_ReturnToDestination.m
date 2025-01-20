@interface _MNLocationSimulationState_ReturnToDestination
- (int64_t)type;
- (void)_findParkingLocation:(id)a3;
- (void)_handleReachedParkingLocation;
@end

@implementation _MNLocationSimulationState_ReturnToDestination

- (int64_t)type
{
  return 8;
}

- (void)_findParkingLocation:(id)a3
{
  v10 = (void (**)(id, void *, BOOL))a3;
  v4 = [(_MNLocationSimulationState *)self data];
  v5 = [v4 routeInfo];
  v6 = [v5 route];

  if (v6 && [v6 pointCount] >= 2)
  {
    objc_msgSend(v6, "pointAt:", objc_msgSend(v6, "pointCount") - 1);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:", v7, v8);
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v9, v9 != 0);
}

- (void)_handleReachedParkingLocation
{
  id v6 = [(_MNLocationSimulationState *)self delegate];
  v3 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
  v4 = [(_MNLocationSimulationState *)self data];
  [v4 currentTime];
  v5 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v3, "initWithStartTime:waitDuration:");
  [v6 changeState:v5];
}

@end