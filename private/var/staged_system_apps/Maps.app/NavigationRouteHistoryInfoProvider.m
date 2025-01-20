@interface NavigationRouteHistoryInfoProvider
- (GEORouteAttributes)routeAttributes;
- (HistoryEntryRecentsItem)historyEntryRoute;
- (MNNavigationService)navigationService;
- (NSData)archivedTripSharingState;
- (NSData)sessionState;
- (NSUUID)currentHistoryEntryRouteIdentifier;
- (NavigationRouteHistoryInfoProvider)initWithNavigationService:(id)a3;
- (id)_composedRoute;
- (id)auxiliaryTasksManager;
- (id)legacyRouteRepresentation;
- (id)originalWaypointRouteRepresentation;
- (id)routeId;
- (void)setNavigationService:(id)a3;
- (void)updateHistoryEntryRoute:(id)a3;
@end

@implementation NavigationRouteHistoryInfoProvider

- (NavigationRouteHistoryInfoProvider)initWithNavigationService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationRouteHistoryInfoProvider;
  v6 = [(NavigationRouteHistoryInfoProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationService, a3);
  }

  return v7;
}

- (id)_composedRoute
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self navigationService];
  v3 = [v2 route];

  return v3;
}

- (id)routeId
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self navigationService];
  v3 = [v2 routeId];

  return v3;
}

- (id)legacyRouteRepresentation
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self navigationService];
  v3 = [v2 legacyRouteRepresentation];

  return v3;
}

- (id)originalWaypointRouteRepresentation
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self navigationService];
  v3 = [v2 originalWaypointRouteRepresentation];

  return v3;
}

- (NSData)sessionState
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self _composedRoute];
  v3 = [v2 routeInitializerData];
  v4 = [v3 directionsResponse];
  id v5 = [v4 sessionState];

  return (NSData *)v5;
}

- (id)auxiliaryTasksManager
{
  v2 = +[UIApplication sharedMapsDelegate];
  v3 = [v2 appSessionController];
  v4 = [v3 currentlyNavigatingPlatformController];
  id v5 = [v4 auxiliaryTasksManager];

  return v5;
}

- (HistoryEntryRecentsItem)historyEntryRoute
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self auxiliaryTasksManager];
  v3 = [v2 routePlanningSessionRouteLoadedNotifier];
  v4 = [v3 currentRouteHistoryEntry];

  return (HistoryEntryRecentsItem *)v4;
}

- (void)updateHistoryEntryRoute:(id)a3
{
  id v4 = a3;
  id v6 = [(NavigationRouteHistoryInfoProvider *)self auxiliaryTasksManager];
  id v5 = [v6 routePlanningSessionRouteLoadedNotifier];
  [v5 setCurrentRouteHistoryEntry:v4];
}

- (NSUUID)currentHistoryEntryRouteIdentifier
{
  v2 = [(NavigationRouteHistoryInfoProvider *)self historyEntryRoute];
  v3 = [v2 historyEntry];
  id v4 = [v3 storageIdentifier];

  return (NSUUID *)v4;
}

- (GEORouteAttributes)routeAttributes
{
  v3 = [(MNNavigationService *)self->_navigationService lastLocation];
  if (v3)
  {
    id v4 = objc_alloc((Class)GEOLatLng);
    [v3 coordinate];
    double v6 = v5;
    [v3 coordinate];
    unint64_t v7 = [v4 initWithLatitude:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }
  v8 = [(MNNavigationService *)self->_navigationService currentRequest];
  objc_super v9 = [v8 waypointTypeds];
  v10 = [v9 lastObject];
  uint64_t v11 = [v10 locationForWaypoint];

  if (v7 && v11)
  {
    unint64_t v22 = v7;
    uint64_t v23 = v11;
    v12 = &v22;
    uint64_t v13 = 2;
LABEL_12:
    v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, v13, v21, v22, v23);
    goto LABEL_14;
  }
  if (v7 | v11)
  {
    if (v7) {
      uint64_t v14 = v7;
    }
    else {
      uint64_t v14 = v11;
    }
    uint64_t v21 = v14;
    v12 = (unint64_t *)&v21;
    uint64_t v13 = 1;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_14:
  id v16 = objc_alloc((Class)MNRouteAttributes);
  v17 = [(NavigationRouteHistoryInfoProvider *)self _composedRoute];
  v18 = [v17 routeAttributes];
  id v19 = [v16 initWithAttributes:v18 latLngs:v15];

  return (GEORouteAttributes *)v19;
}

- (NSData)archivedTripSharingState
{
  v2 = +[MSPSharedTripService sharedInstance];
  v3 = [v2 archivedSharingState];

  return (NSData *)v3;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end