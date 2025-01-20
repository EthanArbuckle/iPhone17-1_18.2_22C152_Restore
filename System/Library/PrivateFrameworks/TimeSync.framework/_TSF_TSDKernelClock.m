@interface _TSF_TSDKernelClock
+ (id)availableKernelClockIdentifiers;
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
+ (id)serviceForClockIdentifier:(unint64_t)a3;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)deregisterAsyncCallback;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)registerAsyncCallback;
- (IOKService)service;
- (NSString)clockName;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)propertyUpdateQueue;
- (_TSF_IODConnection)connection;
- (_TSF_TSDKernelClock)initWithClockIdentifier:(unint64_t)a3;
- (_TSF_TSDKernelClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (double)hostRateRatio;
- (id)clients;
- (int)_lockState;
- (int)lockState;
- (unint64_t)clockIdentifier;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unsigned)getCoreAudioReanchors;
- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4;
- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5;
- (void)_handleNotification:(unsigned int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5;
- (void)_refreshLockStateOnNotificationQueue;
- (void)addClient:(id)a3;
- (void)finalizeNotifications;
- (void)removeClient:(id)a3;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setLockState:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)updateCoreAudioReanchors:(unsigned int)a3;
@end

@implementation _TSF_TSDKernelClock

+ (id)availableKernelClockIdentifiers
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)MEMORY[0x1E4F6EC30];
  v4 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncService"];
  v5 = [v3 matchingServices:v4 error:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___TSF_TSDKernelClock_availableKernelClockIdentifiers__block_invoke;
  v8[3] = &unk_1E622AB20;
  id v6 = v2;
  id v9 = v6;
  [v5 enumerateWithBlock:v8];

  return v6;
}

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

- (_TSF_TSDKernelClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)_TSF_TSDKernelClock;
  id v6 = [(_TSF_TSDKernelClock *)&v36 init];
  v7 = v6;
  if (v6)
  {
    v6->_clockIdentifier = a3;
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    clients = v7->_clients;
    v7->_clients = (NSPointerArray *)v8;

    v7->_clientsLock._os_unfair_lock_opaque = 0;
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = (void *)v12;
    if ((int)v4 <= 0) {
      [v10 stringWithFormat:@"com.apple.TimeSync.%@.0x%016llx.notification", v12, a3];
    }
    else {
    v14 = [v10 stringWithFormat:@"com.apple.TimeSync.%@.0x%016llx.notification.%d", v12, a3, v4];
    }

    id v15 = v14;
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v16;

    v18 = v7->_notificationsQueue;
    if (v18)
    {
      objc_storeStrong((id *)&v7->_propertyUpdateQueue, v18);
      v7->_asyncCallbackRefcon = 0;
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      v19 = (void *)MEMORY[0x1E4F6EC30];
      v20 = [(id)objc_opt_class() iokitMatchingDictionaryForClockIdentifier:a3];
      uint64_t v21 = [v19 matchingService:v20];
      service = v7->_service;
      v7->_service = (IOKService *)v21;

      if (v7->_service)
      {
        v23 = [[_TSF_IODConnection alloc] initWithService:v7->_service andType:42];
        connection = v7->_connection;
        v7->_connection = v23;

        if (v7->_connection)
        {
          v7->_lockState = [(_TSF_TSDKernelClock *)v7 _lockState];
          if (v7->_notificationsQueue)
          {
            id v25 = objc_alloc(MEMORY[0x1E4F6EC28]);
            v26 = [(_TSF_TSDKernelClock *)v7 notificationQueue];
            uint64_t v27 = [v25 initOnDispatchQueue:v26];
            notificationPort = v7->_notificationPort;
            v7->_notificationPort = (IOKNotificationPort *)v27;

            if (v7->_notificationPort)
            {
              [(_TSF_TSDKernelClock *)v7 registerAsyncCallback];
              objc_initWeak((id *)location, v7);
              v29 = v7->_service;
              v30 = v7->_notificationPort;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __51___TSF_TSDKernelClock_initWithClockIdentifier_pid___block_invoke;
              v34[3] = &unk_1E622AB98;
              objc_copyWeak(&v35, (id *)location);
              uint64_t v31 = [(IOKService *)v29 addInterestNotifcationOfType:*MEMORY[0x1E4F6EC18] usingNotificationPort:v30 error:0 withHandler:v34];
              interestNotification = v7->_interestNotification;
              v7->_interestNotification = (IOKInterestNotification *)v31;

              objc_destroyWeak(&v35);
              objc_destroyWeak((id *)location);
LABEL_11:

              return v7;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(void *)&location[4] = "_notificationPort != nil";
              __int16 v38 = 2048;
              uint64_t v39 = 0;
              __int16 v40 = 2048;
              uint64_t v41 = 0;
              __int16 v42 = 2080;
              v43 = "";
              __int16 v44 = 2080;
              v45 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
              __int16 v46 = 1024;
              int v47 = 140;
              _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(void *)&location[4] = "_notificationsQueue != nil";
            __int16 v38 = 2048;
            uint64_t v39 = 0;
            __int16 v40 = 2048;
            uint64_t v41 = 0;
            __int16 v42 = 2080;
            v43 = "";
            __int16 v44 = 2080;
            v45 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
            __int16 v46 = 1024;
            int v47 = 137;
            _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(void *)&location[4] = "_connection != nil";
          __int16 v38 = 2048;
          uint64_t v39 = 0;
          __int16 v40 = 2048;
          uint64_t v41 = 0;
          __int16 v42 = 2080;
          v43 = "";
          __int16 v44 = 2080;
          v45 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
          __int16 v46 = 1024;
          int v47 = 133;
          _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(void *)&location[4] = "_service != nil";
        __int16 v38 = 2048;
        uint64_t v39 = 0;
        __int16 v40 = 2048;
        uint64_t v41 = 0;
        __int16 v42 = 2080;
        v43 = "";
        __int16 v44 = 2080;
        v45 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v46 = 1024;
        int v47 = 130;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(void *)&location[4] = "_notificationsQueue != nil";
      __int16 v38 = 2048;
      uint64_t v39 = 0;
      __int16 v40 = 2048;
      uint64_t v41 = 0;
      __int16 v42 = 2080;
      v43 = "";
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v46 = 1024;
      int v47 = 122;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
    }

    v7 = 0;
    goto LABEL_11;
  }
  return v7;
}

- (_TSF_TSDKernelClock)initWithClockIdentifier:(unint64_t)a3
{
  return [(_TSF_TSDKernelClock *)self initWithClockIdentifier:a3 pid:0];
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = -1;
  v19[1] = 0;
  int v6 = 2;
  v20[0] = a3;
  v20[1] = 0;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:0 scalarInputs:v20 scalarInputCount:2 scalarOutputs:v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    v14 = "";
    __int16 v15 = 2080;
    dispatch_queue_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 178;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19[0];
  }
  else {
    return -1;
  }
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = -1;
  v19[1] = 0;
  int v6 = 2;
  v20[0] = a3;
  v20[1] = 0;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:1 scalarInputs:v20 scalarInputCount:2 scalarOutputs:v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    v14 = "";
    __int16 v15 = 2080;
    dispatch_queue_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 200;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19[0];
  }
  else {
    return -1;
  }
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v15 = 0;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }
  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&long long v5 = 136316418;
  long long v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = [(_TSF_TSDKernelClock *)self connection];
    char v14 = [v13 callMethodWithSelector:4 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 222;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        BOOL v10 = 0;
      }
    }
    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if (v6)
  {
LABEL_11:
    int v21 = v6;
    dispatch_queue_t v16 = [(_TSF_TSDKernelClock *)self connection];
    char v17 = [v16 callMethodWithSelector:4 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 236;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v15 = 0;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }
  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&long long v5 = 136316418;
  long long v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = [(_TSF_TSDKernelClock *)self connection];
    char v14 = [v13 callMethodWithSelector:5 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 257;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        BOOL v10 = 0;
      }
    }
    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if (v6)
  {
LABEL_11:
    int v21 = v6;
    dispatch_queue_t v16 = [(_TSF_TSDKernelClock *)self connection];
    char v17 = [v16 callMethodWithSelector:5 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 271;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:9 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    char v14 = "";
    __int16 v15 = 2080;
    dispatch_queue_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 292;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:10 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    char v14 = "";
    __int16 v15 = 2080;
    dispatch_queue_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 312;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (int)_lockState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = 1;
  v2 = [(_TSF_TSDKernelClock *)self connection];
  char v3 = [v2 callMethodWithSelector:2 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if (v3) {
    return v19;
  }
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  int result = 0;
  if (v5)
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    char v14 = "";
    __int16 v15 = 2080;
    dispatch_queue_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 329;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  return result;
}

- (double)hostRateRatio
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v6 = 2;
  v2 = [(_TSF_TSDKernelClock *)self connection];
  char v3 = [v2 callMethodWithSelector:3 scalarInputs:0 scalarInputCount:0 scalarOutputs:v18 scalarOutputCount:&v6 error:0];

  if (v3)
  {
    *(void *)info = 0;
    mach_timebase_info((mach_timebase_info_t)info);
    return (double)(v18[0] / (unint64_t)*(unsigned int *)info)
         / (double)(v18[1] / (unint64_t)*(unsigned int *)&info[4]);
  }
  else
  {
    double v4 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)info = 136316418;
      *(void *)&info[4] = "callResult == YES";
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v16 = 1024;
      int v17 = 346;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", info, 0x3Au);
    }
  }
  return v4;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64x2_t v27 = vdupq_n_s64(1uLL);
  unint64_t v28 = -1;
  unint64_t v29 = -1;
  int v14 = 4;
  uint64_t v11 = [(_TSF_TSDKernelClock *)self connection];
  char v12 = [v11 callMethodWithSelector:8 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v27 scalarOutputCount:&v14 error:0];

  if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    v22 = "";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v25 = 1024;
    int v26 = 370;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a3) {
    *a3 = v27.i64[0];
  }
  if (a4) {
    *a4 = v27.u64[1];
  }
  if (a5) {
    *a5 = v28;
  }
  if (a6) {
    *a6 = v29;
  }
  return v12;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  char v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:11 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 409;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  char v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:12 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 430;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v15 = 0;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }
  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&long long v5 = 136316418;
  long long v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = [(_TSF_TSDKernelClock *)self connection];
    char v14 = [v13 callMethodWithSelector:13 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        unint64_t v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 451;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        BOOL v10 = 0;
      }
    }
    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if (v6)
  {
LABEL_11:
    int v21 = v6;
    __int16 v16 = [(_TSF_TSDKernelClock *)self connection];
    char v17 = [v16 callMethodWithSelector:13 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        unint64_t v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 465;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v15 = 0;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }
  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&long long v5 = 136316418;
  long long v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = [(_TSF_TSDKernelClock *)self connection];
    char v14 = [v13 callMethodWithSelector:14 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        unint64_t v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 486;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        BOOL v10 = 0;
      }
    }
    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }
  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if (v6)
  {
LABEL_11:
    int v21 = v6;
    __int16 v16 = [(_TSF_TSDKernelClock *)self connection];
    char v17 = [v16 callMethodWithSelector:14 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        unint64_t v29 = "";
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 500;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v10;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  char v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:16 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    char v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 521;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = -1;
  v20[0] = a3;
  int v6 = 1;
  char v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:17 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    char v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 541;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64x2_t v27 = vdupq_n_s64(1uLL);
  unint64_t v28 = -1;
  unint64_t v29 = -1;
  int v14 = 4;
  __int16 v11 = [(_TSF_TSDKernelClock *)self connection];
  char v12 = [v11 callMethodWithSelector:15 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v27 scalarOutputCount:&v14 error:0];

  if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    v22 = "";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v25 = 1024;
    int v26 = 558;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a3) {
    *a3 = v27.i64[0];
  }
  if (a4) {
    *a4 = v27.u64[1];
  }
  if (a5) {
    *a5 = v28;
  }
  if (a6) {
    *a6 = v29;
  }
  return v12;
}

- (void)updateCoreAudioReanchors:(unsigned int)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    LODWORD(v8) = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Updating Core Audio Reanchors += %u\n", (uint8_t *)&v7, 8u);
  }
  long long v5 = [(_TSF_TSDKernelClock *)self connection];
  char v6 = [v5 callMethodWithSelector:53 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:0 error:0];

  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 591;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
  }
}

- (unsigned)getCoreAudioReanchors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = 1;
  v2 = [(_TSF_TSDKernelClock *)self connection];
  char v3 = [v2 callMethodWithSelector:54 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v18 scalarOutputCount:&v5 error:0];

  if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "callResult == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v16 = 1024;
    int v17 = 600;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v18;
}

- (IOKService)service
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  int v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (_TSF_IODConnection)connection
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  int v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (void)_refreshLockStateOnNotificationQueue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_TSF_TSDKernelClock *)self _lockState];
  uint64_t v4 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
  if (!v4) {
    goto LABEL_4;
  }
  int v5 = (void *)v4;
  char v6 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
  int v7 = [(_TSF_TSDKernelClock *)self notificationQueue];

  if (v6 == v7)
  {
LABEL_4:
    if (v3 != [(_TSF_TSDKernelClock *)self lockState]) {
      [(_TSF_TSDKernelClock *)self setLockState:v3];
    }
  }
  else
  {
    __int16 v8 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59___TSF_TSDKernelClock__refreshLockStateOnNotificationQueue__block_invoke;
    block[3] = &unk_1E622AB48;
    int v20 = v3;
    block[4] = self;
    dispatch_sync(v8, block);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(_TSF_TSDKernelClock *)self clients];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 didChangeLockStateTo:v3 forClock:self];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  unsigned __int16 v15 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == 2001)
  {
    [(_TSF_TSDKernelClock *)self _refreshLockStateOnNotificationQueue];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v7 = [(_TSF_TSDKernelClock *)self clients];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      unsigned int v11 = a3 - 2000;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          switch(v11)
          {
            case 0u:
              if (objc_opt_respondsToSelector()) {
                [v13 didResetClock:self];
              }
              break;
            case 2u:
              if (objc_opt_respondsToSelector()) {
                [v13 didChangeClockMasterForClock:self];
              }
              break;
            case 3u:
              if (objc_opt_respondsToSelector()) {
                [v13 didBeginClockGrandmasterChangeForClock:self];
              }
              if (objc_opt_respondsToSelector()) {
                [v13 didBeginClockGrandmasterChangeWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            case 4u:
              if (objc_opt_respondsToSelector()) {
                [v13 didEndClockGrandmasterChangeForClock:self];
              }
              if (objc_opt_respondsToSelector()) {
                [v13 didEndClockGrandmasterChangeWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            case 5u:
              if (objc_opt_respondsToSelector()) {
                [v13 didProcessSync:self];
              }
              break;
            case 6u:
              if (objc_opt_respondsToSelector()) {
                [v13 didChangeLocalPortWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            default:
              continue;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)_handleNotification:(unsigned int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 == 2007 && a5 == 7)
  {
    uint64_t v18 = *(unsigned __int16 *)a4;
    unint64_t v5 = a4[3];
    unint64_t v16 = a4[2];
    unint64_t v17 = a4[1];
    unint64_t v6 = a4[4];
    unint64_t v7 = a4[5];
    int v8 = *((_DWORD *)a4 + 12);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [(_TSF_TSDKernelClock *)self clients];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            LODWORD(v15) = v8;
            [v14 didGetStatsOfLocalPortNumber:v18 mean:v17 median:v16 stddev:v5 min:v6 max:v7 numberOfSamples:v15 forClock:self];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
  else if (a5 == 2)
  {
    -[_TSF_TSDKernelClock _handleNotification:withArg1:andArg2:](self, "_handleNotification:withArg1:andArg2:");
  }
}

- (BOOL)registerAsyncCallback
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  self->_asyncCallbackRefcon = [v3 allocateRefcon:self];

  uint64_t v4 = [(_TSF_TSDKernelClock *)self connection];
  char v5 = [v4 registerAsyncNotificationsWithSelector:6 callBack:asyncNotificationsCallback_0 refcon:self->_asyncCallbackRefcon callbackQueue:self->_notificationsQueue];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = "result == YES";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      uint64_t v15 = "";
      __int16 v16 = 2080;
      unint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v18 = 1024;
      int v19 = 797;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    unint64_t v7 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }
  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  uint64_t v3 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v4 = [(_TSF_TSDKernelClock *)self connection];
  LOBYTE(v3) = [v4 deregisterAsyncNotificationsWithSelector:7];

  return (char)v3;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  if (a3 == -536870608)
  {
    int v7 = [(_TSF_TSDKernelClock *)self _lockState];
    int v8 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
    if (!v8)
    {
      int v8 = [(_TSF_TSDKernelClock *)self notificationQueue];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __64___TSF_TSDKernelClock__handleInterestNotification_withArgument___block_invoke;
    v9[3] = &unk_1E622AB48;
    int v10 = v7;
    v9[4] = self;
    dispatch_async(v8, v9);
  }
  else if (a3 == -536870896)
  {
    os_unfair_lock_lock(&self->_serviceLock);
    connection = self->_connection;
    self->_connection = 0;

    service = self->_service;
    self->_service = 0;

    os_unfair_lock_unlock(&self->_serviceLock);
  }
}

- (void)addClient:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(_TSF_TSDKernelClock *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = v6;
    __int16 v20 = 2080;
    uint64_t v21 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding Client %s to clock %s\n", buf, 0x16u);
  }
  [(NSPointerArray *)self->_clients compact];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_clients;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v13 + 1) + 8 * v12) == v4)
        {

          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v13);
LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (void)removeClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(_TSF_TSDKernelClock *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = v6;
    __int16 v22 = 2080;
    uint64_t v23 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removing Client %s from clock %s\n", buf, 0x16u);
  }
  [(NSPointerArray *)self->_clients compact];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = self->_clients;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11 + v10;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v15 + 1) + 8 * v13) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v11 + v13, (void)v15);
          goto LABEL_13;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)clients
{
  p_clientsLock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  id v4 = [(NSPointerArray *)self->_clients allObjects];
  os_unfair_lock_unlock(p_clientsLock);
  return v4;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationsQueue;
}

- (NSString)clockName
{
  uint64_t v3 = [(_TSF_TSDKernelClock *)self service];

  id v4 = NSString;
  if (v3)
  {
    id v5 = [(_TSF_TSDKernelClock *)self service];
    uint64_t v6 = [v5 ioClassName];
    id v7 = [v4 stringWithFormat:@"%@ 0x%016llx", v6, -[_TSF_TSDKernelClock clockIdentifier](self, "clockIdentifier")];
  }
  else
  {
    int v8 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v8);
    id v7 = [v4 stringWithFormat:@"%@ 0x%016llx", v5, -[_TSF_TSDKernelClock clockIdentifier](self, "clockIdentifier")];
  }

  return (NSString *)v7;
}

- (void)finalizeNotifications
{
  [(_TSF_TSDKernelClock *)self deregisterAsyncCallback];
  interestNotification = self->_interestNotification;
  self->_interestNotification = 0;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0;
}

+ (id)serviceForClockIdentifier:(unint64_t)a3
{
  uint64_t v3 = [a1 iokitMatchingDictionaryForClockIdentifier:a3];
  id v4 = [MEMORY[0x1E4F6EC30] matchingService:v3];

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  uint64_t v6 = [v4 ioClassName];
  [v5 setObject:v6 forKeyedSubscript:@"ClassName"];

  id v7 = [v4 iodProperties];

  [v5 addEntriesFromDictionary:v7];
  [v5 removeObjectForKey:@"IOUserClientClass"];
  [v5 removeObjectForKey:@"IOGeneralInterest"];
  return v5;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [NSNumber numberWithLongLong:a3];
  [v5 setObject:v6 forKeyedSubscript:@"ClockIdentifier"];

  id v7 = [(id)objc_opt_class() clockNameForClockIdentifier:a3];
  [v5 setObject:v7 forKeyedSubscript:@"ClockName"];

  int v8 = [a1 serviceForClockIdentifier:a3];
  if (v8)
  {
    uint64_t v9 = [a1 diagnosticInfoForService:v8];
    [v5 addEntriesFromDictionary:v9];
  }
  return v5;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  id v4 = objc_msgSend(a1, "serviceForClockIdentifier:");
  id v5 = v4;
  uint64_t v6 = NSString;
  if (v4)
  {
    [v4 ioClassName];
  }
  else
  {
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
  int v8 = };
  uint64_t v9 = [v6 stringWithFormat:@"%@ 0x%016llx", v8, a3];

  return v9;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (int)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int)a3
{
  self->_lockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_interestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end