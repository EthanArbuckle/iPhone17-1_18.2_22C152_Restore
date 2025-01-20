@interface PXAssetEditOperationManager
+ (PXAssetEditOperationManager)sharedManager;
- (BOOL)canPerformEditOperationWithType:(id)a3 onAsset:(id)a4;
- (Class)_performerClassForEditOperationWithType:(id)a3 onAsset:(id)a4;
- (NSMapTable)observersWithContexts;
- (NSMutableDictionary)operationStatusByAsset;
- (NSMutableDictionary)pendingPerformersByAsset;
- (PXAssetEditOperationManager)init;
- (id)_performerForEditOperationWithType:(id)a3 onAsset:(id)a4;
- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 completionHandler:(id)a6;
- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 delay:(double)a6 completionHandler:(id)a7;
- (int64_t)editOperationStatusForAsset:(id)a3;
- (void)_addPendingPerformer:(id)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_enumeratePredicateRecordsWithBlock:(id)a3;
- (void)_handleCompletionOfPerformer:(id)a3 withSuccess:(BOOL)a4 error:(id)a5 externalCompletionHandler:(id)a6;
- (void)_removePendingPerformer:(id)a3;
- (void)_signalPendingPerformersChangeForAsset:(id)a3;
- (void)_signalStatusChangeForAsset:(id)a3;
- (void)_updateOperationStatusForAsset:(id)a3;
- (void)enumerateEditOperationsPerformedOnAsset:(id)a3 usingBlock:(id)a4;
- (void)registerObserver:(id)a3 context:(void *)a4;
- (void)registerPerformerClass:(Class)a3 withPredicate:(id)a4;
- (void)unregisterObserver:(id)a3 context:(void *)a4;
@end

@implementation PXAssetEditOperationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersWithContexts, 0);
  objc_storeStrong((id *)&self->_operationStatusByAsset, 0);
  objc_storeStrong((id *)&self->_pendingPerformersByAsset, 0);
  objc_storeStrong((id *)&self->_predicateRecords, 0);
}

- (NSMapTable)observersWithContexts
{
  return self->_observersWithContexts;
}

- (NSMutableDictionary)operationStatusByAsset
{
  return self->_operationStatusByAsset;
}

- (NSMutableDictionary)pendingPerformersByAsset
{
  return self->_pendingPerformersByAsset;
}

- (void)_handleCompletionOfPerformer:(id)a3 withSuccess:(BOOL)a4 error:(id)a5 externalCompletionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  px_dispatch_on_main_queue();
}

uint64_t __104__PXAssetEditOperationManager__handleCompletionOfPerformer_withSuccess_error_externalCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = [v2 asset];
    [v3 _updateOperationStatusForAsset:v4];

    [*(id *)(a1 + 40) _removePendingPerformer:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_signalPendingPerformersChangeForAsset:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXAssetEditOperationManager__signalPendingPerformersChangeForAsset___block_invoke;
  v6[3] = &unk_1E5DCF838;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXAssetEditOperationManager *)self _enumerateObserversUsingBlock:v6];
}

void __70__PXAssetEditOperationManager__signalPendingPerformersChangeForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    [v5 assetEditOperationManager:*(void *)(a1 + 32) didChangeEditOperationsPerformedOnAsset:*(void *)(a1 + 40) context:a3];
  }
}

- (void)_signalStatusChangeForAsset:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PXAssetEditOperationManager__signalStatusChangeForAsset___block_invoke;
  v6[3] = &unk_1E5DCF838;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXAssetEditOperationManager *)self _enumerateObserversUsingBlock:v6];
}

void __59__PXAssetEditOperationManager__signalStatusChangeForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    [v5 assetEditOperationManager:*(void *)(a1 + 32) didChangeEditOperationStatusForAsset:*(void *)(a1 + 40) context:a3];
  }
}

- (void)_updateOperationStatusForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PXAssetEditOperationManager__updateOperationStatusForAsset___block_invoke;
  v10[3] = &unk_1E5DCF810;
  v10[4] = &v11;
  [(PXAssetEditOperationManager *)self enumerateEditOperationsPerformedOnAsset:v4 usingBlock:v10];
  id v5 = [(PXAssetEditOperationManager *)self operationStatusByAsset];
  v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = v12[3];
  if (v7 != [v6 integerValue])
  {
    id v8 = [NSNumber numberWithInteger:v12[3]];
    id v9 = [(PXAssetEditOperationManager *)self operationStatusByAsset];
    [v9 setObject:v8 forKeyedSubscript:v4];

    [(PXAssetEditOperationManager *)self _signalStatusChangeForAsset:v4];
  }

  _Block_object_dispose(&v11, 8);
}

void __62__PXAssetEditOperationManager__updateOperationStatusForAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [v8 completedUnitCount];
  if (v4 >= [v8 totalUnitCount])
  {
    uint64_t v6 = 2;
  }
  else
  {
    int v5 = [v8 isCancelled];
    uint64_t v6 = 3;
    if (v5) {
      uint64_t v6 = 1;
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v7 + 24) > v6) {
    uint64_t v6 = *(void *)(v7 + 24);
  }
  *(void *)(v7 + 24) = v6;
}

- (void)_removePendingPerformer:(id)a3
{
  id v4 = a3;
  id v8 = [v4 asset];
  int v5 = [(PXAssetEditOperationManager *)self pendingPerformersByAsset];
  uint64_t v6 = [v5 objectForKeyedSubscript:v8];

  [v6 removeObject:v4];
  if (![v6 count])
  {
    uint64_t v7 = [(PXAssetEditOperationManager *)self pendingPerformersByAsset];
    [v7 removeObjectForKey:v8];
  }
  [(PXAssetEditOperationManager *)self _signalPendingPerformersChangeForAsset:v8];
}

- (void)_addPendingPerformer:(id)a3
{
  id v8 = a3;
  id v4 = [v8 asset];
  int v5 = [(PXAssetEditOperationManager *)self pendingPerformersByAsset];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = [(PXAssetEditOperationManager *)self pendingPerformersByAsset];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }
  [v6 addObject:v8];
  [(PXAssetEditOperationManager *)self _signalPendingPerformersChangeForAsset:v4];
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, unsigned __int8 *))a3;
  int v5 = [(PXAssetEditOperationManager *)self observersWithContexts];
  unsigned __int8 v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v5, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v5 objectForKey:v11];
        if ([v12 count])
        {
          uint64_t v13 = 0;
          while (1)
          {
            v4[2](v4, v11, [v12 pointerAtIndex:v13], &v19);
            if (v19) {
              break;
            }
            if (++v13 >= (unint64_t)[v12 count]) {
              goto LABEL_10;
            }
          }

          goto LABEL_15;
        }
LABEL_10:
        int v14 = v19;

        if (v14) {
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)unregisterObserver:(id)a3 context:(void *)a4
{
  id v13 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetEditOperationManager.m", 246, @"%s must be called on the main thread", "-[PXAssetEditOperationManager unregisterObserver:context:]");
  }
  uint64_t v7 = [(PXAssetEditOperationManager *)self observersWithContexts];
  uint64_t v8 = [v7 objectForKey:v13];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    while ((void *)[v8 pointerAtIndex:v11] != a4)
    {
      if (v10 == ++v11) {
        goto LABEL_9;
      }
    }
    [v8 removePointerAtIndex:v11];
  }
LABEL_9:
  if (v8 && ![v8 count]) {
    [v7 removeObjectForKey:v13];
  }
}

- (void)registerObserver:(id)a3 context:(void *)a4
{
  id v11 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetEditOperationManager.m", 235, @"%s must be called on the main thread", "-[PXAssetEditOperationManager registerObserver:context:]");
  }
  uint64_t v7 = [(PXAssetEditOperationManager *)self observersWithContexts];
  uint64_t v8 = [v7 objectForKey:v11];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:256];
    [v7 setObject:v9 forKey:v11];
  }
  [v9 addPointer:a4];
}

- (void)enumerateEditOperationsPerformedOnAsset:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetEditOperationManager.m", 223, @"%s must be called on the main thread", "-[PXAssetEditOperationManager enumerateEditOperationsPerformedOnAsset:usingBlock:]");

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    uint64_t v9 = [(PXAssetEditOperationManager *)self pendingPerformersByAsset];
    uint64_t v10 = [v9 objectForKeyedSubscript:v7];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PXAssetEditOperationManager_enumerateEditOperationsPerformedOnAsset_usingBlock___block_invoke;
    v12[3] = &unk_1E5DCF7E8;
    id v13 = v8;
    [v10 enumerateObjectsUsingBlock:v12];
  }
LABEL_4:
}

void __82__PXAssetEditOperationManager_enumerateEditOperationsPerformedOnAsset_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v8 = [v6 editOperationType];
  id v7 = [v6 progress];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v5 + 16))(v5, v8, v7, a4);
}

- (Class)_performerClassForEditOperationWithType:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PXAssetEditOperationManager__performerClassForEditOperationWithType_onAsset___block_invoke;
  v12[3] = &unk_1E5DCF7C0;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  long long v15 = &v16;
  [(PXAssetEditOperationManager *)self _enumeratePredicateRecordsWithBlock:v12];
  id v10 = (id)v17[3];

  _Block_object_dispose(&v16, 8);
  return (Class)v10;
}

void __79__PXAssetEditOperationManager__performerClassForEditOperationWithType_onAsset___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  uint64_t v5 = [v7 predicate];
  int v6 = v5[2](v5, a1[4], a1[5]);

  if (v6)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v7 performerClass];
    *a3 = 1;
  }
}

- (id)_performerForEditOperationWithType:(id)a3 onAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc(-[PXAssetEditOperationManager _performerClassForEditOperationWithType:onAsset:](self, "_performerClassForEditOperationWithType:onAsset:", v7, v6)), "initWithEditOperationType:asset:", v7, v6);

  return v8;
}

- (int64_t)editOperationStatusForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXAssetEditOperationManager *)self operationStatusByAsset];
  id v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (void)registerPerformerClass:(Class)a3 withPredicate:(id)a4
{
  id v6 = a4;
  int64_t v7 = [[_PXAssetEditOperationPredicateRecord alloc] initWithPerformerClass:a3 predicate:v6];

  os_unfair_lock_lock(&self->_predicateRecordsLock);
  [(NSMutableArray *)self->_predicateRecords addObject:v7];
  os_unfair_lock_unlock(&self->_predicateRecordsLock);
}

- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 delay:(double)a6 completionHandler:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([(PXAssetEditOperationManager *)self canPerformEditOperationWithType:v12 onAsset:v13]&& ([(PXAssetEditOperationManager *)self _performerForEditOperationWithType:v12 onAsset:v13], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(PXAssetEditOperationManager *)self _addPendingPerformer:v16];
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v16);
    id v17 = v12;
    id v18 = v13;
    [v17 hash];
    kdebug_trace();

    [(PXAssetEditOperationManager *)self _updateOperationStatusForAsset:v18];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5DCF798;
    id v19 = v16;
    id v33 = v19;
    id v34 = v14;
    v37[1] = v16;
    objc_copyWeak(&v36, (id *)location);
    objc_copyWeak(v37, &from);
    id v35 = v15;
    v20 = _Block_copy(aBlock);
    uint64_t v21 = v20;
    if (a6 <= 0.0)
    {
      (*((void (**)(void *))v20 + 2))(v20);
    }
    else
    {
      dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_3;
      v30 = &unk_1E5DD3128;
      id v31 = v21;
      dispatch_after(v22, MEMORY[0x1E4F14428], &v27);
    }
    objc_destroyWeak(v37);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v23 = PLUIGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v12;
      __int16 v40 = 2112;
      id v41 = v13;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "no performer found for edit operation with type %@ on asset %@", location, 0x16u);
    }

    v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photosuicore.PXAssetEditOperationManager" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v24);

    id v19 = 0;
  }
  v25 = objc_msgSend(v19, "progress", v27, v28, v29, v30);

  return v25;
}

void __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5DCF770;
  v7[1] = *(id *)(a1 + 72);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_copyWeak(v7, (id *)(a1 + 64));
  id v5 = *(id *)(a1 + 48);
  [v2 executeWithUndoManager:v3 completionHandler:v4];

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

uint64_t __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleCompletionOfPerformer:v6 withSuccess:a2 error:v5 externalCompletionHandler:*(void *)(a1 + 32)];
}

- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  return [(PXAssetEditOperationManager *)self performEditOperationWithType:a3 asset:a4 undoManager:a5 delay:a6 completionHandler:0.0];
}

- (void)_enumeratePredicateRecordsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  p_predicateRecordsLock = &self->_predicateRecordsLock;
  os_unfair_lock_lock(&self->_predicateRecordsLock);
  id v6 = (void *)[(NSMutableArray *)self->_predicateRecords copy];
  os_unfair_lock_unlock(p_predicateRecordsLock);
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11), &v16);
      if (v16) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)canPerformEditOperationWithType:(id)a3 onAsset:(id)a4
{
  return [(PXAssetEditOperationManager *)self _performerClassForEditOperationWithType:a3 onAsset:a4] != 0;
}

- (PXAssetEditOperationManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXAssetEditOperationManager;
  v2 = [(PXAssetEditOperationManager *)&v13 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_predicateRecordsLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    operationStatusByAsset = v3->_operationStatusByAsset;
    v3->_operationStatusByAsset = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingPerformersByAsset = v3->_pendingPerformersByAsset;
    v3->_pendingPerformersByAsset = v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observersWithContexts = v3->_observersWithContexts;
    v3->_observersWithContexts = (NSMapTable *)v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    predicateRecords = v3->_predicateRecords;
    v3->_predicateRecords = v10;

    if (objc_opt_respondsToSelector()) {
      [(PXAssetEditOperationManager *)v3 registerAdditionalPerformers];
    }
  }
  return v3;
}

+ (PXAssetEditOperationManager)sharedManager
{
  if (sharedManager_onceToken_274168 != -1) {
    dispatch_once(&sharedManager_onceToken_274168, &__block_literal_global_24_274169);
  }
  v2 = (void *)sharedManager_sharedManager_274170;
  return (PXAssetEditOperationManager *)v2;
}

void __44__PXAssetEditOperationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PXAssetEditOperationManager);
  v1 = (void *)sharedManager_sharedManager_274170;
  sharedManager_sharedManager_274170 = (uint64_t)v0;
}

@end