@interface _UIDataTransferMonitor
- (BOOL)suppressEventsUntilRequested;
- (NSArray)outstandingRequests;
- (NSProgress)progress;
- (_UIDataTransferMonitor)init;
- (_UIDataTransferMonitorDelegate)delegate;
- (unint64_t)outstandingItemsCount;
- (unint64_t)totalItemsCount;
- (void)_transferQueue_recomputeMasterProgress;
- (void)_transferQueue_scheduleBeganCallback;
- (void)_transferQueue_scheduleFinishedCallback;
- (void)_transferQueue_sendBeganCallback;
- (void)_transferQueue_sendFinishedCallback;
- (void)cancelOutstandingRequests;
- (void)dealloc;
- (void)itemProvider:(id)a3 beganDataTransferTransactionUUID:(id)a4 progress:(id)a5;
- (void)itemProvider:(id)a3 finishedDataTransferTransactionUUID:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendDelegateEventsIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setSuppressEventsUntilRequested:(BOOL)a3;
@end

@implementation _UIDataTransferMonitor

- (_UIDataTransferMonitor)init
{
  v20.receiver = self;
  v20.super_class = (Class)_UIDataTransferMonitor;
  v2 = [(_UIDataTransferMonitor *)&v20 init];
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
    v16 = __30___UIDataTransferMonitor_init__block_invoke;
    v17 = &unk_1E52DC308;
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

- (void)setSuppressEventsUntilRequested:(BOOL)a3
{
  uint64_t v5 = _transferQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___UIDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
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
  v5[2] = __54___UIDataTransferMonitor_suppressEventsUntilRequested__block_invoke;
  v5[3] = &unk_1E52E3210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)_transferQueue_scheduleBeganCallback
{
  if (self->_transferQueue_suppressEventsUntilRequested)
  {
    self->_transferQueue_shouldSendBeganCallback = 1;
  }
  else if (!self->_transferQueue_hasSentBeganCallback)
  {
    [(_UIDataTransferMonitor *)self _transferQueue_sendBeganCallback];
  }
}

- (void)_transferQueue_sendBeganCallback
{
  self->_transferQueue_hasSentBeganCallback = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58___UIDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  _dispatchCallback(v2);
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
      [(_UIDataTransferMonitor *)self _transferQueue_scheduleBeganCallback];
    }
    if (!self->_transferQueue_hasSentFinishedCallback)
    {
      [(_UIDataTransferMonitor *)self _transferQueue_sendFinishedCallback];
    }
  }
}

- (void)_transferQueue_sendFinishedCallback
{
  self->_transferQueue_hasSentFinishedCallback = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61___UIDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  _dispatchCallback(v2);
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
  v6[2] = __41___UIDataTransferMonitor_totalItemsCount__block_invoke;
  v6[3] = &unk_1E52E3210;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)sendDelegateEventsIfNeeded
{
  uint64_t v3 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___UIDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSProgress)progress
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__74;
  uint64_t v11 = __Block_byref_object_dispose__74;
  id v12 = 0;
  uint64_t v3 = _transferQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34___UIDataTransferMonitor_progress__block_invoke;
  v6[3] = &unk_1E52E3210;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSProgress *)v4;
}

- (void)cancelOutstandingRequests
{
  uint64_t v3 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___UIDataTransferMonitor_cancelOutstandingRequests__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)itemProvider:(id)a3 beganDataTransferTransactionUUID:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v11 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___UIDataTransferMonitor_itemProvider_beganDataTransferTransactionUUID_progress___block_invoke;
  block[3] = &unk_1E52EC510;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  v19 = self;
  objc_super v20 = &v21;
  dispatch_sync(v11, block);

  [(_UIDataTransferMonitor *)self willChangeValueForKey:@"outstandingItemsCount"];
  self->_outstandingItemsCount = v22[3];
  [(_UIDataTransferMonitor *)self didChangeValueForKey:@"outstandingItemsCount"];

  _Block_object_dispose(&v21, 8);
}

- (void)_transferQueue_recomputeMasterProgress
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_transferQueue_childProgresses count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_transferQueue_childProgresses;
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

  uint64_t v11 = self->_transferQueue_masterProgress;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64___UIDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke;
  v13[3] = &unk_1E52DD178;
  id v14 = v11;
  uint64_t v15 = 100 * v3;
  double v16 = v8;
  id v12 = v11;
  _dispatchCallback(v13);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [v8 isEqualToString:@"fractionCompleted"])
  {
    uint64_t v11 = _transferQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73___UIDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)itemProvider:(id)a3 finishedDataTransferTransactionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v8 = _transferQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke;
  block[3] = &unk_1E52EB8B0;
  long long v17 = &v23;
  void block[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  long long v18 = &v19;
  dispatch_sync(v8, block);

  uint64_t v11 = v24[3];
  if (v11 != v20[3])
  {
    [(_UIDataTransferMonitor *)self willChangeValueForKey:@"outstandingItemsCount"];
    self->_outstandingItemsCount = v20[3];
    [(_UIDataTransferMonitor *)self didChangeValueForKey:@"outstandingItemsCount"];
    uint64_t v11 = v24[3];
  }
  if (v11 && !v20[3])
  {
    id v12 = _transferQueue();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke_2;
    v13[3] = &unk_1E52D9F70;
    void v13[4] = self;
    dispatch_sync(v12, v13);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_transferQueue_requestsBySourceItemUUID count])
  {
    uint64_t v3 = objc_opt_class();
    NSLog(&cfstr_ErrorWasDeallo.isa, v3);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_transferQueue_requestsBySourceItemUUID;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(NSMutableDictionary *)self->_transferQueue_requestsBySourceItemUUID objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v7)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) progress];
              [v13 removeObserver:self forKeyPath:@"fractionCompleted"];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UIDataTransferMonitor;
  [(_UIDataTransferMonitor *)&v15 dealloc];
}

- (_UIDataTransferMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDataTransferMonitorDelegate *)WeakRetained;
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