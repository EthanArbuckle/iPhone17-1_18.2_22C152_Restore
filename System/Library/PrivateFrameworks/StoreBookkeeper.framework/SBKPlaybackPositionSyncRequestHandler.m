@interface SBKPlaybackPositionSyncRequestHandler
- (BOOL)_shouldStop;
- (BOOL)_synchronize:(id *)a3;
- (BOOL)canceled;
- (BOOL)syncInProgress;
- (BOOL)transactionController:(id)a3 transactionDidFail:(id)a4 error:(id)a5;
- (NSError)fatalSyncError;
- (NSString)overrideSyncAnchor;
- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4;
- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4 accountIdentifier:(id)a5;
- (SBKTransactionController)kvsController;
- (SBKUniversalPlaybackPositionDataSource)dataSource;
- (id)_synchronouslyRunKVSTransaction:(id)a3;
- (id)currentKVSTransaction;
- (id)dataSourceTransactionContext;
- (id)metadataItemsToCommitToDataSource;
- (id)metadataItemsToCommitToKVSStorage;
- (id)newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:(id)a3 processConflicts:(BOOL)a4;
- (id)transaction:(id)a3 conflictDetectionOrdinalForKey:(id)a4;
- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4;
- (id)transaction:(id)a3 syncAnchorForTransactionSyncAnchor:(id)a4;
- (int)_mergeConflictedItemFromSyncResponse:(id)a3;
- (void)_dataSourceCancelTransaction;
- (void)_mergeMetadataItemsFromSyncResponse;
- (void)_signalKVSTransactionCompletion:(id)a3;
- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)clearTransactionResponseData;
- (void)setCanceled:(BOOL)a3;
- (void)setCurrentKVSTransaction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceTransactionContext:(id)a3;
- (void)setFatalSyncError:(id)a3;
- (void)setKvsController:(id)a3;
- (void)setMetadataItemsToCommitToDataSource:(id)a3;
- (void)setMetadataItemsToCommitToKVSStorage:(id)a3;
- (void)setOverrideSyncAnchor:(id)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)synchronizeWithCompletionHandler:(id)a3;
- (void)timeout;
- (void)transaction:(id)a3 didProcessResponseData:(id)a4;
- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5;
- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7;
- (void)transaction:(id)a3 willProcessResponseData:(id)a4;
- (void)transactionController:(id)a3 transactionDidCancel:(id)a4 error:(id)a5;
- (void)transactionController:(id)a3 transactionDidFinish:(id)a4;
@end

@implementation SBKPlaybackPositionSyncRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSyncAnchor, 0);
  objc_storeStrong((id *)&self->_fatalSyncError, 0);
  objc_storeStrong((id *)&self->_kvsController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_responseMetadataItemsMergedToCommitBackToKVSStorage, 0);
  objc_storeStrong((id *)&self->_responseMetadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_currentKVSTransaction, 0);
  objc_storeStrong((id *)&self->_dataSourceTransactionContext, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOverrideSyncAnchor:(id)a3
{
}

- (NSString)overrideSyncAnchor
{
  return self->_overrideSyncAnchor;
}

- (void)setFatalSyncError:(id)a3
{
}

- (NSError)fatalSyncError
{
  return self->_fatalSyncError;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setKvsController:(id)a3
{
}

- (SBKTransactionController)kvsController
{
  return self->_kvsController;
}

- (void)setDataSource:(id)a3
{
}

- (SBKUniversalPlaybackPositionDataSource)dataSource
{
  return self->_dataSource;
}

- (id)transaction:(id)a3 conflictDetectionOrdinalForKey:(id)a4
{
  id v5 = a4;
  v6 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
  v7 = [v6 objectForKey:v5];

  v8 = NSNumber;
  [v7 timestamp];
  v9 = objc_msgSend(v8, "numberWithDouble:");

  return v9;
}

- (id)transaction:(id)a3 syncAnchorForTransactionSyncAnchor:(id)a4
{
  id v5 = a4;
  v6 = v5;
  overrideSyncAnchor = self->_overrideSyncAnchor;
  if (!overrideSyncAnchor) {
    overrideSyncAnchor = (NSString *)v5;
  }
  v8 = overrideSyncAnchor;

  return v8;
}

- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4
{
  id v5 = a4;
  v6 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
  v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  [(SBKSyncRequestHandler *)&v5 transaction:a3 processDeletedKey:a4 isDirty:a5];
}

- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  [(SBKSyncRequestHandler *)&v19 transaction:a3 processUpdatedKey:v12 data:v13 conflict:v8 isDirty:a7];
  *a7 = 0;
  if (![(SBKPlaybackPositionSyncRequestHandler *)self _shouldStop])
  {
    uint64_t v14 = +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:v12 keyValueStorePayload:v13];
    v15 = (void *)v14;
    if (v8)
    {
      if (v14) {
        [(SBKPlaybackPositionSyncRequestHandler *)self _mergeConflictedItemFromSyncResponse:v14];
      }
    }
    else if (v14)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      responseMetadataItemsToCommitToDataSource = self->_responseMetadataItemsToCommitToDataSource;
      v18 = [v15 itemIdentifier];
      [(NSMutableDictionary *)responseMetadataItemsToCommitToDataSource setObject:v15 forKey:v18];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)transaction:(id)a3 didProcessResponseData:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  [(SBKSyncRequestHandler *)&v4 transaction:a3 didProcessResponseData:a4];
}

- (void)transaction:(id)a3 willProcessResponseData:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  [(SBKSyncRequestHandler *)&v4 transaction:a3 willProcessResponseData:a4];
}

- (void)transactionController:(id)a3 transactionDidFinish:(id)a4
{
}

- (void)transactionController:(id)a3 transactionDidCancel:(id)a4 error:(id)a5
{
}

- (BOOL)transactionController:(id)a3 transactionDidFail:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if ([v8 isAccountsChangedError])
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v7 syncAnchor];
      int v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_22B807000, v9, OS_LOG_TYPE_DEFAULT, "Detected account change.  Getting remote items since version 0 instead of %@\n", (uint8_t *)&v14, 0xCu);
    }
    v11 = [NSDictionary dictionary];
    [(SBKPlaybackPositionSyncRequestHandler *)self setMetadataItemsToCommitToKVSStorage:v11];

    objc_storeStrong((id *)&self->_overrideSyncAnchor, @"0");
  }
  else if (([v8 isRecoverableError] & 1) == 0)
  {
    [(SBKPlaybackPositionSyncRequestHandler *)self _signalKVSTransactionCompletion:v7 withError:v8];
    BOOL v12 = 1;
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    if (v6)
    {
      v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_22B807000, v10, OS_LOG_TYPE_DEFAULT, "transaction is being canceled.  error = %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [(SBKPlaybackPositionSyncRequestHandler *)self setFatalSyncError:v6];
    v11 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
    [(SBKPlaybackPositionSyncRequestHandler *)self _signalKVSTransactionCompletion:v11];
  }
}

- (void)_signalKVSTransactionCompletion:(id)a3
{
  id v3 = [a3 transactionContextForKey:@"completionConditionLock"];
  [v3 lock];
  [v3 unlockWithCondition:1];
}

- (id)_synchronouslyRunKVSTransaction:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBKPlaybackPositionSyncRequestHandler *)self kvsController];
  [v5 scheduleTransaction:v4];

  id v6 = [v4 transactionContextForKey:@"completionConditionLock"];

  id v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:10.0];
  int v8 = [v6 lockWhenCondition:1 beforeDate:v7];

  if (v8)
  {
    [v6 unlock];
  }
  else
  {
    int v9 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
    v10 = +[SBKStoreError transactionTimeoutErrorWithTransaction:v9 underlyingError:0];
    [(SBKPlaybackPositionSyncRequestHandler *)self setFatalSyncError:v10];
  }
  v11 = [(SBKPlaybackPositionSyncRequestHandler *)self fatalSyncError];

  return v11;
}

- (id)newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:(id)a3 processConflicts:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a3;
  id v7 = [SBKSyncTransaction alloc];
  int v8 = [(SBKRequestHandler *)self bagContext];
  int v9 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSourceTransactionContext];
  v10 = [v9 lastSyncedDomainVersion];
  v11 = [(SBKSyncTransaction *)v7 initWithStoreBagContext:v8 syncAnchor:v10 keysToUpdate:v6 keysToDelete:0 conflictDetectionType:v5];

  [(SBKSyncTransaction *)v11 setTransactionProcessor:self];
  int v12 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
  [(SBKTransaction *)v11 setTransactionContext:v12 forKey:@"completionConditionLock"];

  return v11;
}

- (void)_mergeMetadataItemsFromSyncResponse
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (NSDictionary *)[(NSMutableDictionary *)self->_responseMetadataItemsToCommitToDataSource copy];
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v4;

  id v6 = (NSDictionary *)[(NSMutableDictionary *)self->_responseMetadataItemsMergedToCommitBackToKVSStorage copy];
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v6;

  [(NSMutableDictionary *)self->_responseMetadataItemsToCommitToDataSource removeAllObjects];
  [(NSMutableDictionary *)self->_responseMetadataItemsMergedToCommitBackToKVSStorage removeAllObjects];
  int v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v9 = [(NSDictionary *)self->_metadataItemsToCommitToDataSource count];
    NSUInteger v10 = [(NSDictionary *)self->_metadataItemsToCommitToKVSStorage count];
    v11 = [(NSDictionary *)self->_metadataItemsToCommitToDataSource allKeys];
    int v12 = [(NSDictionary *)self->_metadataItemsToCommitToKVSStorage allKeys];
    int v13 = 134218754;
    NSUInteger v14 = v9;
    __int16 v15 = 2048;
    NSUInteger v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_DEFAULT, "Handled items in response, will save %lld items locally and push back %lld conflict resolutions\nkeys to save to local db = %@\nkeys to push to cloud db = %@\n", (uint8_t *)&v13, 0x2Au);
  }
  os_unfair_lock_unlock(p_lock);
}

- (int)_mergeConflictedItemFromSyncResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 itemIdentifier];
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_metadataItemsFromDataSource objectForKey:v5];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __78__SBKPlaybackPositionSyncRequestHandler__mergeConflictedItemFromSyncResponse___block_invoke;
  v26 = &unk_2648AF538;
  v27 = self;
  id v7 = v4;
  id v28 = v7;
  id v29 = v5;
  id v8 = v6;
  id v30 = v8;
  id v9 = v5;
  NSUInteger v10 = (void *)MEMORY[0x230F4DE10](&v23);
  if (!v8) {
    goto LABEL_5;
  }
  objc_msgSend(v8, "timestamp", v23, v24, v25, v26, v27, v28, v29, v30);
  double v12 = v11;
  [v7 timestamp];
  if (v12 > v13)
  {
    NSUInteger v14 = (uint64_t (*)(void *, uint64_t))v10[2];
LABEL_8:
    v18 = v10;
    uint64_t v19 = 1;
    goto LABEL_9;
  }
  [v8 timestamp];
  double v16 = v15;
  [v7 timestamp];
  if (v16 >= v17)
  {
    int v20 = [v8 isEqual:v7];
    NSUInteger v14 = (uint64_t (*)(void *, uint64_t))v10[2];
    if (!v20) {
      goto LABEL_8;
    }
  }
  else
  {
LABEL_5:
    NSUInteger v14 = (uint64_t (*)(void *, uint64_t))v10[2];
  }
  v18 = v10;
  uint64_t v19 = 2;
LABEL_9:
  int v21 = v14(v18, v19);

  return v21;
}

uint64_t __78__SBKPlaybackPositionSyncRequestHandler__mergeConflictedItemFromSyncResponse___block_invoke(void *a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 96));
  if (a2 == 1)
  {
    [*(id *)(a1[4] + 152) setObject:a1[7] forKey:a1[6]];
    id v4 = &OBJC_IVAR___SBKPlaybackPositionSyncRequestHandler__responseMetadataItemsToCommitToDataSource;
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    [*(id *)(a1[4] + 144) setObject:a1[5] forKey:a1[6]];
    id v4 = &OBJC_IVAR___SBKPlaybackPositionSyncRequestHandler__responseMetadataItemsMergedToCommitBackToKVSStorage;
LABEL_5:
    [*(id *)(a1[4] + *v4) removeObjectForKey:a1[6]];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 96));
  return a2;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v13 = 0;
  NSUInteger v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke;
  block[3] = &unk_2648AF7F8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v14 + 24))
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBKPlaybackPositionSyncRequestHandler.m" lineNumber:335 description:@"you can not nest synchronization calls"];
  }
  syncOperationQueue = self->_syncOperationQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_2648AF858;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_async(syncOperationQueue, v10);

  _Block_object_dispose(&v13, 8);
}

uint64_t __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) syncInProgress];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 _synchronize:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancel
{
}

- (void)timeout
{
  id v4 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
  id v3 = +[SBKStoreError transactionTimeoutErrorWithTransaction:v4 underlyingError:0];
  [(SBKPlaybackPositionSyncRequestHandler *)self cancelWithError:v3];
}

- (void)cancelWithError:(id)a3
{
  id v8 = a3;
  [(SBKPlaybackPositionSyncRequestHandler *)self setCanceled:1];
  id v4 = [(SBKPlaybackPositionSyncRequestHandler *)self kvsController];
  if ([v4 isIdle])
  {
    id v5 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];

    if (!v5) {
      goto LABEL_7;
    }
    if (!v8)
    {
      id v6 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
      id v8 = +[SBKStoreError transactionCancelledErrorWithTransaction:v6 underlyingError:0];
    }
    id v4 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
    [(SBKPlaybackPositionSyncRequestHandler *)self _signalKVSTransactionCompletion:v4 withError:v8];
  }

LABEL_7:
  id v7 = [(SBKPlaybackPositionSyncRequestHandler *)self kvsController];
  if (v8) {
    objc_msgSend(v7, "cancelAllTransactionsCancelCode:", objc_msgSend(v8, "code"));
  }
  else {
    [v7 cancelAllTransactions];
  }
}

- (BOOL)_shouldStop
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SBKPlaybackPositionSyncRequestHandler__shouldStop__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__SBKPlaybackPositionSyncRequestHandler__shouldStop__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canceled])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v2 = [*(id *)(a1 + 32) fatalSyncError];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
  }
}

- (BOOL)_synchronize:(id *)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke;
  block[3] = &unk_2648AF7F8;
  block[4] = self;
  block[5] = &v60;
  dispatch_sync(queue, block);
  int v6 = *((unsigned __int8 *)v61 + 24);
  id v7 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
    }

    uint64_t v10 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSource];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_22;
    v58[3] = &unk_2648AF4E8;
    v58[4] = self;
    id v11 = [(id)v10 beginTransactionWithItemsToSyncEnumerationBlock:v58];
    [(SBKPlaybackPositionSyncRequestHandler *)self setDataSourceTransactionContext:v11];

    double v12 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSourceTransactionContext];
    LOBYTE(v10) = v12 == 0;

    if (v10) {
      goto LABEL_10;
    }
    if ([(SBKPlaybackPositionSyncRequestHandler *)self _shouldStop])
    {
      [(SBKPlaybackPositionSyncRequestHandler *)self _dataSourceCancelTransaction];
LABEL_10:
      BOOL v9 = 0;
      goto LABEL_40;
    }
    os_unfair_lock_lock(&self->_lock);
    uint64_t v13 = (void *)[(NSMutableDictionary *)self->_metadataItemsFromDataSource copy];
    NSUInteger v14 = (void *)[(NSMutableDictionary *)self->_responseMetadataItemsMergedToCommitBackToKVSStorage copy];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v15 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = [v13 allKeys];
      uint64_t v17 = [v16 count];
      v18 = [v13 allKeys];
      *(_DWORD *)buf = 134218242;
      uint64_t v65 = v17;
      __int16 v66 = 2112;
      v67 = v18;
      _os_log_impl(&dword_22B807000, v15, OS_LOG_TYPE_DEFAULT, "Gathered local %lu items to sync from dataSource: %@", buf, 0x16u);
    }
    uint64_t v19 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSourceTransactionContext];
      *(_DWORD *)buf = 138412290;
      uint64_t v65 = (uint64_t)v20;
      _os_log_impl(&dword_22B807000, v19, OS_LOG_TYPE_DEFAULT, "dataSource transaction context = %@", buf, 0xCu);
    }
    [(SBKPlaybackPositionSyncRequestHandler *)self setMetadataItemsToCommitToKVSStorage:v13];
    int v21 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
    v22 = [v21 allKeys];
    id v23 = [(SBKPlaybackPositionSyncRequestHandler *)self newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:v22 processConflicts:1];
    [(SBKPlaybackPositionSyncRequestHandler *)self setCurrentKVSTransaction:v23];

    uint64_t v24 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
    v25 = [v24 requestURL];
    LODWORD(v22) = v25 == 0;

    if (v22
      && ([(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction],
          v31 = objc_claimAutoreleasedReturnValue(),
          +[SBKStoreError transactionMissingURLErrorWithTransaction:v31 underlyingError:0], id v30 = objc_claimAutoreleasedReturnValue(), v31, v30))
    {
      if (a3) {
        *a3 = v30;
      }
    }
    else
    {
      if ([(SBKPlaybackPositionSyncRequestHandler *)self _shouldStop])
      {
        [(SBKPlaybackPositionSyncRequestHandler *)self _dataSourceCancelTransaction];
        BOOL v9 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v26 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
        id v28 = [v27 syncAnchor];
        *(_DWORD *)buf = 138412290;
        uint64_t v65 = (uint64_t)v28;
        _os_log_impl(&dword_22B807000, v26, OS_LOG_TYPE_DEFAULT, "Performing sync with server using syncAnchor = %@", buf, 0xCu);
      }
      id v29 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
      id v30 = [(SBKPlaybackPositionSyncRequestHandler *)self _synchronouslyRunKVSTransaction:v29];

      if (!v30)
      {
        if (![(SBKPlaybackPositionSyncRequestHandler *)self _shouldStop])
        {
          [(SBKPlaybackPositionSyncRequestHandler *)self _mergeMetadataItemsFromSyncResponse];
          v32 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
          uint64_t v33 = [v32 count];

          if (!v33) {
            goto LABEL_53;
          }
          v34 = _SBKLogCategorySync();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
            v36 = [v35 allKeys];
            *(_DWORD *)buf = 138412290;
            uint64_t v65 = (uint64_t)v36;
            _os_log_impl(&dword_22B807000, v34, OS_LOG_TYPE_DEFAULT, "Sending merged items to server: %@", buf, 0xCu);
          }
          v37 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToKVSStorage];
          v38 = [v37 allKeys];
          id v39 = [(SBKPlaybackPositionSyncRequestHandler *)self newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:v38 processConflicts:0];
          [(SBKPlaybackPositionSyncRequestHandler *)self setCurrentKVSTransaction:v39];

          v40 = [(SBKPlaybackPositionSyncRequestHandler *)self currentKVSTransaction];
          id v30 = [(SBKPlaybackPositionSyncRequestHandler *)self _synchronouslyRunKVSTransaction:v40];

          if (v30)
          {
            if (a3) {
              *a3 = v30;
            }
            goto LABEL_36;
          }
          if (![(SBKPlaybackPositionSyncRequestHandler *)self _shouldStop])
          {
LABEL_53:
            if ([v14 count])
            {
              v42 = _SBKLogCategoryDefault();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B807000, v42, OS_LOG_TYPE_ERROR, "WARNING: sent resolved conflict to server, but still received conflicts in the response, saving those for next time...", buf, 2u);
              }
            }
            v43 = _SBKLogCategorySync();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = [(SBKSyncRequestHandler *)self responseDomainVersion];
              v45 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToDataSource];
              *(_DWORD *)buf = 138412546;
              uint64_t v65 = (uint64_t)v44;
              __int16 v66 = 2112;
              v67 = v45;
              _os_log_impl(&dword_22B807000, v43, OS_LOG_TYPE_DEFAULT, "Committing merged items with domainRevision: %@ to local database: %@", buf, 0x16u);
            }
            v46 = [(SBKPlaybackPositionSyncRequestHandler *)self metadataItemsToCommitToDataSource];
            v47 = [v46 objectEnumerator];

            v48 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSource];
            v49 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSourceTransactionContext];
            v50 = [(SBKSyncRequestHandler *)self responseDomainVersion];
            uint64_t v53 = MEMORY[0x263EF8330];
            uint64_t v54 = 3221225472;
            v55 = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_26;
            v56 = &unk_2648AF510;
            id v51 = v47;
            id v57 = v51;
            [v48 commitUniversalPlaybackPositionTransaction:v49 domainVersion:v50 metadataEnumerationBlock:&v53];

            [(SBKPlaybackPositionSyncRequestHandler *)self clearTransactionResponseData];
            v52 = _SBKLogCategorySync();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22B807000, v52, OS_LOG_TYPE_DEFAULT, "Finished synchronization", buf, 2u);
            }

            id v30 = 0;
            BOOL v9 = 1;
            goto LABEL_38;
          }
        }
        [(SBKPlaybackPositionSyncRequestHandler *)self _dataSourceCancelTransaction];
        id v30 = 0;
LABEL_37:
        BOOL v9 = 0;
LABEL_38:

        goto LABEL_39;
      }
      if (a3) {
        *a3 = v30;
      }
    }
LABEL_36:
    [(SBKPlaybackPositionSyncRequestHandler *)self _dataSourceCancelTransaction];
    goto LABEL_37;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "Skipping synchronize: synchronization already in progress", buf, 2u);
  }

  BOOL v9 = 1;
LABEL_40:
  _Block_object_dispose(&v60, 8);
  return v9;
}

uint64_t __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) syncInProgress];
  v2 = *(void **)(a1 + 32);
  return [v2 setSyncInProgress:1];
}

void __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = +[SBKUniversalPlaybackPositionMetadata metadataWithValuesFromDataSourceItem:a2];
  id v4 = [v3 itemIdentifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
    int v6 = *(void **)(*(void *)(a1 + 32) + 136);
    id v7 = [v3 itemIdentifier];
    [v6 setObject:v3 forKey:v7];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
  }
  else
  {
    BOOL v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_ERROR, "ERROR: will skip syncing item with no sync metadataIdentifier: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

uint64_t __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) nextObject];
}

- (void)_dataSourceCancelTransaction
{
  [(SBKPlaybackPositionSyncRequestHandler *)self clearTransactionResponseData];
  id v4 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    char v3 = [(SBKPlaybackPositionSyncRequestHandler *)self dataSourceTransactionContext];
    [v4 cancelUniversalPlaybackPositionTransaction:v3];
  }
}

- (void)clearTransactionResponseData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataSourceTransactionContext = self->_dataSourceTransactionContext;
  self->_dataSourceTransactionContext = 0;

  currentKVSTransaction = self->_currentKVSTransaction;
  self->_currentKVSTransaction = 0;

  [(NSMutableDictionary *)self->_metadataItemsFromDataSource removeAllObjects];
  int v6 = [NSDictionary dictionary];
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v6;

  BOOL v8 = [NSDictionary dictionary];
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v8;

  [(NSMutableDictionary *)self->_responseMetadataItemsToCommitToDataSource removeAllObjects];
  [(NSMutableDictionary *)self->_responseMetadataItemsMergedToCommitBackToKVSStorage removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4 accountIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"SBKPlaybackPositionSyncRequestHandler.m" lineNumber:168 description:@"invalid parameters - data source is required"];

    if (v10) {
      goto LABEL_3;
    }
  }
  v40 = [MEMORY[0x263F08690] currentHandler];
  [v40 handleFailureInMethod:a2 object:self file:@"SBKPlaybackPositionSyncRequestHandler.m" lineNumber:169 description:@"invalid parameters - bagContext is required"];

LABEL_3:
  double v12 = [v10 domain];

  if (!v12)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"SBKPlaybackPositionSyncRequestHandler.m" lineNumber:170 description:@"invalid parameters - bagContext.domain is required"];
  }
  v43.receiver = self;
  v43.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  uint64_t v13 = [(SBKSyncRequestHandler *)&v43 initWithBagContext:v10 accountIdentifier:v11];
  NSUInteger v14 = v13;
  if (v13)
  {
    [(SBKPlaybackPositionSyncRequestHandler *)v13 setDataSource:v9];
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    metadataItemsFromDataSource = v14->_metadataItemsFromDataSource;
    v14->_metadataItemsFromDataSource = (NSMutableDictionary *)v15;

    uint64_t v17 = [NSDictionary dictionary];
    metadataItemsToCommitToDataSource = v14->_metadataItemsToCommitToDataSource;
    v14->_metadataItemsToCommitToDataSource = (NSDictionary *)v17;

    uint64_t v19 = [NSDictionary dictionary];
    metadataItemsToCommitToKVSStorage = v14->_metadataItemsToCommitToKVSStorage;
    v14->_metadataItemsToCommitToKVSStorage = (NSDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    responseMetadataItemsToCommitToDataSource = v14->_responseMetadataItemsToCommitToDataSource;
    v14->_responseMetadataItemsToCommitToDataSource = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    responseMetadataItemsMergedToCommitBackToKVSStorage = v14->_responseMetadataItemsMergedToCommitBackToKVSStorage;
    v14->_responseMetadataItemsMergedToCommitBackToKVSStorage = (NSMutableDictionary *)v23;

    v25 = [v10 domain];

    if (!v25)
    {
      v42 = [MEMORY[0x263F08690] currentHandler];
      [v42 handleFailureInMethod:a2 object:v14 file:@"SBKPlaybackPositionSyncRequestHandler.m" lineNumber:181 description:@"Invalid bag.  no domain specified"];
    }
    v26 = [MEMORY[0x263F7B0E8] defaultStore];
    v27 = [v26 accountWithUniqueIdentifier:v11];

    id v28 = [SBKTransactionController alloc];
    id v29 = [v10 domain];
    id v30 = [v10 syncRequestURL];
    v31 = [(SBKTransactionController *)v28 initWithDomain:v29 requestURL:v30 forAccount:v27];

    [(SBKTransactionController *)v31 setDelegate:v14];
    [(SBKPlaybackPositionSyncRequestHandler *)v14 setKvsController:v31];
    v14->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v32 = dispatch_queue_create("SBKPlaybackPositionSyncRequestHandler.queue", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v32;

    v34 = v14->_queue;
    v35 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v34, v35);

    dispatch_queue_t v36 = dispatch_queue_create("SBKPlaybackPositionSyncRequestHandler.syncOperationQueue", 0);
    syncOperationQueue = v14->_syncOperationQueue;
    v14->_syncOperationQueue = (OS_dispatch_queue *)v36;

    dispatch_set_target_queue((dispatch_object_t)v14->_syncOperationQueue, v35);
  }

  return v14;
}

- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = SBKStoreAccount();
  id v9 = [v8 uniqueIdentifier];
  id v10 = [(SBKPlaybackPositionSyncRequestHandler *)self initWithDataSource:v7 bagContext:v6 accountIdentifier:v9];

  return v10;
}

- (void)setMetadataItemsToCommitToKVSStorage:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)metadataItemsToCommitToKVSStorage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_metadataItemsToCommitToKVSStorage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMetadataItemsToCommitToDataSource:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)metadataItemsToCommitToDataSource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_metadataItemsToCommitToDataSource;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentKVSTransaction:(id)a3
{
  id v4 = (SBKSyncTransaction *)a3;
  os_unfair_lock_lock(&self->_lock);
  currentKVSTransaction = self->_currentKVSTransaction;
  self->_currentKVSTransaction = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)currentKVSTransaction
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_currentKVSTransaction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDataSourceTransactionContext:(id)a3
{
  id v4 = (SBKUniversalPlaybackPositionTransactionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  dataSourceTransactionContext = self->_dataSourceTransactionContext;
  self->_dataSourceTransactionContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)dataSourceTransactionContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_dataSourceTransactionContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end