@interface PLCloudResourceManager
- (PLCloudResourceManager)init;
- (PLCloudResourceManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4;
- (double)_minimumIntervalBetweenOperations;
- (id)statusForDebug:(BOOL)a3;
- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4;
- (void)clearPrefetchState;
- (void)handleCPLConfigurationChange;
- (void)handleCPLStatusChange;
- (void)handleOptimizeModeChange;
- (void)invalidate;
- (void)startAutomaticPrefetchAndPruneWithTimeout:(BOOL)a3;
- (void)stop;
- (void)updateCacheDeletePurgeableAmount;
@end

@implementation PLCloudResourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOperationDate, 0);
  objc_storeStrong((id *)&self->_pruneManager, 0);
  objc_storeStrong((id *)&self->_prefetchManager, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)clearPrefetchState
{
}

- (id)statusForDebug:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  uint64_t v6 = [v5 photoDirectoryWithType:1];

  uint64_t v38 = [MEMORY[0x1E4F8B8D8] fileSystemSizeForPath:v6];
  v42 = (void *)v6;
  uint64_t v37 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForPath:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
  v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v7 setTimeZone:v8];

  v9 = [(PLLibraryServicesManager *)self->_libraryServicesManager libraryURL];
  v10 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v9 createIfMissing:1 error:0];

  v11 = [(PLLibraryServicesManager *)self->_libraryServicesManager cplSettings];
  v40 = v10;
  BOOL v43 = v3;
  if ([(PLLibraryServicesManager *)self->_libraryServicesManager isSystemPhotoLibrary])
  {
    v12 = (__CFString *)*MEMORY[0x1E4F59798];
  }
  else
  {
    if ([v11 isAppLibrary])
    {
      v13 = [v10 containerIdentifier];
      v14 = [v10 uuid];
      CPLLibraryIdentifierForApp();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v12 = @"None";
  }
  v45 = v12;
LABEL_7:
  v34 = NSString;
  v33 = [(PLLibraryServicesManager *)self->_libraryServicesManager mainScopeIdentifier];
  if ([(PLLibraryServicesManager *)self->_libraryServicesManager isCloudPhotoLibraryEnabled])
  {
    v15 = @"YES";
  }
  else
  {
    v15 = @"NO";
  }
  v31 = v15;
  v39 = v11;
  v44 = +[PLCloudResourcePrefetchManager descriptionForPrefetchMode:](PLCloudResourcePrefetchManager, "descriptionForPrefetchMode:", [v11 prefetchMode]);
  v36 = [(PLLibraryServicesManager *)self->_libraryServicesManager fingerprintContext];
  v35 = [v36 fingerprintSchemeForNewMasterAsset];
  v16 = [v35 fingerprintSchemeDescription];
  v32 = [MEMORY[0x1E4F1C9C8] date];
  v30 = [v7 stringFromDate:v32];
  v17 = [v7 stringFromDate:self->_lastOperationDate];
  lastOperationDate = self->_lastOperationDate;
  [(PLCloudResourceManager *)self _minimumIntervalBetweenOperations];
  v19 = -[NSDate dateByAddingTimeInterval:](lastOperationDate, "dateByAddingTimeInterval:");
  v41 = v7;
  v20 = [v7 stringFromDate:v19];
  if (self->_enqueuedOperation) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  v22 = [MEMORY[0x1E4F28B68] stringFromByteCount:v38 countStyle:3];
  v23 = [MEMORY[0x1E4F28B68] stringFromByteCount:v37 countStyle:3];
  v24 = [(PLCloudResourcePrefetchManager *)self->_prefetchManager prefetchStatusForDebug:v43];
  v25 = [v34 stringWithFormat:@"Library Identifier: %@\nMain Scope Identifier: %@\niCPL enabled: %@\nPrefetch Mode: %@\nDefault fingerprint scheme: %@\nCurrent time: %@\nLast operation time: %@\nNext operation time: %@\nEnqueued: %@\nTotal storage: %@ Available storage: %@\n\n%@", v45, v33, v31, v44, v16, v30, v17, v20, v21, v22, v23, v24];

  pruneManager = self->_pruneManager;
  if (pruneManager)
  {
    v27 = [(PLCloudResourcePruneManager *)pruneManager pruneStatusForDebug:v43];
    uint64_t v28 = [v25 stringByAppendingFormat:@"\nPrune status (non-CCD):\n%@\n", v27];

    v25 = (void *)v28;
  }

  return v25;
}

- (void)handleCPLConfigurationChange
{
}

- (void)handleCPLStatusChange
{
}

- (void)handleOptimizeModeChange
{
  [(PLCloudResourcePrefetchManager *)self->_prefetchManager handleOptimizeModeChange];
  pruneManager = self->_pruneManager;
  [(PLCloudResourcePruneManager *)pruneManager handleOptimizeModeChange];
}

- (void)stop
{
  [(PLCloudResourcePruneManager *)self->_pruneManager stop];
  [(PLCloudResourcePrefetchManager *)self->_prefetchManager stop];
  lastOperationDate = self->_lastOperationDate;
  self->_lastOperationDate = 0;

  self->_enqueuedOperation = 0;
}

- (void)updateCacheDeletePurgeableAmount
{
}

- (void)startAutomaticPrefetchAndPruneWithTimeout:(BOOL)a3
{
  v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourceManager startAutomaticPrefetchAndPruneWithTimeout:]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke;
  v6[3] = &unk_1E58748B0;
  BOOL v7 = a3;
  v6[4] = self;
  [(PLCloudResourceManager *)self _runOnWorkQueueWithTransaction:v5 block:v6];
}

void __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    BOOL v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        *(double *)&v4 = COERCE_DOUBLE(@"YES");
      }
      else {
        *(double *)&v4 = COERCE_DOUBLE(@"NO");
      }
      *(_DWORD *)buf = 138412290;
      double v20 = *(double *)&v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch/prune with timeOut %@", buf, 0xCu);
    }
  }
  if (!*(unsigned char *)(a1 + 40) || !*(void *)(*(void *)(a1 + 32) + 40)) {
    goto LABEL_16;
  }
  v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = *(void **)(a1 + 32);
  BOOL v7 = (void *)v6[5];
  [v6 _minimumIntervalBetweenOperations];
  v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");
  [v8 timeIntervalSinceDate:v5];
  if (v9 <= 0.0)
  {
    if (!*v2)
    {
      v10 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Allowed to start prefetch/prune now", buf, 2u);
      }
    }
LABEL_16:
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if ([*(id *)(*(void *)(a1 + 32) + 32) diskSpaceToPrune] <= 0) {
      [*(id *)(*(void *)(a1 + 32) + 24) startAutomaticPrefetch];
    }
    return;
  }
  double v14 = v9;
  if (!*v2)
  {
    v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = *(double *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      double v20 = v16;
      __int16 v21 = 2048;
      double v22 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Last operation date is %@, next operation is allowed in %f seconds, skip automatic prefetch/prune now", buf, 0x16u);
    }
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v17 + 48))
  {
    if (!*v2)
    {
      v18 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v20 = v14;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Enqueuing automatic prefetch/prune in %f seconds", buf, 0xCu);
      }

      uint64_t v17 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v17 + 48) = 1;
    dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    pl_dispatch_after();
  }
}

uint64_t __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke_40(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return [*(id *)(a1 + 32) startAutomaticPrefetchAndPruneWithTimeout:*(unsigned __int8 *)(a1 + 40)];
}

- (double)_minimumIntervalBetweenOperations
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"PLPrefetchMinimumIntervalBetweenOperations"];

  double result = 600.0;
  if (v3 >= 1) {
    return (double)v3;
  }
  return result;
}

- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  id v6 = v8;
  pl_dispatch_async();
}

uint64_t __63__PLCloudResourceManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)invalidate
{
}

- (PLCloudResourceManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLCloudResourceManager;
  id v8 = [(PLCloudResourceManager *)&v20 init];
  if (v8)
  {
    double v9 = PLCloudCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v10 = dispatch_queue_create("PLCloudResourceManager work queue", v9);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_libraryServicesManager, a4);
    uint64_t v12 = [v7 pathManager];
    v13 = [v12 capabilities];
    char v14 = [v13 isCentralizedCacheDeleteCapable];

    if ((v14 & 1) == 0)
    {
      v15 = [[PLCloudResourcePruneManager alloc] initWithCPLManager:v6 libraryServicesManager:v7];
      pruneManager = v8->_pruneManager;
      v8->_pruneManager = v15;
    }
    uint64_t v17 = [[PLCloudResourcePrefetchManager alloc] initWithCPLManager:v6 pruneManager:v8->_pruneManager libraryServicesManager:v7];
    prefetchManager = v8->_prefetchManager;
    v8->_prefetchManager = v17;

    v8->_enqueuedOperation = 0;
  }

  return v8;
}

- (PLCloudResourceManager)init
{
  return 0;
}

@end