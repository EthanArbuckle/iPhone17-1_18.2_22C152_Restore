@interface PedestrianARSessionRouteDistanceMonitor
+ (BOOL)isEnabled;
+ (id)friendlyName;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MKLocationManager)locationManager;
- (MNNavigationService)navigationService;
- (NSString)debugDescription;
- (PedestrianARSessionRouteDistanceMonitor)initWithObserver:(id)a3 platformController:(id)a4 navigationService:(id)a5 locationManager:(id)a6;
- (PlatformController)platformController;
- (RoutePlanningSession)routePlanningSession;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setLocationManager:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionRouteDistanceMonitor

- (void)setRoutePlanningSession:(id)a3
{
  v4 = (RoutePlanningSession *)a3;
  [(RoutePlanningSession *)self->_routePlanningSession removeObserver:self];
  routePlanningSession = self->_routePlanningSession;
  self->_routePlanningSession = v4;
  v6 = v4;

  [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
  v7 = self->_routePlanningSession;
  v8 = [(PedestrianARSessionRouteDistanceMonitor *)self locationManager];
  id v9 = v8;
  if (v7) {
    [v8 listenForLocationUpdates:self];
  }
  else {
    [v8 stopListeningForLocationUpdates:self];
  }
}

- (PedestrianARSessionRouteDistanceMonitor)initWithObserver:(id)a3 platformController:(id)a4 navigationService:(id)a5 locationManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v34 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      __int16 v35 = 2080;
      v36 = "PedestrianARSessionRouteDistanceMonitor.m";
      __int16 v37 = 1024;
      int v38 = 54;
      __int16 v39 = 2080;
      v40 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v34 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v12)
  {
    v26 = sub_1005762E4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v34 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      __int16 v35 = 2080;
      v36 = "PedestrianARSessionRouteDistanceMonitor.m";
      __int16 v37 = 1024;
      int v38 = 55;
      __int16 v39 = 2080;
      v40 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v27 = sub_1005762E4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v34 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v13)
  {
    v29 = sub_1005762E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v34 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      __int16 v35 = 2080;
      v36 = "PedestrianARSessionRouteDistanceMonitor.m";
      __int16 v37 = 1024;
      int v38 = 56;
      __int16 v39 = 2080;
      v40 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v30 = sub_1005762E4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v34 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)PedestrianARSessionRouteDistanceMonitor;
  v14 = [(PedestrianARSessionMonitor *)&v32 initWithObserver:v10];
  if (v14)
  {
    v15 = sub_100010D00();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v34 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v16 = objc_storeWeak((id *)&v14->_platformController, v11);
    [v11 addObserver:v14];

    objc_storeWeak((id *)&v14->_locationManager, v13);
    id v17 = objc_storeWeak((id *)&v14->_navigationService, v12);
    [v12 registerObserver:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v19 = [WeakRetained currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    [(PedestrianARSessionRouteDistanceMonitor *)v14 setRoutePlanningSession:v21];
    [(PedestrianARSessionRouteDistanceMonitor *)v14 updateState];
  }

  return v14;
}

- (void)updateState
{
  v3 = [(PedestrianARSessionRouteDistanceMonitor *)self routePlanningSession];

  if (!v3)
  {
    v18 = [(PedestrianARSessionRouteDistanceMonitor *)self navigationService];
    unint64_t v19 = (unint64_t)[v18 state];
    if (v19 <= 6 && ((1 << v19) & 0x47) != 0)
    {

      v20 = sub_100010D00();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      id v21 = [(PedestrianARSessionRouteDistanceMonitor *)self navigationService];
      [v21 state];
      MNNavigationServiceStateAsString();
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v45 = self;
      __int16 v46 = 2112;
      double v47 = *(double *)&v22;
      v23 = "[%{public}p] We are not in route planning nor in a pedestrian AR navigation state (%@); will not interfere w"
            "ith feature availability";
    }
    else
    {

      v30 = sub_100010D00();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v45 = self;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during active guidance", buf, 0xCu);
      }

      v31 = [(PedestrianARSessionRouteDistanceMonitor *)self navigationService];
      unsigned int v32 = [v31 navigationTransportType];

      if (v32 == 2)
      {
        v33 = [(PedestrianARSessionRouteDistanceMonitor *)self navigationService];
        v8 = [v33 lastLocation];

        if (v8)
        {
          v14 = [v8 routeMatch];
          goto LABEL_8;
        }
        v20 = sub_100010D00();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v45 = self;
          v27 = "[%{public}p] We are navigating but do not have a last location estimate; will not interfere with feature availability";
          goto LABEL_21;
        }
LABEL_24:

        v28 = self;
        uint64_t v29 = 1;
        goto LABEL_25;
      }
      v20 = sub_100010D00();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      id v21 = [(PedestrianARSessionRouteDistanceMonitor *)self navigationService];
      id v42 = [v21 navigationTransportType];
      if (v42 >= 7)
      {
        v22 = +[NSString stringWithFormat:@"(unknown: %i)", v42];
      }
      else
      {
        v22 = off_10131B7D8[(int)v42];
      }
      *(_DWORD *)buf = 134349314;
      v45 = self;
      __int16 v46 = 2112;
      double v47 = *(double *)&v22;
      v23 = "[%{public}p] We are navigating with a non-walking transport type (%@); will not interfere with feature availability";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v23, buf, 0x16u);

    goto LABEL_24;
  }
  v4 = sub_100010D00();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v45 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during route planning", buf, 0xCu);
  }

  v5 = [(PedestrianARSessionRouteDistanceMonitor *)self routePlanningSession];
  id v6 = [v5 currentTransportType];

  if (v6 != (id)2)
  {
    v20 = sub_100010D00();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v24 = [(PedestrianARSessionRouteDistanceMonitor *)self routePlanningSession];
      v25 = (char *)[v24 currentTransportType];
      if ((unint64_t)(v25 - 1) > 4) {
        CFStringRef v26 = @"Undefined";
      }
      else {
        CFStringRef v26 = off_10131B810[(void)(v25 - 1)];
      }
      *(_DWORD *)buf = 134349314;
      v45 = self;
      __int16 v46 = 2112;
      double v47 = *(double *)&v26;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] We are route planning with a non-walking transport type (%@); will not interfere with feature availability",
        buf,
        0x16u);
    }
    goto LABEL_24;
  }
  v7 = [(PedestrianARSessionRouteDistanceMonitor *)self locationManager];
  v8 = [v7 lastLocation];

  if (!v8)
  {
    v20 = sub_100010D00();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v45 = self;
      v27 = "[%{public}p] We are in route planning but do not have a last location estimate; will not interfere with feat"
            "ure availability";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  id v9 = [(PedestrianARSessionRouteDistanceMonitor *)self routePlanningSession];
  id v10 = [v9 currentRouteCollection];
  id v11 = [v10 currentRoute];

  if (v11)
  {
    id v12 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v8];
    id v13 = [objc_alloc((Class)GEORouteMatcher) initWithRoute:v11 auditToken:0];
    v14 = [v13 matchToRouteWithLocation:v12];

LABEL_8:
    GEOConfigGetDouble();
    if (v15 >= 0.0)
    {
      double v17 = v15;
      __int16 v35 = sub_100010D00();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        v45 = self;
        __int16 v46 = 2048;
        double v47 = v17;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%{public}p] Using debug overridden distance value: %f", buf, 0x16u);
      }

      goto LABEL_37;
    }
    if (v14)
    {
      [v14 distanceFromRoute];
      double v17 = v16;
LABEL_37:
      GEOConfigGetDouble();
      double v37 = v36;
      int v38 = sub_100010D00();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (v17 >= v37)
      {
        if (v39)
        {
          *(_DWORD *)buf = 134349568;
          v45 = self;
          __int16 v46 = 2048;
          double v47 = v17;
          __int16 v48 = 2048;
          double v49 = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%{public}p] The user is too far from the route (%f >= %f); will not allow the feature to be visible",
            buf,
            0x20u);
        }

        v40 = self;
        uint64_t v41 = 0;
      }
      else
      {
        if (v39)
        {
          *(_DWORD *)buf = 134349568;
          v45 = self;
          __int16 v46 = 2048;
          double v47 = v17;
          __int16 v48 = 2048;
          double v49 = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%{public}p] The user is sufficiently close to the route (%f < %f); will allow the feature to be visible",
            buf,
            0x20u);
        }

        v40 = self;
        uint64_t v41 = 1;
      }
      [(PedestrianARSessionMonitor *)v40 setShouldShowPedestrianAR:v41];

      return;
    }
    v43 = sub_100010D00();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v45 = self;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%{public}p] We don't have a route match; will not allow the feature to be visible",
        buf,
        0xCu);
    }

    v28 = self;
    uint64_t v29 = 0;
LABEL_25:
    [(PedestrianARSessionMonitor *)v28 setShouldShowPedestrianAR:v29];
    return;
  }
  v34 = sub_100010D00();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v45 = self;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] We are in route planning but do not have a route; will not interfere with feature availability",
      buf,
      0xCu);
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:1];
}

- (MNNavigationService)navigationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);

  return (MNNavigationService *)WeakRetained;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (MKLocationManager)locationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationManager);

  return (MKLocationManager *)WeakRetained;
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  v3 = sub_100010D00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);
  [WeakRetained unregisterObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_locationManager);
  [v5 stopListeningForLocationUpdates:self];

  id v6 = objc_loadWeakRetained((id *)&self->_platformController);
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARSessionRouteDistanceMonitor;
  [(PedestrianARSessionMonitor *)&v7 dealloc];
}

- (NSString)debugDescription
{
  v2 = [(id)objc_opt_class() friendlyName];
  GEOConfigGetDouble();
  v4 = +[NSString stringWithFormat:@"%@\nmax distance threshold: %f\n", v2, v3];

  return (NSString *)v4;
}

+ (id)friendlyName
{
  return @"Route Distance Monitor";
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100010D00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 lastLocation];
    int v7 = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new location update: %@", (uint8_t *)&v7, 0x16u);
  }
  [(PedestrianARSessionRouteDistanceMonitor *)self updateState];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  int v7 = sub_100010D00();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new session: %@", (uint8_t *)&v11, 0x16u);
  }

  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v9 = v8;
  }
  else {
    __int16 v9 = 0;
  }
  id v10 = v9;

  [(PedestrianARSessionRouteDistanceMonitor *)self setRoutePlanningSession:v10];
  [(PedestrianARSessionRouteDistanceMonitor *)self updateState];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  int v7 = [(PedestrianARSessionRouteDistanceMonitor *)self routePlanningSession];
  id v8 = [v7 currentTransportType];

  if (v8 == (id)a5)
  {
    __int16 v9 = sub_100010D00();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134349056;
      int v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the route collection for the current transport type", (uint8_t *)&v10, 0xCu);
    }

    [(PedestrianARSessionRouteDistanceMonitor *)self updateState];
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  int v7 = sub_100010D00();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(a4 - 1) > 4) {
      CFStringRef v8 = @"Undefined";
    }
    else {
      CFStringRef v8 = off_10131B810[a4 - 1];
    }
    int v9 = 134349314;
    int v10 = self;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the current transport type: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PedestrianARSessionRouteDistanceMonitor *)self updateState];
}

- (void)setLocationManager:(id)a3
{
}

- (void)setNavigationService:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_destroyWeak((id *)&self->_navigationService);

  objc_destroyWeak((id *)&self->_locationManager);
}

@end