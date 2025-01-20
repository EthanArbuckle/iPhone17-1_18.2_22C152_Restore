@interface PLBackgroundJobEditRenderingWorker
+ (BOOL)allowWorkerToRunDuringCPLInitialSync;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)workerWithLibrary:(id)a3;
- (BOOL)isInterruptible;
- (id)_predicateToFetchDeferredAdjustmentNeededAssets;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)dealloc;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobEditRenderingWorker

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

+ (id)workerWithLibrary:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
}

- (void)stopWorkingOnItem:(id)a3
{
}

- (BOOL)isInterruptible
{
  progressForCurrentAsset = self->_progressForCurrentAsset;
  if (!progressForCurrentAsset)
  {
    v3 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Returning NO from isInterruptible because there is no current progress instance", v5, 2u);
    }
  }
  return progressForCurrentAsset != 0;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__83278;
  v25[4] = __Block_byref_object_dispose__83279;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v18[3] = &unk_1E5870370;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = self;
  v23 = v27;
  id v22 = v10;
  v24 = v25;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_51;
  v14[3] = &unk_1E5873410;
  v16 = v27;
  id v13 = v22;
  id v15 = v13;
  v17 = v25;
  [v12 performTransaction:v18 completionHandler:v14];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v31 = 0;
  id v4 = [v3 existingObjectWithID:v2 error:&v31];
  id v5 = v31;
  id v6 = v31;

  if (!v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
    v18 = PLBackgroundJobServiceGetLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412546;
    id v33 = v2;
    __int16 v34 = 2112;
    id v35 = v6;
    v25 = "Failed to find existingObjectWithID: %@ %@";
    id v26 = v18;
    uint32_t v27 = 22;
LABEL_12:
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_13;
  }
  v7 = [*(id *)(a1 + 48) _predicateToFetchDeferredAdjustmentNeededAssets];
  int v8 = [v7 evaluateWithObject:v4];

  if (!v8)
  {
    v18 = PLBackgroundJobServiceGetLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412290;
    id v33 = v2;
    v25 = "Skipped edit processing for objectID %@, predicate no longer matches";
    id v26 = v18;
    uint32_t v27 = 12;
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (!*(void *)(v9 + 104))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F74898]);
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(void **)(v11 + 104);
    *(void *)(v11 + 104) = v10;

    uint64_t v9 = *(void *)(a1 + 48);
  }
  if (!*(void *)(v9 + 112))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F748E0]);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = *(void **)(v14 + 112);
    *(void *)(v14 + 112) = v13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  v16 = NSString;
  id v17 = v4;
  v18 = [v16 stringWithFormat:@"Background deferred adjustment generation for object ID %@", v2];
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(v19 + 104);
  uint64_t v21 = *(void *)(v19 + 112);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
  v28[3] = &unk_1E5875C20;
  v28[4] = v19;
  id v30 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 40);
  uint64_t v22 = [v17 generateDeferredAdjustmentWithImageConversionClient:v20 videoConversionClient:v21 reason:v18 allowCancellationByService:0 completion:v28];

  uint64_t v23 = *(void *)(a1 + 48);
  v24 = *(void **)(v23 + 120);
  *(void *)(v23 + 120) = v22;

LABEL_13:
}

void *__77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_51(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    return (void *)(*(uint64_t (**)(void, void))(result[4] + 16))(result[4], *(void *)(*(void *)(result[6] + 8) + 40));
  }
  return result;
}

void __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83278;
  id v17 = __Block_byref_object_dispose__83279;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PLBackgroundJobEditRenderingWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v10[3] = &unk_1E5875340;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v6 performBlockAndWait:v10];
  v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  int v8 = [(PLBackgroundJobWorkerPendingWorkItems *)v7 initWithCriteria:v5 workItemsNeedingProcessing:v14[5]];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__PLBackgroundJobEditRenderingWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) _predicateToFetchDeferredAdjustmentNeededAssets];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:100];
  [v4 setResultType:1];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  v7 = [v6 executeFetchRequest:v4 error:&v12];
  id v8 = v12;

  if (v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v7;
    id v11 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v11 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch deferred adjustment processing needed: %@", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(PAVideoConversionServiceClient *)self->_videoConversionServiceClient invalidateAfterPendingRequestCompletion];
  v3.receiver = self;
  v3.super_class = (Class)PLBackgroundJobEditRenderingWorker;
  [(PLBackgroundJobEditRenderingWorker *)&v3 dealloc];
}

- (id)_predicateToFetchDeferredAdjustmentNeededAssets
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end