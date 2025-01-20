@interface MNWalkingTurnByTurnLocationTracker
- (BOOL)_allowRerouteForLocation:(id)a3;
- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4;
- (MNWalkingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3;
- (id)_newMapMatcherForRoute:(id)a3;
- (int)_detectedMotionForLocation:(id)a3;
- (int)transportType;
- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
@end

@implementation MNWalkingTurnByTurnLocationTracker

- (MNWalkingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  v3 = [(MNTurnByTurnLocationTracker *)&v7 initWithNavigationSession:a3];
  v4 = v3;
  if (v3)
  {
    v3->_detectedTransportType = 4;
    v5 = v3;
  }

  return v4;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v4 startTrackingWithInitialLocation:a3 targetLegIndex:a4];
}

- (int)transportType
{
  return 2;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F64788];
  id v5 = a3;
  id v6 = [v4 alloc];
  objc_super v7 = [(MNLocationTracker *)self _auditToken];
  v8 = (void *)[v6 initWithRoute:v5 auditToken:v7];

  return v8;
}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v12 _updateForReroute:v10 rerouteReason:a4 request:a5 response:a6];
  if (a4 != 10)
  {
    v11 = +[MNTrafficIncidentAlert validTrafficIncidentAlertsForNewRoute:v10 alternateRouteInfo:0];
    [(MNTurnByTurnLocationTracker *)self _updateForNewTrafficIncidentAlerts:v11];
  }
}

- (BOOL)_allowRerouteForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MNLocationTracker *)self navigationSessionState];
  uint64_t v6 = [v5 initialRouteSource];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_super v7 = [(MNLocationTracker *)self navigationSessionState];
    int v8 = [v7 hasBeenOnRouteOnce];

    GEOConfigGetDouble();
    double v10 = v9;
    if (v8)
    {
      v11 = [(MNTurnByTurnLocationTracker *)self lastKnownGoodLocationOnRoute];
      objc_super v12 = [v11 routeMatch];
      [v12 locationCoordinate3D];

      objc_msgSend(v4, "_navigation_geoCoordinate3D");
      GEOCalculateDistance();
      double v14 = v13;
    }
    else
    {
      v16 = [v4 routeMatch];
      [v16 distanceFromRoute];
      double v14 = v17;
    }
    BOOL v15 = v14 > v10;
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (int)_detectedMotionForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MNLocationTracker *)self navigationSession];
  uint64_t v6 = [v5 motionContext];

  [v6 confidence];
  if ([v6 isWalking] & 1) != 0 || (objc_msgSend(v6, "isRunning"))
  {
    int v7 = 2;
  }
  else
  {
    if (([v6 isDriving] & 1) == 0) {
      goto LABEL_8;
    }
    int v7 = 0;
  }
  if (self->_detectedTransportType != v7)
  {
    int v8 = [v4 rawLocation];
    [v8 coordinate];
    double v10 = v9;
    double v12 = v11;

    self->_int detectedTransportType = v7;
    self->_detectedTransportTypeOrigin.latitude = v10;
    self->_detectedTransportTypeOrigin.longitude = v12;
  }
LABEL_8:
  int detectedTransportType = self->_detectedTransportType;

  return detectedTransportType;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3
    || ([v5 speed], v7 < 5.36)
    || ([v6 rawLocation],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 coordinate],
        v8,
        GEOCalculateDistance(),
        v9 < 100.0))
  {
    BOOL v11 = 0;
  }
  else
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138477827;
      double v14 = @"AUTOMOBILE";
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "Allow switching to transport type: %{private}@", (uint8_t *)&v13, 0xCu);
    }

    BOOL v11 = 1;
  }

  return v11;
}

@end