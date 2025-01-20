@interface PXEditBatchAction
- (BOOL)allowSynchronousRendering;
- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3;
- (BOOL)shouldRenderSynchronouslyForAsset:(id)a3;
- (NSArray)assets;
- (NSProgress)asyncProgress;
- (NSProgress)syncProgress;
- (PXEditBatchAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7;
- (PXEditPresetManager)manager;
- (id)asyncAssets;
- (id)completionHandler;
- (id)localizedProgressToastOngoingTitle;
- (id)localizedProgressToastRedoTitle;
- (id)localizedProgressToastSuccessTitle;
- (id)localizedProgressToastUndoTitle;
- (id)prefetchOriginalMetadataForAssets:(id)a3;
- (id)syncAssets;
- (void)_cancel;
- (void)_reportResults:(id)a3;
- (void)_saveResults:(id)a3 needsUndoMap:(BOOL)a4 completion:(id)a5;
- (void)_saveUndoMapFromResults:(id)a3 completion:(id)a4;
- (void)_syncUndoDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5;
- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)saveResults:(id)a3 completion:(id)a4;
- (void)setAllowSynchronousRendering:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)willBeginActionIsAsync:(BOOL)a3 itemCount:(unint64_t)a4;
- (void)willBeginActionWithLocalizedTitle:(id)a3 isAsync:(BOOL)a4 itemCount:(unint64_t)a5;
@end

@implementation PXEditBatchAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncProgress, 0);
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_undoActionMap, 0);
  objc_storeStrong((id *)&self->_syncAssets, 0);
  objc_storeStrong((id *)&self->_asyncAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
}

- (NSProgress)asyncProgress
{
  return self->_asyncProgress;
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAllowSynchronousRendering:(BOOL)a3
{
  self->_allowSynchronousRendering = a3;
}

- (BOOL)allowSynchronousRendering
{
  return self->_allowSynchronousRendering;
}

- (PXEditPresetManager)manager
{
  return self->_manager;
}

- (id)localizedProgressToastRedoTitle
{
  return 0;
}

- (id)localizedProgressToastUndoTitle
{
  return 0;
}

- (id)localizedProgressToastSuccessTitle
{
  return 0;
}

- (id)localizedProgressToastOngoingTitle
{
  return 0;
}

- (id)prefetchOriginalMetadataForAssets:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v3 title:0];
    v5 = (void *)MEMORY[0x1E4F390A0];
    v6 = [v3 objectAtIndexedSubscript:0];
    v7 = [v5 fetchOptionsWithPhotoLibrary:0 orObject:v6];

    v12[0] = *MEMORY[0x1E4F394E8];
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setFetchPropertySets:v8];

    v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v7];
    id v10 = [v9 fetchedObjects];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (void)_saveUndoMapFromResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  actionQueue = self->_actionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXEditBatchAction__saveUndoMapFromResults_completion___block_invoke;
  block[3] = &unk_1E5DD0E78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(actionQueue, block);
}

void __56__PXEditBatchAction__saveUndoMapFromResults_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 sourceAction];
        id v10 = [v8 sourceAssetUUID];
        v11 = [v8 savedAsset];
        if (v11) {
          BOOL v12 = v9 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12 && v10 != 0)
        {
          [*(id *)(*(void *)(a1 + 32) + 104) setObject:v9 forKey:v10];
          [v2 addObject:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v14 = [*(id *)(a1 + 32) prefetchOriginalMetadataForAssets:v2];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 80);
  *(void *)(v15 + 80) = v14;

  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 96);
  *(void *)(v17 + 96) = 0;

  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 88);
  *(void *)(v19 + 88) = 0;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_reportResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXEditBatchAction *)self completionHandler];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__PXEditBatchAction__reportResults___block_invoke;
    v6[3] = &unk_1E5DD32A8;
    id v7 = v4;
    v8 = self;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __36__PXEditBatchAction__reportResults___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "error", (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 40) completionHandler];
  ((void (**)(void, id))v9)[2](v9, v2);
}

- (void)_cancel
{
  id v2 = [(PXEditBatchAction *)self manager];
  [v2 cancelCurrentBatchAction];
}

- (void)_saveResults:(id)a3 needsUndoMap:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PFExists();
  if (v10 && v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke_2;
    v11[3] = &unk_1E5DD0E78;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    [(PXEditBatchAction *)self _saveUndoMapFromResults:v12 completion:v11];
  }
  else
  {
    [(PXEditBatchAction *)self _reportResults:v8];
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, v10, 0);
  }
}

uint64_t __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportResults:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

BOOL __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)saveResults:(id)a3 completion:(id)a4
{
}

- (NSArray)assets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__115174;
  uint64_t v10 = __Block_byref_object_dispose__115175;
  id v11 = 0;
  actionQueue = self->_actionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PXEditBatchAction_assets__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(actionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __27__PXEditBatchAction_assets__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)asyncAssets
{
  asyncAssets = self->_asyncAssets;
  if (!asyncAssets)
  {
    uint64_t v4 = [(PXEditBatchAction *)self assets];
    PFFilter();
    uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_asyncAssets;
    self->_asyncAssets = v5;

    asyncAssets = self->_asyncAssets;
  }
  return asyncAssets;
}

uint64_t __32__PXEditBatchAction_asyncAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldRenderSynchronouslyForAsset:a2] ^ 1;
}

- (id)syncAssets
{
  syncAssets = self->_syncAssets;
  if (!syncAssets)
  {
    uint64_t v4 = [(PXEditBatchAction *)self assets];
    PFFilter();
    uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_syncAssets;
    self->_syncAssets = v5;

    syncAssets = self->_syncAssets;
  }
  return syncAssets;
}

uint64_t __31__PXEditBatchAction_syncAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldRenderSynchronouslyForAsset:a2];
}

- (BOOL)shouldRenderSynchronouslyForAsset:(id)a3
{
  id v4 = a3;
  if ([(PXEditBatchAction *)self allowSynchronousRendering])
  {
    if ([(PXEditBatchAction *)self isEligibleForAsyncProcessingOnAsset:v4])
    {
      uint64_t v5 = [v4 originalMetadataProperties];
      uint64_t v6 = [v5 originalWidth];
      double v7 = (double)([v5 originalHeight] * v6) / 1000000.0;
      uint64_t v8 = [v4 RAWBadgeAttributes];
      BOOL v10 = v7 >= 25.0 || v8 != 0;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3
{
  return 1;
}

- (void)willBeginActionWithLocalizedTitle:(id)a3 isAsync:(BOOL)a4 itemCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(PXEditBatchAction *)self assets];
  uint64_t v10 = [v9 count];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXEditBatchAction_willBeginActionWithLocalizedTitle_isAsync_itemCount___block_invoke;
  block[3] = &unk_1E5DBB2B0;
  BOOL v16 = a4;
  unint64_t v14 = a5;
  uint64_t v15 = v10;
  block[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PXEditBatchAction_willBeginActionWithLocalizedTitle_isAsync_itemCount___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 48) >= *(void *)(a1 + 56)) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = 21;
    }
  }
  else
  {
    uint64_t v2 = 22;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) asyncProgress];
  [v4 setLocalizedDescription:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) syncProgress];
  [v6 setLocalizedDescription:v5];

  double v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    [v7 asyncProgress];
  }
  else {
  id v9 = [v7 syncProgress];
  }
  [v9 setCompletedUnitCount:0];
  id v8 = PXLocalizedAssetCountForUsage(*(void *)(a1 + 48), 0, 0, v2);
  [v9 setLocalizedAdditionalDescription:v8];
}

- (void)willBeginActionIsAsync:(BOOL)a3 itemCount:(unint64_t)a4
{
  BOOL v5 = a3;
  double v7 = [(PXAction *)self redoMenuItemTitle];

  if (v7)
  {
    id v8 = [(PXEditBatchAction *)self localizedProgressToastRedoTitle];

    if (v8) {
      [(PXEditBatchAction *)self localizedProgressToastRedoTitle];
    }
    else {
      [(PXAction *)self redoMenuItemTitle];
    }
  }
  else
  {
    uint64_t v10 = [(PXEditBatchAction *)self localizedProgressToastOngoingTitle];

    if (v10) {
      [(PXEditBatchAction *)self localizedProgressToastOngoingTitle];
    }
    else {
      [(PXAction *)self localizedActionName];
    }
  uint64_t v9 = };
  id v11 = (id)v9;
  [(PXEditBatchAction *)self willBeginActionWithLocalizedTitle:v9 isAsync:v5 itemCount:a4];
}

- (void)_syncUndoDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(PXEditBatchAction *)self asyncAssets];
  id v11 = v10;
  if (a4 || ![v10 count])
  {
    [(PXEditBatchAction *)self _saveResults:v8 needsUndoMap:0 completion:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    id v12 = [(PXEditBatchAction *)self localizedProgressToastUndoTitle];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(PXAction *)self undoMenuItemTitle];
    }
    uint64_t v15 = v14;

    -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v15, 1, [v11 count]);
    BOOL v16 = [(PXEditBatchAction *)self manager];
    undoActionMap = self->_undoActionMap;
    v18 = [(PXEditBatchAction *)self asyncProgress];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__PXEditBatchAction__syncUndoDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v19[3] = &unk_1E5DC84C8;
    id v20 = v8;
    objc_copyWeak(&v22, &location);
    id v21 = v9;
    [v16 replacePresets:undoActionMap onAssets:v11 async:1 progress:v18 completion:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __79__PXEditBatchAction__syncUndoDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = (id)[v3 mutableCopy];
  [v6 addObjectsFromArray:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _saveResults:v6 needsUndoMap:0 completion:*(void *)(a1 + 40)];
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  if (![(NSMutableDictionary *)self->_undoActionMap count])
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v8 = "No successful actions in PXEditBatchAction to undo.";
      goto LABEL_7;
    }
LABEL_8:

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_13;
  }
  BOOL v5 = [(PXEditBatchAction *)self manager];
  int v6 = [v5 isBusyWithBatchAction];

  if (v6)
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v8 = "Could not undo PXEditBatchAction: Edit manager is busy.";
LABEL_7:
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v9 = [(PXEditBatchAction *)self localizedProgressToastUndoTitle];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(PXAction *)self undoMenuItemTitle];
  }
  id v12 = v11;

  id v13 = [(PXEditBatchAction *)self syncAssets];
  -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v12, 0, [v13 count]);
  actionQueue = self->_actionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXEditBatchAction_performUndo___block_invoke;
  block[3] = &unk_1E5DD0E78;
  block[4] = self;
  id v17 = v13;
  id v18 = v4;
  id v15 = v13;
  dispatch_async(actionQueue, block);

LABEL_13:
}

void __33__PXEditBatchAction_performUndo___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 104) count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v2 = [*(id *)(a1 + 32) manager];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v3[13];
    int v6 = [v3 syncProgress];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__PXEditBatchAction_performUndo___block_invoke_2;
    v8[3] = &unk_1E5DC84A0;
    objc_copyWeak(&v10, &location);
    id v9 = *(id *)(a1 + 48);
    [v2 replacePresets:v5 onAssets:v4 async:0 progress:v6 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    double v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __33__PXEditBatchAction_performUndo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _syncUndoDidFinishWithResults:v6 didCancel:a3 completionHandler:*(void *)(a1 + 32)];
}

- (void)performAction:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  double v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXEditBatchAction.m", 74, @"Method %s is a responsibility of subclass %@", "-[PXEditBatchAction performAction:]", v8 object file lineNumber description];

  abort();
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXEditBatchAction *)self manager];
  int v9 = [v8 isBusyWithBatchAction];

  if (v9)
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Could not perform PXEditBatchAction: Edit manager is busy.", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PXEditBatchAction;
    [(PXAction *)&v11 executeWithUndoManager:v6 completionHandler:v7];
  }
}

- (PXEditBatchAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PXEditBatchAction;
  id v18 = [(PXEditBatchAction *)&v31 init];
  if (v18)
  {
    objc_initWeak(&location, v18);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke;
    v28[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v29, &location);
    [v14 setCancellationHandler:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke_2;
    v26[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v27, &location);
    [v15 setCancellationHandler:v26];
    objc_storeStrong((id *)&v18->_syncProgress, a4);
    objc_storeStrong((id *)&v18->_asyncProgress, a5);
    [v13 setAsyncLoadingStatusManager:v16];
    objc_storeStrong((id *)&v18->_manager, a3);
    dispatch_queue_t v19 = dispatch_queue_create("PXEditBatchAction", 0);
    actionQueue = v18->_actionQueue;
    v18->_actionQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v17, "count"));
    undoActionMap = v18->_undoActionMap;
    v18->_undoActionMap = (NSMutableDictionary *)v21;

    uint64_t v23 = [(PXEditBatchAction *)v18 prefetchOriginalMetadataForAssets:v17];
    assets = v18->_assets;
    v18->_assets = (NSArray *)v23;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

@end