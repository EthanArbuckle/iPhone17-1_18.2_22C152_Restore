@interface _DASRemoteDeviceWakeMonitor
+ (BOOL)appliesToActivity:(id)a3;
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)isRemoteDeviceAwake:(id)a3;
- (BOOL)unprotectedIsAlreadyPendingActivity:(id)a3;
- (BOOL)unprotectedIsRemoteDeviceConnected:(id)a3;
- (BOOL)unprotectedIsRemoteDeviceNearby:(id)a3;
- (NSCountedSet)monitorCount;
- (NSMutableDictionary)connectedDevices;
- (NSMutableDictionary)deviceMonitors;
- (NSMutableSet)pendingActivities;
- (OS_dispatch_queue)queue;
- (_DASDaemon)daemon;
- (_DASRemoteDeviceWakeMonitor)initWithDaemon:(id)a3;
- (id)unprotectedInitializeMonitorForDevice:(id)a3;
- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)registerRemoteDeviceWakeStateWithActivity:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDeviceMonitors:(id)a3;
- (void)setMonitorCount:(id)a3;
- (void)setPendingActivities:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterRemoteDeviceWakeStateWithActivity:(id)a3;
@end

@implementation _DASRemoteDeviceWakeMonitor

- (_DASRemoteDeviceWakeMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_DASRemoteDeviceWakeMonitor;
  v6 = [(_DASRemoteDeviceWakeMonitor *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.remoteWakeMonitor.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    deviceMonitors = v7->_deviceMonitors;
    v7->_deviceMonitors = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    connectedDevices = v7->_connectedDevices;
    v7->_connectedDevices = (NSMutableDictionary *)v13;

    uint64_t v15 = +[NSMutableSet set];
    pendingActivities = v7->_pendingActivities;
    v7->_pendingActivities = (NSMutableSet *)v15;
  }
  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043B48;
  block[3] = &unk_1001754F8;
  id v8 = a3;
  uint64_t v3 = qword_1001C3C90;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_1001C3C90, block);
  }
  id v5 = (id)qword_1001C3C98;

  return v5;
}

+ (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 remoteDevice];
  if (!v4 || [v3 targetDevice] != (id)1)
  {

    goto LABEL_6;
  }
  unsigned __int8 v5 = [v3 requiresRemoteDeviceWake];

  if ((v5 & 1) == 0)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (BOOL)isRemoteDeviceAwake:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self->_deviceMonitors;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)self->_deviceMonitors objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 isAsleep];
    unsigned int v9 = [(_DASRemoteDeviceWakeMonitor *)self unprotectedIsRemoteDeviceConnected:v7];
    unsigned int v10 = [(_DASRemoteDeviceWakeMonitor *)self unprotectedIsRemoteDeviceNearby:v7];
    uint64_t v11 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"awake";
      if (v8) {
        CFStringRef v12 = @"asleep";
      }
      if (v9) {
        CFStringRef v13 = @"connected";
      }
      else {
        CFStringRef v13 = @"disconnected";
      }
      int v19 = 138413058;
      id v20 = v4;
      CFStringRef v22 = v12;
      __int16 v21 = 2112;
      __int16 v23 = 2112;
      CFStringRef v24 = v13;
      if (v10) {
        CFStringRef v14 = @"nearby";
      }
      else {
        CFStringRef v14 = @"not nearby";
      }
      __int16 v25 = 2112;
      CFStringRef v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is %@, %@, %@", (uint8_t *)&v19, 0x2Au);
    }

    char v15 = v10 & ~(_BYTE)v8;
  }
  else
  {
    v16 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000F4E48();
    }

    id v17 = +[NRDeviceIdentifier copyDeviceIdentifierWithIDSDeviceID:v4];
    v7 = [(_DASRemoteDeviceWakeMonitor *)self unprotectedInitializeMonitorForDevice:v17];

    char v15 = 0;
  }

  objc_sync_exit(v5);
  return v15;
}

- (void)registerRemoteDeviceWakeStateWithActivity:(id)a3
{
  id v12 = a3;
  if (+[_DASRemoteDeviceWakeMonitor appliesToActivity:](_DASRemoteDeviceWakeMonitor, "appliesToActivity:"))
  {
    id v4 = self->_deviceMonitors;
    objc_sync_enter(v4);
    if (![(_DASRemoteDeviceWakeMonitor *)self unprotectedIsAlreadyPendingActivity:v12])
    {
      unsigned __int8 v5 = [v12 remoteDevice];
      deviceMonitors = self->_deviceMonitors;
      if (!deviceMonitors)
      {
        v7 = +[NSMutableDictionary dictionary];
        unsigned int v8 = self->_deviceMonitors;
        self->_deviceMonitors = v7;

        deviceMonitors = self->_deviceMonitors;
      }
      unsigned int v9 = [(NSMutableDictionary *)deviceMonitors objectForKeyedSubscript:v5];

      if (!v9)
      {
        id v10 = +[NRDeviceIdentifier copyDeviceIdentifierWithIDSDeviceID:v5];
        uint64_t v11 = [(_DASRemoteDeviceWakeMonitor *)self unprotectedInitializeMonitorForDevice:v10];
        if (v11)
        {
          [(NSMutableDictionary *)self->_deviceMonitors setObject:v11 forKeyedSubscript:v5];
          [(NSCountedSet *)self->_monitorCount addObject:v5];
          [(NSMutableSet *)self->_pendingActivities addObject:v12];
        }
      }
    }
    objc_sync_exit(v4);
  }
}

- (void)unregisterRemoteDeviceWakeStateWithActivity:(id)a3
{
  id v4 = a3;
  if (+[_DASRemoteDeviceWakeMonitor appliesToActivity:v4])
  {
    unsigned __int8 v5 = self->_deviceMonitors;
    objc_sync_enter(v5);
    if (![(_DASRemoteDeviceWakeMonitor *)self unprotectedIsAlreadyPendingActivity:v4])
    {
      BOOL v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F4F18();
      }
      goto LABEL_12;
    }
    BOOL v6 = [v4 remoteDevice];
    [(NSMutableSet *)self->_pendingActivities removeObject:v4];
    [(NSCountedSet *)self->_monitorCount removeObject:v6];
    v7 = [(NSMutableDictionary *)self->_deviceMonitors objectForKeyedSubscript:v6];

    if (v7)
    {
      if ([(NSCountedSet *)self->_monitorCount containsObject:v6])
      {
LABEL_12:

        objc_sync_exit(v5);
        goto LABEL_13;
      }
      [(NSMutableDictionary *)self->_deviceMonitors removeObjectForKey:v6];
      unsigned int v8 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stop monitoring screen wake state for %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      unsigned int v8 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F4EB0();
      }
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)unprotectedIsAlreadyPendingActivity:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v5 = self->_pendingActivities;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uuid:v13];
        id v10 = [v4 uuid];
        unsigned __int8 v11 = [v9 isEqual:v10];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)unprotectedInitializeMonitorForDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [objc_alloc((Class)NRDeviceMonitor) initWithDeviceIdentifier:v4 delegate:self queue:self->_queue];
    id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started monitoring screen wake state with identifier %@", (uint8_t *)&v17, 0xCu);
      }

      unsigned __int8 v5 = v5;
      unsigned int v8 = v5;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F4FF0();
      }

      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000F4F80(v5, v9, v10, v11, v12, v13, v14, v15);
    }
    unsigned int v8 = 0;
  }

  return v8;
}

- (BOOL)unprotectedIsRemoteDeviceConnected:(id)a3
{
  return [a3 isConnected];
}

- (BOOL)unprotectedIsRemoteDeviceNearby:(id)a3
{
  return [a3 isConnected];
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  id v5 = a3;
  v30 = v5;
  if (a4)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v30 deviceIdentifier];
      *(_DWORD *)buf = 138412290;
      v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now asleep", buf, 0xCu);
    }
  }
  else
  {
    unsigned int v8 = v5;
    if ([v5 isConnected])
    {
      if ([v8 isNearby])
      {
        __int16 v25 = +[NSMutableSet set];
        CFStringRef v24 = self->_deviceMonitors;
        objc_sync_enter(v24);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v9 = [(_DASRemoteDeviceWakeMonitor *)self pendingActivities];
        id v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v10)
        {
          id obj = v9;
          uint64_t v27 = *(void *)v37;
          do
          {
            id v29 = v10;
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v37 != v27) {
                objc_enumerationMutation(obj);
              }
              v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v12 = [v31 remoteDevice];
              uint64_t v13 = [(NSMutableDictionary *)self->_deviceMonitors objectForKeyedSubscript:v12];
              uint64_t v14 = [v13 deviceIdentifier];
              uint64_t v15 = [v14 nrDeviceIdentifier];
              long long v16 = [v15 UUIDString];
              int v17 = [v30 deviceIdentifier];
              id v18 = [v17 nrDeviceIdentifier];
              int v19 = [v18 UUIDString];
              unsigned int v20 = [v16 isEqualToString:v19];

              if (v20) {
                [v25 addObject:v31];
              }
            }
            uint64_t v9 = obj;
            id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v10);
        }

        objc_sync_exit(v24);
        __int16 v21 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000448F8;
        block[3] = &unk_100175548;
        id v33 = v30;
        id v34 = v25;
        v35 = self;
        id v6 = v25;
        dispatch_async(v21, block);
      }
      else
      {
        id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = [v30 deviceIdentifier];
          *(_DWORD *)buf = 138412290;
          v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ awake, connected, but not nearby", buf, 0xCu);
        }
      }
    }
    else
    {
      id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v22 = [v30 deviceIdentifier];
        *(_DWORD *)buf = 138412290;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ awake but disconnected", buf, 0xCu);
      }
    }
  }
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 deviceIdentifier];
    unsigned int v8 = (void *)v7;
    CFStringRef v9 = @"disconnected";
    if (v4) {
      CFStringRef v9 = @"connected";
    }
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    CFStringRef v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 deviceIdentifier];
    unsigned int v8 = (void *)v7;
    CFStringRef v9 = @"not nearby";
    if (v4) {
      CFStringRef v9 = @"nearby";
    }
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    CFStringRef v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now %@", (uint8_t *)&v10, 0x16u);
  }
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableDictionary)deviceMonitors
{
  return self->_deviceMonitors;
}

- (void)setDeviceMonitors:(id)a3
{
}

- (NSMutableDictionary)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
}

- (NSCountedSet)monitorCount
{
  return self->_monitorCount;
}

- (void)setMonitorCount:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitorCount, 0);
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_deviceMonitors, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end