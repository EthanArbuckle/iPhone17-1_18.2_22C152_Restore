@interface PLBackgroundJobResourceAvailabilityWorker
+ (BOOL)allowWorkerToRunDuringCPLInitialSync;
+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
- (BOOL)isInterruptible;
- (PLBackgroundJobResourceAvailabilityWorker)initWithLibraryBundle:(id)a3;
- (id)deferredPhotoFinalizer;
- (id)imageConversionClient;
- (id)videoConversionClient;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)_performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
- (void)workerDidFinishWithDatabaseContext:(id)a3;
@end

@implementation PLBackgroundJobResourceAvailabilityWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredPhotoFinalizer, 0);
  objc_storeStrong((id *)&self->_videoConversionClient, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
}

- (void)stopWorkingOnItem:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_progressForCurrentAsset;
  os_unfair_lock_unlock(p_lock);
  [(NSProgress *)v5 cancel];
}

- (BOOL)isInterruptible
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_progressForCurrentAsset != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)workerDidFinishWithDatabaseContext:(id)a3
{
  if (self->_countOfDeferredPhotosProcessed >= 1)
  {
    id v4 = [(PLBackgroundJobWorker *)self libraryBundle];
    v3 = [v4 constraintsDirector];
    [v3 informAssetsFinishedDeferredProcessing];
  }
}

- (void)_performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v11 = [v9 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke;
  v16[3] = &unk_1E58643C0;
  id v12 = v8;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  id v14 = v10;
  id v21 = v14;
  id v15 = v9;
  v22 = v23;
  id v19 = v15;
  v20 = self;
  [v15 performBlockAndWait:v16];

  _Block_object_dispose(v23, 8);
}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v65 = 0;
  id v4 = [v3 existingObjectWithID:v2 error:&v65];
  id v5 = v65;
  v6 = [v4 asset];
  v7 = [v6 uuid];
  id v8 = [v6 dateCreated];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  if (v10 <= -30.0)
  {
    if (v4)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [v4 recipeID]);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v16 = [v14 supportedVersionsForLocalResourceGeneration];
      char v17 = [v4 isLocallyAvailable];
      v51 = v16;
      v52 = v7;
      if (v14 && (v17 & 1) == 0 && (int)[v4 localAvailabilityTarget] > 0)
      {
        if ([v16 count] == 1)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          id v18 = [*(id *)(a1 + 56) deferredPhotoFinalizer];
          [v14 supportedVersionsForLocalResourceGeneration];
          v20 = id v19 = v7;
          id v21 = [v20 firstObject];
          uint64_t v50 = [v21 integerValue];

          v49 = [*(id *)(a1 + 56) imageConversionClient];
          v22 = [*(id *)(a1 + 56) videoConversionClient];
          id v60 = 0;
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_2;
          v53[3] = &unk_1E5864398;
          id v54 = *(id *)(a1 + 48);
          id v23 = v4;
          uint64_t v24 = *(void *)(a1 + 56);
          id v55 = v23;
          uint64_t v56 = v24;
          id v57 = v14;
          id v58 = v19;
          id v59 = *(id *)(a1 + 64);
          [v57 generateAndStoreForAsset:v6 version:v50 imageConversionClient:v49 videoConversionClient:v22 conversionServiceOptions:0 deferredPhotoFinalizer:v18 progress:&v60 reason:@"Background job resource availability" completion:v53];
          id v25 = v60;

          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 104));
          uint64_t v26 = *(void *)(a1 + 56);
          v27 = *(void **)(v26 + 112);
          *(void *)(v26 + 112) = v25;
          id v28 = v25;

          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 104));
        }
        else
        {
          v38 = PLBackgroundJobServiceGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = [v6 uuid];
            *(_DWORD *)buf = 138543618;
            id v69 = v14;
            __int16 v70 = 2114;
            id v71 = v39;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Availability worker: resource %{public}@ with asset uuid %{public}@ is not supported for local generation, lowering availability... ", buf, 0x16u);
          }
          v40 = *(void **)(a1 + 48);
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_53;
          v61[3] = &unk_1E5875CE0;
          id v62 = v4;
          [v40 performTransactionAndWait:v61];
          v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47005 userInfo:0];
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

          id v18 = v62;
        }
        goto LABEL_35;
      }
      if ([v4 isLocallyAvailable])
      {
        v29 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [v6 uuid];
          *(_DWORD *)buf = 138543618;
          id v69 = v14;
          __int16 v70 = 2114;
          id v71 = v30;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ has already been made available, skipping", buf, 0x16u);
        }
        if (v14) {
          goto LABEL_34;
        }
      }
      else
      {
        if (v14)
        {
          if ((int)[v4 localAvailabilityTarget] <= 0)
          {
            v36 = PLBackgroundJobServiceGetLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [v6 uuid];
              *(_DWORD *)buf = 138543618;
              id v69 = v14;
              __int16 v70 = 2114;
              id v71 = v37;
              _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ availability target has changed, skipping", buf, 0x16u);
            }
            goto LABEL_33;
          }
LABEL_34:
          v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v46 = *MEMORY[0x1E4F8C500];
          uint64_t v66 = *MEMORY[0x1E4F28228];
          v47 = [NSString stringWithFormat:@"No work needed for object"];
          v67 = v47;
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          id v18 = [v45 errorWithDomain:v46 code:50002 userInfo:v48];

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_35:

          v7 = v52;
          goto LABEL_36;
        }
        v42 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = [v6 uuid];
          *(_DWORD *)buf = 138543618;
          id v69 = 0;
          __int16 v70 = 2114;
          id v71 = v43;
          _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ has no resource recipe, skipping", buf, 0x16u);
        }
      }
      if ((int)[v4 localAvailabilityTarget] >= 1)
      {
        v44 = *(void **)(a1 + 48);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_48;
        v63[3] = &unk_1E5875CE0;
        v64 = v4;
        [v44 performTransactionAndWait:v63];
        v36 = v64;
LABEL_33:

        goto LABEL_34;
      }
      goto LABEL_34;
    }
    if (v5)
    {
      id v14 = v5;
      v31 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v69 = v2;
        __int16 v70 = 2112;
        id v71 = v14;
        v32 = "Failed to fetch existingObjectWithID: %@ %@";
        v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 22;
LABEL_23:
        _os_log_impl(&dword_19B3C7000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47017 userInfo:0];
      v31 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v2;
        v32 = "Resource no longer available for objectID: %@";
        v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        uint32_t v35 = 12;
        goto LABEL_23;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_36;
  }
  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F8C500];
  uint64_t v72 = *MEMORY[0x1E4F28228];
  v73[0] = @"stopping due to asset being too new to background process";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
  id v15 = [v12 errorWithDomain:v13 code:50004 userInfo:v14];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);

LABEL_36:
}

uint64_t __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocalAvailabilityTarget:0];
}

uint64_t __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocalAvailability:4294934528];
}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v35 = 0;
  v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9941;
  v39 = __Block_byref_object_dispose__9942;
  id v40 = 0;
  if (v12)
  {
    if (+[PLDeferredPhotoFinalizer errorIsRecoverable:v12])
    {
      v16 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v12;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Availability worker: encountered recoverable deferred photo finalizer error %@, will try again later", buf, 0xCu);
      }

      char v17 = v36;
      id v18 = v12;
      id v19 = v17[5];
      v17[5] = v18;
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_57;
      v29[3] = &unk_1E5875BD0;
      id v23 = *(void **)(a1 + 32);
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void **)(a1 + 56);
      id v30 = v24;
      uint64_t v31 = v25;
      id v32 = v26;
      id v33 = *(id *)(a1 + 64);
      os_log_type_t v34 = &v35;
      [v23 performTransactionAndWait:v29];

      id v19 = v30;
    }
LABEL_12:

    goto LABEL_13;
  }
  ++*(_DWORD *)(*(void *)(a1 + 48) + 136);
  if ([v11 hasChanges])
  {
    id v28 = 0;
    char v20 = [v11 save:&v28];
    id v21 = v28;
    id v19 = v28;
    if ((v20 & 1) == 0)
    {
      v22 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v19;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Availability worker failed to save changes for moc with error: %@", buf, 0xCu);
      }

      objc_storeStrong(v36 + 5, v21);
    }
    goto LABEL_12;
  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 104));
  v27 = *(void **)(*(void *)(a1 + 48) + 112);
  *(void *)(*(void *)(a1 + 48) + 112) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 104));
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  _Block_object_dispose(&v35, 8);
}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_57(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isLocallyAvailable];
  v3 = PLBackgroundJobServiceGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) objectID];
      if ([*(id *)(a1 + 32) isLocallyAvailable]) {
        v6 = @"Y";
      }
      else {
        v6 = @"N";
      }
      v7 = [*(id *)(a1 + 40) workerName];
      *(_DWORD *)buf = 138543874;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Resource %{public}@ (locally available: %{public}@) is no longer valid for worker %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (v4)
    {
      id v8 = *(void **)(a1 + 48);
      double v9 = *(__CFString **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Availability worker: unable to make recipe: %{public}@ available for asset uuid: %{public}@, lowering availability...", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setLocalAvailability:4294934528];
    double v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"Resource was not made available", *MEMORY[0x1E4F28228]);
    char v17 = v3;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:47001 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = PLBackendGetLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  id v13 = v8;
  uint64_t v14 = v11;
  id v15 = v14;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v13;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "backgroundResourceAvailabilityWorkItem", "item:%{public}@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__PLBackgroundJobResourceAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v18[3] = &unk_1E586EC48;
  id v19 = v15;
  id v20 = v9;
  os_signpost_id_t v21 = v12;
  uint64_t v16 = v15;
  id v17 = v9;
  [(PLBackgroundJobResourceAvailabilityWorker *)self _performWorkOnItem:v13 inLibrary:v10 completion:v18];
}

void __84__PLBackgroundJobResourceAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "backgroundResourceAvailabilityWorkItem", "", v5, 2u);
  }
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__9941;
  id v19 = __Block_byref_object_dispose__9942;
  id v20 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __81__PLBackgroundJobResourceAvailabilityWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  os_signpost_id_t v12 = &unk_1E5875E68;
  id v5 = v3;
  id v13 = v5;
  uint64_t v14 = &v15;
  [v5 performBlockAndWait:&v9];
  v6 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  v7 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v6, "initWithCriteria:workItemsNeedingProcessing:", v4, v16[5], v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __81__PLBackgroundJobResourceAvailabilityWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLInternalResource entityName];
  os_signpost_id_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = +[PLManagedAsset predicateToFetchResourcesAwaitingLocalAvailabilityChange];
  [v4 setPredicate:v5];

  [v4 setResultType:1];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"recipeID" ascending:1];
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v18[0] = v6;
  v18[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v4 setSortDescriptors:v8];

  uint64_t v9 = [*(id *)(a1 + 32) managedObjectContext];
  id v15 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v4 error:&v15];
  id v11 = v15;

  if (v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = v10;
    uint64_t v14 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    uint64_t v14 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch deferredProcessingNeeded assets: %@", buf, 0xCu);
    }
  }
}

- (PLBackgroundJobResourceAvailabilityWorker)initWithLibraryBundle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBackgroundJobResourceAvailabilityWorker;
  result = [(PLBackgroundJobWorker *)&v4 initWithLibraryBundle:a3];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_countOfDeferredPhotosProcessed = 0;
  }
  return result;
}

- (id)deferredPhotoFinalizer
{
  deferredPhotoFinalizer = self->_deferredPhotoFinalizer;
  if (!deferredPhotoFinalizer)
  {
    objc_super v4 = [[PLDeferredPhotoFinalizer alloc] initForUseCase:1];
    id v5 = self->_deferredPhotoFinalizer;
    self->_deferredPhotoFinalizer = v4;

    deferredPhotoFinalizer = self->_deferredPhotoFinalizer;
  }
  return deferredPhotoFinalizer;
}

- (id)videoConversionClient
{
  videoConversionClient = self->_videoConversionClient;
  if (!videoConversionClient)
  {
    objc_super v4 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F748E0]);
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
    objc_super v4 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    id v5 = self->_imageConversionClient;
    self->_imageConversionClient = v4;

    imageConversionClient = self->_imageConversionClient;
  }
  return imageConversionClient;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork
{
  return 1;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

@end