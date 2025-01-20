@interface RoutePlanningDataCoordinator
- ($C79183323B9A0D5602617FF3BE5395AC)currentRouteDisplayedMapRect;
- (BOOL)canAddStop;
- (BOOL)disableNotReachableError;
- (BOOL)inACustomRouteRegion;
- (BOOL)isEnabled;
- (BOOL)isSuspended;
- (BOOL)updateTiming:(id)a3;
- (CyclePreferences)cyclePreferences;
- (DirectionItem)directionItemForCurrentSession;
- (DrivePreferences)drivePreferences;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOComposedRoute)currentRoute;
- (GEORouteDisplayHints)displayHints;
- (NSArray)automaticSharingContacts;
- (NSArray)waypointRequests;
- (NSDate)routesLastLoadedDate;
- (NSHashTable)observers;
- (NSHashTable)observersIfEnabled;
- (NSString)destinationName;
- (NSString)originName;
- (NSUUID)originalHistoryEntryIdentifier;
- (NavigationSession)navigationSession;
- (PlatformController)platformController;
- (RideBookingPlanningSession)rideBookingPlanningSession;
- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver;
- (RouteCollection)routeCollection;
- (RoutePlanningDataCoordinator)initWithPlatformController:(id)a3;
- (RoutePlanningDataCoordinatorPresentationDelegate)delegate;
- (RoutePlanningError)routePlanningError;
- (RoutePlanningSession)routePlanningSession;
- (RoutePlanningSession)stashedRoutePlanningSession;
- (RoutePlanningTiming)timing;
- (RoutePlanningWaypointRequest)destinationWaypointRequest;
- (RoutePlanningWaypointRequest)originWaypointRequest;
- (TransitPreferences)transitPreferences;
- (VGVirtualGarage)virtualGarage;
- (WalkPreferences)walkPreferences;
- (WaypointSet)resolvedWaypointSet;
- (int64_t)desiredTransportType;
- (int64_t)requestState;
- (int64_t)transportType;
- (void)RideBookingPlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)RideBookingPlanningSession:(id)a3 rideOptionStateDidChange:(id)a4;
- (void)_applicationWillEnterForeground;
- (void)_notifyDidUpdateAutomaticSharingContacts:(id)a3;
- (void)_notifyDidUpdateCurrentRouteDisplayedMapRect:(id)a3;
- (void)_notifyDidUpdateCyclePreferences:(id)a3;
- (void)_notifyDidUpdateDrivePreferences:(id)a3;
- (void)_notifyDidUpdateEnabled;
- (void)_notifyDidUpdateOriginDestinationNames;
- (void)_notifyDidUpdateOriginDestinationWaypointRequest;
- (void)_notifyDidUpdateRequestState:(int64_t)a3;
- (void)_notifyDidUpdateRouteCollection:(id)a3;
- (void)_notifyDidUpdateRoutes:(id)a3;
- (void)_notifyDidUpdateTiming;
- (void)_notifyDidUpdateTransitPreferences:(id)a3;
- (void)_notifyDidUpdateTransportType;
- (void)_notifyDidUpdateVirtualGarage;
- (void)_notifyDidUpdateWalkPreferences:(id)a3;
- (void)_notifyDidUpdateWaypointSet;
- (void)_notifyResultRouteCollectionChangeForCurrentTransportType;
- (void)_reloadUsingNewCyclePreferences:(id)a3;
- (void)_reloadUsingNewDrivePreferences:(id)a3;
- (void)_reloadUsingNewTransitPreferences:(id)a3;
- (void)_reloadUsingNewWalkPreferences:(id)a3;
- (void)_updateIsEnabled;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)refreshRidesharingOptionsIfVisible;
- (void)refreshVirtualGarage;
- (void)removeObserver:(id)a3;
- (void)resume;
- (void)routePlanningSession:(id)a3 didChangeRouteCreationRegion:(BOOL)a4;
- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateAutomaticSharingContacts:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setCurrentRouteDisplayedMapRect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredTransportType:(int64_t)a3;
- (void)setDisableNotReachableError:(BOOL)a3;
- (void)setNavigationSession:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRideBookingPlanningSession:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)setRoutesLastLoadedDate:(id)a3;
- (void)setStashedRoutePlanningSession:(id)a3;
- (void)setupDataForCurrentObservers;
- (void)setupDataForObserver:(id)a3;
- (void)startWithDirectionItem:(id)a3 traits:(id)a4 userInfo:(id)a5;
- (void)stop;
- (void)suspend;
- (void)updateCurrentRoute:(id)a3;
- (void)updateCurrentRouteDisplayedMapRect:(id)a3;
- (void)updateCurrentRouteIndex:(unint64_t)a3;
- (void)updateCyclePreferences:(id)a3;
- (void)updateDrivePreferences:(id)a3;
- (void)updateTransitPreferences:(id)a3;
- (void)updateTransportType:(int64_t)a3;
- (void)updateVirtualGarage:(id)a3;
- (void)updateWalkPreferences:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation RoutePlanningDataCoordinator

- (int64_t)transportType
{
  v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    id v5 = [v4 currentTransportType];

    return (int64_t)v5;
  }
  else
  {
    v7 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    BOOL v8 = v7 != 0;

    return 4 * v8;
  }
}

- (RoutePlanningDataCoordinator)initWithPlatformController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[RoutePlanningDataCoordinator initWithPlatformController:]";
      __int16 v34 = 2080;
      v35 = "RoutePlanningDataCoordinator.m";
      __int16 v36 = 1024;
      int v37 = 107;
      __int16 v38 = 2080;
      v39 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)RoutePlanningDataCoordinator;
  v6 = [(RoutePlanningDataCoordinator *)&v30 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    [(PlatformController *)v7->_platformController addObserver:v7];
    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    MKMapSize size = MKMapRectNull.size;
    v7->_currentRouteDisplayedMapRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapRectNull.origin;
    v7->_currentRouteDisplayedMapRect.MKMapSize size = ($D4775485B13497D55C4F339E01923D43)size;
    uint64_t v11 = +[RoutePlanningTiming leaveNowTiming];
    timing = v7->_timing;
    v7->_timing = (RoutePlanningTiming *)v11;

    v13 = +[NSUserDefaults standardUserDefaults];
    id v14 = [objc_alloc((Class)NSMutableArray) initWithArray:&off_1013AE640];
    [v14 addObjectsFromArray:&off_1013AE808];
    [v14 addObjectsFromArray:&off_1013AE898];
    [v14 addObjectsFromArray:&off_1013AD680];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          [v13 addObserver:v7 forKeyPath:*(void *)(*((void *)&v26 + 1) + 8 * i) options:0 context:off_1015F5210 v26];
        }
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v17);
    }

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v7 selector:"_applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    v21 = v7;
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (RideBookingPlanningSession)rideBookingPlanningSession
{
  return self->_rideBookingPlanningSession;
}

- (void)_applicationWillEnterForeground
{
  if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)4)
  {
    [(RoutePlanningDataCoordinator *)self refreshRidesharingOptionsIfVisible];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:&off_1013AE640];
  [v5 addObjectsFromArray:&off_1013AE808];
  [v5 addObjectsFromArray:&off_1013AE898];
  [v5 addObjectsFromArray:&off_1013AD680];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningDataCoordinator;
  [(RoutePlanningDataCoordinator *)&v11 dealloc];
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = 0;
  }
  id v12 = v11;
  [(RoutePlanningDataCoordinator *)self setRideBookingPlanningSession:v12];

  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v14 = v13;
  }
  else {
    long long v14 = 0;
  }
  id v15 = v14;

  [(RoutePlanningDataCoordinator *)self setRoutePlanningSession:v15];
  id v16 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  [(RoutePlanningDataCoordinator *)self setNavigationSession:v18];
  [(RoutePlanningDataCoordinator *)self setDesiredTransportType:0];
  if (!v16 || !self->_timing)
  {
    v19 = +[RoutePlanningTiming leaveNowTiming];
    timing = self->_timing;
    self->_timing = v19;
  }
  v21 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v21) {
    [(RoutePlanningDataCoordinator *)self setStashedRoutePlanningSession:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v22 = [v8 sessionStack];
      id v23 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v48;
        do
        {
          v25 = 0;
          do
          {
            if (*(void *)v48 != v24) {
              objc_enumerationMutation(v22);
            }
            long long v26 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v26 setShortcutIdentifier:0];
            }
            v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v23);
      }
    }
  }
  [(RoutePlanningDataCoordinator *)self _updateIsEnabled];
  long long v27 = [v8 chromeViewController];
  long long v28 = [v27 contexts];
  long long v29 = [v28 lastObject];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  v31 = [(RoutePlanningDataCoordinator *)self navigationSession];
  LODWORD(v27) = v31 != 0;

  if (((v27 | isKindOfClass) & 1) == 0)
  {
    v32 = [(RoutePlanningDataCoordinator *)self delegate];
    [v32 routePlanningDataCoordinator:self isEnabled:[self isEnabled]];

    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateOriginDestinationWaypointRequest];
    -[RoutePlanningDataCoordinator updateCurrentRouteDisplayedMapRect:](self, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
    v33 = [(RoutePlanningDataCoordinator *)self routeCollection];
    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRouteCollection:v33];
  }
  __int16 v34 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  BOOL v35 = v34 == 0;

  if (v35)
  {
    id v38 = +[VGVirtualGarageService sharedService];
    [v38 unregisterObserver:self];
  }
  else
  {
    id v36 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v37 = v36;
    }
    else {
      int v37 = 0;
    }
    id v38 = v37;

    if (v38)
    {
      id v39 = [v38 currentTransportType];
      v40 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
      BOOL v41 = v39 != [v40 currentTransportType];
    }
    else
    {
      BOOL v41 = 0;
    }
    objc_opt_class();
    if ((v41 | objc_opt_isKindOfClass()))
    {
      [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTransportType];
    }
    else if (v38)
    {
      [(RoutePlanningDataCoordinator *)self _notifyResultRouteCollectionChangeForCurrentTransportType];
    }
    objc_initWeak(&location, self);
    v42 = +[VGVirtualGarageService sharedService];
    [v42 registerObserver:self];

    v43 = +[VGVirtualGarageService sharedService];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100B8F254;
    v44[3] = &unk_1012E65A8;
    objc_copyWeak(&v45, &location);
    [v43 virtualGarageGetGarageWithReply:v44];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
}

- (void)setRoutePlanningSession:(id)a3
{
  id v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    id v7 = v5;
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
    id v5 = v7;
  }
}

- (void)setRideBookingPlanningSession:(id)a3
{
  id v5 = (RideBookingPlanningSession *)a3;
  rideBookingPlanningSession = self->_rideBookingPlanningSession;
  if (rideBookingPlanningSession != v5)
  {
    id v7 = v5;
    [(RideBookingPlanningSession *)rideBookingPlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_rideBookingPlanningSession, a3);
    [(RideBookingPlanningSession *)self->_rideBookingPlanningSession addObserver:self];
    id v5 = v7;
  }
}

- (void)setNavigationSession:(id)a3
{
  id v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    id v7 = v5;
    [(NavigationSession *)navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
    id v5 = v7;
  }
}

- (void)_updateIsEnabled
{
  v3 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(RoutePlanningDataCoordinator *)self navigationSession];
      if (v6)
      {
        id v7 = [(RoutePlanningDataCoordinator *)self navigationSession];
        BOOL v4 = [v7 sessionState] == 0;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
  }

  if (self->_enabled != v4)
  {
    self->_enabled = v4;
    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateEnabled];
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  [(RoutePlanningDataCoordinator *)self _updateIsEnabled];
  if (a4 == 1)
  {
    int64_t v6 = [(RoutePlanningDataCoordinator *)self requestState];
    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRequestState:v6];
  }
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8F774;
  v5[3] = &unk_10131A188;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B8F77C;
  v4[3] = &unk_1012EB010;
  [a4 withValue:v5 orError:v4];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  if ([(RoutePlanningDataCoordinator *)self transportType] == a5)
  {
    [(RoutePlanningDataCoordinator *)self _notifyResultRouteCollectionChangeForCurrentTransportType];
  }
}

- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8F84C;
  v5[3] = &unk_1012F0F88;
  v5[4] = self;
  [a5 withValue:v5 orError:&stru_10131A1A8];
}

- (void)routePlanningSession:(id)a3 didUpdateAutomaticSharingContacts:(id)a4
{
}

- (BOOL)inACustomRouteRegion
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 inACustomRouteRegion];

  return v3;
}

- (void)routePlanningSession:(id)a3 didChangeRouteCreationRegion:(BOOL)a4
{
  id v5 = [(RoutePlanningDataCoordinator *)self routeCollection];
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRouteCollection:v5];
}

- (void)RideBookingPlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8F9A8;
  v5[3] = &unk_10131A188;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B8F9B0;
  v4[3] = &unk_1012EB010;
  [a4 withValue:v5 orError:v4];
}

- (void)RideBookingPlanningSession:(id)a3 rideOptionStateDidChange:(id)a4
{
  id v5 = a4;
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRequestState:[(RoutePlanningDataCoordinator *)self requestState]];
  if (![v5 noRideOptionsAvailable]
    || ([v5 loadingAppStoreSuggestions] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int64_t v6 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v11 observedRoutePlanningData] & 0x400) != 0) {
            [v11 routePlanningDataCoordinator:self didUpdateRideBookingRideOptionState:v5];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015F5210 == a6)
  {
    id v13 = &_dispatch_main_q;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v20 = sub_100B8FCA0;
    v21 = &unk_1012E5D58;
    id v22 = v10;
    id v23 = self;
    id v14 = &_dispatch_main_q;
    long long v15 = v19;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    id v17 = dispatch_queue_get_label(0);
    if (label == v17 || label && v17 && !strcmp(label, v17))
    {
      v20((uint64_t)v15);
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)RoutePlanningDataCoordinator;
    [(RoutePlanningDataCoordinator *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if ([v5 observedRoutePlanningData])
  {
    BOOL v4 = [(RoutePlanningDataCoordinator *)self observers];
    [v4 addObject:v5];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningDataCoordinator *)self observers];
  [v5 removeObject:v4];
}

- (NSHashTable)observersIfEnabled
{
  if ([(RoutePlanningDataCoordinator *)self _shouldNotifyObservers])
  {
    unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self observers];
    id v4 = [v3 copy];
  }
  else
  {
    id v4 = 0;
  }

  return (NSHashTable *)v4;
}

- (void)setupDataForObserver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 observedRoutePlanningData];
  if (!v5) {
    goto LABEL_18;
  }
  int v6 = (int)v5;
  id v7 = [(RoutePlanningDataCoordinator *)self observers];
  unsigned __int8 v8 = [v7 containsObject:v4];

  if ((v8 & 1) == 0)
  {
    id v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315906;
      long long v27 = "-[RoutePlanningDataCoordinator setupDataForObserver:]";
      __int16 v28 = 2080;
      long long v29 = "RoutePlanningDataCoordinator.m";
      __int16 v30 = 1024;
      int v31 = 445;
      __int16 v32 = 2080;
      v33 = "[self.observers containsObject:observer]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v26, 0x26u);
    }

    if (sub_100BB36BC())
    {
      objc_super v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        int v26 = 138412290;
        long long v27 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  if (v6)
  {
    id v11 = [(RoutePlanningDataCoordinator *)self originWaypointRequest];
    id v12 = [(RoutePlanningDataCoordinator *)self destinationWaypointRequest];
    [v4 routePlanningDataCoordinator:self didUpdateOriginWaypointRequest:v11 destinationWaypointRequest:v12];

    if ((v6 & 0x10) == 0)
    {
LABEL_5:
      if ((v6 & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  [v4 routePlanningDataCoordinator:self didUpdateTransportType:[self transportType]];
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 routePlanningDataCoordinator:self didUpdateRequestState:[self requestState]];
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  id v13 = [(RoutePlanningDataCoordinator *)self routeCollection];
  [v4 routePlanningDataCoordinator:self didUpdateRouteCollection:v13];

  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  id v14 = [(RoutePlanningDataCoordinator *)self drivePreferences];
  [v4 routePlanningDataCoordinator:self didUpdateDrivePreferences:v14];

  if ((v6 & 0x10000) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  long long v15 = [(RoutePlanningDataCoordinator *)self walkPreferences];
  [v4 routePlanningDataCoordinator:self didUpdateWalkPreferences:v15];

  if ((v6 & 0x100) == 0)
  {
LABEL_10:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  id v16 = [(RoutePlanningDataCoordinator *)self transitPreferences];
  [v4 routePlanningDataCoordinator:self didUpdateTransitPreferences:v16];

  if ((v6 & 0x1000) == 0)
  {
LABEL_11:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  id v17 = [(RoutePlanningDataCoordinator *)self cyclePreferences];
  [v4 routePlanningDataCoordinator:self didUpdateCyclePreferences:v17];

  if ((v6 & 0x2000) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  id v18 = [(RoutePlanningDataCoordinator *)self virtualGarage];
  [v4 routePlanningDataCoordinator:self didUpdateVirtualGarage:v18];

  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  v19 = [(RoutePlanningDataCoordinator *)self resolvedWaypointSet];
  [v4 routePlanningDataCoordinator:self didUpdateResolvedWaypointSet:v19];

  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  v20 = [(RoutePlanningDataCoordinator *)self originName];
  v21 = [(RoutePlanningDataCoordinator *)self destinationName];
  [v4 routePlanningDataCoordinator:self didUpdateOriginName:v20 destinationName:v21];

  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_16;
    }
LABEL_31:
    id v22 = [(RoutePlanningDataCoordinator *)self timing];
    [v4 routePlanningDataCoordinator:self didUpdateTiming:v22];

    if ((v6 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_30:
  [(RoutePlanningDataCoordinator *)self currentRouteDisplayedMapRect];
  [v4 routePlanningDataCoordinator:self didUpdateCurrentRouteDisplayedMapRect:];
  if ((v6 & 0x4000) != 0) {
    goto LABEL_31;
  }
LABEL_16:
  if ((v6 & 0x20000) != 0)
  {
LABEL_17:
    uint64_t v9 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    id v10 = [v9 automaticSharingContacts];
    [v4 routePlanningDataCoordinator:self didUpdateAutomaticSharingContacts:v10];
  }
LABEL_18:
}

- (void)setupDataForCurrentObservers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self observers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(RoutePlanningDataCoordinator *)self setupDataForObserver:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (RouteCollection)routeCollection
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  id v4 = [v3 routeCollectionForTransportType:[self transportType]];

  return (RouteCollection *)v4;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 advisoriesInfo];

  return (GEOAdvisoriesInfo *)v3;
}

- (GEOComposedRoute)currentRoute
{
  v2 = [(RoutePlanningDataCoordinator *)self routeCollection];
  unsigned __int8 v3 = [v2 currentRoute];

  return (GEOComposedRoute *)v3;
}

- ($C79183323B9A0D5602617FF3BE5395AC)currentRouteDisplayedMapRect
{
  double x = self->_currentRouteDisplayedMapRect.origin.x;
  double y = self->_currentRouteDisplayedMapRect.origin.y;
  double width = self->_currentRouteDisplayedMapRect.size.width;
  double height = self->_currentRouteDisplayedMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (DrivePreferences)drivePreferences
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 drivePreferences];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [DrivePreferences alloc];
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v5 = [(DrivePreferences *)v6 initWithDefaults:v7];
  }

  return v5;
}

- (WalkPreferences)walkPreferences
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 walkPreferences];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [WalkPreferences alloc];
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v5 = [(WalkPreferences *)v6 initWithDefaults:v7];
  }

  return v5;
}

- (TransitPreferences)transitPreferences
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 transitPreferences];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [TransitPreferences alloc];
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v5 = [(WatchSyncedPreferences *)v6 initWithDefaults:v7];
  }

  return v5;
}

- (GEORouteDisplayHints)displayHints
{
  v2 = [(RoutePlanningDataCoordinator *)self currentRoute];
  unsigned __int8 v3 = [v2 displayHints];

  return (GEORouteDisplayHints *)v3;
}

- (CyclePreferences)cyclePreferences
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 cyclePreferences];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [CyclePreferences alloc];
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v5 = [(CyclePreferences *)v6 initWithDefaults:v7];
  }

  return v5;
}

- (int64_t)desiredTransportType
{
  int64_t result = [(RoutePlanningDataCoordinator *)self transportType];
  if (!result) {
    return self->_desiredTransportType;
  }
  return result;
}

- (int64_t)requestState
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
LABEL_5:
    uint64_t v6 = v4;
    id v7 = [v4 requestState];

    return (int64_t)v7;
  }
  id v5 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

  if (v5)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    goto LABEL_5;
  }
  return 0;
}

- (RoutePlanningError)routePlanningError
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  id v4 = [v3 resolvedWaypoints];
  id v5 = [v4 origin];
  uint64_t v6 = [v5 mapItemStorage];

  id v7 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  long long v8 = [v7 resolvedWaypoints];
  long long v9 = [v8 destination];
  long long v10 = [v9 mapItemStorage];

  long long v11 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v11)
  {
    id v12 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    uint64_t v13 = [v12 routeCollectionResultForTransportType:[self transportType]];
LABEL_5:
    id v14 = (void *)v13;

    goto LABEL_6;
  }
  id v14 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

  if (v14)
  {
    id v12 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    uint64_t v13 = [v12 rideOptionStateObserverResult];
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_1001043E0;
  int v31 = sub_100104A60;
  id v32 = 0;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100B90C3C;
  id v22 = &unk_10131A1F0;
  int v26 = &v27;
  id v23 = self;
  id v15 = v6;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  [v14 withValue:&stru_10131A1C8 orError:&v19];
  if (-[RoutePlanningDataCoordinator disableNotReachableError](self, "disableNotReachableError", v19, v20, v21, v22, v23)&& [(id)v28[5] errorCode] == (id)16)
  {
    [(id)v28[5] setErrorCode:1];
  }
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return (RoutePlanningError *)v17;
}

- (NSArray)waypointRequests
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    id v5 = [v4 configuration];
    uint64_t v6 = [v5 waypointRequests];
LABEL_5:

    goto LABEL_6;
  }
  id v7 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

  if (v7)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    id v5 = [v4 originRequest];
    v11[0] = v5;
    long long v8 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    long long v9 = [v8 destinationRequest];
    v11[1] = v9;
    uint64_t v6 = +[NSArray arrayWithObjects:v11 count:2];

    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_6:

  return (NSArray *)v6;
}

- (RoutePlanningWaypointRequest)originWaypointRequest
{
  v2 = [(RoutePlanningDataCoordinator *)self waypointRequests];
  unsigned __int8 v3 = [v2 firstObject];

  return (RoutePlanningWaypointRequest *)v3;
}

- (RoutePlanningWaypointRequest)destinationWaypointRequest
{
  v2 = [(RoutePlanningDataCoordinator *)self waypointRequests];
  unsigned __int8 v3 = [v2 lastObject];

  return (RoutePlanningWaypointRequest *)v3;
}

- (WaypointSet)resolvedWaypointSet
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  }
  else
  {
    id v5 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

    if (!v5) {
      goto LABEL_6;
    }
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
  }
  uint64_t v6 = v4;
  id v5 = [v4 resolvedWaypoints];

LABEL_6:

  return (WaypointSet *)v5;
}

- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver
{
  v2 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
  unsigned __int8 v3 = [v2 rideOptionStateObserver];

  return (RideBookingRideOptionStateObserverProxy *)v3;
}

- (NSString)originName
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  }
  else
  {
    id v5 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

    if (!v5) {
      goto LABEL_6;
    }
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
  }
  uint64_t v6 = v4;
  id v5 = [v4 originName];

LABEL_6:

  return (NSString *)v5;
}

- (NSString)destinationName
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  }
  else
  {
    id v5 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

    if (!v5) {
      goto LABEL_6;
    }
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
  }
  uint64_t v6 = v4;
  id v5 = [v4 destinationName];

LABEL_6:

  return (NSString *)v5;
}

- (void)updateCurrentRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningDataCoordinator *)self routeCollection];
  id v6 = [v5 indexOfRoute:v4];

  [(RoutePlanningDataCoordinator *)self updateCurrentRouteIndex:v6];
}

- (void)updateCurrentRouteIndex:(unint64_t)a3
{
  id v6 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (!v6)
  {
    uint64_t v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = NSStringFromSelector(a2);
      id v15 = +[NSString stringWithFormat:@"%@ should only be called when a RoutePlanningSession is active", v14];
      *(_DWORD *)buf = 136316162;
      id v23 = "-[RoutePlanningDataCoordinator updateCurrentRouteIndex:]";
      __int16 v24 = 2080;
      id v25 = "RoutePlanningDataCoordinator.m";
      __int16 v26 = 1024;
      int v27 = 665;
      __int16 v28 = 2080;
      uint64_t v29 = "self.routePlanningSession != nil";
      __int16 v30 = 2112;
      int v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v7 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v7)
  {
    long long v8 = [(RoutePlanningDataCoordinator *)self routeCollection];
    id v9 = [v8 count];

    if ((unint64_t)v9 <= a3)
    {
      id v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSString stringWithFormat:@"routeIndex (%lu) is not part of the current routeCollection", a3];
        *(_DWORD *)buf = 136316162;
        id v23 = "-[RoutePlanningDataCoordinator updateCurrentRouteIndex:]";
        __int16 v24 = 2080;
        id v25 = "RoutePlanningDataCoordinator.m";
        __int16 v26 = 1024;
        int v27 = 670;
        __int16 v28 = 2080;
        uint64_t v29 = "routeIndex < self.routeCollection.count";
        __int16 v30 = 2112;
        int v31 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        uint64_t v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          id v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    long long v10 = [(RoutePlanningDataCoordinator *)self routeCollection];
    id v11 = [v10 count];

    if ((unint64_t)v11 > a3)
    {
      id v12 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
      [v12 setSelectedRouteIndex:a3 forTransportType:[self transportType]];
    }
  }
}

- (void)updateCurrentRouteDisplayedMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  BOOL v8 = self->_currentRouteDisplayedMapRect.origin.x == a3.var0.var0
    && self->_currentRouteDisplayedMapRect.origin.y == a3.var0.var1;
  if (!v8
    || (self->_currentRouteDisplayedMapRect.size.width == a3.var1.var0
      ? (BOOL v9 = self->_currentRouteDisplayedMapRect.size.height == a3.var1.var1)
      : (BOOL v9 = 0),
        !v9))
  {
    -[RoutePlanningDataCoordinator setCurrentRouteDisplayedMapRect:](self, "setCurrentRouteDisplayedMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
    -[RoutePlanningDataCoordinator _notifyDidUpdateCurrentRouteDisplayedMapRect:](self, "_notifyDidUpdateCurrentRouteDisplayedMapRect:", v6, v5, var0, var1);
  }
}

- (void)updateTransportType:(int64_t)a3
{
  -[RoutePlanningDataCoordinator setDesiredTransportType:](self, "setDesiredTransportType:");
  BOOL v5 = sub_10008034C();
  if (a3 != 4 || v5) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = 1;
  }
  if (v7 != [(RoutePlanningDataCoordinator *)self transportType])
  {
    BOOL v8 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

    if (v8)
    {
      BOOL v9 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
      uint64_t v10 = [v9 waypointRequests];

      id v11 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
      id v12 = [v11 traits];
      id v13 = [v12 copyByIncrementingSessionCounters];

      id v14 = [(RoutePlanningDataCoordinator *)self platformController];
      id v15 = [v14 sessionStack];
      id v16 = sub_1000AC254(v15, &stru_10131A210);
      id v17 = [v16 lastObject];

      id v18 = [v17 configuration];
      id v19 = [v18 isResumingMultipointRoute];

      uint64_t v20 = [v17 configuration];
      v21 = [v20 resumeRouteHandle];

      id v22 = [v17 configuration];
      id v23 = [v22 persistentData];

      v55 = (void *)v10;
      __int16 v24 = [[RoutePlanningSessionConfiguration alloc] initWithWaypointRequests:v10 traits:v13 existingTiming:self->_timing isResumingMultipointRoute:v19 resumeRouteHandle:v21 persistentData:v23];
      if ([(RoutePlanningSessionConfiguration *)v24 hasTransportType:v7])
      {
        [(RoutePlanningSessionConfiguration *)v24 setInitialTransportType:v7];
      }
      else
      {
        BOOL v35 = sub_1005762E4();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v57 = "-[RoutePlanningDataCoordinator updateTransportType:]";
          __int16 v58 = 2080;
          v59 = "RoutePlanningDataCoordinator.m";
          __int16 v60 = 1024;
          int v61 = 716;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          id v36 = sub_1005762E4();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            int v37 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v57 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      id v38 = [[RoutePlanningSession alloc] initWithInitiator:1 configuration:v24];
      id v39 = [(RoutePlanningDataCoordinator *)self platformController];
      v40 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
      [v39 popIfCurrentSession:v40];

      BOOL v41 = [(RoutePlanningDataCoordinator *)self platformController];
      v42 = [v41 currentSession];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v44 = [(RoutePlanningDataCoordinator *)self platformController];
      id v45 = v44;
      if (isKindOfClass)
      {
        v46 = [v44 currentSession];

        long long v47 = [v46 shortcutIdentifier];
        [(RoutePlanningSession *)v38 setShortcutIdentifier:v47];
        long long v48 = [(RoutePlanningDataCoordinator *)self platformController];
        [v48 replaceCurrentSessionWithSession:v38];

        id v45 = v46;
      }
      else
      {
        [v44 pushSession:v38];
      }
    }
    else
    {
      id v25 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

      if (v25)
      {
        __int16 v26 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        int v27 = [v26 configuration];
        __int16 v28 = v27;
        if (v7 == 4)
        {

          uint64_t v29 = [v28 traits];
          id v30 = [v29 copyByIncrementingSessionCounters];

          int v31 = [RideBookingPlanningSession alloc];
          id v32 = [v28 waypointRequests];
          v33 = [(RideBookingPlanningSession *)v31 initWithInitiator:1 waypointRequests:v32 traits:v30];

          __int16 v34 = [(RoutePlanningDataCoordinator *)self platformController];
          [v34 pushSession:v33];
        }
        else
        {
          unsigned int v49 = [v27 hasTransportType:v7];

          long long v50 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
          __int16 v28 = v50;
          if (v49)
          {
            [v50 safelySetCurrentTransportType:v7];
          }
          else
          {
            v51 = [v50 configuration];
            int v52 = [v51 isNavigationTracePlayback];

            if (v52) {
              goto LABEL_27;
            }
            v53 = sub_1005762E4();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v57 = "-[RoutePlanningDataCoordinator updateTransportType:]";
              __int16 v58 = 2080;
              v59 = "RoutePlanningDataCoordinator.m";
              __int16 v60 = 1024;
              int v61 = 745;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
            }

            if (!sub_100BB36BC()) {
              goto LABEL_27;
            }
            __int16 v28 = sub_1005762E4();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v54 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              v57 = v54;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
        }
      }
    }
LABEL_27:
    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTransportType];
  }
}

- (BOOL)updateTiming:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_timing;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6
    && (unsigned __int8 v8 = [(id)v6 isEqual:v7],
        (id)v7,
        (id)v6,
        (v8 & 1) == 0))
  {
    uint64_t v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      timing = self->_timing;
      int v15 = 138412546;
      id v16 = timing;
      __int16 v17 = 2112;
      unint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Changing timing from %@ to %@", (uint8_t *)&v15, 0x16u);
    }

    objc_storeStrong((id *)&self->_timing, a3);
    id v12 = [(RoutePlanningDataCoordinator *)self drivePreferences];
    [(RoutePlanningDataCoordinator *)self _reloadUsingNewDrivePreferences:v12];

    id v13 = [(RoutePlanningDataCoordinator *)self transitPreferences];
    [(RoutePlanningDataCoordinator *)self _reloadUsingNewTransitPreferences:v13];

    [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTiming];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)updateDrivePreferences:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RoutePlanningDataCoordinator *)self drivePreferences];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      [v4 synchronize];
      unint64_t v7 = +[NSUserDefaults standardUserDefaults];
      +[MapsAnalyticStateProvider updateDriveOptionsInformation:v7];

      unsigned __int8 v8 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

      if (!v8)
      {
        BOOL v9 = [(RoutePlanningDataCoordinator *)self drivePreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateDrivePreferences:v9];
      }
    }
  }
  else
  {
    uint64_t v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      id v14 = "-[RoutePlanningDataCoordinator updateDrivePreferences:]";
      __int16 v15 = 2080;
      id v16 = "RoutePlanningDataCoordinator.m";
      __int16 v17 = 1024;
      int v18 = 770;
      __int16 v19 = 2080;
      uint64_t v20 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)updateWalkPreferences:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RoutePlanningDataCoordinator *)self walkPreferences];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      [v4 synchronize];
      unint64_t v7 = +[NSUserDefaults standardUserDefaults];
      +[MapsAnalyticStateProvider updateWalkOptionsInformation:v7];

      unsigned __int8 v8 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

      if (!v8)
      {
        BOOL v9 = [(RoutePlanningDataCoordinator *)self walkPreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateWalkPreferences:v9];
      }
    }
  }
  else
  {
    uint64_t v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      id v14 = "-[RoutePlanningDataCoordinator updateWalkPreferences:]";
      __int16 v15 = 2080;
      id v16 = "RoutePlanningDataCoordinator.m";
      __int16 v17 = 1024;
      int v18 = 784;
      __int16 v19 = 2080;
      uint64_t v20 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)_reloadUsingNewDrivePreferences:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __int16 v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      v21 = "-[RoutePlanningDataCoordinator _reloadUsingNewDrivePreferences:]";
      __int16 v22 = 2080;
      id v23 = "RoutePlanningDataCoordinator.m";
      __int16 v24 = 1024;
      int v25 = 798;
      __int16 v26 = 2080;
      int v27 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v20, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = +[NSThread callStackSymbols];
        int v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  id v5 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v5)
  {
    unsigned __int8 v6 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    unint64_t v7 = [v6 configuration];
    unsigned __int8 v8 = [v7 routeLoadingTaskFactory];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)1)
      {
        BOOL v9 = [v8 factoryByModifyingDrivePreferences:v4 timing:self->_timing];
        uint64_t v10 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        id v11 = [v10 configuration];
        id v12 = [v10 waypointRequestResults];
        int v13 = [v11 configurationByModifyingRouteLoadingTaskFactory:v9 andDedupingWaypointRequests:v12];

        [v13 setInitialTransportType:[self transportType]];
        [v13 setInitialRoutesBeingFetchedExternally:0];
        id v14 = [[RoutePlanningSession alloc] initWithInitiator:1 configuration:v13];
        __int16 v15 = [(RoutePlanningDataCoordinator *)self platformController];
        [v15 replaceCurrentSessionWithSession:v14];

        id v16 = [(RoutePlanningDataCoordinator *)self drivePreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateDrivePreferences:v16];
      }
      else
      {
        BOOL v9 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        [v9 purgeRouteCollectionForTransportType:1];
      }
    }
  }
}

- (void)_reloadUsingNewWalkPreferences:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __int16 v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      v21 = "-[RoutePlanningDataCoordinator _reloadUsingNewWalkPreferences:]";
      __int16 v22 = 2080;
      id v23 = "RoutePlanningDataCoordinator.m";
      __int16 v24 = 1024;
      int v25 = 825;
      __int16 v26 = 2080;
      int v27 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v20, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = +[NSThread callStackSymbols];
        int v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  id v5 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v5)
  {
    unsigned __int8 v6 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    unint64_t v7 = [v6 configuration];
    unsigned __int8 v8 = [v7 routeLoadingTaskFactory];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)2)
      {
        BOOL v9 = [v8 factoryByModifyingWalkPreferences:v4 timing:self->_timing];
        uint64_t v10 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        id v11 = [v10 configuration];
        id v12 = [v10 waypointRequestResults];
        int v13 = [v11 configurationByModifyingRouteLoadingTaskFactory:v9 andDedupingWaypointRequests:v12];

        [v13 setInitialTransportType:[self transportType]];
        [v13 setInitialRoutesBeingFetchedExternally:0];
        id v14 = [[RoutePlanningSession alloc] initWithInitiator:1 configuration:v13];
        __int16 v15 = [(RoutePlanningDataCoordinator *)self platformController];
        [v15 replaceCurrentSessionWithSession:v14];

        id v16 = [(RoutePlanningDataCoordinator *)self walkPreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateWalkPreferences:v16];
      }
      else
      {
        BOOL v9 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        [v9 purgeRouteCollectionForTransportType:2];
      }
    }
  }
}

- (void)updateTransitPreferences:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RoutePlanningDataCoordinator *)self transitPreferences];
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v9 = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)v9;
    if ((v7 & 1) == 0)
    {
      [v9 synchronize];
      unsigned __int8 v8 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

      unint64_t v6 = (unint64_t)v9;
      if (!v8)
      {
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTransitPreferences:v9];
        unint64_t v6 = (unint64_t)v9;
      }
    }
  }
}

- (void)updateVirtualGarage:(id)a3
{
  id v4 = (VGVirtualGarage *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  unint64_t v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        int v13 = "-[RoutePlanningDataCoordinator updateVirtualGarage:]";
        __int16 v14 = 2080;
        __int16 v15 = "RoutePlanningDataCoordinator.m";
        __int16 v16 = 1024;
        int v17 = 864;
        __int16 v18 = 2080;
        __int16 v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        id v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        uint64_t v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          int v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  virtualGarage = self->_virtualGarage;
  self->_virtualGarage = v4;

  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateVirtualGarage];
}

- (void)updateCyclePreferences:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(RoutePlanningDataCoordinator *)self cyclePreferences];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      [v4 synchronize];
      BOOL v7 = +[NSUserDefaults standardUserDefaults];
      +[MapsAnalyticStateProvider updateCycleOptionsInformation:v7];

      unsigned __int8 v8 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

      if (!v8)
      {
        id v9 = [(RoutePlanningDataCoordinator *)self cyclePreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateCyclePreferences:v9];
      }
    }
  }
  else
  {
    uint64_t v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      __int16 v14 = "-[RoutePlanningDataCoordinator updateCyclePreferences:]";
      __int16 v15 = 2080;
      __int16 v16 = "RoutePlanningDataCoordinator.m";
      __int16 v17 = 1024;
      int v18 = 871;
      __int16 v19 = 2080;
      __int16 v20 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        __int16 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)_reloadUsingNewCyclePreferences:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __int16 v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      v21 = "-[RoutePlanningDataCoordinator _reloadUsingNewCyclePreferences:]";
      __int16 v22 = 2080;
      id v23 = "RoutePlanningDataCoordinator.m";
      __int16 v24 = 1024;
      int v25 = 885;
      __int16 v26 = 2080;
      int v27 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v20, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = +[NSThread callStackSymbols];
        int v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  unint64_t v5 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v5)
  {
    unsigned __int8 v6 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    BOOL v7 = [v6 configuration];
    unsigned __int8 v8 = [v7 routeLoadingTaskFactory];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)5)
      {
        id v9 = [v8 factoryByModifyingCyclePreferences:v4 timing:self->_timing];
        uint64_t v10 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        id v11 = [v10 configuration];
        int v12 = [v10 waypointRequestResults];
        int v13 = [v11 configurationByModifyingRouteLoadingTaskFactory:v9 andDedupingWaypointRequests:v12];

        [v13 setInitialTransportType:[self transportType]];
        [v13 setInitialRoutesBeingFetchedExternally:0];
        __int16 v14 = [[RoutePlanningSession alloc] initWithInitiator:1 configuration:v13];
        __int16 v15 = [(RoutePlanningDataCoordinator *)self platformController];
        [v15 replaceCurrentSessionWithSession:v14];

        __int16 v16 = [(RoutePlanningDataCoordinator *)self cyclePreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateCyclePreferences:v16];
      }
      else
      {
        id v9 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        [v9 purgeRouteCollectionForTransportType:5];
      }
    }
  }
}

- (void)_reloadUsingNewTransitPreferences:(id)a3
{
  id v16 = a3;
  id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v4)
  {
    unint64_t v5 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    unsigned __int8 v6 = [v5 configuration];
    BOOL v7 = [v6 routeLoadingTaskFactory];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)3)
      {
        unsigned __int8 v8 = [v7 factoryByModifyingTransitPreferences:v16 timing:self->_timing];
        id v9 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        uint64_t v10 = [v9 configuration];
        id v11 = [v9 waypointRequestResults];
        int v12 = [v10 configurationByModifyingRouteLoadingTaskFactory:v8 andDedupingWaypointRequests:v11];

        [v12 setInitialTransportType:[self transportType]];
        [v12 setInitialRoutesBeingFetchedExternally:0];
        int v13 = [[RoutePlanningSession alloc] initWithInitiator:1 configuration:v12];
        __int16 v14 = [(RoutePlanningDataCoordinator *)self platformController];
        [v14 replaceCurrentSessionWithSession:v13];

        __int16 v15 = [(RoutePlanningDataCoordinator *)self transitPreferences];
        [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTransitPreferences:v15];
      }
      else
      {
        unsigned __int8 v8 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
        [v8 purgeRouteCollectionForTransportType:3];
      }
    }
  }
}

- (NSUUID)originalHistoryEntryIdentifier
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    unint64_t v5 = [v4 configuration];
    unsigned __int8 v6 = [v5 originalHistoryEntryIdentifier];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return (NSUUID *)v6;
}

- (NSArray)automaticSharingContacts
{
  v2 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  unsigned __int8 v3 = [v2 configuration];
  id v4 = [v3 automaticSharingContacts];
  unint64_t v5 = v4;
  if (!v4) {
    id v4 = &__NSArray0__struct;
  }
  unsigned __int8 v6 = v4;

  return v6;
}

- (void)startWithDirectionItem:(id)a3 traits:(id)a4 userInfo:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"DisableNotReachableErrorInRoutePlanning"];
  -[RoutePlanningDataCoordinator setDisableNotReachableError:](self, "setDisableNotReachableError:", [v10 BOOLValue]);

  if (v8)
  {
    id v11 = +[RoutePlanningTiming timingWithUserInfo:v8];
    int v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v19 timing];
    }
    __int16 v14 = v13;

    if (!v14) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __int16 v14 = [v19 timing];
  if (v14) {
LABEL_8:
  }
    objc_storeStrong((id *)&self->_timing, v14);
LABEL_9:
  __int16 v15 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  id v16 = [v15 waypointRequestResults];
  __int16 v17 = sub_100B0671C(v19, v9, v16, v8);

  int v18 = [(RoutePlanningDataCoordinator *)self platformController];
  [v18 replaceCurrentSessionWithSession:v17];
}

- (BOOL)canAddStop
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B934B8;
    v10[3] = &unk_10131A238;
    v10[4] = &v11;
    [v4 enumerateRequestsOrWaypointsUsingBlock:v10];

    int64_t v5 = [(RoutePlanningDataCoordinator *)self transportType];
    BOOL v6 = 0;
    switch(v5)
    {
      case 0:
        if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
          goto LABEL_7;
        }
        BOOL v6 = 1;
        break;
      case 1:
        int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
        goto LABEL_10;
      case 2:
LABEL_7:
        int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
        goto LABEL_10;
      case 5:
        int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_10:
        BOOL v6 = IsEnabled_DrivingMultiWaypointRoutes;
        break;
      default:
        break;
    }
    unint64_t UInteger = GEOConfigGetUInteger();
    if (v6)
    {
      if (UInteger) {
        LOBYTE(v6) = v12[3] < UInteger;
      }
      else {
        LOBYTE(v6) = 1;
      }
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (DirectionItem)directionItemForCurrentSession
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
    uint64_t v5 = +[DirectionItem directionItemWithRoutePlanningSession:v4];
  }
  else
  {
    BOOL v6 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    uint64_t v5 = +[DirectionItem directionItemWithRideBookingSession:v4];
  }
  BOOL v6 = (void *)v5;

LABEL_6:

  return (DirectionItem *)v6;
}

- (void)refreshRidesharingOptionsIfVisible
{
  if ((id)[(RoutePlanningDataCoordinator *)self transportType] == (id)4
    && sub_10008034C()
    && [(RoutePlanningDataCoordinator *)self isEnabled])
  {
    unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self rideBookingPlanningSession];
    if (!v3)
    {
      id v4 = sub_1005762E4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315906;
        id v8 = "-[RoutePlanningDataCoordinator refreshRidesharingOptionsIfVisible]";
        __int16 v9 = 2080;
        uint64_t v10 = "RoutePlanningDataCoordinator.m";
        __int16 v11 = 1024;
        int v12 = 1010;
        __int16 v13 = 2080;
        uint64_t v14 = "existingSession != nil";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v7, 0x26u);
      }

      if (sub_100BB36BC())
      {
        uint64_t v5 = sub_1005762E4();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          BOOL v6 = +[NSThread callStackSymbols];
          int v7 = 138412290;
          id v8 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
        }
      }
    }
    [v3 refresh];
  }
}

- (void)refreshVirtualGarage
{
  objc_initWeak(&location, self);
  unsigned __int8 v3 = +[VGVirtualGarageService sharedService];
  [v3 registerObserver:self];

  id v4 = +[VGVirtualGarageService sharedService];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B93854;
  v5[3] = &unk_1012E65A8;
  objc_copyWeak(&v6, &location);
  [v4 virtualGarageGetGarageWithReply:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)isSuspended
{
  unsigned __int8 v3 = [(RoutePlanningDataCoordinator *)self stashedRoutePlanningSession];
  if (v3)
  {
    id v4 = [(RoutePlanningDataCoordinator *)self stashedRoutePlanningSession];
    BOOL v5 = [v4 sessionState] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)suspend
{
  uint64_t v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(RoutePlanningDataCoordinator *)self isSuspended];

    if ((v5 & 1) == 0)
    {
      id v6 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
      [(RoutePlanningDataCoordinator *)self setStashedRoutePlanningSession:v6];

      id v8 = [(RoutePlanningDataCoordinator *)self platformController];
      int v7 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
      [v8 popIfCurrentSession:v7];
    }
  }
}

- (void)resume
{
  if ([(RoutePlanningDataCoordinator *)self isSuspended])
  {
    id v4 = [(RoutePlanningDataCoordinator *)self platformController];
    uint64_t v3 = [(RoutePlanningDataCoordinator *)self stashedRoutePlanningSession];
    [v4 replaceCurrentSessionWithSession:v3];
  }
}

- (void)stop
{
  uint64_t v3 = [(RoutePlanningDataCoordinator *)self routePlanningSession];
  if (v3
    || ([(RoutePlanningDataCoordinator *)self rideBookingPlanningSession],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(RoutePlanningDataCoordinator *)self platformController];
    unsigned __int8 v5 = [v4 currentSession];

    if (v5 != v3)
    {
      int v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315906;
        __int16 v11 = "-[RoutePlanningDataCoordinator stop]";
        __int16 v12 = 2080;
        __int16 v13 = "RoutePlanningDataCoordinator.m";
        __int16 v14 = 1024;
        int v15 = 1057;
        __int16 v16 = 2080;
        __int16 v17 = "self.platformController.currentSession == session";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v10, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          __int16 v9 = +[NSThread callStackSymbols];
          int v10 = 138412290;
          __int16 v11 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    id v6 = [(RoutePlanningDataCoordinator *)self platformController];
    [v6 clearIfCurrentSession:v3];
  }
}

- (void)_notifyDidUpdateEnabled
{
  BOOL v3 = [(RoutePlanningDataCoordinator *)self isEnabled];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(RoutePlanningDataCoordinator *)self observers];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x8000) != 0) {
          [v10 routePlanningDataCoordinator:self didEnable:v3];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateRouteCollection:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x40) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateRouteCollection:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateRoutes:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x800) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateRoutes:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateCurrentRouteDisplayedMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v13 observedRoutePlanningData] & 0x200) != 0) {
          [v13 routePlanningDataCoordinator:self didUpdateCurrentRouteDisplayedMapRect:v6, v5, var0, var1];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_notifyDidUpdateTransportType
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 observedRoutePlanningData] & 0x10) != 0) {
          [v8 routePlanningDataCoordinator:self didUpdateTransportType:[self desiredTransportType]];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(RoutePlanningDataCoordinator *)self _notifyResultRouteCollectionChangeForCurrentTransportType];
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateOriginDestinationNames];
}

- (void)_notifyDidUpdateDrivePreferences:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x80) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateDrivePreferences:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateWalkPreferences:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x10000) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateWalkPreferences:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateTransitPreferences:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x100) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateTransitPreferences:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateCyclePreferences:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x1000) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateCyclePreferences:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateVirtualGarage
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 observedRoutePlanningData] & 0x2000) != 0)
        {
          long long v9 = [(RoutePlanningDataCoordinator *)self virtualGarage];
          [v8 routePlanningDataCoordinator:self didUpdateVirtualGarage:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDidUpdateRequestState:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 observedRoutePlanningData] & 0x20) != 0) {
          [v10 routePlanningDataCoordinator:self didUpdateRequestState:a3];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateOriginDestinationWaypointRequest
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 observedRoutePlanningData])
        {
          long long v9 = [(RoutePlanningDataCoordinator *)self originWaypointRequest];
          long long v10 = [(RoutePlanningDataCoordinator *)self destinationWaypointRequest];
          [v8 routePlanningDataCoordinator:self didUpdateOriginWaypointRequest:v9 destinationWaypointRequest:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateOriginDestinationNames];
}

- (void)_notifyDidUpdateWaypointSet
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v8 observedRoutePlanningData] & 4) != 0)
        {
          long long v9 = [(RoutePlanningDataCoordinator *)self resolvedWaypointSet];
          [v8 routePlanningDataCoordinator:self didUpdateResolvedWaypointSet:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }

  long long v10 = [(RoutePlanningDataCoordinator *)self resolvedWaypointSet];
  long long v11 = [v10 origin];
  long long v12 = [v11 geoMapItem];
  long long v13 = [v12 timezone];

  long long v14 = [(RoutePlanningDataCoordinator *)self resolvedWaypointSet];
  long long v15 = [v14 destination];
  long long v16 = [v15 geoMapItem];
  long long v17 = [v16 timezone];

  int v18 = [(RoutePlanningTiming *)self->_timing arrivalDate];

  if (v18)
  {
    timing = [(RoutePlanningTiming *)self->_timing arrivalDate];
    int v20 = +[RoutePlanningTiming timingWithArrivalDate:timing departureTimeZone:v13 arrivalTimeZone:v17];
  }
  else
  {
    v21 = [(RoutePlanningTiming *)self->_timing departureDate];

    if (!v21)
    {
      id v23 = +[RoutePlanningTiming timingWithArrivalDate:0 departureTimeZone:v13 arrivalTimeZone:v17];
      timing = self->_timing;
      self->_timing = v23;
      goto LABEL_15;
    }
    timing = [(RoutePlanningTiming *)self->_timing departureDate];
    int v20 = +[RoutePlanningTiming timingWithDepartureDate:timing departureTimeZone:v13 arrivalTimeZone:v17];
  }
  __int16 v22 = self->_timing;
  self->_timing = v20;

LABEL_15:
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateTiming];
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateOriginDestinationNames];
}

- (void)_notifyDidUpdateTiming
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 observedRoutePlanningData] & 0x4000) != 0)
        {
          long long v9 = [(RoutePlanningDataCoordinator *)self timing];
          [v8 routePlanningDataCoordinator:self didUpdateTiming:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDidUpdateOriginDestinationNames
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 observedRoutePlanningData] & 8) != 0)
        {
          long long v10 = [(RoutePlanningDataCoordinator *)self originName];
          long long v11 = [(RoutePlanningDataCoordinator *)self destinationName];
          [v9 routePlanningDataCoordinator:self didUpdateOriginName:v10 destinationName:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_notifyResultRouteCollectionChangeForCurrentTransportType
{
  -[RoutePlanningDataCoordinator updateCurrentRouteDisplayedMapRect:](self, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
  BOOL v3 = [(RoutePlanningDataCoordinator *)self routeCollection];
  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRouteCollection:v3];

  int64_t v4 = [(RoutePlanningDataCoordinator *)self requestState];

  [(RoutePlanningDataCoordinator *)self _notifyDidUpdateRequestState:v4];
}

- (void)_notifyDidUpdateAutomaticSharingContacts:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(RoutePlanningDataCoordinator *)self observersIfEnabled];
  id v6 = [v5 copy];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v11 observedRoutePlanningData] & 0x20000) != 0) {
          [v11 routePlanningDataCoordinator:self didUpdateAutomaticSharingContacts:v4];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B95284;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (RoutePlanningDataCoordinatorPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningDataCoordinatorPresentationDelegate *)WeakRetained;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)stashedRoutePlanningSession
{
  return self->_stashedRoutePlanningSession;
}

- (void)setStashedRoutePlanningSession:(id)a3
{
}

- (void)setDesiredTransportType:(int64_t)a3
{
  self->_desiredTransportType = a3;
}

- (void)setCurrentRouteDisplayedMapRect:(id)a3
{
  self->_currentRouteDisplayedMapRect = ($AF866507483A7485D187EE11486BA295)a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSDate)routesLastLoadedDate
{
  return self->_routesLastLoadedDate;
}

- (void)setRoutesLastLoadedDate:(id)a3
{
}

- (BOOL)disableNotReachableError
{
  return self->_disableNotReachableError;
}

- (void)setDisableNotReachableError:(BOOL)a3
{
  self->_disableNotReachableError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesLastLoadedDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stashedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_rideBookingPlanningSession, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);

  objc_storeStrong((id *)&self->_timing, 0);
}

@end