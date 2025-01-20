@interface UARPServiceMonitorBSDNotification
- (UARPServiceMonitorBSDNotification)initWithBsdNotification:(id)a3 delegate:(id)a4;
- (void)bsdNotification;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation UARPServiceMonitorBSDNotification

- (UARPServiceMonitorBSDNotification)initWithBsdNotification:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPServiceMonitorBSDNotification;
  v8 = [(UARPServiceMonitorBSDNotification *)&v18 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "uarpMonitor");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    objc_storeStrong((id *)&v8->_delegate, a4);
    v8->_token = -1;
    v11 = (NSString *)[v6 copy];
    bsdNotification = v8->_bsdNotification;
    v8->_bsdNotification = v11;

    dispatch_queue_t v13 = dispatch_queue_create("UARPServiceMonitorBSDNotification", 0);
    notifyQueue = v8->_notifyQueue;
    v8->_notifyQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("UARPServiceMonitorBSDNotificationDelegate", 0);
    delegateQueue = v8->_delegateQueue;
    v8->_delegateQueue = (OS_dispatch_queue *)v15;
  }
  return v8;
}

- (void)dealloc
{
  [(UARPServiceMonitorBSDNotification *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)UARPServiceMonitorBSDNotification;
  [(UARPServiceMonitorBSDNotification *)&v3 dealloc];
}

- (void)start
{
  p_token = &self->_token;
  if (self->_token == -1)
  {
    p_bsdNotification = (uint64_t *)&self->_bsdNotification;
    v5 = [(NSString *)self->_bsdNotification UTF8String];
    objc_initWeak(&location, self);
    notifyQueue = self->_notifyQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100017660;
    v9[3] = &unk_1000387F8;
    objc_copyWeak(&v10, &location);
    uint32_t v7 = notify_register_dispatch(v5, p_token, (dispatch_queue_t)notifyQueue, v9);
    if (v7)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100026384(p_bsdNotification, v7, (os_log_t)log);
      }
    }
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)stop
{
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017714;
  block[3] = &unk_1000385A8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)notifyQueue, block);
}

- (void)bsdNotification
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000177C0;
  block[3] = &unk_1000385A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_bsdNotification, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end