@interface KTOctagonActualOperations
- (BOOL)ckksViewReady:(id)a3 error:(id *)a4;
- (BOOL)getCachedOctagonStatus;
- (KTCKKSProtocol)ckksControlInterface;
- (KTNSDistributedNotificationCenter)notificationCenter;
- (KTNearFutureScheduler)ckksCheckerNFS;
- (KTNearFutureScheduler)nfs;
- (KTOctagonActualOperations)initWithDistributedNotificationCenter:(id)a3 octagonControl:(id)a4 ckksControl:(id)a5 logger:(id)a6;
- (KTOctagonProtocol)octagonControl;
- (NSMutableSet)views;
- (OS_dispatch_queue)queue;
- (TransparencyAnalytics)logger;
- (double)ckksTimeout;
- (id)ckksControl:(id *)a3;
- (id)ckksViewObserver;
- (id)octagonObserver;
- (int)octagonToken;
- (unint64_t)ckksGetKnownBadState:(id)a3;
- (unint64_t)octagonStatus:(id *)a3;
- (unint64_t)octagonTrusted;
- (void)addPassiveMonitorForView:(id)a3;
- (void)checkAllCKKSMonitoredViews;
- (void)checkCKKSAvailable:(id)a3;
- (void)ckksNotify:(id)a3;
- (void)ckksRequestViewSync:(id)a3 complete:(id)a4;
- (void)dealloc;
- (void)manateeChanged;
- (void)setCkksCheckerNFS:(id)a3;
- (void)setCkksControlInterface:(id)a3;
- (void)setCkksTimeout:(double)a3;
- (void)setCkksViewObserver:(id)a3;
- (void)setLogger:(id)a3;
- (void)setNfs:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setOctagonControl:(id)a3;
- (void)setOctagonObserver:(id)a3;
- (void)setOctagonToken:(int)a3;
- (void)setOctagonTrusted:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setViews:(id)a3;
- (void)shutdown;
- (void)triggerActiveMonitorForView:(id)a3;
@end

@implementation KTOctagonActualOperations

- (KTOctagonActualOperations)initWithDistributedNotificationCenter:(id)a3 octagonControl:(id)a4 ckksControl:(id)a5 logger:(id)a6
{
  id v10 = a3;
  v11 = (KTOctagonActualOperations *)a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)KTOctagonActualOperations;
  v14 = [(KTOctagonActualOperations *)&v35 init];
  if (v14)
  {
    id location = 0;
    objc_initWeak(&location, v14);
    [(KTOctagonActualOperations *)v14 setCkksTimeout:2.0];
    [(KTOctagonActualOperations *)v14 setOctagonToken:0xFFFFFFFFLL];
    [(KTOctagonActualOperations *)v14 setOctagonTrusted:2];
    [(KTOctagonActualOperations *)v14 setLogger:v13];
    v15 = +[NSMutableSet set];
    [(KTOctagonActualOperations *)v14 setViews:v15];

    dispatch_queue_t v16 = dispatch_queue_create("KTOctagonActualOperations", 0);
    [(KTOctagonActualOperations *)v14 setQueue:v16];

    v17 = [KTNearFutureScheduler alloc];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001C2284;
    v32[3] = &unk_1002B72D8;
    objc_copyWeak(&v33, &location);
    v18 = [(KTNearFutureScheduler *)v17 initWithName:@"OctagonPoller" delay:1000000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v32];
    [(KTOctagonActualOperations *)v14 setNfs:v18];

    v19 = [(KTOctagonActualOperations *)v14 nfs];
    [v13 addNFSReporting:v19];

    v20 = [KTNearFutureScheduler alloc];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001C22C4;
    v30[3] = &unk_1002B72D8;
    objc_copyWeak(&v31, &location);
    v21 = [(KTNearFutureScheduler *)v20 initWithName:@"ckksCheckerNFS" initialDelay:2000000000 exponentialBackoff:3600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v30 block:1.5];
    [(KTOctagonActualOperations *)v14 setCkksCheckerNFS:v21];

    v22 = [(KTOctagonActualOperations *)v14 ckksCheckerNFS];
    [v13 addNFSReporting:v22];

    [(KTOctagonActualOperations *)v14 setNotificationCenter:v10];
    v23 = [(KTOctagonActualOperations *)v14 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001C2304;
    handler[3] = &unk_1002B9B18;
    objc_copyWeak(&v29, &location);
    notify_register_dispatch("com.apple.security.octagon.trust-status-change", &v14->_octagonToken, v23, handler);

    v24 = [(KTOctagonActualOperations *)v14 notificationCenter];
    [v24 addObserver:v14 selector:"ckksNotify:" name:@"com.apple.security.view-become-ready" object:0];

    if (v11) {
      v25 = v11;
    }
    else {
      v25 = v14;
    }
    [(KTOctagonActualOperations *)v14 setOctagonControl:v25];
    [(KTOctagonActualOperations *)v14 setCkksControlInterface:v12];
    v26 = v14;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)shutdown
{
  v3 = [(KTOctagonActualOperations *)self nfs];
  [v3 cancel];

  v4 = [(KTOctagonActualOperations *)self ckksCheckerNFS];
  [v4 cancel];

  if ([(KTOctagonActualOperations *)self octagonToken] != -1)
  {
    notify_cancel([(KTOctagonActualOperations *)self octagonToken]);
    [(KTOctagonActualOperations *)self setOctagonToken:0xFFFFFFFFLL];
  }
  id v5 = [(KTOctagonActualOperations *)self notificationCenter];
  [v5 removeObserver:self name:@"com.apple.security.view-become-ready" object:0];
}

- (void)ckksNotify:(id)a3
{
  id v4 = a3;
  if (qword_10032F0E0 != -1) {
    dispatch_once(&qword_10032F0E0, &stru_1002C65B0);
  }
  id v5 = qword_10032F0E8;
  if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View become ready: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"view"];

  if (v7)
  {
    v8 = [(KTOctagonActualOperations *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C2648;
    block[3] = &unk_1002B9768;
    p_long long buf = &buf;
    block[4] = self;
    id v10 = v7;
    dispatch_sync(v8, block);
  }
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(KTOctagonActualOperations *)self checkAllCKKSMonitoredViews];
  }

  _Block_object_dispose(&buf, 8);
}

- (void)dealloc
{
  [(KTOctagonActualOperations *)self shutdown];
  v3.receiver = self;
  v3.super_class = (Class)KTOctagonActualOperations;
  [(KTOctagonActualOperations *)&v3 dealloc];
}

- (void)manateeChanged
{
  objc_super v3 = [(KTOctagonActualOperations *)self octagonControl];
  id v4 = [v3 octagonStatus:0];

  id v5 = [(KTOctagonActualOperations *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C27AC;
  v6[3] = &unk_1002B9C78;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(v5, v6);

  if (v4) {
    [(KTOctagonActualOperations *)self checkAllCKKSMonitoredViews];
  }
}

- (BOOL)getCachedOctagonStatus
{
  if ((id)[(KTOctagonActualOperations *)self octagonTrusted] == (id)2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C2ACC;
    block[3] = &unk_1002B7D58;
    block[4] = self;
    id v5 = v3;
    v11 = v5;
    dispatch_async(v4, block);

    if (dispatch_semaphore_wait(v5, 0x3B9ACA00uLL))
    {
      if (qword_10032F0E0 != -1) {
        dispatch_once(&qword_10032F0E0, &stru_1002C65F0);
      }
      v6 = qword_10032F0E8;
      if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "getCachedOctagonStatus: Fetching octagon status timed out", v9, 2u);
      }
    }
    unint64_t v7 = [(KTOctagonActualOperations *)self octagonTrusted];
  }
  else
  {
    unint64_t v7 = [(KTOctagonActualOperations *)self octagonTrusted];
  }
  return v7 == 1;
}

- (unint64_t)octagonStatus:(id *)a3
{
  id v3 = objc_alloc_init((Class)OTConfigurationContext);
  [v3 setContext:OTDefaultContext];
  id v4 = [objc_alloc((Class)OTClique) initWithContextData:v3];
  id v5 = objc_alloc_init((Class)OTOperationConfiguration);
  [v5 setTimeoutWaitForCKAccount:2000000000];
  id v10 = 0;
  id v6 = [v4 fetchCliqueStatus:v5 error:&v10];
  id v7 = v10;
  if (qword_10032F0E0 != -1) {
    dispatch_once(&qword_10032F0E0, &stru_1002C6610);
  }
  v8 = qword_10032F0E8;
  if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    BOOL v12 = v6 == 0;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee status is: %{BOOL}d: %@", buf, 0x12u);
  }

  return v6 == 0;
}

- (id)ckksControl:(id *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032F0F0);
  id v4 = [(KTOctagonActualOperations *)self ckksControlInterface];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v11 = 0;
    id v6 = +[CKKSControl controlObject:&v11];
    id v5 = v11;
    [(KTOctagonActualOperations *)self setCkksControlInterface:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032F0F0);
  id v7 = [(KTOctagonActualOperations *)self ckksControlInterface];

  if (!v7)
  {
    if (qword_10032F0E0 != -1) {
      dispatch_once(&qword_10032F0E0, &stru_1002C6630);
    }
    v8 = qword_10032F0E8;
    if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CKKS have no control: %@", buf, 0xCu);
    }
  }
  v9 = [(KTOctagonActualOperations *)self ckksControlInterface];

  return v9;
}

- (BOOL)ckksViewReady:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v24 = 0;
  id v6 = [(KTOctagonActualOperations *)self ckksControl:&v24];
  id v7 = v24;
  if (v6)
  {
    *(void *)v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x2020000000;
    char v28 = 0;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1001C3260;
    v20 = &unk_1002C6698;
    v8 = dispatch_semaphore_create(0);
    v21 = v8;
    v23 = v27;
    id v9 = v5;
    id v22 = v9;
    [v6 rpcFastStatus:v9 reply:&v17];
    [(KTOctagonActualOperations *)self ckksTimeout];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v11))
    {
      if (qword_10032F0E0 != -1) {
        dispatch_once(&qword_10032F0E0, &stru_1002C66B8);
      }
      BOOL v12 = qword_10032F0E8;
      if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", buf, 2u);
      }
    }
    if (*(unsigned char *)(*(void *)&v27[8] + 24))
    {
      BOOL v13 = 1;
    }
    else
    {
      if (qword_10032F0E0 != -1) {
        dispatch_once(&qword_10032F0E0, &stru_1002C66D8);
      }
      v15 = qword_10032F0E8;
      if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting up a new monitor for CKKS: %@", buf, 0xCu);
      }
      [(KTOctagonActualOperations *)self triggerActiveMonitorForView:v9];
      BOOL v13 = *(unsigned char *)(*(void *)&v27[8] + 24) != 0;
    }

    _Block_object_dispose(v27, 8);
  }
  else
  {
    if (qword_10032F0E0 != -1) {
      dispatch_once(&qword_10032F0E0, &stru_1002C6650);
    }
    id v14 = qword_10032F0E8;
    if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412546;
      *(void *)&v27[4] = v5;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CKKS have no control, starting watcher: %@: %@", v27, 0x16u);
    }
    [(KTOctagonActualOperations *)self triggerActiveMonitorForView:v5];
    BOOL v13 = 0;
  }

  return v13;
}

- (void)addPassiveMonitorForView:(id)a3
{
  id v4 = a3;
  id v5 = [(KTOctagonActualOperations *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C35F4;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)triggerActiveMonitorForView:(id)a3
{
  id v4 = a3;
  id v5 = [(KTOctagonActualOperations *)self queue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_1001C3714;
  dispatch_time_t v11 = &unk_1002B7D58;
  BOOL v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);

  id v7 = [(KTOctagonActualOperations *)self ckksCheckerNFS];
  [v7 trigger];
}

- (void)checkAllCKKSMonitoredViews
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1001C39EC;
  v20 = sub_1001C39FC;
  id v21 = 0;
  id v3 = [(KTOctagonActualOperations *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3A04;
  block[3] = &unk_1002C3EC0;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(v3, block);

  if (qword_10032F0E0 != -1) {
    dispatch_once(&qword_10032F0E0, &stru_1002C66F8);
  }
  id v4 = (id)qword_10032F0E8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(id)v17[5] allObjects];
    id v6 = [v5 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS checking if views are now available %@", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v17[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[KTOctagonActualOperations checkCKKSAvailable:](self, "checkCKKSAvailable:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)checkCKKSAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(KTOctagonActualOperations *)self octagonControl];
  id v23 = 0;
  id v6 = [v5 octagonStatus:&v23];
  id v7 = v23;

  if (v6)
  {
    id v22 = 0;
    unsigned __int8 v8 = [(KTOctagonActualOperations *)self ckksViewReady:v4 error:&v22];
    id v9 = v22;
    if (v8)
    {
      double v10 = [(KTOctagonActualOperations *)self queue];
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_1001C3DB0;
      v19 = &unk_1002B7D58;
      v20 = self;
      id v11 = v4;
      id v21 = v11;
      dispatch_sync(v10, &v16);

      long long v12 = [(KTOctagonActualOperations *)self ckksViewObserver];

      if (v12)
      {
        long long v13 = [(KTOctagonActualOperations *)self ckksViewObserver];
        ((void (**)(void, id))v13)[2](v13, v11);
      }
    }
    else
    {
      if (qword_10032F0E0 != -1) {
        dispatch_once(&qword_10032F0E0, &stru_1002C6738);
      }
      v15 = qword_10032F0E8;
      if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CKKS not available: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (qword_10032F0E0 != -1) {
      dispatch_once(&qword_10032F0E0, &stru_1002C6718);
    }
    long long v14 = qword_10032F0E8;
    if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Octagon no longer available, stopping to monitor: %@", buf, 0xCu);
    }
  }
}

- (void)ckksRequestViewSync:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = 0;
  unsigned __int8 v8 = [(KTOctagonActualOperations *)self ckksControl:&v12];
  id v9 = v12;
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001C3F04;
    v10[3] = &unk_1002B9CA0;
    id v11 = v7;
    [v8 rpcFetchAndProcessChanges:v6 reply:v10];
  }
  else
  {
    (*((void (**)(id, id, double))v7 + 2))(v7, v9, 600.0);
  }
}

- (unint64_t)ckksGetKnownBadState:(id)a3
{
  id v4 = a3;
  id v23 = 0;
  id v5 = [(KTOctagonActualOperations *)self ckksControl:&v23];
  id v6 = v23;
  if (v5)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C423C;
    v15[3] = &unk_1002C67A0;
    uint64_t v18 = &v19;
    id v16 = v4;
    unsigned __int8 v8 = v7;
    uint64_t v17 = v8;
    [v5 rpcKnownBadState:v16 reply:v15];
    [(KTOctagonActualOperations *)self ckksTimeout];
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v10))
    {
      if (qword_10032F0E0 != -1) {
        dispatch_once(&qword_10032F0E0, &stru_1002C67C0);
      }
      id v11 = qword_10032F0E8;
      if (os_log_type_enabled((os_log_t)qword_10032F0E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", v14, 2u);
      }
    }
    unint64_t v12 = v20[3];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (double)ckksTimeout
{
  return self->ckksTimeout;
}

- (void)setCkksTimeout:(double)a3
{
  self->ckksTimeout = a3;
}

- (id)octagonObserver
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setOctagonObserver:(id)a3
{
}

- (id)ckksViewObserver
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCkksViewObserver:(id)a3
{
}

- (KTNSDistributedNotificationCenter)notificationCenter
{
  return (KTNSDistributedNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (KTNearFutureScheduler)nfs
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNfs:(id)a3
{
}

- (KTNearFutureScheduler)ckksCheckerNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCkksCheckerNFS:(id)a3
{
}

- (NSMutableSet)views
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setViews:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueue:(id)a3
{
}

- (KTOctagonProtocol)octagonControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_octagonControl);

  return (KTOctagonProtocol *)WeakRetained;
}

- (void)setOctagonControl:(id)a3
{
}

- (KTCKKSProtocol)ckksControlInterface
{
  return (KTCKKSProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCkksControlInterface:(id)a3
{
}

- (int)octagonToken
{
  return self->_octagonToken;
}

- (void)setOctagonToken:(int)a3
{
  self->_octagonToken = a3;
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogger:(id)a3
{
}

- (unint64_t)octagonTrusted
{
  return self->_octagonTrusted;
}

- (void)setOctagonTrusted:(unint64_t)a3
{
  self->_octagonTrusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_ckksControlInterface, 0);
  objc_destroyWeak((id *)&self->_octagonControl);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_ckksCheckerNFS, 0);
  objc_storeStrong((id *)&self->_nfs, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->ckksViewObserver, 0);

  objc_storeStrong(&self->octagonObserver, 0);
}

@end