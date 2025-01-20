@interface TSDClockSync
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)deregisterAsyncCallback;
- (BOOL)registerAsyncCallback;
- (TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (id)connection;
- (id)service;
- (unint64_t)clockIdentifier;
- (unint64_t)releaseReference;
- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5;
- (void)addReference;
- (void)addUpdateClient:(id)a3;
- (void)removeUpdateClient:(id)a3;
@end

@implementation TSDClockSync

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncService";
  CFStringRef v7 = @"ClockIdentifier";
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v24.receiver = self;
  v24.super_class = (Class)TSDClockSync;
  v6 = [(TSDClockSync *)&v24 init];
  CFStringRef v7 = v6;
  if (v6)
  {
    v6->_referenceCount = 1;
    v6->_clockIdentifier = a3;
    uint64_t v8 = +[NSPointerArray weakObjectsPointerArray];
    updateClients = v7->_updateClients;
    v7->_updateClients = (NSPointerArray *)v8;

    v7->_updateClientsLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    v12 = (void *)v11;
    if (v4) {
      +[NSString stringWithFormat:@"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification.%d", v11, a3, v4];
    }
    else {
    v13 = +[NSString stringWithFormat:@"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification", v11, a3, v23];
    }

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v15;

    if (v7->_notificationsQueue)
    {
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v17 = [(id)objc_opt_class() iokitMatchingDictionaryForClockIdentifier:a3];
      uint64_t v18 = +[IOKService matchingService:v17];
      service = v7->_service;
      v7->_service = (IOKService *)v18;

      if (v7->_service)
      {
        v20 = [[IODConnection alloc] initWithService:v7->_service andType:24];
        connection = v7->_connection;
        v7->_connection = v20;

        if (v7->_connection)
        {
          v7->_asyncCallbackRefcon = 0;
          [(TSDClockSync *)v7 registerAsyncCallback];
LABEL_9:

          return v7;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v26 = "_connection != nil";
          __int16 v27 = 2048;
          uint64_t v28 = 0;
          __int16 v29 = 2048;
          uint64_t v30 = 0;
          __int16 v31 = 2080;
          v32 = &unk_100030E47;
          __int16 v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
          __int16 v35 = 1024;
          int v36 = 77;
          goto LABEL_17;
        }
LABEL_18:

        CFStringRef v7 = 0;
        goto LABEL_9;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v26 = "_service != nil";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      v32 = &unk_100030E47;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v35 = 1024;
      int v36 = 74;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v26 = "_notificationsQueue != nil";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      v32 = &unk_100030E47;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v35 = 1024;
      int v36 = 69;
    }
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_18;
  }
  return v7;
}

- (id)service
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  uint64_t v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);

  return v4;
}

- (id)connection
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  uint64_t v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);

  return v4;
}

- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  if (a3 == 3001)
  {
    if (a5 == 7)
    {
      unint64_t v34 = a4[1];
      unint64_t v36 = *a4;
      unint64_t v19 = a4[4];
      unint64_t v32 = a4[3];
      unint64_t v33 = a4[2];
      unint64_t v20 = a4[6];
      lock = &self->_updateClientsLock;
      unint64_t v31 = a4[5];
      os_unfair_lock_lock(&self->_updateClientsLock);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v21 = self->_updateClients;
      id v22 = [(NSPointerArray *)v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ([v26 conformsToProtocol:&OBJC_PROTOCOL___TSDClockSyncGeneralSyncClient])
            {
              LOWORD(v29) = v20;
              [v26 updateWithSyncInfoValid:(v20 & 0xFF000000) != 0 syncFlags:BYTE2(v20) timeSyncTime:v33 domainTimeHi:v32 domainTimeLo:v19 cumulativeScaledRate:v36 inverseCumulativeScaledRate:v34 grandmasterID:v31 localPortNumber:v29];
            }
          }
          id v23 = [(NSPointerArray *)v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v23);
      }

      uint64_t v18 = lock;
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v48 = "numArgs == 7";
      *(_WORD *)&v48[8] = 2048;
      uint64_t v49 = 0;
      __int16 v50 = 2048;
      uint64_t v51 = 0;
      __int16 v52 = 2080;
      v53 = &unk_100030E47;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v56 = 1024;
      int v57 = 142;
      __int16 v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
      goto LABEL_34;
    }
  }
  else
  {
    if (a3 != 3000)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v48 = a3;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = a5;
      __int16 v27 = "TSDClockSync _handleNotification unhandled notification %u numArgs %u\n";
      uint32_t v28 = 14;
      goto LABEL_28;
    }
    if (a5 == 4)
    {
      unint64_t v8 = *a4;
      unint64_t v9 = a4[1];
      unint64_t v10 = a4[2];
      unint64_t v11 = a4[3];
      p_updateClientsLock = &self->_updateClientsLock;
      os_unfair_lock_lock(&self->_updateClientsLock);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v12 = self->_updateClients;
      id v13 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v42;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            if ([v17 conformsToProtocol:&OBJC_PROTOCOL___TSDClockSyncGeneralSyncClient]) {
              [v17 updateTimeSyncTime:v10 timeSyncInterval:v8 domainTime:v11 domainInterval:v9];
            }
          }
          id v14 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v14);
      }

      uint64_t v18 = p_updateClientsLock;
LABEL_25:
      os_unfair_lock_unlock(v18);
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v48 = "numArgs == 4";
      *(_WORD *)&v48[8] = 2048;
      uint64_t v49 = 0;
      __int16 v50 = 2048;
      uint64_t v51 = 0;
      __int16 v52 = 2080;
      v53 = &unk_100030E47;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v56 = 1024;
      int v57 = 123;
      __int16 v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
LABEL_34:
      uint32_t v28 = 58;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
    }
  }
}

- (BOOL)registerAsyncCallback
{
  v3 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  self->_asyncCallbackRefcon = (unint64_t)[v3 allocateRefcon:self];

  uint64_t v4 = [(TSDClockSync *)self connection];
  unsigned __int8 v5 = [v4 registerAsyncNotificationsWithSelector:0 callBack:sub_1000068F0 refcon:self->_asyncCallbackRefcon callbackQueue:self->_notificationsQueue];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      unint64_t v9 = "result == YES";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      uint64_t v15 = &unk_100030E47;
      __int16 v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v18 = 1024;
      int v19 = 206;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    CFStringRef v7 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }
  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  v3 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v4 = [(TSDClockSync *)self connection];
  LOBYTE(v3) = [v4 deregisterAsyncNotificationsWithSelector:1];

  return (char)v3;
}

- (void)addUpdateClient:(id)a3
{
  p_updateClientsLock = &self->_updateClientsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_updateClientsLock);
  [(NSPointerArray *)self->_updateClients addPointer:v5];

  [(NSPointerArray *)self->_updateClients compact];

  os_unfair_lock_unlock(p_updateClientsLock);
}

- (void)removeUpdateClient:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_updateClientsLock);
  if ([(NSPointerArray *)self->_updateClients count])
  {
    uint64_t v4 = 0;
    while ([(NSPointerArray *)self->_updateClients pointerAtIndex:v4] != v5)
    {
      if (++v4 >= [(NSPointerArray *)self->_updateClients count]) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_updateClients removePointerAtIndex:v4];
  }
LABEL_7:
  [(NSPointerArray *)self->_updateClients compact];
  os_unfair_lock_unlock(&self->_updateClientsLock);
}

- (void)addReference
{
}

- (unint64_t)releaseReference
{
  unint64_t v2 = self->_referenceCount - 1;
  self->_referenceCount = v2;
  return v2;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_updateClients, 0);

  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end