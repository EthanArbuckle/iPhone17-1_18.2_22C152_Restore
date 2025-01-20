@interface _MNLocationSimulationState_SearchingForOffRoute
- ($1AB5FA073B851C12C2339EC22442E995)_nextOffRouteTarget;
- (id)_routeToFollow;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)_findFirstJunction:(id)a3;
- (void)_findOffRouteLocationWithMatchedSegments:(id)a3 stepFinishedHandler:(id)a4;
- (void)_findRouteToOffRouteLocation;
- (void)_findRouteToOffRouteLocation:(id)a3 stepFinishedHandler:(id)a4;
- (void)onEnterState;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation _MNLocationSimulationState_SearchingForOffRoute

- (int64_t)type
{
  return 5;
}

- (void)onEnterState
{
  v3 = [(_MNLocationSimulationState *)self data];
  v4 = [v3 lastLocation];

  if (v4)
  {
    [(_MNLocationSimulationState_SearchingForOffRoute *)self _findRouteToOffRouteLocation];
  }
  else
  {
    self->_shouldStartSearchOnNextLocation = 1;
  }
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  double v23 = 0.0;
  v5 = [(_MNLocationSimulationState *)self data];
  $212C09783140BCCD23384160D545CE0D v6 = -[_MNLocationSimulationState_FollowingRoute _projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:](self, "_projectedCoordinateOnRouteFrom:overTimeDelta:outSpeed:", [v5 lastRouteCoordinate], &v23, a3);

  if (GEOPolylineCoordinateIsValid())
  {
    v7 = [(_MNLocationSimulationState_SearchingForOffRoute *)self _routeToFollow];
    [v7 pointAtRouteCoordinate:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v7 courseAtRouteCoordinateIndex:v6];
    v15 = -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v9, v11, v13, v14, v23);
    v16 = [(_MNLocationSimulationState *)self data];
    [v16 setLastRouteCoordinate:v6];

    if (self->_routeToOffRouteLocation)
    {
      v17 = [v7 legs];
      v18 = [(_MNLocationSimulationState *)self data];
      v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentLegIndex"));

      if ([(_MNLocationSimulationState_FollowingRoute *)self _isCoordinate:v6 atEndOfLeg:v19])
      {
        v20 = [(_MNLocationSimulationState *)self delegate];
        v21 = objc_opt_new();
        [v20 changeState:v21];
      }
    }
    else if (self->_shouldStartSearchOnNextLocation)
    {
      self->_shouldStartSearchOnNextLocation = 0;
      [(_MNLocationSimulationState_SearchingForOffRoute *)self _findRouteToOffRouteLocation];
    }
  }
  else
  {
    v7 = [(_MNLocationSimulationState *)self data];
    v15 = [v7 lastLocation];
  }

  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  if (!self->_routeToOffRouteLocation)
  {
    v4.receiver = self;
    v4.super_class = (Class)_MNLocationSimulationState_SearchingForOffRoute;
    [(_MNLocationSimulationState_FollowingRoute *)&v4 updateWithRouteInfo:a3 rerouteReason:a4];
  }
}

- (id)_routeToFollow
{
  routeToOffRouteLocation = self->_routeToOffRouteLocation;
  if (routeToOffRouteLocation)
  {
    v3 = routeToOffRouteLocation;
  }
  else
  {
    objc_super v4 = [(_MNLocationSimulationState *)self data];
    v3 = [v4 routeToFollow];
  }
  return v3;
}

- (void)_findRouteToOffRouteLocation
{
  v3 = [MNSequence alloc];
  objc_super v4 = (void *)geo_dispatch_queue_create();
  v5 = [(MNSequence *)v3 initWithQueue:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke;
  v9[3] = &unk_1E60F8308;
  v9[4] = self;
  [(MNSequence *)v5 addStep:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_2;
  v8[3] = &unk_1E60F8330;
  v8[4] = self;
  [(MNSequence *)v5 addStep:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_3;
  v7[3] = &unk_1E60F8358;
  v7[4] = self;
  [(MNSequence *)v5 addStep:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_264;
  v6[3] = &unk_1E60F8380;
  v6[4] = self;
  [(MNSequence *)v5 setSequenceFinalizeHandler:v6];
  [(MNSequence *)v5 start];
}

- (void)_findFirstJunction:(id)a3
{
  id v4 = a3;
  v5 = [(_MNLocationSimulationState *)self data];
  $212C09783140BCCD23384160D545CE0D v6 = [v5 routeInfo];
  v7 = [v6 route];

  id v8 = objc_alloc(MEMORY[0x1E4F64818]);
  double v9 = [(_MNLocationSimulationState *)self data];
  double v10 = [v9 auditToken];
  double v11 = (void *)[v8 initWithRoute:v7 auditToken:v10 loggingIdentifier:@"MNNavigationSimulation"];

  uint64_t v12 = [v7 endRouteCoordinate];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70___MNLocationSimulationState_SearchingForOffRoute__findFirstJunction___block_invoke;
  v15[3] = &unk_1E60F83A8;
  id v16 = v4;
  uint64_t v13 = *MEMORY[0x1E4F641A8];
  id v14 = v4;
  [v11 matchRouteFromStart:v13 toEnd:v12 finishedHandler:v15];
}

- (void)_findOffRouteLocationWithMatchedSegments:(id)a3 stepFinishedHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, BOOL))a4;
  id v8 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Starting search for off route target.", buf, 2u);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F64690]);
  double v10 = (void *)geo_dispatch_queue_create();
  double v11 = (GEOMapFeatureAccess *)[v9 initWithQueue:v10];
  mapFeatureAccess = self->_mapFeatureAccess;
  self->_mapFeatureAccess = v11;

  uint64_t v13 = [(_MNLocationSimulationState *)self data];
  id v14 = [v13 auditToken];
  [(GEOMapFeatureAccess *)self->_mapFeatureAccess setAuditToken:v14];

  [(GEOMapFeatureAccess *)self->_mapFeatureAccess setAllowNetworkTileLoad:1];
  [(GEOMapFeatureAccess *)self->_mapFeatureAccess setFlipNegativeTravelDirectionRoads:1];
  [(GEOMapFeatureAccess *)self->_mapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:0];
  v15 = (NSMutableArray *)objc_opt_new();
  candidateRoads = self->_candidateRoads;
  self->_candidateRoads = v15;

  v17 = (NSMutableSet *)objc_opt_new();
  checkedRoads = self->_checkedRoads;
  self->_checkedRoads = v17;

  v19 = [(_MNLocationSimulationState *)self data];
  v20 = [v19 routeInfo];
  v21 = [v20 route];

  GEOConfigGetDouble();
  v34 = v21;
  objc_msgSend(v21, "routeCoordinateForDistanceAfterStart:");
  if ([v6 count])
  {
    v33 = v7;
    uint64_t v22 = 0;
    while (1)
    {
      double v23 = objc_msgSend(v6, "objectAtIndexedSubscript:", v22, v33);
      [v23 endRouteCoordinate];
      if ((GEOPolylineCoordinateIsABeforeB() & 1) == 0)
      {
        v24 = MNGetMNNavigationSimulationLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_DEBUG, "Checking divergence from matched segment: %@", buf, 0xCu);
        }

        v25 = self->_candidateRoads;
        v26 = [v23 road];
        [(NSMutableArray *)v25 addObject:v26];

        [(_MNLocationSimulationState_SearchingForOffRoute *)self _nextOffRouteTarget];
        if (v28 >= -180.0 && v28 <= 180.0 && v27 >= -90.0 && v27 <= 90.0) {
          break;
        }
      }

      if (++v22 >= (unint64_t)[v6 count])
      {
        v29 = 0;
        goto LABEL_16;
      }
    }
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:", v27, v28);

LABEL_16:
    v7 = v33;
  }
  else
  {
    v29 = 0;
  }
  v30 = self->_mapFeatureAccess;
  self->_mapFeatureAccess = 0;

  v31 = self->_candidateRoads;
  self->_candidateRoads = 0;

  v32 = self->_checkedRoads;
  self->_checkedRoads = 0;

  v7[2](v7, v29, v29 != 0);
}

- ($1AB5FA073B851C12C2339EC22442E995)_nextOffRouteTarget
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableArray *)self->_candidateRoads lastObject];
  [(NSMutableArray *)self->_candidateRoads removeLastObject];
  checkedRoads = self->_checkedRoads;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "roadID"));
  [(NSMutableSet *)checkedRoads addObject:v5];

  if (v3)
  {
    id v6 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v3;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "    Considering candidate road: %@", buf, 0xCu);
    }

    v7 = [(_MNLocationSimulationState *)self data];
    id v8 = [v7 routeInfo];
    id v9 = [v8 route];

    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F649E0]) initWithRoute:v9 auditToken:0];
    [v3 lastCoordinate2D];
    objc_msgSend(v10, "distanceToRouteFrom:");
    double v12 = v11;
    GEOConfigGetDouble();
    if (v12 <= v13)
    {
      v20 = [(GEOMapFeatureAccess *)self->_mapFeatureAccess synchronousFindRoadsFromNextIntersectionOf:v3];
      v21 = [(_MNLocationSimulationState *)self data];
      uint64_t v22 = [v21 routeInfo];
      double v23 = [v22 route];
      int v24 = [v23 transportType];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke;
      v35[3] = &unk_1E60F83D0;
      v35[4] = self;
      int v36 = v24;
      v25 = objc_msgSend(v20, "_geo_filtered:", v35);

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke_2;
      v33[3] = &unk_1E60F83F8;
      id v34 = v10;
      v26 = [v25 sortedArrayUsingComparator:v33];

      [(NSMutableArray *)self->_candidateRoads addObjectsFromArray:v26];
      *(double *)&unint64_t v17 = -180.0;
      while ([(NSMutableArray *)self->_candidateRoads count])
      {
        [(_MNLocationSimulationState_SearchingForOffRoute *)self _nextOffRouteTarget];
        if (v28 >= -180.0 && v28 <= 180.0)
        {
          *(double *)&unint64_t v15 = v27;
          if (v27 >= -90.0 && v27 <= 90.0)
          {
            uint64_t v19 = v29;
            *(double *)&unint64_t v17 = v28;
            goto LABEL_14;
          }
        }
      }
      *(double *)&uint64_t v19 = 1.79769313e308;
      *(double *)&unint64_t v15 = -180.0;
LABEL_14:
    }
    else
    {
      [v3 lastCoordinate];
      unint64_t v15 = v14;
      unint64_t v17 = v16;
      uint64_t v19 = v18;
    }
  }
  else
  {
    *(double *)&unint64_t v17 = -180.0;
    *(double *)&uint64_t v19 = 1.79769313e308;
    *(double *)&unint64_t v15 = -180.0;
  }

  double v30 = *(double *)&v15;
  double v31 = *(double *)&v17;
  double v32 = *(double *)&v19;
  result.var2 = v32;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (void)_findRouteToOffRouteLocation:(id)a3 stepFinishedHandler:(id)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F64660];
  id v8 = a3;
  id v9 = [v7 alloc];
  double v10 = [(_MNLocationSimulationState *)self data];
  double v11 = [v10 lastLocation];
  double v12 = (void *)[v9 initWithCLLocation:v11];

  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v12 isCurrentLocation:1];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v8 isCurrentLocation:0];

  id v15 = objc_alloc_init(MEMORY[0x1E4F64548]);
  [v15 setRequestType:1];
  [v15 setCurrentLocation:v12];
  v34[0] = v13;
  v34[1] = v14;
  unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v15 setWaypoints:v16];

  unint64_t v17 = [(_MNLocationSimulationState *)self data];
  uint64_t v18 = [v17 routeInfo];
  uint64_t v19 = [v18 route];
  objc_msgSend(v15, "setTransportType:", objc_msgSend(v19, "transportType"));

  v20 = [(_MNLocationSimulationState *)self data];
  v21 = [v20 routeInfo];
  uint64_t v22 = [v21 route];
  double v23 = [v22 routeAttributes];
  [v15 setRouteAttributes:v23];

  [v15 setMaxRouteCount:1];
  int v24 = [(_MNLocationSimulationState *)self data];
  v25 = [v24 auditToken];
  [v15 setAuditToken:v25];

  v26 = [(_MNLocationSimulationState *)self data];
  double v27 = [v26 requestingAppIdentifier];
  [v15 setRequestingAppIdentifier:v27];

  double v28 = (void *)[objc_alloc(MEMORY[0x1E4F64528]) initWithPurpose:1];
  [v15 setFeedback:v28];

  uint64_t v29 = [MEMORY[0x1E4F64540] sharedService];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __100___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation_stepFinishedHandler___block_invoke;
  v32[3] = &unk_1E60F63F0;
  id v33 = v6;
  id v30 = v6;
  id v31 = (id)[v29 requestRoutes:v15 handler:v32];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedRoads, 0);
  objc_storeStrong((id *)&self->_candidateRoads, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_routeToOffRouteLocation, 0);
}

@end