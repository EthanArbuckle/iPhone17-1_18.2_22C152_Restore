@interface MTSleepSessionManager
+ (id)platformSpecificSourceBundleIdentifier;
+ (id)sleepSampleWithInterval:(id)a3 sampleType:(int64_t)a4 metadata:(id)a5;
- (BOOL)_hasUnprocessedSessions;
- (HKHealthStore)healthStore;
- (MTAlarmStorage)alarmStorage;
- (MTSleepSessionManager)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 sleepSessionTracker:(id)a5;
- (MTSleepSessionTracker)sleepSessionTracker;
- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate;
- (NAScheduler)serializer;
- (NSString)archivedSessionDataFile;
- (NSString)archivedSessionDataPath;
- (id)_unprocessedSessions;
- (id)_writeSessionData;
- (id)_writeSessions:(id)a3;
- (id)writeSession:(id)a3;
- (void)_removeSessionDataFile;
- (void)_unprocessedSessions;
- (void)archiveSession:(id)a3;
- (void)deviceFirstUnlocked;
- (void)saveSessionData;
- (void)setAlarmStorage:(id)a3;
- (void)setArchivedSessionDataFile:(id)a3;
- (void)setArchivedSessionDataPath:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSleepSessionTracker:(id)a3;
- (void)setSleepSessionTrackerDelegate:(id)a3;
- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4;
- (void)waitForUnlock;
@end

@implementation MTSleepSessionManager

- (MTSleepSessionManager)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 sleepSessionTracker:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MTSleepSessionManager;
  v12 = [(MTSleepSessionManager *)&v30 init];
  if (v12)
  {
    v13 = MTLogForCategory(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with tracker: %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v12->_alarmStorage, a3);
    objc_storeStrong((id *)&v12->_sleepSessionTracker, a5);
    [(MTSleepSessionTracker *)v12->_sleepSessionTracker setSleepSessionTrackerDelegate:v12];
    objc_storeWeak((id *)&v12->_sleepSessionTrackerDelegate, v10);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v14 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v34 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHKHealthStoreClass_block_invoke;
      v36 = &unk_1E5914EC0;
      v37 = &v31;
      __getHKHealthStoreClass_block_invoke((uint64_t)buf);
      v14 = (void *)v32[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v31, 8);
    uint64_t v16 = objc_opt_new();
    healthStore = v12->_healthStore;
    v12->_healthStore = (HKHealthStore *)v16;

    v18 = [(id)objc_opt_class() platformSpecificSourceBundleIdentifier];
    [(HKHealthStore *)v12->_healthStore setSourceBundleIdentifier:v18];

    [(HKHealthStore *)v12->_healthStore resume];
    v19 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v20 = [v19 firstObject];
    v21 = [MEMORY[0x1E4F28B50] mainBundle];
    v22 = [v21 bundleIdentifier];
    uint64_t v23 = [v20 stringByAppendingPathComponent:v22];
    archivedSessionDataPath = v12->_archivedSessionDataPath;
    v12->_archivedSessionDataPath = (NSString *)v23;

    uint64_t v25 = [(NSString *)v12->_archivedSessionDataPath stringByAppendingPathComponent:@"SleepSession.data"];
    archivedSessionDataFile = v12->_archivedSessionDataFile;
    v12->_archivedSessionDataFile = (NSString *)v25;

    uint64_t v27 = +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v12, +[MTScheduler defaultPriority]);
    serializer = v12->_serializer;
    v12->_serializer = (NAScheduler *)v27;
  }
  return v12;
}

+ (id)platformSpecificSourceBundleIdentifier
{
  return @"com.apple.mobiletimer";
}

- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sessionDidComplete: %{public}@", buf, 0x16u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke;
  v19[3] = &unk_1E5916B88;
  v19[4] = self;
  v7 = (void (**)(void, void))MEMORY[0x19F3A0FB0](v19);
  if (([v5 needsAdditionalProcessing] & 1) == 0)
  {
    v8 = [v5 intervals];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      v17 = MTLogForCategory(7);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ session has nothing to write", buf, 0xCu);
      }

      id v15 = [(MTSleepSessionManager *)self sleepSessionTrackerDelegate];
      v18 = [(MTSleepSessionManager *)self sleepSessionTracker];
      [v15 sleepSessionTracker:v18 sessionDidComplete:v5];

      goto LABEL_24;
    }
  }
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot])
  {
    char v10 = [v5 needsAdditionalProcessing];
    id v11 = MTLogForCategory(7);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ session needs additional processing", buf, 0xCu);
      }

      v13 = [(MTSleepSessionManager *)self sleepSessionTracker];
      if (objc_opt_respondsToSelector())
      {
        v14 = [(MTSleepSessionManager *)self sleepSessionTracker];
        id v15 = [v14 processedSessionForSession:v5];

        if (v15)
        {
          ((void (**)(void, NSObject *))v7)[2](v7, v15);
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
      }
      id v15 = MTLogForCategory(7);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MTSleepSessionManager sleepSessionTracker:sessionDidComplete:]((uint64_t)self, v15);
      }
      goto LABEL_24;
    }
    if (v12)
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ session is ready to write", buf, 0xCu);
    }

    ((void (**)(void, id))v7)[2](v7, v5);
  }
  else
  {
    uint64_t v16 = MTLogForCategory(7);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ archiving session", buf, 0xCu);
    }

    [(MTSleepSessionManager *)self archiveSession:v5];
    [(MTSleepSessionManager *)self waitForUnlock];
  }
LABEL_25:
}

void __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ writing session", buf, 0xCu);
  }

  v6 = [*(id *)(a1 + 32) writeSession:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke_287;
  v9[3] = &unk_1E5916B60;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addSuccessBlock:v9];
}

void __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke_287(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    v4 = [v3 sleepSessionTrackerDelegate];
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying %{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) sleepSessionTrackerDelegate];
  v6 = [*(id *)(a1 + 32) sleepSessionTracker];
  [v5 sleepSessionTracker:v6 sessionDidComplete:*(void *)(a1 + 40)];
}

- (void)archiveSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    serializer = self->_serializer;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__MTSleepSessionManager_archiveSession___block_invoke;
    v7[3] = &unk_1E5915000;
    v7[4] = self;
    id v8 = v4;
    [(NAScheduler *)serializer performBlock:v7];
  }
}

void __40__MTSleepSessionManager_archiveSession___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v28 = v3;
    __int16 v29 = 2114;
    objc_super v30 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ archiveSession: %{public}@", buf, 0x16u);
  }

  uint64_t v5 = (id *)(a1 + 32);
  v6 = [*(id *)(a1 + 32) _unprocessedSessions];
  int v7 = v6;
  if (v6) {
    id v8 = (void *)[v6 mutableCopy];
  }
  else {
    id v8 = objc_opt_new();
  }
  __int16 v9 = v8;
  [v8 addObject:*(void *)(a1 + 40)];
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [*(id *)(a1 + 32) archivedSessionDataPath];
  char v12 = [v10 fileExistsAtPath:v11];

  if (v12) {
    goto LABEL_12;
  }
  uint64_t v13 = MTLogForCategory(7);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *v5;
    id v15 = [*v5 archivedSessionDataPath];
    *(_DWORD *)buf = 138543874;
    id v28 = v14;
    __int16 v29 = 2114;
    objc_super v30 = @"sleep session";
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %{public}@ directory at %{public}@", buf, 0x20u);
  }
  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  v17 = [*v5 archivedSessionDataPath];
  id v26 = 0;
  [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v18 = v26;

  if (!v18)
  {
LABEL_12:
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v18 encodeObject:v9 forKey:@"MTUnprocessedSessions"];
    [v18 finishEncoding];
    v19 = [v18 encodedData];
    v20 = [*v5 archivedSessionDataFile];
    int v21 = [v19 writeToFile:v20 atomically:1];

    __int16 v22 = MTLogForCategory(7);
    id v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = *v5;
        uint64_t v25 = [v24 archivedSessionDataFile];
        *(_DWORD *)buf = 138543618;
        id v28 = v24;
        __int16 v29 = 2114;
        objc_super v30 = v25;
        _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote sessions to file %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __40__MTSleepSessionManager_archiveSession___block_invoke_cold_1(v5);
    }
  }
  else
  {
    v19 = MTLogForCategory(7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __40__MTSleepSessionManager_archiveSession___block_invoke_cold_2(v5);
    }
  }
}

- (id)writeSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__MTSleepSessionManager_writeSession___block_invoke;
  v12[3] = &unk_1E5915078;
  v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NAScheduler *)serializer performBlock:v12];
  __int16 v9 = v14;
  id v10 = v7;

  return v10;
}

void __38__MTSleepSessionManager_writeSession___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ writeSession: %{public}@", buf, 0x16u);
  }

  uint64_t v6 = a1[5];
  uint64_t v5 = (void *)a1[6];
  id v7 = (void *)a1[4];
  if (v6)
  {
    uint64_t v10 = a1[5];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  __int16 v9 = [v7 _writeSessions:v8];
  [v5 mtFinishWithFuture:v9];

  if (v6) {
}
  }

- (void)saveSessionData
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MTSleepSessionManager_saveSessionData__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

void __40__MTSleepSessionManager_saveSessionData__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _hasUnprocessedSessions])
  {
    if (+[MTDeviceListener hasBeenUnlockedSinceBoot])
    {
      v2 = MTLogForCategory(7);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        int v8 = 138543362;
        uint64_t v9 = v3;
        _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ can write session data", (uint8_t *)&v8, 0xCu);
      }

      id v4 = (id)[*(id *)(a1 + 32) _writeSessionData];
    }
    else
    {
      id v7 = *(void **)(a1 + 32);
      [v7 waitForUnlock];
    }
  }
  else
  {
    uint64_t v5 = MTLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ no unprocessed in bed intervals to save", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)waitForUnlock
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device hasn't been unlocked since boot.  Waiting for unlock...", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_deviceFirstUnlocked name:@"MTDeviceHasBeenUnlockedForFirstTime" object:0];
}

- (void)deviceFirstUnlocked
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

void __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _hasUnprocessedSessions];
  uint64_t v3 = MTLogForCategory(7);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device has been unlocked.  Writing samples to HealthKit", buf, 0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 32) _writeSessionData];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke_305;
    v8[3] = &unk_1E5916BB0;
    v8[4] = *(void *)(a1 + 32);
    id v6 = (id)[v3 addCompletionBlock:v8];
  }
  else if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device has been unlocked but no unprocessed intervals to save", buf, 0xCu);
  }
}

void __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke_305(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:@"MTDeviceHasBeenUnlockedForFirstTime" object:0];
}

- (BOOL)_hasUnprocessedSessions
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = [(MTSleepSessionManager *)self archivedSessionDataFile];
  char v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  return v5;
}

- (id)_unprocessedSessions
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([(MTSleepSessionManager *)self _hasUnprocessedSessions])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    BOOL v4 = [(MTSleepSessionManager *)self archivedSessionDataFile];
    char v5 = (void *)[v3 initWithContentsOfFile:v4];

    if (v5)
    {
      id v15 = 0;
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v15];
      id v7 = v15;
      if (v7)
      {
        int v8 = MTLogForCategory(7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[MTSleepSessionManager _unprocessedSessions]();
        }

        [(MTSleepSessionManager *)self _removeSessionDataFile];
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
        v16[0] = objc_opt_class();
        v16[1] = [(MTSleepSessionTracker *)self->_sleepSessionTracker sessionClass];
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
        __int16 v13 = [v11 setWithArray:v12];
        uint64_t v9 = [v6 decodeObjectOfClasses:v13 forKey:@"MTUnprocessedSessions"];

        [v6 finishDecoding];
      }
    }
    else
    {
      uint64_t v10 = MTLogForCategory(7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MTSleepSessionManager _unprocessedSessions](self);
      }

      [(MTSleepSessionManager *)self _removeSessionDataFile];
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)_removeSessionDataFile
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ failed to remove session data file error %{public}@");
}

- (id)_writeSessionData
{
  id v3 = [(MTSleepSessionManager *)self _unprocessedSessions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__MTSleepSessionManager__writeSessionData__block_invoke;
  v11[3] = &unk_1E5916BD8;
  v11[4] = self;
  BOOL v4 = objc_msgSend(v3, "na_map:", v11);

  char v5 = [(MTSleepSessionManager *)self _writeSessions:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MTSleepSessionManager__writeSessionData__block_invoke_2;
  v9[3] = &unk_1E5916B60;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addSuccessBlock:v9];

  return v5;
}

id __42__MTSleepSessionManager__writeSessionData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if [v3 needsAdditionalProcessing] && (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) processedSessionForSession:v3];
  }
  else
  {
    id v4 = v3;
  }
  char v5 = v4;

  return v5;
}

uint64_t __42__MTSleepSessionManager__writeSessionData__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 sleepSessionTrackerDelegate];
    int v9 = 138543618;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying %{public}@", (uint8_t *)&v9, 0x16u);
  }
  char v5 = [*(id *)(a1 + 32) sleepSessionTrackerDelegate];
  id v6 = [*(id *)(a1 + 32) sleepSessionTracker];
  id v7 = [*(id *)(a1 + 40) lastObject];
  [v5 sleepSessionTracker:v6 sessionDidComplete:v7];

  return [*(id *)(a1 + 32) _removeSessionDataFile];
}

- (id)_writeSessions:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51 = self;
  healthStore = self->_healthStore;
  id HKObjectTypeClass = getHKObjectTypeClass();
  id v7 = getHKCategoryTypeIdentifierSleepAnalysis();
  int v8 = [HKObjectTypeClass categoryTypeForIdentifier:v7];
  uint64_t v9 = [(HKHealthStore *)healthStore authorizationStatusForType:v8];

  if (v9 == 1)
  {
    id v10 = MTLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MTSleepSessionManager _writeSessions:]((uint64_t)v51, v10);
    }

    __int16 v11 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    uint64_t v13 = [v11 futureWithError:v12];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v45 = v4;
    id obj = v4;
    uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v59;
      uint64_t v46 = *(void *)v59;
      v47 = v12;
      do
      {
        uint64_t v17 = 0;
        uint64_t v48 = v15;
        do
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(__CFString **)(*((void *)&v58 + 1) + 8 * v17);
          v19 = MTLogForCategory(7);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v63 = v51;
            __int16 v64 = 2112;
            v65 = v18;
            _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing session: %@", buf, 0x16u);
          }

          uint64_t v20 = [(__CFString *)v18 startDate];
          if (v20
            && (int v21 = (void *)v20,
                [(__CFString *)v18 endDate],
                __int16 v22 = objc_claimAutoreleasedReturnValue(),
                v22,
                v21,
                v22))
          {
            uint64_t v50 = v17;
            id v23 = MTLogForCategory(7);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v63 = v51;
              __int16 v64 = 2114;
              v65 = @"sleep session";
              _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating HealthKit samples from %{public}@...", buf, 0x16u);
            }

            id v24 = objc_opt_new();
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            uint64_t v25 = [(__CFString *)v18 intervals];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v68 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v55 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                  __int16 v31 = objc_opt_class();
                  uint64_t v32 = [(__CFString *)v18 sampleType];
                  uint64_t v33 = [(__CFString *)v18 metadata];
                  uint64_t v34 = [v31 sleepSampleWithInterval:v30 sampleType:v32 metadata:v33];

                  [v24 na_safeAddObject:v34];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:v68 count:16];
              }
              while (v27);
            }

            v35 = MTLogForCategory(7);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = [v24 count];
              *(_DWORD *)buf = 138543874;
              v63 = v51;
              __int16 v64 = 2048;
              v65 = (__CFString *)v36;
              __int16 v66 = 2114;
              v67 = v18;
              _os_log_impl(&dword_19CC95000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving %lu samples for session %{public}@ to HealthKit...", buf, 0x20u);
            }

            v37 = objc_opt_new();
            uint64_t v12 = v47;
            [v47 addObject:v37];
            uint64_t v38 = v51->_healthStore;
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __40__MTSleepSessionManager__writeSessions___block_invoke;
            v52[3] = &unk_1E5916C00;
            v52[4] = v51;
            v52[5] = v18;
            id v53 = v37;
            id v39 = v37;
            [(HKHealthStore *)v38 saveObjects:v24 withCompletion:v52];

            uint64_t v16 = v46;
            uint64_t v15 = v48;
            uint64_t v17 = v50;
          }
          else
          {
            id v24 = MTLogForCategory(7);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v63 = v51;
              __int16 v64 = 2112;
              v65 = v18;
              _os_log_error_impl(&dword_19CC95000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Skipping session due to missing bedtime or wake time: %@", buf, 0x16u);
            }
          }

          ++v17;
        }
        while (v17 != v15);
        uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v15);
    }

    uint64_t v40 = +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v51, +[MTScheduler defaultPriority]);
    serializer = v51->_serializer;
    v51->_serializer = (NAScheduler *)v40;

    v42 = (void *)MEMORY[0x1E4F7A0D8];
    v43 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
    uint64_t v13 = [v42 combineAllFutures:v12 ignoringErrors:1 scheduler:v43];

    id v4 = v45;
  }

  return v13;
}

void __40__MTSleepSessionManager__writeSessions___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MTLogForCategory(7);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished saving samples for session %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __40__MTSleepSessionManager__writeSessions___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v7);
  }

  id v10 = MTLogForCategory(7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v15 = 138543618;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing session: %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v13 = (void *)a1[6];
  uint64_t v14 = NAEmptyResult();
  [v13 finishWithResult:v14 error:v5];
}

+ (id)sleepSampleWithInterval:(id)a3 sampleType:(int64_t)a4 metadata:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id HKObjectTypeClass = getHKObjectTypeClass();
    uint64_t v11 = getHKCategoryTypeIdentifierSleepAnalysis();
    uint64_t v12 = [HKObjectTypeClass categoryTypeForIdentifier:v11];

    [v12 maximumAllowedDuration];
    double v14 = v13;
    [v8 duration];
    if (v15 <= v14)
    {
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2050000000;
      uint64_t v19 = (void *)getHKCategorySampleClass_softClass;
      uint64_t v29 = getHKCategorySampleClass_softClass;
      if (!getHKCategorySampleClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getHKCategorySampleClass_block_invoke;
        double v31 = COERCE_DOUBLE(&unk_1E5914EC0);
        uint64_t v32 = &v26;
        __getHKCategorySampleClass_block_invoke((uint64_t)buf);
        uint64_t v19 = (void *)v27[3];
      }
      id v20 = v19;
      _Block_object_dispose(&v26, 8);
      uint64_t v16 = objc_msgSend(v8, "startDate", v26);
      int v21 = [v8 endDate];
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2050000000;
      __int16 v22 = (void *)getHKDeviceClass_softClass;
      uint64_t v29 = getHKDeviceClass_softClass;
      if (!getHKDeviceClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getHKDeviceClass_block_invoke;
        double v31 = COERCE_DOUBLE(&unk_1E5914EC0);
        uint64_t v32 = &v26;
        __getHKDeviceClass_block_invoke((uint64_t)buf);
        __int16 v22 = (void *)v27[3];
      }
      id v23 = v22;
      _Block_object_dispose(&v26, 8);
      id v24 = objc_msgSend(v23, "localDevice", v26);
      uint64_t v18 = [v20 categorySampleWithType:v12 value:a4 startDate:v16 endDate:v21 device:v24 metadata:v9];
    }
    else
    {
      uint64_t v16 = MTLogForCategory(7);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [v8 duration];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2048;
        double v31 = v14;
        _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep interval: %f greater than allowed: %f. Will not be used", buf, 0x20u);
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v12 = MTLogForCategory(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Interval is nil.", buf, 0xCu);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSString)archivedSessionDataPath
{
  return self->_archivedSessionDataPath;
}

- (void)setArchivedSessionDataPath:(id)a3
{
}

- (NSString)archivedSessionDataFile
{
  return self->_archivedSessionDataFile;
}

- (void)setArchivedSessionDataFile:(id)a3
{
}

- (MTSleepSessionTracker)sleepSessionTracker
{
  return self->_sleepSessionTracker;
}

- (void)setSleepSessionTracker:(id)a3
{
}

- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepSessionTrackerDelegate);
  return (MTSleepSessionTrackerDelegate *)WeakRetained;
}

- (void)setSleepSessionTrackerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sleepSessionTrackerDelegate);
  objc_storeStrong((id *)&self->_sleepSessionTracker, 0);
  objc_storeStrong((id *)&self->_archivedSessionDataFile, 0);
  objc_storeStrong((id *)&self->_archivedSessionDataPath, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

- (void)sleepSessionTracker:(uint64_t)a1 sessionDidComplete:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to process session", (uint8_t *)&v2, 0xCu);
}

void __40__MTSleepSessionManager_archiveSession___block_invoke_cold_1(id *a1)
{
  os_log_t v1 = [*a1 archivedSessionDataFile];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ failed to write sessions file %{public}@", v4, v5, v6, v7, v8);
}

void __40__MTSleepSessionManager_archiveSession___block_invoke_cold_2(id *a1)
{
  os_log_t v1 = [*a1 archivedSessionDataPath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ failed to create directory at %{public}@", v4, v5, v6, v7, v8);
}

- (void)_unprocessedSessions
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ unarchiving failed with error %{public}@");
}

- (void)_writeSessions:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ doesn't have write access for HKCategoryTypeIdentifierSleepAnalysis", (uint8_t *)&v2, 0xCu);
}

void __40__MTSleepSessionManager__writeSessions___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, a2, a3, "%{public}@ Saving samples to Health failed with error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end