@interface _DASRemoteDeviceNearbyMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)isRemoteDeviceNearby:(id)a3;
- (BOOL)resetNearbyDevicesWithCurrentDevices:(id)a3;
- (NSMutableSet)nearbyDevices;
- (NSMutableSet)pendingWidgets;
- (NSSet)lastRegisteredDevices;
- (OS_dispatch_queue)queue;
- (OS_nw_browser)browser;
- (OS_nw_parameters)parameters;
- (_DASDaemon)daemon;
- (_DASRemoteDeviceNearbyMonitor)initWithDaemon:(id)a3;
- (id)createParameters;
- (id)remoteDevices;
- (id)setUpNetworkBrowserWithDevices:(id)a3;
- (os_unfair_lock_s)lock;
- (os_unfair_lock_s)pendingWidgetsLock;
- (void)protectedRegisterForRemoteDevices;
- (void)registerForRemoteDeviceWithActivity:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setLastRegisteredDevices:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPendingWidgets:(id)a3;
- (void)setPendingWidgetsLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setUpBrowserResultsChanged:(id)a3;
- (void)setUpBrowserStateChange:(id)a3;
- (void)unregisterForRemoteDeviceWithActivity:(id)a3;
- (void)updateDeviceLost:(id)a3;
- (void)updateDeviceNearby:(id)a3;
@end

@implementation _DASRemoteDeviceNearbyMonitor

- (_DASRemoteDeviceNearbyMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DASRemoteDeviceNearbyMonitor;
  v6 = [(_DASRemoteDeviceNearbyMonitor *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nearbyRemoteMonitor.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[NSMutableSet set];
    pendingWidgets = v7->_pendingWidgets;
    v7->_pendingWidgets = (NSMutableSet *)v11;

    uint64_t v13 = +[NSMutableSet set];
    nearbyDevices = v7->_nearbyDevices;
    v7->_nearbyDevices = (NSMutableSet *)v13;

    *(void *)&v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F408;
  block[3] = &unk_1001754F8;
  id v8 = a3;
  uint64_t v3 = qword_1001C3AE8;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_1001C3AE8, block);
  }
  id v5 = (id)qword_1001C3AF0;

  return v5;
}

- (id)remoteDevices
{
  uint64_t v3 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(_DASRemoteDeviceNearbyMonitor *)self pendingWidgets];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 remoteDevice];

        if (v10)
        {
          uint64_t v11 = [v9 remoteDevice];
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)registerForRemoteDeviceWithActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 remoteDevice];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 targetDevice];

    if (v7 == (id)3)
    {
      queue = self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001F67C;
      v9[3] = &unk_100175570;
      v9[4] = self;
      id v10 = v4;
      dispatch_sync(queue, v9);
    }
  }
}

- (void)unregisterForRemoteDeviceWithActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 remoteDevice];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 targetDevice];

    if (v7 == (id)3)
    {
      queue = self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001F7B0;
      v9[3] = &unk_100175570;
      v9[4] = self;
      id v10 = v4;
      dispatch_sync(queue, v9);
    }
  }
}

- (void)updateDeviceLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3230();
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
  unsigned int v8 = [v7 containsObject:v4];

  if (v8)
  {
    dispatch_queue_t v9 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Device %@ is no longer nearby", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
    [v10 removeObject:v4];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateDeviceNearby:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000F32A4();
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
  [v6 addObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  id v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001FAC4;
  v9[3] = &unk_100175570;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (BOOL)isRemoteDeviceNearby:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
  unsigned __int8 v7 = [v6 containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)resetNearbyDevicesWithCurrentDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(NSSet *)self->_lastRegisteredDevices mutableCopy];
  v17 = v4;
  [v5 minusSet:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        os_unfair_lock_lock(&self->_lock);
        id v12 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
        unsigned int v13 = [v12 containsObject:v11];

        if (v13)
        {
          long long v14 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting %@ to not nearby", buf, 0xCu);
          }

          long long v15 = [(_DASRemoteDeviceNearbyMonitor *)self nearbyDevices];
          [v15 removeObject:v11];
        }
        os_unfair_lock_unlock(&self->_lock);
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  return 1;
}

- (void)protectedRegisterForRemoteDevices
{
  uint64_t v3 = [(_DASRemoteDeviceNearbyMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_DASRemoteDeviceNearbyMonitor *)self remoteDevices];
  if ([v4 isEqualToSet:self->_lastRegisteredDevices])
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3318();
    }
    goto LABEL_13;
  }
  [(_DASRemoteDeviceNearbyMonitor *)self resetNearbyDevicesWithCurrentDevices:v4];
  id v6 = [(_DASRemoteDeviceNearbyMonitor *)self browser];

  if (v6)
  {
    id v7 = [(_DASRemoteDeviceNearbyMonitor *)self browser];
    nw_browser_set_browse_results_changed_handler(v7, 0);

    id v8 = [(_DASRemoteDeviceNearbyMonitor *)self browser];
    nw_browser_set_state_changed_handler(v8, 0);

    uint64_t v9 = [(_DASRemoteDeviceNearbyMonitor *)self browser];
    nw_browser_cancel(v9);

    [(_DASRemoteDeviceNearbyMonitor *)self setBrowser:0];
    [(_DASRemoteDeviceNearbyMonitor *)self setLastRegisteredDevices:0];
  }
  if (![v4 count]) {
    goto LABEL_9;
  }
  uint64_t v10 = [(_DASRemoteDeviceNearbyMonitor *)self setUpNetworkBrowserWithDevices:v4];
  if (v10)
  {
    uint64_t v11 = v10;
    [(_DASRemoteDeviceNearbyMonitor *)self setUpBrowserStateChange:v10];
    [(_DASRemoteDeviceNearbyMonitor *)self setUpBrowserResultsChanged:v11];
    id v12 = [(_DASRemoteDeviceNearbyMonitor *)self queue];
    nw_browser_set_queue(v11, v12);

    nw_browser_start(v11);
    [(_DASRemoteDeviceNearbyMonitor *)self setBrowser:v11];

LABEL_9:
    [(_DASRemoteDeviceNearbyMonitor *)self setLastRegisteredDevices:v4];
    id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      long long v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Create browser to monitor %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000F3358();
  }
LABEL_13:
}

- (id)createParameters
{
  nw_parameters_t application_service = nw_parameters_create_application_service();
  nw_parameters_set_include_screen_off_devices();
  nw_parameters_set_include_ble();
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, off_1001C2940);
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, off_1001C2948);
  nw_parameters_set_required_netagent_classes();
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, 0x3E9uLL);
  nw_parameters_set_preferred_interface_subtypes();
  if (application_service)
  {
    id v6 = application_service;
  }
  else
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F33CC();
    }
  }

  return application_service;
}

- (id)setUpNetworkBrowserWithDevices:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = [(_DASRemoteDeviceNearbyMonitor *)self parameters];

  if (v5
    || ([(_DASRemoteDeviceNearbyMonitor *)self createParameters],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(_DASRemoteDeviceNearbyMonitor *)self setParameters:v6],
        v6,
        [(_DASRemoteDeviceNearbyMonitor *)self parameters],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    nw_parameters_t application_service = nw_browse_descriptor_create_application_service(off_1001C2938);
    nw_browse_descriptor_set_browse_scope();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "UTF8String", (void)v18)) {
            nw_browse_descriptor_add_device_filter();
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    long long v15 = [(_DASRemoteDeviceNearbyMonitor *)self parameters];
    nw_browser_t v16 = nw_browser_create(application_service, v15);
  }
  else
  {
    nw_browser_t v16 = 0;
  }

  return v16;
}

- (void)setUpBrowserResultsChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020558;
  v5[3] = &unk_100175668;
  objc_copyWeak(&v6, &location);
  nw_browser_set_browse_results_changed_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setUpBrowserStateChange:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableSet)pendingWidgets
{
  return self->_pendingWidgets;
}

- (void)setPendingWidgets:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSSet)lastRegisteredDevices
{
  return self->_lastRegisteredDevices;
}

- (void)setLastRegisteredDevices:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)pendingWidgetsLock
{
  return self->_pendingWidgetsLock;
}

- (void)setPendingWidgetsLock:(os_unfair_lock_s)a3
{
  self->_pendingWidgetsLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRegisteredDevices, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_pendingWidgets, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end