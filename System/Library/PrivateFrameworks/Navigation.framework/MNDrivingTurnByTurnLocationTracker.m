@interface MNDrivingTurnByTurnLocationTracker
- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4;
- (BOOL)shouldProjectAlongRoute;
- (MNDrivingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3;
- (id)_currentVehicleParkingInfoForParkingType:(int64_t)a3;
- (id)_matchedLocationForLocation:(id)a3;
- (id)_newMapMatcherForRoute:(id)a3;
- (id)_overrideLocationForLocation:(id)a3;
- (int)_detectedMotionForLocation:(id)a3;
- (int)transportType;
- (void)_updateForAlternateRoutes:(id)a3;
- (void)_updateForArrivalAtLegIndex:(unint64_t)a3;
- (void)_updateForLocation:(id)a3;
- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)_updateForSelectedNewRoute:(id)a3 alternateRoutes:(id)a4;
- (void)_updateWalkingRouteBackgroundLoader;
- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4;
- (void)arrivalUpdater:(id)a3 didUpdateVehicleParkingType:(int64_t)a4;
- (void)arrivalUpdaterDidEnterParkingDetectionRegion:(id)a3;
- (void)arrivalUpdaterDidLeaveParkingDetectionRegion:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)stopTracking;
- (void)tracePaused;
- (void)tunnelLocationProjector:(id)a3 didUpdateLocation:(id)a4;
- (void)updateForETAUResponse:(id)a3;
- (void)updateRequestForETAUpdate:(id)a3;
- (void)walkingRouteBackgroundLoader:(id)a3 didUpdateWalkingRoute:(id)a4;
@end

@implementation MNDrivingTurnByTurnLocationTracker

- (MNDrivingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  v3 = [(MNTurnByTurnLocationTracker *)&v7 initWithNavigationSession:a3];
  v4 = v3;
  if (v3)
  {
    v3->_detectedTransportType = 4;
    v3->_lastKnownCourse = -1.0;
    v5 = v3;
  }

  return v4;
}

- (id)_currentVehicleParkingInfoForParkingType:(int64_t)a3
{
  v5 = objc_alloc_init(MNVehicleParkingInfo);
  [(MNVehicleParkingInfo *)v5 setParkingType:a3];
  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  if (walkingRouteBackgroundLoader)
  {
    objc_super v7 = [(MNWalkingRouteBackgroundLoader *)walkingRouteBackgroundLoader walkingRouteInfo];
    v8 = [v7 route];
    [(MNVehicleParkingInfo *)v5 setRemainingWalkingRoute:v8];

    v9 = [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader walkingRouteInfo];
    v10 = [v9 displayETAInfo];
    [(MNVehicleParkingInfo *)v5 setWalkingRouteDisplayETAInfo:v10];
  }
  return v5;
}

- (void)setNavigationSessionState:(id)a3
{
  id v4 = a3;
  v5 = [(MNLocationTracker *)self navigationSessionState];
  uint64_t v6 = [v5 arrivalState];
  uint64_t v7 = [v4 arrivalState];

  v8 = [(MNLocationTracker *)self navigationSessionState];
  int v9 = [v8 isDisplayingNavigationTray];
  int v10 = [v4 isDisplayingNavigationTray];

  v11.receiver = self;
  v11.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v11 setNavigationSessionState:v4];
  [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader setNavigationSessionState:v4];

  if (v6 != v7 || v9 != v10) {
    [(MNDrivingTurnByTurnLocationTracker *)self _updateWalkingRouteBackgroundLoader];
  }
}

- (int)transportType
{
  return 0;
}

- (BOOL)shouldProjectAlongRoute
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  v36.receiver = self;
  v36.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v36 startTrackingWithInitialLocation:a3 targetLegIndex:a4];
  v5 = [(MNLocationTracker *)self navigationSession];
  uint64_t v6 = [v5 traceManager];
  uint64_t v7 = [v6 tracePlayer];

  v8 = [(MNLocationTracker *)self navigationSession];
  int v9 = [v8 routeManager];

  if (!v7
    || !GEOConfigGetBOOL()
    || ([v7 sessionUpdater], int v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    objc_super v11 = [(MNLocationTracker *)self navigationSession];
    v12 = [v11 routeManager];
    v13 = [v12 currentRouteInfo];
    [(MNLocationTracker *)self navigationSession];
    v35 = v9;
    v15 = v14 = v7;
    v16 = [v15 routeManager];
    v17 = [v16 alternateRoutes];
    v18 = [v17 firstObject];
    v19 = +[MNTrafficIncidentAlert validTrafficIncidentAlertsForNewRoute:v13 alternateRouteInfo:v18];
    [(MNTurnByTurnLocationTracker *)self _updateForNewTrafficIncidentAlerts:v19];

    uint64_t v7 = v14;
    int v9 = v35;
  }
  v20 = objc_alloc_init(MNTunnelLocationProjector);
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = v20;

  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:self];
  v22 = self->_tunnelLocationProjector;
  v23 = [v9 currentRouteInfo];
  [(MNTunnelLocationProjector *)v22 updateForRouteInfo:v23];

  v24 = objc_alloc_init(MNAlternateRoutesUpdater);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = v24;

  v26 = self->_alternateRoutesUpdater;
  v27 = [v9 alternateRoutes];
  v28 = [v9 currentRouteInfo];
  [(MNAlternateRoutesUpdater *)v26 setAlternateRoutes:v27 forMainRoute:v28];

  v29 = [(MNLocationTracker *)self safeDelegate];
  v30 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  [v29 locationTracker:self didUpdateAlternateRoutes:v30];

  v31 = [v9 currentRoute];
  v32 = [v31 etauPositions];
  v33 = (NSMutableArray *)[v32 mutableCopy];
  etauPositions = self->_etauPositions;
  self->_etauPositions = v33;
}

- (void)stopTracking
{
  v6.receiver = self;
  v6.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v6 stopTracking];
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = 0;

  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:0];
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector stop];
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = 0;

  [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader stop];
  [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader setDelegate:0];
  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  self->_walkingRouteBackgroundLoader = 0;
}

- (void)updateRequestForETAUpdate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v11 updateRequestForETAUpdate:v4];
  v5 = [(MNLocationTracker *)self navigationSession];
  objc_super v6 = [v5 serverSessionStateInfo];
  uint64_t v7 = [v6 displayedTrafficBanners];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MNDrivingTurnByTurnLocationTracker_updateRequestForETAUpdate___block_invoke;
  v9[3] = &unk_1E60F69A0;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __64__MNDrivingTurnByTurnLocationTracker_updateRequestForETAUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  v5 = *(void **)(a1 + 32);
  objc_super v6 = (void *)[a2 copy];
  [v5 addDisplayedBannerId:v6];

  if ([v11 length])
  {
    uint64_t v7 = [*(id *)(a1 + 32) clientFeedbackInfo];

    if (!v7)
    {
      id v8 = objc_opt_new();
      [*(id *)(a1 + 32) setClientFeedbackInfo:v8];
    }
    int v9 = [*(id *)(a1 + 32) clientFeedbackInfo];
    id v10 = (void *)[v11 copy];
    [v9 addDisplayedBannerEventInfo:v10];
  }
}

- (void)updateForETAUResponse:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v32 updateForETAUResponse:v4];
  v5 = [(MNLocationTracker *)self navigationSessionState];
  objc_super v6 = [v5 currentRouteInfo];
  uint64_t v7 = [v6 route];

  id v8 = objc_alloc(MEMORY[0x1E4F649D0]);
  int v9 = [v4 waypoints];
  id v10 = [v4 request];
  id v11 = [v10 routeAttributes];
  v12 = [v4 response];
  v13 = [v7 styleAttributes];
  v14 = (void *)[v8 initWithWaypoints:v9 routeAttributes:v11 etauResponse:v12 styleAttributes:v13];

  v15 = [v14 allETAUAlternateRouteInfos];
  v16 = [(MNLocationTracker *)self navigationSession];
  v17 = [v16 routeManager];
  v18 = [v17 currentRouteInfo];
  v19 = [v15 firstObject];
  v20 = +[MNTrafficIncidentAlert validTrafficIncidentAlertsForETAUpdate:v18 alternateRouteInfo:v19];

  [(MNTurnByTurnLocationTracker *)self _updateForNewTrafficIncidentAlerts:v20];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v22)
  {

LABEL_11:
    -[MNDrivingTurnByTurnLocationTracker _updateForAlternateRoutes:](self, "_updateForAlternateRoutes:", v15, (void)v28);
    goto LABEL_12;
  }
  uint64_t v23 = v22;
  char v24 = 0;
  uint64_t v25 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v29 != v25) {
        objc_enumerationMutation(v21);
      }
      v27 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "alternateRoute", (void)v28);
      v24 |= v27 != 0;
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v23);

  if ((v24 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
}

- (id)_matchedLocationForLocation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    long long v28 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNDrivingTurnByTurnLocationTracker::_matchedLocationForLocation:", buf, 0xCu);
  }
  uint64_t v7 = MNGetMNLocationTrackerLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  int v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedDrivingTBTLocationForLocation", "", buf, 2u);
  }

  if ([(MNTunnelLocationProjector *)self->_tunnelLocationProjector isProjecting])
  {
    [v4 horizontalAccuracy];
    if (v11 > 65.0 || ([v4 course], v12 < 0.0) || (objc_msgSend(v4, "speed"), v13 < 0.0))
    {
      v14 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:
        v16 = 0;
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v15 = "We are still projecting and have not processed a high quality location. Ignoring current location.";
LABEL_12:
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 2u);
      goto LABEL_13;
    }
    v17 = [(MNLocationTracker *)self lastMatchedLocation];
    v18 = [v17 timestamp];
    [v18 timeIntervalSinceReferenceDate];
    double v20 = v19;

    id v21 = [v4 timestamp];
    [v21 timeIntervalSinceReferenceDate];
    double v23 = v22;

    if (v23 + 2.0 < v20)
    {
      v14 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v15 = "Filtering location was generated more than 2 seconds before our last projected location.";
      goto LABEL_12;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  v16 = [(MNTurnByTurnLocationTracker *)&v26 _matchedLocationForLocation:v4];
  char v24 = v10;
  v14 = v24;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v14, OS_SIGNPOST_INTERVAL_END, v8, "MatchedDrivingTBTLocationForLocation", "", buf, 2u);
  }
LABEL_18:

  return v16;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F64760];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(MNLocationTracker *)self _auditToken];
  os_signpost_id_t v8 = (void *)[v6 initWithRoute:v5 auditToken:v7];

  [v8 setUseMatchedCoordinateForMatching:GEOConfigGetBOOL()];
  return v8;
}

- (id)_overrideLocationForLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_lastKnownCourse >= 0.0)
  {
    [v4 rawCourse];
    if (v6 >= 0.0)
    {
      [v5 rawCourse];
      self->_double lastKnownCourse = v14;
      goto LABEL_17;
    }
  }
  [v5 rawCourse];
  double v8 = v7;
  [v5 courseAccuracy];
  if (v9 >= 0.0 && v9 < 20.0) {
    goto LABEL_15;
  }
  double lastKnownCourse = self->_lastKnownCourse;
  [v5 speed];
  if (v8 < 0.0)
  {
    self->_consecutiveValidCourseCount = 1.0;
    double lastKnownCourse = self->_lastKnownCourse;
    double v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEBUG, "Current course less than 0. Setting _consecutiveValidCourseCount to 1.", v17, 2u);
    }

    goto LABEL_16;
  }
  if (v12 > 3.0)
  {
    double v15 = self->_consecutiveValidCourseCount + 1.0;
    self->_consecutiveValidCourseCount = v15;
    if (v15 > 3.0)
    {
      self->_consecutiveValidCourseCount = 0.0;
LABEL_15:
      double lastKnownCourse = v8;
    }
  }
LABEL_16:
  self->_double lastKnownCourse = lastKnownCourse;
  [v5 setCourse:lastKnownCourse];
LABEL_17:
  return v5;
}

- (void)_updateForLocation:(id)a3
{
  id v10 = a3;
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector updateLocation:v10];
  if ([(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater updateForLocation:v10])
  {
    id v4 = [(MNLocationTracker *)self safeDelegate];
    id v5 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
    [v4 locationTracker:self didUpdateAlternateRoutes:v5];
  }
  double v6 = [(NSMutableArray *)self->_etauPositions firstObject];
  if (v6)
  {
    double v7 = [v10 routeMatch];
    [v7 routeCoordinate];
    [v6 routeCoordinate];
    uint64_t v8 = GEOPolylineCoordinateCompare();

    if (v8 != -1)
    {
      double v9 = [(MNLocationTracker *)self safeDelegate];
      [v9 locationTracker:self didReachETAUpdatePosition:v6];

      [(NSMutableArray *)self->_etauPositions removeObject:v6];
    }
  }
}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v32 = a3;
  id v10 = a6;
  id v11 = a5;
  uint64_t Integer = GEOConfigGetInteger();
  if (Integer)
  {
    uint64_t v13 = Integer;
    uint64_t v14 = [(MNLocationTracker *)self lastMatchedLocation];
    if (v14)
    {
      double v15 = [(MNLocationTracker *)self lastMatchedLocation];
      v16 = [v15 routeMatch];

      if (v16)
      {
        v17 = [(MNLocationTracker *)self lastMatchedLocation];
        v18 = [v17 routeMatch];

        double v19 = [v32 route];
        objc_msgSend(v19, "distanceToEndFromRouteCoordinate:", objc_msgSend(v18, "routeCoordinate"));
        uint64_t v14 = v20;
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    unint64_t v21 = [(MNLocationTracker *)self targetLegIndex];
    double v22 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
    double v23 = [v22 firstObject];
    [v10 addFakeTrafficIncidentAlert:v13 targetLegIndex:v21 mainRouteInfo:v32 alternateRouteInfo:v23 currentDistance:v14];
  }
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector updateForRouteInfo:v32];
  [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater updateForReroute:v32 rerouteReason:a4];
  char v24 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  uint64_t v25 = [v32 route];
  objc_super v26 = [v25 etauPositions];
  v27 = (NSMutableArray *)[v26 mutableCopy];
  etauPositions = self->_etauPositions;
  self->_etauPositions = v27;

  uint64_t v29 = [(MNLocationTracker *)self safeDelegate];
  [v29 locationTracker:self didReroute:v32 newAlternateRoutes:v24 rerouteReason:a4 request:v11 response:v10];

  if (a4 != 10)
  {
    long long v30 = [v24 firstObject];
    long long v31 = +[MNTrafficIncidentAlert validTrafficIncidentAlertsForNewRoute:v32 alternateRouteInfo:v30];
    [(MNTurnByTurnLocationTracker *)self _updateForNewTrafficIncidentAlerts:v31];
  }
}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:0];
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector stop];
  v5.receiver = self;
  v5.super_class = (Class)MNDrivingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v5 _updateForArrivalAtLegIndex:a3];
}

- (void)_updateForSelectedNewRoute:(id)a3 alternateRoutes:(id)a4
{
  [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater setAlternateRoutes:a4 forMainRoute:a3];
  id v6 = [(MNLocationTracker *)self safeDelegate];
  objc_super v5 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  [v6 locationTracker:self didUpdateAlternateRoutes:v5];
}

- (int)_detectedMotionForLocation:(id)a3
{
  id v4 = a3;
  if (([v4 locationUnreliable] & 1) != 0 || (objc_msgSend(v4, "horizontalAccuracy"), v5 >= 50.0))
  {
    self->_vehicleExitConfidence = 0;
    double v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "Unreliable location to detect motion. Resetting motion.", v15, 2u);
    }

    int detectedTransportType = 4;
  }
  else
  {
    id v6 = [(MNLocationTracker *)self navigationSession];
    double v7 = [v6 motionContext];

    if ([v7 isDriving])
    {
      if ([v7 confidence]) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = self->_vehicleExitConfidence & 0xFFFFFFFE;
      }
      self->_vehicleExitConfidence = v8;
      self->_int detectedTransportType = 0;
    }
    else
    {
      if (!self->_vehicleExitConfidence)
      {
        id v11 = [v4 rawLocation];
        [v11 coordinate];
        self->_vehicleExitCoordinate.latitude = v12;
        self->_vehicleExitCoordinate.longitude = v13;
      }
      if (([v7 isWalking] & 1) != 0 || objc_msgSend(v7, "isRunning"))
      {
        self->_vehicleExitConfidence |= 1uLL;
        self->_int detectedTransportType = 2;
      }
      if ([v7 exitType] == 1) {
        self->_vehicleExitConfidence |= 4uLL;
      }
      if ([v7 exitType] == 2) {
        self->_vehicleExitConfidence |= 6uLL;
      }
    }
    int detectedTransportType = self->_detectedTransportType;
  }
  return detectedTransportType;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
}

- (void)_updateForAlternateRoutes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MNLocationTracker *)self state] != 2)
  {
    double v5 = [(MNLocationTracker *)self lastMatchedLocation];
    [v5 coordinate];
    id v6 = [(MNLocationTracker *)self navigationSession];
    double v7 = [v6 destination];

    unint64_t v8 = [v7 geoMapItem];
    [v8 centerCoordinate];
    GEOCalculateDistance();
    double v10 = v9;

    if (v10 < 1600.0)
    {

      id v4 = 0;
    }
  }
  id v11 = [(MNLocationTracker *)self navigationSession];
  double v12 = [v11 routeManager];
  double v13 = [v12 currentRouteInfo];

  if ([(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater setAlternateRoutes:v4 forMainRoute:v13])
  {
    uint64_t v14 = [(MNLocationTracker *)self safeDelegate];
    double v15 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
    [v14 locationTracker:self didUpdateAlternateRoutes:v15];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        double v22 = [(MNLocationTracker *)self safeDelegate];
        [v22 locationTracker:self didUpdateETAForRoute:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }
}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v9 = a4;
  unint64_t v5 = [v9 arrivalState];
  if (v5 <= 6 && ((1 << v5) & 0x62) != 0)
  {
    [(MNDrivingTurnByTurnLocationTracker *)self _updateWalkingRouteBackgroundLoader];
    if ([v9 arrivalState] == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    unint64_t v8 = [(MNDrivingTurnByTurnLocationTracker *)self _currentVehicleParkingInfoForParkingType:v7];
    [v9 setVehicleParkingInfo:v8];
  }
  [(MNLocationTracker *)self _updateArrivalInfo:v9];
}

- (void)_updateWalkingRouteBackgroundLoader
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(MNLocationTracker *)self navigationSessionState];
  int isInParkingDetectionRegion = 0;
  switch([v3 arrivalState])
  {
    case 0:
      if (self->_isInParkingDetectionRegion) {
        int isInParkingDetectionRegion = [v3 isDisplayingNavigationTray];
      }
      else {
        int isInParkingDetectionRegion = 0;
      }
      break;
    case 1:
    case 5:
      int isInParkingDetectionRegion = 1;
      break;
    case 6:
      int isInParkingDetectionRegion = self->_isInParkingDetectionRegion;
      break;
    default:
      break;
  }
  unint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = isInParkingDetectionRegion;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Should start walking route background loader: %d", (uint8_t *)v9, 8u);
  }

  walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
  if (isInParkingDetectionRegion)
  {
    if (!walkingRouteBackgroundLoader)
    {
      uint64_t v7 = objc_alloc_init(MNWalkingRouteBackgroundLoader);
      unint64_t v8 = self->_walkingRouteBackgroundLoader;
      self->_walkingRouteBackgroundLoader = v7;

      [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader setDelegate:self];
      walkingRouteBackgroundLoader = self->_walkingRouteBackgroundLoader;
    }
    [(MNWalkingRouteBackgroundLoader *)walkingRouteBackgroundLoader setNavigationSessionState:v3];
    [(MNWalkingRouteBackgroundLoader *)self->_walkingRouteBackgroundLoader start];
  }
  else
  {
    [(MNWalkingRouteBackgroundLoader *)walkingRouteBackgroundLoader stop];
  }
}

- (void)arrivalUpdaterDidEnterParkingDetectionRegion:(id)a3
{
  self->_int isInParkingDetectionRegion = 1;
  [(MNDrivingTurnByTurnLocationTracker *)self _updateWalkingRouteBackgroundLoader];
}

- (void)arrivalUpdaterDidLeaveParkingDetectionRegion:(id)a3
{
  self->_int isInParkingDetectionRegion = 0;
  [(MNDrivingTurnByTurnLocationTracker *)self _updateWalkingRouteBackgroundLoader];
}

- (void)arrivalUpdater:(id)a3 didUpdateVehicleParkingType:(int64_t)a4
{
  id v6 = [(MNDrivingTurnByTurnLocationTracker *)self _currentVehicleParkingInfoForParkingType:a4];
  unint64_t v5 = [(MNLocationTracker *)self safeDelegate];
  [v5 locationTracker:self didUpdateVehicleParkingInfo:v6];
}

- (void)tunnelLocationProjector:(id)a3 didUpdateLocation:(id)a4
{
  id v5 = a4;
  [(MNLocationTracker *)self _updateMatchedLocation:v5];
  id v6 = [(MNLocationTracker *)self safeDelegate];
  [v6 locationTracker:self didUpdateMatchedLocation:v5];
}

- (void)walkingRouteBackgroundLoader:(id)a3 didUpdateWalkingRoute:(id)a4
{
  id v5 = a4;
  id v6 = [(MNLocationTracker *)self safeDelegate];
  [v6 locationTracker:self didUpdateBackgroundWalkingRoute:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_walkingRouteBackgroundLoader, 0);
  objc_storeStrong((id *)&self->_alternateRoutesUpdater, 0);
  objc_storeStrong((id *)&self->_tunnelLocationProjector, 0);
}

- (void)tracePaused
{
}

@end