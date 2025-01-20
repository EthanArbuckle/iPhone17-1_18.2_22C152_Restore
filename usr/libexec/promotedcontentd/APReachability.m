@interface APReachability
- (APReachability)initWithDelegate:(id)a3;
- (APReachabilityMonitoring)delegate;
- (APUnfairRecursiveLock)lock;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path)currentPath;
- (OS_nw_path_monitor)monitor;
- (int64_t)currentStatus;
- (void)_updateNetwork:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setCurrentStatus:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation APReachability

- (APReachability)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APReachability;
  v5 = [(APReachability *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (APUnfairRecursiveLock)lock
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000829BC;
  block[3] = &unk_100233D50;
  block[4] = self;
  if (qword_100289710 != -1) {
    dispatch_once(&qword_100289710, block);
  }
  return self->_lock;
}

- (int64_t)currentStatus
{
  v3 = [(APReachability *)self lock];
  [v3 lock];

  int64_t currentStatus = self->_currentStatus;
  v5 = [(APReachability *)self lock];
  [v5 unlock];

  return currentStatus;
}

- (void)startMonitoring
{
  v3 = [(APReachability *)self lock];
  [v3 lock];

  if (!self->_monitorQueue)
  {
    id v4 = +[NSString stringWithFormat:@"com.apple.ap.deviceinfo.reachability.%p", self];
    v5 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);
    monitorQueue = self->_monitorQueue;
    self->_monitorQueue = v5;
  }
  if (!self->_monitor)
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Initializing reachability", buf, 2u);
    }

    self->_int64_t currentStatus = 0;
    objc_super v8 = (OS_nw_path_monitor *)nw_path_monitor_create();
    monitor = self->_monitor;
    self->_monitor = v8;

    v10 = [(APReachability *)self monitor];
    v11 = [(APReachability *)self monitorQueue];
    nw_path_monitor_set_queue(v10, v11);

    v12 = self->_monitor;
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_100082C00;
    update_handler[3] = &unk_100234A90;
    update_handler[4] = self;
    nw_path_monitor_set_update_handler(v12, update_handler);
    v13 = [(APReachability *)self monitor];
    nw_path_monitor_start(v13);
  }
  v14 = [(APReachability *)self lock];
  [v14 unlock];
}

- (void)stopMonitoring
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Tearing down reachability", v9, 2u);
  }

  id v4 = [(APReachability *)self lock];
  [v4 lock];

  v5 = [(APReachability *)self monitor];
  nw_path_monitor_cancel(v5);

  monitor = self->_monitor;
  self->_monitor = 0;

  currentPath = self->_currentPath;
  self->_int64_t currentStatus = 0;
  self->_currentPath = 0;

  objc_super v8 = [(APReachability *)self lock];
  [v8 unlock];
}

- (void)_updateNetwork:(id)a3
{
  v5 = a3;
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received network update from nw_path_monitor", (uint8_t *)&v18, 2u);
  }

  v7 = [(APReachability *)self lock];
  [v7 lock];

  p_currentPath = &self->_currentPath;
  if (!nw_path_is_equal(v5, (nw_path_t)self->_currentPath))
  {
    objc_storeStrong((id *)&self->_currentPath, a3);
    nw_path_status_t status = nw_path_get_status((nw_path_t)*p_currentPath);
    uint64_t v10 = 0;
    switch(status)
    {
      case nw_path_status_invalid:
      case nw_path_status_unsatisfied:
        break;
      case nw_path_status_satisfied:
      case nw_path_status_satisfiable:
        if (nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_wifi)
          || nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_wired)
          || nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_other))
        {
          uint64_t v10 = 2;
        }
        else
        {
          uint64_t v10 = 0;
        }
        if (nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_cellular)) {
          v10 |= 4uLL;
        }
        break;
      default:
        v11 = APLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v18 = 67109120;
          LODWORD(v19) = status;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unknown network status flags: %u", (uint8_t *)&v18, 8u);
        }

        uint64_t v10 = 0;
        break;
    }
    if (nw_path_is_expensive((nw_path_t)self->_currentPath)) {
      v10 |= 8uLL;
    }
    if (nw_path_is_constrained((nw_path_t)self->_currentPath)) {
      v10 |= 0x10uLL;
    }
    if (self->_currentStatus != v10)
    {
      v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = _statusToString(self->_currentStatus);
        v14 = _statusToString(v10);
        int v18 = 138412546;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Updating network status from (%@) to (%@)", (uint8_t *)&v18, 0x16u);
      }
      self->_int64_t currentStatus = v10;
      v15 = [(APReachability *)self delegate];

      if (v15)
      {
        v16 = [(APReachability *)self delegate];
        [v16 reachabilityChanged:-[APReachability currentStatus](self, "currentStatus")];
      }
    }
  }
  v17 = [(APReachability *)self lock];
  [v17 unlock];
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_int64_t currentStatus = a3;
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
}

- (OS_nw_path_monitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (APReachabilityMonitoring)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APReachabilityMonitoring *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_currentPath, 0);
}

@end