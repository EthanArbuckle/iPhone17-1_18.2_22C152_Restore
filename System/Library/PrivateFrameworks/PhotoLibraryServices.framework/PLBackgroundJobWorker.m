@interface PLBackgroundJobWorker
+ (BOOL)allowWorkerToRunDuringCPLInitialSync;
+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)usesMultipleLibrariesConcurrently;
+ (int64_t)availableDiskSpaceForVolumeURL:(id)a3;
- (BOOL)hasEnoughDiskSpaceToContinue:(id)a3;
- (BOOL)isInterruptible;
- (BOOL)shouldDeferActivity;
- (NSString)description;
- (NSString)workerDetailedName;
- (NSString)workerName;
- (PLBackgroundJobStatusCenter)statusCenter;
- (PLBackgroundJobWorker)init;
- (PLBackgroundJobWorker)initWithLibraryBundle:(id)a3;
- (PLPhotoLibraryBundle)libraryBundle;
- (id)pendingJobsInLibrary:(id)a3;
- (id)photoLibraryWithDatabaseContext:(id)a3;
- (id)redactedDescription;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)_handleAllJobsCompleteInLibrary:(id)a3 allowOutsideLimiter:(BOOL)a4;
- (void)_processNextManagedObjectInLibrary:(id)a3 continueRunning:(BOOL)a4 allowOutsideLimiter:(BOOL)a5;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)setStatusCenter:(id)a3;
- (void)startWorkInLibrary:(id)a3 withWorkItemsNeedingProcessing:(id)a4 withCompletion:(id)a5;
- (void)stopAllWork;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
  objc_storeStrong((id *)&self->_workerDetailedName, 0);
  objc_storeStrong((id *)&self->_workerName, 0);
  objc_storeStrong((id *)&self->_pendingJobs, 0);
  objc_storeStrong(&self->_workerForcefullyStopHandler, 0);
  objc_storeStrong(&self->_currentManagedObjectCompletionHandler, 0);
  objc_storeStrong(&self->_workerCompleteCompletionHandler, 0);
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return self->_libraryBundle;
}

- (void)setStatusCenter:(id)a3
{
}

- (PLBackgroundJobStatusCenter)statusCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  return (PLBackgroundJobStatusCenter *)WeakRetained;
}

- (NSString)workerDetailedName
{
  return self->_workerDetailedName;
}

- (NSString)workerName
{
  return self->_workerName;
}

- (void)stopWorkingOnItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  PLAbstractMethodException();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)photoLibraryWithDatabaseContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PLBackgroundJobWorker *)self workerName];
  id v6 = objc_msgSend(v4, "newShortLivedLibraryWithName:", objc_msgSend(v5, "UTF8String"));

  return v6;
}

- (BOOL)hasEnoughDiskSpaceToContinue:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = objc_opt_class();
  id v6 = [(PLPhotoLibraryBundle *)self->_libraryBundle pathManager];
  v7 = [v6 libraryURL];
  uint64_t v8 = [v5 availableDiskSpaceForVolumeURL:v7];

  if (v8 <= 2)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = @"stopping due to low available disk space";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [v9 errorWithDomain:v10 code:46516 userInfo:v11];
    v4[2](v4, v12);
  }
  return v8 > 2;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)stopAllWork
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    *(_DWORD *)buf = 138543362;
    v22 = workerName;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ worker told to stop all work. Setting _shouldStop flag", buf, 0xCu);
  }

  self->_shouldStop = 1;
  BOOL v6 = [(PLBackgroundJobWorker *)self isInterruptible];
  v7 = PLBackgroundJobServiceGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ IS interruptible, asking it to stop working async", buf, 0xCu);
    }

    qos_class_t v10 = qos_class_self();
    v11 = dispatch_get_global_queue(v10, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke;
    block[3] = &unk_1E5875CE0;
    block[4] = self;
    dispatch_async(v11, block);
  }
  else
  {
    if (v8)
    {
      id v12 = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is not interruptible", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_61;
  v18[3] = &unk_1E5875F08;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v18);
  id workerForcefullyStopHandler = self->_workerForcefullyStopHandler;
  self->_id workerForcefullyStopHandler = v13;

  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  qos_class_t v16 = qos_class_self();
  v17 = dispatch_get_global_queue(v16, 0);
  dispatch_after(v15, v17, self->_workerForcefullyStopHandler);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

uint64_t __36__PLBackgroundJobWorker_stopAllWork__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2;
  v2[3] = &unk_1E5875CE0;
  v2[4] = *(void *)(a1 + 32);
  return +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v2];
}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_61(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2_62;
  v1[3] = &unk_1E5875F08;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v1];
  objc_destroyWeak(&v2);
}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2_62(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v4 = [NSString stringWithFormat:@"Worker taking too long to stop, completionHandler forcefully called"];
    v13[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    BOOL v6 = [v2 errorWithDomain:v3 code:50001 userInfo:v5];

    v7 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = WeakRetained[9];
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Worker %{public}@ taking too long to stop, about to forcefully call its completionHandler", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = WeakRetained[2];
    if (v9) {
      (*(void (**)(uint64_t, NSObject *))(v9 + 16))(v9, v6);
    }
  }
  else
  {
    BOOL v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Worker already nil-ed out in _workerForcefullyStopHandler, returning", (uint8_t *)&v10, 2u);
    }
  }
}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
    int v8 = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Going to interrupt %{public}@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) firstObject];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if (v4)
  {
    [*(id *)(a1 + 32) stopWorkingOnItem:v5];
    BOOL v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupted!", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)startWorkInLibrary:(id)a3 withWorkItemsNeedingProcessing:(id)a4 withCompletion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)[a5 copy];
  id workerCompleteCompletionHandler = self->_workerCompleteCompletionHandler;
  self->_id workerCompleteCompletionHandler = v10;

  os_unfair_lock_lock(&self->_lock);
  if ([v9 count]) {
    [(NSMutableArray *)self->_pendingJobs addObjectsFromArray:v9];
  }
  self->_totalJobsCount = [(NSMutableArray *)self->_pendingJobs count];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v12 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    uint64_t v14 = [(NSMutableArray *)self->_pendingJobs count];
    *(_DWORD *)buf = 138543618;
    v21 = workerName;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ worker has %tu pending jobs. Starting on first one", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(WeakRetained, "recordStartingWorker:withJobCount:", self, -[NSMutableArray count](self->_pendingJobs, "count"));

  qos_class_t v16 = +[PLConcurrencyLimiter sharedLimiter];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__PLBackgroundJobWorker_startWorkInLibrary_withWorkItemsNeedingProcessing_withCompletion___block_invoke;
  v18[3] = &unk_1E5875E18;
  void v18[4] = self;
  id v19 = v8;
  id v17 = v8;
  [v16 async:v18 identifyingBlock:0 library:v17];
}

uint64_t __90__PLBackgroundJobWorker_startWorkInLibrary_withWorkItemsNeedingProcessing_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextManagedObjectInLibrary:*(void *)(a1 + 40) continueRunning:1 allowOutsideLimiter:0];
}

- (id)pendingJobsInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  qos_class_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__106679;
  id v19 = __Block_byref_object_dispose__106680;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke;
  v12[3] = &unk_1E5875340;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  BOOL v6 = (void *)MEMORY[0x19F38D650](v12);
  if ([(id)objc_opt_class() usesMultipleLibrariesConcurrently])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke_2;
    v10[3] = &unk_1E5875198;
    id v11 = v6;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v10];
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = +[PLConcurrencyLimiter sharedLimiter];
    [v7 sync:v6 identifyingBlock:0 library:v5];
  }

  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workItemsNeedingProcessingInLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleAllJobsCompleteInLibrary:(id)a3 allowOutsideLimiter:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4
    && !+[PLConcurrencyLimiter isRunningUnderLimiter])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PLBackgroundJobWorker.m" lineNumber:245 description:@"expected to already be on the limiter"];
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    int v12 = 138543362;
    id v13 = workerName;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ worker finished processing all jobs", (uint8_t *)&v12, 0xCu);
  }

  (*((void (**)(void))self->_workerCompleteCompletionHandler + 2))();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  [WeakRetained recordFinishingWorker:self];
}

- (void)_processNextManagedObjectInLibrary:(id)a3 continueRunning:(BOOL)a4 allowOutsideLimiter:(BOOL)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a5
    && !+[PLConcurrencyLimiter isRunningUnderLimiter])
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PLBackgroundJobWorker.m" lineNumber:116 description:@"expected to already be on the limiter"];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = (void *)[(NSMutableArray *)self->_pendingJobs count];
  id v11 = [(NSMutableArray *)self->_pendingJobs firstObject];
  BOOL shouldStop = self->_shouldStop;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke;
  v40[3] = &unk_1E5874318;
  BOOL v42 = a5;
  v40[4] = self;
  id v13 = v9;
  id v41 = v13;
  uint64_t v14 = MEMORY[0x19F38D650](v40);
  uint64_t v15 = (void (**)(void))v14;
  if (!v13)
  {
    uint64_t v24 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      libraryBundle = self->_libraryBundle;
      *(_DWORD *)buf = 138412290;
      v44 = libraryBundle;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "_photoLibrary is nil when processing next object, setting shouldStop to YES to initiate job completion. Bundle %@", buf, 0xCu);
    }

    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    v26 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      workerName = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v44 = (PLPhotoLibraryBundle *)workerName;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ continueRunning set to NO. Setting shouldStop to YES to initiate job completion", buf, 0xCu);
    }

    goto LABEL_17;
  }
  if (!shouldStop)
  {
    if (v10)
    {
      qos_class_t v16 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = self->_workerName;
        unint64_t totalJobsCount = self->_totalJobsCount;
        *(_DWORD *)buf = 138544130;
        v44 = (PLPhotoLibraryBundle *)v17;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = totalJobsCount - v10 + 1;
        *(_WORD *)&v46[4] = 2048;
        *(void *)&v46[6] = totalJobsCount;
        __int16 v47 = 2114;
        v48 = v11;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ worker processing object %d of %tu: %{public}@", buf, 0x26u);
      }

      objc_initWeak((id *)buf, self);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_54;
      v36[3] = &unk_1E5873468;
      objc_copyWeak(v39, (id *)buf);
      id v19 = v13;
      id v37 = v19;
      v39[1] = v10;
      id v20 = v11;
      id v38 = v20;
      v21 = (void *)MEMORY[0x19F38D650](v36);
      id currentManagedObjectCompletionHandler = self->_currentManagedObjectCompletionHandler;
      self->_id currentManagedObjectCompletionHandler = v21;

      atomic_fetch_add(&self->_workerAtomicCounter, 1uLL);
      uint64_t v23 = +[PLConcurrencyLimiter sharedLimiter];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3_60;
      v33[3] = &unk_1E5873A50;
      v33[4] = self;
      id v34 = v20;
      id v35 = v19;
      [v23 async:v33 identifyingBlock:0 library:v35];

      objc_destroyWeak(v39);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    goto LABEL_20;
  }
LABEL_17:
  v28 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_workerName;
    uint64_t v30 = [(NSMutableArray *)self->_pendingJobs count];
    *(_DWORD *)buf = 138543618;
    v44 = (PLPhotoLibraryBundle *)v29;
    __int16 v45 = 2048;
    *(void *)v46 = v30;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ told to stop halfway! Clearing %tu jobs from _pendingJobs queue", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(WeakRetained, "recordStoppingWorker:withRemainingJobCount:", self, -[NSMutableArray count](self->_pendingJobs, "count"));

  [(NSMutableArray *)self->_pendingJobs removeAllObjects];
  v15[2](v15);
LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    qos_class_t v2 = qos_class_self();
    uint64_t v3 = dispatch_get_global_queue(v2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2;
    block[3] = &unk_1E5875E18;
    id v4 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v5 = &v10;
    id v10 = v4;
    dispatch_async(v3, block);
  }
  else
  {
    uint64_t v3 = +[PLConcurrencyLimiter sharedLimiter];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_4;
    v7[3] = &unk_1E5875E18;
    BOOL v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v5 = &v8;
    id v8 = v6;
    [v3 async:v7 identifyingBlock:0 library:*(void *)(a1 + 40)];
  }
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (const os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (os_unfair_lock *)WeakRetained;
  if (!WeakRetained)
  {
    int v12 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Worker already nil-ed out in _currentManagedObjectCompletionHandler, returning";
      uint64_t v14 = v12;
      uint32_t v15 = 2;
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
LABEL_11:

    goto LABEL_36;
  }
  os_unfair_lock_assert_not_owner(WeakRetained + 16);
  atomic_fetch_add((atomic_ullong *volatile)&v5[8], 1uLL);
  unint64_t v6 = atomic_load((unint64_t *)&v5[8]._os_unfair_lock_opaque);
  unint64_t v7 = atomic_load((unint64_t *)&v5[6]._os_unfair_lock_opaque);
  if (v6 != v7)
  {
    int v12 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      qos_class_t v16 = *(void **)&v5[18]._os_unfair_lock_opaque;
      unint64_t v17 = atomic_load((unint64_t *)&v5[8]._os_unfair_lock_opaque);
      unint64_t v18 = atomic_load((unint64_t *)&v5[6]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 138544130;
      v46 = v16;
      __int16 v47 = 2048;
      *(void *)v48 = v17;
      *(_WORD *)&v48[8] = 2048;
      *(void *)&v48[10] = v18;
      *(_WORD *)&v48[18] = 2114;
      *(void *)&v48[20] = v3;
      id v13 = "Worker %{public}@ completionHandler called more than once, dropping subsequent call. completionHandlerAtomic"
            "Counter: %lld. workerAtomicCounter: %lld. Error: %{public}@";
      uint64_t v14 = v12;
      uint32_t v15 = 42;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v8 = PLIsErrorEqualToCode();
  int v9 = v8;
  if (v8)
  {
    int v36 = v8;
    id v10 = *(id *)&v5[20]._os_unfair_lock_opaque;
    os_unfair_lock_lock((os_unfair_lock_t)&_background_job_worker_crashtracer_lock);
    if (v10)
    {
      id v11 = [NSString stringWithFormat:@"Worker at fault: %@, wait time: %0.1f seconds", v10, 0x4024000000000000];
      [v11 UTF8String];
      __strlcpy_chk();
      qword_1E93E3018 = (uint64_t)&_background_job_worker_crashtracer_msg_buffer;
      qword_1E93E3048 = [v10 hash];
    }
    else
    {
      qword_1E93E3018 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_background_job_worker_crashtracer_lock);

    id v20 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v21 = *(void **)&v5[18]._os_unfair_lock_opaque;
      *(_DWORD *)buf = 138543362;
      v46 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_FAULT, "Worker %{public}@ had to be forcefully stopped by manually calling its completion handler. See Application Specific Information in generated crash report for more info.", buf, 0xCu);
    }
    int v9 = v36;
  }
  else
  {
    id v19 = *(void **)(a1 + 32);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_55;
    v43[3] = &unk_1E5875CE0;
    v44 = v19;
    [v44 performBlockAndWait:v43];
    id v20 = v44;
  }

  __int16 v22 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void **)&v5[18]._os_unfair_lock_opaque;
    uint64_t v24 = *(void *)&v5[14]._os_unfair_lock_opaque;
    int v25 = v24 - *(_DWORD *)(a1 + 56) + 1;
    uint64_t v26 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v46 = v23;
    __int16 v47 = 1024;
    *(_DWORD *)v48 = v25;
    *(_WORD *)&v48[4] = 2048;
    *(void *)&v48[6] = v24;
    *(_WORD *)&v48[14] = 2114;
    *(void *)&v48[16] = v26;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ worker processed object %d of %tu: %{public}@", buf, 0x26u);
  }

  if (!v3) {
    goto LABEL_29;
  }
  v27 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = *(void **)&v5[18]._os_unfair_lock_opaque;
    uint64_t v29 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v46 = v28;
    __int16 v47 = 2114;
    *(void *)v48 = v29;
    *(_WORD *)&v48[8] = 2114;
    *(void *)&v48[10] = v3;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "%{public}@ worker reports error after processing object %{public}@, error: %{public}@", buf, 0x20u);
  }

  if (PLIsErrorEqualToCode()) {
    goto LABEL_28;
  }
  if ((PLIsErrorEqualToCode() & 1) == 0 && !PLIsErrorEqualToCode())
  {
LABEL_29:
    char v32 = 0;
    goto LABEL_30;
  }
  atomic_store(1u, (unsigned __int8 *)&v5[17]._os_unfair_lock_opaque + 1);
  uint64_t v30 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(os_unfair_lock *)v5 workerDetailedName];
    *(_DWORD *)buf = 138412290;
    v46 = v31;
    _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "%@ setting _shouldDeferActivity to YES", buf, 0xCu);
  }
LABEL_28:
  char v32 = 1;
LABEL_30:
  os_unfair_lock_lock(v5 + 16);
  [*(id *)&v5[12]._os_unfair_lock_opaque removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(v5 + 16);
  v33 = *(void **)&v5[10]._os_unfair_lock_opaque;
  if (v33) {
    dispatch_block_cancel(v33);
  }
  if (v9)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_57;
    v40[3] = &unk_1E5874318;
    v40[4] = v5;
    id v41 = *(id *)(a1 + 32);
    char v42 = v32;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v40];
    id v34 = v41;
  }
  else
  {
    id v35 = +[PLConcurrencyLimiter sharedLimiter];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2_58;
    v37[3] = &unk_1E5874318;
    v37[4] = v5;
    id v38 = *(id *)(a1 + 32);
    char v39 = v32;
    [v35 async:v37 identifyingBlock:0 library:*(void *)(a1 + 32)];

    id v34 = v38;
  }

LABEL_36:
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWorkOnItem:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 48) completion:*(void *)(*(void *)(a1 + 32) + 16)];
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_55(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) managedObjectContext];
  [v1 reset];
  qos_class_t v2 = [v1 queryGenerationToken];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
    id v7 = 0;
    char v4 = [v1 setQueryGenerationFromToken:v3 error:&v7];
    id v5 = v7;

    if ((v4 & 1) == 0)
    {
      unint64_t v6 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v9 = v5;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to reset query generation from PLBackgroundJobWorker, error: %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextManagedObjectInLibrary:*(void *)(a1 + 40) continueRunning:*(unsigned char *)(a1 + 48) == 0 allowOutsideLimiter:1];
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextManagedObjectInLibrary:*(void *)(a1 + 40) continueRunning:*(unsigned char *)(a1 + 48) == 0 allowOutsideLimiter:0];
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3;
  v2[3] = &unk_1E5875E18;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v2];
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAllJobsCompleteInLibrary:*(void *)(a1 + 40) allowOutsideLimiter:0];
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAllJobsCompleteInLibrary:*(void *)(a1 + 40) allowOutsideLimiter:1];
}

- (BOOL)shouldDeferActivity
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldDeferActivity);
  return v2 & 1;
}

- (id)redactedDescription
{
  id v3 = NSString;
  workerName = self->_workerName;
  id v5 = [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
  [v5 wellKnownPhotoLibraryIdentifier];
  unint64_t v6 = PLStringFromWellKnownPhotoLibraryIdentifier();
  id v7 = [v3 stringWithFormat:@"%@:%@ - %tu", workerName, v6, -[NSMutableArray count](self->_pendingJobs, "count")];

  return v7;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ - %tu", self->_workerDetailedName, -[NSMutableArray count](self->_pendingJobs, "count")];
}

- (PLBackgroundJobWorker)initWithLibraryBundle:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBackgroundJobWorker;
  unint64_t v6 = [(PLBackgroundJobWorker *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    workerName = v7->_workerName;
    v7->_workerName = (NSString *)v9;

    id v11 = NSString;
    int v12 = v7->_workerName;
    id v13 = [(PLPhotoLibraryBundle *)v7->_libraryBundle pathManager];
    uint64_t v14 = [v13 libraryURL];
    uint32_t v15 = [v14 absoluteString];
    uint64_t v16 = [v11 stringWithFormat:@"%@-@-%@", v12, v15];
    workerDetailedName = v7->_workerDetailedName;
    v7->_workerDetailedName = (NSString *)v16;

    unint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingJobs = v7->_pendingJobs;
    v7->_pendingJobs = v18;

    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_BOOL shouldStop = 0;
  }

  return v7;
}

- (PLBackgroundJobWorker)init
{
  return 0;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  id v3 = a1;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (int64_t)availableDiskSpaceForVolumeURL:(id)a3
{
  id v9 = 0;
  int v3 = [a3 getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C810] error:0];
  id v4 = v9;
  id v5 = v4;
  if (!v3 || ((unint64_t v6 = [v4 unsignedLongLongValue], !(v6 >> 29)) ? (v7 = 1) : (v7 = 2), v6 >> 30)) {
    int64_t v7 = 3;
  }

  return v7;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 0;
}

+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork
{
  return 0;
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 0;
}

@end