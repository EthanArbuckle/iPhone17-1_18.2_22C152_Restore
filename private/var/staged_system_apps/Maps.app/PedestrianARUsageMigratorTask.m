@interface PedestrianARUsageMigratorTask
+ (int64_t)creationPreference;
- (NavigationSession)navigationSession;
- (PedestrianARSessionUsageTracker)usageTracker;
- (PedestrianARUsageMigratorTask)initWithUsageTracker:(id)a3;
- (RouteCollection)routeCollection;
- (RoutePlanningSession)routePlanningSession;
- (void)dealloc;
- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setNavigationSession:(id)a3;
- (void)setRouteCollection:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)setUsageTracker:(id)a3;
@end

@implementation PedestrianARUsageMigratorTask

- (PedestrianARUsageMigratorTask)initWithUsageTracker:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v14 = "-[PedestrianARUsageMigratorTask initWithUsageTracker:]";
      __int16 v15 = 2080;
      v16 = "PedestrianARUsageMigratorTask.m";
      __int16 v17 = 1024;
      int v18 = 45;
      __int16 v19 = 2080;
      v20 = "usageTracker != nil";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PedestrianARUsageMigratorTask;
  v6 = [(PedestrianARUsageMigratorTask *)&v12 init];
  if (v6)
  {
    v7 = sub_100109FA0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v14 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_usageTracker, a3);
  }

  return v6;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = sub_100109FA0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARUsageMigratorTask;
  [(PedestrianARUsageMigratorTask *)&v4 dealloc];
}

- (void)setRoutePlanningSession:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_routePlanningSession);
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id obj = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
      [WeakRetained removeObserver:self];

      id v9 = objc_storeWeak((id *)&self->_routePlanningSession, obj);
      [obj addObserver:self];

      unint64_t v6 = (unint64_t)obj;
    }
  }
}

- (void)setNavigationSession:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_navigationSession);
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id obj = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);
      [WeakRetained removeObserver:self];

      id v9 = objc_storeWeak((id *)&self->_navigationSession, obj);
      [obj addObserver:self];

      unint64_t v6 = (unint64_t)obj;
    }
  }
}

- (void)setRouteCollection:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_routeCollection;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [(RouteCollection *)self->_routeCollection currentRoute];
      v10 = [v9 uniqueRouteID];
      v11 = [v10 UUIDString];

      objc_super v12 = [(id)v7 currentRoute];
      v13 = [v12 uniqueRouteID];
      v14 = [v13 UUIDString];

      if (v11 && v14 && ([v11 isEqualToString:v14] & 1) == 0)
      {
        __int16 v15 = sub_100109FA0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = 134349056;
          __int16 v17 = self;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Detected route ID changed; migrating usage flags now",
            (uint8_t *)&v16,
            0xCu);
        }

        [(PedestrianARSessionUsageTracker *)self->_usageTracker migrateUsageFromRoute:v11 toRoute:v14];
      }
      objc_storeStrong((id *)&self->_routeCollection, a3);
    }
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  id v8 = v7;
  [(PedestrianARUsageMigratorTask *)self setRoutePlanningSession:v8];

  id v15 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v15;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  [(PedestrianARUsageMigratorTask *)self setNavigationSession:v10];
  v11 = [(PedestrianARUsageMigratorTask *)self routePlanningSession];
  objc_super v12 = [v11 currentRouteCollection];
  if (v12)
  {
    [(PedestrianARUsageMigratorTask *)self setRouteCollection:v12];
  }
  else
  {
    v13 = [(PedestrianARUsageMigratorTask *)self navigationSession];
    v14 = [v13 currentRouteCollection];
    [(PedestrianARUsageMigratorTask *)self setRouteCollection:v14];
  }
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v6 = [a3 currentRouteCollection];
  [(PedestrianARUsageMigratorTask *)self setRouteCollection:v6];
}

- (PedestrianARSessionUsageTracker)usageTracker
{
  return self->_usageTracker;
}

- (void)setUsageTracker:(id)a3
{
}

- (RoutePlanningSession)routePlanningSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);

  return (RoutePlanningSession *)WeakRetained;
}

- (NavigationSession)navigationSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);

  return (NavigationSession *)WeakRetained;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_destroyWeak((id *)&self->_routePlanningSession);

  objc_storeStrong((id *)&self->_usageTracker, 0);
}

@end