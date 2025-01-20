@interface NavdRouteCollectionUpdateProvider
- (MNNavigationService)navigationService;
- (NavdRouteCollectionUpdateProvider)initWithNavigationService:(id)a3 routeCollection:(id)a4;
- (RouteCollection)currentRouteCollection;
- (RouteCollectionUpdateProviderDelegate)delegate;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5;
- (void)setCurrentRouteCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)updateRoute:(id)a3;
@end

@implementation NavdRouteCollectionUpdateProvider

- (NavdRouteCollectionUpdateProvider)initWithNavigationService:(id)a3 routeCollection:(id)a4
{
  id v7 = a3;
  v8 = (RouteCollection *)a4;
  v23.receiver = self;
  v23.super_class = (Class)NavdRouteCollectionUpdateProvider;
  v9 = [(NavdRouteCollectionUpdateProvider *)&v23 init];
  if (v9)
  {
    v10 = sub_100473DEC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_navigationService, a3);
    v11 = [(MNNavigationService *)v9->_navigationService route];

    if (v11)
    {
      v12 = [(MNNavigationService *)v9->_navigationService route];
      v13 = +[NSMutableArray arrayWithObject:v12];

      v14 = [(MNNavigationService *)v9->_navigationService alternateRoutes];
      [v13 addObjectsFromArray:v14];

      v15 = [[RouteCollection alloc] initWithRoutes:v13 currentRouteIndex:0];
      currentRouteCollection = v9->_currentRouteCollection;
      v9->_currentRouteCollection = v15;

      v17 = sub_100473DEC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349314;
        v25 = v9;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] navd already has a route; using it: %@",
          buf,
          0x16u);
      }
    }
    else
    {
      objc_storeStrong((id *)&v9->_currentRouteCollection, a4);
      v13 = sub_100473DEC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349314;
        v25 = v9;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] using provided route collection: %@", buf, 0x16u);
      }
    }

    if (v8 && ![v9->_currentRouteCollection isEqual:v8])
    {
      v20 = sub_100473DEC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349570;
        v25 = v9;
        __int16 v26 = 2112;
        v27 = v8;
        __int16 v28 = 2112;
        v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] route collections don't match: routeCollection=%@, _currentRouteCollection=%@", buf, 0x20u);
      }
    }
    [(MNNavigationService *)v9->_navigationService registerObserver:v9];
    [(MNNavigationService *)v9->_navigationService openForClient:v9];
  }

  return v9;
}

- (void)dealloc
{
  v3 = sub_100473DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4 = [(NavdRouteCollectionUpdateProvider *)self navigationService];
  [v4 unregisterObserver:self];

  v5 = [(NavdRouteCollectionUpdateProvider *)self navigationService];
  [v5 closeForClient:self];

  v6.receiver = self;
  v6.super_class = (Class)NavdRouteCollectionUpdateProvider;
  [(NavdRouteCollectionUpdateProvider *)&v6 dealloc];
}

- (void)updateRoute:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NavdRouteCollectionUpdateProvider *)self currentRouteCollection];
    id v6 = [v5 indexOfRoute:v4];

    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [(NavdRouteCollectionUpdateProvider *)self currentRouteCollection];
      v11 = [v10 routeCollectionByChangingCurrentRouteIndex:v6];
      [(NavdRouteCollectionUpdateProvider *)self setCurrentRouteCollection:v11];

      goto LABEL_8;
    }
    id v7 = [RouteCollection alloc];
    id v12 = v4;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    v9 = [(RouteCollection *)v7 initWithRoutes:v8 currentRouteIndex:0];

    [(NavdRouteCollectionUpdateProvider *)self setCurrentRouteCollection:v9];
  }
  else
  {
    v9 = sub_100473DEC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] updateRoute: received nil route", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)setCurrentRouteCollection:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_currentRouteCollection;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = sub_100473DEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(id)v7 shortDescription];
        int v12 = 134349314;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Updating route collection: %@", (uint8_t *)&v12, 0x16u);
      }
      objc_storeStrong((id *)&self->_currentRouteCollection, a3);
      v11 = [(NavdRouteCollectionUpdateProvider *)self delegate];
      [v11 routeCollectionUpdateProvider:self didUpdateRouteCollection:self->_currentRouteCollection];
    }
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if ((MNNavigationServiceStateIsNavigating() & 1) == 0)
  {
    int IsNavigating = MNNavigationServiceStateIsNavigating();
    if (a5 == 3 || IsNavigating)
    {
      unsigned __int8 v8 = sub_100473DEC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v14 = 134349056;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] State changed to active guidance", (uint8_t *)&v14, 0xCu);
      }

      v9 = +[NSMutableArray array];
      v10 = [(MNNavigationService *)self->_navigationService route];
      if (v10)
      {
        [v9 addObject:v10];
        v11 = [(MNNavigationService *)self->_navigationService alternateRoutes];
        [v9 addObjectsFromArray:v11];

        int v12 = [[RouteCollection alloc] initWithRoutes:v9 currentRouteIndex:0];
        [(NavdRouteCollectionUpdateProvider *)self setCurrentRouteCollection:v12];
      }
      else
      {
        sub_100473DEC();
        int v12 = (RouteCollection *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
        {
          navigationService = self->_navigationService;
          int v14 = 134349314;
          v15 = self;
          __int16 v16 = 2112;
          v17 = navigationService;
          _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "[%{public}p] MNNavigationService (%@) does not have a route", (uint8_t *)&v14, 0x16u);
        }
      }
    }
  }
}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(NavdRouteCollectionUpdateProvider *)self currentRouteCollection];
  id v10 = [v9 routeCollectionByReplacingAlternateComposedRoutes:v8 withTraffics:v7];

  [(NavdRouteCollectionUpdateProvider *)self setCurrentRouteCollection:v10];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (RouteCollectionUpdateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteCollectionUpdateProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RouteCollection)currentRouteCollection
{
  return self->_currentRouteCollection;
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
  objc_storeStrong((id *)&self->_currentRouteCollection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end