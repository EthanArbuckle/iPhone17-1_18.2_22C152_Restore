@interface _DASRemoteDeviceActivityMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BMBiomeScheduler)scheduler;
- (BMDSL)localDSL;
- (BMDSL)remoteDSL;
- (BOOL)anyRemoteDeviceActive;
- (BOOL)isRegistered;
- (BOOL)pendingUnregistration;
- (BPSSink)sink;
- (ContextSyncClient)contextSyncClient;
- (NSMutableDictionary)recentlyUsedPhotosAppDevices;
- (NSMutableSet)remoteDeviceActivityState;
- (OS_dispatch_queue)queue;
- (_DASDaemon)daemon;
- (_DASRemoteDeviceActivityMonitor)initWithDaemon:(id)a3;
- (id)state;
- (os_unfair_lock_s)lock;
- (void)clearRemoteDeviceActiveSet;
- (void)registerForRemoteDeviceActiveNotificationsWithChange:(id)a3;
- (void)runUpdateRecentlyUsedPhotosAppDevicesTask;
- (void)scheduleUpdateRecentlyUsedPhotosAppDevices;
- (void)setContextSyncClient:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setLocalDSL:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPendingUnregistration:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRecentlyUsedPhotosAppDevices:(id)a3;
- (void)setRemoteDSL:(id)a3;
- (void)setRemoteDeviceActivityState:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSink:(id)a3;
- (void)unregisterForRemoteDeviceActiveNotifications;
@end

@implementation _DASRemoteDeviceActivityMonitor

- (id)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_remoteDeviceActivityState;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)anyRemoteDeviceActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableSet *)self->_remoteDeviceActivityState count];
  os_unfair_lock_unlock(p_lock);
  return v4 != 0;
}

- (void)clearRemoteDeviceActiveSet
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_remoteDeviceActivityState removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRegistered
{
  return self->_sink != 0;
}

- (void)registerForRemoteDeviceActiveNotificationsWithChange:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices count])
  {
    contextSyncClient = self->_contextSyncClient;
    remoteDSL = self->_remoteDSL;
    v7 = [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices allKeys];
    id v19 = 0;
    [(ContextSyncClient *)contextSyncClient registerForUpdates:remoteDSL withIdentifier:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor" forUseCase:@"PhotosIntentSyncRemoteDeviceActivity" withOptions:3 forDevices:v7 withError:&v19];
    v8 = v19;

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableSet *)self->_remoteDeviceActivityState removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    self->_pendingUnregistration = 0;
    v9 = (BMBiomeScheduler *)[objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor" targetQueue:self->_queue];
    v10 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices allKeys];
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DASContext: Registering for remote device activity for devices: %@", buf, 0xCu);
    }
    v12 = [(BMDSL *)self->_localDSL subscribeOn:v9];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000EF758;
    v17[3] = &unk_100178758;
    v17[4] = self;
    id v18 = v4;
    v13 = [v12 sinkWithCompletion:&stru_100178730 receiveInput:v17];

    scheduler = self->_scheduler;
    self->_scheduler = v9;
    v15 = v9;

    sink = self->_sink;
    self->_sink = v13;
  }
  else
  {
    v8 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DASContext: No remote devices recently used Photos. Not registering", buf, 2u);
    }
  }
}

- (void)unregisterForRemoteDeviceActiveNotifications
{
  id v3 = [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices count];
  contextSyncClient = self->_contextSyncClient;
  remoteDSL = self->_remoteDSL;
  if (v3)
  {
    v6 = [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices allKeys];
    id v12 = 0;
    [(ContextSyncClient *)contextSyncClient unregisterForUpdates:remoteDSL withIdentifier:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor" forUseCase:@"PhotosIntentSyncRemoteDeviceActivity" forDevices:v6 withError:&v12];
    id v7 = v12;
  }
  else
  {
    id v13 = 0;
    [(ContextSyncClient *)contextSyncClient unregisterForUpdates:remoteDSL withIdentifier:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor" forUseCase:@"PhotosIntentSyncRemoteDeviceActivity" forDeviceTypes:6 withError:&v13];
    id v7 = v13;
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_remoteDeviceActivityState removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  self->_pendingUnregistration = 0;
  v8 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices allKeys];
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DASContext: Unregistering for remote device activity for devices: %@", buf, 0xCu);
  }
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (void)runUpdateRecentlyUsedPhotosAppDevicesTask
{
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "schedule: Running updateRecentlyUsedPhotosAppDevices background task", buf, 2u);
  }

  if (![(_DASRemoteDeviceActivityMonitor *)self isRegistered])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_recentlyUsedPhotosAppDevices removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    [v5 setObject:self->_recentlyUsedPhotosAppDevices forKey:@"recentlyusedphotosappdevices"];

    v6 = objc_opt_new();
    id v24 = 0;
    id v7 = [v6 remoteDevicesWithError:&v24];
    id v4 = v24;
    v8 = +[NSPredicate predicateWithBlock:&stru_100178798];
    v9 = [v7 filteredArrayUsingPredicate:v8];

    if (v4)
    {
      v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001011B0((uint64_t)v4, v10);
      }
    }
    else
    {
      if (![v9 count])
      {
LABEL_16:

        goto LABEL_17;
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v12 = v11 + -345600.0;
      id v13 = BiomeLibrary();
      v14 = [v13 App];
      v10 = [v14 InFocus];

      v15 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26[0] = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DASContext: Remote devices from stream: %@", buf, 0xCu);
      }

      v16 = [v10 publishersForDevices:v9 withUseCase:@"PhotosIntentSyncRemoteDeviceAppInFocus" startTime:0 includeLocal:&stru_1001787D8 pipeline:v12];
      v17 = [v16 publishers];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000F0044;
      v21[3] = &unk_100178868;
      id v22 = v9;
      v23 = self;
      [v17 enumerateObjectsUsingBlock:v21];

      id v18 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
      [v18 setObject:self->_recentlyUsedPhotosAppDevices forKey:@"recentlyusedphotosappdevices"];

      id v19 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        recentlyUsedPhotosAppDevices = self->_recentlyUsedPhotosAppDevices;
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = 4;
        WORD2(v26[0]) = 2112;
        *(void *)((char *)v26 + 6) = recentlyUsedPhotosAppDevices;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DASContext: Remote devices that opened Photos in the last %d days: %@", buf, 0x12u);
      }
    }
    goto LABEL_16;
  }
  id v4 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DASContext: Will not update recently used Photos App remote devices while currently registered to a set of devices", buf, 2u);
  }
LABEL_17:
}

- (void)scheduleUpdateRecentlyUsedPhotosAppDevices
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F0498;
  v12[3] = &unk_100175600;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.updateRecentlyUsedPhotosAppDevices" usingQueue:0 launchHandler:v12];

  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [v4 taskRequestForIdentifier:@"com.apple.dasd.updateRecentlyUsedPhotosAppDevices"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.dasd.updateRecentlyUsedPhotosAppDevices"];
    [v6 setPriority:1];
    [v6 setRequiresExternalPower:1];
    [v6 setInterval:86400.0];
    id v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v11 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (_DASRemoteDeviceActivityMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_DASRemoteDeviceActivityMonitor;
  id v6 = [(_DASRemoteDeviceActivityMonitor *)&v36 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    unsigned __int8 v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duetactivityscheduler.remotedeviceactivitymonitor", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = (ContextSyncClient *)[objc_alloc((Class)ContextSyncClient) initWithClientName:@"com.apple.duetactivityscheduler.remotedeviceactivitymonitor"];
    contextSyncClient = v7->_contextSyncClient;
    v7->_contextSyncClient = v11;

    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[NSMutableSet set];
    remoteDeviceActivityState = v7->_remoteDeviceActivityState;
    v7->_remoteDeviceActivityState = (NSMutableSet *)v13;

    v15 = BiomeLibrary();
    v16 = [v15 Activity];
    v17 = [v16 Level];
    id v18 = [v17 DSLPublisher];
    uint64_t v19 = [v18 filterWithKeyPath:@"eventBody.inUseStatus" comparison:0 value:&off_1001877C8];
    remoteDSL = v7->_remoteDSL;
    v7->_remoteDSL = (BMDSL *)v19;

    v21 = BiomeLibrary();
    id v22 = [v21 ContextSync];
    v23 = [v22 DeviceActivityLevel];
    uint64_t v24 = [v23 DSLPublisher];
    localDSL = v7->_localDSL;
    v7->_localDSL = (BMDSL *)v24;

    id v26 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v27 = [v26 dictionaryForKey:@"recentlyusedphotosappdevices"];
    v28 = (NSMutableDictionary *)[v27 mutableCopy];
    recentlyUsedPhotosAppDevices = v7->_recentlyUsedPhotosAppDevices;
    v7->_recentlyUsedPhotosAppDevices = v28;

    if (!v7->_recentlyUsedPhotosAppDevices)
    {
      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v31 = v7->_recentlyUsedPhotosAppDevices;
      v7->_recentlyUsedPhotosAppDevices = v30;
    }
    v32 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v7->_recentlyUsedPhotosAppDevices;
      *(_DWORD *)buf = 67109378;
      int v38 = 4;
      __int16 v39 = 2112;
      v40 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "DASContext: Loaded from defaults - remote devices that opened Photos in the last %d days: %@", buf, 0x12u);
    }

    v7->_pendingUnregistration = 0;
    v34 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "DASContext: Set up remote device activity monitor", buf, 2u);
    }
  }
  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  unsigned __int8 v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1000F08A4;
  id v11 = &unk_100175F40;
  id v12 = a3;
  id v13 = a1;
  uint64_t v4 = qword_1001C4560;
  id v5 = v12;
  if (v4 != -1) {
    dispatch_once(&qword_1001C4560, &v8);
  }
  [objc_msgSend((id)qword_1001C4568, "scheduleUpdateRecentlyUsedPhotosAppDevices", v8, v9, v10, v11);
  id v6 = (id)qword_1001C4568;

  return v6;
}

- (BOOL)pendingUnregistration
{
  return self->_pendingUnregistration;
}

- (void)setPendingUnregistration:(BOOL)a3
{
  self->_pendingUnregistration = a3;
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (ContextSyncClient)contextSyncClient
{
  return self->_contextSyncClient;
}

- (void)setContextSyncClient:(id)a3
{
}

- (BMDSL)remoteDSL
{
  return self->_remoteDSL;
}

- (void)setRemoteDSL:(id)a3
{
}

- (BMDSL)localDSL
{
  return self->_localDSL;
}

- (void)setLocalDSL:(id)a3
{
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
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

- (NSMutableSet)remoteDeviceActivityState
{
  return self->_remoteDeviceActivityState;
}

- (void)setRemoteDeviceActivityState:(id)a3
{
}

- (NSMutableDictionary)recentlyUsedPhotosAppDevices
{
  return self->_recentlyUsedPhotosAppDevices;
}

- (void)setRecentlyUsedPhotosAppDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedPhotosAppDevices, 0);
  objc_storeStrong((id *)&self->_remoteDeviceActivityState, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_localDSL, 0);
  objc_storeStrong((id *)&self->_remoteDSL, 0);
  objc_storeStrong((id *)&self->_contextSyncClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end