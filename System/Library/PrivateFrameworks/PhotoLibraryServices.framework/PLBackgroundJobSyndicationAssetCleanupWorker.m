@interface PLBackgroundJobSyndicationAssetCleanupWorker
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
- (BOOL)isInterruptible;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
@end

@implementation PLBackgroundJobSyndicationAssetCleanupWorker

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__52911;
  v22 = __Block_byref_object_dispose__52912;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PLBackgroundJobSyndicationAssetCleanupWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v13[3] = &unk_1E5875368;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  v16 = self;
  v17 = &v18;
  id v15 = v12;
  [v11 performTransactionAndWait:v13];
  v10[2](v10, v19[5]);

  _Block_object_dispose(&v18, 8);
}

void __87__PLBackgroundJobSyndicationAssetCleanupWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v2 existingObjectWithID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (v5)
  {
    v6 = PLSyndicationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 48) workerName];
      id v8 = [v5 uuid];
      id v9 = [v5 additionalAttributes];
      v10 = [v9 syndicationIdentifier];
      *(_DWORD *)buf = 138543874;
      v17 = v7;
      __int16 v18 = 2114;
      v19 = v8;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[sync.worker] %{public}@ deleting asset not found in last full index, uuid: %{public}@, syndicationID: %{public}@", buf, 0x20u);
    }
    id v11 = [*(id *)(a1 + 32) managedObjectContext];
    [v11 deleteObject:v5];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_6;
    }
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [*(id *)(a1 + 48) workerName];
      v13 = *(void **)(a1 + 40);
      id v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ failed to fetch asset for object ID: %{public}@ with error: %@", buf, 0x20u);
    }
  }

LABEL_6:
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PLBackgroundJobCriteria criteriaForHubbleWorker];
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__52911;
  id v23 = __Block_byref_object_dispose__52912;
  id v24 = 0;
  v6 = [v4 globalValues];
  v7 = [v6 lastFullIndexSyndicationSyncStartDate];

  if (v7)
  {
    id v8 = PLSyndicationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(PLBackgroundJobWorker *)self workerName];
      [v7 timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2048;
      uint64_t v30 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[sync.worker] %{public}@ searching for assets that have not been updated since last full index on date: %@ (%f)", buf, 0x20u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__PLBackgroundJobSyndicationAssetCleanupWorker_workItemsNeedingProcessingInLibrary___block_invoke;
    v14[3] = &unk_1E5875368;
    id v15 = v7;
    __int16 v18 = &v19;
    id v16 = v4;
    v17 = self;
    [v16 performBlockAndWait:v14];
  }
  id v11 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  id v12 = [(PLBackgroundJobWorkerPendingWorkItems *)v11 initWithCriteria:v5 workItemsNeedingProcessing:v20[5]];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __84__PLBackgroundJobSyndicationAssetCleanupWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K < %@", @"additionalAttributes", @"lastUploadAttemptDate", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  [v4 setResultType:1];
  [v4 setFetchLimit:100];
  v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v13 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v13];
  id v8 = v13;
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [*(id *)(a1 + 48) workerName];
      *(_DWORD *)buf = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ failed to fetch work items with error: %@", buf, 0x16u);
    }
  }
}

@end