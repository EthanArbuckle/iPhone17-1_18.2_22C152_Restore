@interface _MNLocationSimulationState_SearchingForParkingBeforeArrival
- (_MNLocationSimulationState_SearchingForParkingBeforeArrival)init;
- (double)_scoreForRoad:(id)a3 coordinate:(id)a4;
- (id)_routeToFollow;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)_findParkingLocation:(id)a3;
- (void)_findRouteToParkingDestination;
- (void)_findRouteToParkingLocation:(id)a3 finishedHandler:(id)a4;
- (void)_handleReachedParkingLocation;
@end

@implementation _MNLocationSimulationState_SearchingForParkingBeforeArrival

- (_MNLocationSimulationState_SearchingForParkingBeforeArrival)init
{
  return [(_MNLocationSimulationState_FollowingRoute *)self initWithStartRouteCoordinate:*MEMORY[0x1E4F641A8]];
}

- (int64_t)type
{
  return 6;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  if (!self->_routeToParkingDestination)
  {
    v21 = [(_MNLocationSimulationState *)self data];
    v22 = [v21 lastLocation];
    objc_msgSend(v22, "_navigation_geoCoordinate3D");
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    v7 = [(_MNLocationSimulationState *)self data];
    v29 = [v7 lastLocation];
    [v29 course];
    v20 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v24, v26, v28, v30, 0.0);

LABEL_7:
    goto LABEL_8;
  }
  double v32 = 0.0;
  v5 = [(_MNLocationSimulationState *)self data];
  $212C09783140BCCD23384160D545CE0D v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", [v5 lastRouteCoordinate], &v32, a3);

  if (GEOPolylineCoordinateIsValid())
  {
    v7 = [(_MNLocationSimulationState_SearchingForParkingBeforeArrival *)self _routeToFollow];
    [v7 pointAtRouteCoordinate:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v7 courseAtRouteCoordinateIndex:v6];
    double v15 = v14;
    v16 = [(_MNLocationSimulationState *)self data];
    [v16 setLastRouteCoordinate:v6];

    v17 = [v7 legs];
    v18 = [(_MNLocationSimulationState *)self data];
    v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));

    if ([(_MNLocationSimulationState_FollowingRoute *)self _isCoordinate:v6 atEndOfLeg:v19])
    {
      [(_MNLocationSimulationState_SearchingForParkingBeforeArrival *)self _handleReachedParkingLocation];
    }
    v20 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v15, v32);

    goto LABEL_7;
  }
  v20 = 0;
LABEL_8:
  return v20;
}

- (void)_findRouteToParkingDestination
{
  v3 = [MNSequence alloc];
  dispatch_queue_t v4 = dispatch_queue_create("MNNavigationSimulation_SearchingForParking", 0);
  v5 = [(MNSequence *)v3 initWithQueue:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke;
  v8[3] = &unk_1E60F8308;
  v8[4] = self;
  [(MNSequence *)v5 addStep:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_2;
  v7[3] = &unk_1E60F8358;
  v7[4] = self;
  [(MNSequence *)v5 addStep:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_3;
  v6[3] = &unk_1E60F8420;
  v6[4] = self;
  [(MNSequence *)v5 addStep:v6];
  [(MNSequence *)v5 start];
}

- (void)_findParkingLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F64690]);
  $212C09783140BCCD23384160D545CE0D v6 = (void *)[v5 initWithQueue:MEMORY[0x1E4F14428]];
  v7 = [(_MNLocationSimulationState *)self data];
  double v8 = [v7 auditToken];
  [v6 setAuditToken:v8];

  [v6 setAllowNetworkTileLoad:1];
  [v6 setFlipNegativeTravelDirectionRoads:1];
  [v6 setVisitDoubleTravelDirectionRoadsTwice:0];
  double v9 = [(_MNLocationSimulationState *)self data];
  double v10 = [v9 lastLocation];
  objc_msgSend(v10, "_navigation_geoCoordinate");
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__9;
  v32[4] = __Block_byref_object_dispose__9;
  id v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  double v15 = [(_MNLocationSimulationState *)self data];
  v16 = [v15 routeInfo];
  v17 = [v16 route];
  v18 = [(_MNLocationSimulationState *)self data];
  v19 = [v18 routeInfo];
  v20 = [v19 route];
  objc_msgSend(v17, "pointAt:", objc_msgSend(v20, "pointCount") - 1);
  double v22 = v21;
  double v24 = v23;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke;
  v30[3] = &unk_1E60F8448;
  v30[7] = v12;
  v30[8] = v14;
  v30[4] = self;
  v30[5] = v31;
  v30[6] = v32;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke_2;
  v27[3] = &unk_1E60F8470;
  v29 = v32;
  id v25 = v4;
  id v28 = v25;
  id v26 = (id)objc_msgSend(v6, "findRoadsNear:radius:handler:completionHandler:", v30, v27, v22, v24, 200.0);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
}

- (double)_scoreForRoad:(id)a3 coordinate:(id)a4
{
  id v5 = a3;
  $212C09783140BCCD23384160D545CE0D v6 = [v5 internalRoadName];

  double v7 = 0.0;
  if (v6)
  {
    if ([v5 roadClass] != 9)
    {
      uint64_t v8 = [v5 coordinates3d];
      uint64_t v9 = v8 + 24 * [v5 coordinateCount];
      double v10 = *(double *)(v9 - 24);
      double v11 = *(double *)(v9 - 16);
      if ([v5 travelDirection] != 1
        || (GEOCalculateDistance(), double v13 = v12, [v5 coordinates3d], GEOCalculateDistance(), v14 < v13))
      {
        id v15 = objc_alloc(MEMORY[0x1E4F649E0]);
        v16 = [(_MNLocationSimulationState *)self data];
        v17 = [v16 routeInfo];
        v18 = [v17 route];
        v19 = [(_MNLocationSimulationState *)self data];
        v20 = [v19 auditToken];
        double v21 = (void *)[v15 initWithRoute:v18 auditToken:v20];

        objc_msgSend(v21, "distanceToRouteFrom:", v10, v11);
        if (v22 >= 50.0 && v22 <= 75.0)
        {
          double v23 = [(_MNLocationSimulationState *)self data];
          double v24 = [v23 routeInfo];
          id v25 = [v24 route];

          objc_msgSend(v25, "pointAt:", objc_msgSend(v25, "pointCount") - 1);
          GEOCalculateDistance();
          double v7 = v26;
        }
      }
    }
  }

  return v7;
}

- (void)_findRouteToParkingLocation:(id)a3 finishedHandler:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = (objc_class *)MEMORY[0x1E4F64660];
  id v8 = a3;
  id v9 = [v7 alloc];
  double v10 = [(_MNLocationSimulationState *)self data];
  double v11 = [v10 lastLocation];
  double v12 = (void *)[v9 initWithCLLocation:v11];

  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v12 isCurrentLocation:1];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v8 isCurrentLocation:0];
  id v15 = objc_alloc_init(MEMORY[0x1E4F64548]);
  [v15 setRequestType:1];
  [v15 setCurrentLocation:v8];

  v30[0] = v13;
  v30[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [v15 setWaypoints:v16];

  [v15 setTransportType:0];
  v17 = [(_MNLocationSimulationState *)self data];
  v18 = [v17 routeInfo];
  v19 = [v18 route];
  v20 = [v19 routeAttributes];
  [v15 setRouteAttributes:v20];

  [v15 setMaxRouteCount:1];
  double v21 = [(_MNLocationSimulationState *)self data];
  double v22 = [v21 auditToken];
  [v15 setAuditToken:v22];

  double v23 = [(_MNLocationSimulationState *)self data];
  double v24 = [v23 requestingAppIdentifier];
  [v15 setRequestingAppIdentifier:v24];

  id v25 = [MEMORY[0x1E4F64540] sharedService];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __107___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingLocation_finishedHandler___block_invoke;
  v28[3] = &unk_1E60F63F0;
  id v29 = v6;
  id v26 = v6;
  id v27 = (id)[v25 requestRoutes:v15 handler:v28];
}

- (id)_routeToFollow
{
  return self->_routeToParkingDestination;
}

- (void)_handleReachedParkingLocation
{
  id v3 = [(_MNLocationSimulationState *)self delegate];
  v2 = objc_alloc_init(_MNLocationSimulationState_WaitingForParkingSignal);
  [v3 changeState:v2];
}

- (void).cxx_destruct
{
}

@end