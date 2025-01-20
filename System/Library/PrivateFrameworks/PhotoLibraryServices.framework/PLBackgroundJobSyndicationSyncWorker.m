@interface PLBackgroundJobSyndicationSyncWorker
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
- (BOOL)_hasPendingAttachmentJobsInLibrary:(id)a3;
- (BOOL)_hasPendingChatJobsInLibrary:(id)a3;
- (BOOL)_hasPendingDeleteJobsInLibrary:(id)a3;
- (BOOL)_hasPendingJobsBasedOnLastSyncDate:(id)a3;
- (BOOL)_needsSyndicationFullIndexSyncInLibrary:(id)a3;
- (BOOL)_supportsSyndicationQueryType:(int64_t)a3;
- (BOOL)isInterruptible;
- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4;
- (PLBackgroundJobSyndicationSyncWorker)initWithLibraryBundle:(id)a3;
- (id)_syndicationStartingDateInLibrary:(id)a3;
- (id)_workItemsBatchedFromDate:(id)a3 library:(id)a4 type:(int64_t)a5;
- (id)photoLibraryWithDatabaseContext:(id)a3;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8;
- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
- (void)workerDidFinishWithDatabaseContext:(id)a3;
@end

@implementation PLBackgroundJobSyndicationSyncWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseContext, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_currentWorkItem, 0);
  objc_storeStrong((id *)&self->_supportedQueryTypes, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4
{
  v4 = objc_msgSend(a4, "libraryServicesManager", a3);
  v5 = [v4 databaseContext];
  v6 = [v5 syndicationIngestMutex];
  char v7 = [v6 shouldStopUsingSyndicationIngestLibraryWithIdentifier:1];

  return v7 ^ 1;
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  id v14 = a8;
  v15 = PLSyndicationSyncQueryWithDates(a5, a6, a4);
  if (v15)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke;
    v22[3] = &unk_1E5869050;
    v22[4] = self;
    id v23 = v13;
    [v15 setFoundItemsHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke_66;
    v20[3] = &unk_1E5874D70;
    id v21 = v14;
    [v15 setCompletionHandler:v20];
    [v15 start];
    os_unfair_lock_lock(&self->_lock);
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_lock);
      [v15 cancel];
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQuery, v15);
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    v16 = PLSyndicationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 - 1) > 3) {
        v17 = 0;
      }
      else {
        v17 = off_1E5867FF0[a4 - 1];
      }
      v18 = v17;
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "[sync] no valid spotlight search query for query type: %{public}@", buf, 0xCu);
    }
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v19);
  }
}

void __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLSyndicationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134349056;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found %{public}lu items, batch processing", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 124);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 120));
  if (!v6)
  {
    LOBYTE(v7) = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if ((_BYTE)v7) {
      [*(id *)(a1 + 32) stopWorkingOnItem:*(void *)(*(void *)(a1 + 32) + 128)];
    }
  }
}

uint64_t __121__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_batchHandler_completionHandler___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = PLSyndicationSyncQueryWithDates(v15, v16, a4);
  if (v19)
  {
    objc_initWeak(location, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke;
    v29[3] = &unk_1E5869028;
    objc_copyWeak(&v31, location);
    v29[4] = self;
    id v30 = v17;
    [v19 setFoundItemsHandler:v29];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke_64;
    v27 = &unk_1E5874D70;
    id v28 = v18;
    [v19 setCompletionHandler:&v24];
    objc_msgSend(v19, "start", v24, v25, v26, v27);
    os_unfair_lock_lock(&self->_lock);
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_lock);
      [v19 cancel];
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQuery, v19);
      os_unfair_lock_unlock(&self->_lock);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  else
  {
    v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)(a4 - 1) > 3) {
        id v21 = 0;
      }
      else {
        id v21 = off_1E5867FF0[a4 - 1];
      }
      v22 = v21;
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v22;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[sync] no valid spotlight search query for query type: %{public}@", (uint8_t *)location, 0xCu);
    }
    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
    (*((void (**)(id, void *))v18 + 2))(v18, v23);
  }
}

void __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = PLSyndicationGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = [v3 count];
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found %lu items", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = v3;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v14 = v3;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = (void *)MEMORY[0x19F38D3B0]();
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
          uint64_t v12 = *(void *)(a1 + 32);
          int v13 = *(unsigned __int8 *)(v12 + 124);
          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 120));
          if (v13) {
            goto LABEL_17;
          }
          buf[0] = 0;
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          if (buf[0])
          {
            [WeakRetained stopWorkingOnItem:*(void *)(*(void *)(a1 + 32) + 128)];
LABEL_17:
            goto LABEL_18;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_18:
      id v3 = v14;
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[sync] spotlight search query found stuff but worker is already gone", buf, 2u);
  }
}

uint64_t __120__PLBackgroundJobSyndicationSyncWorker_executeQueryForSyncManager_type_startDate_endDate_itemHandler_completionHandler___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)workerDidFinishWithDatabaseContext:(id)a3
{
  uint64_t v5 = (PLDatabaseContext *)a3;
  BOOL v6 = v5;
  databaseContext = self->_databaseContext;
  if (databaseContext)
  {
    if (databaseContext != v5)
    {
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PLBackgroundJobSyndicationSyncWorker.m", 331, @"Invalid parameter not satisfying: %@", @"_databaseContext == databaseContext" object file lineNumber description];
    }
    uint64_t v8 = [(PLDatabaseContext *)v6 syndicationIngestMutex];
    [v8 stopUsingSyndicationIngestLibraryWithIdentifier:1];

    uint64_t v9 = self->_databaseContext;
    self->_databaseContext = 0;

    v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      v11 = "[sync.worker] (MUTEX) stopped using syndication ingest library";
      uint64_t v12 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
    }
  }
  else
  {
    v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "[sync.worker] (MUTEX) finished without having a library (no-op)";
      uint64_t v12 = buf;
      goto LABEL_8;
    }
  }
}

- (id)photoLibraryWithDatabaseContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 syndicationIngestMutex];
  uint64_t v8 = [v7 tryUsingSyndicationIngestLibraryWithIdentifier:1];

  if (v8)
  {
    if (self->_databaseContext)
    {
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PLBackgroundJobSyndicationSyncWorker.m", 321, @"Invalid parameter not satisfying: %@", @"_databaseContext == nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_databaseContext, a3);
  }
  else
  {
    uint64_t v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v6 syndicationIngestMutex];
      v11 = [v10 syndicationIngestMutexStateDescription];
      *(_DWORD *)buf = 138412290;
      __int16 v15 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[sync.worker] (MUTEX) not allowed to run right now: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (void)stopWorkingOnItem:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentQuery = self->_currentQuery;
  if (self->_currentWorkItem) {
    self->_cancelled = 1;
  }
  id v6 = currentQuery;
  os_unfair_lock_unlock(p_lock);
  [(CSSearchQuery *)v6 cancel];
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(PLBackgroundJobWorker *)self hasEnoughDiskSpaceToContinue:v11])
  {
    uint64_t v12 = [v9 objectForKeyedSubscript:@"QueryType"];
    if (v12)
    {
      int v13 = (void *)v12;
      uint64_t v14 = [v9 objectForKeyedSubscript:@"StartDate"];
      if (v14)
      {
        __int16 v15 = (void *)v14;
        uint64_t v16 = [v9 objectForKeyedSubscript:@"EndDate"];

        if (v16)
        {
          os_unfair_lock_lock(&self->_lock);
          objc_storeStrong((id *)&self->_currentWorkItem, a3);
          os_unfair_lock_unlock(&self->_lock);
          syncManager = self->_syncManager;
          long long v18 = [v9 objectForKeyedSubscript:@"StartDate"];
          v19 = [v9 objectForKeyedSubscript:@"EndDate"];
          v20 = [v9 objectForKeyedSubscript:@"QueryType"];
          uint64_t v21 = [v20 integerValue];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __79__PLBackgroundJobSyndicationSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke;
          v28[3] = &unk_1E5874950;
          v28[4] = self;
          id v29 = v11;
          [(PLSyndicationSyncEngine *)syncManager syncSyndicationItemsWithStartDate:v18 endDate:v19 queryType:v21 library:v10 completion:v28];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v22 = PLSyndicationGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = [(PLBackgroundJobWorker *)self workerName];
      *(_DWORD *)buf = 138543618;
      v33 = v23;
      __int16 v34 = 2114;
      id v35 = v9;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ invalid work item: %{public}@", buf, 0x16u);
    }
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    id v31 = @"Invalid work item";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v27 = [v24 errorWithDomain:v25 code:46309 userInfo:v26];
    (*((void (**)(id, void *))v11 + 2))(v11, v27);
  }
LABEL_10:
}

void __79__PLBackgroundJobSyndicationSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 120);
  id v9 = a3;
  os_unfair_lock_lock(v4);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 136);
  *(void *)(v7 + 136) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 124) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _needsSyndicationFullIndexSyncInLibrary:v4])
  {
    id v6 = PLSyndicationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[sync.worker] requires full index reset sync", buf, 2u);
    }

    uint64_t v7 = [v4 globalValues];
    uint64_t v8 = [v7 inProgressFullIndexSyndicationSyncDate];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(PLBackgroundJobSyndicationSyncWorker *)self _syndicationStartingDateInLibrary:v4];
    }
    id v11 = v10;

    uint64_t v12 = [(PLBackgroundJobSyndicationSyncWorker *)self _workItemsBatchedFromDate:v11 library:v4 type:4];
    [v5 addObjectsFromArray:v12];
  }
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingDeleteJobsInLibrary:v4])
  {
    int v13 = PLSyndicationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "[sync.worker] has delete jobs", v40, 2u);
    }

    uint64_t v14 = [v4 globalValues];
    __int16 v15 = [v14 lastDeleteSyndicationSyncDate];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
    }
    long long v18 = v17;

    v19 = [(PLBackgroundJobSyndicationSyncWorker *)self _workItemsBatchedFromDate:v18 library:v4 type:3];
    [v5 addObjectsFromArray:v19];
  }
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingAttachmentJobsInLibrary:v4])
  {
    v20 = PLSyndicationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "[sync.worker] has attachment jobs", v39, 2u);
    }

    uint64_t v21 = [v4 globalValues];
    uint64_t v22 = [v21 lastAttachmentSyndicationSyncDate];
    id v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [(PLBackgroundJobSyndicationSyncWorker *)self _syndicationStartingDateInLibrary:v4];
    }
    uint64_t v25 = v24;

    uint64_t v26 = [(PLBackgroundJobSyndicationSyncWorker *)self _workItemsBatchedFromDate:v25 library:v4 type:1];
    [v5 addObjectsFromArray:v26];
  }
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingChatJobsInLibrary:v4])
  {
    v27 = PLSyndicationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "[sync.worker] has chat jobs", v38, 2u);
    }

    id v28 = [v4 globalValues];
    id v29 = [v28 lastChatSyndicationSyncDate];
    uint64_t v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = [(PLBackgroundJobSyndicationSyncWorker *)self _syndicationStartingDateInLibrary:v4];
    }
    v32 = v31;

    v33 = [(PLBackgroundJobSyndicationSyncWorker *)self _workItemsBatchedFromDate:v32 library:v4 type:2];
    [v5 addObjectsFromArray:v33];
  }
  __int16 v34 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  id v35 = +[PLBackgroundJobCriteria criteriaForHubbleWorker];
  uint64_t v36 = [(PLBackgroundJobWorkerPendingWorkItems *)v34 initWithCriteria:v35 workItemsNeedingProcessing:v5];

  return v36;
}

- (id)_syndicationStartingDateInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 globalValues];
  id v6 = [v5 syndicationStartDate];

  if (!v6)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__36003;
    id v24 = __Block_byref_object_dispose__36004;
    id v25 = 0;
    uint64_t v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PLBackgroundJobSyndicationSyncWorker__syndicationStartingDateInLibrary___block_invoke;
    v17[3] = &unk_1E5869000;
    v17[4] = self;
    v19 = &v20;
    uint64_t v8 = v7;
    long long v18 = v8;
    +[PLSyndicationSyncEngine findStartDateForMessagesSpotlightItemsWithCompletionHandler:v17];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v8, v9))
    {
      id v10 = PLSyndicationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "[sync.worker] failed to find syndication start date, timed out", v16, 2u);
      }
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    uint64_t v12 = (void *)v21[5];
    if (v12)
    {
      id v13 = v12;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    }
    id v6 = v13;
    os_unfair_lock_unlock(p_lock);
    uint64_t v14 = [v4 globalValues];
    [v14 setSyndicationStartDate:v6];

    _Block_object_dispose(&v20, 8);
  }

  return v6;
}

void __74__PLBackgroundJobSyndicationSyncWorker__syndicationStartingDateInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
    uint64_t v8 = PLSyndicationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v6;
      dispatch_time_t v9 = "[sync.worker] found syndication start date: %@";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = PLSyndicationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v7;
      dispatch_time_t v9 = "[sync.worker] failed to find syndication start date, error: %@";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_workItemsBatchedFromDate:(id)a3 library:(id)a4 type:(int64_t)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 timeIntervalSinceReferenceDate];
  if (v9 <= 0.0)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];

    id v7 = (id)v10;
  }
  os_log_type_t v11 = [v8 globalValues];
  [v11 syndicationSyncRangeDenominator];
  double v13 = v12;

  +[PLSyndicationSyncEngine maxSpotlightQueryTimeInterval];
  double v15 = v14 / v13;
  +[PLSyndicationSyncEngine maxSpotlightQueryTimeInterval];
  if (v15 >= v16) {
    double v15 = v16;
  }
  +[PLSyndicationSyncEngine minSpotlightQueryTimeInterval];
  if (v15 < v17) {
    double v15 = v17;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = v7;
  [v19 timeIntervalSinceNow];
  uint64_t v26 = v19;
  if (v20 <= 0.0)
  {
    uint64_t v21 = v19;
    while ((unint64_t)[v18 count] <= 0x3E7)
    {
      id v19 = [v21 dateByAddingTimeInterval:v15];
      v27[0] = @"QueryType";
      uint64_t v22 = [NSNumber numberWithInteger:a5];
      v28[0] = v22;
      v28[1] = v21;
      v27[1] = @"StartDate";
      v27[2] = @"EndDate";
      v28[2] = v19;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
      [v18 addObject:v23];

      [v19 timeIntervalSinceNow];
      uint64_t v21 = v19;
      if (v24 > 0.0) {
        goto LABEL_13;
      }
    }
    id v19 = v21;
  }
LABEL_13:

  return v18;
}

- (BOOL)_needsSyndicationFullIndexSyncInLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 libraryServicesManager];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 == 3)
  {
    id v6 = [v3 globalValues];
    id v7 = [v6 inProgressFullIndexSyndicationSyncDate];

    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      double v9 = [v3 globalValues];
      uint64_t v10 = [v9 lastDeleteSyndicationSyncDate];

      if (v10)
      {
        os_log_type_t v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:v10];
        double v13 = v12;
        double v14 = [v3 globalValues];
        double v15 = [v14 lastFullIndexSyndicationSyncStartDate];

        if (v15)
        {
          [v11 timeIntervalSinceDate:v15];
          if (v13 >= v16) {
            double v13 = v16;
          }
        }
        BOOL v8 = v13 > 1209600.0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_hasPendingDeleteJobsInLibrary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _supportsSyndicationQueryType:3])
  {
    uint64_t v5 = [v4 globalValues];
    id v6 = [v5 lastDeleteSyndicationSyncDate];

    [v6 timeIntervalSinceNow];
    double v8 = v7;
    if (![(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingJobsBasedOnLastSyncDate:v6])
    {
      if (v8 >= -604800.0)
      {
        BOOL v11 = 0;
        goto LABEL_10;
      }
      double v9 = PLSyndicationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(PLBackgroundJobWorker *)self workerName];
        int v13 = 138412546;
        double v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = 7;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[sync.delete] %@ has pending delete sync since it has been over %ld days since the previous delete sync", (uint8_t *)&v13, 0x16u);
      }
    }
    BOOL v11 = 1;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_hasPendingChatJobsInLibrary:(id)a3
{
  id v4 = a3;
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _supportsSyndicationQueryType:2])
  {
    uint64_t v5 = [v4 globalValues];
    id v6 = [v5 lastChatSyndicationSyncDate];

    BOOL v7 = [(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingJobsBasedOnLastSyncDate:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_hasPendingAttachmentJobsInLibrary:(id)a3
{
  id v4 = a3;
  if ([(PLBackgroundJobSyndicationSyncWorker *)self _supportsSyndicationQueryType:1])
  {
    uint64_t v5 = [v4 globalValues];
    id v6 = [v5 lastAttachmentSyndicationSyncDate];

    BOOL v7 = [(PLBackgroundJobSyndicationSyncWorker *)self _hasPendingJobsBasedOnLastSyncDate:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_hasPendingJobsBasedOnLastSyncDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = [v4 objectForKey:@"PLSyndicationLastUpdateDate"];

    if (v5) {
      BOOL v6 = [v3 compare:v5] != 1;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_supportsSyndicationQueryType:(int64_t)a3
{
  supportedQueryTypes = self->_supportedQueryTypes;
  id v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(supportedQueryTypes) = [(NSSet *)supportedQueryTypes containsObject:v4];

  return (char)supportedQueryTypes;
}

- (PLBackgroundJobSyndicationSyncWorker)initWithLibraryBundle:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBackgroundJobSyndicationSyncWorker;
  uint64_t v5 = [(PLBackgroundJobWorker *)&v21 initWithLibraryBundle:v4];
  BOOL v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __62__PLBackgroundJobSyndicationSyncWorker_initWithLibraryBundle___block_invoke;
    id v18 = &unk_1E5868FD0;
    id v8 = v4;
    id v19 = v8;
    id v9 = v7;
    id v20 = v9;
    for (uint64_t i = 1; i != 5; ++i)
      v17((uint64_t)&v15, i);
    objc_storeStrong((id *)&v6->_supportedQueryTypes, v7);
    if (objc_msgSend(v8, "isSystemPhotoLibrary", v15, v16)) {
      uint64_t v11 = [MEMORY[0x1E4F8BA10] maskForSyndicationSyncWorkerInSystemPhotoLibrary];
    }
    else {
      uint64_t v11 = [MEMORY[0x1E4F8BA10] maskForSyndicationSyncWorkerInSyndicationLibrary];
    }
    double v12 = [[PLSyndicationSyncEngine alloc] initWithQueryTypes:v6->_supportedQueryTypes savedAssetTypeMask:v11 delegate:v6];
    syncManager = v6->_syncManager;
    v6->_syncManager = v12;
  }
  return v6;
}

void __62__PLBackgroundJobSyndicationSyncWorker_initWithLibraryBundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  if ((unint64_t)(a2 - 1) < 2 || a2 == 4)
  {
    id v7 = v4;
    char v5 = [v4 isSystemPhotoLibrary];

    if (v5) {
      return;
    }
    goto LABEL_6;
  }
  if (a2 == 3)
  {

LABEL_6:
    BOOL v6 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithInteger:a2];
    [v6 addObject:v8];
    id v4 = v8;
  }
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  if ((a3 | 2) != 3) {
    return 0;
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  if (PLSyndicationRuntimeEnabled()) {
    return 1;
  }
  BOOL v6 = PLSyndicationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Syndication Sync Worker is disabled via internal user defaults", v7, 2u);
  }

  return 0;
}

@end