@interface PLSearchIndexingIncrementalUpdateEngine
- (PLSearchIndexingIncrementalUpdateEngine)initWithDelegate:(id)a3;
- (PLSearchIndexingIncrementalUpdateEngineDelegate)delegate;
- (id)_inPerformBlock_batchFromType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5;
- (void)_donateBatch:(id)a3 library:(id)a4 completion:(id)a5;
- (void)_handleDonationCompleteWithResult:(id)a3 batch:(id)a4 library:(id)a5;
- (void)_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:(id)a3;
- (void)_processIncrementalUpdatesWithLibrary:(id)a3 completion:(id)a4;
- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4;
- (void)pause;
- (void)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)processJobObjectIDs:(id)a3 entity:(unint64_t)a4 library:(id)a5 completion:(id)a6;
- (void)resumeWithLibrary:(id)a3 completion:(id)a4;
@end

@implementation PLSearchIndexingIncrementalUpdateEngine

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_donationProgress, 0);
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PLSearchIndexingIncrementalUpdateEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSearchIndexingIncrementalUpdateEngineDelegate *)WeakRetained;
}

- (void)_donateBatch:(id)a3 library:(id)a4 completion:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(v8, "inPerformBlock_prepareDonationsWithLibrary:", v9);
  if ([v8 hasDonations])
  {
    v31 = v10;
    v11 = [v8 ineligibleIdentifiers];
    if ([v8 targetEntity] == 7)
    {

      v45 = &unk_1EEBEE418;
      v12 = [v8 ineligibleIdentifiers];
      v46[0] = v12;
      uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];

      v29 = 0;
    }
    else
    {
      v29 = v11;
      uint64_t v30 = 0;
    }
    v19 = (void *)MEMORY[0x1E4F28F90];
    v20 = [v8 eligibleManagedObjects];
    v21 = objc_msgSend(v19, "discreteProgressWithTotalUnitCount:", objc_msgSend(v20, "count"));

    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke;
    v42 = &unk_1E5875E18;
    v43 = self;
    id v44 = v21;
    id v18 = v21;
    PLSafeRunWithUnfairLock();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = [v8 eligibleManagedObjects];
    v24 = [v8 partialUpdateMasks];
    uint64_t v25 = [v8 targetEntity];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_2;
    v35[3] = &unk_1E5869990;
    v35[4] = self;
    id v36 = v8;
    id v37 = v9;
    id v10 = v31;
    id v38 = v31;
    id v26 = v9;
    id v27 = v8;
    v28 = self;
    id v14 = v29;
    id v13 = (id)v30;
    objc_msgSend(WeakRetained, "inLibraryPerform_donateForIncrementalUpdateEngine:managedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:", v28, v23, v24, v25, v29, v30, v26, v18, v35);
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_56;
    v32[3] = &unk_1E5875E18;
    id v33 = v8;
    id v34 = v9;
    id v13 = v9;
    id v14 = v8;
    [v13 performTransactionAndWait:v32];
    v15 = (void *)MEMORY[0x1E4F8B9B8];
    v16 = [MEMORY[0x1E4F1CA98] null];
    v17 = [v15 successWithResult:v16];

    (*((void (**)(id, void *))v10 + 2))(v10, v17);
    id v18 = v33;
  }
}

void __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke(uint64_t a1)
{
}

void __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailure])
  {
    v4 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v3 error];
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Donation failed with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _handleDonationCompleteWithResult:v3 batch:*(void *)(a1 + 40) library:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inPerformTransaction_cleanUpWithSuccess:library:", 1, *(void *)(a1 + 40));
}

- (id)_inPerformBlock_batchFromType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5
{
  uint64_t v6 = a3;
  id v7 = a5;
  PLBackgroundJobSearchIndexingEntitiesFromJobFlags(a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v8 count] && objc_msgSend(v8, "count") == 1)
  {
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if ((unint64_t)(v10 - 6) < 3) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 100;
    }
  }
  else
  {
    uint64_t v11 = 100;
  }

  v12 = [v7 managedObjectContext];

  id v13 = +[PLBackgroundJobWorkItem searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:v12 jobType:v6 jobFlags:a4 fetchLimit:v11];

  if ([v13 isSuccess])
  {
    id v14 = [PLSearchIndexingIncrementalUpdateBatch alloc];
    v15 = [v13 result];
    v16 = [(PLSearchIndexingIncrementalUpdateBatch *)v14 initWithWorkItems:v15 flags:a4];

    [MEMORY[0x1E4F8B9B8] successWithResult:v16];
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F8B9B8];
    v16 = [v13 error];
    [v17 failureWithError:v16];
  id v18 = };

  return v18;
}

- (void)_handleDonationCompleteWithResult:(id)a3 batch:(id)a4 library:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 isFailure]) {
    goto LABEL_7;
  }
  uint64_t v10 = [v7 error];
  uint64_t v11 = [v10 domain];
  if (([v11 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_7;
  }
  v12 = [v7 error];
  uint64_t v13 = [v12 code];

  if (v13 != 3072)
  {
LABEL_7:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__PLSearchIndexingIncrementalUpdateEngine__handleDonationCompleteWithResult_batch_library___block_invoke;
    v15[3] = &unk_1E5873A50;
    v16 = v7;
    id v17 = v8;
    id v18 = v9;
    [v18 performTransactionAndWait:v15];

    id v14 = v16;
    goto LABEL_8;
  }
  id v14 = PLSearchBackendIndexWorkerGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Search indexing was cancelled", buf, 2u);
  }
LABEL_8:
}

uint64_t __91__PLSearchIndexingIncrementalUpdateEngine__handleDonationCompleteWithResult_batch_library___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFailure])
  {
    v2 = PLSearchBackendIndexWorkerGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = [*(id *)(a1 + 32) error];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Donation failed with error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "inPerformTransaction_cleanUpWithSuccess:library:", objc_msgSend(*(id *)(a1 + 32), "isSuccess"), *(void *)(a1 + 48));
}

- (void)_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:(id)a3
{
  id v4 = a3;
  int v5 = [[PLTimedDispatchGroup alloc] initWithQueue:self->_queue name:@"Incrmeental donation"];
  uint64_t v6 = [(PLTimedDispatchGroup *)v5 enterWithName:@"Rebuild donation"];
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke;
  v14[3] = &unk_1E586B6B0;
  id v7 = v6;
  id v15 = v7;
  [(PLSearchIndexingIncrementalUpdateEngine *)self _processIncrementalUpdatesWithLibrary:v4 completion:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_2;
  v10[3] = &unk_1E5873A50;
  id v11 = v7;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v7;
  [(PLTimedDispatchGroup *)v5 notify:v10];
}

uint64_t __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) leaveWithResult:a2];
}

void __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__40128;
  v16 = __Block_byref_object_dispose__40129;
  id v17 = 0;
  if (([*(id *)(a1 + 32) wasCancelled] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) result];
    if ([v2 isFailure])
    {
      objc_storeStrong(v13 + 5, v2);
      id v3 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = [v2 error];
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Search indexing incremental updates failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      int v5 = [v2 result];
      BOOL v6 = [v5 unsignedIntegerValue] == 0;

      if (!v6)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v7 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Search indexing incremental updates completed", buf, 2u);
      }

      id v8 = (void *)MEMORY[0x1E4F8B9B8];
      id v9 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v10 = [v8 successWithResult:v9];

      id v3 = v13[5];
      v13[5] = (id)v10;
    }

    goto LABEL_10;
  }
LABEL_11:
  id v11 = *(id *)(a1 + 48);
  PLSafeRunWithUnfairLock();

  _Block_object_dispose(&v12, 8);
}

void __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_51(void *a1)
{
  v2 = (unsigned char *)a1[4];
  if (v2[21] && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v3 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Paused unbounded incremental update indexing", v9, 2u);
    }

    id v4 = (void *)MEMORY[0x1E4F8B9B8];
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    uint64_t v6 = [v4 failureWithError:v5];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v2 = (unsigned char *)a1[4];
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v2[20] = 0;
    objc_storeStrong((id *)(a1[4] + 32), *(id *)(*(void *)(a1[6] + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 24));
  }
  else
  {
    objc_msgSend(v2, "_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:", a1[5]);
  }
}

- (void)_processIncrementalUpdatesWithLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PLConcurrencyLimiter sharedLimiter];
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke;
  v12[3] = &unk_1E5874868;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v8 dispatchAsync:queue block:v12];
}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__40128;
  id v27 = __Block_byref_object_dispose__40129;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  __int16 v22 = 1;
  v2 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_42;
  v15[3] = &unk_1E5875A90;
  id v17 = &v23;
  id v16 = v2;
  id v18 = &v19;
  [v16 performBlockAndWait:v15];
  if (([(id)v24[5] isFailure] & 1) != 0
    || ([(id)v24[5] result],
        id v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = [v3 unsignedIntegerValue] == 0,
        v3,
        v4))
  {
    if ([(id)v24[5] isFailure])
    {
      id v10 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [(id)v24[5] error];
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch incremental update work items with error: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v5 = [(id)v24[5] result];
    id v6 = *(void **)(a1 + 40);
    __int16 v7 = *((_WORD *)v20 + 12);
    uint64_t v8 = [v5 integerValue];
    uint64_t v9 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_43;
    v12[3] = &unk_1E5869968;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = &v23;
    [v6 processBatchOfJobsWithType:v7 flags:v8 library:v9 progress:0 completion:v12];
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_42(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:v2 jobType:*(__int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) result];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
    id v11 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v8 = +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:v11 jobType:*(__int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 isSuccess];
  int v5 = PLSearchBackendIndexingEngineGetLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Finished processing batch of incremental updates", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 error];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to process batch of incremental updates with error: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pause
{
}

void __48__PLSearchIndexingIncrementalUpdateEngine_pause__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    v2 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Pausing unbounded incremental update indexing", v7, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 21) = 1;
    [*(id *)(*(void *)(a1 + 32) + 40) cancel];
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    [*(id *)(*(void *)(a1 + 32) + 48) cancel];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;
  }
}

- (void)resumeWithLibrary:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  PLSafeRunWithUnfairLock();
}

void __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    v2 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Resuming unbounded incremental update indexing", buf, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:", *(void *)(a1 + 40));
  }
  uint64_t v3 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  uint64_t v6 = *(void *)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_40;
  v7[3] = &unk_1E58742F0;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 48);
  [v3 groupNotify:v5 queue:v6 block:v7];
}

void __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_40(uint64_t a1)
{
  v2 = PLSafeResultWithUnfairLock();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (void)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke;
  v18[3] = &unk_1E586B660;
  signed __int16 v23 = a3;
  id v21 = v14;
  int64_t v22 = a4;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  [v17 performBlock:v18];
}

void __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_inPerformBlock_batchFromType:flags:library:", *(__int16 *)(a1 + 72), *(void *)(a1 + 64), *(void *)(a1 + 40));
  if ([v2 isSuccess])
  {
    uint64_t v3 = [v2 result];
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke_2;
    v6[3] = &unk_1E586B688;
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v4 _donateBatch:v3 library:v5 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + 1);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)processJobObjectIDs:(id)a3 entity:(unint64_t)a4 library:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke;
  v15[3] = &unk_1E58710F0;
  id v16 = v9;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [v13 performBlock:v15];
}

void __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLBackgroundJobWorkItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  uint64_t v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v17 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v17];
  id v8 = v17;

  if (v7)
  {
    id v9 = [PLSearchIndexingIncrementalUpdateBatch alloc];
    id v10 = [v7 firstObject];
    id v11 = -[PLSearchIndexingIncrementalUpdateBatch initWithWorkItems:flags:](v9, "initWithWorkItems:flags:", v7, [v10 jobFlags]);

    uint64_t v13 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke_2;
    v15[3] = &unk_1E586F0F0;
    id v16 = *(id *)(a1 + 56);
    [v12 _donateBatch:v11 library:v13 completion:v15];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    id v11 = [MEMORY[0x1E4F8B9B8] failureWithError:v8];
    (*(void (**)(uint64_t, PLSearchIndexingIncrementalUpdateBatch *))(v14 + 16))(v14, v11);
  }
}

uint64_t __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  v10[3] = &unk_1E5874868;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 performBlock:v10];
}

void __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLBackgroundJobWorkItem countOfSearchIndexWorkItemsInManagedObjectContext:v2];

  id v4 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
  v8[3] = &unk_1E5874868;
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  [v4 dispatchAsync:v6 block:v8];
}

uint64_t __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isSuccess])
  {
    v2 = [*(id *)(a1 + 32) result];
    [v2 unsignedIntegerValue];
  }
  else
  {
    uint64_t v3 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Error counting search background job work items: %@", buf, 0xCu);
    }
  }
  PLBoolResultWithUnfairLock();
  return (*(uint64_t (**)(double))(*(void *)(a1 + 48) + 16))(0.0);
}

BOOL __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_29(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  return !*(unsigned char *)(v1 + 20) || *(unsigned char *)(v1 + 21) != 0;
}

- (PLSearchIndexingIncrementalUpdateEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLSearchIndexingIncrementalUpdateEngine;
  uint64_t v5 = [(PLSearchIndexingIncrementalUpdateEngine *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = [v8 stringByAppendingString:@".searchIndexIncrementalUpdate"];
    uint64_t v10 = (const char *)[v9 UTF8String];
    qos_class_t v11 = qos_class_self();
    id v12 = dispatch_queue_attr_make_with_qos_class(0, v11, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v6->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v15 = dispatch_group_create();
    lock_group = v6->_lock_group;
    v6->_lock_group = (OS_dispatch_group *)v15;
  }
  return v6;
}

@end