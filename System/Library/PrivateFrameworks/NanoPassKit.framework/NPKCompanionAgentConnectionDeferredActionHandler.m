@interface NPKCompanionAgentConnectionDeferredActionHandler
+ (id)sharedDeferredActionHandler;
- (NPKCompanionAgentConnectionDeferredActionHandler)init;
- (NSMutableDictionary)deferredActions;
- (NSMutableDictionary)deferredAddedPaymentPasses;
- (NSMutableDictionary)deferredSharedPaymentWebServiceContexts;
- (OS_dispatch_queue)internalQueue;
- (id)deferredPaymentPassUniqueIDsForDevice:(id)a3 excludingDeactivated:(BOOL)a4;
- (id)deferredPaymentPassWithUniqueID:(id)a3 forDevice:(id)a4;
- (id)deferredPaymentPassesForDevice:(id)a3;
- (id)deferredSharedPaymentWebServiceContextForDevice:(id)a3;
- (void)_cleanUpDeferredDataForPairingID:(id)a3;
- (void)_handleCompanionAgentStarted;
- (void)_handleDeviceBecameActive:(id)a3;
- (void)_handleDevicePaired:(id)a3;
- (void)_handleDevicePairingFailure:(id)a3;
- (void)_handleDeviceUnpaired:(id)a3;
- (void)_performDeferredActions;
- (void)addDeferredPaymentPass:(id)a3 forDevice:(id)a4;
- (void)dealloc;
- (void)performActionWhenCompanionAgentIsAvailable:(id)a3 forDevice:(id)a4;
- (void)setDeferredActions:(id)a3;
- (void)setDeferredAddedPaymentPasses:(id)a3;
- (void)setDeferredSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4;
- (void)setDeferredSharedPaymentWebServiceContexts:(id)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation NPKCompanionAgentConnectionDeferredActionHandler

+ (id)sharedDeferredActionHandler
{
  if (sharedDeferredActionHandler_onceToken != -1) {
    dispatch_once(&sharedDeferredActionHandler_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedDeferredActionHandler_sharedDeferredActionHandler;
  return v2;
}

void __79__NPKCompanionAgentConnectionDeferredActionHandler_sharedDeferredActionHandler__block_invoke()
{
  v0 = objc_alloc_init(NPKCompanionAgentConnectionDeferredActionHandler);
  v1 = (void *)sharedDeferredActionHandler_sharedDeferredActionHandler;
  sharedDeferredActionHandler_sharedDeferredActionHandler = (uint64_t)v0;
}

- (NPKCompanionAgentConnectionDeferredActionHandler)init
{
  v20.receiver = self;
  v20.super_class = (Class)NPKCompanionAgentConnectionDeferredActionHandler;
  v2 = [(NPKCompanionAgentConnectionDeferredActionHandler *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    deferredActions = v2->_deferredActions;
    v2->_deferredActions = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    deferredSharedPaymentWebServiceContexts = v2->_deferredSharedPaymentWebServiceContexts;
    v2->_deferredSharedPaymentWebServiceContexts = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    deferredAddedPaymentPasses = v2->_deferredAddedPaymentPasses;
    v2->_deferredAddedPaymentPasses = (NSMutableDictionary *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("NPKCompanionAgentDeferredActionHandler", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v9;

    v11 = [MEMORY[0x263F57730] sharedInstance];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel__handleDeviceUnpaired_ name:*MEMORY[0x263F576B8] object:v11];
    [v12 addObserver:v2 selector:sel__handleDevicePaired_ name:*MEMORY[0x263F576A8] object:v11];
    [v12 addObserver:v2 selector:sel__handleDeviceBecameActive_ name:*MEMORY[0x263F57688] object:v11];
    [v12 addObserver:v2 selector:sel__handleDevicePairingFailure_ name:*MEMORY[0x263F57698] object:v11];
    int out_token = 0;
    objc_initWeak(&location, v2);
    v13 = (const char *)[@"com.apple.NPKCompanionAgent.started" UTF8String];
    v14 = v2->_internalQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __56__NPKCompanionAgentConnectionDeferredActionHandler_init__block_invoke;
    handler[3] = &unk_2644D2870;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch(v13, &out_token, v14, handler);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __56__NPKCompanionAgentConnectionDeferredActionHandler_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCompanionAgentStarted];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPKCompanionAgentConnectionDeferredActionHandler;
  [(NPKCompanionAgentConnectionDeferredActionHandler *)&v4 dealloc];
}

- (void)performActionWhenCompanionAgentIsAvailable:(id)a3 forDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForProperty:*MEMORY[0x263F57620]];
  dispatch_queue_t v9 = pk_Payment_log();
  v10 = v9;
  if (v8)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x223C37380](v6);
        *(_DWORD *)buf = 138412290;
        id v22 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Perform action when companion agent is available: %@", buf, 0xCu);
      }
    }
    v14 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__NPKCompanionAgentConnectionDeferredActionHandler_performActionWhenCompanionAgentIsAvailable_forDevice___block_invoke;
    block[3] = &unk_2644D3388;
    block[4] = self;
    id v19 = v8;
    id v20 = v6;
    dispatch_async(v14, block);
  }
  else
  {
    BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = (void *)MEMORY[0x223C37380](v6);
        *(_DWORD *)buf = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, "Error: Not performing action when companion agent is available because pairing ID is nil! Device: %@, action: %@", buf, 0x16u);
      }
    }
  }
}

void __105__NPKCompanionAgentConnectionDeferredActionHandler_performActionWhenCompanionAgentIsAvailable_forDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deferredActions];
  id v5 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    uint64_t v3 = [*(id *)(a1 + 32) deferredActions];
    [v3 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  objc_super v4 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 48));
  [v5 addObject:v4];
}

- (id)deferredSharedPaymentWebServiceContextForDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5;
  id v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  id v6 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__NPKCompanionAgentConnectionDeferredActionHandler_deferredSharedPaymentWebServiceContextForDevice___block_invoke;
  block[3] = &unk_2644D42D8;
  BOOL v15 = &v16;
  block[4] = self;
  id v7 = v5;
  id v14 = v7;
  dispatch_sync(v6, block);

  v8 = pk_Payment_log();
  LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    dispatch_queue_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v17[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Fetched deferred shared web service context %@ for device %@", buf, 0x16u);
    }
  }
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __100__NPKCompanionAgentConnectionDeferredActionHandler_deferredSharedPaymentWebServiceContextForDevice___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deferredSharedPaymentWebServiceContexts];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setDeferredSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForProperty:*MEMORY[0x263F57620]];
  dispatch_queue_t v9 = pk_Payment_log();
  uint64_t v10 = v9;
  if (v8)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Setting deferred shared web service context: %@", buf, 0xCu);
      }
    }
    v13 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__NPKCompanionAgentConnectionDeferredActionHandler_setDeferredSharedPaymentWebServiceContext_forDevice___block_invoke;
    block[3] = &unk_2644D31B0;
    id v17 = v6;
    uint64_t v18 = self;
    id v19 = v8;
    dispatch_async(v13, block);

    id v14 = v17;
  }
  else
  {
    BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (!v15) {
      goto LABEL_8;
    }
    id v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_ERROR, "Error: Not setting deferred shared web service context because pairing ID is nil! Device: %@, context: %@", buf, 0x16u);
    }
  }

LABEL_8:
}

void __104__NPKCompanionAgentConnectionDeferredActionHandler_setDeferredSharedPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) deferredSharedPaymentWebServiceContexts];
  id v4 = v3;
  if (v2) {
    [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  else {
    [v3 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (void)addDeferredPaymentPass:(id)a3 forDevice:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForProperty:*MEMORY[0x263F57620]];
  dispatch_queue_t v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Setting deferred added payment pass: %@ for device: %@", buf, 0x16u);
    }
  }
  v12 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke;
  block[3] = &unk_2644D31B0;
  id v16 = v6;
  id v17 = v8;
  uint64_t v18 = self;
  id v13 = v8;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 48) deferredAddedPaymentPasses];
    uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263EFF9C0] set];
      id v4 = [*(id *)(a1 + 48) deferredAddedPaymentPasses];
      [v4 setObject:v3 forKey:*(void *)(a1 + 40)];
    }
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__5;
    BOOL v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    id v7 = __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke_2;
    v8 = &unk_2644D4300;
    id v9 = *(id *)(a1 + 32);
    BOOL v10 = &v11;
    [v3 enumerateObjectsUsingBlock:&v5];
    if (v12[5]) {
      objc_msgSend(v3, "removeObject:", v5, v6, v7, v8);
    }
    objc_msgSend(v3, "addObject:", *(void *)(a1 + 32), v5, v6, v7, v8);

    _Block_object_dispose(&v11, 8);
  }
}

void __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  uint64_t v6 = [v9 uniqueID];
  id v7 = [*(id *)(a1 + 32) uniqueID];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)deferredPaymentPassesForDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  if (v5)
  {
    uint64_t v6 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredAddedPaymentPasses];
    id v7 = [v6 objectForKey:v5];
  }
  else
  {
    id v7 = 0;
  }
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Returning deferred added payment passes: %@ for device: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v7;
}

- (id)deferredPaymentPassUniqueIDsForDevice:(id)a3 excludingDeactivated:(BOOL)a4
{
  uint64_t v5 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredPaymentPassesForDevice:a3];
  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  int v12 = __111__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassUniqueIDsForDevice_excludingDeactivated___block_invoke;
  uint64_t v13 = &unk_2644D4328;
  BOOL v15 = a4;
  id v14 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];
  int v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __111__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassUniqueIDsForDevice_excludingDeactivated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(a1 + 40) || (v4 = [v3 activationState] == 4, uint64_t v5 = v8, !v4))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueID];
    [v6 addObject:v7];

    uint64_t v5 = v8;
  }
}

- (id)deferredPaymentPassWithUniqueID:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredPaymentPassesForDevice:v7];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  id v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassWithUniqueID_forDevice___block_invoke;
  v12[3] = &unk_2644D4300;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v15;
  [v8 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __94__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassWithUniqueID_forDevice___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 uniqueID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_performDeferredActions
{
  id v3 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Performing deferred actions…", buf, 2u);
    }
  }
  int v7 = objc_alloc_init(NPKCompanionAgentConnection);
  [(NPKCompanionAgentConnection *)v7 setQueueAppropriateFailedActions:1];
  id v8 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredActions];
  id v9 = (void *)[v8 copy];

  id v10 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredSharedPaymentWebServiceContexts];
  uint64_t v11 = (void *)[v10 copy];

  int v12 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredActions];
  [v12 removeAllObjects];

  id v13 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredSharedPaymentWebServiceContexts];
  [v13 removeAllObjects];

  [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_68];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_72];
  id v14 = dispatch_get_global_queue(0, 0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_73;
  v17[3] = &unk_2644D2E08;
  id v18 = v9;
  id v19 = v7;
  uint64_t v15 = v7;
  id v16 = v9;
  dispatch_async(v14, v17);
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pairing ID %@: shared web service context %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 1024;
      int v12 = [v5 count];
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pairing ID %@: %u actions", (uint8_t *)&v9, 0x12u);
    }
  }
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_73(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_2;
  v2[3] = &unk_2644D43B8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_3;
  v4[3] = &unk_2644D4390;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_cleanUpDeferredDataForPairingID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredActions];
  BOOL v7 = [v6 objectForKey:v4];

  id v8 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredSharedPaymentWebServiceContexts];
  int v9 = [v8 objectForKey:v4];

  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v4;
      __int16 v17 = 1024;
      int v18 = [v7 count];
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Removing deferred data for pairing ID %@ (deferred action count %u deferred shared context %@)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  uint64_t v13 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredActions];
  [v13 removeObjectForKey:v4];

  id v14 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self deferredSharedPaymentWebServiceContexts];
  [v14 removeObjectForKey:v4];
}

- (void)_handleCompanionAgentStarted
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: companion agent started", v6, 2u);
    }
  }
  [(NPKCompanionAgentConnectionDeferredActionHandler *)self _performDeferredActions];
}

- (void)_handleDeviceBecameActive:(id)a3
{
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device became active", buf, 2u);
    }
  }
  BOOL v7 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceBecameActive___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v7, block);
}

uint64_t __78__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceBecameActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDeferredActions];
}

- (void)_handleDevicePaired:(id)a3
{
  BOOL v4 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePaired___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __72__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePaired___block_invoke(uint64_t a1)
{
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device paired", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _performDeferredActions];
}

- (void)_handleDeviceUnpaired:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceUnpaired___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceUnpaired___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x263F57680]];

  id v4 = [v3 valueForProperty:*MEMORY[0x263F57620]];
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device unpaired (pairing ID %@)", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v4) {
    [*(id *)(a1 + 40) _cleanUpDeferredDataForPairingID:v4];
  }
}

- (void)_handleDevicePairingFailure:(id)a3
{
  id v4 = [(NPKCompanionAgentConnectionDeferredActionHandler *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke(uint64_t a1)
{
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device pairing failure", buf, 2u);
    }
  }
  BOOL v5 = [MEMORY[0x263F57730] sharedInstance];
  BOOL v6 = [MEMORY[0x263EFF9C0] set];
  BOOL v7 = [v5 getPairedDevices];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_75;
  v18[3] = &unk_2644D43E0;
  id v19 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v18];
  int v9 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v10 = [*(id *)(a1 + 32) deferredActions];
  BOOL v11 = [v10 allKeys];
  int v12 = [v9 setWithArray:v11];

  uint64_t v13 = (void *)MEMORY[0x263EFFA08];
  id v14 = [*(id *)(a1 + 32) deferredActions];
  int v15 = [v14 allKeys];
  id v16 = [v13 setWithArray:v15];
  [v12 unionSet:v16];

  [v12 minusSet:v8];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_2;
  v17[3] = &unk_2644D4408;
  void v17[4] = *(void *)(a1 + 32);
  [v12 enumerateObjectsUsingBlock:v17];
}

void __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_75(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 valueForProperty:*MEMORY[0x263F57620]];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    BOOL v3 = v4;
  }
}

uint64_t __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cleanUpDeferredDataForPairingID:a2];
}

- (NSMutableDictionary)deferredActions
{
  return self->_deferredActions;
}

- (void)setDeferredActions:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSMutableDictionary)deferredSharedPaymentWebServiceContexts
{
  return self->_deferredSharedPaymentWebServiceContexts;
}

- (void)setDeferredSharedPaymentWebServiceContexts:(id)a3
{
}

- (NSMutableDictionary)deferredAddedPaymentPasses
{
  return self->_deferredAddedPaymentPasses;
}

- (void)setDeferredAddedPaymentPasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredAddedPaymentPasses, 0);
  objc_storeStrong((id *)&self->_deferredSharedPaymentWebServiceContexts, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_deferredActions, 0);
}

@end