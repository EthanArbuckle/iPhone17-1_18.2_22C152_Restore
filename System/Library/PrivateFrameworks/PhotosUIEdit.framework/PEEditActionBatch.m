@interface PEEditActionBatch
- (BOOL)async;
- (BOOL)forceRunAsUnadjustedAsset;
- (BOOL)hasAssets;
- (NSProgress)progress;
- (PEEditActionBatch)initWithAssets:(id)a3 action:(id)a4 progress:(id)a5;
- (PEEditActionBatch)initWithAssets:(id)a3 actionMap:(id)a4 progress:(id)a5;
- (PEEditActionBatchDelegate)delegate;
- (PELoadingStatusDelegate)loadingStatusManager;
- (id)_presetForAsset:(id)a3;
- (id)_processAssets:(id)a3;
- (id)_processWillBeginWithAsset:(id)a3 progress:(double)a4;
- (int64_t)actionType;
- (int64_t)state;
- (void)_cancelLoading;
- (void)_commitComposition:(id)a3 toResource:(id)a4 changeType:(int64_t)a5 completion:(id)a6;
- (void)_processDidCompleteWithID:(id)a3 error:(id)a4;
- (void)_processDidUpdateWithID:(id)a3 progress:(double)a4;
- (void)_processResult:(id)a3 targetPreset:(id)a4 completion:(id)a5;
- (void)_requestResourcesForAsset:(id)a3 progressHandler:(id)a4 resultHandler:(id)a5;
- (void)_setupWithActionMap:(id)a3 assets:(id)a4 progress:(id)a5;
- (void)_updateProgress:(double)a3 forLoadingID:(id)a4;
- (void)cancel;
- (void)runActionWithBatchSize:(unint64_t)a3 completion:(id)a4;
- (void)setAsync:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceRunAsUnadjustedAsset:(BOOL)a3;
- (void)setLoadingStatusManager:(id)a3;
@end

@implementation PEEditActionBatch

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_loadingStatusManager);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_mediaRequestIds, 0);
  objc_storeStrong((id *)&self->_progressMap, 0);
  objc_storeStrong((id *)&self->_loadingIdMap, 0);
  objc_storeStrong((id *)&self->_actionMap, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PEEditActionBatchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PEEditActionBatchDelegate *)WeakRetained;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PELoadingStatusDelegate)loadingStatusManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingStatusManager);
  return (PELoadingStatusDelegate *)WeakRetained;
}

- (void)_updateProgress:(double)a3 forLoadingID:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__PEEditActionBatch__updateProgress_forLoadingID___block_invoke;
  v8[3] = &unk_2642BF2F0;
  double v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[PESupport syncMainThread:v8];
}

void __50__PEEditActionBatch__updateProgress_forLoadingID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  double v3 = *(double *)(a1 + 48);
  *(float *)&double v3 = v3;
  v4 = [NSNumber numberWithFloat:v3];
  [v2 setObject:v4 forKey:*(void *)(a1 + 40)];

  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) count];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) floatValue];
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  double v13 = v10 / (double)v5;
  v14 = [*(id *)(a1 + 32) progress];
  unint64_t v15 = llround(v13 * (double)[v14 totalUnitCount]);
  v16 = [*(id *)(a1 + 32) progress];
  [v16 setCompletedUnitCount:v15];
}

- (void)_cancelLoading
{
  double v3 = [(PEEditActionBatch *)self loadingStatusManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__PEEditActionBatch__cancelLoading__block_invoke;
  v5[3] = &unk_2642BF318;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  +[PESupport syncMainThread:v5];
}

uint64_t __35__PEEditActionBatch__cancelLoading__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) didCancelLoadOperationWithTrackingID:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)_processDidCompleteWithID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(PEEditActionBatch *)self _updateProgress:v6 forLoadingID:1.0];
    long long v8 = [(PEEditActionBatch *)self loadingStatusManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__PEEditActionBatch__processDidCompleteWithID_error___block_invoke;
    v10[3] = &unk_2642BF520;
    id v11 = v6;
    float v12 = self;
    id v13 = v8;
    id v14 = v7;
    id v9 = v8;
    +[PESupport syncMainThread:v10];
  }
}

uint64_t __53__PEEditActionBatch__processDidCompleteWithID_error___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    v1 = (void *)result;
    objc_msgSend(*(id *)(*(void *)(result + 40) + 16), "removeObjectForKey:");
    uint64_t v2 = v1[4];
    uint64_t v3 = (void *)v1[6];
    BOOL v4 = v1[7] == 0;
    return objc_msgSend(v3, "didCompleteLoadOperationWithTrackingID:withSuccess:error:", v2, v4);
  }
  return result;
}

- (void)_processDidUpdateWithID:(id)a3 progress:(double)a4
{
  id v6 = a3;
  [(PEEditActionBatch *)self _updateProgress:v6 forLoadingID:a4];
  id v7 = [(PEEditActionBatch *)self loadingStatusManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__PEEditActionBatch__processDidUpdateWithID_progress___block_invoke;
  v10[3] = &unk_2642BF2F0;
  id v11 = v7;
  id v12 = v6;
  double v13 = a4;
  id v8 = v6;
  id v9 = v7;
  +[PESupport syncMainThread:v10];
}

uint64_t __54__PEEditActionBatch__processDidUpdateWithID_progress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(a1 + 40) withProgress:*(double *)(a1 + 48)];
}

- (id)_processWillBeginWithAsset:(id)a3 progress:(double)a4
{
  id v6 = a3;
  id v7 = [(PEEditActionBatch *)self loadingStatusManager];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__2293;
  v21 = __Block_byref_object_dispose__2294;
  id v22 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__PEEditActionBatch__processWillBeginWithAsset_progress___block_invoke;
  v12[3] = &unk_2642BF2C8;
  unint64_t v15 = &v17;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  double v16 = a4;
  +[PESupport syncMainThread:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __57__PEEditActionBatch__processWillBeginWithAsset_progress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    goto LABEL_2;
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 40) uuid];
  id v11 = (void *)v10;
  if (v9)
  {
    uint64_t v12 = [v9 willBeginLoadOperationWithItemIdentifier:v10];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    double v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v10;
    id v11 = v16;
  }

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v17)
  {
    long long v18 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v19 = [*(id *)(a1 + 40) uuid];
    [v18 setObject:v17 forKey:v19];

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
LABEL_2:
      id v7 = *(void **)(a1 + 32);
      double v8 = *(double *)(a1 + 64);
      objc_msgSend(v7, "_processDidUpdateWithID:progress:", v8);
    }
  }
}

- (void)_commitComposition:(id)a3 toResource:(id)a4 changeType:(int64_t)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(PEEditActionBatch *)self state] == 3)
  {
    uint64_t v13 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v14 = "PEEditActionBatch commit: cancelled";
LABEL_9:
      _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (a5)
  {
    uint64_t v15 = [v11 asset];
    double v16 = objc_alloc_init(PEPhotoKitMediaDestination);
    if ([MEMORY[0x263F5D8D0] isIdentityCompositionController:v10])
    {
      uint64_t v17 = [v10 slomoAdjustmentController];
      BOOL v18 = v17 == 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    if (a5 == 2 || v18)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke;
      v37[3] = &unk_2642BF2A0;
      id v38 = v12;
      uint64_t v20 = [(PEPhotoKitMediaDestination *)v16 revertEditsForAsset:v15 completionHandler:v37];
      mediaRequestIds = self->_mediaRequestIds;
      id v22 = [NSNumber numberWithInt:v20];
      [(NSMutableSet *)mediaRequestIds addObject:v22];

      v23 = v38;
    }
    else if (a5 == 1)
    {
      if ([(PEEditActionBatch *)self actionType] == 4) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = [v11 retrievedVersion];
      }
      v25 = [v11 contentEditingInput];
      v23 = +[PESerializationUtility contentEditingOutputForContentEditingInput:v25 compositionController:v10 asset:v15 async:[(PEEditActionBatch *)self async] onlyChangingOriginalChoice:0];

      uint64_t v26 = 0;
      if ([v15 isLivePhoto])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v15;
          [v27 fetchPropertySetsIfNeeded];
          v28 = [v27 photoIrisProperties];

          uint64_t v26 = [v28 photoIrisVisibilityState];
        }
        else
        {
          uint64_t v26 = 0;
        }
      }
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke_52;
      v35 = &unk_2642BF2A0;
      id v36 = v12;
      uint64_t v29 = [(PEPhotoKitMediaDestination *)v16 saveInternalEditsForAsset:v15 usingCompositionController:v10 contentEditingOutput:v23 version:v19 livePhotoState:v26 completionHandler:&v32];
      v30 = self->_mediaRequestIds;
      v31 = objc_msgSend(NSNumber, "numberWithInt:", v29, v32, v33, v34, v35);
      [(NSMutableSet *)v30 addObject:v31];
    }
    else
    {
      v24 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v40 = a5;
        _os_log_impl(&dword_217B65000, v24, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: finished with unexpected change type: %lu", buf, 0xCu);
      }

      if (!v12) {
        goto LABEL_29;
      }
      v23 = [v11 asset];
      (*((void (**)(id, void *, void))v12 + 2))(v12, v23, 0);
    }

LABEL_29:
    goto LABEL_30;
  }
  uint64_t v13 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v14 = "PEEditActionBatch commit: no asset changes to commit";
    goto LABEL_9;
  }
LABEL_10:

  uint64_t v15 = [v11 asset];
  (*((void (**)(id, void *, void))v12 + 2))(v12, v15, 0);
LABEL_30:
}

void __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLPhotoEditGetLog();
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: failed to revert adjustments with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 uuid];
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch commit: reverted adjustments on asset: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLPhotoEditGetLog();
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: failed to save adjustments with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 uuid];
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch commit: saved adjustments on asset: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_processResult:(id)a3 targetPreset:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (PEAdjustmentPreset *)a4;
  id v10 = a5;
  int v11 = [v8 compositionController];
  objc_initWeak(&location, self);
  if (!v9)
  {
    id v12 = objc_alloc(MEMORY[0x263F5D560]);
    uint64_t v13 = [v8 originalComposition];
    id v14 = (void *)[v12 initWithComposition:v13];

    uint64_t v15 = [PEAdjustmentPreset alloc];
    double v16 = [v8 asset];
    id v9 = [(PEAdjustmentPreset *)v15 initWithCompositionController:v14 asset:v16];
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke;
  v20[3] = &unk_2642BF278;
  objc_copyWeak(&v24, &location);
  id v17 = v11;
  id v21 = v17;
  id v18 = v8;
  id v22 = v18;
  id v19 = v10;
  id v23 = v19;
  [(PEAdjustmentPreset *)v9 applyToLoadResult:v18 completion:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke(id *a1, void *a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke_2;
  block[3] = &unk_2642BF250;
  objc_copyWeak(v8, a1 + 7);
  id v5 = a1[4];
  id v6 = a1[5];
  v8[1] = a2;
  id v7 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v8);
}

void __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _commitComposition:*(void *)(a1 + 32) toResource:*(void *)(a1 + 40) changeType:*(void *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)_requestResourcesForAsset:(id)a3 progressHandler:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2293;
  id v38 = __Block_byref_object_dispose__2294;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2293;
  uint64_t v32 = __Block_byref_object_dispose__2294;
  id v33 = 0;
  BOOL v11 = [(PEEditActionBatch *)self forceRunAsUnadjustedAsset];
  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  resourceManager = self->_resourceManager;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke;
  v23[3] = &unk_2642BF1E0;
  uint64_t v26 = &v34;
  id v27 = &v28;
  id v14 = v8;
  id v24 = v14;
  uint64_t v15 = v12;
  v25 = v15;
  [(PEResourceManager *)resourceManager loadResourceForAsset:v14 requireLocalResources:1 forceRunAsUnadjustedAsset:v11 progressHandler:v9 resultHandler:v23];
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (v11)
  {
    double v16 = self->_resourceManager;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke_2;
    v18[3] = &unk_2642BF228;
    id v19 = v14;
    id v21 = &v34;
    id v20 = v10;
    id v22 = &v28;
    [(PEResourceManager *)v16 loadResourceForAsset:v19 requireLocalResources:1 forceRunAsUnadjustedAsset:0 progressHandler:&__block_literal_global_2310 resultHandler:v18];
  }
  else
  {
    id v17 = [(id)v35[5] compositionController];
    [(id)v35[5] setAdjustedSourceCompositionController:v17];

    (*((void (**)(id, uint64_t, uint64_t))v10 + 2))(v10, v35[5], v29[5]);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) compositionController];
  if (!v8)
  {
    id v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) uuid];
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch resources for asset: %{public}@ error:%@", (uint8_t *)&v11, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 compositionController];
  if (!v6)
  {
    id v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) uuid];
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch adjusted resources for asset: %{public}@ error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAdjustedSourceCompositionController:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_processAssets:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v19 = a3;
  uint64_t v4 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v4, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch _processAssets:", buf, 2u);
  }

  if ([(PEEditActionBatch *)self state] == 3)
  {
    id v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch: Skipping _processAssets due to batch cancelation", buf, 2u);
    }

    id v6 = 0;
  }
  else
  {
    *(void *)buf = 0;
    v42 = buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2293;
    v45 = __Block_byref_object_dispose__2294;
    id v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v19, "count"));
    objc_initWeak(&location, self);
    id v7 = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v19;
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v8)
    {
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          __int16 v11 = [(PEEditActionBatch *)self _presetForAsset:v10];
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x3032000000;
          v34[3] = __Block_byref_object_copy__2293;
          v34[4] = __Block_byref_object_dispose__2294;
          id v12 = [PEEditActionResult alloc];
          uint64_t v13 = [v10 uuid];
          v35 = [(PEEditActionResult *)v12 initWithAssetUUID:v13 targetAction:v11];

          id v14 = [(PEEditActionBatch *)self _processWillBeginWithAsset:v10 progress:0.01];
          dispatch_group_enter(v7);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __36__PEEditActionBatch__processAssets___block_invoke;
          v31[3] = &unk_2642BF168;
          objc_copyWeak(&v33, &location);
          id v15 = v14;
          id v32 = v15;
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __36__PEEditActionBatch__processAssets___block_invoke_2;
          v22[3] = &unk_2642BF1B8;
          objc_copyWeak(&v30, &location);
          id v16 = v15;
          id v23 = v16;
          id v24 = self;
          v25 = v7;
          uint64_t v28 = v34;
          id v17 = v11;
          uint64_t v29 = buf;
          id v26 = v17;
          id v27 = v10;
          [(PEEditActionBatch *)self _requestResourcesForAsset:v10 progressHandler:v31 resultHandler:v22];

          objc_destroyWeak(&v30);
          objc_destroyWeak(&v33);

          _Block_object_dispose(v34, 8);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
      }
      while (v8);
    }

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    id v6 = *((id *)v42 + 5);

    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  return v6;
}

void __36__PEEditActionBatch__processAssets___block_invoke(uint64_t a1, double a2)
{
  double v3 = a2 * 0.75;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processDidUpdateWithID:*(void *)(a1 + 32) progress:v3];
}

void __36__PEEditActionBatch__processAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained _processDidUpdateWithID:*(void *)(a1 + 32) progress:0.75];

  if ([*(id *)(a1 + 40) state] == 3)
  {
    uint64_t v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch: Dropping resource due to batch cancelation", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    int v9 = [v5 adjustedSourceCompositionController];
    if (v9)
    {
      id v10 = [PEAdjustmentPreset alloc];
      __int16 v11 = [v5 asset];
      id v12 = [(PEAdjustmentPreset *)v10 initWithCompositionController:v9 asset:v11];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSourceAction:v12];
    }
    uint64_t v13 = [v5 compositionController];
    if (v13)
    {
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 56);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __36__PEEditActionBatch__processAssets___block_invoke_42;
      v19[3] = &unk_2642BF190;
      long long v22 = *(_OWORD *)(a1 + 72);
      objc_copyWeak(&v23, (id *)(a1 + 88));
      id v20 = *(id *)(a1 + 32);
      id v21 = *(id *)(a1 + 48);
      [v14 _processResult:v5 targetPreset:v15 completion:v19];

      objc_destroyWeak(&v23);
    }
    else
    {
      id v16 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = [*(id *)(a1 + 64) uuid];
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_217B65000, v16, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Failed to fetch preset from asset: %{public}@", buf, 0xCu);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setError:v6];
      id v18 = objc_loadWeakRetained((id *)(a1 + 88));
      [v18 _processDidCompleteWithID:*(void *)(a1 + 32) error:v6];

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }
  }
}

void __36__PEEditActionBatch__processAssets___block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = a3;
  [v5 setSavedAsset:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setError:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _processDidCompleteWithID:*(void *)(a1 + 32) error:v6];

  uint64_t v8 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v8);
}

- (id)_presetForAsset:(id)a3
{
  actionMap = self->_actionMap;
  id v5 = [a3 uuid];
  id v6 = [(NSDictionary *)actionMap objectForKey:v5];

  if (!v6)
  {
    id v6 = [(NSDictionary *)self->_actionMap objectForKey:@"PESingleActionKey"];
  }
  return v6;
}

- (void)_setupWithActionMap:(id)a3 assets:(id)a4 progress:(id)a5
{
  uint64_t v8 = (NSDictionary *)a3;
  int v9 = (NSArray *)a4;
  id v10 = (NSProgress *)a5;
  self->_state = 0;
  actionMap = self->_actionMap;
  self->_actionMap = v8;
  id v23 = v8;

  assets = self->_assets;
  self->_assets = v9;
  uint64_t v13 = v9;

  id v14 = (OS_dispatch_queue *)dispatch_queue_create("PEEditActionBatch", 0);
  loadingQueue = self->_loadingQueue;
  self->_loadingQueue = v14;

  id v16 = objc_alloc_init(PEResourceManager);
  resourceManager = self->_resourceManager;
  self->_resourceManager = v16;

  id v18 = objc_alloc_init(PEPhotoKitMediaDestination);
  mediaDestination = self->_mediaDestination;
  self->_mediaDestination = v18;

  id v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  mediaRequestIds = self->_mediaRequestIds;
  self->_mediaRequestIds = v20;

  [(NSProgress *)v10 setTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v10;
}

- (BOOL)hasAssets
{
  return [(NSArray *)self->_assets count] != 0;
}

- (void)cancel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t v3 = [(PEEditActionBatch *)self state];
  uint64_t v4 = PLPhotoEditGetLog();
  id v5 = v4;
  if (v3 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_DEFAULT, "PEEditActionBatch: Canceled.", buf, 2u);
    }

    self->_state = 3;
    [(PEResourceManager *)self->_resourceManager cancelAllRequests];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_mediaRequestIds;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[PEPhotoKitMediaDestination cancelRequestWithIdentifier:](self->_mediaDestination, "cancelRequestWithIdentifier:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "intValue", (void)v11));
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(PEEditActionBatch *)self _cancelLoading];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = v3;
      _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Attempted to cancel, but batch is not in progress. PEEditActionBatchState: %lu", buf, 0xCu);
    }
  }
}

- (void)runActionWithBatchSize:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  self->_state = 1;
  int64_t v7 = [(PEEditActionBatch *)self actionType];
  uint64_t v8 = [(PEEditActionBatch *)self delegate];
  [v8 batch:self willStartAction:v7];

  uint64_t v9 = self->_assets;
  unint64_t v10 = [(NSArray *)v9 count];
  long long v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v10];
  loadingIdMap = self->_loadingIdMap;
  self->_loadingIdMap = v11;

  long long v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v10];
  progressMap = self->_progressMap;
  self->_progressMap = v13;

  if (v10 >= a3) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = v10;
  }
  loadingQueue = self->_loadingQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke;
  v19[3] = &unk_2642BF140;
  unint64_t v24 = v15;
  unint64_t v25 = v10;
  id v20 = v9;
  id v21 = self;
  id v22 = v6;
  unint64_t v23 = vcvtpd_u64_f64((double)v10 / (double)v15);
  id v17 = v6;
  uint64_t v18 = v9;
  dispatch_async(loadingQueue, v19);
}

void __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if (*(void *)(a1 + 56))
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 64);
      unint64_t v5 = *(void *)(a1 + 72);
      uint64_t v6 = v4 * v3;
      if (v4 * v3 + v4 <= v5) {
        uint64_t v7 = *(void *)(a1 + 64);
      }
      else {
        uint64_t v7 = v5 - v4 * v3;
      }
      uint64_t v8 = (void *)MEMORY[0x21D4583F0]();
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v6, v7);
      unint64_t v10 = [*(id *)(a1 + 40) _processAssets:v9];
      if (v10) {
        [v2 addObjectsFromArray:v10];
      }

      ++v3;
    }
    while (v3 < *(void *)(a1 + 56));
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke_2;
  v16[3] = &unk_2642BF118;
  v16[4] = &v17;
  [v2 enumerateObjectsUsingBlock:v16];
  uint64_t v11 = [*(id *)(a1 + 40) state];
  uint64_t v12 = v11;
  if (v11 == 3)
  {
    long long v13 = [*(id *)(a1 + 40) delegate];
    -[NSObject batch:didCancelAction:](v13, "batch:didCancelAction:", *(void *)(a1 + 40), [*(id *)(a1 + 40) actionType]);
  }
  else if (v11 == 1)
  {
    *(void *)(*(void *)(a1 + 40) + 104) = 2;
    long long v13 = [*(id *)(a1 + 40) delegate];
    long long v14 = *(void **)(a1 + 40);
    uint64_t v15 = [v14 actionType];
    [v13 batch:v14 didCompleteAction:v15 hasError:*((unsigned __int8 *)v18 + 24)];
  }
  else
  {
    long long v13 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v12;
      _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Unexpected state in _batchDidStop: %lu", buf, 0xCu);
    }
  }

  (*(void (**)(void, void *, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2, *(void *)(*(void *)(a1 + 40) + 104) == 3);
  _Block_object_dispose(&v17, 8);
}

void __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 error];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (PEEditActionBatch)initWithAssets:(id)a3 action:(id)a4 progress:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PEEditActionBatch;
  uint64_t v11 = [(PEEditActionBatch *)&v14 init];
  if (v11)
  {
    if (v9)
    {
      uint64_t v15 = @"PESingleActionKey";
      v16[0] = v9;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    [(PEEditActionBatch *)v11 _setupWithActionMap:v12 assets:v8 progress:v10];
    v11->_actionType = [v9 actionType];
  }
  return v11;
}

- (PEEditActionBatch)initWithAssets:(id)a3 actionMap:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PEEditActionBatch;
  uint64_t v11 = [(PEEditActionBatch *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    [(PEEditActionBatch *)v11 _setupWithActionMap:v9 assets:v8 progress:v10];
    v12->_actionType = 1;
  }

  return v12;
}

@end