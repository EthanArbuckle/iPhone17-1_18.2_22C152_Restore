@interface MSHistoryMultiPointRoute
- (GEOAutomobileOptions)automobileOptions;
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (NSArray)waypoints;
- (int64_t)transportType;
- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6;
@end

@implementation MSHistoryMultiPointRoute

- (int64_t)transportType
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 transportType] - 1;
  if (v3 > 5) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = qword_100F72778[v3];
  }

  return v4;
}

- (GEOComposedWaypoint)startWaypoint
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 waypoints];
  int64_t v4 = [v3 firstObject];

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)endWaypoint
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 waypoints];
  int64_t v4 = [v3 lastObject];

  return (GEOComposedWaypoint *)v4;
}

- (NSArray)waypoints
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 waypoints];

  return (NSArray *)v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 automobileOptions];

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 transitOptions];

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 walkingOptions];

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  v2 = [(MSHistoryMultiPointRoute *)self routeRequestStorage];
  unsigned int v3 = [v2 cyclingOptions];

  return (GEOCyclingOptions *)v3;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a4) {
    (*((void (**)(id, MSHistoryMultiPointRoute *))a4 + 2))(a4, self);
  }
}

@end