@interface RoutePlanningServerEnvrionmentChangeRouteRefreshTask
+ (int64_t)creationPreference;
- (RoutePlanningServerEnvrionmentChangeRouteRefreshTask)init;
- (RoutePlanningSession)routePlanningSession;
- (void)dealloc;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setRoutePlanningSession:(id)a3;
@end

@implementation RoutePlanningServerEnvrionmentChangeRouteRefreshTask

+ (int64_t)creationPreference
{
  return 2;
}

- (RoutePlanningServerEnvrionmentChangeRouteRefreshTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningServerEnvrionmentChangeRouteRefreshTask;
  v2 = [(RoutePlanningServerEnvrionmentChangeRouteRefreshTask *)&v6 init];
  if (v2)
  {
    v3 = sub_100409B34();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v4 = +[GEOResourceManifestManager modernManager];
    [v4 addTileGroupObserver:v2 queue:&_dispatch_main_q];
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100409B34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4 = +[GEOResourceManifestManager modernManager];
  [v4 removeTileGroupObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningServerEnvrionmentChangeRouteRefreshTask;
  [(RoutePlanningServerEnvrionmentChangeRouteRefreshTask *)&v5 dealloc];
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
  [(RoutePlanningServerEnvrionmentChangeRouteRefreshTask *)self setRoutePlanningSession:v7];
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 environment];
  v10 = [v8 environment];
  unint64_t v11 = v9;
  unint64_t v12 = v10;
  if (v11 | v12)
  {
    v13 = (void *)v12;
    unsigned __int8 v14 = [(id)v11 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      v15 = sub_100409B34();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [v8 environment];
        v17 = [v7 environment];
        int v21 = 134349571;
        v22 = self;
        __int16 v23 = 2113;
        v24 = v16;
        __int16 v25 = 2113;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Environment changed %{private}@ -> %{private}@", (uint8_t *)&v21, 0x20u);
      }
      v18 = [(RoutePlanningServerEnvrionmentChangeRouteRefreshTask *)self routePlanningSession];

      if (v18)
      {
        v19 = sub_100409B34();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v21 = 134349056;
          v22 = self;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Requesting new routes", (uint8_t *)&v21, 0xCu);
        }

        v20 = [(RoutePlanningServerEnvrionmentChangeRouteRefreshTask *)self routePlanningSession];
        [v20 requestUpdatedRouteWithRefreshedOrigin:0];
      }
    }
  }
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void)setRoutePlanningSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end