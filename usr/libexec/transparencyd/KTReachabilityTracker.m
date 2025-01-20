@interface KTReachabilityTracker
+ (BOOL)isNetworkError:(id)a3;
+ (BOOL)isNetworkFailureError:(id)a3;
- (BOOL)currentReachability;
- (BOOL)haveNetwork;
- (BOOL)isNetworkError:(id)a3;
- (KTReachabilityTracker)init;
- (KTResultOperation)reachabilityDependency;
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

@implementation KTReachabilityTracker

- (KTReachabilityTracker)init
{
  v21.receiver = self;
  v21.super_class = (Class)KTReachabilityTracker;
  id v2 = [(KTReachabilityTracker *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("reachabiltity-tracker", v3);
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    id v6 = objc_alloc_init((Class)NSOperationQueue);
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    v8 = *((void *)v2 + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C8894;
    block[3] = &unk_1002B6CF8;
    v9 = v2;
    id v20 = v9;
    dispatch_sync(v8, block);
    id location = 0;
    objc_initWeak(&location, v9);
    nw_path_monitor_t v10 = nw_path_monitor_create();
    v11 = (void *)v9[5];
    v9[5] = v10;

    v12 = [v9 networkMonitor];
    nw_path_monitor_set_queue(v12, *((dispatch_queue_t *)v2 + 3));

    v13 = [v9 networkMonitor];
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_1001C889C;
    update_handler[3] = &unk_1002C6B78;
    objc_copyWeak(&v17, &location);
    nw_path_monitor_set_update_handler(v13, update_handler);

    v14 = [v9 networkMonitor];
    nw_path_monitor_start(v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return (KTReachabilityTracker *)v2;
}

- (id)description
{
  unsigned int v2 = [(KTReachabilityTracker *)self haveNetwork];
  CFStringRef v3 = @"offline";
  if (v2) {
    CFStringRef v3 = @"online";
  }
  return +[NSString stringWithFormat:@"<KTReachabilityTracker: %@>", v3];
}

- (BOOL)currentReachability
{
  unsigned int v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  CFStringRef v3 = [(KTReachabilityTracker *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C8AC8;
  v5[3] = &unk_1002C3EC0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_onQueueRunReachabilityDependency
{
  CFStringRef v3 = [(KTReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(KTReachabilityTracker *)self reachabilityDependency];

  if (v4)
  {
    v5 = [(KTReachabilityTracker *)self operationQueue];
    uint64_t v6 = [(KTReachabilityTracker *)self reachabilityDependency];
    [v5 addOperation:v6];

    [(KTReachabilityTracker *)self setReachabilityDependency:0];
  }
  v7 = [(KTReachabilityTracker *)self timer];

  if (v7)
  {
    uint64_t v8 = [(KTReachabilityTracker *)self timer];
    dispatch_source_cancel(v8);

    [(KTReachabilityTracker *)self setTimer:0];
  }
}

- (void)_onQueueResetReachabilityDependency
{
  CFStringRef v3 = [(KTReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(KTReachabilityTracker *)self reachabilityDependency];
  if (!v4
    || (v5 = (void *)v4,
        [(KTReachabilityTracker *)self reachabilityDependency],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isPending],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id location = 0;
    objc_initWeak(&location, self);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Network unavailable", buf, 2u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001C8E94;
    v20[3] = &unk_1002B72D8;
    objc_copyWeak(&v21, &location);
    uint64_t v8 = +[KTResultOperation named:@"network-available-dependency" withBlock:v20];
    [(KTReachabilityTracker *)self setReachabilityDependency:v8];

    char v9 = [(KTReachabilityTracker *)self queue];
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
    [(KTReachabilityTracker *)self setTimer:v10];

    v11 = [(KTReachabilityTracker *)self timer];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1001C8FF0;
    v18 = &unk_1002B72D8;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v11, &v15);

    v12 = [(KTReachabilityTracker *)self timer];
    dispatch_time_t v13 = dispatch_time(0, 43200000000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

    v14 = [(KTReachabilityTracker *)self timer];
    dispatch_resume(v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_onqueueSetNetworkReachability:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(KTReachabilityTracker *)self queue];
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = [(KTReachabilityTracker *)self haveNetwork];
  [(KTReachabilityTracker *)self setHaveNetwork:v3];
  if (v5 != [(KTReachabilityTracker *)self haveNetwork])
  {
    if ([(KTReachabilityTracker *)self haveNetwork])
    {
      [(KTReachabilityTracker *)self _onQueueRunReachabilityDependency];
    }
    else
    {
      [(KTReachabilityTracker *)self _onQueueResetReachabilityDependency];
    }
  }
}

- (void)setNetworkReachability:(BOOL)a3
{
  v5 = [(KTReachabilityTracker *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C91AC;
  v6[3] = &unk_1002C5918;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)isNetworkError:(id)a3
{
  return +[KTReachabilityTracker isNetworkError:a3];
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_12;
  }
  if (!+[KTReachabilityTracker isNetworkFailureError:v3])
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
      id v8 = [v3 code];

      if (v8 == (id)-1001) {
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

+ (BOOL)isNetworkFailureError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
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

- (KTResultOperation)reachabilityDependency
{
  return (KTResultOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReachabilityDependency:(id)a3
{
}

- (BOOL)haveNetwork
{
  return self->_haveNetwork;
}

- (void)setHaveNetwork:(BOOL)a3
{
  self->_haveNetwork = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_nw_path_monitor)networkMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_reachabilityDependency, 0);
}

@end