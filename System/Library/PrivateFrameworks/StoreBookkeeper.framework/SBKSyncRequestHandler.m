@interface SBKSyncRequestHandler
+ (int64_t)conflictDetectionType;
- (NSArray)responseConflictedKeys;
- (NSArray)responseDeletedKeys;
- (NSArray)responseUpdatedKeys;
- (NSString)responseDomainVersion;
- (SBKSyncRequestHandler)initWithBagContext:(id)a3;
- (SBKSyncRequestHandler)initWithBagContext:(id)a3 accountIdentifier:(id)a4;
- (SBKSyncResponseData)responseData;
- (SBKTransactionController)transactionController;
- (id)responseDataForResponseKey:(id)a3;
- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4;
- (void)_onQueue_clearTransactionResponseData;
- (void)clearTransactionResponseData;
- (void)setResponseDomainVersion:(id)a3;
- (void)startTransactionWithSyncAnchor:(id)a3 keysToUpdate:(id)a4 keysToDelete:(id)a5 finishedBlock:(id)a6;
- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5;
- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7;
- (void)transaction:(id)a3 willProcessResponseData:(id)a4;
@end

@implementation SBKSyncRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionController, 0);
  objc_storeStrong((id *)&self->_responseDataByKey, 0);
  objc_storeStrong((id *)&self->_responseConflictedKeys, 0);
  objc_storeStrong((id *)&self->_responseDeletedKeys, 0);
  objc_storeStrong((id *)&self->_responseUpdatedKeys, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_overrideResponseDomainVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (SBKTransactionController)transactionController
{
  return self->_transactionController;
}

- (SBKSyncResponseData)responseData
{
  return self->_responseData;
}

- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBKSyncRequestHandler.m" lineNumber:158 description:@"subclass must supply key-value pair by implementing the SBKSyncTransactionProcessing protocol"];

  return 0;
}

- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5
{
  id v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__SBKSyncRequestHandler_transaction_processDeletedKey_isDirty___block_invoke;
  v10[3] = &unk_2648AF8A8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(queue, v10);
  *a5 = 0;
}

uint64_t __63__SBKSyncRequestHandler_transaction_processDeletedKey_isDirty___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7
{
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__SBKSyncRequestHandler_transaction_processUpdatedKey_data_conflict_isDirty___block_invoke;
  v16[3] = &unk_2648AF998;
  BOOL v19 = a6;
  v16[4] = self;
  id v17 = v12;
  id v18 = v11;
  id v14 = v11;
  id v15 = v12;
  dispatch_sync(queue, v16);
  *a7 = 0;
}

uint64_t __77__SBKSyncRequestHandler_transaction_processUpdatedKey_data_conflict_isDirty___block_invoke(uint64_t a1)
{
  uint64_t v2 = 40;
  if (!*(unsigned char *)(a1 + 56)) {
    uint64_t v2 = 48;
  }
  v3 = &OBJC_IVAR___SBKSyncRequestHandler__responseConflictedKeys;
  if (!*(unsigned char *)(a1 + 56)) {
    v3 = &OBJC_IVAR___SBKSyncRequestHandler__responseUpdatedKeys;
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + *v3) addObject:*(void *)(a1 + v2)];
  if (*(void *)(a1 + 40))
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 64);
    return objc_msgSend(v5, "setObject:forKey:");
  }
  return result;
}

- (void)transaction:(id)a3 willProcessResponseData:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__SBKSyncRequestHandler_transaction_willProcessResponseData___block_invoke;
  v8[3] = &unk_2648AF8A8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __61__SBKSyncRequestHandler_transaction_willProcessResponseData___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 32) syncAnchor];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_DEFAULT, "will process response with responseDomainVersion = %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startTransactionWithSyncAnchor:(id)a3 keysToUpdate:(id)a4 keysToDelete:(id)a5 finishedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[a6 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke;
  block[3] = &unk_2648AF970;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTransactionResponseData");
  uint64_t v2 = [SBKSyncTransaction alloc];
  v3 = [*(id *)(a1 + 32) bagContext];
  int v4 = -[SBKSyncTransaction initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:](v2, "initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:", v3, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), [(id)objc_opt_class() conflictDetectionType]);

  [(SBKSyncTransaction *)v4 setTransactionProcessor:*(void *)(a1 + 32)];
  id v5 = *(void **)(*(void *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke_2;
  v6[3] = &unk_2648AF948;
  id v7 = *(id *)(a1 + 64);
  [v5 scheduleTransaction:v4 withTransactionFinishedBlock:v6];
}

uint64_t __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  else {
    return 1;
  }
}

- (void)clearTransactionResponseData
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SBKSyncRequestHandler_clearTransactionResponseData__block_invoke;
  block[3] = &unk_2648AF920;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __53__SBKSyncRequestHandler_clearTransactionResponseData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTransactionResponseData");
}

- (void)_onQueue_clearTransactionResponseData
{
  responseData = self->_responseData;
  self->_responseData = 0;

  overrideResponseDomainVersion = self->_overrideResponseDomainVersion;
  self->_overrideResponseDomainVersion = 0;

  [(NSMutableArray *)self->_responseUpdatedKeys removeAllObjects];
  [(NSMutableArray *)self->_responseDeletedKeys removeAllObjects];
  [(NSMutableArray *)self->_responseConflictedKeys removeAllObjects];
  responseDataByKey = self->_responseDataByKey;
  [(NSMutableDictionary *)responseDataByKey removeAllObjects];
}

- (id)responseDataForResponseKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__SBKSyncRequestHandler_responseDataForResponseKey___block_invoke;
  v10[3] = &unk_2648AF8F8;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1891;
  BOOL v19 = __Block_byref_object_dispose__1892;
  id v20 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_2648AF9E8;
  id v13 = v6;
  id v14 = &v15;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__SBKSyncRequestHandler_responseDataForResponseKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
}

- (NSArray)responseConflictedKeys
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SBKSyncRequestHandler_responseConflictedKeys__block_invoke;
  v6[3] = &unk_2648AF8D0;
  void v6[4] = self;
  v3 = v6;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1891;
  id v14 = __Block_byref_object_dispose__1892;
  id v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_2648AF9E8;
  id v8 = v3;
  id v9 = &v10;
  dispatch_sync(queue, block);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSArray *)v4;
}

id __47__SBKSyncRequestHandler_responseConflictedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

- (NSArray)responseDeletedKeys
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SBKSyncRequestHandler_responseDeletedKeys__block_invoke;
  v6[3] = &unk_2648AF8D0;
  void v6[4] = self;
  v3 = v6;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1891;
  id v14 = __Block_byref_object_dispose__1892;
  id v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_2648AF9E8;
  id v8 = v3;
  id v9 = &v10;
  dispatch_sync(queue, block);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSArray *)v4;
}

id __44__SBKSyncRequestHandler_responseDeletedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

- (NSArray)responseUpdatedKeys
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SBKSyncRequestHandler_responseUpdatedKeys__block_invoke;
  v6[3] = &unk_2648AF8D0;
  void v6[4] = self;
  v3 = v6;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1891;
  id v14 = __Block_byref_object_dispose__1892;
  id v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_2648AF9E8;
  id v8 = v3;
  id v9 = &v10;
  dispatch_sync(queue, block);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSArray *)v4;
}

id __44__SBKSyncRequestHandler_responseUpdatedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (NSString)responseDomainVersion
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SBKSyncRequestHandler_responseDomainVersion__block_invoke;
  v6[3] = &unk_2648AF8D0;
  void v6[4] = self;
  v3 = v6;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1891;
  id v14 = __Block_byref_object_dispose__1892;
  id v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_2648AF9E8;
  id v8 = v3;
  id v9 = &v10;
  dispatch_sync(queue, block);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (NSString *)v4;
}

uint64_t __46__SBKSyncRequestHandler_responseDomainVersion__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) syncAnchor];
}

- (void)setResponseDomainVersion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SBKSyncRequestHandler_setResponseDomainVersion___block_invoke;
  v8[3] = &unk_2648AF8A8;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___serialSetValue_block_invoke;
  block[3] = &unk_2648AF9C0;
  id v11 = v6;
  id v7 = v4;
  dispatch_sync(queue, block);
}

void __50__SBKSyncRequestHandler_setResponseDomainVersion___block_invoke(uint64_t a1)
{
}

- (SBKSyncRequestHandler)initWithBagContext:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBKSyncRequestHandler;
  id v8 = [(SBKRequestHandler *)&v28 initWithBagContext:v6];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.storebookkeeper.SBKSyncRequestHandler", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    id v11 = [MEMORY[0x263F7B0E8] defaultStore];
    uint64_t v12 = [v11 accountWithUniqueIdentifier:v7];

    id v13 = [SBKTransactionController alloc];
    id v14 = [v6 domain];
    id v15 = [v6 syncRequestURL];
    uint64_t v16 = [(SBKTransactionController *)v13 initWithDomain:v14 requestURL:v15 forAccount:v12];
    transactionController = v8->_transactionController;
    v8->_transactionController = (SBKTransactionController *)v16;

    responseData = v8->_responseData;
    v8->_responseData = 0;

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    responseUpdatedKeys = v8->_responseUpdatedKeys;
    v8->_responseUpdatedKeys = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    responseDeletedKeys = v8->_responseDeletedKeys;
    v8->_responseDeletedKeys = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] array];
    responseConflictedKeys = v8->_responseConflictedKeys;
    v8->_responseConflictedKeys = (NSMutableArray *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    responseDataByKey = v8->_responseDataByKey;
    v8->_responseDataByKey = (NSMutableDictionary *)v25;
  }
  return v8;
}

- (SBKSyncRequestHandler)initWithBagContext:(id)a3
{
  id v4 = a3;
  id v5 = SBKStoreAccount();
  id v6 = [v5 uniqueIdentifier];
  id v7 = [(SBKSyncRequestHandler *)self initWithBagContext:v4 accountIdentifier:v6];

  return v7;
}

+ (int64_t)conflictDetectionType
{
  return 0;
}

@end