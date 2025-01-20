@interface MNCyclingTurnByTurnLocationTracker
- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4;
- (BOOL)shouldProjectAlongRoute;
- (MNCyclingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3;
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
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)stopTracking;
- (void)tunnelLocationProjector:(id)a3 didUpdateLocation:(id)a4;
@end

@implementation MNCyclingTurnByTurnLocationTracker

- (MNCyclingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  v3 = [(MNTurnByTurnLocationTracker *)&v7 initWithNavigationSession:a3];
  v4 = v3;
  if (v3)
  {
    v3->_lastKnownCourse = -1.0;
    v5 = v3;
  }

  return v4;
}

- (int)transportType
{
  return 3;
}

- (BOOL)shouldProjectAlongRoute
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v20 startTrackingWithInitialLocation:a3 targetLegIndex:a4];
  v5 = objc_alloc_init(MNTunnelLocationProjector);
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = v5;

  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:self];
  objc_super v7 = [(MNLocationTracker *)self navigationSession];
  v8 = [v7 routeManager];

  v9 = objc_alloc_init(MNAlternateRoutesUpdater);
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = v9;

  v11 = self->_alternateRoutesUpdater;
  v12 = [v8 alternateRoutes];
  v13 = [v8 currentRouteInfo];
  [(MNAlternateRoutesUpdater *)v11 setAlternateRoutes:v12 forMainRoute:v13];

  v14 = [(MNLocationTracker *)self safeDelegate];
  v15 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  [v14 locationTracker:self didUpdateAlternateRoutes:v15];

  v16 = [v8 currentRoute];
  v17 = [v16 etauPositions];
  v18 = (NSMutableArray *)[v17 mutableCopy];
  etauPositions = self->_etauPositions;
  self->_etauPositions = v18;
}

- (void)stopTracking
{
  v5.receiver = self;
  v5.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  [(MNTurnByTurnLocationTracker *)&v5 stopTracking];
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  self->_alternateRoutesUpdater = 0;

  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:0];
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector stop];
  tunnelLocationProjector = self->_tunnelLocationProjector;
  self->_tunnelLocationProjector = 0;
}

- (id)_matchedLocationForLocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNCyclingLocationTracker::_matchedLocationForLocation:", buf, 0xCu);
  }
  objc_super v7 = MNGetMNLocationTrackerLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedCyclingTBTLocationForLocation", "", buf, 2u);
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
LABEL_20:

        goto LABEL_21;
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

    v21 = [v4 timestamp];
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
  v27.receiver = self;
  v27.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
  v16 = [(MNTurnByTurnLocationTracker *)&v27 _matchedLocationForLocation:v4];
  v24 = v10;
  v25 = v24;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v25, OS_SIGNPOST_INTERVAL_END, v8, "MatchedCyclingTBTLocationForLocation", "", buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    v14 = [v4 uuid];
    [v16 setUuid:v14];
    goto LABEL_20;
  }
LABEL_21:

  return v16;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F64758];
  id v5 = a3;
  id v6 = [v4 alloc];
  objc_super v7 = [(MNLocationTracker *)self _auditToken];
  os_signpost_id_t v8 = (void *)[v6 initWithRoute:v5 auditToken:v7];

  [v8 setUseMatchedCoordinateForMatching:1];
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
  id v21 = a3;
  alternateRoutesUpdater = self->_alternateRoutesUpdater;
  id v11 = a6;
  id v12 = a5;
  [(MNAlternateRoutesUpdater *)alternateRoutesUpdater updateForReroute:v21 rerouteReason:a4];
  double v13 = [(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater alternateRoutes];
  double v14 = [v21 route];
  double v15 = [v14 etauPositions];
  v16 = (NSMutableArray *)[v15 mutableCopy];
  etauPositions = self->_etauPositions;
  self->_etauPositions = v16;

  v18 = [(MNLocationTracker *)self safeDelegate];
  [v18 locationTracker:self didReroute:v21 newAlternateRoutes:v13 rerouteReason:a4 request:v12 response:v11];

  if (a4 != 10)
  {
    double v19 = [v13 firstObject];
    double v20 = +[MNTrafficIncidentAlert validTrafficIncidentAlertsForNewRoute:v21 alternateRouteInfo:v19];
    [(MNTurnByTurnLocationTracker *)self _updateForNewTrafficIncidentAlerts:v20];
  }
}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector setDelegate:0];
  [(MNTunnelLocationProjector *)self->_tunnelLocationProjector stop];
  v5.receiver = self;
  v5.super_class = (Class)MNCyclingTurnByTurnLocationTracker;
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
  return 3;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
}

- (void)tunnelLocationProjector:(id)a3 didUpdateLocation:(id)a4
{
  id v5 = a4;
  [(MNLocationTracker *)self _updateMatchedLocation:v5];
  id v6 = [(MNLocationTracker *)self safeDelegate];
  [v6 locationTracker:self didUpdateMatchedLocation:v5];
}

- (void)_updateForAlternateRoutes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MNLocationTracker *)self state] != 2)
  {
    id v5 = [(MNLocationTracker *)self lastMatchedLocation];
    [v5 coordinate];
    id v6 = [(MNLocationTracker *)self navigationSession];
    double v7 = [v6 destination];

    uint64_t v8 = [v7 geoMapItem];
    [v8 centerCoordinate];
    GEOCalculateDistance();
    double v10 = v9;

    if (v10 < 1000.0)
    {

      id v4 = 0;
    }
  }
  id v11 = [(MNLocationTracker *)self navigationSession];
  id v12 = [v11 routeManager];
  double v13 = [v12 currentRouteInfo];

  if ([(MNAlternateRoutesUpdater *)self->_alternateRoutesUpdater setAlternateRoutes:v4 forMainRoute:v13])
  {
    double v14 = [(MNLocationTracker *)self safeDelegate];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etauPositions, 0);
  objc_storeStrong((id *)&self->_alternateRoutesUpdater, 0);
  objc_storeStrong((id *)&self->_tunnelLocationProjector, 0);
}

@end