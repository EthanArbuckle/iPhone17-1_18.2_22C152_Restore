@interface PedestrianARSessionRoutePlanningConfigurationMonitor
+ (BOOL)isEnabled;
+ (id)friendlyName;
- (NSString)debugDescription;
- (PedestrianARSessionRoutePlanningConfigurationMonitor)initWithObserver:(id)a3 platformController:(id)a4;
- (PlatformController)platformController;
- (RoutePlanningSession)routePlanningSession;
- (void)dealloc;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setPlatformController:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionRoutePlanningConfigurationMonitor

- (void)updateState
{
  v3 = sub_10001441C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134349056;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating state", (uint8_t *)&v19, 0xCu);
  }

  v4 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];

  if (v4)
  {
    v5 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];
    v6 = [v5 resolvedWaypoints];
    v7 = [v6 origin];
    unsigned int v8 = [v7 isCurrentLocation];

    v9 = sub_10001441C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (v8) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      v11 = v10;
      int v19 = 134349314;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Is origin current location: %@", (uint8_t *)&v19, 0x16u);
    }
    v12 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];
    v13 = [v12 currentRouteCollection];
    id v14 = [v13 count];

    v15 = sub_10001441C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (v14) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      v17 = v16;
      int v19 = 134349314;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Has a route: %@", (uint8_t *)&v19, 0x16u);
    }
    if (v14) {
      uint64_t v18 = v8;
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }
  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v18];
}

- (PedestrianARSessionRoutePlanningConfigurationMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[PedestrianARSessionRoutePlanningConfigurationMonitor initWithObserver:platformController:]";
      __int16 v18 = 2080;
      int v19 = "PedestrianARSessionRoutePlanningConfigurationMonitor.m";
      __int16 v20 = 1024;
      int v21 = 37;
      __int16 v22 = 2080;
      v23 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARSessionRoutePlanningConfigurationMonitor;
  unsigned int v8 = [(PedestrianARSessionMonitor *)&v15 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_10001441C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v17 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v10 = objc_storeWeak((id *)&v8->_platformController, v7);
    [v7 addObserver:v8];

    [(PedestrianARSessionRoutePlanningConfigurationMonitor *)v8 updateState];
  }

  return v8;
}

- (RoutePlanningSession)routePlanningSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);

  return (RoutePlanningSession *)WeakRetained;
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  v3 = sub_10001441C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    unsigned int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  [WeakRetained removeObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionRoutePlanningConfigurationMonitor;
  [(PedestrianARSessionMonitor *)&v6 dealloc];
}

- (void)setRoutePlanningSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001441C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating route planning session: %@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  [WeakRetained removeObserver:self];

  id v7 = objc_storeWeak((id *)&self->_routePlanningSession, v4);
  [v4 addObserver:self];
}

- (NSString)debugDescription
{
  v3 = [(id)objc_opt_class() friendlyName];
  v16 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];
  if (v16) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v5 = v4;
  objc_super v6 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];
  id v7 = [v6 resolvedWaypoints];
  int v8 = [v7 origin];
  if ([v8 isCurrentLocation]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  __int16 v10 = v9;
  id v11 = [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self routePlanningSession];
  v12 = [v11 currentRouteCollection];
  if (v12) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  id v14 = +[NSString stringWithFormat:@"%@\nis in route planning: %@\nis origin current location: %@\nhas route: %@\n", v3, v5, v10, v13];

  return (NSString *)v14;
}

+ (id)friendlyName
{
  return @"Route Planning Configuration Monitor";
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v6 = v8;
  }
  else {
    objc_super v6 = 0;
  }
  id v7 = v6;
  [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self setRoutePlanningSession:v7];

  [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self updateState];
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  id v5 = a4;
  objc_super v6 = sub_10001441C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning session finished resolving waypoints: %@", (uint8_t *)&v7, 0x16u);
  }

  [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self updateState];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v7 = a4;
  id v8 = sub_10001441C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(a5 - 1) > 4) {
      CFStringRef v9 = @"Undefined";
    }
    else {
      CFStringRef v9 = off_1012F06D8[a5 - 1];
    }
    int v10 = 134349570;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning session updated its route collection: %@ for transport type: %@", (uint8_t *)&v10, 0x20u);
  }

  [(PedestrianARSessionRoutePlanningConfigurationMonitor *)self updateState];
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
  objc_destroyWeak((id *)&self->_routePlanningSession);

  objc_destroyWeak((id *)&self->_platformController);
}

@end