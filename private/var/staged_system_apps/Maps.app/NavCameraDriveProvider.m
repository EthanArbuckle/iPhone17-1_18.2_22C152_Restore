@interface NavCameraDriveProvider
- (BOOL)isInNavigatingState;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (GEOComposedRoute)route;
- (MNLocation)lastLocation;
- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry;
- (NSArray)alternateRoutes;
- (NSDictionary)alternateRouteTraffics;
- (NavCameraDriveProvider)init;
- (NavCameraNavigationDelegate)delegate;
- (double)distanceUntilManeuver;
- (double)timeUntilManeuver;
- (id)_matchedLocationForLocation:(id)a3;
- (int)navigationState;
- (unint64_t)navigationDestination;
- (unint64_t)stepIndex;
- (void)_updateWithRoute:(id)a3;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRouteGeniusEntry:(id)a3;
@end

@implementation NavCameraDriveProvider

- (void)dealloc
{
  v3 = +[MKLocationManager sharedLocationManager];
  [v3 stopListeningForLocationUpdates:self];

  v4.receiver = self;
  v4.super_class = (Class)NavCameraDriveProvider;
  [(NavCameraDriveProvider *)&v4 dealloc];
}

- (NavCameraDriveProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)NavCameraDriveProvider;
  v2 = [(NavCameraDriveProvider *)&v7 init];
  if (v2)
  {
    v3 = (GEORoadMatcher *)[objc_alloc((Class)GEORoadMatcher) initWithAuditToken:0];
    roadMatcher = v2->_roadMatcher;
    v2->_roadMatcher = v3;

    [(GEORoadMatcher *)v2->_roadMatcher setSearchRadius:35.0];
    v5 = +[MKLocationManager sharedLocationManager];
    [v5 listenForLocationUpdates:v2];
  }
  return v2;
}

- (void)setRouteGeniusEntry:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, a3);
  id v5 = a3;
  v6 = [(NavCameraDriveProvider *)self delegate];
  [v6 navigationProvider:self didChangeNavigationDestination:[self navigationDestination]];

  id v7 = [v5 route];

  [(NavCameraDriveProvider *)self _updateWithRoute:v7];
}

- (void)_updateWithRoute:(id)a3
{
  p_route = &self->_route;
  id v11 = a3;
  if ((-[GEOComposedRoute _MapsCarPlay_isEqual:](*p_route, "_MapsCarPlay_isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_route, a3);
    if (self->_route)
    {
      v6 = (GEORouteMatcher *)[objc_alloc((Class)GEORouteMatcher) initWithRoute:*p_route auditToken:0];
    }
    else
    {
      previousRouteMatch = self->_previousRouteMatch;
      self->_previousRouteMatch = 0;

      v6 = 0;
    }
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v6;

    v9 = [(NavCameraDriveProvider *)self delegate];
    [v9 navigationProvider:self didChangeNavigationState:[self navigationState]];

    v10 = [(NavCameraDriveProvider *)self delegate];
    [v10 navigationProvider:self didUpdateRoute:self->_route traffic:0];
  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v4];
    routeMatcher = self->_routeMatcher;
    if (!routeMatcher
      || (-[GEORouteMatcher matchToRouteWithLocation:previousRouteMatch:](routeMatcher, "matchToRouteWithLocation:previousRouteMatch:", v5, self->_previousRouteMatch), id v7 = objc_claimAutoreleasedReturnValue(), objc_storeStrong((id *)&self->_previousRouteMatch, v7), !v7)|| (v8 = [objc_alloc((Class)MNLocation) initWithRouteMatch:v7 rawLocation:v4 locationMatchType:2], v7, !v8))
    {
      uint64_t v9 = [(GEORoadMatcher *)self->_roadMatcher matchLocation:v5 forTransportType:0];
      if (!v9
        || (v10 = (void *)v9,
            id v8 = [objc_alloc((Class)MNLocation) initWithRoadMatch:v9 rawLocation:v4 locationMatchType:0], v10, !v8))
      {
        id v8 = [objc_alloc((Class)MNLocation) initWithRawLocation:v4 locationMatchType:0];
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isInNavigatingState
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)stepIndex
{
  return 0;
}

- (int)navigationState
{
  v2 = [(NavCameraDriveProvider *)self route];
  int v3 = 2 * (v2 != 0);

  return v3;
}

- (unint64_t)navigationDestination
{
  v2 = [(NavCameraDriveProvider *)self routeGeniusEntry];
  unint64_t v3 = 2 * (v2 != 0);

  return v3;
}

- (MNLocation)lastLocation
{
  lastLocation = self->_lastLocation;
  if (!lastLocation)
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    id v5 = [v4 lastLocation];
    v6 = [(NavCameraDriveProvider *)self _matchedLocationForLocation:v5];
    id v7 = self->_lastLocation;
    self->_lastLocation = v6;

    lastLocation = self->_lastLocation;
  }

  return lastLocation;
}

- (double)distanceUntilManeuver
{
  return 0.0;
}

- (double)timeUntilManeuver
{
  return 0.0;
}

- (NSArray)alternateRoutes
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSDictionary)alternateRouteTraffics
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  if (self->_roadMatcher)
  {
    id v4 = [a3 lastLocation];
    if (v4)
    {
      id v7 = v4;
      id v5 = [(NavCameraDriveProvider *)self _matchedLocationForLocation:v4];
      if (v5)
      {
        v6 = [(NavCameraDriveProvider *)self delegate];
        [v6 navigationProvider:self didUpdateMatchedLocation:v5];
      }
      id v4 = v7;
    }
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return ![(NavCameraDriveProvider *)self isInNavigatingState];
}

- (NavCameraNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavCameraNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_previousRouteMatch, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);

  objc_storeStrong((id *)&self->_roadMatcher, 0);
}

@end