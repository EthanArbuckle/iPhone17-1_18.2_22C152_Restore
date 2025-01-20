@interface _TSF_TSDClockManager
+ (id)clockManager;
+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3;
+ (id)defaultClockPersonalities;
+ (id)diagnosticInfo;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4;
+ (id)sharedClockManager;
+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhenClockManagerIsAvailable:(id)a3;
+ (void)notifyWhenClockManagerIsUnavailable:(id)a3;
- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5;
- (BOOL)addTSNCaptureServicesWithError:(id *)a3;
- (BOOL)addgPTPServicesWithError:(id *)a3;
- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4;
- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeTSNCaptureServicesWithError:(id *)a3;
- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removegPTPServicesWithError:(id *)a3;
- (BOOL)timeSyncTimeIsMachAbsoluteTime;
- (_TSF_TSDClockManager)init;
- (_TSF_TSDClockManager)initWithPid:(int)a3;
- (_TSF_TSDKernelClock)translationClock;
- (id)availableClockIdentifiers;
- (id)classNameForClockService:(id)a3;
- (id)clockWithClockIdentifier:(unint64_t)a3;
- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7;
- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3;
- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3;
- (unint64_t)timeSyncTimeClockIdentifier;
- (unint64_t)translationClockIdentifier;
@end

@implementation _TSF_TSDClockManager

+ (void)initialize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(_TSF_TSDKextNotifier);
    v3 = (void *)_kextNotifier;
    _kextNotifier = (uint64_t)v2;

    uint64_t v4 = _kextNotifier;
    v5 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncClockManager"];
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
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v16 = 1024;
      int v17 = 60;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___TSF_TSDClockManager_notifyWhenClockManagerIsAvailable___block_invoke;
  v6[3] = &unk_1E622B258;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___TSF_TSDClockManager_notifyWhenClockManagerIsUnavailable___block_invoke;
  v6[3] = &unk_1E622B258;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"ATSAC:%016llx", a3);
}

+ (id)sharedClockManager
{
  if (+[_TSF_TSDClockManager sharedClockManager]::onceToken != -1) {
    dispatch_once(&+[_TSF_TSDClockManager sharedClockManager]::onceToken, &__block_literal_global_5);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___TSF_TSDClockManager_sharedClockManager__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_sharedClockManagerQueue, block);
  id v3 = (void *)_sharedClockManager;
  return v3;
}

+ (id)clockManager
{
  v2 = objc_alloc_init(_TSF_TSDClockManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(_TSF_TSDClockManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }
  return v2;
}

+ (id)defaultClockPersonalities
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = @"IOClassName";
  v17[1] = @"ProbeScore";
  v18[0] = @"IOTimeSyncService";
  v18[1] = &unk_1F14520B8;
  v17[2] = @"ClassName";
  unsigned int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v18[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v2 addObject:v5];

  v15[0] = @"IOClassName";
  v15[1] = @"ProbeScore";
  v16[0] = @"IOTimeSyncDomain";
  v16[1] = &unk_1F14520D0;
  v15[2] = @"ClassName";
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v16[2] = v7;
  __int16 v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 addObject:v8];

  v13[0] = @"IOClassName";
  v13[1] = @"ProbeScore";
  v14[0] = @"IOTimeSyncUserFilteredService";
  v14[1] = &unk_1F14520D0;
  v13[2] = @"ClassName";
  uint64_t v9 = (objc_class *)objc_opt_class();
  __int16 v10 = NSStringFromClass(v9);
  v14[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 addObject:v11];

  return v2;
}

- (_TSF_TSDClockManager)init
{
  return [(_TSF_TSDClockManager *)self initWithPid:0];
}

- (_TSF_TSDClockManager)initWithPid:(int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_TSF_TSDClockManager;
  uint64_t v4 = [(_TSF_TSDClockManager *)&v17 init];
  id v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    mach_timebase_info(&v4->_timebaseInfo);
    int v6 = (void *)MEMORY[0x1E4F6EC30];
    id v7 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncClockManager"];
    __int16 v8 = [v6 matchingService:v7];

    if (v8)
    {
      uint64_t v9 = [[_TSF_IODConnection alloc] initWithService:v8 andType:42];
      connection = v5->_connection;
      v5->_connection = v9;

      if (v5->_connection)
      {
        [(_TSF_TSDClockManager *)v5 getTimeSyncTimeClockID:&v5->_timeSyncTimeClockIdentifier error:0];
        v5->_translationClockIdentifier = v5->_timeSyncTimeClockIdentifier + 1;
        [(_TSF_TSDClockManager *)v5 getTimeSyncTimeIsMachAbsolute:&v5->_timeSyncTimeIsMachAbsoluteTime error:0];
        uint64_t v11 = [[_TSF_TSDKernelClock alloc] initWithClockIdentifier:v5->_translationClockIdentifier];
        translationClock = v5->_translationClock;
        v5->_translationClock = v11;

        uint64_t v13 = [(id)objc_opt_class() defaultClockPersonalities];
        clockPersonalities = v5->_clockPersonalities;
        v5->_clockPersonalities = (NSMutableArray *)v13;
LABEL_5:

        return v5;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v19 = "_connection != nil";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        v25 = "";
        __int16 v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
        __int16 v28 = 1024;
        int v29 = 159;
        __int16 v16 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "service != nil";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      v25 = "";
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v28 = 1024;
      int v29 = 156;
      __int16 v16 = MEMORY[0x1E4F14500];
LABEL_11:
      _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    clockPersonalities = v5;
    id v5 = 0;
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  v20[0] = 0;
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
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 194;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  v20[0] = 0;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:11 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
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
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 212;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0] != 0;
  return v5;
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:0 scalarInputCount:0 scalarOutputs:v20 scalarOutputCount:&v7 error:a4];
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
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 230;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v19[0] = a3;
  BOOL v4 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 248;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  unint64_t v9 = a3;
  if (!a3) {
    return 0;
  }
  int v8 = 1;
  BOOL v6 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:&v9 scalarInputCount:1 scalarOutputs:v22 scalarOutputCount:&v8 error:a5];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v11 = "result == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = "";
    __int16 v18 = 2080;
    int v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 263;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v22[0];
  return v6;
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v19[0] = a3;
  BOOL v4 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addgPTPServicesWithError:(id *)a3
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
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 293;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:6 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 305;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
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
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 317;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:10 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 329;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (id)availableClockIdentifiers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = 0;
  if ([(_TSF_TSDClockManager *)self getTimeSyncTimeClockID:&v6 error:0])
  {
    BOOL v4 = +[_TSF_TSDKernelClock availableKernelClockIdentifiers];
    [v3 addObjectsFromArray:v4];
  }
  return v3;
}

- (id)classNameForClockService:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obj = self->_clockPersonalities;
    int v5 = 0;
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      int v8 = -1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          __int16 v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = [v10 objectForKeyedSubscript:@"IOClassName"];
          int v12 = [v4 conformsToIOClassName:v11];

          if (v12)
          {
            if (v5)
            {
              __int16 v13 = [v10 objectForKeyedSubscript:@"ProbeScore"];
              int v14 = [v13 intValue];

              if (v14 > v8)
              {
                uint64_t v15 = [v10 objectForKeyedSubscript:@"ClassName"];

                int v5 = (void *)v15;
                int v8 = v14;
              }
            }
            else
            {
              __int16 v16 = [v10 objectForKeyedSubscript:@"ProbeScore"];
              int v8 = [v16 intValue];

              int v5 = [v10 objectForKeyedSubscript:@"ClassName"];
            }
          }
        }
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "service != nil";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      __int16 v30 = 2080;
      v31 = "";
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v34 = 1024;
      int v35 = 358;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    int v5 = 0;
  }

  return v5;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(_TSF_TSDClockManager *)self timeSyncTimeClockIdentifier] == a3)
  {
LABEL_13:
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  if ([(_TSF_TSDClockManager *)self translationClockIdentifier] == a3)
  {
    uint64_t v6 = [(_TSF_TSDClockManager *)self translationClock];
    goto LABEL_14;
  }
  int v7 = 1;
  int v8 = MEMORY[0x1E4F14500];
  *(void *)&long long v5 = 67109120;
  long long v18 = v5;
  while (1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6EC30];
    __int16 v10 = +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3, v18);
    uint64_t v11 = [v9 matchingService:v10];

    if (v11) {
      break;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v18;
      LODWORD(v20) = v7;
      int v14 = v8;
      uint64_t v15 = "TSDClockManager clockWithClockIdentifier unable to find service retry = %d\n";
      uint32_t v16 = 8;
      goto LABEL_11;
    }
LABEL_12:
    usleep(0x2710u);

    if (++v7 == 11) {
      goto LABEL_13;
    }
  }
  int v12 = [(_TSF_TSDClockManager *)self classNameForClockService:v11];
  __int16 v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = a3;
      int v14 = v8;
      uint64_t v15 = "Could not find class match for clock identifier: 0x%016llx\n";
      uint32_t v16 = 12;
LABEL_11:
      _os_log_impl(&dword_1BA88B000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v6 = (void *)[objc_alloc(NSClassFromString(v12)) initWithClockIdentifier:a3 pid:self->_pid];

LABEL_14:
  return v6;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  v23[4] = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  BOOL v7 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:7 scalarInputs:v23 scalarInputCount:4 scalarOutputs:&v22 scalarOutputCount:&v9 error:a7];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    int v17 = "";
    __int16 v18 = 2080;
    long long v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 450;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7) {
    return v22;
  }
  else {
    return -1;
  }
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v19[0] = a3;
  BOOL v4 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:8 scalarInputs:v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 469;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer = self->_timebaseInfo.numer;
  if (numer != self->_timebaseInfo.denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, numer);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, denom);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

+ (id)diagnosticInfo
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F6EC30];
  BOOL v3 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncClockManager"];
  BOOL v4 = [v2 matchingService:v3];

  if (v4)
  {
    if ([v4 conformsToIOClassName:@"IOTimeSyncClockManager"])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      int v6 = [v4 ioClassName];
      [v5 setObject:v6 forKeyedSubscript:@"ClassName"];

      long long v7 = [v4 iodPropertyForKey:@"TimeSyncTimeClockID"];
      [v5 setObject:v7 forKeyedSubscript:@"TimeSyncTimeClockID"];

      int v8 = [v4 iodPropertyForKey:@"TranslationClockID"];
      [v5 setObject:v8 forKeyedSubscript:@"TranslationClockID"];

      __int16 v9 = [v4 iodPropertyForKey:@"TimeSyncTimeCoreAudioClockDomain"];
      [v5 setObject:v9 forKeyedSubscript:@"TimeSyncTimeCoreAudioClockDomain"];

      goto LABEL_4;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316418;
      __int16 v13 = "[service conformsToIOClassName:@kIOTimeSyncClockManagerClass]";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      long long v19 = "";
      __int16 v20 = 2080;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v22 = 1024;
      int v23 = 522;
      __int16 v11 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136316418;
    __int16 v13 = "service != nil";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    long long v19 = "";
    __int16 v20 = 2080;
    int v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v22 = 1024;
    int v23 = 521;
    __int16 v11 = MEMORY[0x1E4F14500];
LABEL_11:
    _os_log_impl(&dword_1BA88B000, v11, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v12, 0x3Au);
  }
  uint64_t v5 = 0;
LABEL_4:

  return v5;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1E4F6EC30];
  long long v7 = +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:a3];
  int v8 = [v6 matchingService:v7];

  if (v8)
  {
    __int16 v9 = [a1 sharedClockManager];
    uint64_t v10 = [v9 classNameForClockService:v8];

    if (v10)
    {
      __int16 v11 = [NSClassFromString(v10) diagnosticInfoForService:v8];
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    __int16 v11 = 0;
    if (a4)
    {
LABEL_6:
      uint64_t v10 = v10;
      *a4 = v10;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316418;
      uint64_t v15 = "service != nil";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = "";
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v24 = 1024;
      int v25 = 542;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    }
    uint64_t v10 = 0;
    __int16 v11 = 0;
  }
LABEL_7:
  id v12 = v11;

  return v12;
}

+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F6EC30];
  uint64_t v5 = +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:a3];
  int v6 = [v4 matchingService:v5];

  if (v6)
  {
    long long v7 = [a1 sharedClockManager];
    int v8 = [v7 classNameForClockService:v6];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      __int16 v11 = "service != nil";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      uint64_t v17 = "";
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v20 = 1024;
      int v21 = 565;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
    int v8 = 0;
  }

  return v8;
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return self->_timeSyncTimeClockIdentifier;
}

- (unint64_t)translationClockIdentifier
{
  return self->_translationClockIdentifier;
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return self->_timeSyncTimeIsMachAbsoluteTime;
}

- (_TSF_TSDKernelClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockPersonalities, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end