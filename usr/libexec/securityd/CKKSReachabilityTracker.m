@interface CKKSReachabilityTracker
+ (BOOL)isNetworkError:(id)a3;
+ (BOOL)isNetworkFailureError:(id)a3;
- (BOOL)currentReachability;
- (BOOL)haveNetwork;
- (BOOL)isNetworkError:(id)a3;
- (CKKSReachabilityTracker)init;
- (CKKSResultOperation)reachabilityDependency;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_nw_path_monitor)networkMonitor;
- (id)description;
- (void)_onQueueResetReachabilityDependency;
- (void)_onQueueRunReachabilityDependency;
- (void)_onqueueSetNetworkReachability:(BOOL)a3;
- (void)setHaveNetwork:(BOOL)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setNetworkReachability:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityDependency:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation CKKSReachabilityTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_reachabilityDependency, 0);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_nw_path_monitor)networkMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHaveNetwork:(BOOL)a3
{
  self->_haveNetwork = a3;
}

- (BOOL)haveNetwork
{
  return self->_haveNetwork;
}

- (void)setReachabilityDependency:(id)a3
{
}

- (CKKSResultOperation)reachabilityDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isNetworkError:(id)a3
{
  return +[CKKSReachabilityTracker isNetworkError:a3];
}

- (void)setNetworkReachability:(BOOL)a3
{
  v5 = [(CKKSReachabilityTracker *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001173AC;
  v6[3] = &unk_1003055B0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (void)_onqueueSetNetworkReachability:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CKKSReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = [(CKKSReachabilityTracker *)self haveNetwork];
  [(CKKSReachabilityTracker *)self setHaveNetwork:v3];
  if (v5 != [(CKKSReachabilityTracker *)self haveNetwork])
  {
    if ([(CKKSReachabilityTracker *)self haveNetwork])
    {
      [(CKKSReachabilityTracker *)self _onQueueRunReachabilityDependency];
    }
    else
    {
      [(CKKSReachabilityTracker *)self _onQueueResetReachabilityDependency];
    }
  }
}

- (void)_onQueueResetReachabilityDependency
{
  BOOL v3 = [(CKKSReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CKKSReachabilityTracker *)self reachabilityDependency];
  if (!v4
    || (v5 = (void *)v4,
        [(CKKSReachabilityTracker *)self reachabilityDependency],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isPending],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8 = sub_1000CD884(@"network", 0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network unavailable", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100117738;
    v21[3] = &unk_1003077A0;
    objc_copyWeak(&v22, &location);
    v9 = +[CKKSResultOperation named:@"network-available-dependency" withBlock:v21];
    [(CKKSReachabilityTracker *)self setReachabilityDependency:v9];

    v10 = [(CKKSReachabilityTracker *)self queue];
    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);
    [(CKKSReachabilityTracker *)self setTimer:v11];

    v12 = [(CKKSReachabilityTracker *)self timer];
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1001177CC;
    v19 = &unk_1003077A0;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v12, &v16);

    v13 = [(CKKSReachabilityTracker *)self timer];
    dispatch_time_t v14 = dispatch_time(0, 43200000000000);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

    v15 = [(CKKSReachabilityTracker *)self timer];
    dispatch_resume(v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_onQueueRunReachabilityDependency
{
  BOOL v3 = [(CKKSReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CKKSReachabilityTracker *)self reachabilityDependency];

  if (v4)
  {
    v5 = [(CKKSReachabilityTracker *)self operationQueue];
    v6 = [(CKKSReachabilityTracker *)self reachabilityDependency];
    [v5 addOperation:v6];

    [(CKKSReachabilityTracker *)self setReachabilityDependency:0];
  }
  unsigned __int8 v7 = [(CKKSReachabilityTracker *)self timer];

  if (v7)
  {
    v8 = [(CKKSReachabilityTracker *)self timer];
    dispatch_source_cancel(v8);

    [(CKKSReachabilityTracker *)self setTimer:0];
  }
}

- (BOOL)currentReachability
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(CKKSReachabilityTracker *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100117B24;
  v5[3] = &unk_100307348;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)description
{
  unsigned int v2 = [(CKKSReachabilityTracker *)self haveNetwork];
  CFStringRef v3 = @"offline";
  if (v2) {
    CFStringRef v3 = @"online";
  }
  return +[NSString stringWithFormat:@"<CKKSReachabilityTracker: %@>", v3];
}

- (CKKSReachabilityTracker)init
{
  v21.receiver = self;
  v21.super_class = (Class)CKKSReachabilityTracker;
  id v2 = [(CKKSReachabilityTracker *)&v21 init];
  if (v2)
  {
    CFStringRef v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("reachabiltity-tracker", v3);
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    id v6 = objc_alloc_init((Class)NSOperationQueue);
    unsigned __int8 v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    uint64_t v8 = *((void *)v2 + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100117DC0;
    block[3] = &unk_100308558;
    char v9 = v2;
    id v20 = v9;
    dispatch_sync(v8, block);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v9);
    nw_path_monitor_t v10 = nw_path_monitor_create();
    dispatch_source_t v11 = (void *)v9[5];
    v9[5] = v10;

    v12 = [v9 networkMonitor];
    nw_path_monitor_set_queue(v12, *((dispatch_queue_t *)v2 + 3));

    v13 = [v9 networkMonitor];
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_100117DC8;
    update_handler[3] = &unk_1002FA820;
    objc_copyWeak(&v17, &location);
    nw_path_monitor_set_update_handler(v13, update_handler);

    dispatch_time_t v14 = [v9 networkMonitor];
    nw_path_monitor_start(v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return (CKKSReachabilityTracker *)v2;
}

+ (BOOL)isNetworkFailureError:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  v5 = [v3 domain];
  if (![v5 isEqualToString:CKErrorDomain])
  {

    goto LABEL_6;
  }
  id v6 = [v4 code];

  if (v6 != (id)4)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_12;
  }
  if (!+[CKKSReachabilityTracker isNetworkFailureError:v3])
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:CKErrorDomain])
    {
      id v6 = [v3 code];

      if (v6 == (id)3) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    BOOL v7 = [v3 domain];
    if ([v7 isEqualToString:NSURLErrorDomain])
    {
      if ([v3 code] == (id)-1001)
      {

        goto LABEL_3;
      }
      id v9 = [v3 code];

      if (v9 == (id)-1009) {
        goto LABEL_3;
      }
    }
    else
    {
    }
LABEL_12:
    BOOL v4 = 0;
    goto LABEL_13;
  }
LABEL_3:
  BOOL v4 = 1;
LABEL_13:

  return v4;
}

@end