@interface RoutePlanningSession
+ (id)mostAppropriateNameForWaypointWithRequest:(id)a3 composedWaypoint:(id)a4;
- (BOOL)ignoreMapType;
- (BOOL)inACustomRouteRegion;
- (BOOL)isWaitingForAccurateLocationUpdate;
- (CyclePreferences)cyclePreferences;
- (DrivePreferences)drivePreferences;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOObserverHashTable)observers;
- (NSArray)automaticSharingContacts;
- (NSArray)waypointDisplayableMarkers;
- (NSDate)startDate;
- (NSDictionary)waypointRequestResults;
- (NSMutableDictionary)transportTypeToRouteCollectionResultsMap;
- (NSString)description;
- (NSString)destinationName;
- (NSString)originName;
- (NSString)shortcutIdentifier;
- (NavigationStateMonitoringTask)navigationStateMonitoringTask;
- (OS_dispatch_queue)isolationQueue;
- (OS_os_activity)activity;
- (PlatformController)platformController;
- (RAPGraphDirectionsRecorder)reportAProblemRecorder;
- (Result)currentRouteCollectionResult;
- (Result)resolvedWaypointsResult;
- (RouteCollection)currentRouteCollection;
- (RouteLoadingController)routeLoadingController;
- (RoutePlanningSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4;
- (RoutePlanningSessionConfiguration)configuration;
- (RoutePlanningTiming)timing;
- (SearchResult)destinationDisplayableMarker;
- (SearchResult)originDisplayableMarker;
- (TransitPreferences)transitPreferences;
- (WalkPreferences)walkPreferences;
- (WaypointController)waypointController;
- (WaypointControllerConfiguration)waypointConfiguration;
- (WaypointSet)resolvedWaypoints;
- (id)_favoriteWithIdentifier:(id)a3;
- (id)_searchResultFromWaypointRequest:(id)a3 resolvedWaypoint:(id)a4;
- (id)_shortcutWithIdentifier:(id)a3;
- (id)routeCollectionForTransportType:(int64_t)a3;
- (id)routeCollectionResultForTransportType:(int64_t)a3;
- (int64_t)currentTransportType;
- (int64_t)navigationTypeForCurrentRoute;
- (int64_t)requestState;
- (unint64_t)sessionInitiator;
- (unint64_t)sessionState;
- (void)_cancelFetchingCapabilitiesSharingContacts;
- (void)_handleReceivedWaypointSetResult;
- (void)_notifyObserversDidUpdateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4;
- (void)_refreshAutomaticSharingContactsFromShortcut;
- (void)_scheduleRefreshUserShortcuts;
- (void)_setAutomaticSharingContacts:(id)a3;
- (void)_setAutomaticSharingContacts:(id)a3 forShortcutIdentifier:(id)a4;
- (void)_setIsInACustomRouteRegion:(BOOL)a3;
- (void)_updateIsInACustomRouteRegionForRouteCollection:(id)a3;
- (void)_updateLoadingControllerForRealtimeUpdates;
- (void)addObserver:(id)a3;
- (void)cleanupStateReplay;
- (void)dealloc;
- (void)enumerateRequestsOrWaypointsUsingBlock:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)prepareToReplayCurrentState;
- (void)purgeRouteCollectionForTransportType:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)replayCurrentState;
- (void)requestUpdatedRouteWithRefreshedOrigin:(BOOL)a3;
- (void)resume;
- (void)routeLoadingController:(id)a3 didReceiveRoutesResult:(id)a4 forTransportType:(int64_t)a5 advisoryInfo:(id)a6;
- (void)routeLoadingController:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5;
- (void)safelySetCurrentTransportType:(int64_t)a3;
- (void)selectRoute:(id)a3;
- (void)setActivity:(id)a3;
- (void)setAutomaticSharingContacts:(id)a3;
- (void)setCurrentTransportType:(int64_t)a3;
- (void)setCurrentTransportType:(int64_t)a3 userInitiated:(BOOL)a4;
- (void)setIgnoreMapType:(BOOL)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setNavigationStateMonitoringTask:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRouteLoadingController:(id)a3;
- (void)setSelectedRouteIndex:(unint64_t)a3 forTransportType:(int64_t)a4;
- (void)setSessionState:(unint64_t)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTransportTypeToRouteCollectionResultsMap:(id)a3;
- (void)setWaypointController:(id)a3;
- (void)shortcutManagerMeCardDidChange:(id)a3;
- (void)suspend;
- (void)updateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4;
@end

@implementation RoutePlanningSession

- (void)selectRoute:(id)a3
{
  id v4 = a3;
  v5 = [(RoutePlanningSession *)self currentRouteCollection];
  v6 = [v5 routes];
  id v7 = [v6 indexOfObject:v4];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = sub_100015DB4();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      return;
    }
    v9 = self;
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_14;
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(RoutePlanningSession *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelection: Tried to select a route in routePlanning that wasn't in currentRouteCollection.", buf, 0xCu);

    goto LABEL_15;
  }

  [(RoutePlanningSession *)self setSelectedRouteIndex:v7 forTransportType:1];
}

- (DrivePreferences)drivePreferences
{
  v2 = [(RoutePlanningSession *)self configuration];
  v3 = [v2 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transportTypeInformation];
    v5 = [v4 requestInfoProviderForTransportType:1];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315906;
          v12 = "-[RoutePlanningSession(RouteRequestPreferences) drivePreferences]";
          __int16 v13 = 2080;
          v14 = "RoutePlanningSession+RouteRequestPreferences.m";
          __int16 v15 = 1024;
          int v16 = 33;
          __int16 v17 = 2080;
          v18 = "drivingInfoProvider == nil || [drivingInfoProvider isKindOfClass:DrivingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v9 = sub_1005762E4();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = +[NSThread callStackSymbols];
            int v11 = 138412290;
            v12 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 drivePreferences];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (DrivePreferences *)v6;
}

- (WalkPreferences)walkPreferences
{
  v2 = [(RoutePlanningSession *)self configuration];
  v3 = [v2 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transportTypeInformation];
    v5 = [v4 requestInfoProviderForTransportType:2];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315906;
          v12 = "-[RoutePlanningSession(RouteRequestPreferences) walkPreferences]";
          __int16 v13 = 2080;
          v14 = "RoutePlanningSession+RouteRequestPreferences.m";
          __int16 v15 = 1024;
          int v16 = 49;
          __int16 v17 = 2080;
          v18 = "walkingInfoProvider == nil || [walkingInfoProvider isKindOfClass:WalkingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v9 = sub_1005762E4();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = +[NSThread callStackSymbols];
            int v11 = 138412290;
            v12 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 walkPreferences];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (WalkPreferences *)v6;
}

- (TransitPreferences)transitPreferences
{
  v2 = [(RoutePlanningSession *)self configuration];
  v3 = [v2 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transportTypeInformation];
    v5 = [v4 requestInfoProviderForTransportType:3];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315906;
          v12 = "-[RoutePlanningSession(RouteRequestPreferences) transitPreferences]";
          __int16 v13 = 2080;
          v14 = "RoutePlanningSession+RouteRequestPreferences.m";
          __int16 v15 = 1024;
          int v16 = 65;
          __int16 v17 = 2080;
          v18 = "transitInfoProvider == nil || [transitInfoProvider isKindOfClass:TransitRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v9 = sub_1005762E4();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = +[NSThread callStackSymbols];
            int v11 = 138412290;
            v12 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 transitPreferences];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (TransitPreferences *)v6;
}

- (CyclePreferences)cyclePreferences
{
  v2 = [(RoutePlanningSession *)self configuration];
  v3 = [v2 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transportTypeInformation];
    v5 = [v4 requestInfoProviderForTransportType:5];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136315906;
          v12 = "-[RoutePlanningSession(RouteRequestPreferences) cyclePreferences]";
          __int16 v13 = 2080;
          v14 = "RoutePlanningSession+RouteRequestPreferences.m";
          __int16 v15 = 1024;
          int v16 = 82;
          __int16 v17 = 2080;
          v18 = "cyclingInfoProvider == nil || [cyclingInfoProvider isKindOfClass:CyclingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v9 = sub_1005762E4();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = +[NSThread callStackSymbols];
            int v11 = 138412290;
            v12 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 cyclePreferences];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (CyclePreferences *)v6;
}

- (RoutePlanningTiming)timing
{
  v2 = [(RoutePlanningSession *)self configuration];
  v3 = [v2 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transportTypeInformation];
    v5 = [v4 transportTypeInfoProviders];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = [v5 objectEnumerator];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          int v11 = [v10 timing];

          if (v11)
          {
            id v7 = [v10 timing];
            goto LABEL_13;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v7 = 0;
  }

  return (RoutePlanningTiming *)v7;
}

- (int64_t)requestState
{
  v3 = [(RoutePlanningSession *)self routeCollectionResultForTransportType:[(RoutePlanningSession *)self currentTransportType]];
  id v4 = v3;
  if (v3)
  {
    if ([v3 isSuccess]) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    v6 = [(RoutePlanningSession *)self resolvedWaypointsResult];
    if (v6)
    {
      id v7 = [(RoutePlanningSession *)self resolvedWaypointsResult];
      if ([v7 isSuccess]) {
        int64_t v5 = 1;
      }
      else {
        int64_t v5 = 3;
      }
    }
    else
    {
      int64_t v5 = 1;
    }
  }
  return v5;
}

- (SearchResult)originDisplayableMarker
{
  v3 = [(RoutePlanningSession *)self configuration];
  id v4 = [v3 originWaypointRequest];
  int64_t v5 = [(RoutePlanningSession *)self resolvedWaypoints];
  v6 = [v5 origin];
  id v7 = [(RoutePlanningSession *)self _searchResultFromWaypointRequest:v4 resolvedWaypoint:v6];

  return (SearchResult *)v7;
}

- (SearchResult)destinationDisplayableMarker
{
  v3 = [(RoutePlanningSession *)self configuration];
  id v4 = [v3 destinationWaypointRequest];
  int64_t v5 = [(RoutePlanningSession *)self resolvedWaypoints];
  v6 = [v5 destination];
  id v7 = [(RoutePlanningSession *)self _searchResultFromWaypointRequest:v4 resolvedWaypoint:v6];

  return (SearchResult *)v7;
}

- (NSArray)waypointDisplayableMarkers
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100C0C35C;
  v9 = &unk_10131B798;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  int v11 = self;
  id v3 = v10;
  [(RoutePlanningSession *)self enumerateRequestsOrWaypointsUsingBlock:&v6];
  id v4 = [v3 copy:v6, v7, v8, v9];

  return (NSArray *)v4;
}

- (id)_searchResultFromWaypointRequest:(id)a3 resolvedWaypoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [[SearchResult alloc] initWithComposedWaypoint:v6];
    goto LABEL_8;
  }
  uint64_t v8 = [v5 waypointPlaceholder];
  v9 = [v8 displayableMarker];

  if (v9)
  {
    id v10 = [v5 waypointPlaceholder];
    uint64_t v7 = [v10 displayableMarker];
LABEL_5:

    goto LABEL_8;
  }
  int v11 = [v5 waypointRequest];
  v12 = [v11 mapItemForLocationComparison];

  if (!v12)
  {
    id v10 = [v5 waypointRequest];
    [v10 coordinate];
    double v18 = v17;
    [v10 coordinate];
    if (fabs(v18 + 180.0) >= 0.00000000999999994 || fabs(v19 + 180.0) >= 0.00000000999999994)
    {
      id v20 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:[v10 isCurrentLocation] isUserLocation:v18, v19];
      id v21 = [objc_alloc((Class)GEOComposedWaypoint) initWithLocation:v20 isCurrentLocation:[v10 isCurrentLocation]];
      uint64_t v7 = [[SearchResult alloc] initWithComposedWaypoint:v21];
    }
    else
    {
      uint64_t v7 = 0;
    }
    goto LABEL_5;
  }
  long long v13 = [SearchResult alloc];
  long long v14 = [v5 waypointRequest];
  long long v15 = [v14 mapItemForLocationComparison];
  uint64_t v7 = [(SearchResult *)v13 initWithMapItem:v15];

LABEL_8:

  return v7;
}

- (RoutePlanningSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v47 = sub_1005762E4();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v58 = "-[RoutePlanningSession initWithInitiator:configuration:]";
      __int16 v59 = 2080;
      v60 = "RoutePlanningSession.m";
      __int16 v61 = 1024;
      *(_DWORD *)v62 = 94;
      *(_WORD *)&v62[4] = 2080;
      *(void *)&v62[6] = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v48 = sub_1005762E4();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v58 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)RoutePlanningSession;
  id v8 = [(RoutePlanningSession *)&v55 init];
  if (v8)
  {
    os_activity_t v9 = _os_activity_create((void *)&_mh_execute_header, "Route Planning Session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)v8 + 18);
    *((void *)v8 + 18) = v9;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*((os_activity_t *)v8 + 18), &state);
    int v11 = sub_1005768D4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      long long v14 = (void *)v13;
      if (a3 - 1 > 7) {
        CFStringRef v15 = @"Unknown";
      }
      else {
        CFStringRef v15 = off_101321EF0[a3 - 1];
      }
      *(_DWORD *)buf = 134349826;
      v58 = (const char *)v8;
      __int16 v59 = 2112;
      v60 = (const char *)v13;
      __int16 v61 = 2112;
      *(void *)v62 = v15;
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ is being initialized: initiator=%@ configuration=%@", buf, 0x2Au);
    }
    *((void *)v8 + 4) = a3;
    objc_storeStrong((id *)v8 + 7, a4);
    *((unsigned char *)v8 + 26) = [v7 ignoreMapType];
    if (v7) {
      id v16 = [v7 initialTransportType];
    }
    else {
      id v16 = 0;
    }
    *((void *)v8 + 11) = v16;
    id v17 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___RoutePlanningSessionObserver queue:0];
    double v18 = (void *)*((void *)v8 + 13);
    *((void *)v8 + 13) = v17;

    double v19 = +[NSBundle mainBundle];
    id v20 = [v19 bundleIdentifier];
    id v21 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v20, objc_opt_class(), v8];

    id v22 = v21;
    v23 = (const char *)[v22 UTF8String];
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
    v26 = (void *)*((void *)v8 + 16);
    *((void *)v8 + 16) = v25;

    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    v28 = (void *)*((void *)v8 + 17);
    *((void *)v8 + 17) = v27;

    v29 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v30 = [v7 waypointRequests];
    id v31 = [v30 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v51;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = [*(id *)(*((void *)&v50 + 1) + 8 * i) waypointRequest];
          [v29 addObject:v34];
        }
        id v31 = [v30 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v31);
    }

    v35 = [WaypointControllerConfiguration alloc];
    v36 = [v7 traits];
    v37 = [(WaypointControllerConfiguration *)v35 initWithRequests:v29 traits:v36];
    v38 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v37;

    v39 = [[WaypointController alloc] initWithConfiguration:*((void *)v8 + 6)];
    v40 = (void *)*((void *)v8 + 14);
    *((void *)v8 + 14) = v39;

    [*((id *)v8 + 14) setDelegate:v8];
    v41 = objc_alloc_init(RAPGraphDirectionsRecorder);
    v42 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v41;

    unint64_t v43 = *((void *)v8 + 11);
    if (v43 > 4 || ((1 << v43) & 0x19) == 0) {
      [*((id *)v8 + 8) startRecording];
    }
    v44 = [v7 shortcutIdentifier];
    [v8 setShortcutIdentifier:v44];

    id v45 = &_dispatch_main_q;
    _GEOConfigAddDelegateListenerForKey();

    os_activity_scope_leave(&state);
  }

  return (RoutePlanningSession *)v8;
}

- (void)dealloc
{
  [(GCDTimer *)self->_deferredShortcutsRefreshTimer invalidate];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v3 = +[MapsFavoritesManager sharedManager];
    [v3 unregisterObserver:self];
  }
  else
  {
    id v3 = +[ShortcutManager sharedManager];
    [v3 removeObserver:self];
  }

  GEOConfigRemoveDelegateListenerForAllKeys();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  id v4 = sub_1005768D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}p] Deallocating", buf, 0xCu);
  }

  os_activity_scope_leave(&state);
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningSession;
  [(RoutePlanningSession *)&v5 dealloc];
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  if ((id)[(RoutePlanningSession *)self currentTransportType] == (id)1) {
    id v3 = self->_advisoryInfo;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningSession;
  id v3 = [(RoutePlanningSession *)&v8 description];
  unint64_t v4 = [(RoutePlanningSession *)self sessionInitiator];
  if (v4 - 1 > 7) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = off_101321EF0[v4 - 1];
  }
  id v6 = +[NSString stringWithFormat:@"%@: initiator: %@", v3, v5];

  return (NSString *)v6;
}

- (NSString)originName
{
  id v3 = [(RoutePlanningSession *)self configuration];
  unint64_t v4 = [v3 originWaypointRequest];
  CFStringRef v5 = [(RoutePlanningSession *)self resolvedWaypoints];
  id v6 = [v5 origin];
  id v7 = [v4 nameWithResolvedWaypoint:v6 allowCurrentLocation:1];

  return (NSString *)v7;
}

- (NSString)destinationName
{
  id v3 = [(RoutePlanningSession *)self configuration];
  unint64_t v4 = [v3 waypointRequests];

  CFStringRef v5 = [(RoutePlanningSession *)self resolvedWaypoints];
  switch([(RoutePlanningSession *)self currentTransportType])
  {
    case 0:
      if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0 || (MapsFeature_IsEnabled_Maps420()) {
        goto LABEL_10;
      }
      goto LABEL_4;
    case 1:
      if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes()) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 2:
LABEL_4:
      if (MapsFeature_IsEnabled_Maps182()) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 5:
      if ((MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_10;
    default:
LABEL_9:
      if ((unint64_t)[v4 count] > 2)
      {
        id v6 = [v4 objectAtIndexedSubscript:1];
        id v7 = [v5 waypointAtIndex:1];
        os_activity_t v9 = [v6 nameWithResolvedWaypoint:v7 allowCurrentLocation:0];
      }
      else
      {
LABEL_10:
        id v6 = [(RoutePlanningSession *)self configuration];
        id v7 = [v6 destinationWaypointRequest];
        objc_super v8 = [v5 destination];
        os_activity_t v9 = [v7 nameWithResolvedWaypoint:v8 allowCurrentLocation:0];
      }
      return (NSString *)v9;
  }
}

- (void)setNavigationStateMonitoringTask:(id)a3
{
}

- (id)routeCollectionResultForTransportType:(int64_t)a3
{
  CFStringRef v5 = [(RoutePlanningSession *)self configuration];
  unsigned int v6 = [v5 hasTransportType:a3];

  if (v6)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    CFStringRef v15 = sub_100104550;
    id v16 = sub_100104B18;
    id v17 = 0;
    id v7 = [(RoutePlanningSession *)self resolvedWaypointsResult];
    v10[4] = &v12;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D0D9FC;
    v11[3] = &unk_101321D58;
    v11[4] = self;
    v11[5] = &v12;
    v11[6] = a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D0DB20;
    v10[3] = &unk_1012EAC00;
    [v7 withValue:v11 orError:v10];

    id v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)routeCollectionForTransportType:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100104550;
  int v11 = sub_100104B18;
  id v12 = 0;
  id v3 = [(RoutePlanningSession *)self routeCollectionResultForTransportType:a3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D0DC8C;
  v6[3] = &unk_1012EED18;
  v6[4] = &v7;
  [v3 withValue:v6 orError:&stru_101321D78];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)purgeRouteCollectionForTransportType:(int64_t)a3
{
  CFStringRef v5 = [(RoutePlanningSession *)self isolationQueue];
  label = dispatch_queue_get_label(v5);
  uint64_t v7 = dispatch_queue_get_label(0);
  if (label == v7)
  {

LABEL_7:
    uint64_t v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(RoutePlanningSession *)self isolationQueue];
      *(_DWORD *)buf = 136316162;
      CFStringRef v15 = "-[RoutePlanningSession purgeRouteCollectionForTransportType:]";
      __int16 v16 = 2080;
      id v17 = "RoutePlanningSession.m";
      __int16 v18 = 1024;
      int v19 = 215;
      __int16 v20 = 2080;
      id v21 = "self.isolationQueue";
      __int16 v22 = 2080;
      v23 = dispatch_queue_get_label(v10);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      CFStringRef v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v11 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        CFStringRef v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!label || !v7)
  {
LABEL_12:

    goto LABEL_13;
  }
  int v8 = strcmp(label, v7);

  if (!v8) {
    goto LABEL_7;
  }
LABEL_13:
  id v12 = [(RoutePlanningSession *)self isolationQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D0DECC;
  v13[3] = &unk_1012E69C0;
  v13[4] = self;
  v13[5] = a3;
  dispatch_sync(v12, v13);
}

- (NSDictionary)waypointRequestResults
{
  v2 = [(RoutePlanningSession *)self waypointController];
  id v3 = [v2 waypointRequestResults];

  return (NSDictionary *)v3;
}

- (Result)resolvedWaypointsResult
{
  v2 = [(RoutePlanningSession *)self waypointController];
  id v3 = [v2 resolvedWaypointSetResult];

  return (Result *)v3;
}

- (WaypointSet)resolvedWaypoints
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100104550;
  id v10 = sub_100104B18;
  id v11 = 0;
  v2 = [(RoutePlanningSession *)self resolvedWaypointsResult];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D0E0F0;
  v5[3] = &unk_1012F0A88;
  v5[4] = &v6;
  [v2 withValue:v5 orError:&stru_101321D98];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WaypointSet *)v3;
}

- (Result)currentRouteCollectionResult
{
  int64_t v3 = [(RoutePlanningSession *)self currentTransportType];

  return (Result *)[(RoutePlanningSession *)self routeCollectionResultForTransportType:v3];
}

- (RouteCollection)currentRouteCollection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100104550;
  id v10 = sub_100104B18;
  id v11 = 0;
  v2 = [(RoutePlanningSession *)self currentRouteCollectionResult];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D0E258;
  v5[3] = &unk_1012EED18;
  v5[4] = &v6;
  [v2 withValue:v5 orError:&stru_101321DB8];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RouteCollection *)v3;
}

- (int64_t)navigationTypeForCurrentRoute
{
  v2 = [(RoutePlanningSession *)self currentRouteCollection];
  id v3 = [v2 currentRoute];
  id v4 = [v3 suggestedNavigationModeForLocation:0 context:0];

  int64_t v5 = 4;
  if (v4 == (id)2) {
    int64_t v5 = 2;
  }
  if (v4 == (id)1) {
    return 3;
  }
  else {
    return v5;
  }
}

- (void)updateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4
{
  uint64_t v6 = (char *)a3;
  if (!v6)
  {
    id v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = (RoutePlanningSession *)"-[RoutePlanningSession updateRouteCollectionResult:forTransportType:]";
      __int16 v27 = 2080;
      v28 = "RoutePlanningSession.m";
      __int16 v29 = 1024;
      LODWORD(v30[0]) = 274;
      WORD2(v30[0]) = 2080;
      *(void *)((char *)v30 + 6) = "routeCollectionResult != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v26 = (RoutePlanningSession *)v19;
        __int16 v20 = (void *)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  unint64_t v7 = [(RoutePlanningSession *)self sessionInitiator];
  uint64_t v8 = sub_1005768D4();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 6)
  {
    if (v9)
    {
      if ((unint64_t)(a4 - 1) > 4) {
        CFStringRef v10 = @"Undefined";
      }
      else {
        CFStringRef v10 = off_101321F30[a4 - 1];
      }
      *(_DWORD *)buf = 134349314;
      v26 = self;
      __int16 v27 = 2112;
      v28 = (const char *)v10;
      id v12 = "[%{public}p] Updating route collection for transport type:(%@)";
      uint64_t v13 = v8;
      uint32_t v14 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else if (v9)
  {
    if ((unint64_t)(a4 - 1) > 4) {
      CFStringRef v11 = @"Undefined";
    }
    else {
      CFStringRef v11 = off_101321F30[a4 - 1];
    }
    *(_DWORD *)buf = 134349571;
    v26 = self;
    __int16 v27 = 2113;
    v28 = v6;
    __int16 v29 = 2112;
    v30[0] = v11;
    id v12 = "[%{public}p] Updating route collection result:(%{private}@) for transport type:(%@)";
    uint64_t v13 = v8;
    uint32_t v14 = 32;
    goto LABEL_13;
  }

  CFStringRef v15 = [(RoutePlanningSession *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D0E610;
  block[3] = &unk_1012EA9E0;
  __int16 v22 = v6;
  int64_t v23 = a4;
  block[4] = self;
  __int16 v16 = v6;
  dispatch_async(v15, block);

  os_activity_scope_leave(&state);
}

- (void)_notifyObserversDidUpdateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D0E758;
  block[3] = &unk_1012EA9E0;
  block[4] = self;
  id v7 = a3;
  int64_t v8 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)safelySetCurrentTransportType:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  uint64_t v6 = dispatch_queue_get_label(0);
  if (label == v6 || (label ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1), !v7 && !strcmp(label, v6)))
  {
    BOOL v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v10 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
      *(_DWORD *)buf = 136316162;
      CFStringRef v15 = "-[RoutePlanningSession safelySetCurrentTransportType:]";
      __int16 v16 = 2080;
      id v17 = "RoutePlanningSession.m";
      __int16 v18 = 1024;
      int v19 = 304;
      __int16 v20 = 2080;
      id v21 = "_isolationQueue";
      __int16 v22 = 2080;
      int64_t v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);
    }

    if (sub_100BB36BC())
    {
      CFStringRef v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        CFStringRef v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  int64_t v8 = [(RoutePlanningSession *)self isolationQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D0E9E4;
  v13[3] = &unk_1012E69C0;
  v13[4] = self;
  v13[5] = a3;
  dispatch_sync(v8, v13);
}

- (void)setCurrentTransportType:(int64_t)a3
{
}

- (void)setCurrentTransportType:(int64_t)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  int64_t v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v40 = sub_1005762E4();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
        v42 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v56 = (RoutePlanningSession *)"-[RoutePlanningSession setCurrentTransportType:userInitiated:]";
        __int16 v57 = 2080;
        v58 = "RoutePlanningSession.m";
        __int16 v59 = 1024;
        *(_DWORD *)v60 = 318;
        *(_WORD *)&v60[4] = 2080;
        *(void *)&v60[6] = "_isolationQueue";
        __int16 v61 = 2080;
        v62 = v41;
        __int16 v63 = 2080;
        v64 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }

      if (sub_100BB36BC())
      {
        unint64_t v43 = sub_1005762E4();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v56 = (RoutePlanningSession *)v44;
          id v45 = (void *)v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  CFStringRef v10 = sub_1005768D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = self->_currentTransportType - 1;
    if (v11 > 4) {
      CFStringRef v12 = @"Undefined";
    }
    else {
      CFStringRef v12 = off_101321F30[v11];
    }
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v13 = @"Undefined";
    }
    else {
      CFStringRef v13 = off_101321F30[a3 - 1];
    }
    *(_DWORD *)buf = 134349826;
    v56 = self;
    __int16 v57 = 2112;
    v58 = (const char *)v12;
    __int16 v59 = 2112;
    *(void *)v60 = v13;
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}p] changing transport type from %@ to %@, userInitiated:%d", buf, 0x26u);
  }

  uint32_t v14 = [(RoutePlanningSession *)self configuration];
  unsigned __int8 v15 = [v14 hasTransportType:a3];

  if ((v15 & 1) == 0)
  {
    v46 = sub_1005762E4();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v56 = (RoutePlanningSession *)"-[RoutePlanningSession setCurrentTransportType:userInitiated:]";
      __int16 v57 = 2080;
      v58 = "RoutePlanningSession.m";
      __int16 v59 = 1024;
      *(_DWORD *)v60 = 321;
      *(_WORD *)&v60[4] = 2080;
      *(void *)&v60[6] = "[self.configuration hasTransportType:newTransportType]";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v47 = sub_1005762E4();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v56 = (RoutePlanningSession *)v48;
        v49 = (void *)v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  unint64_t currentTransportType = self->_currentTransportType;
  if (currentTransportType != a3)
  {
    if (currentTransportType > 4 || ((1 << currentTransportType) & 0x19) == 0)
    {
      __int16 v18 = self->_reportAProblemRecorder;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100D0F244;
      block[3] = &unk_1012E5D08;
      long long v53 = v18;
      int v19 = v18;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    __int16 v20 = objc_alloc_init(RAPGraphDirectionsRecorder);
    reportAProblemRecorder = self->_reportAProblemRecorder;
    self->_reportAProblemRecorder = v20;

    if ((unint64_t)a3 > 4 || ((1 << a3) & 0x19) == 0) {
      [(RAPGraphDirectionsRecorder *)self->_reportAProblemRecorder startRecording];
    }
    if (v4)
    {
      __int16 v22 = +[GEOCompanionRouteContext context];
      int64_t v23 = [(RoutePlanningSession *)self configuration];
      [v23 setCompanionContext:v22];
    }
    self->_unint64_t currentTransportType = a3;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100D0F24C;
    v50[3] = &unk_1012E6300;
    v50[4] = self;
    BOOL v51 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v50);
    v24 = [(RoutePlanningSession *)self transportTypeToRouteCollectionResultsMap];
    dispatch_queue_t v25 = +[NSNumber numberWithInteger:self->_currentTransportType];
    v26 = [v24 objectForKeyedSubscript:v25];

    if (v26)
    {
      if ([v26 isSuccess])
      {
LABEL_40:
        [(RoutePlanningSession *)self _updateLoadingControllerForRealtimeUpdates];

        goto LABEL_41;
      }
      __int16 v27 = sub_1005768D4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v56 = self;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch routes for this transport type failed; trying again",
          buf,
          0xCu);
      }

      v28 = [(RoutePlanningSession *)self transportTypeToRouteCollectionResultsMap];
      __int16 v29 = +[NSNumber numberWithInteger:self->_currentTransportType];
      [v28 removeObjectForKey:v29];

      v30 = [(RoutePlanningSession *)self routeLoadingController];
      [v30 refreshRoutesForTransportType:[(RoutePlanningSession *)self currentTransportType]];
LABEL_39:

      goto LABEL_40;
    }
    id v31 = [(RoutePlanningSession *)self configuration];
    if ([v31 areInitialRoutesBeingFetchedExternally])
    {
      uint64_t v32 = [(RoutePlanningSession *)self resolvedWaypointsResult];
      BOOL v33 = v32 == 0;

      if (v33)
      {
        v30 = [(RoutePlanningSession *)self configuration];
        [v30 setInitialRoutesBeingFetchedExternally:0];
        goto LABEL_39;
      }
    }
    else
    {
    }
    v34 = [(RoutePlanningSession *)self resolvedWaypoints];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      v36 = [(RoutePlanningSession *)self resolvedWaypointsResult];
      if (v36
        && ([(RoutePlanningSession *)self resolvedWaypointsResult],
            v37 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v38 = [v37 isSuccess],
            v37,
            v36,
            (v38 & 1) == 0))
      {
        v39 = sub_1005768D4();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch waypoints failed; trying again",
            buf,
            0xCu);
        }

        v30 = [(RoutePlanningSession *)self waypointController];
        [v30 refresh];
      }
      else
      {
        v30 = sub_1005768D4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch waypoints is still in progress; waiting for it to finish",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      v30 = [(RoutePlanningSession *)self routeLoadingController];
      [v30 refreshRoutesForTransportType:[(RoutePlanningSession *)self currentTransportType]];
    }
    goto LABEL_39;
  }
  id v17 = sub_1005768D4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v56 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] No difference detected in transport type; ignoring request",
      buf,
      0xCu);
  }

LABEL_41:
  os_activity_scope_leave(&state);
}

- (void)setSelectedRouteIndex:(unint64_t)a3 forTransportType:(int64_t)a4
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  BOOL v7 = sub_1005768D4();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  BOOL v9 = sub_1005768D4();
  CFStringRef v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SetSelectedRoute", "", buf, 2u);
  }

  unint64_t v11 = sub_1005768D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) > 4) {
      CFStringRef v12 = @"Undefined";
    }
    else {
      CFStringRef v12 = off_101321F30[a4 - 1];
    }
    *(_DWORD *)buf = 134349570;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    objc_super v55 = (uint64_t (*)(uint64_t, uint64_t))v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}p] set selected routeIndex=%ld for transport type=%@", buf, 0x20u);
  }

  CFStringRef v13 = [(RoutePlanningSession *)self routeCollectionResultForTransportType:a4];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  objc_super v55 = sub_100104550;
  v56 = sub_100104B18;
  id v57 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100D0F94C;
  v44[3] = &unk_1012EED18;
  v44[4] = buf;
  [v13 withValue:v44 orError:&stru_101321DD8];
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    __int16 v27 = sub_1005762E4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v46 = 136315906;
      v47 = "-[RoutePlanningSession setSelectedRouteIndex:forTransportType:]";
      __int16 v48 = 2080;
      v49 = "RoutePlanningSession.m";
      __int16 v50 = 1024;
      int v51 = 393;
      __int16 v52 = 2080;
      long long v53 = "routeCollection != nil";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", v46, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = +[NSThread callStackSymbols];
        *(_DWORD *)v46 = 138412290;
        v47 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", v46, 0xCu);
      }
    }
  }
  if ((unint64_t)[*(id *)(*(void *)&buf[8] + 40) count] <= a3)
  {
    v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v46 = 136315906;
      v47 = "-[RoutePlanningSession setSelectedRouteIndex:forTransportType:]";
      __int16 v48 = 2080;
      v49 = "RoutePlanningSession.m";
      __int16 v50 = 1024;
      int v51 = 394;
      __int16 v52 = 2080;
      long long v53 = "newIndex < routeCollection.count";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", v46, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v31 = sub_1005762E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = +[NSThread callStackSymbols];
        *(_DWORD *)v46 = 138412290;
        v47 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", v46, 0xCu);
      }
    }
  }
  uint32_t v14 = *(void **)(*(void *)&buf[8] + 40);
  if (v14
    && (unint64_t)[v14 count] > a3
    && [*(id *)(*(void *)&buf[8] + 40) currentRouteIndex] != (id)a3)
  {
    unsigned __int8 v15 = [*(id *)(*(void *)&buf[8] + 40) routeCollectionByChangingCurrentRouteIndex:a3];
    __int16 v16 = +[Result resultWithValue:v15];
    id v17 = [(RoutePlanningSession *)self isolationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D0F960;
    block[3] = &unk_1012EA9E0;
    void block[4] = self;
    int64_t v43 = a4;
    id v18 = v16;
    id v42 = v18;
    dispatch_sync(v17, block);

    id v19 = &_dispatch_main_q;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v34 = sub_100D0F9D8;
    BOOL v35 = &unk_101300858;
    v36 = self;
    id v20 = v15;
    id v37 = v20;
    id v21 = v18;
    id v38 = v21;
    int64_t v39 = a4;
    os_signpost_id_t v40 = v8;
    id v22 = &_dispatch_main_q;
    int64_t v23 = v33;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    dispatch_queue_t v25 = dispatch_queue_get_label(0);
    if (label == v25 || label && v25 && !strcmp(label, v25))
    {
      v34((uint64_t)v23);
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
    }
  }
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
}

- (void)requestUpdatedRouteWithRefreshedOrigin:(BOOL)a3
{
  if (a3)
  {
    id v13 = [(RoutePlanningSession *)self waypointController];
    [v13 refreshDynamicOrigin];
  }
  else
  {
    BOOL v4 = [(RoutePlanningSession *)self resolvedWaypoints];

    if (v4)
    {
      label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      uint64_t v6 = dispatch_queue_get_label(0);
      if (label != v6 && (!label || !v6 || strcmp(label, v6)))
      {
        CFStringRef v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          __int16 v16 = "-[RoutePlanningSession requestUpdatedRouteWithRefreshedOrigin:]";
          __int16 v17 = 2080;
          id v18 = "RoutePlanningSession.m";
          __int16 v19 = 1024;
          int v20 = 422;
          __int16 v21 = 2080;
          id v22 = "dispatch_get_main_queue()";
          __int16 v23 = 2080;
          v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
          __int16 v25 = 2080;
          v26 = dispatch_queue_get_label(0);
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
            buf,
            0x3Au);
        }
        if (sub_100BB36BC())
        {
          unint64_t v11 = sub_1005762E4();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v12 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            __int16 v16 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      BOOL v7 = [(RoutePlanningSession *)self isolationQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100D0FD78;
      block[3] = &unk_1012E5D08;
      void block[4] = self;
      dispatch_sync(v7, block);

      [(RoutePlanningSession *)self _updateIsInACustomRouteRegionForRouteCollection:0];
      os_signpost_id_t v8 = [(RoutePlanningSession *)self observers];
      [v8 routePlanningSession:self didUpdateRouteCollectionResult:0 forTransportType:[self currentTransportType]];

      BOOL v9 = [(RoutePlanningSession *)self waypointController];
      [v9 rebroadcastWaypoints];
    }
  }
}

- (void)_updateLoadingControllerForRealtimeUpdates
{
  if ((id)[(RoutePlanningSession *)self sessionState] == (id)1)
  {
    int64_t v3 = [(RoutePlanningSession *)self currentTransportType];
    BOOL v4 = [(RoutePlanningSession *)self routeLoadingController];
    id v6 = v4;
    int64_t v5 = v3;
  }
  else
  {
    BOOL v4 = [(RoutePlanningSession *)self routeLoadingController];
    id v6 = v4;
    int64_t v5 = 0;
  }
  [v4 setTransportTypeForRealtimeUpdates:v5];
}

- (void)_updateIsInACustomRouteRegionForRouteCollection:(id)a3
{
  id v3 = a3;
  uint64_t BOOL = GEOConfigGetBOOL();
  int64_t v5 = [v3 currentRoute];
  if (v5) {
    int v6 = BOOL;
  }
  else {
    int v6 = 0;
  }
  if (v6 == 1)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 1;
    BOOL v7 = dispatch_group_create();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    os_signpost_id_t v8 = [v5 waypoints];
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          CFStringRef v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          dispatch_group_enter(v7);
          id v13 = [v12 location];
          id v14 = &_dispatch_main_q;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100D10144;
          v21[3] = &unk_101321E00;
          __int16 v23 = v28;
          id v22 = v7;
          +[GEODirectionsService customRouteCreationSupportedForLocation:v13 queue:&_dispatch_main_q handler:v21];
        }
        id v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v9);
    }

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D1015C;
    block[3] = &unk_101321E28;
    objc_copyWeak(&v19, &location);
    id v17 = v3;
    id v18 = v28;
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    [(RoutePlanningSession *)self _setIsInACustomRouteRegion:BOOL];
  }
}

- (void)_setIsInACustomRouteRegion:(BOOL)a3
{
  if (self->_inACustomRouteRegion != a3)
  {
    BOOL v3 = a3;
    int64_t v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL inACustomRouteRegion = self->_inACustomRouteRegion;
      int v8 = 134349568;
      id v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = inACustomRouteRegion;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] changing isInACustomRouteRegion from %d to %d", (uint8_t *)&v8, 0x18u);
    }

    self->_BOOL inACustomRouteRegion = v3;
    BOOL v7 = [(RoutePlanningSession *)self observers];
    [v7 routePlanningSession:self didChangeRouteCreationRegion:v3];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v7);
  int64_t v5 = sub_1005768D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] adding observer %@", buf, 0x16u);
  }

  int v6 = [(RoutePlanningSession *)self observers];
  [v6 registerObserver:v4];

  os_activity_scope_leave(&v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v7);
  int64_t v5 = sub_1005768D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] remove observer %@", buf, 0x16u);
  }

  int v6 = [(RoutePlanningSession *)self observers];
  [v6 unregisterObserver:v4];

  os_activity_scope_leave(&v7);
}

- (void)resume
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  BOOL v3 = sub_1005768D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v4 = [(RoutePlanningSession *)self sessionState];
    CFStringRef v5 = @"NotStarted";
    if (v4 == 1) {
      CFStringRef v5 = @"Running";
    }
    if (v4 == 2) {
      CFStringRef v5 = @"Suspended";
    }
    *(_DWORD *)buf = 134349314;
    BOOL v35 = self;
    __int16 v36 = 2112;
    id v37 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] resume requested state=%@", buf, 0x16u);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  os_activity_scope_state_s v7 = dispatch_queue_get_label(0);
  if (label != v7 && (!label || !v7 || strcmp(label, v7)))
  {
    long long v26 = sub_1005762E4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      long long v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v28 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      BOOL v35 = (RoutePlanningSession *)"-[RoutePlanningSession resume]";
      __int16 v36 = 2080;
      id v37 = "RoutePlanningSession.m";
      __int16 v38 = 1024;
      int v39 = 506;
      __int16 v40 = 2080;
      v41 = "dispatch_get_main_queue()";
      __int16 v42 = 2080;
      int64_t v43 = v27;
      __int16 v44 = 2080;
      id v45 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);
    }
    if (sub_100BB36BC())
    {
      char v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        BOOL v35 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ((id)[(RoutePlanningSession *)self sessionState] != (id)1)
  {
    unint64_t v8 = [(RoutePlanningSession *)self sessionState];
    [(RoutePlanningSession *)self setSessionState:1];
    id v9 = +[NSDate date];
    [(RoutePlanningSession *)self setStartDate:v9];

    __int16 v10 = [(RoutePlanningSession *)self observers];
    [v10 mapsSession:self didChangeState:[self sessionState]];

    [(RoutePlanningSession *)self _updateLoadingControllerForRealtimeUpdates];
    id v11 = [(RoutePlanningSession *)self configuration];
    __int16 v12 = [v11 locationManager];
    if ([v12 isLocationServicesDenied])
    {
      int v13 = 0;
    }
    else
    {
      id v14 = [(RoutePlanningSession *)self configuration];
      unsigned __int8 v15 = [v14 locationManager];
      unsigned int v16 = [v15 isLocationServicesRestricted];

      int v13 = v16 ^ 1;
    }

    if (!v8)
    {
      id v17 = [(RoutePlanningSession *)self configuration];
      unsigned int v18 = [v17 isNavigationTracePlayback];

      id v19 = sub_1005768D4();
      int v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          BOOL v35 = self;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}p] Playing navtrace; not waiting for accurate location",
            buf,
            0xCu);
        }
LABEL_29:

        long long v25 = [(RoutePlanningSession *)self waypointController];
        [v25 start];

        goto LABEL_30;
      }
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (!v13)
      {
        if (v21)
        {
          *(_DWORD *)buf = 134349056;
          BOOL v35 = self;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}p] Location access isn't available; continuing with waypoint resolution",
            buf,
            0xCu);
        }
        goto LABEL_29;
      }
      if (v21)
      {
        *(_DWORD *)buf = 134349056;
        BOOL v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}p] Waiting for accurate location before resolving waypoints", buf, 0xCu);
      }

      self->_waitingForAccurateLocationUpdate = 1;
      if (self->_sessionInitiator == 4) {
        double v22 = 5.0;
      }
      else {
        double v22 = 10.0;
      }
      objc_initWeak((id *)buf, self);
      __int16 v23 = [(RoutePlanningSession *)self configuration];
      long long v24 = [v23 locationManager];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100D10AA8;
      v31[3] = &unk_1012E6708;
      objc_copyWeak(&v32, (id *)buf);
      [v24 waitForAccurateLocationWithTimeout:v31 handler:v22];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
LABEL_30:
  os_activity_scope_leave(&state);
}

- (void)suspend
{
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v23);
  BOOL v3 = sub_1005768D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v4 = [(RoutePlanningSession *)self sessionState];
    CFStringRef v5 = @"NotStarted";
    if (v4 == 1) {
      CFStringRef v5 = @"Running";
    }
    if (v4 == 2) {
      CFStringRef v5 = @"Suspended";
    }
    *(_DWORD *)buf = 134349314;
    long long v25 = self;
    __int16 v26 = 2112;
    long long v27 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] suspend requested state=%@", buf, 0x16u);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  os_activity_scope_state_s v7 = dispatch_queue_get_label(0);
  if (label != v7 && (!label || !v7 || strcmp(label, v7)))
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      int v13 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      long long v25 = (RoutePlanningSession *)"-[RoutePlanningSession suspend]";
      __int16 v26 = 2080;
      long long v27 = "RoutePlanningSession.m";
      __int16 v28 = 1024;
      int v29 = 556;
      __int16 v30 = 2080;
      id v31 = "dispatch_get_main_queue()";
      __int16 v32 = 2080;
      uint64_t v33 = (uint64_t)v12;
      __int16 v34 = 2080;
      BOOL v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);
    }
    if (sub_100BB36BC())
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        long long v25 = (RoutePlanningSession *)v15;
        unsigned int v16 = (void *)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ((id)[(RoutePlanningSession *)self sessionState] != (id)1)
  {
    id v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = +[NSString stringWithFormat:@"Session state must be running before calling -suspend"];
      *(_DWORD *)buf = 136316162;
      long long v25 = (RoutePlanningSession *)"-[RoutePlanningSession suspend]";
      __int16 v26 = 2080;
      long long v27 = "RoutePlanningSession.m";
      __int16 v28 = 1024;
      int v29 = 557;
      __int16 v30 = 2080;
      id v31 = "self.sessionState == MapsSessionStateRunning";
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      id v19 = (void *)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      int v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        long long v25 = (RoutePlanningSession *)v21;
        double v22 = (void *)v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ((id)[(RoutePlanningSession *)self sessionState] == (id)1)
  {
    [(RoutePlanningSession *)self setSessionState:2];
    unint64_t v8 = [(RoutePlanningSession *)self waypointController];
    [v8 stop];

    id v9 = [(RoutePlanningSession *)self routeLoadingController];
    [v9 cancelLoading];

    [(RoutePlanningSession *)self _updateLoadingControllerForRealtimeUpdates];
    __int16 v10 = [(RoutePlanningSession *)self observers];
    [v10 mapsSession:self didChangeState:[self sessionState]];
  }
  os_activity_scope_leave(&v23);
}

- (void)prepareToReplayCurrentState
{
  id v2 = [(RoutePlanningSession *)self observers];
  [v2 snapshotCurrentObservers];
}

- (void)replayCurrentState
{
  BOOL v3 = [(RoutePlanningSession *)self observers];
  [v3 removeSnapshottedObservers];

  unint64_t v4 = [(RoutePlanningSession *)self observers];
  [v4 mapsSession:self didChangeState:[self sessionState]];

  id v5 = [(RoutePlanningSession *)self observers];
  [v5 restoreOriginalObservers];
}

- (void)cleanupStateReplay
{
  id v2 = [(RoutePlanningSession *)self observers];
  [v2 clearSnapshottedObservers];
}

- (NSString)shortcutIdentifier
{
  id v2 = [(RoutePlanningSession *)self configuration];
  BOOL v3 = [v2 shortcutIdentifier];

  return (NSString *)v3;
}

- (void)setShortcutIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningSession *)self configuration];
  int v6 = [v5 shortcutIdentifier];

  os_activity_scope_state_s v7 = [(RoutePlanningSession *)self configuration];
  [v7 setShortcutIdentifier:v4];

  if (v4)
  {
    unint64_t v8 = sub_100576A9C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "RoutePlanningSession will use shortcut for autosharing: %@", (uint8_t *)&v12, 0xCu);
    }

    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v9 = +[MapsFavoritesManager sharedManager];
      [v9 registerObserver:self];
    }
    else
    {
      id v9 = +[ShortcutManager sharedManager];
      [v9 addObserver:self];
    }

    [(RoutePlanningSession *)self _refreshAutomaticSharingContactsFromShortcut];
  }
  else if (v6)
  {
    __int16 v10 = sub_100576A9C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "RoutePlanningSession will drop shortcut for autosharing: %@", (uint8_t *)&v12, 0xCu);
    }

    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v11 = +[MapsFavoritesManager sharedManager];
      [v11 unregisterObserver:self];
    }
    else
    {
      id v11 = +[ShortcutManager sharedManager];
      [v11 removeObserver:self];
    }

    [(RoutePlanningSession *)self _setAutomaticSharingContacts:0];
  }
}

- (id)_favoriteWithIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[MapsFavoritesManager sharedManager];
    id v5 = [v4 shortcuts];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          int v12 = [v11 identifier];
          unsigned __int8 v13 = [v12 isEqualToString:v3];

          if (v13)
          {
            id v15 = v11;
            id v14 = v6;
            goto LABEL_14;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v14 = sub_100576A9C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "RoutePlanningSession could not find favorite item for identifier: %@", buf, 0xCu);
    }
    id v15 = 0;
LABEL_14:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_shortcutWithIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ShortcutManager sharedManager];
    id v5 = [v4 meCard];
    int v6 = [v5 shortcutsForAll];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unsigned __int8 v13 = MapsSuggestionsShortcutUniqueIdentifier();
          unsigned __int8 v14 = [v13 isEqualToString:v3];

          if (v14)
          {
            id v16 = v12;
            id v15 = v7;
            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v15 = sub_100576A9C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "RoutePlanningSession could not find shortcut for identifier: %@", buf, 0xCu);
    }
    id v16 = 0;
LABEL_14:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4 = sub_100576A9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Me Card did change", v6, 2u);
  }

  [(GCDTimer *)self->_deferredShortcutsRefreshTimer invalidate];
  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  self->_deferredShortcutsRefreshTimer = 0;

  [(RoutePlanningSession *)self _scheduleRefreshUserShortcuts];
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
  id v4 = sub_100576A9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Me Card did change", v6, 2u);
  }

  [(GCDTimer *)self->_deferredShortcutsRefreshTimer invalidate];
  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  self->_deferredShortcutsRefreshTimer = 0;

  [(RoutePlanningSession *)self _scheduleRefreshUserShortcuts];
}

- (void)_scheduleRefreshUserShortcuts
{
  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  id v4 = sub_100576A9C();
  id v5 = v4;
  if (deferredShortcutsRefreshTimer)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "RoutePlanningSession already scheduled deferred shortcuts fetch", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RoutePlanningSession scheduling deferred shortcuts fetch", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100D11A70;
    v9[3] = &unk_1012E7638;
    objc_copyWeak(&v10, buf);
    id v7 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v9 block:0.0];
    id v8 = self->_deferredShortcutsRefreshTimer;
    self->_deferredShortcutsRefreshTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)_refreshAutomaticSharingContactsFromShortcut
{
  id v3 = sub_100576A9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "RoutePlanningSession asked to refresh autoshare from shortcut but no shortcutIdentifier set, exiting early", buf, 2u);
  }

  id v4 = [(RoutePlanningSession *)self shortcutIdentifier];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(RoutePlanningSession *)self shortcutIdentifier];
    id v7 = sub_100576A9C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RoutePlanningSession will refresh autoshare from shortcut %{private}@...", buf, 0xCu);
    }

    id v8 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D11C98;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    id v9 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (NSArray)automaticSharingContacts
{
  id v2 = [(RoutePlanningSession *)self configuration];
  id v3 = [v2 automaticSharingContacts];

  return (NSArray *)v3;
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1005768D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Explicitly setting automatic sharing contacts...", buf, 2u);
  }

  id v6 = [(RoutePlanningSession *)self shortcutIdentifier];

  if (v6)
  {
    id v7 = sub_100576A9C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "RoutePlanningSession implicitly clearing shortcutIdentifier", v9, 2u);
    }

    [(RoutePlanningSession *)self _cancelFetchingCapabilitiesSharingContacts];
    id v8 = [(RoutePlanningSession *)self configuration];
    [v8 setShortcutIdentifier:0];
  }
  [(RoutePlanningSession *)self _setAutomaticSharingContacts:v4];
}

- (void)_setAutomaticSharingContacts:(id)a3
{
}

- (void)_setAutomaticSharingContacts:(id)a3 forShortcutIdentifier:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v8 = [(RoutePlanningSession *)self shortcutIdentifier];
  id v9 = (void *)v8;
  if (v7 | v8) {
    unsigned __int8 v10 = [(id)v8 isEqual:v7];
  }
  else {
    unsigned __int8 v10 = 1;
  }

  int v11 = MSPSharedTripSharingAvailable();
  id v12 = sub_1005768D4();
  unsigned __int8 v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 134217984;
      id v20 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not setting automatic sharing contacts because sharing is not available (would have had %lu autosharing contacts)", (uint8_t *)&v19, 0xCu);
    }

    id v15 = [(RoutePlanningSession *)self configuration];
    [v15 setAutomaticSharingContacts:0];
    goto LABEL_12;
  }
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 134218242;
      id v20 = [v6 count];
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Setting %lu automatic sharing contacts: %@", (uint8_t *)&v19, 0x16u);
    }

    [(RoutePlanningSession *)self _cancelFetchingCapabilitiesSharingContacts];
    unsigned __int8 v14 = [(RoutePlanningSession *)self configuration];
    [v14 setAutomaticSharingContacts:v6];

    id v15 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v15 requestCapabilityLevelsForContacts:v6];
LABEL_12:

    unsigned __int8 v13 = [(RoutePlanningSession *)self observers];
    id v16 = [(RoutePlanningSession *)self configuration];
    long long v17 = [v16 automaticSharingContacts];
    [v13 routePlanningSession:self didUpdateAutomaticSharingContacts:v17];

    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v18 = [(RoutePlanningSession *)self shortcutIdentifier];
    int v19 = 138478083;
    id v20 = (id)v7;
    __int16 v21 = 2113;
    id v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Not setting automatic sharing contacts, passed in shortcutIdentifier %{private}@ doesn't match current %{private}@", (uint8_t *)&v19, 0x16u);
  }
LABEL_13:
}

- (void)_cancelFetchingCapabilitiesSharingContacts
{
  id v2 = [(RoutePlanningSession *)self configuration];
  id v3 = [v2 automaticSharingContacts];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        unsigned __int8 v10 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
        [v10 cancelCapabilityLevelRequestForContact:v9];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_handleReceivedWaypointSetResult
{
  id v3 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  long long v11 = sub_100D12580;
  long long v12 = &unk_1012E5D08;
  long long v13 = self;
  id v4 = &_dispatch_main_q;
  id v5 = v10;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v7 = dispatch_queue_get_label(0);
  if (label == v7 || (label ? (BOOL v8 = v7 == 0) : (BOOL v8 = 1), !v8 && !strcmp(label, v7)))
  {
    v11((uint64_t)v5);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  uint64_t v9 = dispatch_queue_get_label(0);
  if (label == v9 || label && v9 && !strcmp(label, v9))
  {
    __int16 v44 = sub_1005762E4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
      *(_DWORD *)buf = 136316162;
      id v57 = (RoutePlanningSession *)"-[RoutePlanningSession waypointController:didResolveWaypointSet:]";
      __int16 v58 = 2080;
      __int16 v59 = "RoutePlanningSession.m";
      __int16 v60 = 1024;
      int v61 = 812;
      __int16 v62 = 2080;
      __int16 v63 = "_isolationQueue";
      __int16 v64 = 2080;
      v65 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);
    }

    if (sub_100BB36BC())
    {
      v46 = sub_1005762E4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v57 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  unint64_t v10 = [(RoutePlanningSession *)self sessionState];
  long long v11 = sub_1005768D4();
  long long v12 = v11;
  if (v10 == 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v57 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring waypoint update due to being paused", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = [(RoutePlanningSession *)self currentTransportType];
      if ((unint64_t)(v13 - 1) > 4) {
        CFStringRef v14 = @"Undefined";
      }
      else {
        CFStringRef v14 = off_101321F30[v13 - 1];
      }
      *(_DWORD *)buf = 134349314;
      id v57 = self;
      __int16 v58 = 2112;
      __int16 v59 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Received waypoints with initial transport type: %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100D1317C;
    v51[3] = &unk_101321E50;
    objc_copyWeak(&v53, &location);
    id v52 = v7;
    id v15 = objc_retainBlock(v51);
    if ([(RoutePlanningSession *)self currentTransportType])
    {
      id v16 = sub_1005768D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        id v57 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] RoutePlanningSession was initialized with a valid transport type", buf, 0xCu);
      }

      ((void (*)(void *, int64_t))v15[2])(v15, [(RoutePlanningSession *)self currentTransportType]);
    }
    else
    {
      long long v17 = [(RoutePlanningSession *)self platformController];
      long long v18 = [v17 chromeViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v19 = v18;
      }
      else {
        int v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        __int16 v21 = [(RoutePlanningSession *)self resolvedWaypoints];
        id v22 = [v21 origin];
        id v23 = [v22 latLng];

        long long v24 = [(RoutePlanningSession *)self resolvedWaypoints];
        long long v25 = [v24 destination];
        __int16 v26 = [v25 latLng];

        long long v27 = sub_1005768D4();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          id v57 = self;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%{public}p] RoutePlanningSession was not initialized with a valid transport type; determining a default one now",
            buf,
            0xCu);
        }

        __int16 v28 = [v20 defaultTransportTypeFinder];
        [v23 lat];
        CLLocationDegrees v30 = v29;
        [v23 lng];
        CLLocationCoordinate2D v32 = CLLocationCoordinate2DMake(v30, v31);
        [v26 lat];
        CLLocationDegrees v34 = v33;
        [v26 lng];
        CLLocationCoordinate2D v36 = CLLocationCoordinate2DMake(v34, v35);
        BOOL v37 = [(RoutePlanningSession *)self ignoreMapType];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100D13A80;
        v48[3] = &unk_1012F94C8;
        objc_copyWeak(&v50, &location);
        v49 = v15;
        [v28 transportTypeForOrigin:v37 destination:v48 ignoreMapType:v32.latitude, v32.longitude, v36.latitude, v36.longitude];

        objc_destroyWeak(&v50);
      }
      else
      {
        __int16 v38 = sub_1005762E4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v57 = (RoutePlanningSession *)"-[RoutePlanningSession waypointController:didResolveWaypointSet:]";
          __int16 v58 = 2080;
          __int16 v59 = "RoutePlanningSession.m";
          __int16 v60 = 1024;
          int v61 = 877;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          int v39 = sub_1005762E4();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            __int16 v40 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            id v57 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        v41 = sub_1005768D4();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          __int16 v42 = [(RoutePlanningSession *)self platformController];
          int64_t v43 = [v42 chromeViewController];
          *(_DWORD *)buf = 134349314;
          id v57 = self;
          __int16 v58 = 2112;
          __int16 v59 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%{public}p] chrome view controller was not an iOS based one: %@; cannot determine default transport type",
            buf,
            0x16u);
        }
        ((void (*)(void *, int64_t))v15[2])(v15, [(RoutePlanningSession *)self currentTransportType]);
      }
    }
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }
  os_activity_scope_leave(&state);
}

- (void)routeLoadingController:(id)a3 didReceiveRoutesResult:(id)a4 forTransportType:(int64_t)a5 advisoryInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = (RoutePlanningSession *)a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if ((id)[(RoutePlanningSession *)self sessionState] == (id)2)
  {
    int64_t v13 = sub_1005768D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring routes update due to being paused", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    double v33 = sub_100104550;
    CLLocationDegrees v34 = sub_100104B18;
    id v35 = 0;
    CFStringRef v14 = sub_1005768D4();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100D13F1C;
      v21[3] = &unk_1012EEC48;
      void v21[4] = &buf;
      [v11 withValue:v21 orError:&stru_101321E90];
      id v16 = sub_1005768D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
        if ((unint64_t)(a5 - 1) > 4) {
          CFStringRef v18 = @"Undefined";
        }
        else {
          CFStringRef v18 = off_101321F30[a5 - 1];
        }
        *(_DWORD *)id v23 = 134349826;
        long long v24 = self;
        __int16 v25 = 2112;
        id v26 = v10;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        CFStringRef v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ received routes %@ (transport type=%@)", v23, 0x2Au);
      }
    }
    int v19 = [v11 map:&stru_101321ED0];
    if ((id)[(RoutePlanningSession *)self currentTransportType] == (id)1) {
      objc_storeStrong((id *)&self->_advisoryInfo, a6);
    }
    id v20 = sub_1005768D4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v23 = 138412290;
      long long v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Advisory info receieved : %@", v23, 0xCu);
    }

    [(RoutePlanningSession *)self updateRouteCollectionResult:v19 forTransportType:a5];
    _Block_object_dispose(&buf, 8);
  }
  os_activity_scope_leave(&state);
}

- (void)routeLoadingController:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  id v11 = sub_1005768D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v9 allKeys];
    *(_DWORD *)long long buf = 134349570;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    long long v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ received updates for routes %@", buf, 0x20u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D14198;
  block[3] = &unk_1012E66E0;
  void block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  os_activity_scope_leave(&state);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_RouteCreationAvailable && a3.var1 == off_1015F1498)
  {
    id v6 = [(RoutePlanningSession *)self currentRouteCollectionResult];
    id v5 = [v6 value];
    [(RoutePlanningSession *)self _updateIsInACustomRouteRegionForRouteCollection:v5];
  }
}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (WaypointControllerConfiguration)waypointConfiguration
{
  return self->_waypointConfiguration;
}

- (RoutePlanningSessionConfiguration)configuration
{
  return self->_configuration;
}

- (RAPGraphDirectionsRecorder)reportAProblemRecorder
{
  return self->_reportAProblemRecorder;
}

- (BOOL)inACustomRouteRegion
{
  return self->_inACustomRouteRegion;
}

- (NavigationStateMonitoringTask)navigationStateMonitoringTask
{
  return self->_navigationStateMonitoringTask;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (int64_t)currentTransportType
{
  return self->_currentTransportType;
}

- (BOOL)isWaitingForAccurateLocationUpdate
{
  return self->_waitingForAccurateLocationUpdate;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (WaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
}

- (RouteLoadingController)routeLoadingController
{
  return self->_routeLoadingController;
}

- (void)setRouteLoadingController:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (NSMutableDictionary)transportTypeToRouteCollectionResultsMap
{
  return self->_transportTypeToRouteCollectionResultsMap;
}

- (void)setTransportTypeToRouteCollectionResultsMap:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_transportTypeToRouteCollectionResultsMap, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeLoadingController, 0);
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_navigationStateMonitoringTask, 0);
  objc_storeStrong((id *)&self->_reportAProblemRecorder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_waypointConfiguration, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_advisoryInfo, 0);

  objc_storeStrong((id *)&self->_deferredShortcutsRefreshTimer, 0);
}

- (void)enumerateRequestsOrWaypointsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningSession *)self currentRouteCollection];
  id v6 = [v5 currentRoute];
  if (v6)
  {
    id v7 = [v5 currentRoute];
    id v8 = [v7 waypoints];
  }
  else
  {
    id v8 = 0;
  }

  if ([v8 count])
  {
    id v9 = [(RoutePlanningSession *)self configuration];
    id v10 = [v9 waypointRequests];

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    v31[0] = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100D65AB8;
    v26[3] = &unk_101323008;
    __int16 v29 = buf;
    id v11 = v10;
    id v27 = v11;
    id v28 = v4;
    [v8 enumerateObjectsUsingBlock:v26];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    long long v12 = [(RoutePlanningSession *)self resolvedWaypoints];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 count];
      BOOL v15 = [(RoutePlanningSession *)self configuration];
      id v16 = [v15 waypointRequests];
      id v17 = [v16 count];

      if (v14 != v17)
      {
        CFStringRef v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[RoutePlanningSession(WaypointsOrRequests) enumerateRequestsOrWaypointsUsingBlock:]";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "RoutePlanningSession+WaypointsOrRequests.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v31[0]) = 51;
          WORD2(v31[0]) = 2080;
          *(void *)((char *)v31 + 6) = "!resolvedWaypoints || resolvedWaypoints.count == self.configuration.waypointRequests.count";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          int v19 = sub_1005762E4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v20 = +[NSThread callStackSymbols];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
    }
    __int16 v21 = [(RoutePlanningSession *)self configuration];
    id v22 = [v21 waypointRequests];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100D65C9C;
    v23[3] = &unk_101321C20;
    id v24 = v13;
    id v25 = v4;
    id v11 = v13;
    [v22 enumerateObjectsUsingBlock:v23];
  }
}

+ (id)mostAppropriateNameForWaypointWithRequest:(id)a3 composedWaypoint:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    if (v5 && [(id)v5 preferredNameSource] != (id)1) {
      goto LABEL_8;
    }
  }
  else
  {
    id v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      id v17 = "+[RoutePlanningSession(WaypointsOrRequests) mostAppropriateNameForWaypointWithRequest:composedWaypoint:]";
      __int16 v18 = 2080;
      int v19 = "RoutePlanningSession+WaypointsOrRequests.m";
      __int16 v20 = 1024;
      int v21 = 60;
      __int16 v22 = 2080;
      __int16 v23 = "waypointRequest || composedWaypoint";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        BOOL v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
    {
      id v8 = [[SearchResult alloc] initWithComposedWaypoint:v6];
      id v7 = [(SearchResult *)v8 name];

      goto LABEL_9;
    }
LABEL_8:
    id v7 = 0;
    goto LABEL_9;
  }
  id v7 = [(id)v6 name];
LABEL_9:
  id v9 = [v7 length];
  if (v5 && !v9)
  {
    id v10 = [(id)v5 waypointPlaceholder];
    uint64_t v11 = [v10 name];

    id v7 = (void *)v11;
  }

  return v7;
}

@end