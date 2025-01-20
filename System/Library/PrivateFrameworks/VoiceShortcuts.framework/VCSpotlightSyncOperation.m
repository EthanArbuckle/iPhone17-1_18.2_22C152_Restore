@interface VCSpotlightSyncOperation
+ (void)_fillIdentifiersToRemove:(id *)a3 referencesToIndex:(id *)a4 withMaximumUpdatedItems:(int64_t)a5 references:(id)a6 localState:(id)a7;
- (BOOL)fullResync;
- (CSSearchableIndex)index;
- (NSDictionary)keyedReferences;
- (NSDictionary)referencesToIndex;
- (NSSet)identifiersToRemove;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (VCSpotlightState)localState;
- (VCSpotlightSyncOperation)init;
- (VCSpotlightSyncOperation)initWithModifiedReferences:(id)a3 inserted:(id)a4 removed:(id)a5 spotlightIndex:(id)a6 localState:(id)a7 transaction:(id)a8;
- (VCSpotlightSyncOperation)initWithReferences:(id)a3 forceFullResync:(BOOL)a4 spotlightIndex:(id)a5 localState:(id)a6 transaction:(id)a7;
- (VCSpotlightSyncOperationDelegate)delegate;
- (void)cleanupAndExitWithRequestToRelaunch:(BOOL)a3;
- (void)clearLocalStateAndExit;
- (void)deleteSpotlightFileAndCleanup;
- (void)indexSearchableItems;
- (void)saveLocalState;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation VCSpotlightSyncOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localState, 0);
  objc_storeStrong((id *)&self->_keyedReferences, 0);
  objc_storeStrong((id *)&self->_identifiersToRemove, 0);
  objc_storeStrong((id *)&self->_referencesToIndex, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VCSpotlightState)localState
{
  return self->_localState;
}

- (BOOL)fullResync
{
  return self->_fullResync;
}

- (NSDictionary)keyedReferences
{
  return self->_keyedReferences;
}

- (NSSet)identifiersToRemove
{
  return self->_identifiersToRemove;
}

- (NSDictionary)referencesToIndex
{
  return self->_referencesToIndex;
}

- (void)setDelegate:(id)a3
{
}

- (VCSpotlightSyncOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VCSpotlightSyncOperationDelegate *)WeakRetained;
}

- (void)cleanupAndExitWithRequestToRelaunch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = [(VCSpotlightSyncOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = @"NO";
    if (v3) {
      v7 = @"YES";
    }
    int v9 = 136315394;
    v10 = "-[VCSpotlightSyncOperation cleanupAndExitWithRequestToRelaunch:]";
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Cleaned up with request to relaunch: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = [(VCSpotlightSyncOperation *)self delegate];
  [v8 syncOperationFinishedWithRequestToRelaunch:v3];
}

- (void)deleteSpotlightFileAndCleanup
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSpotlightSyncOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = VCLocalSpotlightStateFileURL();
  v5 = [v4 path];
  v6 = INRemoveItemAtPath();

  v7 = getWFSpotlightSyncLogObject();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[VCSpotlightSyncOperation deleteSpotlightFileAndCleanup]";
      __int16 v15 = 2114;
      v16 = v6;
      int v9 = "%s Error clearing local state: (%{public}@)";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = "-[VCSpotlightSyncOperation deleteSpotlightFileAndCleanup]";
    int v9 = "%s Cleared local state.";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  [(VCSpotlightSyncOperation *)self cleanupAndExitWithRequestToRelaunch:0];
}

- (void)clearLocalStateAndExit
{
  BOOL v3 = [(VCSpotlightSyncOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(VCSpotlightSyncOperation *)self index];
  v5 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke;
  v6[3] = &unk_1E6541478;
  v6[4] = self;
  [v4 endIndexBatchWithClientState:v5 completionHandler:v6];
}

void __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke_2;
  v7[3] = &unk_1E6541F68;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__VCSpotlightSyncOperation_clearLocalStateAndExit__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 136315394;
      id v6 = "-[VCSpotlightSyncOperation clearLocalStateAndExit]_block_invoke_2";
      __int16 v7 = 2114;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Error ending index batch with empty client state: (%{public}@)", (uint8_t *)&v5, 0x16u);
    }
  }
  return [*(id *)(a1 + 40) deleteSpotlightFileAndCleanup];
}

- (void)saveLocalState
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCSpotlightSyncOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEBUG, "%s Preparing to save local state to disk", buf, 0xCu);
  }

  if ([(VCSpotlightSyncOperation *)self fullResync])
  {
    int v5 = objc_opt_new();
  }
  else
  {
    int v5 = [(VCSpotlightSyncOperation *)self localState];
  }
  id v6 = v5;
  __int16 v7 = [v5 syncedShortcuts];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (![(VCSpotlightSyncOperation *)self fullResync])
  {
    uint64_t v9 = [(VCSpotlightSyncOperation *)self identifiersToRemove];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke;
    v35[3] = &unk_1E6540A98;
    id v36 = v8;
    [v9 enumerateObjectsUsingBlock:v35];
  }
  v10 = [(VCSpotlightSyncOperation *)self referencesToIndex];
  os_log_type_t v11 = [v10 allValues];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2;
  v33[3] = &unk_1E6540AC0;
  id v12 = v8;
  id v34 = v12;
  [v11 enumerateObjectsUsingBlock:v33];

  int v13 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEBUG, "%s Generated synced shortcut mapping", buf, 0xCu);
  }

  v14 = [MEMORY[0x1E4F29128] UUID];
  [v14 getUUIDBytes:buf];

  uint64_t v15 = *(void *)buf;
  v16 = [[VCSpotlightState alloc] initWithIdentifier:*(void *)buf syncedShortcuts:v12];
  uint64_t v17 = VCLocalSpotlightStateFileURL();
  v18 = [v17 path];
  id v32 = 0;
  BOOL v19 = [(VCSpotlightState *)v16 saveToPath:v18 error:&v32];
  id v20 = v32;

  v21 = getWFSpotlightSyncLogObject();
  v22 = v21;
  if (v19)
  {
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    v23 = "%s Saved local state to disk";
    v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    uint32_t v26 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    __int16 v38 = 2112;
    id v39 = v20;
    v23 = "%s Could not save local state to disk. Spotlight syncing will give up until new changes come in. We'll try again then. %@";
    v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_FAULT;
    uint32_t v26 = 22;
  }
  _os_log_impl(&dword_1C7D7E000, v24, v25, v23, buf, v26);
LABEL_16:

  *(void *)buf = v15;
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:buf length:8];
  v28 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[VCSpotlightSyncOperation saveLocalState]";
    _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_DEBUG, "%s Generated client state to end batch", buf, 0xCu);
  }

  v29 = [(VCSpotlightSyncOperation *)self index];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_183;
  v30[3] = &unk_1E6540AE8;
  v30[4] = self;
  BOOL v31 = v19;
  [v29 endIndexBatchWithClientState:v27 completionHandler:v30];
}

uint64_t __42__VCSpotlightSyncOperation_saveLocalState__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

void __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "spotlightHash"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 identifier];

  [v2 setObject:v6 forKey:v5];
}

void __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_183(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2_184;
  block[3] = &unk_1E6541330;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  char v10 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __42__VCSpotlightSyncOperation_saveLocalState__block_invoke_2_184(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = getWFSpotlightSyncLogObject();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 136315394;
      id v12 = "-[VCSpotlightSyncOperation saveLocalState]_block_invoke_2";
      __int16 v13 = 2114;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Error ending index batch with client state: (%{public}@)", (uint8_t *)&v11, 0x16u);
    }

    return [*(id *)(a1 + 40) deleteSpotlightFileAndCleanup];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[VCSpotlightSyncOperation saveLocalState]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Ended index batch", (uint8_t *)&v11, 0xCu);
    }

    __int16 v7 = [*(id *)(a1 + 40) referencesToIndex];
    unint64_t v8 = [v7 count];

    if (*(unsigned char *)(a1 + 48)) {
      BOOL v9 = v8 > 9;
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = v9;
    return [*(id *)(a1 + 40) cleanupAndExitWithRequestToRelaunch:v10];
  }
}

- (void)indexSearchableItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCSpotlightSyncOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(VCSpotlightSyncOperation *)self referencesToIndex];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[VCSpotlightSyncOperation indexSearchableItems]";
    __int16 v16 = 2048;
    uint64_t v17 = [v5 count];
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s indexSearchableItems called with (%lu) items to index", buf, 0x16u);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4FB4A60]);
  __int16 v7 = [(VCSpotlightSyncOperation *)self referencesToIndex];
  unint64_t v8 = [v7 allValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke;
  v11[3] = &unk_1E6540A48;
  id v12 = v6;
  __int16 v13 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_177;
  v10[3] = &unk_1E6540A70;
  v10[4] = self;
  id v9 = v6;
  objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v11, v10);
}

void __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  unint64_t v8 = (void *)MEMORY[0x1C87C4C10]();
  id v9 = [v6 identifier];
  uint64_t v10 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s > generating searchable item for reference %@", buf, 0x16u);
  }

  int v11 = [v6 searchableItemRepresentationWithIconDrawerContext:*(void *)(a1 + 32)];
  if (v11)
  {
    id v12 = [*(id *)(a1 + 40) index];
    uint64_t v18 = v11;
    __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v12 indexSearchableItems:v13 completionHandler:v7];

    uint64_t v14 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      __int16 v21 = 2112;
      v22 = v9;
      uint64_t v15 = "%s + indexed searchable item for reference %@";
      __int16 v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1C7D7E000, v16, v17, v15, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      __int16 v21 = 2112;
      v22 = v9;
      uint64_t v15 = "%s ! no item generated for reference %@";
      __int16 v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_FAULT;
      goto LABEL_8;
    }
  }
}

void __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_2;
  block[3] = &unk_1E6540EC0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __48__VCSpotlightSyncOperation_indexSearchableItems__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = getWFSpotlightSyncLogObject();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 136315394;
      __int16 v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke_2";
      __int16 v14 = 2114;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Error indexing items: (%{public}@)", (uint8_t *)&v12, 0x16u);
    }

    return [*(id *)(a1 + 40) clearLocalStateAndExit];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v12 = 136315394;
      __int16 v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Successfully indexed (%lu) new items.", (uint8_t *)&v12, 0x16u);
    }

    unint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) referencesToIndex];
    unint64_t v10 = [v9 count];

    if (v8 < v10)
    {
      uint64_t v11 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        __int16 v13 = "-[VCSpotlightSyncOperation indexSearchableItems]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s We seemed to have dropped some references. No errors, so continuing: check logs to see what references were dropped", (uint8_t *)&v12, 0xCu);
      }
    }
    return [*(id *)(a1 + 40) saveLocalState];
  }
}

- (void)start
{
  id v3 = [(VCSpotlightSyncOperation *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCSpotlightSyncOperation_start__block_invoke;
  block[3] = &unk_1E65420F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __33__VCSpotlightSyncOperation_start__block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__VCSpotlightSyncOperation_start__block_invoke_2;
  aBlock[3] = &unk_1E6541478;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = [*(id *)(a1 + 32) index];
  [v3 beginIndexBatch];

  int v4 = [*(id *)(a1 + 32) fullResync];
  uint64_t v5 = getWFSpotlightSyncLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[VCSpotlightSyncOperation start]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Unindexing all Shortcuts from index.", buf, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 32) index];
    v17[0] = *MEMORY[0x1E4FB4C00];
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 deleteSearchableItemsWithDomainIdentifiers:v8 completionHandler:v2];
  }
  else
  {
    if (v6)
    {
      id v9 = [*(id *)(a1 + 32) identifiersToRemove];
      uint64_t v10 = [v9 count];
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[VCSpotlightSyncOperation start]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Unindexing (%lu) shortcuts from spotlight index.", buf, 0x16u);
    }
    uint64_t v7 = [*(id *)(a1 + 32) index];
    unint64_t v8 = [*(id *)(a1 + 32) identifiersToRemove];
    uint64_t v11 = [v8 allObjects];
    [v7 deleteSearchableItemsWithIdentifiers:v11 completionHandler:v2];
  }
}

void __33__VCSpotlightSyncOperation_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__VCSpotlightSyncOperation_start__block_invoke_3;
  v7[3] = &unk_1E6541F68;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __33__VCSpotlightSyncOperation_start__block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = getWFSpotlightSyncLogObject();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[VCSpotlightSyncOperation start]_block_invoke_3";
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Error unindexing items: (%{public}@)", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1 + 40) clearLocalStateAndExit];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[VCSpotlightSyncOperation start]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Successfully unindexed items from Spotlight", (uint8_t *)&v7, 0xCu);
    }

    return [*(id *)(a1 + 40) indexSearchableItems];
  }
}

- (VCSpotlightSyncOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCSpotlightSyncOperation;
  uint64_t v2 = [(VCSpotlightSyncOperation *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.VoiceShortcuts.SpotlightSyncOperation", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    int v7 = v2;
  }

  return v2;
}

- (VCSpotlightSyncOperation)initWithModifiedReferences:(id)a3 inserted:(id)a4 removed:(id)a5 spotlightIndex:(id)a6 localState:(id)a7 transaction:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(VCSpotlightSyncOperation *)self init];
  if (v20)
  {
    id v44 = v19;
    id v45 = v18;
    id v46 = v17;
    obuint64_t j = a8;
    v50 = v15;
    id v48 = v16;
    uint64_t v21 = [v16 valueForKeyPath:@"identifier"];
    identifiersToRemove = v20->_identifiersToRemove;
    v20->_identifiersToRemove = (NSSet *)v21;

    uint64_t v23 = (NSDictionary *)objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v49 = v14;
    id v24 = v14;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v30 = [v29 identifier];
          [(NSDictionary *)v23 setObject:v29 forKey:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v26);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v31 = v50;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v37 = [v36 identifier];
          [(NSDictionary *)v23 setObject:v36 forKey:v37];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v33);
    }

    keyedReferences = v20->_keyedReferences;
    v20->_keyedReferences = v23;
    id v39 = v23;

    uint64_t v40 = [(NSDictionary *)v39 copy];
    referencesToIndex = v20->_referencesToIndex;
    v20->_referencesToIndex = (NSDictionary *)v40;

    v20->_fullResync = 0;
    objc_storeStrong((id *)&v20->_index, a6);
    objc_storeStrong((id *)&v20->_localState, a7);
    objc_storeStrong((id *)&v20->_transaction, obj);

    v42 = v20;
    id v14 = v49;
    id v15 = v50;
    id v16 = v48;
    id v18 = v45;
    id v17 = v46;
    id v19 = v44;
  }

  return v20;
}

- (VCSpotlightSyncOperation)initWithReferences:(id)a3 forceFullResync:(BOOL)a4 spotlightIndex:(id)a5 localState:(id)a6 transaction:(id)a7
{
  BOOL v10 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(VCSpotlightSyncOperation *)self init];
  if (v16)
  {
    id v28 = v15;
    if (v10)
    {
      id v17 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v34 = "-[VCSpotlightSyncOperation initWithReferences:forceFullResync:spotlightIndex:localState:transaction:]";
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEBUG, "%s Invoking full resync", buf, 0xCu);
      }

      id v14 = 0;
    }
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    id v19 = objc_msgSend(v12, "valueForKey:", @"identifier", v28, v13);
    id v20 = [v18 dictionaryWithObjects:v12 forKeys:v19];

    id v31 = 0;
    id v32 = 0;
    [(id)objc_opt_class() _fillIdentifiersToRemove:&v32 referencesToIndex:&v31 withMaximumUpdatedItems:10 references:v20 localState:v14];
    id v21 = v32;
    id v22 = v32;
    id v23 = v31;
    id v24 = v31;
    if ([v22 count] || objc_msgSend(v24, "count"))
    {
      objc_storeStrong((id *)&v16->_identifiersToRemove, v21);
      objc_storeStrong((id *)&v16->_referencesToIndex, v23);
      objc_storeStrong((id *)&v16->_keyedReferences, v20);
      v16->_fullResync = v14 == 0;
      objc_storeStrong((id *)&v16->_index, a5);
      objc_storeStrong((id *)&v16->_localState, v14);
      objc_storeStrong((id *)&v16->_transaction, a7);
      uint64_t v25 = v16;
    }
    else
    {
      uint64_t v27 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v34 = "-[VCSpotlightSyncOperation initWithReferences:forceFullResync:spotlightIndex:localState:transaction:]";
        _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_INFO, "%s Found no items to update, terminating sync early", buf, 0xCu);
      }

      uint64_t v25 = 0;
    }
    id v15 = v29;
    id v13 = v30;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (void)_fillIdentifiersToRemove:(id *)a3 referencesToIndex:(id *)a4 withMaximumUpdatedItems:(int64_t)a5 references:(id)a6 localState:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  id v13 = objc_opt_new();
  id v14 = objc_opt_new();
  id v35 = v11;
  if (v12)
  {
    id v15 = (void *)[v11 mutableCopy];
    id v16 = [v12 syncedShortcuts];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke;
    v38[3] = &unk_1E6540B10;
    id v39 = v15;
    id v17 = v13;
    id v40 = v17;
    id v18 = v14;
    id v41 = v18;
    id v19 = v15;
    [v16 enumerateKeysAndObjectsUsingBlock:v38];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke_2;
    v36[3] = &unk_1E6540B38;
    id v20 = v18;
    id v37 = v20;
    [v19 enumerateKeysAndObjectsUsingBlock:v36];
    *a3 = (id)[v17 copy];
    id v21 = v35;
    *a4 = (id)[v20 copy];
  }
  else
  {
    uint64_t v33 = a4;
    uint64_t v34 = v13;
    id v22 = [v11 allValues];
    unint64_t v23 = [v11 count];
    if (v23 >= a5) {
      int64_t v24 = a5;
    }
    else {
      int64_t v24 = v23;
    }
    uint64_t v25 = objc_msgSend(v22, "subarrayWithRange:", 0, v24);

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v25;
    uint64_t v26 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v19);
          }
          v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v31 = (void *)MEMORY[0x1C87C4C10]();
          id v32 = [v30 identifier];
          [v14 setValue:v30 forKey:v32];
        }
        uint64_t v27 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v27);
    }

    id v13 = v34;
    *a3 = (id)[v34 copy];
    id v12 = 0;
    *uint64_t v33 = (id)[v14 copy];
    id v21 = v35;
  }
}

void __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke(id *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1C87C4C10]();
  int v7 = [a1[4] objectForKey:v9];
  if (v7)
  {
    [a1[4] removeObjectForKey:v9];
    if ((unint64_t)[a1[6] count] <= 9)
    {
      uint64_t v8 = [v7 spotlightHash];
      if (v8 != [v5 unsignedLongLongValue]) {
        [a1[6] setObject:v7 forKey:v9];
      }
    }
  }
  else
  {
    [a1[5] addObject:v9];
  }
}

void __117__VCSpotlightSyncOperation__fillIdentifiersToRemove_referencesToIndex_withMaximumUpdatedItems_references_localState___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1C87C4C10]();
  if ((unint64_t)[*(id *)(a1 + 32) count] < 0xA) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v9];
  }
  else {
    *a4 = 1;
  }
}

@end