@interface RouteUpdatingNavigationServiceTask
- (BOOL)_shouldUseNavigationServiceForRoutes:(id)a3;
- (RouteUpdatingNavigationServiceTask)initWithRoutes:(id)a3;
- (void)_createTransitRouteUpdaterIfNeeded;
- (void)_didEnterBackground;
- (void)_pauseUpdates;
- (void)_refreshUpdateEnabledForCurrentState;
- (void)_resumeUpdates;
- (void)_updateRouteUpdateObservationIfNeededWithRoutes:(id)a3;
- (void)_willEnterForeground;
- (void)dealloc;
- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4;
- (void)navigationService:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5;
- (void)startWithUpdateHandler:(id)a3;
- (void)stop;
- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4;
@end

@implementation RouteUpdatingNavigationServiceTask

- (RouteUpdatingNavigationServiceTask)initWithRoutes:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RouteUpdatingNavigationServiceTask;
  v5 = [(RouteUpdatingNavigationServiceTask *)&v26 init];
  if (v5)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 bundleIdentifier];
    v8 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v7, objc_opt_class(), v5];

    id v9 = v8;
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v12;

    id v14 = objc_alloc((Class)NSSet);
    v15 = sub_100099700(v4, &stru_1012F1420);
    v16 = (NSSet *)[v14 initWithArray:v15];
    routeIDs = v5->_routeIDs;
    v5->_routeIDs = v16;

    id v18 = objc_alloc((Class)NSSet);
    v19 = sub_100099700(v4, &stru_1012F1460);
    v20 = (NSSet *)[v18 initWithArray:v19];
    routeUpdateRequests = v5->_routeUpdateRequests;
    v5->_routeUpdateRequests = v20;

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v5 selector:"_didEnterBackground" name:MKApplicationStateDidEnterBackgroundNotification object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v5 selector:"_willEnterForeground" name:MKApplicationStateWillEnterForegroundNotification object:0];

    v24 = +[MKApplicationStateMonitor sharedInstance];
    [v24 startObserving];
  }
  return v5;
}

- (void)dealloc
{
  [(GEOTransitRouteUpdater *)self->_transitRouteUpdater setActive:0];
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  id v4 = +[MKApplicationStateMonitor sharedInstance];
  [v4 stopObserving];

  v5.receiver = self;
  v5.super_class = (Class)RouteUpdatingNavigationServiceTask;
  [(RouteUpdatingNavigationServiceTask *)&v5 dealloc];
}

- (void)startWithUpdateHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005C7B4C;
  block[3] = &unk_1012F1488;
  id v9 = &v10;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  dispatch_sync(isolationQueue, block);
  if (!*((unsigned char *)v11 + 24))
  {
    [(RouteUpdatingNavigationServiceTask *)self _updateRouteUpdateObservationIfNeededWithRoutes:0];
    [(RouteUpdatingNavigationServiceTask *)self _refreshUpdateEnabledForCurrentState];
  }

  _Block_object_dispose(&v10, 8);
}

- (void)stop
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005C7CC0;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  if (!*((unsigned char *)v7 + 24))
  {
    [(GEOTransitRouteUpdater *)self->_transitRouteUpdater setActive:0];
    id v4 = +[MNNavigationService sharedService];
    [v4 unregisterObserver:self];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)_didEnterBackground
{
}

- (void)_willEnterForeground
{
}

- (void)_pauseUpdates
{
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005C7D78;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)_resumeUpdates
{
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005C7F58;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)_refreshUpdateEnabledForCurrentState
{
  v3 = +[MKApplicationStateMonitor sharedInstance];
  unsigned int v4 = [v3 isInBackground];

  if (v4)
  {
    [(RouteUpdatingNavigationServiceTask *)self _pauseUpdates];
  }
  else if (self->_transitRouteUpdater {
         || (+[MNNavigationService sharedService],
  }
             objc_super v5 = objc_claimAutoreleasedReturnValue(),
             id v6 = [v5 state],
             v5,
             v6 == (id)2))
  {
    [(RouteUpdatingNavigationServiceTask *)self _resumeUpdates];
  }
}

- (BOOL)_shouldUseNavigationServiceForRoutes:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_super v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      routeIDs = self->_routeIDs;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = routeIDs;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Forcing use of local updater for routes: %@", (uint8_t *)&buf, 0xCu);
    }
    unsigned __int8 v7 = 0;
  }
  else
  {
    if (!v4)
    {
      unsigned __int8 v7 = 1;
      goto LABEL_8;
    }
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
    objc_super v5 = sub_100099700(v4, &stru_1012F14A8);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    v15 = sub_100103D7C;
    v16 = sub_100104748;
    id v17 = 0;
    isolationQueue = self->_isolationQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1005C8394;
    v12[3] = &unk_1012E73F0;
    v12[4] = self;
    v12[5] = &buf;
    dispatch_sync(isolationQueue, v12);
    char v9 = *(void **)(*((void *)&buf + 1) + 40);
    uint64_t v10 = +[NSSet setWithArray:v5];
    unsigned __int8 v7 = [v9 isEqualToSet:v10];

    _Block_object_dispose(&buf, 8);
  }

LABEL_8:
  return v7;
}

- (void)_updateRouteUpdateObservationIfNeededWithRoutes:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(isolationQueue);
  unsigned __int8 v6 = [(RouteUpdatingNavigationServiceTask *)self _shouldUseNavigationServiceForRoutes:v5];

  unsigned __int8 v7 = +[MNNavigationService sharedService];
  uint64_t v8 = v7;
  if (v6)
  {
    [v7 registerObserver:self];

    char v9 = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005C84E0;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_sync(v9, block);
  }
  else
  {
    [v7 unregisterObserver:self];

    [(RouteUpdatingNavigationServiceTask *)self _createTransitRouteUpdaterIfNeeded];
  }
}

- (void)_createTransitRouteUpdaterIfNeeded
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005C863C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)navigationService:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  [(RouteUpdatingNavigationServiceTask *)self _updateRouteUpdateObservationIfNeededWithRoutes:a4];

  [(RouteUpdatingNavigationServiceTask *)self _refreshUpdateEnabledForCurrentState];
}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if ([v6 count])
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = sub_100103D7C;
    v41 = sub_100104748;
    id v42 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_1005C8BA0;
    v35 = sub_1005C8BCC;
    id v36 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005C8BD4;
    block[3] = &unk_1012F14D0;
    block[4] = self;
    void block[5] = &v37;
    block[6] = &v31;
    dispatch_sync(isolationQueue, block);
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count:v25]];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v9);
          }
          char v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = (void *)v38[5];
            v15 = [v13 routeID];
            LODWORD(v14) = [v14 containsObject:v15];

            if (v14)
            {
              id v16 = v13;
              id v17 = [v16 routeID];
              id v18 = [v16 transitUpdate];
              v19 = +[RouteUpdatingTaskResult resultWithRouteID:v17 transitUpdate:v18];

              [v8 addObject:v19];
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v47 count:16];
      }
      while (v10);
    }

    if ([v8 count])
    {
      v20 = sub_1005768D4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v8 count];
        uint64_t v22 = v38[5];
        *(_DWORD *)long long buf = 134218242;
        id v44 = v21;
        __int16 v45 = 2112;
        uint64_t v46 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Received %lu navd realtime updates for routes: %@", buf, 0x16u);
      }

      uint64_t v23 = v32[5];
      id v24 = [v8 copy];
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v24);
    }
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
}

- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if (v6)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = sub_100103D7C;
    v43 = sub_100104748;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = sub_1005C8BA0;
    uint64_t v37 = sub_1005C8BCC;
    id v38 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005C901C;
    block[3] = &unk_1012F14D0;
    block[4] = self;
    void block[5] = &v39;
    block[6] = &v33;
    dispatch_sync(isolationQueue, block);
    id v8 = objc_alloc((Class)NSMutableArray);
    [v6 routeUpdates:v27];
    id v10 = [v8 initWithCapacity:[v9 count]];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = [v6 routeUpdates];
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v16 = (void *)v40[5];
          id v17 = [v15 routeIdentifier];
          id v18 = [v17 clientRouteID];
          LOBYTE(v16) = [v16 containsObject:v18];

          if (v16)
          {
            v19 = [v15 routeIdentifier];
            v20 = [v19 clientRouteID];
            id v21 = +[RouteUpdatingTaskResult resultWithRouteID:v20 transitUpdate:v15];

            [v10 addObject:v21];
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v49 count:16];
      }
      while (v12);
    }

    if ([v10 count])
    {
      uint64_t v22 = sub_1005768D4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = [v10 count];
        uint64_t v24 = v40[5];
        *(_DWORD *)long long buf = 134218242;
        id v46 = v23;
        __int16 v47 = 2112;
        uint64_t v48 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Received %lu private realtime updates for routes: %@", buf, 0x16u);
      }

      uint64_t v25 = v34[5];
      id v26 = [v10 copy];
      (*(void (**)(uint64_t, id))(v25 + 16))(v25, v26);
    }
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdater, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeUpdateRequests, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end