@interface _DASDiskSpaceMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)isDiskSpaceAvailableForActivity:(id)a3;
- (NSCountedSet)diskVolumes;
- (NSMutableDictionary)purgeableSpaceMap;
- (NSMutableSet)pendingActivities;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASDaemon)daemon;
- (_DASDiskSpaceMonitor)initWithDaemon:(id)a3;
- (os_unfair_recursive_lock_s)purgeableSpaceMapLock;
- (void)fetchPurgeableSpaceInfoForVolume:(id)a3;
- (void)handleCacheDeletePurgeableSpaceNotification;
- (void)registerForCacheDeletePurgeableSpaceNotifications;
- (void)registerForDiskVolumeMonitoring:(id)a3;
- (void)registerForPurgeableSpaceWithActivity:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDiskVolumes:(id)a3;
- (void)setLog:(id)a3;
- (void)setPendingActivities:(id)a3;
- (void)setPurgeableSpaceMap:(id)a3;
- (void)setPurgeableSpaceMapLock:(os_unfair_recursive_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)unregisterForDiskVolumeMonitoring:(id)a3;
- (void)unregisterForPurgeableSpaceWithActivity:(id)a3;
@end

@implementation _DASDiskSpaceMonitor

- (_DASDiskSpaceMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DASDiskSpaceMonitor;
  v6 = [(_DASDiskSpaceMonitor *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duetactivityscheduler.diskspacemonitor", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    os_log_t v11 = os_log_create("com.apple.duetactivityscheduler", "DiskSpaceMonitor");
    log = v7->_log;
    v7->_log = (OS_os_log *)v11;

    v7->_purgeableSpaceMapLock = 0;
    [(_DASDiskSpaceMonitor *)v7 registerForCacheDeletePurgeableSpaceNotifications];
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DAE28;
  v8[3] = &unk_100175F40;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_1001C4430;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_1001C4430, v8);
  }
  id v6 = (id)qword_1001C4438;

  return v6;
}

- (void)registerForPurgeableSpaceWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDiskSpacePolicy policyInstance];
  unsigned int v6 = [v5 appliesToActivity:v4];

  if (v6)
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DAF6C;
    v10[3] = &unk_100175570;
    v10[4] = self;
    id v8 = v4;
    id v11 = v8;
    dispatch_sync(queue, v10);
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1001002E0((uint64_t)v8, log);
    }
  }
}

- (void)unregisterForPurgeableSpaceWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDiskSpacePolicy policyInstance];
  unsigned int v6 = [v5 appliesToActivity:v4];

  if (v6)
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DB100;
    v10[3] = &unk_100175570;
    v10[4] = self;
    id v8 = v4;
    id v11 = v8;
    dispatch_sync(queue, v10);
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_100100358((uint64_t)v8, log);
    }
  }
}

- (void)registerForDiskVolumeMonitoring:(id)a3
{
  id v8 = a3;
  id v4 = [(_DASDiskSpaceMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  diskVolumes = self->_diskVolumes;
  if (!diskVolumes)
  {
    unsigned int v6 = +[NSCountedSet set];
    v7 = self->_diskVolumes;
    self->_diskVolumes = v6;

    diskVolumes = self->_diskVolumes;
  }
  [(NSCountedSet *)diskVolumes addObject:v8];
  if ((id)[(NSCountedSet *)self->_diskVolumes countForObject:v8] == (id)1) {
    [(_DASDiskSpaceMonitor *)self fetchPurgeableSpaceInfoForVolume:v8];
  }
}

- (void)unregisterForDiskVolumeMonitoring:(id)a3
{
  id v6 = a3;
  id v4 = [(_DASDiskSpaceMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  diskVolumes = self->_diskVolumes;
  if (diskVolumes)
  {
    [(NSCountedSet *)diskVolumes removeObject:v6];
    if (([(NSCountedSet *)self->_diskVolumes containsObject:v6] & 1) == 0)
    {
      os_unfair_recursive_lock_lock_with_options();
      [(NSMutableDictionary *)self->_purgeableSpaceMap removeObjectForKey:v6];
      os_unfair_recursive_lock_unlock();
    }
  }
}

- (BOOL)isDiskSpaceAvailableForActivity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_purgeableSpaceMap)
  {
    id v5 = [(_DASDiskSpaceMonitor *)self purgeableSpaceMap];
    id v6 = [v4 diskVolume];
    v7 = [v5 objectForKey:v6];
    id v8 = [v7 unsignedLongLongValue];

    if (v8) {
      LOBYTE(v8) = (unint64_t)v8 >= (void)[v4 downloadSize] << 10;
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_FAULT)) {
      sub_1001003D0((os_log_t)log);
    }
    LOBYTE(v8) = 0;
  }
  os_unfair_recursive_lock_unlock();

  return (char)v8;
}

- (void)fetchPurgeableSpaceInfoForVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASDiskSpaceMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v13[0] = @"CACHE_DELETE_VOLUME";
  v13[1] = @"CACHE_DELETE_URGENCY";
  v14[0] = v4;
  v14[1] = &off_100187420;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v7 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  id v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];

  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100100414(log, v7);
    }
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    if (!self->_purgeableSpaceMap)
    {
      id v10 = +[NSMutableDictionary dictionary];
      purgeableSpaceMap = self->_purgeableSpaceMap;
      self->_purgeableSpaceMap = v10;
    }
    v12 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    [(NSMutableDictionary *)self->_purgeableSpaceMap setObject:v12 forKeyedSubscript:v4];

    os_unfair_recursive_lock_unlock();
  }
}

- (void)handleCacheDeletePurgeableSpaceNotification
{
  diskVolumes = self->_diskVolumes;
  if (diskVolumes)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = diskVolumes;
    id v5 = [(NSCountedSet *)v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          [(_DASDiskSpaceMonitor *)self fetchPurgeableSpaceInfoForVolume:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        id v6 = [(NSCountedSet *)v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v6);
    }

    id v9 = +[NSMutableSet set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(_DASDiskSpaceMonitor *)self pendingActivities];
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
          if ([(_DASDiskSpaceMonitor *)self isDiskSpaceAvailableForActivity:v15]) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Available disk space changed, re-evaluating activities: %@", buf, 0xCu);
      }
      v17 = dispatch_get_global_queue(0, 0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000DB7B4;
      v18[3] = &unk_100175570;
      v18[4] = self;
      id v19 = v9;
      dispatch_async(v17, v18);
    }
  }
}

- (void)registerForCacheDeletePurgeableSpaceNotifications
{
  int out_token = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DB8B8;
  v5[3] = &unk_1001759D0;
  v5[4] = self;
  if (notify_register_dispatch("CACHE_DELETE_PURGEABLE_UPDATED", &out_token, queue, v5))
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1001004C4((os_log_t)log);
    }
  }
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

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
}

- (NSCountedSet)diskVolumes
{
  return self->_diskVolumes;
}

- (void)setDiskVolumes:(id)a3
{
}

- (NSMutableDictionary)purgeableSpaceMap
{
  return self->_purgeableSpaceMap;
}

- (void)setPurgeableSpaceMap:(id)a3
{
}

- (os_unfair_recursive_lock_s)purgeableSpaceMapLock
{
  return self->_purgeableSpaceMapLock;
}

- (void)setPurgeableSpaceMapLock:(os_unfair_recursive_lock_s)a3
{
  self->_purgeableSpaceMapLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableSpaceMap, 0);
  objc_storeStrong((id *)&self->_diskVolumes, 0);
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end