@interface NDChronoKitLauncher
+ (id)sharedLauncher;
- (BOOL)extension:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5;
- (BOOL)wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6;
- (NDChronoKitLauncher)init;
- (void)_onqueue_removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4;
- (void)_onqueue_wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6;
- (void)addObserver:(id)a3 forExtension:(id)a4;
- (void)removeObserver:(id)a3 forExtension:(id)a4;
- (void)removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
@end

@implementation NDChronoKitLauncher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingLaunches, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (BOOL)extension:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5
{
  return 0;
}

- (void)_onqueue_removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v6];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing wake request for independent extension %@ for session %@", (uint8_t *)&v14, 0x16u);
    }
    [v9 invalidate];
    v11 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v6];
    [v11 removeObjectForKey:v7];

    v12 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v6];
    BOOL v13 = [v12 count] == 0;

    if (v13) {
      [(NSMutableDictionary *)self->_pendingLaunches removeObjectForKey:v6];
    }
  }
}

- (void)removePendingLaunchForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062D8C;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_onqueue_wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 1024;
    int v35 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Issuing wake request for independent extension %@ for session %@ with uuid %@ and requirement %d", buf, 0x26u);
  }
  int v14 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v10];
  id v15 = [v14 objectForKeyedSubscript:v11];
  BOOL v16 = v15 == 0;

  if (v16) {
    goto LABEL_8;
  }
  id v17 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Wake request already exists for independent extension %@ for session %@ with uuid %@", buf, 0x20u);
  }
  if (a6 == 2)
  {
    [(NDChronoKitLauncher *)self _onqueue_removePendingLaunchForBundleID:v10 sessionID:v11];
LABEL_8:
    if (&CHSNSURLSessiondServiceInfoKeyIsHighPriority) {
      BOOL v18 = &CHSNSURLSessiondServiceInfoKeySessionIdentifier == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      v20 = 0;
    }
    else
    {
      v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a6 == 2, CHSNSURLSessiondServiceInfoKeySessionIdentifier, CHSNSURLSessiondServiceInfoKeyIsHighPriority, v11);
      v27[1] = v19;
      v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:2];
    }
    v21 = [(CHSNSURLSessiondService *)self->_service URLSessionDidCompleteForExtensionWithBundleIdentifier:v10 info:v20];
    v22 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v10];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      v24 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->_pendingLaunches setObject:v24 forKeyedSubscript:v10];
    }
    v25 = [(NSMutableDictionary *)self->_pendingLaunches objectForKeyedSubscript:v10];
    [v25 setObject:v21 forKeyedSubscript:v11];
  }
}

- (BOOL)wakeUpExtension:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5 wakeRequirement:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000631BC;
  block[3] = &unk_1000B6180;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  int64_t v22 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);

  return 1;
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063268;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006330C;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3 forExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063428;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)addObserver:(id)a3 forExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006355C;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (NDChronoKitLauncher)init
{
  v16.receiver = self;
  v16.super_class = (Class)NDChronoKitLauncher;
  v2 = [(NDChronoKitLauncher *)&v16 init];
  if (v2)
  {
    v3 = (CHSNSURLSessiondService *)objc_alloc_init((Class)CHSNSURLSessiondService);
    service = v2->_service;
    v2->_service = v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    pendingLaunches = v2->_pendingLaunches;
    v2->_pendingLaunches = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableSet set];
    monitoredBundleIDs = v2->_monitoredBundleIDs;
    v2->_monitoredBundleIDs = (NSMutableSet *)v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nsurlsessiond.NDExtension-queue", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

+ (id)sharedLauncher
{
  if (qword_1000CB140 != -1) {
    dispatch_once(&qword_1000CB140, &stru_1000B6158);
  }
  v2 = (void *)qword_1000CB138;

  return v2;
}

@end