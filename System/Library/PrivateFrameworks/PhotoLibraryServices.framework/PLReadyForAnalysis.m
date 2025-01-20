@interface PLReadyForAnalysis
- (BOOL)_lock_isReadyForAnalysisState:(unsigned __int16)a3;
- (BOOL)isReadyForAnalysis;
- (BOOL)isReadyForAnalysisInitialDownloadCompleted;
- (BOOL)isReadyForAnalysisQuickCheck;
- (PLReadyForAnalysis)initWithLibraryServicesManager:(id)a3;
- (id)_statusLogPrefix;
- (id)appPrivateData;
- (void)_lock_checkCPLInitialDownloadStatusForState:(unsigned __int16)a3;
- (void)_lock_checkComputeCacheStatusForState:(unsigned __int16)a3;
- (void)_lock_checkIsReadyForAnalysisForState:(unsigned __int16)a3;
- (void)_lock_checkReadyForCPLStatusForState:(unsigned __int16)a3;
- (void)_lock_logIfPermittedWithString:(id)a3;
- (void)_lock_updateAndLogStatusWithString:(id)a3;
- (void)dealloc;
- (void)resetReadyForAnalysisState;
@end

@implementation PLReadyForAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_lastLogDate, 0);
  objc_storeStrong((id *)&self->_lock_status, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (void)_lock_checkComputeCacheStatusForState:(unsigned __int16)a3
{
  char v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 4) != 0)
  {
    if ([(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:2])
    {
      if (![(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:4])
      {
        v5 = [(PLLibraryServicesManager *)self->_lsm computeCacheManager];
        int v6 = [v5 isReadyForAnalysis];

        if (v6)
        {
          self->_lock_readyState |= 4u;
          [(PLReadyForAnalysis *)self _lock_updateAndLogStatusWithString:@"ComputeCacheCompleted"];
        }
      }
    }
  }
}

- (void)_lock_checkCPLInitialDownloadStatusForState:(unsigned __int16)a3
{
  char v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 2) != 0
    && ![(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:2])
  {
    v5 = [(PLLibraryServicesManager *)self->_lsm cloudPhotoLibraryManager];
    int v6 = [v5 isReadyForAnalysis];

    if (v6)
    {
      self->_lock_readyState |= 2u;
      [(PLReadyForAnalysis *)self _lock_updateAndLogStatusWithString:@"CPLDownloadCompleted"];
    }
  }
}

- (void)_lock_checkReadyForCPLStatusForState:(unsigned __int16)a3
{
  char v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 1) != 0
    && ![(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:1])
  {
    v5 = [(PLLibraryServicesManager *)self->_lsm cplReadiness];
    int v6 = [v5 isReadyForCloudPhotoLibraryWithStatus:0];

    if (v6)
    {
      self->_lock_readyState |= 1u;
      [(PLReadyForAnalysis *)self _lock_updateAndLogStatusWithString:@"ReadyForCPL"];
    }
  }
}

- (void)_lock_checkIsReadyForAnalysisForState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((~self->_lock_readyState & 7) == 0) {
    return;
  }
  [(PLReadyForAnalysis *)self _lock_checkReadyForCPLStatusForState:v3];
  BOOL v5 = [(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:1];
  if ((v3 & 1) != 0 && !v5) {
    return;
  }
  BOOL v6 = [(PLLibraryServicesManager *)self->_lsm isCloudPhotoLibraryEnabled];
  BOOL v7 = v3 == 6 && v6;
  if (v6)
  {
    if (v3 != 6)
    {
      v8 = 0;
      goto LABEL_15;
    }
    if (![(PLReadyForAnalysis *)self _lock_isReadyForAnalysisState:6])
    {
      v8 = [(PLReadyForAnalysis *)self appPrivateData];
LABEL_15:
      id v10 = v8;
      if ([v8 getCachedIsReadyForAnalysisFromSavedState])
      {
        self->_lock_readyState |= 6u;
      }
      else
      {
        [(PLReadyForAnalysis *)self _lock_checkCPLInitialDownloadStatusForState:v3];
        [(PLReadyForAnalysis *)self _lock_checkComputeCacheStatusForState:v3];
        if (v7) {
          objc_msgSend(v10, "saveCachedIsReadyForAnalysis:", -[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 6));
        }
      }
      v9 = v10;
      goto LABEL_20;
    }
  }
  else
  {
    self->_lock_readyState |= 2u;
    [(PLReadyForAnalysis *)self _lock_updateAndLogStatusWithString:@"CPLDownloadCompleted (iCPL Disabled)"];
    [(PLReadyForAnalysis *)self _lock_checkComputeCacheStatusForState:v3];
  }
  v9 = 0;
LABEL_20:
}

- (BOOL)_lock_isReadyForAnalysisState:(unsigned __int16)a3
{
  int v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  return (v3 & ~self->_lock_readyState) == 0;
}

- (void)_lock_logIfPermittedWithString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  BOOL v6 = NSString;
  BOOL v7 = [(PLReadyForAnalysis *)self _statusLogPrefix];
  v8 = [v6 stringWithFormat:@"%@: [%@]: %@", v7, v5, self->_lock_status];

  v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSinceDate:self->_lock_lastLogDate];
  double v11 = v10;

  double v12 = (double)PLReadyForAnalysisLogTimerInterval;
  v13 = PLBackendGetLog();
  lock_lastLogDate = (NSDate *)v13;
  if (v11 <= v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_19B3C7000, &lock_lastLogDate->super, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_19B3C7000, &lock_lastLogDate->super, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v15 = [MEMORY[0x1E4F1C9C8] now];
    lock_lastLogDate = self->_lock_lastLogDate;
    self->_lock_lastLogDate = v15;
  }
}

- (void)_lock_updateAndLogStatusWithString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v6)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLReadyForAnalysis.m", 133, @"Invalid parameter not satisfying: %@", @"status" object file lineNumber description];
  }
  if (![(NSString *)self->_lock_status isEqualToString:v6])
  {
    objc_storeStrong((id *)&self->_lock_status, a3);
    BOOL v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PLReadyForAnalysis *)self _statusLogPrefix];
      lock_status = self->_lock_status;
      *(_DWORD *)buf = 138543618;
      double v12 = v8;
      __int16 v13 = 2114;
      v14 = lock_status;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
  }
}

- (id)_statusLogPrefix
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"ReadyForAnalysis status [%p] (%td)", self->_lsm, -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self->_lsm, "wellKnownPhotoLibraryIdentifier"));
}

- (void)resetReadyForAnalysisState
{
}

uint64_t __48__PLReadyForAnalysis_resetReadyForAnalysisState__block_invoke(uint64_t a1)
{
  *(_WORD *)(*(void *)(a1 + 32) + 28) = 0;
  v2 = [*(id *)(a1 + 32) appPrivateData];
  [v2 saveCachedIsReadyForAnalysis:0];

  int v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_lock_updateAndLogStatusWithString:", @"Reset");
}

- (BOOL)isReadyForAnalysisInitialDownloadCompleted
{
  return PLBoolResultWithUnfairLock();
}

uint64_t __64__PLReadyForAnalysis_isReadyForAnalysisInitialDownloadCompleted__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 2) & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 3);
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_lock_logIfPermittedWithString:", @"isReadyForAnalysisInitialDownloadCompleted");
  return v2;
}

- (BOOL)isReadyForAnalysisQuickCheck
{
  return PLBoolResultWithUnfairLock();
}

uint64_t __50__PLReadyForAnalysis_isReadyForAnalysisQuickCheck__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 6) & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 6);
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 6);
  objc_msgSend(*(id *)(a1 + 32), "_lock_logIfPermittedWithString:", @"isReadyForAnalysisQuickCheck");
  return v2;
}

- (BOOL)isReadyForAnalysis
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  int v3 = PLBoolResultWithUnfairLock();
  BOOL v4 = v3;
  if (*((unsigned char *)v18 + 24)) {
    int v5 = v3;
  }
  else {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    id v6 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
    BOOL v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLReadyForAnalysis isReadyForAnalysis]"];

    v8 = [v7 globalValues];
    v9 = [v8 libraryReadyForAnalysisDate];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      double v11 = [MEMORY[0x1E4F1C9C8] now];
      [v8 setLibraryReadyForAnalysisDate:v11];
      double v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = [(PLReadyForAnalysis *)self _statusLogPrefix];
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        __int16 v23 = 2114;
        v24 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: marker date for readyForAnalysis - %{public}@", buf, 0x16u);
      }
    }
  }
  _Block_object_dispose(&v17, 8);
  return v4;
}

uint64_t __40__PLReadyForAnalysis_isReadyForAnalysis__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 7);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 7);
  objc_msgSend(*(id *)(a1 + 32), "_lock_logIfPermittedWithString:", @"isReadyForAnalysis");
  return v2;
}

- (id)appPrivateData
{
  return (id)[(PLLazyObject *)self->_lazyAppPrivateData objectValue];
}

- (void)dealloc
{
  [(PLLazyObject *)self->_lazyAppPrivateData invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLReadyForAnalysis;
  [(PLReadyForAnalysis *)&v3 dealloc];
}

- (PLReadyForAnalysis)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLReadyForAnalysis;
  id v6 = [(PLReadyForAnalysis *)&v20 init];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_lock_readyState = 0;
    objc_storeStrong((id *)&v6->_lsm, a3);
    id v8 = objc_initWeak(&location, v7);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__PLReadyForAnalysis_initWithLibraryServicesManager___block_invoke;
    v16[3] = &unk_1E5870860;
    objc_copyWeak(&v18, &location);
    id v17 = v5;
    uint64_t v10 = [v9 initWithBlock:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    lazyAppPrivateData = v7->_lazyAppPrivateData;
    v7->_lazyAppPrivateData = (PLLazyObject *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    lock_lastLogDate = v7->_lock_lastLogDate;
    v7->_lock_lastLogDate = (NSDate *)v12;

    uint64_t v15 = v7;
    PLRunWithUnfairLock();
  }
  return v7;
}

id __53__PLReadyForAnalysis_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F8B858];
    BOOL v4 = [*(id *)(a1 + 32) pathManager];
    id v5 = [v4 libraryURL];
    id v6 = [v3 appPrivateDataForLibraryURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __53__PLReadyForAnalysis_initWithLibraryServicesManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateAndLogStatusWithString:", @"Initialized");
}

@end