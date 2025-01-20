@interface ICPlayActivityServer
+ (id)PlayActivityStorageDirectoryPath;
+ (id)sharedInstance;
- (BOOL)_isValidTimeInterval:(double)a3;
- (BOOL)hasPendingPlayEvents;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICPlayActivityServer)init;
- (id)_criteriaDictionaryWithPostFrequency:(double)a3;
- (id)_init;
- (void)_dispatchCompletionHandler:(id)a3 withError:(id)a4;
- (void)_handleFlushRequestNotification:(id)a3;
- (void)_scheduleNextPlayActivityFlushOperationWithCriteria:(id)a3;
- (void)_timeIntervalForNextFlushOperationWithReplyBlock:(id)a3;
- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3;
- (void)insertPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation ICPlayActivityServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_flushOperationQueue, 0);
  objc_storeStrong((id *)&self->_debugLogOperationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_scheduleNextPlayActivityFlushOperationWithCriteria:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CA1BC;
  v5[3] = &unk_1001BCE28;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  xpc_activity_register("com.apple.itunescloudd.flushPlayactivityEventsBackgroundTask", XPC_ACTIVITY_CHECK_IN, v5);
}

- (BOOL)_isValidTimeInterval:(double)a3
{
  id v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  BOOL v6 = v5 < a3;

  return v6;
}

- (id)_criteriaDictionaryWithPostFrequency:(double)a3
{
  if (self->_nextFlushPlayActivityFireSyncInterval == 0.0 && self->_testNextFlushPlayActivityFireSyncInterval == 0.0)
  {
    double v5 = +[NSDate date];
    BOOL v6 = [v5 dateByAddingTimeInterval:a3];

    [v6 timeIntervalSinceNow];
    double v8 = v7;
    v9 = [v6 dateByAddingTimeInterval:900.0];
    [v9 timeIntervalSince1970];
    self->_double testNextFlushPlayActivityFireSyncInterval = v10;

    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REPEATING, 0);
    xpc_dictionary_set_int64(v11, XPC_ACTIVITY_DELAY, (uint64_t)v8);
    xpc_dictionary_set_int64(v11, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
    xpc_dictionary_set_string(v11, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_double(v11, "CloudPlayActivityListenerNextFlushPlayActivityFireDateKey", (double)(uint64_t)self->_testNextFlushPlayActivityFireSyncInterval);
    v12 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[NSDate dateWithTimeIntervalSince1970:self->_testNextFlushPlayActivityFireSyncInterval];
      int v17 = 138543874;
      v18 = self;
      __int16 v19 = 2114;
      double v20 = *(double *)&v6;
      __int16 v21 = 2114;
      double v22 = *(double *)&v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating new criteria to fire on %{public}@ with grace period till %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double nextFlushPlayActivityFireSyncInterval = self->_nextFlushPlayActivityFireSyncInterval;
      double testNextFlushPlayActivityFireSyncInterval = self->_testNextFlushPlayActivityFireSyncInterval;
      int v17 = 138543874;
      v18 = self;
      __int16 v19 = 2048;
      double v20 = nextFlushPlayActivityFireSyncInterval;
      __int16 v21 = 2048;
      double v22 = testNextFlushPlayActivityFireSyncInterval;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not creating a new criteria for flush play activity events nextFlushPlayActivityFireSyncInterval (%f), testNextFlushPlayActivityFireSyncInterval (%f)", (uint8_t *)&v17, 0x20u);
    }
    xpc_object_t v11 = 0;
  }

  return v11;
}

- (void)_timeIntervalForNextFlushOperationWithReplyBlock:(id)a3
{
  id v4 = (void (**)(void, double))a3;
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x408C200000000000;
  double v5 = +[ICUserIdentity activeAccount];
  if (v5)
  {
    id v6 = [objc_alloc((Class)ICStoreRequestContext) initWithIdentity:v5];
    double v7 = +[ICURLBagProvider sharedBagProvider];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000CABD0;
    v10[3] = &unk_1001BCE00;
    v12 = &v13;
    v10[4] = self;
    xpc_object_t v11 = v4;
    [v7 getBagForRequestContext:v6 withCompletionHandler:v10];
  }
  else
  {
    double v8 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *((void *)v14 + 3);
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ No active user identity - using default value (%f) to update the criteria to flush play activity events", buf, 0x16u);
    }

    if (v4) {
      v4[2](v4, v14[3]);
    }
  }

  _Block_object_dispose(&v13, 8);
}

- (BOOL)hasPendingPlayEvents
{
  v2 = self->_table;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000CAEFC;
  v10[4] = sub_1000CAF0C;
  id v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CAF14;
  v6[3] = &unk_1001BCDD8;
  v3 = v2;
  double v7 = v3;
  double v8 = &v12;
  uint64_t v9 = v10;
  [(ICPlayActivityTable *)v3 performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v4;
}

- (void)_dispatchCompletionHandler:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CB038;
    v9[3] = &unk_1001BEC48;
    id v11 = v6;
    id v10 = v7;
    dispatch_async(queue, v9);
  }
}

- (void)_handleFlushRequestNotification:(id)a3
{
  if (MSVDeviceOSIsInternalInstall())
  {
    [(ICPlayActivityServer *)self flushPendingPlayActivityEventsWithCompletionHandler:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  BOOL v7 = sub_1000C4430(v5, @"com.apple.itunesstored.private");
  if (v7)
  {
    double v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICPlayActivityServerProtocol];
    [v5 setExportedInterface:v8];
    uint64_t v9 = objc_opt_class();
    id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    [v8 setClasses:v10 forSelector:"insertPlayActivityEvents:shouldFlush:withCompletionHandler:" argumentIndex:0 ofReply:0];

    [v5 setExportedObject:self];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CB3C8;
    v16[3] = &unk_1001BEE28;
    v16[4] = self;
    unsigned int v17 = v6;
    [v5 setInterruptionHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000CB48C;
    v14[3] = &unk_1001BEE28;
    v14[4] = self;
    unsigned int v15 = v6;
    [v5 setInvalidationHandler:v14];
    [v5 resume];
  }
  else
  {
    double v8 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      __int16 v22 = 2080;
      v23 = "com.apple.itunescloudd.playactivity";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ pid %i is not entitled to connect to %s", buf, 0x1Cu);
    }
  }

  id v11 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = "will not";
    *(_DWORD *)buf = 138543874;
    __int16 v19 = self;
    if (v7) {
      uint64_t v12 = "will";
    }
    __int16 v20 = 1024;
    unsigned int v21 = v6;
    __int16 v22 = 2080;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ connection from pid %i %s be accepted", buf, 0x1Cu);
  }

  return v7;
}

- (void)insertPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ Recording play activity events: %@", buf, 0x16u);
  }

  if ([v8 count])
  {
    id v11 = self->_table;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v28 = sub_1000CAEFC;
    v29 = sub_1000CAF0C;
    id v30 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000CB8C4;
    v20[3] = &unk_1001BCDB0;
    id v12 = v8;
    id v21 = v12;
    v23 = v25;
    uint64_t v13 = v11;
    __int16 v22 = v13;
    v24 = buf;
    [(ICPlayActivityTable *)v13 performTransactionWithBlock:v20];
    if (CFPreferencesGetAppBooleanValue(@"ShouldDebugLogRecordedEvents", @"com.apple.PlayActivityFeed", 0))
    {
      debugLogOperationQueue = self->_debugLogOperationQueue;
      if (!debugLogOperationQueue)
      {
        unsigned int v15 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
        uint64_t v16 = self->_debugLogOperationQueue;
        self->_debugLogOperationQueue = v15;

        [(NSOperationQueue *)self->_debugLogOperationQueue setMaxConcurrentOperationCount:1];
        [(NSOperationQueue *)self->_debugLogOperationQueue setName:@"com.apple.iTunesCloud.ICPlayActivityController.debugLogOperationQueue"];
        [(NSOperationQueue *)self->_debugLogOperationQueue setQualityOfService:17];
        debugLogOperationQueue = self->_debugLogOperationQueue;
      }
      unsigned int v17 = debugLogOperationQueue;
      v18 = objc_alloc_init(ICPlayActivityDebugLogOperation);
      [(ICPlayActivityDebugLogOperation *)v18 setPlayActivityEvents:v12];
      [(NSOperationQueue *)v17 addOperation:v18];
    }
    if (v6)
    {
      [(ICPlayActivityServer *)self flushPendingPlayActivityEventsWithCompletionHandler:v9];
    }
    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000CBA7C;
      v19[3] = &unk_1001BCD60;
      v19[4] = self;
      [(ICPlayActivityServer *)self _timeIntervalForNextFlushOperationWithReplyBlock:v19];
      if (v9) {
        v9[2](v9, 0);
      }
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(ICPlayActivityServer *)self _dispatchCompletionHandler:v9 withError:0];
  }
}

- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  ++self->_flushOperationCount;
  id v5 = [[ICFlushPlayActivityEventsOperation alloc] initWithPlayActivityTable:self->_table];
  objc_initWeak(&location, v5);
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t flushOperationCount = self->_flushOperationCount;
    double nextFlushPlayActivityFireSyncInterval = self->_nextFlushPlayActivityFireSyncInterval;
    double testNextFlushPlayActivityFireSyncInterval = self->_testNextFlushPlayActivityFireSyncInterval;
    *(_DWORD *)buf = 138544130;
    __int16 v20 = self;
    __int16 v21 = 2048;
    int64_t v22 = flushOperationCount;
    __int16 v23 = 2048;
    double v24 = nextFlushPlayActivityFireSyncInterval;
    __int16 v25 = 2048;
    double v26 = testNextFlushPlayActivityFireSyncInterval;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ starting operation for flush play activity events pendingOperationCount %lld, nextFlushPlayActivityFireSyncInterval %f, _testNextFlushPlayActivityFireSyncInterval %f ", buf, 0x2Au);
  }

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1000CBD30;
  uint64_t v14 = &unk_1001BCD88;
  objc_copyWeak(&v17, &location);
  unsigned int v15 = self;
  id v10 = v4;
  id v16 = v10;
  [(ICFlushPlayActivityEventsOperation *)v5 setCompletionBlock:&v11];
  -[NSOperationQueue addOperation:](self->_flushOperationQueue, "addOperation:", v5, v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)stop
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ....", (uint8_t *)&v4, 0xCu);
  }

  [(NSXPCListener *)self->_listener invalidate];
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ....", (uint8_t *)&v4, 0xCu);
  }

  [(NSXPCListener *)self->_listener resume];
  [(ICPlayActivityServer *)self _scheduleNextPlayActivityFlushOperationWithCriteria:0];
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)ICPlayActivityServer;
  v2 = [(ICPlayActivityServer *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_int64_t flushOperationCount = 0;
    v2->_double nextFlushPlayActivityFireSyncInterval = 0.0;
    v2->_double testNextFlushPlayActivityFireSyncInterval = 0.0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunescloudd.playactivityserver", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    BOOL v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    flushOperationQueue = v3->_flushOperationQueue;
    v3->_flushOperationQueue = v6;

    [(NSOperationQueue *)v3->_flushOperationQueue setName:@"com.apple.itunescloudd.CloudPlayActivityServer.flushOperationQueue"];
    [(NSOperationQueue *)v3->_flushOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_flushOperationQueue setQualityOfService:17];
    id v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.itunescloudd.playactivity"];
    listener = v3->_listener;
    v3->_listener = v8;

    [(NSXPCListener *)v3->_listener setDelegate:v3];
    id v10 = (ICPlayActivityTable *)objc_alloc_init((Class)ICPlayActivityTable);
    table = v3->_table;
    v3->_table = v10;

    uint64_t v12 = +[NSDistributedNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"_handleFlushRequestNotification:" name:@"com.apple.itunescloud.ICPlayActivityFlushInternalTestRequestNotification" object:0];
  }
  return v3;
}

- (ICPlayActivityServer)init
{
  return 0;
}

+ (id)PlayActivityStorageDirectoryPath
{
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"com.apple.iTunesCloud", @"play_activity", 0);
  v3 = +[NSString pathWithComponents:v2];

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1001F3950 != -1) {
    dispatch_once(&qword_1001F3950, &stru_1001BCD10);
  }
  id v2 = (void *)qword_1001F3958;

  return v2;
}

@end