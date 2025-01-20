@interface HDSPSleepSessionManager
- (BOOL)_hasUnprocessedSessions;
- (HDSPDeviceUnlockMonitor)deviceUnlockManager;
- (HDSPSleepSessionManager)initWithEnvironment:(id)a3;
- (HDSPSleepSessionManager)initWithEnvironment:(id)a3 persistence:(id)a4;
- (HDSPSleepSessionManagerDelegate)delegate;
- (HDSPSleepSessionPersistence)persistence;
- (HKSPFileManager)fileManager;
- (id)_unprocessedSessions;
- (id)saveSession:(id)a3;
- (os_unfair_lock_s)sessionLock;
- (void)_locked_savePendingSessions;
- (void)_waitForFirstUnlock;
- (void)_withLock:(id)a3;
- (void)archiveSession:(id)a3;
- (void)deviceHasBeenUnlocked;
- (void)removeSessionDataFile;
- (void)savePendingSessions;
- (void)setDelegate:(id)a3;
- (void)sleepTracker:(id)a3 didEndSession:(id)a4 reason:(unint64_t)a5;
- (void)startSession;
- (void)stopSession;
@end

@implementation HDSPSleepSessionManager

- (HDSPSleepSessionManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 healthStoreProvider];
  v6 = [v5 sleepHealthStore];
  v7 = [(HDSPSleepSessionManager *)self initWithEnvironment:v4 persistence:v6];

  return v7;
}

- (HDSPSleepSessionManager)initWithEnvironment:(id)a3 persistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSPSleepSessionManager;
  v8 = [(HDSPSleepSessionManager *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_sessionLock._os_unfair_lock_opaque = 0;
    v10 = [v6 systemMonitor];
    uint64_t v11 = [v10 deviceUnlockMonitor];
    deviceUnlockManager = v9->_deviceUnlockManager;
    v9->_deviceUnlockManager = (HDSPDeviceUnlockMonitor *)v11;

    uint64_t v13 = [v6 fileManager];
    fileManager = v9->_fileManager;
    v9->_fileManager = (HKSPFileManager *)v13;

    objc_storeStrong((id *)&v9->_persistence, a4);
    v15 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  p_sessionLock = &self->_sessionLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_sessionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_sessionLock);
}

- (void)startSession
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting session", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepSessionPersistence *)self->_persistence hdsp_startSession];
}

- (void)stopSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping session", (uint8_t *)&v8, 0xCu);
  }
  [(HDSPSleepSessionPersistence *)self->_persistence hdsp_stopSession];
  int v5 = [(HDSPSleepSessionManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(HDSPSleepSessionManager *)self delegate];
    [v7 sleepSessionManagerDidFinishSession:self];
  }
}

- (void)savePendingSessions
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__HDSPSleepSessionManager_savePendingSessions__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepSessionManager *)self _withLock:v2];
}

void __46__HDSPSleepSessionManager_savePendingSessions__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _hasUnprocessedSessions];
  v3 = HKSPLogForCategory();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v5 = v15;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] there are unprocessed sessions to save", (uint8_t *)&v14, 0xCu);
    }
    int v6 = [*(id *)(*(void *)(a1 + 32) + 32) hasBeenUnlockedSinceBoot];
    uint64_t v7 = HKSPLogForCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        id v9 = objc_opt_class();
        int v14 = 138543362;
        id v15 = v9;
        id v10 = v9;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] can write session data", (uint8_t *)&v14, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_locked_savePendingSessions");
    }
    else
    {
      if (v8)
      {
        v12 = objc_opt_class();
        int v14 = 138543362;
        id v15 = v12;
        id v13 = v12;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] can't write sessions until first unlock", (uint8_t *)&v14, 0xCu);
      }
      [*(id *)(a1 + 32) _waitForFirstUnlock];
    }
  }
  else
  {
    if (v4)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] no unprocessed sessions to save", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BOOL)_hasUnprocessedSessions
{
  return [(HKSPFileManager *)self->_fileManager hkspFileWithNameExistsInCache:@"SleepSessions.data"];
}

- (void)_waitForFirstUnlock
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] waiting for first unlock", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPDeviceUnlockMonitor *)self->_deviceUnlockManager addObserver:self];
}

- (void)_locked_savePendingSessions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(HDSPSleepSessionManager *)self _unprocessedSessions];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = objc_opt_class();
    id v6 = v5;
    *(_DWORD *)buf = 138543618;
    id v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = [v3 count];
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld unprocessed sessions", buf, 0x16u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke;
  v11[3] = &unk_2645D9720;
  v11[4] = self;
  uint64_t v7 = objc_msgSend(v3, "na_map:", v11);
  BOOL v8 = [MEMORY[0x263F58190] combineAllFutures:v7];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_2;
  v10[3] = &unk_2645D9770;
  v10[4] = self;
  id v9 = (id)[v8 addSuccessBlock:v10];
}

id __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 requiresFirstUnlock]
    && ([*(id *)(a1 + 32) delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = [v6 sleepSessionManager:*(void *)(a1 + 32) requestsProcessedSessionForSession:v3];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:v3];
  }

  return v7;
}

void __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = objc_opt_class();
    id v6 = v5;
    *(_DWORD *)buf = 138543618;
    objc_super v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = [v3 count];
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld processed sessions", buf, 0x16u);
  }
  if ([v3 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    BOOL v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "hdsp_persistSessions:", v3);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_289;
    v12[3] = &unk_2645D9748;
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v7;
    uint64_t v14 = v9;
    id v15 = v3;
    id v10 = v7;
    id v11 = (id)[v8 addCompletionBlock:v12];
  }
}

uint64_t __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_289(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) sleepSessionManager:*(void *)(a1 + 40) didSaveArchivedSessions:*(void *)(a1 + 48)];
  }
  int v2 = *(void **)(a1 + 40);

  return [v2 removeSessionDataFile];
}

- (id)_unprocessedSessions
{
  v21[2] = *MEMORY[0x263EF8340];
  if ([(HDSPSleepSessionManager *)self _hasUnprocessedSessions]
    && [(HDSPSleepSessionManager *)self _hasUnprocessedSessions])
  {
    id v3 = [(HKSPFileManager *)self->_fileManager hkspDataForCacheFileWithName:@"SleepSessions.data"];
    if (v3)
    {
      id v16 = 0;
      id v4 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:&v16];
      char v5 = (__CFString *)v16;
      if (v5)
      {
        id v6 = HKSPLogForCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v13 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v18 = v13;
          __int16 v19 = 2114;
          uint64_t v20 = v5;
          id v14 = v13;
          _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] unarchiving failed with error %{public}@", buf, 0x16u);
        }
        [(HDSPSleepSessionManager *)self removeSessionDataFile];
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x263EFFA08];
        v21[0] = objc_opt_class();
        v21[1] = objc_opt_class();
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
        id v11 = [v9 setWithArray:v10];

        uint64_t v7 = [v4 decodeObjectOfClasses:v11 forKey:@"HDSPUnprocessedSessions"];

        [v4 finishDecoding];
      }
    }
    else
    {
      BOOL v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2114;
        uint64_t v20 = @"SleepSessions.data";
        id v15 = v18;
        _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] no data found in file %{public}@", buf, 0x16u);
      }
      [(HDSPSleepSessionManager *)self removeSessionDataFile];
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)archiveSession:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  if (v4)
  {
    char v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      v25 = v4;
      id v6 = v23;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] archiveSession: %{public}@", buf, 0x16u);
    }
    uint64_t v7 = [(HDSPSleepSessionManager *)self _unprocessedSessions];
    BOOL v8 = v7;
    if (v7) {
      id v9 = (id)[v7 mutableCopy];
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v10 = v9;
    [v9 addObject:v4];
    id v11 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v11 encodeObject:v10 forKey:@"HDSPUnprocessedSessions"];
    [v11 finishEncoding];
    v12 = [v11 encodedData];
    fileManager = self->_fileManager;
    id v21 = 0;
    char v14 = [(HKSPFileManager *)fileManager hkspWriteData:v12 toCacheFileWithName:@"SleepSessions.data" error:&v21];
    id v15 = (__CFString *)v21;
    id v16 = HKSPLogForCategory();
    objc_super v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v23 = v18;
        __int16 v24 = 2114;
        v25 = v15;
        id v19 = v18;
        _os_log_error_impl(&dword_221A52000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] failed to write sessions file with error %{public}@", buf, 0x16u);
LABEL_12:
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      v25 = @"SleepSessions.data";
      id v19 = v20;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] wrote sessions to file %{public}@", buf, 0x16u);
      goto LABEL_12;
    }
  }
}

- (id)saveSession:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = (id)objc_opt_class();
    __int16 v31 = 2114;
    id v32 = v4;
    id v6 = v30;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSession %{public}@", buf, 0x16u);
  }
  uint64_t v7 = [v4 sleepIntervals];
  if ([v7 count])
  {
  }
  else
  {
    char v8 = [v4 requiresFirstUnlock];

    if ((v8 & 1) == 0)
    {
      id v23 = HKSPLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v30 = v24;
        id v25 = v24;
        _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] session has nothing to write", buf, 0xCu);
      }
      uint64_t v26 = [(HDSPSleepSessionManager *)self delegate];
      [v26 sleepSessionManager:self didSaveSession:v4];

      goto LABEL_22;
    }
  }
  if (![(HDSPDeviceUnlockMonitor *)self->_deviceUnlockManager hasBeenUnlockedSinceBoot])
  {
    id v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v17 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v30 = v17;
      id v18 = v17;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] archiving session for now", buf, 0xCu);
    }
    [(HDSPSleepSessionManager *)self archiveSession:v4];
    [(HDSPSleepSessionManager *)self _waitForFirstUnlock];
LABEL_22:
    v22 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_23;
  }
  if ([v4 requiresFirstUnlock]
    && ([(HDSPSleepSessionManager *)self delegate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) != 0))
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v30 = v12;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] session needs additional processing", buf, 0xCu);
    }
    char v14 = [(HDSPSleepSessionManager *)self delegate];
    id v15 = [v14 sleepSessionManager:self requestsProcessedSessionForSession:v4];
  }
  else
  {
    id v19 = HKSPLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      id v21 = v20;
      _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] session is ready to write", buf, 0xCu);
    }
    id v15 = [MEMORY[0x263F58190] futureWithResult:v4];
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __39__HDSPSleepSessionManager_saveSession___block_invoke;
  v28[3] = &unk_2645D97C0;
  v28[4] = self;
  v22 = [v15 flatMap:v28];

LABEL_23:

  return v22;
}

id __39__HDSPSleepSessionManager_saveSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v3;
    id v5 = v16;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving processed session %{public}@", buf, 0x16u);
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  id v14 = v3;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  char v8 = objc_msgSend(v6, "hdsp_persistSessions:", v7);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__HDSPSleepSessionManager_saveSession___block_invoke_300;
  v12[3] = &unk_2645D9798;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v9 = v3;
  char v10 = [v8 addSuccessBlock:v12];

  return v10;
}

void __39__HDSPSleepSessionManager_saveSession___block_invoke_300(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sleepSessionManager:*(void *)(a1 + 32) didSaveSession:*(void *)(a1 + 40)];
}

- (void)removeSessionDataFile
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  fileManager = self->_fileManager;
  id v8 = 0;
  char v3 = [(HKSPFileManager *)fileManager hkspRemoveFileWithNameFromCache:@"SleepSessions.data" error:&v8];
  id v4 = v8;
  if ((v3 & 1) == 0)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      char v10 = v6;
      __int16 v11 = 2114;
      id v12 = v4;
      id v7 = v6;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to remove session data file error %{public}@", buf, 0x16u);
    }
  }
}

- (void)deviceHasBeenUnlocked
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] deviceHasBeenUnlocked", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPDeviceUnlockMonitor *)self->_deviceUnlockManager removeObserver:self];
  [(HDSPSleepSessionManager *)self savePendingSessions];
}

- (void)sleepTracker:(id)a3 didEndSession:(id)a4 reason:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v7;
    id v10 = v15;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving session %{public}@ from %{public}@", buf, 0x20u);
  }
  __int16 v11 = [(HDSPSleepSessionManager *)self saveSession:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__HDSPSleepSessionManager_sleepTracker_didEndSession_reason___block_invoke;
  v13[3] = &unk_2645D97E8;
  v13[4] = self;
  id v12 = (id)[v11 addCompletionBlock:v13];
}

uint64_t __61__HDSPSleepSessionManager_sleepTracker_didEndSession_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSession];
}

- (HDSPSleepSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSleepSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDSPSleepSessionPersistence)persistence
{
  return self->_persistence;
}

- (HDSPDeviceUnlockMonitor)deviceUnlockManager
{
  return self->_deviceUnlockManager;
}

- (HKSPFileManager)fileManager
{
  return self->_fileManager;
}

- (os_unfair_lock_s)sessionLock
{
  return self->_sessionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_deviceUnlockManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end