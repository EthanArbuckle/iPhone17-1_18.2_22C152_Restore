@interface PLBackgroundJobSyndicationResourceSanitizationWorker
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)syndicationWorkerCriteria;
- (BOOL)isNetworkAccessAllowed;
- (PLBackgroundJobSyndicationResourceSanitizationWorker)initWithLibraryBundle:(id)a3;
- (id)downloadThrottlingDateForPrefetchManager:(id)a3;
- (id)requestLocalAvailabilityChangeForPrefetchManager:(id)a3 resource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)resourceIDsForPrefetchWithLibrary:(id)a3;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (unint64_t)batchSize;
- (void)batchRequestResourcesForPrefetchManager:(id)a3 itemIdentifiersWithBundleIDs:(id)a4 destURLs:(id)a5 options:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8;
- (void)performTransactionForPrefetchManager:(id)a3 synchronous:(BOOL)a4 block:(id)a5;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)prefetchManager:(id)a3 receivedNewDownloadThrottlingDate:(id)a4 managedObjectContext:(id)a5;
@end

@implementation PLBackgroundJobSyndicationResourceSanitizationWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLibrary, 0);
  objc_storeStrong((id *)&self->_prefetchManager, 0);
}

- (void)batchRequestResourcesForPrefetchManager:(id)a3 itemIdentifiersWithBundleIDs:(id)a4 destURLs:(id)a5 options:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8
{
}

- (id)requestLocalAvailabilityChangeForPrefetchManager:(id)a3 resource:(id)a4 options:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [v10 dataStore];
  v12 = [v11 requestLocalAvailabilityChange:1 forResource:v10 options:v9 completion:v8];

  return v12;
}

- (void)performTransactionForPrefetchManager:(id)a3 synchronous:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = v7;
  currentLibrary = self->_currentLibrary;
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke;
    v13[3] = &unk_1E58742F0;
    id v10 = &v14;
    v13[4] = self;
    id v14 = v7;
    [(PLPhotoLibrary *)currentLibrary performTransactionAndWait:v13];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke_2;
    v11[3] = &unk_1E58742F0;
    id v10 = &v12;
    v11[4] = self;
    id v12 = v7;
    [(PLPhotoLibrary *)currentLibrary performTransaction:v11];
  }
}

void __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) managedObjectContext];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) managedObjectContext];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)prefetchManager:(id)a3 receivedNewDownloadThrottlingDate:(id)a4 managedObjectContext:(id)a5
{
}

- (id)downloadThrottlingDateForPrefetchManager:(id)a3
{
  v3 = [(PLPhotoLibrary *)self->_currentLibrary globalValues];
  v4 = [v3 syndicationPrefetchDownloadThrottlingDate];

  return v4;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![(PLBackgroundJobSyndicationResourceSanitizationWorker *)self batchSize])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLBackgroundJobSyndicationResourceSanitizationWorker.m", 97, @"Invalid parameter not satisfying: %@", @"self.batchSize > 0" object file lineNumber description];
  }
  if ([(PLBackgroundJobWorker *)self hasEnoughDiskSpaceToContinue:v11])
  {
    objc_storeStrong((id *)&self->_currentLibrary, a4);
    if ([(PLBackgroundJobSyndicationResourceSanitizationWorker *)self batchSize] == 1)
    {
      prefetchManager = self->_prefetchManager;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke;
      v20[3] = &unk_1E58734E8;
      v20[4] = self;
      id v21 = v11;
      [(PLSyndicationResourcePrefetchEngine *)prefetchManager prefetchResourceWithObjectID:v9 completion:v20];
    }
    else
    {
      id v13 = v9;
      id v14 = PLSyndicationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(PLBackgroundJobWorker *)self workerName];
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = [v13 count];
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[resource.sync] %@ prefetching %lu items", buf, 0x16u);
      }
      v16 = self->_prefetchManager;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke_40;
      v18[3] = &unk_1E58734E8;
      v18[4] = self;
      id v19 = v11;
      [(PLSyndicationResourcePrefetchEngine *)v16 prefetchResourceWithObjectIDs:v13 completion:v18];
    }
  }
}

void __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = 0;
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLSyndicationGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) workerName];
      int v13 = 138543618;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      id v7 = "[resource.sync] %{public}@ prefetch failed with error: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v13, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) workerName];
    int v13 = 138543362;
    id v14 = v6;
    id v7 = "[resource.sync] %{public}@ prefetch batch finished";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v11, v12);
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(PLBackgroundJobSyndicationResourceSanitizationWorker *)self batchSize])
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLBackgroundJobSyndicationResourceSanitizationWorker.m", 66, @"Invalid parameter not satisfying: %@", @"self.batchSize > 0" object file lineNumber description];
  }
  uint64_t v26 = [(id)objc_opt_class() syndicationWorkerCriteria];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__55882;
  v38 = __Block_byref_object_dispose__55883;
  id v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __92__PLBackgroundJobSyndicationResourceSanitizationWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v31[3] = &unk_1E5875340;
  v33 = &v34;
  v31[4] = self;
  id v6 = v5;
  id v32 = v6;
  [v6 performBlockAndWait:v31];
  if ([(PLBackgroundJobSyndicationResourceSanitizationWorker *)self batchSize] == 1)
  {
    id v7 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(id)v35[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[resource.sync]: %tu work items need processing", buf, 0xCu);
    }

    os_log_type_t v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    uint32_t v10 = [(PLBackgroundJobWorkerPendingWorkItems *)v9 initWithCriteria:v26 workItemsNeedingProcessing:v35[5]];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v11 addObject:v12];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = (id)v35[5];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          [v12 addObject:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          uint64_t v17 = [v12 count];
          if (v17 == [(PLBackgroundJobSyndicationResourceSanitizationWorker *)self batchSize])
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            [v11 addObject:v18];
            id v12 = v18;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v44 count:16];
      }
      while (v14);
    }

    if (![v12 count]) {
      [v11 removeLastObject];
    }
    id v19 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v11 count];
      uint64_t v21 = [(id)v35[5] count];
      *(_DWORD *)buf = 134218240;
      uint64_t v41 = v20;
      __int16 v42 = 2048;
      uint64_t v43 = v21;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[resource.sync]: %tu / %tu work items need processing", buf, 0x16u);
    }

    v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v23 = (void *)[v11 copy];
    uint32_t v10 = [(PLBackgroundJobWorkerPendingWorkItems *)v22 initWithCriteria:v26 workItemsNeedingProcessing:v23];
  }
  _Block_object_dispose(&v34, 8);

  return v10;
}

void __92__PLBackgroundJobSyndicationResourceSanitizationWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceIDsForPrefetchWithLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (PLBackgroundJobSyndicationResourceSanitizationWorker)initWithLibraryBundle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLBackgroundJobSyndicationResourceSanitizationWorker;
  uint64_t v3 = [(PLBackgroundJobWorker *)&v7 initWithLibraryBundle:a3];
  if (v3)
  {
    v4 = [[PLSyndicationResourcePrefetchEngine alloc] initWithDelegate:v3];
    prefetchManager = v3->_prefetchManager;
    v3->_prefetchManager = v4;
  }
  return v3;
}

- (id)resourceIDsForPrefetchWithLibrary:(id)a3
{
  prefetchManager = self->_prefetchManager;
  v4 = [a3 managedObjectContext];
  id v5 = [(PLSyndicationResourcePrefetchEngine *)prefetchManager highPriorityResourcesForPrefetchWithManagedObjectContext:v4];

  return v5;
}

- (unint64_t)batchSize
{
  return 1;
}

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

+ (id)syndicationWorkerCriteria
{
  return +[PLBackgroundJobCriteria criteriaForHubbleWorker];
}

@end