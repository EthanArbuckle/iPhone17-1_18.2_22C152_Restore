@interface PBItemCollectionServicer
+ (id)newServicerForConnection:(id)a3 itemCollection:(id)a4;
- (PBItemCollection)itemCollection;
- (PBItemCollectionServicer)initWithConnection:(id)a3 itemCollection:(id)a4;
- (void)callCleanupBlockWithUUID:(id)a3;
- (void)helloCompletionBlock:(id)a3;
- (void)loadRepresentationForItemAtIndex:(unint64_t)a3 type:(id)a4 completionBlock:(id)a5;
- (void)setItemCollection:(id)a3;
- (void)waitForItemRequestsDeliveryCompletion:(id)a3;
@end

@implementation PBItemCollectionServicer

+ (id)newServicerForConnection:(id)a3 itemCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PBItemCollectionServicer alloc] initWithConnection:v6 itemCollection:v5];

  return v7;
}

- (PBItemCollectionServicer)initWithConnection:(id)a3 itemCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBItemCollectionServicer;
  v8 = [(PBItemCollectionServicer *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemCollection, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    cleanupQueue_cleanupHandlerByUUID = v9->_cleanupQueue_cleanupHandlerByUUID;
    v9->_cleanupQueue_cleanupHandlerByUUID = (NSMutableDictionary *)v10;

    [v6 setExportedObject:v9];
    v12 = PBNewDataProviderXPCInterface();
    [v6 setExportedInterface:v12];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke;
    v14[3] = &unk_1E5555870;
    v15 = v9;
    [v6 setInvalidationHandler:v14];
  }
  return v9;
}

void __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v2, OS_LOG_TYPE_INFO, "PBItemCollectionServicer connection disconnected.", buf, 2u);
  }

  [*(id *)(a1 + 32) setItemCollection:0];
  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v3 = _cleanupQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke_2;
  block[3] = &unk_1E5555F30;
  objc_super v16 = buf;
  id v15 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);

  if ([*((id *)v18 + 5) count])
  {
    v4 = _PBLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [*((id *)v18 + 5) count];
      *(_DWORD *)v24 = 134217984;
      uint64_t v25 = v9;
      _os_log_debug_impl(&dword_18D208000, v4, OS_LOG_TYPE_DEBUG, "Calling %lu cleanup handlers because connection disconnected.", v24, 0xCu);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = *((id *)v18 + 5);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v23 count:16];
      }
      while (v6);
    }
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v5 removeAllObjects];
}

- (void)helloCompletionBlock:(id)a3
{
}

- (void)loadRepresentationForItemAtIndex:(unint64_t)a3 type:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  long long v11 = [(PBItemCollectionServicer *)self itemCollection];
  long long v12 = [v11 items];
  unint64_t v13 = [v12 count];

  if (v13 > a3)
  {
    id v14 = [(PBItemCollectionServicer *)self itemCollection];
    if (!v14)
    {
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__2;
    v38 = __Block_byref_object_dispose__2;
    v39 = 0;
    id v15 = [(PBItemCollectionServicer *)self itemCollection];
    int v16 = [v15 isGeneralPasteboard];

    if (v16)
    {
      dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
      v18 = (void *)v35[5];
      v35[5] = (uint64_t)v17;

      dispatch_source_set_event_handler((dispatch_source_t)v35[5], &__block_literal_global_4);
      uint64_t v19 = v35[5];
      dispatch_time_t v20 = dispatch_time(0, 500000000);
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_activate((dispatch_object_t)v35[5]);
    }
    v21 = [v14 items];
    id v22 = [v21 objectAtIndexedSubscript:a3];

    v23 = [v22 representationConformingToType:v8];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_4;
    v28[3] = &unk_1E55563E0;
    v33 = &v34;
    id v24 = v22;
    id v29 = v24;
    id v30 = v8;
    v31 = self;
    id v32 = v9;
    uint64_t v25 = [v23 loadWithCompletionHandler:v28];
    [v10 addChild:v25 withPendingUnitCount:100];

    _Block_object_dispose(&v34, 8);
    uint64_t v26 = v39;
LABEL_8:

    goto LABEL_9;
  }
  if (v9)
  {
    v27 = PBIndexOutOfRangeError(a3, 0);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke;
    v40[3] = &unk_1E5555FF8;
    id v41 = v27;
    id v42 = v9;
    id v14 = v27;
    PBDispatchAsyncCallback(v40);

    uint64_t v26 = v42;
    goto LABEL_8;
  }
LABEL_10:
}

uint64_t __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32), 0);
}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2()
{
  v0 = _PBLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_18D208000, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF PASTEBOARD: This application has failed to return data it promised for a pasteboard copy in a timely fashion and is now hanging other processes waiting to access the pasteboard.", v1, 2u);
  }
}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  long long v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v13)
  {
    dispatch_source_cancel(v13);
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
  int v16 = (void *)MEMORY[0x192F9AA30](v12);
  if ((unint64_t)[v9 length] > 0x100000)
  {
    dispatch_source_t v17 = CPTemporaryFileWithUniqueName();
    if (v17)
    {
      [v9 writeToURL:v17 atomically:0];
      v18 = [*(id *)(a1 + 32) metadata];
      uint64_t v19 = [v18 objectForKeyedSubscript:@"com.apple.Pasteboard.suggestedName"];

      dispatch_time_t v20 = *(void **)(a1 + 40);
      id v49 = 0;
      v50[0] = 0;
      uint64_t v36 = v19;
      uint64_t v21 = PBCloneURLToTemporaryFolder(v17, @"com.apple.Pasteboard", v20, v19, v50, &v49);
      id v22 = v50[0];
      id v23 = v49;
      if (v23)
      {
        uint64_t v24 = PBCannotCreateTemporaryFile(0, v23);
        uint64_t v25 = v11;
        id v35 = (id)v24;
      }
      else
      {
        id v35 = v11;
        uint64_t v26 = [[PBSecurityScopedURLWrapper alloc] initWithURL:v21 readonly:1];

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2_6;
        v46[3] = &unk_1E5555EE0;
        id v47 = v22;
        id v48 = v12;
        uint64_t v27 = MEMORY[0x192F9AA30](v46);

        uint64_t v25 = v47;
        int v16 = (void *)v27;
        long long v10 = v26;
      }
      v28 = v22;
      id v29 = (void *)v21;

      id v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v30 removeItemAtURL:v17 error:0];

      id v11 = v35;
    }

    id v9 = 0;
  }
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__2;
  v44 = __Block_byref_object_dispose__2;
  id v45 = 0;
  if (v16)
  {
    uint64_t v31 = [MEMORY[0x1E4F29128] UUID];
    id v32 = (void *)v41[5];
    v41[5] = v31;

    v33 = _cleanupQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_3;
    block[3] = &unk_1E55557F8;
    void block[4] = *(void *)(a1 + 48);
    v39 = &v40;
    id v38 = v16;
    dispatch_sync(v33, block);
  }
  uint64_t v34 = *(void *)(a1 + 56);
  if (v34) {
    (*(void (**)(uint64_t, id, PBSecurityScopedURLWrapper *, id, uint64_t))(v34 + 16))(v34, v9, v10, v11, v41[5]);
  }
  _Block_object_dispose(&v40, 8);
}

uint64_t __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2_6(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_3(void *a1)
{
  id v2 = (id)MEMORY[0x192F9AA30](a1[5]);
  [*(id *)(a1[4] + 8) setObject:v2 forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)callCleanupBlockWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = __Block_byref_object_copy__10;
  uint64_t v14 = __Block_byref_object_dispose__11;
  id v15 = 0;
  if (v4)
  {
    id v5 = _cleanupQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PBItemCollectionServicer_callCleanupBlockWithUUID___block_invoke;
    block[3] = &unk_1E5556250;
    id v9 = &v10;
    void block[4] = self;
    id v8 = v4;
    dispatch_sync(v5, block);

    uint64_t v6 = v11[5];
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __53__PBItemCollectionServicer_callCleanupBlockWithUUID___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = _PBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = a1[5];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_18D208000, v5, OS_LOG_TYPE_DEBUG, "Cleaup handler UUID %@ is not found.", (uint8_t *)&v8, 0xCu);
    }
  }
  return [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
}

- (void)waitForItemRequestsDeliveryCompletion:(id)a3
{
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_cleanupQueue_cleanupHandlerByUUID, 0);
}

@end