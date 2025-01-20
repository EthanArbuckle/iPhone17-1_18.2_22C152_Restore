@interface NPKPrecursorPassUpgradeRequestsManager
- (NPKPrecursorPassUpgradeRequestsManager)init;
- (id)descriptionForPassWithUniqueID:(id)a3;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_invalidateUpgradeControllerForPassWithUniqueID:(id)a3;
- (void)_queue_notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_queue_removeObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)invalidateUpgradeControllerForPassWithUniqueID:(id)a3;
- (void)loadUpgradeControllerForPass:(id)a3;
- (void)notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4;
- (void)precursorPassUpgradeRequestsDidChangeForUpgradeController:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NPKPrecursorPassUpgradeRequestsManager

- (NPKPrecursorPassUpgradeRequestsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NPKPrecursorPassUpgradeRequestsManager;
  v2 = [(NPKPrecursorPassUpgradeRequestsManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoPasskit.NPKPrecursorPassUpgradeRequestsManager", MEMORY[0x263EF83A8]);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    objc_storeStrong((id *)&v2->_observerQueue, MEMORY[0x263EF83A0]);
    v5 = objc_alloc_init(NPKObserverManager);
    observerManager = v2->_observerManager;
    v2->_observerManager = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    upgradeControllerMap = v2->_upgradeControllerMap;
    v2->_upgradeControllerMap = v7;
  }
  return v2;
}

- (void)loadUpgradeControllerForPass:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uniqueID];
  if ([v4 npkIsPrecursorPass])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__16;
    v42 = __Block_byref_object_dispose__16;
    id v43 = 0;
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_49;
    block[3] = &unk_2644D6690;
    objc_copyWeak(&v32, &location);
    p_long long buf = &buf;
    id v7 = v5;
    id v30 = v7;
    dispatch_sync(internalQueue, block);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_2;
    v26[3] = &unk_2644D6708;
    objc_copyWeak(&v28, &location);
    id v8 = v7;
    id v27 = v8;
    uint64_t v9 = MEMORY[0x223C37380](v26);
    objc_super v10 = (void (**)(void, void))v9;
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
    else
    {
      v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v37 = 138412290;
          id v38 = v8;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Creating upgradeController for pass: %@", v37, 0xCu);
        }
      }
      v18 = [[NPKPrecursorPassUpgradeRequestController alloc] initWithPass:v4];
      v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v18;

      [*(id *)(*((void *)&buf + 1) + 40) setDelegate:self];
      v20 = self->_internalQueue;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_53;
      v21[3] = &unk_2644D6730;
      objc_copyWeak(&v25, &location);
      v24 = &buf;
      id v22 = v4;
      id v23 = v8;
      dispatch_barrier_async(v20, v21);
      v10[2](v10, *(void *)(*((void *)&buf + 1) + 40));

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Unable to load data; pass (%@) is not a precursor pass.",
          (uint8_t *)&buf,
          0xCu);
      }
    }
    objc_initWeak((id *)&buf, self);
    v14 = self->_internalQueue;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke;
    v34[3] = &unk_2644D2BB8;
    objc_copyWeak(&v36, (id *)&buf);
    id v35 = v5;
    dispatch_async(v14, v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&buf);
  }
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", 0, *(void *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidateUpgradeControllerForPassWithUniqueID:", *(void *)(a1 + 32));
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_49(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_3;
  block[3] = &unk_2644D66E0;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_4;
  v3[3] = &unk_2644D66B8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 fetchUpgradeRequestsWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained notifyObserversDidChangeUpgradeRequestDescription:v4 forPassWithUniqueID:*(void *)(a1 + 32)];
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_53(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v7 = [*(id *)(a1 + 32) uniqueID];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Created upgradeController (%@) for pass: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [WeakRetained[4] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)invalidateUpgradeControllerForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__NPKPrecursorPassUpgradeRequestsManager_invalidateUpgradeControllerForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D2BB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(internalQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89__NPKPrecursorPassUpgradeRequestsManager_invalidateUpgradeControllerForPassWithUniqueID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidateUpgradeControllerForPassWithUniqueID:", *(void *)(a1 + 32));
}

- (id)descriptionForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  BOOL v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NPKPrecursorPassUpgradeRequestsManager_descriptionForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5B30;
  void block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__NPKPrecursorPassUpgradeRequestsManager_descriptionForPassWithUniqueID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 upgradeRequestDescription];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKPrecursorPassUpgradeRequestsManager_addObserver___block_invoke;
  block[3] = &unk_2644D2BB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__NPKPrecursorPassUpgradeRequestsManager_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_addObserver:", *(void *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPKPrecursorPassUpgradeRequestsManager_removeObserver___block_invoke;
  block[3] = &unk_2644D2BB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__NPKPrecursorPassUpgradeRequestsManager_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_removeObserver:", *(void *)(a1 + 32));
}

- (void)precursorPassUpgradeRequestsDidChangeForUpgradeController:(id)a3
{
  id v4 = a3;
  id v7 = [v4 upgradeRequestDescription];
  id v5 = [v4 pass];

  id v6 = [v5 uniqueID];
  [(NPKPrecursorPassUpgradeRequestsManager *)self notifyObserversDidChangeUpgradeRequestDescription:v7 forPassWithUniqueID:v6];
}

- (void)notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __112__NPKPrecursorPassUpgradeRequestsManager_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke;
  v11[3] = &unk_2644D34F0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __112__NPKPrecursorPassUpgradeRequestsManager_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_queue_invalidateUpgradeControllerForPassWithUniqueID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Invalidating upgradeController for pass: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_upgradeControllerMap removeObjectForKey:v4];
}

- (void)_queue_addObserver:(id)a3
{
  observerQueue = self->_observerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(observerQueue);
  [(NPKObserverManager *)self->_observerManager registerObserver:v5];
}

- (void)_queue_removeObserver:(id)a3
{
  observerQueue = self->_observerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(observerQueue);
  [(NPKObserverManager *)self->_observerManager unregisterObserver:v5];
}

- (void)_queue_notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_initWeak(&location, self);
  observerManager = self->_observerManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __119__NPKPrecursorPassUpgradeRequestsManager__queue_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke;
  v11[3] = &unk_2644D6758;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(NPKObserverManager *)observerManager enumerateObserversUsingBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __119__NPKPrecursorPassUpgradeRequestsManager__queue_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 precursorPassRequestsManager:WeakRetained didUpdateUpgradePrequestDescription:*(void *)(a1 + 32) forPassUniqueID:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeControllerMap, 0);
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end