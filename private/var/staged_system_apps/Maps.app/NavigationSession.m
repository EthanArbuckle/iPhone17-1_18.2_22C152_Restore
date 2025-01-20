@interface NavigationSession
- (BOOL)hasStartedNavigation;
- (BOOL)isCarNavigationCompatible;
- (GEOComposedWaypoint)destination;
- (GEOObserverHashTable)observers;
- (MNNavigationService)navigationService;
- (MNNavigationTraceInfo)currentlyPlayingTraceInfo;
- (NSString)currentDestinationString;
- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4;
- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4 navigationService:(id)a5;
- (NavigationSessionConfiguration)configuration;
- (NavigationStateProvider)navigationStateProvider;
- (PlatformController)platformController;
- (RouteCollection)currentRouteCollection;
- (RouteCollectionUpdateProvider)routeCollectionUpdateProvider;
- (_TtC4Maps28NavigationWaypointController)waypointController;
- (int64_t)currentTransportType;
- (int64_t)navigationType;
- (unint64_t)guidanceType;
- (unint64_t)sessionInitiator;
- (unint64_t)sessionState;
- (void)_retryAutomaticSharing:(id)a3;
- (void)_scheduleAutomaticSharingRetry:(unint64_t)a3;
- (void)_startAutomaticETASharingIfNeeded:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)cleanupStateReplay;
- (void)dealloc;
- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationStateProvider:(id)a3 didChangeNavigationState:(unint64_t)a4;
- (void)prepareToReplayCurrentState;
- (void)removeObserver:(id)a3;
- (void)replayCurrentState;
- (void)resume;
- (void)routeCollectionUpdateProvider:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)selectRoute:(id)a3;
- (void)setCurrentlyPlayingTraceInfo:(id)a3;
- (void)setHasStartedNavigation:(BOOL)a3;
- (void)setNavigationService:(id)a3;
- (void)setNavigationStateProvider:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRouteCollectionUpdateProvider:(id)a3;
- (void)setWaypointController:(id)a3;
- (void)suspendWithCompletion:(id)a3;
@end

@implementation NavigationSession

- (void)selectRoute:(id)a3
{
  id v3 = a3;
  id v4 = +[MNNavigationService sharedService];
  [v4 switchToRoute:v3];
}

- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  v7 = +[MNNavigationService sharedService];
  v8 = [(NavigationSession *)self initWithInitiator:a3 configuration:v6 navigationService:v7];

  return v8;
}

- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4 navigationService:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)NavigationSession;
  v11 = [(NavigationSession *)&v39 init];
  if (v11)
  {
    v12 = sub_10000AF10();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v11->_sessionInitiator = a3;
      objc_storeStrong((id *)&v11->_configuration, a4);
      v23 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___NavigationSessionObserver queue:0];
      observers = v11->_observers;
      v11->_observers = v23;

      v25 = [NavdNavigationStateProvider alloc];
      v26 = [(NavigationSessionConfiguration *)v11->_configuration startNavigationDetails];
      v27 = [(NavdNavigationStateProvider *)v25 initWithNavigationService:v10 startNavigationDetails:v26];
      navigationStateProvider = v11->_navigationStateProvider;
      v11->_navigationStateProvider = (NavigationStateProvider *)v27;

      [(NavigationStateProvider *)v11->_navigationStateProvider setDelegate:v11];
      v29 = [NavdRouteCollectionUpdateProvider alloc];
      v30 = [(NavigationSessionConfiguration *)v11->_configuration routeCollection];
      v31 = [(NavdRouteCollectionUpdateProvider *)v29 initWithNavigationService:v10 routeCollection:v30];
      routeCollectionUpdateProvider = v11->_routeCollectionUpdateProvider;
      v11->_routeCollectionUpdateProvider = (RouteCollectionUpdateProvider *)v31;

      [(RouteCollectionUpdateProvider *)v11->_routeCollectionUpdateProvider setDelegate:v11];
      objc_storeStrong((id *)&v11->_navigationService, a5);
      [(MNNavigationService *)v11->_navigationService openForClient:v11];
      [(MNNavigationService *)v11->_navigationService registerObserver:v11];
      v33 = [_TtC4Maps28NavigationWaypointController alloc];
      v34 = +[MNNavigationService sharedService];
      v35 = [(NavigationWaypointController *)v33 initWithService:v34];
      waypointController = v11->_waypointController;
      v11->_waypointController = v35;

      goto LABEL_13;
    }
    id v38 = v9;
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(NavigationSession *)v13 performSelector:"accessibilityIdentifier"];
      v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_8;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_8:

    v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    v21 = (void *)v20;
    if (a3 - 1 > 7) {
      CFStringRef v22 = @"Unknown";
    }
    else {
      CFStringRef v22 = *(&off_1012F0C70 + a3 - 1);
    }
    id v9 = v38;
    *(_DWORD *)buf = 138544130;
    v41 = v18;
    __int16 v42 = 2112;
    uint64_t v43 = v20;
    __int16 v44 = 2112;
    CFStringRef v45 = v22;
    __int16 v46 = 2112;
    id v47 = v38;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] %@ is being initialized - initiator=%@ configuration=%@", buf, 0x2Au);

    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (void)dealloc
{
  id v3 = sub_10000AF10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(NavigationSession *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %@ is being deallocated", buf, 0x16u);
  }
  id v10 = +[MSPSharedTripService sharedInstance];
  [v10 stopAllSharingWithCompletion:0];

  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  [(MNNavigationService *)self->_navigationService closeForClient:self];
  v11.receiver = self;
  v11.super_class = (Class)NavigationSession;
  [(NavigationSession *)&v11 dealloc];
}

- (GEOComposedWaypoint)destination
{
  v2 = [(NavigationSession *)self currentRouteCollection];
  id v3 = [v2 currentRoute];
  id v4 = [v3 destination];

  return (GEOComposedWaypoint *)v4;
}

- (void)setNavigationStateProvider:(id)a3
{
  v5 = (NavigationStateProvider *)a3;
  navigationStateProvider = self->_navigationStateProvider;
  if (navigationStateProvider != v5)
  {
    v7 = v5;
    [(NavigationStateProvider *)navigationStateProvider setDelegate:0];
    objc_storeStrong((id *)&self->_navigationStateProvider, a3);
    [(NavigationStateProvider *)self->_navigationStateProvider setDelegate:self];
    v5 = v7;
  }
}

- (void)setRouteCollectionUpdateProvider:(id)a3
{
  v5 = (RouteCollectionUpdateProvider *)a3;
  routeCollectionUpdateProvider = self->_routeCollectionUpdateProvider;
  if (routeCollectionUpdateProvider != v5)
  {
    v7 = v5;
    [(RouteCollectionUpdateProvider *)routeCollectionUpdateProvider setDelegate:0];
    objc_storeStrong((id *)&self->_routeCollectionUpdateProvider, a3);
    [(RouteCollectionUpdateProvider *)self->_routeCollectionUpdateProvider setDelegate:self];
    v5 = v7;
  }
}

- (int64_t)navigationType
{
  v2 = [(NavigationSession *)self configuration];
  id v3 = [v2 startNavigationDetails];
  id v4 = [v3 navigationType];

  return (int64_t)v4;
}

- (unint64_t)guidanceType
{
  v2 = [(NavigationSession *)self configuration];
  id v3 = [v2 startNavigationDetails];
  id v4 = [v3 guidanceType];

  return (unint64_t)v4;
}

- (RouteCollection)currentRouteCollection
{
  v2 = [(NavigationSession *)self routeCollectionUpdateProvider];
  id v3 = [v2 currentRouteCollection];

  return (RouteCollection *)v3;
}

- (int64_t)currentTransportType
{
  v2 = [(NavigationSession *)self currentRouteCollection];
  id v3 = [v2 currentRoute];
  unsigned int v4 = [v3 transportType] - 1;
  if (v4 > 5) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = qword_100F6FE70[v4];
  }

  return v5;
}

- (NSString)currentDestinationString
{
  v2 = [(NavigationSession *)self currentRouteCollection];
  id v3 = [v2 currentRoute];
  unsigned int v4 = [v3 destination];
  int64_t v5 = [v4 name];

  return (NSString *)v5;
}

- (unint64_t)sessionState
{
  id v3 = [(NavigationSession *)self navigationStateProvider];
  id v4 = [v3 navigationState];

  if (v4 == (id)1)
  {
    if ([(NavigationSession *)self hasStartedNavigation]) {
      return 2;
    }
    else {
      return 0;
    }
  }
  else if (v4 == (id)2)
  {
    unint64_t v5 = 1;
    [(NavigationSession *)self setHasStartedNavigation:1];
  }
  else
  {
    return 0;
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ - adding observer %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(NavigationSession *)self observers];
  [v6 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sub_10000AF10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ - remove observer %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(NavigationSession *)self observers];
  [v6 unregisterObserver:v4];
}

- (void)resume
{
  id v3 = sub_10000AF10();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_15;
  }
  id v4 = self;
  if (!v4)
  {
    __int16 v9 = @"<nil>";
    goto LABEL_10;
  }
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    int v7 = [(NavigationSession *)v4 performSelector:"accessibilityIdentifier"];
    v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      __int16 v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  __int16 v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  id v10 = [(NavigationSession *)v4 sessionState];
  CFStringRef v11 = @"NotStarted";
  if (v10 == (id)1) {
    CFStringRef v11 = @"Running";
  }
  *(_DWORD *)buf = 138543874;
  v18 = v9;
  __int16 v19 = 2112;
  uint64_t v20 = v4;
  if (v10 == (id)2) {
    CFStringRef v11 = @"Suspended";
  }
  __int16 v21 = 2112;
  CFStringRef v22 = v11;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %@ - start requested, state=%@", buf, 0x20u);

LABEL_15:
  v12 = [(NavigationSession *)self navigationStateProvider];
  id v13 = [v12 navigationState];

  if (v13 == (id)2)
  {
    [(NavigationSession *)self _startAutomaticETASharingIfNeeded:GEOConfigGetUInteger()];
    __int16 v14 = [(NavigationSession *)self observers];
    [v14 mapsSession:self didChangeState:[self sessionState]];
  }
  else
  {
    v15 = [(NavigationSession *)self configuration];
    v16 = [v15 sharedTripPrefetchContext];
    +[SharedTripSuggestionsDataSource prefetchSuggestionsAndCapabilitiesWithContext:v16];

    __int16 v14 = [(NavigationSession *)self navigationStateProvider];
    [v14 setNavigationState:2];
  }
}

- (void)suspendWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  unint64_t v5 = sub_10000AF10();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_15;
  }
  id v6 = self;
  if (!v6)
  {
    CFStringRef v11 = @"<nil>";
    goto LABEL_10;
  }
  int v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    __int16 v9 = [(NavigationSession *)v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  id v12 = [(NavigationSession *)v6 sessionState];
  CFStringRef v13 = @"NotStarted";
  if (v12 == (id)1) {
    CFStringRef v13 = @"Running";
  }
  *(_DWORD *)buf = 138543874;
  uint64_t v20 = v11;
  __int16 v21 = 2112;
  CFStringRef v22 = v6;
  if (v12 == (id)2) {
    CFStringRef v13 = @"Suspended";
  }
  __int16 v23 = 2112;
  CFStringRef v24 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %@ - suspend requested, state=%@", buf, 0x20u);

LABEL_15:
  __int16 v14 = [(NavigationSession *)self navigationStateProvider];
  id v15 = [v14 navigationState];

  if (v15 == (id)1)
  {
    v4[2](v4);
  }
  else
  {
    id v16 = [v4 copy];
    id suspendCompletionHandler = self->_suspendCompletionHandler;
    self->_id suspendCompletionHandler = v16;

    v18 = [(NavigationSession *)self navigationStateProvider];
    [v18 setNavigationState:1];
  }
}

- (void)prepareToReplayCurrentState
{
  id v2 = [(NavigationSession *)self observers];
  [v2 snapshotCurrentObservers];
}

- (void)replayCurrentState
{
  id v3 = [(NavigationSession *)self observers];
  [v3 removeSnapshottedObservers];

  id v4 = [(NavigationSession *)self observers];
  [v4 mapsSession:self didChangeState:[self sessionState]];

  id v5 = [(NavigationSession *)self observers];
  [v5 restoreOriginalObservers];
}

- (void)cleanupStateReplay
{
  id v2 = [(NavigationSession *)self observers];
  [v2 clearSnapshottedObservers];
}

- (void)_startAutomaticETASharingIfNeeded:(unint64_t)a3
{
  id v5 = [(NavigationSession *)self navigationStateProvider];
  id v6 = [v5 navigationState];

  if (v6 != (id)2)
  {
    __int16 v19 = sub_10000AF10();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v29 = self;
    uint64_t v20 = "%@ - will not start automatic sharing, navigation not active";
    __int16 v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  int64_t v7 = [(NavigationSession *)self currentTransportType];
  if ((MSPSharedTripSharingSupportedForTransportType() & 1) == 0)
  {
    __int16 v19 = sub_10000AF10();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    if ((unint64_t)(v7 - 1) > 4) {
      CFStringRef v24 = @"Undefined";
    }
    else {
      CFStringRef v24 = *(&off_1012F0CB0 + v7 - 1);
    }
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2112;
    CFStringRef v31 = v24;
    uint64_t v20 = "%@ - will not start automatic sharing, current transport type is not supported (%@)";
    __int16 v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    uint32_t v23 = 22;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
    goto LABEL_24;
  }
  pendingAutomaticSharingContacts = self->_pendingAutomaticSharingContacts;
  if (!pendingAutomaticSharingContacts)
  {
    __int16 v9 = [(NavigationSession *)self configuration];
    id v10 = [v9 sharedTripPrefetchContext];

    CFStringRef v11 = [v10 automaticSharingContacts];
    id v12 = v11;
    if (!v11) {
      CFStringRef v11 = &__NSArray0__struct;
    }
    CFStringRef v13 = (NSMutableArray *)[v11 mutableCopy];
    __int16 v14 = self->_pendingAutomaticSharingContacts;
    self->_pendingAutomaticSharingContacts = v13;

    id v15 = sub_10000AF10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = (const __CFString *)[(NSMutableArray *)self->_pendingAutomaticSharingContacts count];
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2048;
      CFStringRef v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ - preparing to handle %lu automatic sharing contacts", buf, 0x16u);
    }

    pendingAutomaticSharingContacts = self->_pendingAutomaticSharingContacts;
  }
  if (![(NSMutableArray *)pendingAutomaticSharingContacts count])
  {
    __int16 v19 = sub_10000AF10();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v29 = self;
    uint64_t v20 = "%@ - will not start automatic sharing, no pending contacts";
    __int16 v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_15:
    uint32_t v23 = 12;
    goto LABEL_23;
  }
  v17 = (__CFString *)[(NSMutableArray *)self->_pendingAutomaticSharingContacts copy];
  v18 = sub_10000AF10();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v29 = self;
    __int16 v30 = 2113;
    CFStringRef v31 = v17;
    __int16 v32 = 2048;
    unint64_t v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ - will start automatic sharing with %{private}@, remaining retries %lu", buf, 0x20u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1005B0ACC;
  v25[3] = &unk_1012F0C50;
  v26 = v17;
  unint64_t v27 = a3;
  v25[4] = self;
  __int16 v19 = v17;
  [v19 enumerateObjectsWithOptions:1 usingBlock:v25];

LABEL_24:
}

- (void)_scheduleAutomaticSharingRetry:(unint64_t)a3
{
  if (!self->_automaticSharingRetryTimer)
  {
    GEOConfigGetDouble();
    double v6 = v5;
    int64_t v7 = sub_10000AF10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2048;
      double v17 = v6;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ - scheduling automatic sharing in %#.1fs, %lu remaining retries", buf, 0x20u);
    }

    v8 = +[NSNumber numberWithUnsignedInteger:a3, @"retries"];
    CFStringRef v13 = v8;
    __int16 v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_retryAutomaticSharing:" selector:v9 userInfo:0 repeats:v6];
    automaticSharingRetryTimer = self->_automaticSharingRetryTimer;
    self->_automaticSharingRetryTimer = v10;
  }
}

- (void)_retryAutomaticSharing:(id)a3
{
  id v4 = [a3 userInfo];
  [(NSTimer *)self->_automaticSharingRetryTimer invalidate];
  automaticSharingRetryTimer = self->_automaticSharingRetryTimer;
  self->_automaticSharingRetryTimer = 0;

  double v6 = [v4 objectForKeyedSubscript:@"retries"];
  id v7 = [v6 unsignedIntegerValue];

  v8 = sub_10000AF10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2048;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ - performing scheduled retry of automatic sharing, %lu remaining retries", (uint8_t *)&v9, 0x16u);
  }

  [(NavigationSession *)self _startAutomaticETASharingIfNeeded:v7];
}

- (void)navigationStateProvider:(id)a3 didChangeNavigationState:(unint64_t)a4
{
  double v6 = sub_10000AF10();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_15;
  }
  id v7 = self;
  if (!v7)
  {
    id v12 = @"<nil>";
    goto LABEL_10;
  }
  v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    id v10 = [(NavigationSession *)v7 performSelector:"accessibilityIdentifier"];
    __int16 v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_8;
    }
  }
  id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
  id v13 = [(NavigationSession *)v7 sessionState];
  CFStringRef v14 = @"NotStarted";
  if (v13 == (id)1) {
    CFStringRef v14 = @"Running";
  }
  *(_DWORD *)buf = 138543874;
  uint64_t v20 = v12;
  __int16 v21 = 2112;
  os_log_type_t v22 = v7;
  if (v13 == (id)2) {
    CFStringRef v14 = @"Suspended";
  }
  __int16 v23 = 2112;
  CFStringRef v24 = v14;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %@ - state updated state=%@", buf, 0x20u);

LABEL_15:
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      id suspendCompletionHandler = self->_suspendCompletionHandler;
      if (suspendCompletionHandler)
      {
        __int16 v16 = (void (**)(void))objc_retainBlock(suspendCompletionHandler);
        id v17 = self->_suspendCompletionHandler;
        self->_id suspendCompletionHandler = 0;

        v16[2](v16);
      }
    }
    [(NavigationSession *)self guidanceType];
    goto LABEL_20;
  }
  [(NavigationSession *)self _startAutomaticETASharingIfNeeded:GEOConfigGetUInteger()];
  if ((id)[(NavigationSession *)self guidanceType] != (id)2)
  {
LABEL_20:
    __int16 v18 = [(NavigationSession *)self observers];
    [v18 mapsSession:self didChangeState:[self sessionState]];
  }
}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  v8 = [(NavigationSession *)self observers];
  if ((a4 - 1) > 5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = qword_100F6FE70[a4 - 1];
  }
  id v10 = v8;
  [v8 navigationSession:self didChangeCurrentTransportType:v9];
}

- (void)routeCollectionUpdateProvider:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5 = a4;
  double v6 = sub_10000AF10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 shortDescription];
    int v9 = 138412547;
    id v10 = self;
    __int16 v11 = 2113;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ - routeCollection updated collection=%{private}@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(NavigationSession *)self observers];
  [v8 navigationSession:self didUpdateRouteCollection:v5];
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (NavigationSessionConfiguration)configuration
{
  return self->_configuration;
}

- (NavigationStateProvider)navigationStateProvider
{
  return self->_navigationStateProvider;
}

- (RouteCollectionUpdateProvider)routeCollectionUpdateProvider
{
  return self->_routeCollectionUpdateProvider;
}

- (MNNavigationTraceInfo)currentlyPlayingTraceInfo
{
  return self->_currentlyPlayingTraceInfo;
}

- (void)setCurrentlyPlayingTraceInfo:(id)a3
{
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)hasStartedNavigation
{
  return self->_hasStartedNavigation;
}

- (void)setHasStartedNavigation:(BOOL)a3
{
  self->_hasStartedNavigation = a3;
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
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingTraceInfo, 0);
  objc_storeStrong((id *)&self->_routeCollectionUpdateProvider, 0);
  objc_storeStrong((id *)&self->_navigationStateProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong(&self->_suspendCompletionHandler, 0);
  objc_storeStrong((id *)&self->_automaticSharingRetryTimer, 0);

  objc_storeStrong((id *)&self->_pendingAutomaticSharingContacts, 0);
}

- (BOOL)isCarNavigationCompatible
{
  int64_t v3 = [(NavigationSession *)self navigationType];
  return (id)[(NavigationSession *)self currentTransportType] == (id)1 && v3 == 3;
}

@end