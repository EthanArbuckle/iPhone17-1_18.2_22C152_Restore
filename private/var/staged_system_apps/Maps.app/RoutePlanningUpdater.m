@interface RoutePlanningUpdater
+ (int64_t)creationPreference;
- (BOOL)isPaused;
- (BOOL)isUpdatingRoute;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldRefreshRoutesForCurrentLocation;
- (BOOL)shouldRefreshRoutesForLocationManagerUpdate;
- (BOOL)shouldRefreshRoutesForUserLocation:(id)a3;
- (GCDTimer)offRouteRefreshTimer;
- (GCDTimer)periodicRouteRefreshTimer;
- (MNRouteProximitySensor)proximitySensor;
- (NSSet)eligibleTransportTypes;
- (RouteCollection)currentRouteCollection;
- (RoutePlanningSession)session;
- (RoutePlanningUpdater)init;
- (void)_mapsBackgrounded;
- (void)_mapsForegrounded;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_preparePeriodicRouteRefreshTimerWithError:(id)a3;
- (void)_updateRefreshStateWithError:(id)a3;
- (void)_vlfSessionDidStop:(id)a3;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)refreshRoutesForced:(BOOL)a3;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setOffRouteRefreshTimer:(id)a3;
- (void)setPause:(BOOL)a3;
- (void)setPeriodicRouteRefreshTimer:(id)a3;
- (void)setProximitySensor:(id)a3;
- (void)setSession:(id)a3;
- (void)setUpdatingRoute:(BOOL)a3;
@end

@implementation RoutePlanningUpdater

- (RoutePlanningUpdater)init
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningUpdater;
  v2 = [(RoutePlanningUpdater *)&v8 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_mapsForegrounded" name:UIApplicationWillEnterForegroundNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_mapsBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_vlfSessionDidStop:" name:@"VLFSessionDidStopNotification" object:0];

    v6 = +[GEONetworkObserver sharedNetworkObserver];
    [v6 addNetworkReachableObserver:v2 selector:"_networkReachabilityChanged:"];
  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = sub_10054ADB0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "dealloc - Removing %@ from session %@", buf, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_session);
  [v5 removeObserver:self];

  v6 = +[MKLocationManager sharedLocationManager];
  [v6 stopListeningForLocationUpdates:self];

  v7 = +[GEONetworkObserver sharedNetworkObserver];
  [v7 removeNetworkReachableObserver:self];

  objc_super v8 = +[GEOOfflineService shared];
  [v8 removeDelegate:self];

  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningUpdater;
  [(RoutePlanningUpdater *)&v9 dealloc];
}

- (NSSet)eligibleTransportTypes
{
  eligibleTransportTypes = self->_eligibleTransportTypes;
  if (!eligibleTransportTypes)
  {
    v4 = +[NSSet setWithArray:&off_1013AD740];
    id v5 = self->_eligibleTransportTypes;
    self->_eligibleTransportTypes = v4;

    eligibleTransportTypes = self->_eligibleTransportTypes;
  }

  return eligibleTransportTypes;
}

- (MNRouteProximitySensor)proximitySensor
{
  v3 = [(RoutePlanningUpdater *)self currentRouteCollection];
  v4 = [v3 currentRoute];

  proximitySensor = self->_proximitySensor;
  if (proximitySensor) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    v7 = (MNRouteProximitySensor *)[objc_alloc((Class)MNRouteProximitySensor) initWithRoute:v4];
    objc_super v8 = self->_proximitySensor;
    self->_proximitySensor = v7;

    GEOConfigGetDouble();
    -[MNRouteProximitySensor setProximityThreshold:](self->_proximitySensor, "setProximityThreshold:");
    proximitySensor = self->_proximitySensor;
  }
  objc_super v9 = proximitySensor;

  return v9;
}

- (RouteCollection)currentRouteCollection
{
  v2 = [(RoutePlanningUpdater *)self session];
  v3 = [v2 currentRouteCollection];

  return (RouteCollection *)v3;
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_session);
    [v6 removeObserver:self];
    objc_storeWeak((id *)&self->_session, v4);
    self->_performedInitialRefresh = 0;
    [v4 addObserver:self];
    v7 = sub_10054ADB0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "session did change from %@ to %@", (uint8_t *)&v8, 0x16u);
    }

    [(RoutePlanningUpdater *)self _updateRefreshStateWithError:0];
  }
}

- (void)setPause:(BOOL)a3
{
  if (self->_pause != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "pause did change to %d", (uint8_t *)v6, 8u);
    }

    self->_pause = v3;
    if (v3) {
      [(RoutePlanningUpdater *)self setUpdatingRoute:0];
    }
  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  int v8 = +[GEOOfflineService shared];
  id v9 = v8;
  if (isKindOfClass) {
    [v8 setDelegate:self];
  }
  else {
    [v8 removeDelegate:self];
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  [(RoutePlanningUpdater *)self setSession:v10];

  id v11 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v12 = v11;
  }
  else {
    __int16 v12 = 0;
  }
  id v13 = v12;

  v14 = [(RoutePlanningUpdater *)self session];

  if (v14)
  {
    if (v13)
    {
      if ([v13 guidanceType] == (id)2 && objc_msgSend(v13, "currentTransportType") == (id)2)
      {
        v28 = [v13 currentRouteCollection];
        v27 = [v28 currentRoute];
        v26 = [v27 uniqueRouteID];
        v15 = [v26 UUIDString];
        v16 = [(RoutePlanningUpdater *)self session];
        v17 = [v16 currentRouteCollection];
        v18 = [v17 currentRoute];
        v19 = [v18 uniqueRouteID];
        v20 = [v19 UUIDString];
        unsigned __int8 v25 = [v15 isEqualToString:v20];

        if ((v25 & 1) == 0)
        {
          v21 = sub_10054ADB0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Detected coming back from pedestrian navigation in route preview mode with different routes; updating routes now",
              buf,
              2u);
          }

          v22 = [(RoutePlanningUpdater *)self session];
          v23 = [v13 currentRouteCollection];
          v24 = +[Result resultWithValue:v23];
          [v22 updateRouteCollectionResult:v24 forTransportType:[v13 currentTransportType]];
        }
      }
    }
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  [(RoutePlanningUpdater *)self setPause:a4 == 2];
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  [a4 error:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(RoutePlanningUpdater *)self _updateRefreshStateWithError:v5];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  [a4 error:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(RoutePlanningUpdater *)self _updateRefreshStateWithError:v6];
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  -[RoutePlanningUpdater _updateRefreshStateWithError:](self, "_updateRefreshStateWithError:", 0, a4, a5);
  if ([(RoutePlanningUpdater *)self shouldRefreshRoutesForCurrentLocation])
  {
    [(RoutePlanningUpdater *)self refreshRoutesForced:1];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "The route planning geo default is not enabled; will not update route",
        buf,
        2u);
    }
    goto LABEL_8;
  }
  if ([(RoutePlanningUpdater *)self isUpdatingRoute])
  {
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "A route update is already in progress; will not update route",
        buf,
        2u);
    }
LABEL_8:

    goto LABEL_9;
  }
  id v6 = [v4 currentLocation];

  if (!v6)
  {
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "We don't know what the user's current location is; will not update route",
        buf,
        2u);
    }
    goto LABEL_8;
  }
  if ([v4 isLastLocationStale])
  {
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v7 = [v4 currentLocation];
      *(_DWORD *)buf = 138412290;
      double v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "The user's current location is stale (%@); will not update route",
        buf,
        0xCu);
    }
    goto LABEL_8;
  }
  id v8 = [v4 currentLocation];
  [v8 horizontalAccuracy];
  double v10 = v9;
  GEOConfigGetDouble();
  double v12 = v11;

  if (v10 > v12)
  {
    id v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v13 = [v4 currentLocation];
      [v13 horizontalAccuracy];
      double v15 = v14;
      GEOConfigGetDouble();
      *(_DWORD *)buf = 134218240;
      double v34 = v15;
      __int16 v35 = 2048;
      uint64_t v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "The current location's horizontal accuracy (%f) is bigger than the threshold (%f); will not update route",
        buf,
        0x16u);
    }
    goto LABEL_8;
  }
  if ([(RoutePlanningUpdater *)self shouldRefreshRoutesForLocationManagerUpdate])
  {
    v17 = [v4 currentLocation];
    unsigned int v18 = [(RoutePlanningUpdater *)self shouldRefreshRoutesForUserLocation:v17];

    if (v18)
    {
      GEOConfigGetDouble();
      double v20 = v19;
      objc_initWeak(&location, self);
      v21 = sub_10054ADB0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Starting off route refresh timer with refresh interval: %f", buf, 0xCu);
      }

      id v22 = &_dispatch_main_q;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10054BA24;
      v30[3] = &unk_1012EA428;
      objc_copyWeak(&v31, &location);
      v30[4] = self;
      v23 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v30 block:v20];
      [(RoutePlanningUpdater *)self setOffRouteRefreshTimer:v23];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
  lastRefreshTime = self->_lastRefreshTime;
  if (lastRefreshTime)
  {
    [(NSDate *)lastRefreshTime timeIntervalSinceNow];
    double v26 = v25;
    GEOConfigGetDouble();
    if (v27 < -v26)
    {
      v28 = sub_10054ADB0();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        GEOConfigGetDouble();
        *(_DWORD *)buf = 134217984;
        double v34 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Route planning update frequency limit has been reached (%f); will refresh route now",
          buf,
          0xCu);
      }

      [(RoutePlanningUpdater *)self refreshRoutesForced:0];
    }
  }
LABEL_9:
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)shouldRefreshRoutesForLocationManagerUpdate
{
  if (GEOConfigGetBOOL())
  {
    BOOL v3 = [(RoutePlanningUpdater *)self session];
    id v4 = [(RoutePlanningUpdater *)self currentRouteCollection];
    id v5 = [v4 currentRoute];
    id v6 = [v5 origin];
    unsigned __int8 v7 = [v6 isCurrentLocation];

    if (v7)
    {
      id v8 = [v3 currentTransportType];
      double v9 = [(RoutePlanningUpdater *)self eligibleTransportTypes];
      double v10 = +[NSNumber numberWithInteger:v8];
      unsigned __int8 v11 = [v9 containsObject:v10];

      return v11;
    }
    id v13 = sub_10054ADB0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Route origin is not the user's current location; should not refresh routes",
        v14,
        2u);
    }
  }
  return 0;
}

- (BOOL)shouldRefreshRoutesForCurrentLocation
{
  if (!GEOConfigGetBOOL()) {
    return 0;
  }
  BOOL v3 = [(RoutePlanningUpdater *)self currentRouteCollection];
  id v4 = [v3 currentRoute];
  id v5 = [v4 origin];
  unsigned int v6 = [v5 isCurrentLocation];

  if (!v6) {
    return 0;
  }
  unsigned __int8 v7 = +[MKLocationManager sharedLocationManager];
  id v8 = [v7 currentLocation];
  BOOL v9 = [(RoutePlanningUpdater *)self shouldRefreshRoutesForUserLocation:v8];

  return v9;
}

- (BOOL)shouldRefreshRoutesForUserLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningUpdater *)self proximitySensor];
  [v5 updateForLocation:v4];

  unsigned int v6 = [(RoutePlanningUpdater *)self proximitySensor];
  id v7 = [v6 proximity];

  id v8 = sub_10054ADB0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got proximity from route: %lu", (uint8_t *)&v14, 0xCu);
  }

  BOOL v9 = sub_10054ADB0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((unint64_t)v7 > 1)
  {
    if (v10)
    {
      unsigned __int8 v11 = +[NSNumber numberWithUnsignedInteger:v7];
      int v14 = 138412290;
      id v15 = v11;
      double v12 = "Route proximity is NOT far nor unknown (%@); NOT scheduling route update";
      goto LABEL_8;
    }
  }
  else if (v10)
  {
    unsigned __int8 v11 = +[NSNumber numberWithUnsignedInteger:v7];
    int v14 = 138412290;
    id v15 = v11;
    double v12 = "Route proximity is far or unknown (%@); scheduling route update";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0xCu);
  }
  return (unint64_t)v7 < 2;
}

- (void)_updateRefreshStateWithError:(id)a3
{
  id v4 = a3;
  [(RoutePlanningUpdater *)self setProximitySensor:0];
  [(RoutePlanningUpdater *)self setUpdatingRoute:0];
  [(RoutePlanningUpdater *)self setOffRouteRefreshTimer:0];
  [(RoutePlanningUpdater *)self setPeriodicRouteRefreshTimer:0];
  id v5 = +[NSDate date];
  lastRefreshTime = self->_lastRefreshTime;
  self->_lastRefreshTime = v5;

  char BOOL = GEOConfigGetBOOL();
  if (v4 && (BOOL & 1) != 0
    || [(RoutePlanningUpdater *)self shouldRefreshRoutesForLocationManagerUpdate])
  {
    id v8 = sub_10054ADB0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "updating route state to enable updates", buf, 2u);
    }

    BOOL v9 = +[MKLocationManager sharedLocationManager];
    [v9 listenForLocationUpdates:self];

    [(RoutePlanningUpdater *)self _preparePeriodicRouteRefreshTimerWithError:v4];
  }
  else
  {
    BOOL v10 = sub_10054ADB0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "updating route state to disable updates", v12, 2u);
    }

    unsigned __int8 v11 = +[MKLocationManager sharedLocationManager];
    [v11 stopListeningForLocationUpdates:self];
  }
}

- (void)_preparePeriodicRouteRefreshTimerWithError:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_initWeak(&location, self);
    GEOConfigGetDouble();
    double v6 = v5;
    id v7 = sub_10054ADB0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      double v14 = v6;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Scheduling route refresh in %{public}f, error: %{public}@", buf, 0x16u);
    }

    id v8 = &_dispatch_main_q;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10054C1E0;
    v10[3] = &unk_1012EE850;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    BOOL v9 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v10 block:v6];
    [(RoutePlanningUpdater *)self setPeriodicRouteRefreshTimer:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_mapsForegrounded
{
  BOOL v3 = [(RoutePlanningUpdater *)self periodicRouteRefreshTimer];
  if (v3)
  {
  }
  else if ([(RoutePlanningUpdater *)self shouldRefreshRoutesForLocationManagerUpdate])
  {
    id v4 = sub_10054ADB0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Enabling periodicRouteRefreshTimer", v5, 2u);
    }

    [(RoutePlanningUpdater *)self _preparePeriodicRouteRefreshTimerWithError:0];
  }
}

- (void)_mapsBackgrounded
{
  BOOL v3 = [(RoutePlanningUpdater *)self periodicRouteRefreshTimer];

  if (v3)
  {
    id v4 = sub_10054ADB0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Disabling periodicRouteRefreshTimer", v5, 2u);
    }

    [(RoutePlanningUpdater *)self setPeriodicRouteRefreshTimer:0];
  }
}

- (void)_vlfSessionDidStop:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    double v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = [(RoutePlanningUpdater *)self session];
      if (v8
        && (unsigned int v9 = [v7 wasLastLocalizationSuccessful],
            v8,
            v9))
      {
        BOOL v10 = sub_10054ADB0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Detected VLF localized during route planning; waiting for another location update before force refreshing routes",
            buf,
            2u);
        }

        objc_initWeak((id *)buf, self);
        id v11 = +[MKLocationManager sharedLocationManager];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10054C850;
        v19[3] = &unk_1012EE878;
        objc_copyWeak(&v20, (id *)buf);
        double v12 = [v11 singleLocationUpdateWithHandler:v19];
        [v12 start];

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
      else if ([v7 wasLastLocalizationSuccessful])
      {
        id v13 = sub_10054ADB0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "VLF localized outside of route planning; ignoring",
            buf,
            2u);
        }
      }
    }
    else
    {
      double v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v22 = "-[RoutePlanningUpdater _vlfSessionDidStop:]";
        __int16 v23 = 2080;
        v24 = "RoutePlanningUpdater.m";
        __int16 v25 = 1024;
        int v26 = 345;
        __int16 v27 = 2080;
        v28 = "vlfSession != nil";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        __int16 v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          id v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v17 = sub_10054ADB0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = [v4 object];
        *(_DWORD *)buf = 138412290;
        id v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Expected notification object to be a VLFSession and it wasn't: %@", buf, 0xCu);
      }
      double v5 = 0;
    }
  }
  else
  {
    double v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF ended but the geo default to reload routes was off; ignoring",
        buf,
        2u);
    }
  }
}

- (void)refreshRoutesForced:(BOOL)a3
{
  if ([(RoutePlanningUpdater *)self isPaused])
  {
    double v5 = sub_10054ADB0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      double v6 = "Skipping route update, route planning is paused";
LABEL_18:
      double v12 = v5;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      goto LABEL_19;
    }
  }
  else
  {
    [(NSDate *)self->_lastRefreshTime timeIntervalSinceNow];
    double v8 = v7;
    [(NSDate *)self->_lastRefreshTime timeIntervalSinceNow];
    if (v8 >= 0.0) {
      double v10 = v9;
    }
    else {
      double v10 = -v9;
    }
    if (a3 || !self->_lastRefreshTime || (GEOConfigGetDouble(), v10 >= v11))
    {
      __int16 v15 = +[GEONetworkObserver sharedNetworkObserver];
      unsigned __int8 v16 = [v15 isNetworkReachable];

      if (v16)
      {
        unsigned __int8 v17 = [(RoutePlanningUpdater *)self isUpdatingRoute];
        unsigned int v18 = sub_10054ADB0();
        double v5 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v21) = 0;
            double v6 = "An existing route request is in progress; ignoring";
            double v12 = v5;
            os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
LABEL_19:
            uint32_t v14 = 2;
            goto LABEL_20;
          }
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            LOWORD(v21) = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "requesting route update", (uint8_t *)&v21, 2u);
          }

          double v19 = +[NSDate date];
          lastRefreshTime = self->_lastRefreshTime;
          self->_lastRefreshTime = v19;

          self->_performedInitialRefresh = 1;
          [(RoutePlanningUpdater *)self setUpdatingRoute:1];
          double v5 = [(RoutePlanningUpdater *)self session];
          [v5 requestUpdatedRouteWithRefreshedOrigin:1];
        }
      }
      else
      {
        double v5 = sub_10054ADB0();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          double v6 = "Skipping route update, device cannot reach network";
          goto LABEL_18;
        }
      }
    }
    else
    {
      double v5 = sub_10054ADB0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v21 = 134217984;
        double v22 = v10;
        double v6 = "Skipping route update, last refresh happened (%f) seconds ago";
        double v12 = v5;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        uint32_t v14 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v6, (uint8_t *)&v21, v14);
      }
    }
  }
}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      unsigned __int8 v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[RoutePlanningUpdater _networkReachabilityChanged:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "RoutePlanningUpdater.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v23) = 401;
        WORD2(v23) = 2080;
        *(void *)((char *)&v23 + 6) = "dispatch_get_main_queue()";
        HIWORD(v23) = 2080;
        v24 = (char *)dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        int v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          double v19 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  double v8 = [v4 userInfo];
  double v9 = [v8 objectForKey:GEONetworkObserverReachable];
  unsigned int v10 = [v9 BOOLValue];

  double v11 = sub_10054ADB0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    double v12 = @"NO";
    if (v10) {
      double v12 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    os_log_type_t v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Network reachability changed: %@", buf, 0xCu);
  }
  if (v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&long long v23 = sub_100103CDC;
    *((void *)&v23 + 1) = sub_1001046F8;
    v24 = 0;
    uint32_t v14 = [(RoutePlanningUpdater *)self session];
    __int16 v15 = [v14 currentRouteCollectionResult];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10054CFC4;
    v21[3] = &unk_1012EAC00;
    v21[4] = buf;
    [v15 withValue:&stru_1012EE8B8 orError:v21];

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      unsigned __int8 v16 = sub_10054ADB0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Network is now reachable and directions previously failed to load. Retrying.", v20, 2u);
      }

      [(RoutePlanningUpdater *)self refreshRoutesForced:1];
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4
{
  unsigned __int8 var0 = a4.var1.var0;
  id v6 = a3;
  BOOL v7 = v6;
  if (var0 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    double v9 = [WeakRetained waypointConfiguration];

    unsigned int v10 = [v9 origin];
    [v10 coordinate];
    GEOMapPointForCoordinate();
    double v12 = v11;
    double v14 = v13;

    __int16 v15 = [v9 destination];
    [v15 coordinate];
    GEOMapPointForCoordinate();
    double v17 = v16;
    double v19 = v18;

    id v20 = [(RoutePlanningUpdater *)self currentRouteCollection];
    int v21 = [v20 currentRoute];

    if (v21)
    {
      [v21 startRouteCoordinate];
      if (GEOPolylineCoordinateIsValid())
      {
        [v21 endRouteCoordinate];
        if (GEOPolylineCoordinateIsValid())
        {
          id v22 = [v21 startRouteCoordinate];
          id v23 = [v21 endRouteCoordinate];
          if (GEOPolylineCoordinateIsInvalid())
          {
            unsigned int v24 = LODWORD(GEOPolylineCoordinateInvalid[0]);
            float v25 = GEOPolylineCoordinateInvalid[1];
          }
          else
          {
            float v25 = *((float *)&v22 + 1) - floorf(*((float *)&v22 + 1));
            unsigned int v24 = vcvtms_u32_f32(*((float *)&v22 + 1)) + v22;
          }
          unint64_t v32 = v24 | ((unint64_t)LODWORD(v25) << 32);
          if (GEOPolylineCoordinateIsInvalid())
          {
            unsigned int v33 = LODWORD(GEOPolylineCoordinateInvalid[0]);
            float v34 = GEOPolylineCoordinateInvalid[1];
          }
          else
          {
            float v34 = *((float *)&v23 + 1) - floorf(*((float *)&v23 + 1));
            unsigned int v33 = vcvtms_u32_f32(*((float *)&v23 + 1)) + v23;
          }
          [v21 coarseBoundsForRange:v32, v33 | ((unint64_t)LODWORD(v34) << 32), 0, 0, 0, 0, 0, 0];
          goto LABEL_23;
        }
      }
    }
    double v26 = NAN;
    double v27 = -180.0;
    if (v12 < 0.0
      || v14 < 0.0
      || (double v28 = GEOMapRectWorld[2], v12 > v28)
      || (double v29 = GEOMapRectWorld[3], v14 > v29)
      || (double v26 = NAN, v17 < 0.0)
      || v19 < 0.0
      || v17 > v28)
    {
      double v30 = -180.0;
      double v31 = NAN;
    }
    else
    {
      double v30 = -180.0;
      double v31 = NAN;
      if (v19 <= v29)
      {
        *(double *)v47 = v12;
        *(double *)&v47[8] = v14;
        *(double *)&v47[16] = v17;
        double v48 = v19;
        GEOMapRectBoundingMapPoints();
LABEL_23:
        GEOCoordinateRegionForMapRect();
        double v27 = v35;
        double v30 = v36;
        double v26 = v37;
        double v31 = v38;
      }
    }
    if (v30 < -180.0
      || v30 > 180.0
      || v27 < -90.0
      || v27 > 90.0
      || v26 < 0.0
      || v26 > 180.0
      || v31 < 0.0
      || v31 > 360.0)
    {
      v41 = sub_10054ADB0();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = GEOOfflineModeAsString();
        v43 = [v21 uniqueRouteID];
        *(_DWORD *)v47 = 138412802;
        *(void *)&v47[4] = v42;
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v43;
        *(_WORD *)&v47[22] = 2112;
        double v48 = *(double *)&v9;
        v44 = "GEOOfflineService wouldLikeToSwitchToState to %@, Ignoring for route %@, configuration %@";
        v45 = v41;
        uint32_t v46 = 32;
        goto LABEL_36;
      }
    }
    else
    {
      v39 = +[GEOOfflineService shared];
      unsigned __int8 v40 = [v39 canUseOfflineForCoordinateRegion:v27, v30, v26, v31];

      [v7 delegate:self prefersMode:v40];
      v41 = sub_10054ADB0();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = GEOOfflineModeAsString();
        v43 = GEOOfflineModeAsString();
        *(_DWORD *)v47 = 138412546;
        *(void *)&v47[4] = v42;
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v43;
        v44 = "GEOOfflineService wouldLikeToSwitchToState to %@, RoutePlanningUpdater prefers %@";
        v45 = v41;
        uint32_t v46 = 22;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, v44, v47, v46);
      }
    }

    goto LABEL_38;
  }
  [v6 delegate:self prefersMode:var0];
LABEL_38:
}

- (RoutePlanningSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (RoutePlanningSession *)WeakRetained;
}

- (void)setProximitySensor:(id)a3
{
}

- (BOOL)isUpdatingRoute
{
  return self->_updatingRoute;
}

- (void)setUpdatingRoute:(BOOL)a3
{
  self->_updatingRoute = a3;
}

- (GCDTimer)offRouteRefreshTimer
{
  return self->_offRouteRefreshTimer;
}

- (void)setOffRouteRefreshTimer:(id)a3
{
}

- (GCDTimer)periodicRouteRefreshTimer
{
  return self->_periodicRouteRefreshTimer;
}

- (void)setPeriodicRouteRefreshTimer:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_pause;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicRouteRefreshTimer, 0);
  objc_storeStrong((id *)&self->_offRouteRefreshTimer, 0);
  objc_storeStrong((id *)&self->_proximitySensor, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_eligibleTransportTypes, 0);

  objc_storeStrong((id *)&self->_lastRefreshTime, 0);
}

@end