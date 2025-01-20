@interface MSHistoryDirectionsItem
- (GEOAutomobileOptions)automobileOptions;
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (NSArray)waypoints;
- (id)routeInformationSource;
- (int64_t)transportType;
- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6;
@end

@implementation MSHistoryDirectionsItem

- (int64_t)transportType
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
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
  unsigned int v3 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  int64_t v4 = [v3 waypoints];
  if ([v4 count] == (id)2)
  {
    v5 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
    v6 = [v5 waypoints];
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return (GEOComposedWaypoint *)v7;
}

- (GEOComposedWaypoint)endWaypoint
{
  unsigned int v3 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  int64_t v4 = [v3 destinationRouteData];

  if (v4)
  {
    id v5 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v4];
    v6 = [v5 buildRoute];

    id v7 = [objc_alloc((Class)GEOComposedWaypointToRoute) initWithRoute:v6];
  }
  else
  {
    v6 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
    v8 = [v6 waypoints];
    id v7 = [v8 lastObject];
  }

  return (GEOComposedWaypoint *)v7;
}

- (NSArray)waypoints
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  unsigned int v3 = [v2 waypoints];

  return (NSArray *)v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  unsigned int v3 = [v2 automobileOptions];

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  unsigned int v3 = [v2 transitOptions];

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  unsigned int v3 = [v2 walkingOptions];

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  v2 = [(MSHistoryDirectionsItem *)self routeRequestStorage];
  unsigned int v3 = [v2 cyclingOptions];

  return (GEOCyclingOptions *)v3;
}

- (id)routeInformationSource
{
  v2 = [[HistoryEntryRecentRouteInfoSource alloc] initWithItem:self];

  return v2;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a4) {
    (*((void (**)(id, MSHistoryDirectionsItem *))a4 + 2))(a4, self);
  }
}

@end