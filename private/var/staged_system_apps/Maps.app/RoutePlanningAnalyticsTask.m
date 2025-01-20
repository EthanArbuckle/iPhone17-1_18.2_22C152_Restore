@interface RoutePlanningAnalyticsTask
+ (int64_t)creationPreference;
- (RouteCollection)routeCollection;
- (RoutePlanningSession)routePlanningSession;
- (int)analyticsTarget;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setRouteCollection:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
@end

@implementation RoutePlanningAnalyticsTask

+ (int64_t)creationPreference
{
  return 2;
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

      routeCollection = self->_routeCollection;
      self->_routeCollection = 0;

      unint64_t v6 = (unint64_t)obj;
    }
  }
}

- (int)analyticsTarget
{
  v2 = [(RoutePlanningAnalyticsTask *)self routePlanningSession];
  id v3 = [v2 currentTransportType];

  int result = 302;
  switch((unint64_t)v3)
  {
    case 0uLL:
      unint64_t v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315650;
        id v9 = "-[RoutePlanningAnalyticsTask analyticsTarget]";
        __int16 v10 = 2080;
        v11 = "RoutePlanningAnalyticsTask.m";
        __int16 v12 = 1024;
        int v13 = 64;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v8, 0x1Cu);
      }

      int result = sub_100BB36BC();
      if (result)
      {
        unint64_t v6 = sub_1005762E4();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v7 = +[NSThread callStackSymbols];
          int v8 = 138412290;
          id v9 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
        }
        int result = 0;
      }
      break;
    case 1uLL:
      int result = 301;
      break;
    case 3uLL:
      int result = 303;
      break;
    case 4uLL:
      int result = 304;
      break;
    case 5uLL:
      int result = 305;
      break;
    default:
      return result;
  }
  return result;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = v8;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;
  [(RoutePlanningAnalyticsTask *)self setRoutePlanningSession:v7];
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isSuccess] && objc_msgSend(v8, "currentTransportType") == (id)a5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100104380;
    v22 = sub_100104A30;
    id v23 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100B2697C;
    v17[3] = &unk_1012EED18;
    v17[4] = &v18;
    [v9 withValue:v17 orError:&stru_1013184D0];
    if (!v19[5])
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v25 = "-[RoutePlanningAnalyticsTask routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
        __int16 v26 = 2080;
        v27 = "RoutePlanningAnalyticsTask.m";
        __int16 v28 = 1024;
        int v29 = 89;
        __int16 v30 = 2080;
        v31 = "routeCollection != nil";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    __int16 v10 = [(id)v19[5] routes];
    v11 = [(RoutePlanningAnalyticsTask *)self routeCollection];
    __int16 v12 = [v11 routes];
    unsigned __int8 v13 = [v10 isEqualToArray:v12];

    [(RoutePlanningAnalyticsTask *)self setRouteCollection:v19[5]];
    if ((v13 & 1) == 0) {
      +[GEOAPPortal captureUserAction:3039 target:[(RoutePlanningAnalyticsTask *)self analyticsTarget] value:0];
    }
    _Block_object_dispose(&v18, 8);
  }
}

- (RoutePlanningSession)routePlanningSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);

  return (RoutePlanningSession *)WeakRetained;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);

  objc_destroyWeak((id *)&self->_routePlanningSession);
}

@end