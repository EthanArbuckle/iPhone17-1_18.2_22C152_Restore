@interface RouteLoadingController
- (BOOL)isActive;
- (BOOL)isActiveForTransportType:(int64_t)a3;
- (NSDictionary)routesResults;
- (NSMutableDictionary)activeTasks;
- (NSMutableDictionary)mutableRoutesResults;
- (NSSet)supportedTransportTypes;
- (NSString)activeTasksSync;
- (NSString)routesResultsSync;
- (RouteLoadingController)initWithWaypointSet:(id)a3 taskFactory:(id)a4;
- (RouteLoadingControllerDelegate)delegate;
- (RouteLoadingTaskFactory)routeLoadingTaskFactory;
- (RouteUpdatingTask)routeUpdatingTask;
- (WaypointSet)waypointSet;
- (id)_routeLoadingTaskForTransportType:(int64_t)a3;
- (id)routesForTransportType:(int64_t)a3;
- (int64_t)transportTypeForRealtimeUpdates;
- (void)_handleResults:(id)a3;
- (void)_updateTaskForRealtimeUpdates;
- (void)cancelLoading;
- (void)cancelLoadingForTransportType:(int64_t)a3;
- (void)refreshRoutesForTransportType:(int64_t)a3;
- (void)setActiveTasks:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMutableRoutesResults:(id)a3;
- (void)setRouteUpdatingTask:(id)a3;
- (void)setTransportTypeForRealtimeUpdates:(int64_t)a3;
- (void)setWaypointSet:(id)a3;
@end

@implementation RouteLoadingController

- (RouteLoadingController)initWithWaypointSet:(id)a3 taskFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RouteLoadingController;
  v9 = [(RouteLoadingController *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_waypointSet, a3);
    objc_storeStrong((id *)&v10->_routeLoadingTaskFactory, a4);
    v11 = +[NSBundle mainBundle];
    v12 = [v11 bundleIdentifier];
    v13 = +[NSString stringWithFormat:@"%@.%@.%p", v12, objc_opt_class(), v10];

    uint64_t v14 = +[NSString stringWithFormat:@"%@.activeTasksSync", v13];
    activeTasksSync = v10->_activeTasksSync;
    v10->_activeTasksSync = (NSString *)v14;

    uint64_t v16 = +[NSString stringWithFormat:@"%@.routesResultsSync", v13];
    routesResultsSync = v10->_routesResultsSync;
    v10->_routesResultsSync = (NSString *)v16;

    uint64_t v18 = objc_opt_new();
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    mutableRoutesResults = v10->_mutableRoutesResults;
    v10->_mutableRoutesResults = (NSMutableDictionary *)v20;
  }
  return v10;
}

- (NSSet)supportedTransportTypes
{
  v2 = [(RouteLoadingController *)self routeLoadingTaskFactory];
  v3 = [v2 supportedTransportTypes];

  return (NSSet *)v3;
}

- (void)cancelLoading
{
  id obj = [(RouteLoadingController *)self activeTasksSync];
  objc_sync_enter(obj);
  v3 = [(RouteLoadingController *)self activeTasks];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_1012F7B28];

  v4 = [(RouteLoadingController *)self activeTasks];
  [v4 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)cancelLoadingForTransportType:(int64_t)a3
{
  id obj = [(RouteLoadingController *)self activeTasksSync];
  objc_sync_enter(obj);
  v5 = [(RouteLoadingController *)self activeTasks];
  v6 = +[NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];
  [v7 cancel];

  id v8 = [(RouteLoadingController *)self activeTasks];
  v9 = +[NSNumber numberWithInteger:a3];
  [v8 removeObjectForKey:v9];

  objc_sync_exit(obj);
}

- (BOOL)isActive
{
  v3 = [(RouteLoadingController *)self activeTasksSync];
  objc_sync_enter(v3);
  v4 = [(RouteLoadingController *)self activeTasks];
  BOOL v5 = [v4 count] != 0;

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)isActiveForTransportType:(int64_t)a3
{
  v3 = [(RouteLoadingController *)self _routeLoadingTaskForTransportType:a3];
  v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 inProgress];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setWaypointSet:(id)a3
{
  unsigned __int8 v5 = (WaypointSet *)a3;
  if (self->_waypointSet != v5)
  {
    v6 = v5;
    [(RouteLoadingController *)self cancelLoading];
    objc_storeStrong((id *)&self->_waypointSet, a3);
    unsigned __int8 v5 = v6;
  }
}

- (NSDictionary)routesResults
{
  v3 = [(RouteLoadingController *)self routesResultsSync];
  objc_sync_enter(v3);
  v4 = [(RouteLoadingController *)self mutableRoutesResults];
  id v5 = [v4 copy];

  objc_sync_exit(v3);

  return (NSDictionary *)v5;
}

- (id)routesForTransportType:(int64_t)a3
{
  id v5 = [(RouteLoadingController *)self routesResultsSync];
  objc_sync_enter(v5);
  v6 = [(RouteLoadingController *)self mutableRoutesResults];
  id v7 = +[NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);

  return v8;
}

- (void)refreshRoutesForTransportType:(int64_t)a3
{
  id v5 = [(RouteLoadingController *)self supportedTransportTypes];
  v6 = +[NSNumber numberWithInteger:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    if ([(RouteLoadingController *)self isActiveForTransportType:a3]) {
      [(RouteLoadingController *)self cancelLoadingForTransportType:a3];
    }
    id v8 = sub_1005768D4();
    v9 = (char *)os_signpost_id_generate(v8);

    v10 = sub_1005768D4();
    v11 = v10;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "RouteLoading", "", (uint8_t *)buf, 2u);
    }

    v12 = [(RouteLoadingController *)self waypointSet];
    [v12 count];
    switch(a3)
    {
      case 0:
        if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
          goto LABEL_10;
        }
        break;
      case 1:
        MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
        break;
      case 2:
LABEL_10:
        MapsFeature_IsEnabled_Maps182();
        break;
      case 5:
        MapsFeature_IsEnabled_Maps420();
        break;
      default:
        break;
    }
    v13 = [(RouteLoadingController *)self routeLoadingTaskFactory];
    uint64_t v14 = [v13 taskForTransportType:a3 waypointSet:v12];

    v15 = [(RouteLoadingController *)self activeTasksSync];
    objc_sync_enter(v15);
    uint64_t v16 = [(RouteLoadingController *)self activeTasks];
    v17 = +[NSNumber numberWithInteger:a3];
    [v16 setObject:v14 forKeyedSubscript:v17];

    objc_sync_exit(v15);
    objc_initWeak(buf, self);
    uint64_t v18 = +[GEONotificationPreferenceManager sharedManager];
    LODWORD(v15) = [v18 isEnabledForSubTestWithName:@"GEOPPTTest_RouteManager_DirectionsRequest"];

    if (v15)
    {
      v19 = +[NSNotificationCenter defaultCenter];
      [v19 postNotificationName:@"GEOPPTTest_RouteManager_DirectionsRequestBEGIN" object:0];
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1007685E8;
    v20[3] = &unk_1012F7B70;
    v21[1] = v9;
    objc_copyWeak(v21, buf);
    v21[2] = (id)a3;
    [v14 startWithCompletionHandler:v20];
    objc_destroyWeak(v21);
    objc_destroyWeak(buf);
  }
}

- (id)_routeLoadingTaskForTransportType:(int64_t)a3
{
  id v5 = [(RouteLoadingController *)self activeTasksSync];
  objc_sync_enter(v5);
  v6 = [(RouteLoadingController *)self activeTasks];
  unsigned int v7 = +[NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);

  return v8;
}

- (void)setTransportTypeForRealtimeUpdates:(int64_t)a3
{
  if (self->_transportTypeForRealtimeUpdates != a3)
  {
    id v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = self->_transportTypeForRealtimeUpdates - 1;
      if (v6 > 4) {
        CFStringRef v7 = @"Undefined";
      }
      else {
        CFStringRef v7 = off_1012F7BF8[v6];
      }
      if ((unint64_t)(a3 - 1) > 4) {
        CFStringRef v8 = @"Undefined";
      }
      else {
        CFStringRef v8 = off_1012F7BF8[a3 - 1];
      }
      int v9 = 138543618;
      CFStringRef v10 = v7;
      __int16 v11 = 2114;
      CFStringRef v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating transport type for realtime updates: %{public}@ -> %{public}@", (uint8_t *)&v9, 0x16u);
    }

    self->_transportTypeForRealtimeUpdates = a3;
    [(RouteLoadingController *)self _updateTaskForRealtimeUpdates];
  }
}

- (void)_updateTaskForRealtimeUpdates
{
  v3 = [(RouteLoadingController *)self activeTasksSync];
  objc_sync_enter(v3);
  v4 = [(RouteLoadingController *)self routeUpdatingTask];
  [v4 stop];

  [(RouteLoadingController *)self setRouteUpdatingTask:0];
  objc_sync_exit(v3);

  if ([(RouteLoadingController *)self transportTypeForRealtimeUpdates])
  {
    id v5 = [(RouteLoadingController *)self routesForTransportType:[(RouteLoadingController *)self transportTypeForRealtimeUpdates]];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100768CC8;
    v6[3] = &unk_1012F0F88;
    v6[4] = self;
    [v5 withValue:v6 orError:&stru_1012F7B90];
  }
}

- (void)_handleResults:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v20 = self;
    v22 = [(RouteLoadingController *)self routesForTransportType:[(RouteLoadingController *)self transportTypeForRealtimeUpdates]];
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateWillUpdateRoute" object:0 userInfo:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    id v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CFStringRef v12 = [v11 routeID];
          v13 = [v11 transitUpdate];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10076917C;
          v23[3] = &unk_1012F7BB8;
          id v24 = v12;
          id v25 = v13;
          id v26 = v5;
          id v27 = v6;
          id v14 = v13;
          id v15 = v12;
          [v22 withValue:v23 orError:&stru_1012F7BD8];
        }
        id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }

    +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateDidUpdateRoute" object:0 userInfo:0];
    uint64_t v16 = [(RouteLoadingController *)v20 delegate];
    id v17 = [v6 copy];
    id v18 = [v5 copy];
    v19 = +[Result resultWithValue:v18];
    [v16 routeLoadingController:v20 didReceiveUpdates:v17 forRoutesResult:v19];
  }
}

- (RouteLoadingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteLoadingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RouteLoadingTaskFactory)routeLoadingTaskFactory
{
  return self->_routeLoadingTaskFactory;
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (int64_t)transportTypeForRealtimeUpdates
{
  return self->_transportTypeForRealtimeUpdates;
}

- (NSMutableDictionary)activeTasks
{
  return self->_activeTasks;
}

- (void)setActiveTasks:(id)a3
{
}

- (NSMutableDictionary)mutableRoutesResults
{
  return self->_mutableRoutesResults;
}

- (void)setMutableRoutesResults:(id)a3
{
}

- (RouteUpdatingTask)routeUpdatingTask
{
  return self->_routeUpdatingTask;
}

- (void)setRouteUpdatingTask:(id)a3
{
}

- (NSString)activeTasksSync
{
  return self->_activeTasksSync;
}

- (NSString)routesResultsSync
{
  return self->_routesResultsSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesResultsSync, 0);
  objc_storeStrong((id *)&self->_activeTasksSync, 0);
  objc_storeStrong((id *)&self->_routeUpdatingTask, 0);
  objc_storeStrong((id *)&self->_mutableRoutesResults, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_waypointSet, 0);
  objc_storeStrong((id *)&self->_routeLoadingTaskFactory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end