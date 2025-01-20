@interface GKNetworkRequestManager
+ (BOOL)entityIsReleaseStateAwareForBagKey:(id)a3;
+ (BOOL)useJSONForBagKey:(id)a3;
+ (Class)networkRequestClass:(id)a3;
+ (id)commonNetworkRequestManager;
+ (id)dictionaryFromTaskDescription:(id)a3;
+ (id)makeEntityCacheProviderInMemory:(BOOL)a3;
+ (id)makeEntityIDWithRequest:(id)a3 bagKey:(id)a4;
+ (id)networkRequestFromNsurlTask:(id)a3;
+ (id)taskWithRequest:(id)a3 description:(id)a4 session:(id)a5;
+ (id)uuidFromTask:(id)a3;
- (BOOL)beforeFirstUnlock;
- (BOOL)doesCallbackListExistFor:(id)a3 parameters:(id)a4 callback:(id)a5;
- (BOOL)fairPlaySessionReady;
- (BOOL)firstUnlockedState;
- (BOOL)managerReady;
- (BOOL)reportedExessiveRequests;
- (GKEntityCacheProviderProtocol)entityCacheProvider;
- (GKFairPlaySessionProvider)fairPlaySessionProvider;
- (GKNetworkRequestManager)initWithInMemoryEntityCache:(BOOL)a3;
- (GKNetworkRequestManagerSessionDelegate)backgroundTasksSessionDelegate;
- (NSDictionary)serviceDependancyMappings;
- (NSMutableDictionary)existingTasks;
- (NSMutableDictionary)pendingCallbacks;
- (NSOperationQueue)operationQueue;
- (NSURLSession)backgroundSession;
- (NSURLSession)inProcessSession;
- (NSURLSessionConfiguration)backgroundConfig;
- (NSURLSessionConfiguration)inProcessConfig;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)stateQueue;
- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)inProcessTasksSessionDelegate;
- (id)canSafelyIssueRequest:(id)a3;
- (id)contentsOfPendingStore:(id)a3;
- (id)dictionaryForBagAndPlayer:(id)a3 createIfNotPresent:(BOOL)a4 description:(id)a5;
- (id)existingWaitListDate:(id)a3;
- (id)filePathToTempFile:(id)a3 fileName:(id)a4;
- (id)pathToTempFile:(id)a3 fileName:(id)a4;
- (id)pendingLocation;
- (id)playerCredentialsForClientProxy:(id)a3;
- (id)resultsLocation;
- (id)retrieveAndClearCallbacks:(id)a3 parameters:(id)a4;
- (id)taskFromIdentifier:(id)a3;
- (id)waitListLocation;
- (int64_t)currentState;
- (int64_t)relatedTasksExistForBagKey:(id)a3;
- (os_unfair_lock_s)pendingCallbacksLock;
- (os_unfair_lock_s)waitListCallbacksLock;
- (void)_issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)addNetworkRequest:(id)a3 description:(id)a4 clientProxy:(id)a5;
- (void)assembleRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 handler:(id)a7;
- (void)assembleRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)cancelCurrentTasks;
- (void)cleanUpPendingStore:(id)a3;
- (void)createEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 clientProxy:(GKClientProxy *)a5 entityMaker:(id)a6 completionHandler:;
- (void)createEntityWithRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 completionHandler:(id)a6 entityMaker:(id)a7;
- (void)deleteEntitiesWithBagKey:(NSString *)a3 clientProxy:(GKClientProxy *)a4 completionHandler:(id)a5;
- (void)getFairPlaySession:(id)a3;
- (void)handleRetryAfter:(id)a3;
- (void)handleTaskFinished:(id)a3;
- (void)issuePending;
- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 handler:(id)a6;
- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 handler:(id)a7;
- (void)issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)readEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(GKClientProxy *)a6 entityMaker:(id)a7 completionHandler:;
- (void)readEntityWithRequest:(id)a3 bagKey:(id)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(id)a6 completionHandler:(id)a7 entityMaker:(id)a8;
- (void)setBackgroundConfig:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setBackgroundTasksSessionDelegate:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setExistingTasks:(id)a3;
- (void)setFairPlaySessionProvider:(id)a3;
- (void)setFairPlaySessionReady:(BOOL)a3;
- (void)setFirstUnlockedState:(BOOL)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setInProcessConfig:(id)a3;
- (void)setInProcessSession:(id)a3;
- (void)setInProcessTasksSessionDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingCallbacks:(id)a3;
- (void)setPendingCallbacksLock:(os_unfair_lock_s)a3;
- (void)setReportedExessiveRequests:(BOOL)a3;
- (void)setServiceDependancyMappings:(id)a3;
- (void)setWaitListCallbacksLock:(os_unfair_lock_s)a3;
- (void)setWaitPeriod:(id)a3 waitPeriod:(double)a4;
- (void)setupSessionsAsync;
- (void)writeToNetwork:(id)a3 clientProxy:(id)a4 handler:(id)a5;
- (void)writeToPendingStore:(id)a3 fileName:(id)a4;
@end

@implementation GKNetworkRequestManager

- (void)readEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(GKClientProxy *)a6 entityMaker:(id)a7 completionHandler:
{
  v8 = v7;
  v14 = _Block_copy(a7);
  v15 = _Block_copy(v8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(unsigned char *)(v16 + 32) = a5;
  *(void *)(v16 + 40) = a6;
  *(void *)(v16 + 48) = v14;
  *(void *)(v16 + 56) = v15;
  *(void *)(v16 + 64) = self;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = self;

  sub_10000D83C((uint64_t)&unk_100327020, v16);
}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(GKNetworkRequestManager *)self playerCredentialsForClientProxy:v14];
  [(GKNetworkRequestManager *)self issueRequestForPlayer:v16 bagKey:v15 clientProxy:v14 locale:v13 playerCredential:v17 handler:v12];
}

- (void)readEntityWithRequest:(id)a3 bagKey:(id)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(id)a6 completionHandler:(id)a7 entityMaker:(id)a8
{
  id v13 = _Block_copy(a7);
  id v14 = _Block_copy(a8);
  if (a3) {
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v13;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  id v20 = a6;
  v21 = self;
  sub_10000B4D8((uint64_t)a3, v15, v17, a5, v20, (uint64_t)sub_100019D04, v18, (uint64_t)sub_10019DAB4, v19);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)playerCredentialsForClientProxy:(id)a3
{
  id v3 = a3;
  v4 = +[GKPlayerCredentialController sharedController];
  id v5 = [v3 environment];

  v6 = [v4 pushCredentialForEnvironment:v5];

  return v6;
}

- (void)issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[GKDataRequestManager sharedManager];
  v21 = [v20 storeBag];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100016FB8;
  v28[3] = &unk_1002D9048;
  id v33 = v18;
  id v34 = v19;
  v28[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = v19;
  [v21 verifyEligibilityForBagKey:v25 replyQueue:0 client:v24 completion:v28];
}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 handler:(id)a6
{
}

+ (id)commonNetworkRequestManager
{
  if (qword_1003296F0 != -1) {
    dispatch_once(&qword_1003296F0, &stru_1002D8F68);
  }
  v2 = (void *)qword_1003296E8;

  return v2;
}

- (BOOL)doesCallbackListExistFor:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    id v12 = v8;
    id v13 = [a4 sortedArrayUsingSelector:"compare:"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        id v17 = 0;
        id v18 = v12;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v12 = [v18 stringByAppendingString:*(void *)(*((void *)&v28 + 1) + 8 * (void)v17)];

          id v17 = (char *)v17 + 1;
          id v18 = v12;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }
    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    id v20 = [(GKNetworkRequestManager *)self pendingCallbacks];
    v21 = [v20 objectForKeyedSubscript:v12];

    BOOL v11 = v21 != 0;
    if (!v21)
    {
      id v22 = objc_opt_new();
      id v23 = [(GKNetworkRequestManager *)self pendingCallbacks];
      [v23 setObject:v22 forKeyedSubscript:v12];
    }
    id v24 = [(GKNetworkRequestManager *)self pendingCallbacks];
    id v25 = [v24 objectForKeyedSubscript:v12];
    id v26 = [v10 copy];
    [v25 addObject:v26];

    os_unfair_lock_unlock(p_pendingCallbacksLock);
  }

  return v11;
}

- (id)retrieveAndClearCallbacks:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = [a4 sortedArrayUsingSelector:"compare:"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        id v13 = 0;
        id v14 = v8;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v8 = [v14 stringByAppendingString:*(void *)(*((void *)&v22 + 1) + 8 * (void)v13)];

          id v13 = (char *)v13 + 1;
          id v14 = v8;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    uint64_t v16 = [(GKNetworkRequestManager *)self pendingCallbacks];
    id v17 = [v16 objectForKeyedSubscript:v8];

    if (v17)
    {
      id v18 = [(GKNetworkRequestManager *)self pendingCallbacks];
      id v19 = [v18 objectForKeyedSubscript:v8];

      id v20 = [(GKNetworkRequestManager *)self pendingCallbacks];
      [v20 setObject:0 forKeyedSubscript:v8];
    }
    else
    {
      id v19 = 0;
    }
    os_unfair_lock_unlock(p_pendingCallbacksLock);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)dictionaryFromTaskDescription:(id)a3
{
  id v3 = [a3 taskDescription];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
    if (v4)
    {
      id v11 = 0;
      id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v11];
      id v6 = v11;
      if (v6)
      {
        if (!os_log_GKGeneral) {
          id v7 = (id)GKOSLoggers();
        }
        id v8 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKNetworkRequestManager JSON serialization error: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v5 = &__NSDictionary0__struct;
    }
  }
  else
  {
    id v5 = &__NSDictionary0__struct;
  }
  id v9 = [v5 mutableCopy];

  return v9;
}

- (void)getFairPlaySession:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(GKNetworkRequestManager *)self fairPlaySessionProvider];
  id v6 = +[GKDataRequestManager sharedManager];
  id v7 = [v6 storeBag];
  id v8 = +[GKReporter reporter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BDEF0;
  v10[3] = &unk_1002D8F48;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v5 fairPlaySessionWithStoreBag:v7 reporter:v8 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)filePathToTempFile:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSURL);
  id v8 = [v6 stringByAppendingPathComponent:v5];

  id v9 = [v7 initFileURLWithPath:v8];

  return v9;
}

- (id)pathToTempFile:(id)a3 fileName:(id)a4
{
  id v4 = [a3 stringByAppendingPathComponent:a4];
  id v5 = +[NSURL URLWithString:v4];

  return v5;
}

- (void)cleanUpPendingStore:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNetworkRequestManager *)self pendingLocation];
  id v6 = [(GKNetworkRequestManager *)self filePathToTempFile:v5 fileName:v4];

  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKNetworkRequestManager clearing pending location: %@", (uint8_t *)&v11, 0xCu);
  }
  id v9 = +[NSFileManager defaultManager];
  id v10 = [v6 path];
  [v9 removeItemAtPath:v10 error:0];
}

- (id)contentsOfPendingStore:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(GKNetworkRequestManager *)self pendingLocation];
  id v7 = [(GKNetworkRequestManager *)self pathToTempFile:v6 fileName:v4];

  if (v7)
  {
    id v8 = [v7 path];
    id v9 = +[NSDictionary dictionaryWithContentsOfFile:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)writeToPendingStore:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(GKNetworkRequestManager *)self pendingLocation];
  id v10 = [(GKNetworkRequestManager *)self pathToTempFile:v9 fileName:v7];

  int v11 = [v10 path];
  id v12 = +[NSFileManager defaultManager];
  if (![v12 fileExistsAtPath:v11]) {
    goto LABEL_7;
  }
  if ([v12 removeItemAtPath:v11 error:0])
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removed existing file", (uint8_t *)&v23, 2u);
    }
LABEL_7:
    if ([v6 writeToFile:v11 atomically:1])
    {
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      uint64_t v16 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v7;
        id v17 = "writeDictionaryToFile succeeded for: %@";
LABEL_20:
        id v20 = v16;
        uint32_t v21 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers();
      }
      id v19 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        id v17 = "Failed to write pending data";
        id v20 = v19;
        uint32_t v21 = 2;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v23, v21);
        goto LABEL_22;
      }
    }
    goto LABEL_22;
  }
  if (!os_log_GKGeneral) {
    id v22 = (id)GKOSLoggers();
  }
  uint64_t v16 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412290;
    id v24 = v11;
    id v17 = "Could not remove file: %@";
    goto LABEL_20;
  }
LABEL_22:
}

- (BOOL)beforeFirstUnlock
{
  id v3 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v3);

  if ([(GKNetworkRequestManager *)self firstUnlockedState])
  {
    if (MKBDeviceFormattedForContentProtection()) {
      BOOL v4 = MKBDeviceUnlockedSinceBoot() != 1;
    }
    else {
      BOOL v4 = 0;
    }
    [(GKNetworkRequestManager *)self setFirstUnlockedState:v4];
  }

  return [(GKNetworkRequestManager *)self firstUnlockedState];
}

- (GKNetworkRequestManager)initWithInMemoryEntityCache:(BOOL)a3
{
  BOOL v3 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GKNetworkRequestManager;
  BOOL v4 = [(GKNetworkRequestManager *)&v32 init];
  id v5 = v4;
  if (v4)
  {
    v4->_firstUnlockedState = 1;
    [(GKNetworkRequestManager *)v4 setPendingCallbacksLock:0];
    id v6 = objc_opt_new();
    [(GKNetworkRequestManager *)v5 setPendingCallbacks:v6];

    [(GKNetworkRequestManager *)v5 setWaitListCallbacksLock:0];
    serviceDependancyMappings = v5->_serviceDependancyMappings;
    v5->_serviceDependancyMappings = (NSDictionary *)&off_1002F2CF0;

    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    existingTasks = v5->_existingTasks;
    v5->_existingTasks = v8;

    v5->_currentState = 0;
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.gamed.networkmanager.state", v10);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v11;

    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.gamed.networkmanager.handler", v13);
    handlerQueue = v5->_handlerQueue;
    v5->_handlerQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v16;

    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    v5->_reportedExessiveRequests = 0;
    uint64_t v18 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    inProcessConfig = v5->_inProcessConfig;
    v5->_inProcessConfig = (NSURLSessionConfiguration *)v18;

    id v20 = objc_alloc_init(_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    inProcessTasksSessionDelegate = v5->_inProcessTasksSessionDelegate;
    v5->_inProcessTasksSessionDelegate = v20;

    id v22 = v5->_inProcessConfig;
    int v23 = [(GKNetworkRequestManager *)v5 inProcessTasksSessionDelegate];
    id v24 = [(GKNetworkRequestManager *)v5 operationQueue];
    uint64_t v25 = +[NSURLSession sessionWithConfiguration:v22 delegate:v23 delegateQueue:v24];
    inProcessSession = v5->_inProcessSession;
    v5->_inProcessSession = (NSURLSession *)v25;

    id v27 = [[GKFairPlaySessionProvider alloc] initWithSession:v5->_inProcessSession];
    fairPlaySessionProvider = v5->_fairPlaySessionProvider;
    v5->_fairPlaySessionProvider = v27;

    uint64_t v29 = +[GKNetworkRequestManager makeEntityCacheProviderInMemory:v3];
    entityCacheProvider = v5->_entityCacheProvider;
    v5->_entityCacheProvider = (GKEntityCacheProviderProtocol *)v29;
  }
  return v5;
}

- (void)cancelCurrentTasks
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  BOOL v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKNetworkRequestManager cancelling all existing tasks:", buf, 2u);
  }
  id v5 = [(GKNetworkRequestManager *)self backgroundSession];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BE93C;
  v6[3] = &unk_1002D8F90;
  v6[4] = self;
  [v5 getAllTasksWithCompletionHandler:v6];
}

- (int64_t)relatedTasksExistForBagKey:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 2;
  id v5 = [(GKNetworkRequestManager *)self serviceDependancyMappings];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(GKNetworkRequestManager *)self stateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BEDA0;
    block[3] = &unk_1002D8F20;
    block[4] = self;
    id v14 = v6;
    id v15 = &v16;
    dispatch_sync(v7, block);

    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = os_log_GKDaemon;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = +[NSNumber numberWithInteger:v17[3]];
      *(_DWORD *)buf = 138412546;
      id v21 = v4;
      __int16 v22 = 2112;
      int v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKNetworkRequestManager the outcome of relatedTasksExistForBagKey %@ is: %@", buf, 0x16u);
    }
    int64_t v11 = v17[3];
  }
  else
  {
    int64_t v11 = v17[3];
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (Class)networkRequestClass:(id)a3
{
  id v3 = a3;
  id v4 = +[GKRemoveFriendNetworkRequest bagKey];
  unsigned __int8 v5 = [v4 isEqualToString:v3];

  if (v5) {
    goto LABEL_10;
  }
  id v6 = +[GKRemoveAllFriendsNetworkRequest bagKey];
  unsigned __int8 v7 = [v6 isEqualToString:v3];

  if (v7) {
    goto LABEL_10;
  }
  id v8 = +[GKChallengeNetworkRequest bagKey];
  unsigned __int8 v9 = [v8 isEqualToString:v3];

  if (v9) {
    goto LABEL_10;
  }
  id v10 = +[GKAbortChallengeNetworkRequest bagKey];
  unsigned __int8 v11 = [v10 isEqualToString:v3];

  if (v11) {
    goto LABEL_10;
  }
  id v12 = +[GKAchievementNetworkRequest bagKey];
  unsigned __int8 v13 = [v12 isEqualToString:v3];

  if (v13) {
    goto LABEL_10;
  }
  id v14 = +[GKScoreNetworkRequest bagKey];
  unsigned __int8 v15 = [v14 isEqualToString:v3];

  if (v15) {
    goto LABEL_10;
  }
  uint64_t v16 = +[GKInstanceScoreNetworkRequest bagKey];
  unsigned __int8 v17 = [v16 isEqualToString:v3];

  if (v17) {
    goto LABEL_10;
  }
  uint64_t v18 = +[GKPlayerGameSettingsNetworkRequest bagKey];
  unsigned __int8 v19 = [v18 isEqualToString:v3];

  if ((v19 & 1) != 0
    || (+[GKMultiplayerGroupRequest bagKey],
        id v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 isEqualToString:v3],
        v20,
        v21))
  {
LABEL_10:
    __int16 v22 = objc_opt_class();
  }
  else
  {
    __int16 v22 = 0;
  }
  int v23 = v22;

  return v23;
}

+ (id)networkRequestFromNsurlTask:(id)a3
{
  id v3 = a3;
  id v4 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v3];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"BagKeyKey"];
  id v6 = +[GKNetworkRequestManager networkRequestClass:v5];
  if (v6)
  {
    id v7 = [[v6 alloc] initWithTask:v3];
    id v8 = [v3 originalRequest];
    id v9 = [v8 mutableCopy];
    [v7 setNsurlRequest:v9];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    unsigned __int8 v11 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKNetworkRequestManager error, unsupported class: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)dictionaryForBagAndPlayer:(id)a3 createIfNotPresent:(BOOL)a4 description:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v10);

  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [v8 nsurlTask];
    id v11 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v12];
  }
  int v13 = [(id)objc_opt_class() bagKey];
  id v14 = [v11 objectForKeyedSubscript:@"PlayerIDKey"];
  if (!v14)
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    unsigned int v21 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKNetworkRequestManager failed to get store due to nil playerID", v23, 2u);
    }
    goto LABEL_16;
  }
  unsigned __int8 v15 = [(GKNetworkRequestManager *)self existingTasks];
  id v16 = [v15 objectForKeyedSubscript:v13];

  if (v16) {
    goto LABEL_8;
  }
  if (!v6)
  {
LABEL_16:
    unsigned __int8 v19 = 0;
    goto LABEL_19;
  }
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned __int8 v17 = [(GKNetworkRequestManager *)self existingTasks];
  [v17 setObject:v16 forKeyedSubscript:v13];

LABEL_8:
  uint64_t v18 = [v16 objectForKeyedSubscript:v14];
  if (!v18)
  {
    if (!v6)
    {
      unsigned __int8 v19 = 0;
      goto LABEL_18;
    }
    uint64_t v18 = objc_alloc_init(GKNetworkRequestInfo);
    [v16 setObject:v18 forKeyedSubscript:v14];
  }
  unsigned __int8 v19 = v18;

LABEL_18:
LABEL_19:

  return v19;
}

- (BOOL)managerReady
{
  id v3 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[GKPreferences shared];
  id v5 = [v4 networkManagerStateOverride];

  if (v5 != (id)-1) {
    return v5 != 0;
  }
  if ([(GKNetworkRequestManager *)self currentState] < 2) {
    return 0;
  }

  return [(GKNetworkRequestManager *)self fairPlaySessionReady];
}

- (void)addNetworkRequest:(id)a3 description:(id)a4 clientProxy:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(GKNetworkRequestManager *)self stateQueue];
  dispatch_assert_queue_V2(v11);

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  int v13 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    unsigned __int8 v15 = +[NSNumber numberWithInteger:[(GKNetworkRequestManager *)self currentState]];
    id v16 = [(GKNetworkRequestManager *)self existingTasks];
    int v25 = 138412546;
    id v26 = v15;
    __int16 v27 = 2112;
    long long v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKNetworkRequestManager addNetworkRequest managerState: %@ memory state before update: %@", (uint8_t *)&v25, 0x16u);
  }
  unsigned __int8 v17 = [(GKNetworkRequestManager *)self dictionaryForBagAndPlayer:v8 createIfNotPresent:1 description:v10];

  if (v17)
  {
    uint64_t v18 = [(GKNetworkRequestManager *)self backgroundSession];
    [v8 handleNetworkRequest:v17 session:v18 clientProxy:v9];

    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    id v20 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      unsigned int v21 = v20;
      __int16 v22 = [(GKNetworkRequestManager *)self existingTasks];
      int v25 = 138412290;
      id v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKNetworkRequestManager addNetworkRequest state after update: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    id v24 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GKNetworkRequestManager error when trying to add to store: %@", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)handleTaskFinished:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    BOOL v6 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      id v8 = [(GKNetworkRequestManager *)self existingTasks];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKNetworkRequestManager handleTaskFinished state before update: %@", buf, 0xCu);
    }
    id v9 = +[GKNetworkRequestManager networkRequestFromNsurlTask:v4];
    id v10 = [(GKNetworkRequestManager *)self stateQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BFA50;
    v14[3] = &unk_1002D3B38;
    v14[4] = self;
    id v15 = v9;
    id v11 = v9;
    dispatch_async(v10, v14);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    int v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKNetworkRequestManager handleTaskFinished with nil task, skipping", buf, 2u);
    }
  }
}

- (void)setupSessionsAsync
{
  id v3 = [(GKNetworkRequestManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BFCC4;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (BOOL)entityIsReleaseStateAwareForBagKey:(id)a3
{
  uint64_t v3 = qword_100329700;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100329700, &stru_1002D8FB0);
  }
  unsigned __int8 v5 = [(id)qword_1003296F8 containsObject:v4];

  return v5;
}

+ (BOOL)useJSONForBagKey:(id)a3
{
  uint64_t v3 = qword_100329710;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100329710, &stru_1002D8FD0);
  }
  unsigned __int8 v5 = [(id)qword_100329708 containsObject:v4];

  return v5;
}

- (void)assembleRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(GKNetworkRequestManager *)self playerCredentialsForClientProxy:v14];
  [(GKNetworkRequestManager *)self assembleRequestForPlayer:v16 bagKey:v15 clientProxy:v14 sapSession:v13 playerCredential:v17 handler:v12];
}

- (void)assembleRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(GKNetworkRequestManager *)self handlerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0A34;
  block[3] = &unk_1002D4950;
  id v28 = v14;
  id v29 = v15;
  id v30 = v18;
  long long v31 = self;
  id v32 = v16;
  id v33 = v17;
  id v34 = v19;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(v20, block);
}

- (void)writeToNetwork:(id)a3 clientProxy:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C1008;
  v22[3] = &unk_1002D5EE8;
  id v10 = a5;
  v22[4] = self;
  id v23 = v10;
  id v11 = objc_retainBlock(v22);
  id v12 = [(GKNetworkRequestManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C10E8;
  block[3] = &unk_1002D9070;
  void block[4] = self;
  id v18 = v8;
  id v20 = v10;
  id v21 = v11;
  id v19 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (id)waitListLocation
{
  v2 = GKInsecureCacheRoot();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"networkWaitBeforeAllowAttempt.plist"];

  id v4 = GKInsecureCacheRoot();
  id v5 = (id)gkEnsureDirectory();

  return v3;
}

- (void)setWaitPeriod:(id)a3 waitPeriod:(double)a4
{
  id v6 = a3;
  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  os_unfair_lock_lock(&self->_waitListCallbacksLock);
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = +[NSNumber numberWithDouble:a4];
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Attempting to update wait period: %@, %@", (uint8_t *)&v15, 0x16u);
  }
  if (v6)
  {
    id v12 = [(GKNetworkRequestManager *)self waitListLocation];
    id v13 = +[NSMutableDictionary dictionaryWithContentsOfFile:v12];
    if (!v13) {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (a4 == 0.0)
    {
      [v13 setObject:0 forKeyedSubscript:v6];
    }
    else
    {
      id v14 = +[NSDate dateWithTimeIntervalSinceNow:a4];
      [v13 setObject:v14 forKeyedSubscript:v6];
    }
    [v13 writeToFile:v12 atomically:1];
    os_unfair_lock_unlock(p_waitListCallbacksLock);
  }
}

- (void)handleRetryAfter:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKNetworkRequestManager attempting to retry after for task: %@", buf, 0xCu);
  }
  id v9 = [v4 response];
  id v10 = +[GKNetworkRequestManager networkRequestFromNsurlTask:v4];
  id v11 = [(GKNetworkRequestManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1AFC;
  block[3] = &unk_1002D4888;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

- (id)existingWaitListDate:(id)a3
{
  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  id v5 = a3;
  os_unfair_lock_lock(p_waitListCallbacksLock);
  id v6 = [(GKNetworkRequestManager *)self waitListLocation];
  id v7 = +[NSDictionary dictionaryWithContentsOfFile:v6];

  id v8 = [v7 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_waitListCallbacksLock);

  return v8;
}

- (id)canSafelyIssueRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNetworkRequestManager *)self existingWaitListDate:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 timeIntervalSinceNow];
    if (v7 > 0.0)
    {
      id v8 = +[NSString stringWithFormat:@"A wait period is active not allowing network requests for this bag key: %@ , %@", v4, v6];
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      id v13 = v8;
      id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v10 = +[NSError userErrorForCode:3 userInfo:v9];

      goto LABEL_6;
    }
    [(GKNetworkRequestManager *)self setWaitPeriod:v4 waitPeriod:0.0];
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

- (void)_issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000C1F28;
  v25[3] = &unk_1002D9128;
  v25[4] = self;
  id v26 = v15;
  id v30 = v17;
  id v31 = a8;
  id v27 = v14;
  id v28 = v16;
  id v29 = v18;
  id v19 = v17;
  id v20 = v18;
  id v21 = v16;
  id v22 = v14;
  id v23 = v31;
  id v24 = v15;
  [(GKNetworkRequestManager *)self getFairPlaySession:v25];
}

+ (id)uuidFromTask:(id)a3
{
  uint64_t v3 = +[GKNetworkRequestManager dictionaryFromTaskDescription:a3];
  id v4 = [v3 objectForKeyedSubscript:@"UUIDKey"];

  return v4;
}

+ (id)taskWithRequest:(id)a3 description:(id)a4 session:(id)a5
{
  if (a3)
  {
    id v7 = a4;
    id v8 = [a5 downloadTaskWithRequest:a3];
    id v16 = 0;
    id v9 = +[NSJSONSerialization dataWithJSONObject:v7 options:1 error:&v16];

    id v10 = v16;
    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers();
      }
      NSErrorUserInfoKey v12 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKNetworkRequestManager JSON serialization error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v14 = [v9 base64EncodedStringWithOptions:0];
      if (v14) {
        [v8 setTaskDescription:v14];
      }
    }
    id v13 = v8;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)resultsLocation
{
  v2 = GKInsecureCacheRoot();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"staging"];

  id v4 = [v3 stringByAppendingPathComponent:@"storeAndForwardResultsLocation"];

  id v5 = (id)gkEnsureDirectory();

  return v4;
}

- (id)pendingLocation
{
  v2 = GKInsecureCacheRoot();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"staging"];

  id v4 = [v3 stringByAppendingPathComponent:@"storeAndForwardPendingLocation"];

  id v5 = (id)gkEnsureDirectory();

  return v4;
}

- (id)taskFromIdentifier:(id)a3
{
  uint64_t v3 = [(GKNetworkRequestManager *)self contentsOfPendingStore:a3];
  id v4 = [v3 objectForKeyedSubscript:@"BagKeyKey"];
  id v5 = objc_alloc_init(+[GKNetworkRequestManager networkRequestClass:v4]);
  [v5 updateWithTaskInfo:v3];
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKNetworkRequestManager constructed pending request: %@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)issuePending
{
  uint64_t v3 = _localPlayerID();
  id v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000C2D44;
    v5[3] = &unk_1002D9150;
    v5[4] = self;
    id v6 = v3;
    [(GKNetworkRequestManager *)self getFairPlaySession:v5];
  }
}

- (GKEntityCacheProviderProtocol)entityCacheProvider
{
  return self->_entityCacheProvider;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSURLSessionConfiguration)backgroundConfig
{
  return self->_backgroundConfig;
}

- (void)setBackgroundConfig:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
}

- (GKNetworkRequestManagerSessionDelegate)backgroundTasksSessionDelegate
{
  return self->_backgroundTasksSessionDelegate;
}

- (void)setBackgroundTasksSessionDelegate:(id)a3
{
}

- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)inProcessTasksSessionDelegate
{
  return self->_inProcessTasksSessionDelegate;
}

- (void)setInProcessTasksSessionDelegate:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (BOOL)firstUnlockedState
{
  return self->_firstUnlockedState;
}

- (void)setFirstUnlockedState:(BOOL)a3
{
  self->_firstUnlockedState = a3;
}

- (NSDictionary)serviceDependancyMappings
{
  return self->_serviceDependancyMappings;
}

- (void)setServiceDependancyMappings:(id)a3
{
}

- (NSMutableDictionary)existingTasks
{
  return self->_existingTasks;
}

- (void)setExistingTasks:(id)a3
{
}

- (BOOL)reportedExessiveRequests
{
  return self->_reportedExessiveRequests;
}

- (void)setReportedExessiveRequests:(BOOL)a3
{
  self->_reportedExessiveRequests = a3;
}

- (os_unfair_lock_s)pendingCallbacksLock
{
  return self->_pendingCallbacksLock;
}

- (void)setPendingCallbacksLock:(os_unfair_lock_s)a3
{
  self->_pendingCallbacksLock = a3;
}

- (os_unfair_lock_s)waitListCallbacksLock
{
  return self->_waitListCallbacksLock;
}

- (void)setWaitListCallbacksLock:(os_unfair_lock_s)a3
{
  self->_waitListCallbacksLock = a3;
}

- (NSMutableDictionary)pendingCallbacks
{
  return self->_pendingCallbacks;
}

- (void)setPendingCallbacks:(id)a3
{
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
}

- (BOOL)fairPlaySessionReady
{
  return self->_fairPlaySessionReady;
}

- (void)setFairPlaySessionReady:(BOOL)a3
{
  self->_fairPlaySessionReady = a3;
}

- (GKFairPlaySessionProvider)fairPlaySessionProvider
{
  return self->_fairPlaySessionProvider;
}

- (void)setFairPlaySessionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySessionProvider, 0);
  objc_storeStrong((id *)&self->_inProcessConfig, 0);
  objc_storeStrong((id *)&self->_inProcessSession, 0);
  objc_storeStrong((id *)&self->_pendingCallbacks, 0);
  objc_storeStrong((id *)&self->_existingTasks, 0);
  objc_storeStrong((id *)&self->_serviceDependancyMappings, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_inProcessTasksSessionDelegate, 0);
  objc_storeStrong((id *)&self->_backgroundTasksSessionDelegate, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundConfig, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_entityCacheProvider, 0);
}

+ (id)makeEntityCacheProviderInMemory:(BOOL)a3
{
  uint64_t v3 = (void *)sub_100198B50(a3);

  return v3;
}

- (void)createEntityWithRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 completionHandler:(id)a6 entityMaker:(id)a7
{
  id v10 = _Block_copy(a6);
  id v11 = _Block_copy(a7);
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  id v18 = a5;
  id v19 = self;
  sub_100198BCC(v12, v13, v15, v18, (uint64_t)sub_10019DACC, v16, (uint64_t)sub_10019DAB4, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)createEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 clientProxy:(GKClientProxy *)a5 entityMaker:(id)a6 completionHandler:
{
  id v7 = v6;
  uint64_t v12 = _Block_copy(a6);
  uint64_t v13 = _Block_copy(v7);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  void v14[5] = v12;
  v14[6] = v13;
  v14[7] = self;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  id v18 = self;

  sub_10000D83C((uint64_t)&unk_100327090, (uint64_t)v14);
}

- (void)deleteEntitiesWithBagKey:(NSString *)a3 clientProxy:(GKClientProxy *)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  int v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;

  sub_10000D83C((uint64_t)&unk_100326FF8, (uint64_t)v9);
}

+ (id)makeEntityIDWithRequest:(id)a3 bagKey:(id)a4
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B6F0(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

@end