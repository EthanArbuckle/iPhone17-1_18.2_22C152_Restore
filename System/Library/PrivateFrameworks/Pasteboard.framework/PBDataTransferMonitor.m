@interface PBDataTransferMonitor
- (BOOL)suppressEventsUntilRequested;
- (NSArray)outstandingRequests;
- (NSProgress)progress;
- (PBDataTransferMonitor)init;
- (PBDataTransferMonitorDelegate)delegate;
- (unint64_t)outstandingItemsCount;
- (unint64_t)totalItemsCount;
- (void)_transferQueue_recomputeMasterProgress;
- (void)_transferQueue_scheduleBeganCallback;
- (void)_transferQueue_scheduleFinishedCallback;
- (void)_transferQueue_sendBeganCallback;
- (void)_transferQueue_sendFinishedCallback;
- (void)cancelOutstandingRequests;
- (void)dealloc;
- (void)itemCollection:(id)a3 item:(id)a4 representation:(id)a5 beganDataTransferWithProgress:(id)a6;
- (void)itemCollection:(id)a3 item:(id)a4 representationFinishedDataTransfer:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendDelegateEventsIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setSuppressEventsUntilRequested:(BOOL)a3;
@end

@implementation PBDataTransferMonitor

- (PBDataTransferMonitor)init
{
  v20.receiver = self;
  v20.super_class = (Class)PBDataTransferMonitor;
  v2 = [(PBDataTransferMonitor *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    transferQueue_requestsBySourceItemUUID = v2->_transferQueue_requestsBySourceItemUUID;
    v2->_transferQueue_requestsBySourceItemUUID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    transferQueue_requestsInProgress = v2->_transferQueue_requestsInProgress;
    v2->_transferQueue_requestsInProgress = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    transferQueue_allEncounteredItemUUIDs = v2->_transferQueue_allEncounteredItemUUIDs;
    v2->_transferQueue_allEncounteredItemUUIDs = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    transferQueue_masterProgress = v2->_transferQueue_masterProgress;
    v2->_transferQueue_masterProgress = (NSProgress *)v9;

    objc_initWeak(&location, v2);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __29__PBDataTransferMonitor_init__block_invoke;
    v17 = &unk_1E5556640;
    objc_copyWeak(&v18, &location);
    [(NSProgress *)v2->_transferQueue_masterProgress setCancellationHandler:&v14];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v14, v15, v16, v17);
    transferQueue_childProgresses = v2->_transferQueue_childProgresses;
    v2->_transferQueue_childProgresses = (NSMutableArray *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__PBDataTransferMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained cancelOutstandingRequests];
    id WeakRetained = v2;
  }
}

- (void)setSuppressEventsUntilRequested:(BOOL)a3
{
  uint64_t v5 = _transferQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PBDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke;
  v6[3] = &unk_1E5556578;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __57__PBDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)suppressEventsUntilRequested
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = _transferQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PBDataTransferMonitor_suppressEventsUntilRequested__block_invoke;
  v5[3] = &unk_1E5555F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__PBDataTransferMonitor_suppressEventsUntilRequested__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)_transferQueue_scheduleBeganCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendBeganCallback = 1;
  }
  else if (!self->_transferQueue_hasSentBeganCallback)
  {
    [(PBDataTransferMonitor *)self _transferQueue_sendBeganCallback];
  }
}

- (void)_transferQueue_sendBeganCallback
{
  self->_transferQueue_hasSentBeganCallback = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PBDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke;
  v2[3] = &unk_1E5555870;
  v2[4] = self;
  PBDispatchAsyncCallback(v2);
}

void __57__PBDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained dataTransferMonitorBeganTransfers:*(void *)(a1 + 32)];
}

- (void)_transferQueue_scheduleFinishedCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendFinishedCallback = 1;
  }
  else
  {
    if (!self->_transferQueue_hasSentBeganCallback) {
      [(PBDataTransferMonitor *)self _transferQueue_scheduleBeganCallback];
    }
    if (!self->_transferQueue_hasSentFinishedCallback)
    {
      [(PBDataTransferMonitor *)self _transferQueue_sendFinishedCallback];
    }
  }
}

- (void)_transferQueue_sendFinishedCallback
{
  self->_transferQueue_hasSentFinishedCallback = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__PBDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke;
  v2[3] = &unk_1E5555870;
  v2[4] = self;
  PBDispatchAsyncCallback(v2);
}

void __60__PBDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained dataTransferMonitorFinishedTransfers:*(void *)(a1 + 32)];
}

- (unint64_t)totalItemsCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = _transferQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PBDataTransferMonitor_totalItemsCount__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__PBDataTransferMonitor_totalItemsCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)sendDelegateEventsIfNeeded
{
  uint64_t v3 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PBDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_sync(v3, block);
}

unsigned char *__51__PBDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[26]) {
    return result;
  }
  if (result[25])
  {
    result[25] = 0;
    uint64_t result = (unsigned char *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendBeganCallback");
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(v3 + 28);
    unint64_t v4 = (unsigned char *)(v3 + 28);
    if (!v5) {
      return result;
    }
  }
  else
  {
    unint64_t v4 = result + 28;
    if (!result[28])
    {
      objc_msgSend(result, "_transferQueue_sendBeganCallback");
      goto LABEL_7;
    }
  }
  *unint64_t v4 = 0;
LABEL_7:
  uint64_t v6 = *(void **)(a1 + 32);
  return (unsigned char *)objc_msgSend(v6, "_transferQueue_sendFinishedCallback");
}

- (NSProgress)progress
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v3 = _transferQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PBDataTransferMonitor_progress__block_invoke;
  v6[3] = &unk_1E5555F30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSProgress *)v4;
}

void __33__PBDataTransferMonitor_progress__block_invoke(uint64_t a1)
{
}

- (void)cancelOutstandingRequests
{
  uint64_t v3 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PBDataTransferMonitor_cancelOutstandingRequests__block_invoke;
  block[3] = &unk_1E5555870;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __50__PBDataTransferMonitor_cancelOutstandingRequests__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "progress", (void)v7);
        [v6 cancel];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)itemCollection:(id)a3 item:(id)a4 representation:(id)a5 beganDataTransferWithProgress:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v14 = _transferQueue();
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __90__PBDataTransferMonitor_itemCollection_item_representation_beganDataTransferWithProgress___block_invoke;
  v22 = &unk_1E5556A68;
  id v15 = v10;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  v27 = self;
  v28 = &v29;
  dispatch_sync(v14, &v19);

  [(PBDataTransferMonitor *)self willChangeValueForKey:@"outstandingItemsCount", v19, v20, v21, v22];
  self->_outstandingItemsCount = v30[3];
  [(PBDataTransferMonitor *)self didChangeValueForKey:@"outstandingItemsCount"];

  _Block_object_dispose(&v29, 8);
}

void __90__PBDataTransferMonitor_itemCollection_item_representation_beganDataTransferWithProgress___block_invoke(uint64_t a1)
{
  uint64_t v4 = objc_alloc_init(PBDataTransferRequest);
  [(PBDataTransferRequest *)v4 setItemCollection:*(void *)(a1 + 32)];
  [(PBDataTransferRequest *)v4 setItem:*(void *)(a1 + 40)];
  [(PBDataTransferRequest *)v4 setRepr:*(void *)(a1 + 48)];
  [(PBDataTransferRequest *)v4 setProgress:*(void *)(a1 + 56)];
  uint64_t v2 = [*(id *)(a1 + 40) UUID];
  [*(id *)(*(void *)(a1 + 64) + 48) addObject:v2];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 64) + 8) objectForKeyedSubscript:v2];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(*(void *)(a1 + 64) + 8) setObject:v3 forKeyedSubscript:v2];
  }
  [v3 addObject:v4];
  [*(id *)(*(void *)(a1 + 64) + 16) addObject:v4];
  [*(id *)(*(void *)(a1 + 64) + 40) addObject:*(void *)(a1 + 56)];
  [*(id *)(a1 + 56) addObserver:*(void *)(a1 + 64) forKeyPath:@"fractionCompleted" options:1 context:0];
  objc_msgSend(*(id *)(a1 + 64), "_transferQueue_recomputeMasterProgress");
  objc_msgSend(*(id *)(a1 + 64), "_transferQueue_scheduleBeganCallback");
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(a1 + 64) + 8) count];
}

- (void)_transferQueue_recomputeMasterProgress
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_transferQueue_childProgresses count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_transferQueue_childProgresses;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) fractionCompleted];
        double v8 = v8 + v10;
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  id v11 = self->_transferQueue_masterProgress;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PBDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke;
  v13[3] = &unk_1E5556A90;
  uint64_t v14 = v11;
  uint64_t v15 = 100 * v3;
  double v16 = v8;
  id v12 = v11;
  PBDispatchAsyncCallback(v13);
}

uint64_t __63__PBDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalUnitCount:*(void *)(a1 + 40)];
  uint64_t v2 = (uint64_t)(*(double *)(a1 + 48) * 100.0);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [v8 isEqualToString:@"fractionCompleted"])
  {
    id v11 = _transferQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PBDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5555870;
    block[4] = self;
    dispatch_async(v11, block);
  }
}

uint64_t __72__PBDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_recomputeMasterProgress");
}

- (void)itemCollection:(id)a3 item:(id)a4 representationFinishedDataTransfer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v11 = _transferQueue();
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __80__PBDataTransferMonitor_itemCollection_item_representationFinishedDataTransfer___block_invoke;
  long long v19 = &unk_1E5556AB8;
  id v24 = &v30;
  long long v20 = self;
  id v12 = v9;
  id v21 = v12;
  id v13 = v8;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  id v25 = &v26;
  dispatch_sync(v11, &v16);

  uint64_t v15 = v31[3];
  if (v15 != v27[3])
  {
    [(PBDataTransferMonitor *)self willChangeValueForKey:@"outstandingItemsCount", v16, v17, v18, v19, v20, v21, v22];
    self->_outstandingItemsCount = v27[3];
    [(PBDataTransferMonitor *)self didChangeValueForKey:@"outstandingItemsCount"];
    uint64_t v15 = v31[3];
  }
  if (v15 && !v27[3]) {
    [(PBDataTransferMonitor *)self _transferQueue_scheduleFinishedCallback];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __80__PBDataTransferMonitor_itemCollection_item_representationFinishedDataTransfer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) count];
  id v17 = [*(id *)(a1 + 40) UUID];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:");
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  id v18 = v5;
  if ([v6 count])
  {
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [v6 objectAtIndex:v9];
      id v11 = [v10 itemCollection];
      if (![v11 isEqual:v7]) {
        goto LABEL_8;
      }
      id v12 = [v10 item];
      if (([v12 isEqual:v8] & 1) == 0) {
        break;
      }
      id v13 = [v10 repr];
      int v14 = [v13 isEqual:v18];

      if (v14)
      {

        goto LABEL_11;
      }
LABEL_9:

      if (++v9 >= (unint64_t)[v6 count]) {
        goto LABEL_10;
      }
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  uint64_t v15 = [v6 objectAtIndexedSubscript:v9];
  uint64_t v16 = [v15 progress];
  [v16 removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted"];

  [v6 removeObjectAtIndex:v9];
  if (![v6 count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v17];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v15];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count]) {
    objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) count];
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_transferQueue_requestsBySourceItemUUID count])
  {
    uint64_t v3 = _PBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v14 = v28;
      _os_log_fault_impl(&dword_18D208000, v3, OS_LOG_TYPE_FAULT, "ERROR: %@ was deallocated while data transfer was still in progress.", buf, 0xCu);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_transferQueue_requestsBySourceItemUUID;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(NSMutableDictionary *)self->_transferQueue_requestsBySourceItemUUID objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v7)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) progress];
              [v13 removeObserver:self forKeyPath:@"fractionCompleted"];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  v16.receiver = self;
  v16.super_class = (Class)PBDataTransferMonitor;
  [(PBDataTransferMonitor *)&v16 dealloc];
}

- (PBDataTransferMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBDataTransferMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)outstandingRequests
{
  return self->_outstandingRequests;
}

- (unint64_t)outstandingItemsCount
{
  return self->_outstandingItemsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferQueue_allEncounteredItemUUIDs, 0);
  objc_storeStrong((id *)&self->_transferQueue_childProgresses, 0);
  objc_storeStrong((id *)&self->_transferQueue_masterProgress, 0);
  objc_storeStrong((id *)&self->_transferQueue_requestsInProgress, 0);
  objc_storeStrong((id *)&self->_transferQueue_requestsBySourceItemUUID, 0);
}

@end