@interface WaypointController
- (BOOL)isRunning;
- (GEOMapServiceTraits)traitsForNextTask;
- (NSDictionary)waypointRequestResults;
- (NSMapTable)receivedResults;
- (NSMutableArray)tasks;
- (OS_dispatch_queue)isolationQueue;
- (OS_os_activity)activity;
- (Result)resolvedWaypointSetResult;
- (WaypointController)initWithConfiguration:(id)a3;
- (WaypointControllerConfiguration)configuration;
- (WaypointControllerDelegate)delegate;
- (void)_processTaskFinished:(id)a3;
- (void)_refreshDynamicOrigin;
- (void)_startOnIsolationQueue;
- (void)_stopOnIsolationQueue;
- (void)_submitTask:(id)a3;
- (void)rebroadcastWaypoints;
- (void)refresh;
- (void)refreshDynamicOrigin;
- (void)setActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReceivedResults:(id)a3;
- (void)setResolvedWaypointSetResult:(id)a3;
- (void)setTasks:(id)a3;
- (void)setTraitsForNextTask:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation WaypointController

- (WaypointController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = sub_100457EFC();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  v8 = sub_100457EFC();
  v9 = v8;
  if (v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v5 debugDescription];
    *(_DWORD *)buf = 138412546;
    v36 = v11;
    __int16 v37 = 2112;
    v38 = v12;
    v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v15 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v15);
    v12 = [v5 description];
    *(_DWORD *)buf = 138412546;
    v36 = v11;
    __int16 v37 = 2112;
    v38 = v12;
    v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ is being initialized: configuration=%@", buf, 0x16u);

LABEL_7:
  v34.receiver = self;
  v34.super_class = (Class)WaypointController;
  v16 = [(WaypointController *)&v34 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configuration, a3);
    v18 = [v5 traits];
    v19 = (GEOMapServiceTraits *)[v18 copy];
    traitsForNextTask = v17->_traitsForNextTask;
    v17->_traitsForNextTask = v19;

    [(GEOMapServiceTraits *)v17->_traitsForNextTask setRequestPurpose:1];
    v21 = +[NSBundle mainBundle];
    v22 = [v21 bundleIdentifier];
    v23 = +[NSString stringWithFormat:@"%@.WaypointController.%p", v22, v17];

    id v24 = v23;
    v25 = (const char *)[v24 UTF8String];
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    isolationQueue = v17->_isolationQueue;
    v17->_isolationQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = +[NSMapTable weakToStrongObjectsMapTable];
    receivedResults = v17->_receivedResults;
    v17->_receivedResults = (NSMapTable *)v29;

    uint64_t v31 = objc_opt_new();
    tasks = v17->_tasks;
    v17->_tasks = (NSMutableArray *)v31;
  }
  return v17;
}

- (void)start
{
  v3 = _os_activity_create((void *)&_mh_execute_header, "Resolve waypoints", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = sub_100457EFC();
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartFetchingGEOComposedWaypoint", "", (uint8_t *)buf, 2u);
  }

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"MapsWaypointResolutionDidBeginNotification" object:0];

  objc_initWeak(buf, self);
  v6 = [(WaypointController *)self isolationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100458100;
  v8[3] = &unk_1012E7ED0;
  v9 = v3;
  BOOL v7 = v3;
  objc_copyWeak(&v10, buf);
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);
}

- (void)_startOnIsolationQueue
{
  v3 = sub_100457EFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting waypoint fetching", buf, 2u);
  }

  v4 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v4);

  if ([(WaypointController *)self isRunning])
  {
    id v5 = sub_100457EFC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Asked to start fetching waypoints but we already started; ignoring",
        buf,
        2u);
    }
  }
  else
  {
    v6 = [(WaypointController *)self configuration];
    BOOL v7 = [v6 requests];
    id v8 = [v7 count];

    if ((unint64_t)v8 > 1)
    {
      v13 = [(WaypointController *)self tasks];
      [v13 removeAllObjects];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      os_log_type_t v14 = [(WaypointController *)self configuration];
      v15 = [v14 requests];

      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          v19 = 0;
          do
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [[ComposedWaypointTask alloc] initWithRequest:*(void *)(*((void *)&v30 + 1) + 8 * (void)v19)];
            v21 = [(WaypointController *)self tasks];
            [v21 addObject:v20];

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v17);
      }

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = [(WaypointController *)self tasks];
      id v22 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v27;
        do
        {
          v25 = 0;
          do
          {
            if (*(void *)v27 != v24) {
              objc_enumerationMutation(v5);
            }
            [(WaypointController *)self _submitTask:*(void *)(*((void *)&v26 + 1) + 8 * (void)v25)];
            v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v23);
      }
    }
    else
    {
      v9 = sub_100457EFC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot load waypoints with nil origin or destination; defaulting to a generic error.",
          buf,
          2u);
      }

      id v10 = +[NSError errorWithDomain:@"WaypointRequestErrorDomain" code:0 userInfo:0];
      v11 = +[Result resultWithError:v10];
      [(WaypointController *)self setResolvedWaypointSetResult:v11];

      id v5 = [(WaypointController *)self delegate];
      v12 = [(WaypointController *)self resolvedWaypointSetResult];
      [v5 waypointController:self didResolveWaypointSet:v12];
    }
  }
}

- (void)stop
{
  objc_initWeak(&location, self);
  v3 = [(WaypointController *)self isolationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100458608;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopOnIsolationQueue
{
  v3 = sub_100457EFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping waypoint fetching", buf, 2u);
  }

  v4 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v4);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(WaypointController *)self tasks];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) cancel];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(WaypointController *)self setActivity:0];
}

- (BOOL)isRunning
{
  v3 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(WaypointController *)self tasks];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isLoaded] & 1) == 0 && !objc_msgSend(v8, "isCancelled"))
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

- (void)refresh
{
  objc_initWeak(&location, self);
  v3 = [(WaypointController *)self isolationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100458998;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_submitTask:(id)a3
{
  id v4 = a3;
  id v5 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(WaypointController *)self receivedResults];
  [v6 setObject:0 forKey:v4];

  id v7 = [(WaypointController *)self tasks];
  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Waypoint%lu", [v7 indexOfObject:v4]);

  v9 = sub_100457EFC();
  long long v10 = (char *)os_signpost_id_generate(v9);

  long long v11 = sub_100457EFC();
  long long v12 = v11;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "FetchGEOComposedWaypoint", "%{public}@", buf, 0xCu);
  }

  long long v13 = sub_100457EFC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v14 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Fetching waypoint with identifier: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100458D20;
  v20[3] = &unk_1012EAB98;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = v10;
  id v15 = v8;
  id v21 = v15;
  id v16 = v4;
  id v22 = v16;
  id v17 = [(WaypointController *)self traitsForNextTask];
  [v16 submitWithHandler:v20 traits:v17 networkActivityHandler:0];

  uint64_t v18 = [(WaypointController *)self traitsForNextTask];
  id v19 = [v18 copyByIncrementingSessionCounters];
  [(WaypointController *)self setTraitsForNextTask:v19];

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

- (void)_processTaskFinished:(id)a3
{
  id v4 = a3;
  id v5 = sub_100457EFC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Processing currently finished waypoint tasks", buf, 2u);
  }

  uint64_t v6 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(WaypointController *)self tasks];
  BOOL v8 = [v7 count] == 0;

  if (!v8)
  {
    v9 = [(WaypointController *)self tasks];
    long long v10 = [v9 count];

    long long v11 = [(WaypointController *)self tasks];
    long long v12 = (char *)[v11 indexOfObject:v4];

    if (v12)
    {
      long long v13 = sub_100457EFC();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12 == v10 - 1)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Destination is ready", buf, 2u);
        }

        long long v13 = +[NSNotificationCenter defaultCenter];
        [v13 postNotificationName:@"MapsWaypointResolutionDidLoadDestinationNotification" object:0];
      }
      else if (v14)
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Waypoint %lu loaded", buf, 0xCu);
      }
    }
    else
    {
      id v15 = sub_100457EFC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Origin is ready", buf, 2u);
      }

      long long v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"MapsWaypointResolutionDidLoadOriginNotification" object:0];
    }

    id v16 = [(WaypointController *)self receivedResults];
    id v17 = [v16 objectForKey:v4];

    if ([v17 isSuccess])
    {
      uint64_t v18 = [(WaypointController *)self receivedResults];
      id v19 = [v18 count];

      if (v10 >= v19) {
        int64_t v20 = v10 - v19;
      }
      else {
        int64_t v20 = 0;
      }
      if (v10 <= v19)
      {
        id v21 = sub_100457EFC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "All waypoints are ready", buf, 2u);
        }

        id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
        id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
        uint64_t v24 = [(WaypointController *)self tasks];
        v49 = _NSConcreteStackBlock;
        uint64_t v50 = 3221225472;
        v51 = sub_10045980C;
        v52 = &unk_1012EAC78;
        v53 = self;
        id v25 = v22;
        id v54 = v25;
        id v26 = v23;
        id v55 = v26;
        [v24 enumerateObjectsUsingBlock:&v49];

        long long v27 = [WaypointSet alloc];
        long long v28 = -[WaypointSet initWithWaypoints:](v27, "initWithWaypoints:", v25, v49, v50, v51, v52, v53);
        long long v29 = +[Result resultWithValue:v28];
        [(WaypointController *)self setResolvedWaypointSetResult:v29];

        if ([v26 count])
        {
          long long v30 = sub_100457EFC();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            id v31 = [v26 count];
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v26;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Found %lu errors while processing finished waypoint tasks: %@", buf, 0x16u);
          }
        }
      }
      long long v32 = [(WaypointController *)self resolvedWaypointSetResult];
      BOOL v33 = v32 == 0;

      objc_super v34 = sub_100457EFC();
      v35 = v34;
      if (v33)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Still waiting for %lu waypoints to load; do nothing for now",
            buf,
            0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v36 = [(WaypointController *)self resolvedWaypointSetResult];
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Finished resolving %lu waypoints: %@", buf, 0x16u);
        }
        __int16 v37 = [(WaypointController *)self delegate];
        v38 = [(WaypointController *)self resolvedWaypointSetResult];
        [v37 waypointController:self didResolveWaypointSet:v38];
      }
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v39 = [(WaypointController *)self tasks];
      id v40 = [v39 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v58;
        do
        {
          v42 = 0;
          do
          {
            if (*(void *)v58 != v41) {
              objc_enumerationMutation(v39);
            }
            id v43 = *(id *)(*((void *)&v57 + 1) + 8 * (void)v42);
            if (v43 != v4) {
              [v43 cancel];
            }
            v42 = (char *)v42 + 1;
          }
          while (v40 != v42);
          id v40 = [v39 countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v40);
      }

      [(WaypointController *)self setTasks:0];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v66 = sub_100103C1C;
      v67 = sub_100104698;
      id v68 = 0;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1004597FC;
      v56[3] = &unk_1012EAC00;
      v56[4] = buf;
      [v17 withValue:&stru_1012EABD8 orError:v56];
      v44 = +[Result resultWithError:*(void *)(*(void *)&buf[8] + 40)];
      [(WaypointController *)self setResolvedWaypointSetResult:v44];

      v45 = sub_100457EFC();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v61 = 134218242;
        id v62 = v12;
        __int16 v63 = 2112;
        uint64_t v64 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Will stop waypoint refinement, error loading waypoint %lu: %@", v61, 0x16u);
      }

      v47 = [(WaypointController *)self delegate];
      v48 = [(WaypointController *)self resolvedWaypointSetResult];
      [v47 waypointController:self didResolveWaypointSet:v48];

      _Block_object_dispose(buf, 8);
    }
  }
}

- (NSDictionary)waypointRequestResults
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = sub_100103C1C;
  long long v11 = sub_100104698;
  id v12 = (id)objc_opt_new();
  v3 = [(WaypointController *)self isolationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100459B08;
  v6[3] = &unk_1012E67C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)refreshDynamicOrigin
{
  objc_initWeak(&location, self);
  v3 = [(WaypointController *)self isolationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100459E00;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_refreshDynamicOrigin
{
  v3 = [(WaypointController *)self isolationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WaypointController *)self configuration];
  id v5 = [v4 origin];
  unsigned int v6 = [v5 isCurrentLocation];

  uint64_t v7 = sub_100457EFC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Refreshing dynamic origin waypoint", buf, 2u);
    }

    uint64_t v9 = [ComposedWaypointTask alloc];
    long long v10 = [(WaypointController *)self configuration];
    long long v11 = [v10 origin];
    uint64_t v7 = [(ComposedWaypointTask *)v9 initWithRequest:v11];

    id v12 = [(WaypointController *)self tasks];
    [v12 replaceObjectAtIndex:0 withObject:v7];

    [(WaypointController *)self _submitTask:v7];
  }
  else if (v8)
  {
    *(_WORD *)long long v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "The origin is not the user's current location; will not refresh dynamic origin",
      v13,
      2u);
  }
}

- (void)rebroadcastWaypoints
{
  objc_initWeak(&location, self);
  v3 = [(WaypointController *)self isolationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10045A13C;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (WaypointControllerConfiguration)configuration
{
  return self->_configuration;
}

- (WaypointControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WaypointControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (Result)resolvedWaypointSetResult
{
  return (Result *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResolvedWaypointSetResult:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (NSMutableArray)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
}

- (NSMapTable)receivedResults
{
  return self->_receivedResults;
}

- (void)setReceivedResults:(id)a3
{
}

- (GEOMapServiceTraits)traitsForNextTask
{
  return self->_traitsForNextTask;
}

- (void)setTraitsForNextTask:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_traitsForNextTask, 0);
  objc_storeStrong((id *)&self->_receivedResults, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_resolvedWaypointSetResult, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end