@interface PLBackgroundJobDeferredRenderDerivativesBaseWorker
+ (BOOL)allowWorkerToRunDuringCPLInitialSync;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)_criteriaToUse;
- (BOOL)isInterruptible;
- (NSSet)deferredProcessingStatesHandled;
- (id)_predicateToFetchDeferredAssets;
- (id)imageConversionClient;
- (id)taskIdentifier;
- (id)videoConversionClient;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobDeferredRenderDerivativesBaseWorker

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

+ (id)_criteriaToUse
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionClient, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
}

- (void)stopWorkingOnItem:(id)a3
{
}

- (BOOL)isInterruptible
{
  return 1;
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
  v25[3] = __Block_byref_object_copy__10591;
  v25[4] = __Block_byref_object_dispose__10592;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v18[3] = &unk_1E5870370;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = self;
  v23 = v27;
  v24 = v25;
  id v22 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_73;
  v14[3] = &unk_1E5873410;
  v16 = v27;
  id v13 = v22;
  id v15 = v13;
  v17 = v25;
  [v12 performTransaction:v18 completionHandler:v14];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v27 = 0;
  v4 = [v3 existingObjectWithID:v2 error:&v27];
  id v5 = v27;
  id v6 = v27;

  if (v4)
  {
    id v7 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = [*(id *)(a1 + 48) taskIdentifier];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F74960]];

    id v10 = [*(id *)(a1 + 48) imageConversionClient];
    id v11 = [*(id *)(a1 + 48) videoConversionClient];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_70;
    v21[3] = &unk_1E5864428;
    id v12 = v7;
    uint64_t v26 = *(void *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    id v22 = v12;
    uint64_t v23 = v13;
    id v25 = v14;
    id v24 = *(id *)(a1 + 40);
    uint64_t v15 = +[PLResourceGenerator generateAndStoreMissingExpectedLocalResourcesForAsset:v12 versions:&unk_1EEBF1658 imageConversionClient:v10 videoConversionClient:v11 conversionServiceOptions:v8 reason:@"Background job deferred render derivatives" completion:v21];
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = *(void **)(v16 + 104);
    *(void *)(v16 + 104) = v15;

    uint64_t v18 = [*(id *)(*(void *)(a1 + 48) + 104) completedUnitCount];
    if (v18 == [*(id *)(*(void *)(a1 + 48) + 104) totalUnitCount])
    {
      uint64_t v19 = *(void *)(a1 + 48);
      id v20 = *(void **)(v19 + 104);
      *(void *)(v19 + 104) = 0;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
    id v12 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v2;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch existingObjectWithID: %@ %@", buf, 0x16u);
    }
  }
}

void *__93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_73(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    return (void *)(*(uint64_t (**)(void, void))(result[4] + 16))(result[4], *(void *)(*(void *)(result[6] + 8) + 40));
  }
  return result;
}

void __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) managedObjectContext];
  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) uuid];
    id v10 = [v6 description];
    *(_DWORD *)buf = 138543618;
    id v49 = v9;
    __int16 v50 = 2114;
    v51 = v10;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Deferred render derivatives ran on asset uuid: %{public}@, produced recipes: %{public}@", buf, 0x16u);
  }
  if ([v5 count])
  {
    id v11 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Deferred render derivatives encountered errors: %{public}@", buf, 0xCu);
    }
  }
  v41 = (void *)v7;
  id v12 = v6;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    v17 = (void *)*MEMORY[0x1E4F8C500];
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "domain", v41);
        if (v20 == v17)
        {
          uint64_t v21 = [v19 code];

          if (v21 == 47002)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);

            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v22 = [*(id *)(a1 + 40) deferredProcessingStatesHandled];
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "deferredProcessingNeeded"));
  int v24 = [v22 containsObject:v23];

  if (v24)
  {
    [*(id *)(a1 + 32) setDeferredProcessingNeeded:0];
LABEL_20:
    id v25 = v12;
    uint64_t v26 = v41;
  }
  else
  {
    id v27 = PLBackgroundJobServiceGetLog();
    id v25 = v12;
    uint64_t v26 = v41;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      char v28 = [*(id *)(a1 + 32) uuid];
      unsigned int v29 = [*(id *)(a1 + 32) deferredProcessingNeeded];
      if (v29 > 0xB) {
        __int16 v30 = 0;
      }
      else {
        __int16 v30 = off_1E5865890[v29];
      }
      id v31 = v30;
      *(_DWORD *)buf = 138543618;
      id v49 = v28;
      __int16 v50 = 2112;
      v51 = v31;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Deferred render derivatives finished on asset uuid: %{public}@, but cannot overwrite deferred processing needed '%@'", buf, 0x16u);
    }
  }
  if (objc_msgSend(v26, "hasChanges", v41))
  {
    uint64_t v32 = [*(id *)(a1 + 32) photoLibrary];
    v33 = [v32 managedObjectContext];
    id v42 = 0;
    char v34 = [v33 save:&v42];
    id v35 = v42;
    v36 = (__CFString *)v42;

    if ((v34 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v35);
      v37 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = [*(id *)(a1 + 32) uuid];
        *(_DWORD *)buf = 138543618;
        id v49 = v38;
        __int16 v50 = 2112;
        v51 = v36;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Deferred render derivatives failed to save changes on asset uuid: %{public}@:, error: %@", buf, 0x16u);
      }
    }
  }
  uint64_t v39 = *(void *)(a1 + 40);
  v40 = *(void **)(v39 + 104);
  *(void *)(v39 + 104) = 0;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _criteriaToUse];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__10591;
  v17 = __Block_byref_object_dispose__10592;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PLBackgroundJobDeferredRenderDerivativesBaseWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v10[3] = &unk_1E5875340;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v6 performBlockAndWait:v10];
  uint64_t v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  id v8 = [(PLBackgroundJobWorkerPendingWorkItems *)v7 initWithCriteria:v5 workItemsNeedingProcessing:v14[5]];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __90__PLBackgroundJobDeferredRenderDerivativesBaseWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) _predicateToFetchDeferredAssets];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:100];
  [v4 setResultType:1];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v12];
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
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch deferredProcessingNeeded assets: %@", buf, 0xCu);
    }
  }
}

- (id)taskIdentifier
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)videoConversionClient
{
  videoConversionClient = self->_videoConversionClient;
  if (!videoConversionClient)
  {
    id v4 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F748E0]);
    id v5 = self->_videoConversionClient;
    self->_videoConversionClient = v4;

    videoConversionClient = self->_videoConversionClient;
  }
  return videoConversionClient;
}

- (id)imageConversionClient
{
  imageConversionClient = self->_imageConversionClient;
  if (!imageConversionClient)
  {
    id v4 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    id v5 = self->_imageConversionClient;
    self->_imageConversionClient = v4;

    imageConversionClient = self->_imageConversionClient;
  }
  return imageConversionClient;
}

- (id)_predicateToFetchDeferredAssets
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSSet)deferredProcessingStatesHandled
{
  id v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end