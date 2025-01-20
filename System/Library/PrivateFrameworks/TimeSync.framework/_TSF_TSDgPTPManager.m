@interface _TSF_TSDgPTPManager
+ (id)diagnosticInfo;
+ (id)gPTPManager;
+ (id)sharedgPTPManager;
+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhengPTPManagerIsAvailable:(id)a3;
+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3;
- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)logInterfaceStatisticsWithError:(id *)a3;
- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3;
- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3;
- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (_TSF_TSDgPTPClock)systemDomain;
- (_TSF_TSDgPTPManager)init;
- (unint64_t)airPlayPTPInstanceClockIdentifier;
- (unint64_t)avbPTPInstance0ClockIdentifier;
- (unint64_t)avbPTPInstance1ClockIdentifier;
- (unint64_t)avbPTPInstance2ClockIdentifier;
- (unint64_t)avbPTPInstance3ClockIdentifier;
- (unint64_t)copresencePTPInstanceClockIdentifier;
- (unint64_t)systemDomainClockIdentifier;
- (void)dealloc;
@end

@implementation _TSF_TSDgPTPManager

+ (void)initialize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(_TSF_TSDKextNotifier);
    v3 = (void *)_kextNotifier;
    _kextNotifier = (uint64_t)v2;

    uint64_t v4 = _kextNotifier;
    v5 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncgPTPManager"];
    LOBYTE(v4) = [(id)v4 startNotificationsWithMatchingDictionary:v5];

    if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      v7 = "startedNotifier";
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      v13 = "";
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v16 = 1024;
      int v17 = 54;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56___TSF_TSDgPTPManager_notifyWhengPTPManagerIsAvailable___block_invoke;
  v6[3] = &unk_1E622AAD8;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___TSF_TSDgPTPManager_notifyWhengPTPManagerIsUnavailable___block_invoke;
  v6[3] = &unk_1E622AAD8;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)sharedgPTPManager
{
  if (sharedgPTPManager_onceToken != -1) {
    dispatch_once(&sharedgPTPManager_onceToken, &__block_literal_global_1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_sharedgPTPManagerQueue, block);
  id v3 = (void *)_sharedgPTPManager_0;
  return v3;
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56___TSF_TSDgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E622A8F8;
  int v6 = v5;
  __int16 v12 = v6;
  [a1 notifyWhengPTPManagerIsAvailable:v11];
  dispatch_time_t v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v10, 2u);
    }
    __int16 v8 = 0;
  }
  else
  {
    __int16 v8 = [a1 sharedgPTPManager];
  }

  return v8;
}

+ (id)gPTPManager
{
  v2 = objc_alloc_init(_TSF_TSDgPTPManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(_TSF_TSDgPTPManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (_TSF_TSDgPTPManager)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_TSF_TSDgPTPManager;
  v2 = [(_TSF_TSDgPTPManager *)&v16 init];
  if (v2)
  {
    unsigned int v3 = (void *)MEMORY[0x1E4F6EC30];
    uint64_t v4 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncgPTPManager"];
    uint64_t v5 = [v3 matchingService:v4];
    service = v2->_service;
    v2->_service = (IOKService *)v5;

    if (v2->_service)
    {
      dispatch_time_t v7 = [[_TSF_IODConnection alloc] initWithService:v2->_service andType:42];
      connection = v2->_connection;
      v2->_connection = v7;

      if (v2->_connection)
      {
        uint64_t v9 = [(IOKService *)v2->_service iodPropertyForKey:@"SystemDomainIdentifier"];
        __int16 v10 = v9;
        if (v9) {
          uint64_t v11 = [(_TSF_TSDgPTPManager *)v9 unsignedLongLongValue];
        }
        else {
          uint64_t v11 = -1;
        }
        v2->_systemDomainClockIdentifier = v11;
        dispatch_queue_t v12 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.systemDomain", 0);
        systemDomainQueue = v2->_systemDomainQueue;
        v2->_systemDomainQueue = (OS_dispatch_queue *)v12;

        goto LABEL_8;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = "_connection != nil";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        v24 = "";
        __int16 v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
        __int16 v27 = 1024;
        int v28 = 147;
        v15 = MEMORY[0x1E4F14500];
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = "_service != nil";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      v24 = "";
      __int16 v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v27 = 1024;
      int v28 = 144;
      v15 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v15, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    __int16 v10 = v2;
    v2 = 0;
LABEL_8:
  }
  return v2;
}

- (_TSF_TSDgPTPClock)systemDomain
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  __int16 v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35___TSF_TSDgPTPManager_systemDomain__block_invoke;
  v5[3] = &unk_1E622A920;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(systemDomainQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_TSF_TSDgPTPClock *)v3;
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:0 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = "";
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 196;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:6 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = "";
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 214;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v19[0] = a3;
  BOOL v4 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 237;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  v22[0] = a3;
  int v8 = 1;
  BOOL v6 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:v22 scalarInputCount:1 scalarOutputs:&v21 scalarOutputCount:&v8 error:a5];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = "";
    __int16 v17 = 2080;
    int v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v19 = 1024;
    int v20 = 258;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v21;
  return v6;
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v19[0] = a3;
  BOOL v4 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    uint64_t v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB0ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB1ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB2ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB3ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AirPlayClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = "";
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 361;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:5 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 376;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"CopresenceClockID"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:7 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = "";
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 404;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:8 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 419;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)logInterfaceStatisticsWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:9 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 431;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3 = +[_TSF_TSDClockManager sharedClockManager];
  [v3 removegPTPServicesWithError:0];

  v4.receiver = self;
  v4.super_class = (Class)_TSF_TSDgPTPManager;
  [(_TSF_TSDgPTPManager *)&v4 dealloc];
}

+ (id)diagnosticInfo
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F6EC30];
  BOOL v3 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncgPTPManager"];
  objc_super v4 = [v2 matchingService:v3];

  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = "service != nil";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      int v28 = "";
      __int16 v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v31 = 1024;
      int v32 = 446;
      uint64_t v18 = MEMORY[0x1E4F14500];
LABEL_27:
      _os_log_impl(&dword_1BA88B000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_28:
    int v5 = 0;
    goto LABEL_20;
  }
  if (([v4 conformsToIOClassName:@"IOTimeSyncgPTPManager"] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = "[service conformsToIOClassName:@kIOTimeSyncgPTPManagerClass]";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      int v28 = "";
      __int16 v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v31 = 1024;
      int v32 = 447;
      uint64_t v18 = MEMORY[0x1E4F14500];
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  int v6 = [v4 ioClassName];
  [v5 setObject:v6 forKeyedSubscript:@"ClassName"];

  int v7 = [v4 iodPropertyForKey:@"SystemDomainIdentifier"];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"SystemDomainIdentifier"];
  }
  __int16 v8 = [v4 iodPropertyForKey:@"AVB0ClockID"];

  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"AVB0ClockID"];
  }
  uint64_t v9 = [v4 iodPropertyForKey:@"AVB1ClockID"];

  if (v9) {
    [v5 setObject:v9 forKeyedSubscript:@"AVB1ClockID"];
  }
  __int16 v10 = [v4 iodPropertyForKey:@"AVB2ClockID"];

  if (v10) {
    [v5 setObject:v10 forKeyedSubscript:@"AVB2ClockID"];
  }
  uint64_t v11 = [v4 iodPropertyForKey:@"AVB3ClockID"];

  if (v11) {
    [v5 setObject:v11 forKeyedSubscript:@"AVB3ClockID"];
  }
  __int16 v12 = [v4 iodPropertyForKey:@"AirPlayClockID"];

  if (v12) {
    [v5 setObject:v12 forKeyedSubscript:@"AirPlayClockID"];
  }
  uint64_t v13 = [v4 iodPropertyForKey:@"CopresenceClockID"];

  if (v13) {
    [v5 setObject:v13 forKeyedSubscript:@"CopresenceClockID"];
  }
  __int16 v14 = [MEMORY[0x1E4F1CA48] array];
  __int16 v15 = [v4 childIteratorInServicePlaneWithError:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __37___TSF_TSDgPTPManager_diagnosticInfo__block_invoke;
  v19[3] = &unk_1E622AB20;
  id v16 = v14;
  id v20 = v16;
  [v15 enumerateWithBlock:v19];
  if ([v16 count]) {
    [v5 setObject:v16 forKeyedSubscript:@"PTPInstances"];
  }

LABEL_20:
  return v5;
}

- (unint64_t)systemDomainClockIdentifier
{
  return self->_systemDomainClockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end