@interface GEOComposedRoute
- (id)nextWaypoint;
- (unint64_t)mapType;
@end

@implementation GEOComposedRoute

- (unint64_t)mapType
{
  if ([(GEOComposedRoute *)self transportType] == 1) {
    return 104;
  }
  else {
    return 0;
  }
}

- (id)nextWaypoint
{
  v3 = [(GEOComposedRoute *)self waypoints];
  id v4 = [v3 count];

  if ((unint64_t)v4 > 2)
  {
    v6 = [(GEOComposedRoute *)self waypoints];
    v5 = [v6 objectAtIndexedSubscript:1];
  }
  else
  {
    v5 = [(GEOComposedRoute *)self destination];
  }

  return v5;
}

@end