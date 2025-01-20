@interface _TSF_TSDClockSync
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)deregisterAsyncCallback;
- (BOOL)registerAsyncCallback;
- (_TSF_TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (id)connection;
- (id)service;
- (unint64_t)clockIdentifier;
- (unint64_t)releaseReference;
- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5;
- (void)addReference;
- (void)addUpdateClient:(id)a3;
- (void)removeUpdateClient:(id)a3;
@end

@implementation _TSF_TSDClockSync

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncService";
  v7 = @"ClockIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (_TSF_TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_TSF_TSDClockSync;
  v6 = [(_TSF_TSDClockSync *)&v27 init];
  v7 = v6;
  if (v6)
  {
    v6->_referenceCount = 1;
    v6->_clockIdentifier = a3;
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    updateClients = v7->_updateClients;
    v7->_updateClients = (NSPointerArray *)v8;

    v7->_updateClientsLock._os_unfair_lock_opaque = 0;
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = (void *)v12;
    if (v4) {
      [v10 stringWithFormat:@"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification.%d", v12, a3, v4];
    }
    else {
    v14 = [v10 stringWithFormat:@"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification", v12, a3, v26];
    }

    id v15 = v14;
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v16;

    if (v7->_notificationsQueue)
    {
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v18 = (void *)MEMORY[0x1E4F6EC30];
      v19 = [(id)objc_opt_class() iokitMatchingDictionaryForClockIdentifier:a3];
      uint64_t v20 = [v18 matchingService:v19];
      service = v7->_service;
      v7->_service = (IOKService *)v20;

      if (v7->_service)
      {
        v22 = [[_TSF_IODConnection alloc] initWithService:v7->_service andType:24];
        connection = v7->_connection;
        v7->_connection = v22;

        if (v7->_connection)
        {
          v7->_asyncCallbackRefcon = 0;
          [(_TSF_TSDClockSync *)v7 registerAsyncCallback];
LABEL_9:

          return v7;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v29 = "_connection != nil";
          __int16 v30 = 2048;
          uint64_t v31 = 0;
          __int16 v32 = 2048;
          uint64_t v33 = 0;
          __int16 v34 = 2080;
          v35 = "";
          __int16 v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
          __int16 v38 = 1024;
          int v39 = 77;
          v25 = MEMORY[0x1E4F14500];
          goto LABEL_17;
        }
LABEL_18:

        v7 = 0;
        goto LABEL_9;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v29 = "_service != nil";
      __int16 v30 = 2048;
      uint64_t v31 = 0;
      __int16 v32 = 2048;
      uint64_t v33 = 0;
      __int16 v34 = 2080;
      v35 = "";
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v38 = 1024;
      int v39 = 74;
      v25 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v29 = "_notificationsQueue != nil";
      __int16 v30 = 2048;
      uint64_t v31 = 0;
      __int16 v32 = 2048;
      uint64_t v33 = 0;
      __int16 v34 = 2080;
      v35 = "";
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v38 = 1024;
      int v39 = 69;
      v25 = MEMORY[0x1E4F14500];
    }
LABEL_17:
    _os_log_impl(&dword_1BA88B000, v25, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a3 == 3001)
  {
    if (a5 == 7)
    {
      unint64_t v35 = a4[1];
      unint64_t v37 = *a4;
      unint64_t v19 = a4[4];
      unint64_t v33 = a4[3];
      unint64_t v34 = a4[2];
      unint64_t v20 = a4[6];
      lock = &self->_updateClientsLock;
      unint64_t v32 = a4[5];
      os_unfair_lock_lock(&self->_updateClientsLock);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v21 = self->_updateClients;
      uint64_t v22 = [(NSPointerArray *)v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if ([v26 conformsToProtocol:&unk_1F1453898])
            {
              LOWORD(v30) = v20;
              [v26 updateWithSyncInfoValid:(v20 & 0xFF000000) != 0 syncFlags:BYTE2(v20) timeSyncTime:v34 domainTimeHi:v33 domainTimeLo:v19 cumulativeScaledRate:v37 inverseCumulativeScaledRate:v35 grandmasterID:v32 localPortNumber:v30];
            }
          }
          uint64_t v23 = [(NSPointerArray *)v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v23);
      }

      v18 = lock;
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v49 = "numArgs == 7";
      *(_WORD *)&v49[8] = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2048;
      uint64_t v52 = 0;
      __int16 v53 = 2080;
      v54 = "";
      __int16 v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v57 = 1024;
      int v58 = 142;
      objc_super v27 = MEMORY[0x1E4F14500];
      v28 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
      goto LABEL_34;
    }
  }
  else
  {
    if (a3 != 3000)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v49 = a3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = a5;
      objc_super v27 = MEMORY[0x1E4F14500];
      v28 = "TSDClockSync _handleNotification unhandled notification %u numArgs %u\n";
      uint32_t v29 = 14;
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
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v12 = self->_updateClients;
      uint64_t v13 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            if ([v17 conformsToProtocol:&unk_1F1453898]) {
              [v17 updateTimeSyncTime:v10 timeSyncInterval:v8 domainTime:v11 domainInterval:v9];
            }
          }
          uint64_t v14 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v14);
      }

      v18 = p_updateClientsLock;
LABEL_25:
      os_unfair_lock_unlock(v18);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v49 = "numArgs == 4";
      *(_WORD *)&v49[8] = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2048;
      uint64_t v52 = 0;
      __int16 v53 = 2080;
      v54 = "";
      __int16 v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v57 = 1024;
      int v58 = 123;
      objc_super v27 = MEMORY[0x1E4F14500];
      v28 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
LABEL_34:
      uint32_t v29 = 58;
LABEL_28:
      _os_log_impl(&dword_1BA88B000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
    }
  }
}

- (BOOL)registerAsyncCallback
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  self->_asyncCallbackRefcon = [v3 allocateRefcon:self];

  uint64_t v4 = [(_TSF_TSDClockSync *)self connection];
  char v5 = [v4 registerAsyncNotificationsWithSelector:0 callBack:asyncNotificationsCallback_1 refcon:self->_asyncCallbackRefcon callbackQueue:self->_notificationsQueue];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      unint64_t v9 = "result == YES";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      uint64_t v15 = "";
      __int16 v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v18 = 1024;
      int v19 = 206;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    v7 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }
  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  v3 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v4 = [(_TSF_TSDClockSync *)self connection];
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