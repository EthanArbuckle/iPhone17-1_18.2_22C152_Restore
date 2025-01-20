@interface MNRouteProximitySensor
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)closestStepOnRoute;
- (GEOLocation)closestPointOnRoute;
- (GEOLocation)location;
- (MNRouteProximitySensor)init;
- (MNRouteProximitySensor)initWithRoute:(id)a3;
- (double)courseOnRoute;
- (double)distanceFromDestination;
- (double)distanceFromOrigin;
- (double)distanceFromRoute;
- (double)proximityThreshold;
- (unint64_t)proximity;
- (void)_updateProximity;
- (void)_updateRouteMatch;
- (void)setProximityThreshold:(double)a3;
- (void)updateForLocation:(id)a3;
@end

@implementation MNRouteProximitySensor

- (MNRouteProximitySensor)init
{
  result = (MNRouteProximitySensor *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNRouteProximitySensor)initWithRoute:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRouteProximitySensor;
  v5 = [(MNRouteProximitySensor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_proximity = 0;
    v5->_proximityThreshold = 20.0;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F649E0]) initWithRoute:v4 auditToken:0];
    routeMatcher = v6->_routeMatcher;
    v6->_routeMatcher = (GEORouteMatcher *)v7;
  }
  return v6;
}

- (void)updateForLocation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_location, a3);
    [(MNRouteProximitySensor *)self _updateRouteMatch];
    [(MNRouteProximitySensor *)self _updateProximity];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"Location is nil"];
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      v9 = "-[MNRouteProximitySensor updateForLocation:]";
      __int16 v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteProximitySensor.m";
      __int16 v12 = 1024;
      int v13 = 62;
      __int16 v14 = 2080;
      v15 = "location";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)[(GEORouteMatch *)self->_routeMatch route];
}

- (GEOLocation)location
{
  return self->_location;
}

- (GEOLocation)closestPointOnRoute
{
  if (self->_location && self->_routeMatch)
  {
    v3 = [(MNRouteProximitySensor *)self route];
    [(GEOLocation *)self->_location coordinate];
    uint64_t v4 = objc_msgSend(v3, "closestPointOnRoute:");

    id v5 = [(MNRouteProximitySensor *)self route];
    [v5 pointAtRouteCoordinate:v4];
    double v7 = v6;
    double v9 = v8;

    __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithLatitude:v7 longitude:v9];
  }
  else
  {
    __int16 v10 = 0;
  }
  return (GEOLocation *)v10;
}

- (GEOComposedRouteStep)closestStepOnRoute
{
  return (GEOComposedRouteStep *)[(GEORouteMatch *)self->_routeMatch step];
}

- (double)courseOnRoute
{
  if (!self->_routeMatch) {
    return -1.79769313e308;
  }
  v3 = [(MNRouteProximitySensor *)self route];
  [(GEOLocation *)self->_location coordinate];
  uint64_t v4 = objc_msgSend(v3, "closestPointOnRoute:");

  id v5 = [(MNRouteProximitySensor *)self route];
  [v5 courseAtRouteCoordinateIndex:v4];
  double v7 = v6;

  return v7;
}

- (double)distanceFromOrigin
{
  if (!self->_routeMatch) {
    return -1.79769313e308;
  }
  location = self->_location;
  v3 = [(MNRouteProximitySensor *)self route];
  uint64_t v4 = [v3 origin];
  id v5 = location;
  double v6 = [v4 bestLatLng];
  double v7 = v6;
  if (v6)
  {
    [v6 coordinate];
    [(GEOLocation *)v5 coordinate];
    GEOCalculateDistance();
    double v9 = v8;
  }
  else
  {
    double v9 = -1.79769313e308;
  }

  return v9;
}

- (double)distanceFromRoute
{
  routeMatch = self->_routeMatch;
  if (!routeMatch) {
    return -1.79769313e308;
  }
  [(GEORouteMatch *)routeMatch distanceFromRoute];
  return result;
}

- (double)distanceFromDestination
{
  if (!self->_routeMatch) {
    return -1.79769313e308;
  }
  location = self->_location;
  v3 = [(MNRouteProximitySensor *)self route];
  uint64_t v4 = [v3 destination];
  id v5 = location;
  double v6 = [v4 bestLatLng];
  double v7 = v6;
  if (v6)
  {
    [v6 coordinate];
    [(GEOLocation *)v5 coordinate];
    GEOCalculateDistance();
    double v9 = v8;
  }
  else
  {
    double v9 = -1.79769313e308;
  }

  return v9;
}

- (double)proximityThreshold
{
  return self->_proximityThreshold;
}

- (void)setProximityThreshold:(double)a3
{
  self->_proximityThreshold = a3;
  [(MNRouteProximitySensor *)self _updateProximity];
}

- (void)_updateProximity
{
  unint64_t location = (unint64_t)self->_location;
  if (location)
  {
    unint64_t location = (unint64_t)self->_routeMatch;
    if (location)
    {
      [(MNRouteProximitySensor *)self distanceFromOrigin];
      if (v4 >= 0.0
        && ([(MNRouteProximitySensor *)self distanceFromOrigin], v5 <= self->_proximityThreshold))
      {
        unint64_t location = 2;
      }
      else
      {
        [(MNRouteProximitySensor *)self distanceFromDestination];
        if (v6 >= 0.0
          && ([(MNRouteProximitySensor *)self distanceFromDestination],
              v7 <= self->_proximityThreshold))
        {
          unint64_t location = 4;
        }
        else
        {
          [(MNRouteProximitySensor *)self distanceFromRoute];
          if (v8 >= 0.0
            && ([(MNRouteProximitySensor *)self distanceFromRoute], v9 <= self->_proximityThreshold))
          {
            unint64_t location = 3;
          }
          else
          {
            unint64_t location = 1;
          }
        }
      }
    }
  }
  self->_proximity = location;
}

- (void)_updateRouteMatch
{
  id v5 = (id)[(GEOLocation *)self->_location copy];
  [v5 setCourse:-1.0];
  v3 = [(GEORouteMatcher *)self->_routeMatcher matchToRouteWithLocation:v5];
  routeMatch = self->_routeMatch;
  self->_routeMatch = v3;
}

- (unint64_t)proximity
{
  return self->_proximity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end