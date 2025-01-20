@interface RETrainingSimulationServer
+ (id)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)_safelyEnumerateObserversWithBlock:(id)a3 observerAccessBlock:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)availableRelevanceEngines:(id)a3;
- (void)availableRelevanceEnginesDidChange;
- (void)dealloc;
- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4;
- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation RETrainingSimulationServer

uint64_t __42__RETrainingSimulationServer_sharedServer__block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice = result;
  return result;
}

- (void)addObserver:(id)a3
{
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)RETrainingSimulationServer;
  v2 = [(RETrainingSimulationServer *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v3;

    v5 = objc_alloc_init(REObserverStore);
    observers = v2->_observers;
    v2->_observers = v5;

    uint64_t v7 = RECreateSharedQueue(@"TrainingSimulationClient");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x263F08AB0] processInfo];
    v10 = [v9 processName];

    v11 = RETrainingSimulationMachServiceForProcessName(v10);
    uint64_t v12 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v11];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v12;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

+ (id)sharedServer
{
  if (_fetchedInternalBuildOnceToken != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken, &__block_literal_global_7);
  }
  if (_isInternalDevice)
  {
    os_unfair_lock_lock(&sharedServer_ServerLock);
    id WeakRetained = objc_loadWeakRetained(&sharedServer_SharedServer);
    if (!WeakRetained)
    {
      id WeakRetained = [[RETrainingSimulationServer alloc] _init];
      objc_storeWeak(&sharedServer_SharedServer, WeakRetained);
    }
    os_unfair_lock_unlock(&sharedServer_ServerLock);
  }
  else
  {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)RETrainingSimulationServer;
  [(RETrainingSimulationServer *)&v4 dealloc];
}

- (void)removeObserver:(id)a3
{
}

- (void)availableRelevanceEnginesDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
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
        v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10, (void)v7);
        [v6 availableRelevanceEnginesDidChange];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = RELogForDomain(10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_t v11 = dispatch_group_create();
  observers = self->_observers;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke;
  v20[3] = &unk_2644BCB98;
  dispatch_group_t v21 = v11;
  id v22 = v8;
  id v23 = v9;
  id v13 = v9;
  id v14 = v8;
  objc_super v15 = v11;
  [(REObserverStore *)observers enumerateObserversWithBlock:v20];
  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_3;
  v18[3] = &unk_2644BCBC0;
  id v19 = v10;
  id v17 = v10;
  dispatch_group_notify(v15, queue, v18);
}

void __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_2;
  v7[3] = &unk_2644BCB70;
  id v8 = *(id *)(a1 + 32);
  [v4 relevanceEngine:v5 createElementFromDescription:v6 completion:v7];
}

void __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __86__RETrainingSimulationServer_relevanceEngine_createElementFromDescription_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_group_t v14 = dispatch_group_create();
  observers = self->_observers;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke;
  v24[3] = &unk_2644BCBE8;
  dispatch_group_t v25 = v14;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v14;
  [(REObserverStore *)observers enumerateObserversWithBlock:v24];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_3;
  block[3] = &unk_2644BCBC0;
  id v23 = v13;
  id v21 = v13;
  dispatch_group_notify(v19, queue, block);
}

void __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_2;
  v8[3] = &unk_2644BCB70;
  id v9 = *(id *)(a1 + 32);
  [v4 relevanceEngine:v5 performCommand:v6 withOptions:v7 completion:v8];
}

void __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __84__RETrainingSimulationServer_relevanceEngine_performCommand_withOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_safelyEnumerateObserversWithBlock:(id)a3 observerAccessBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_t v11 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2810000000;
  v21[3] = &unk_21E7FF34A;
  int v22 = 0;
  observers = self->_observers;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke;
  v16[3] = &unk_2644BCC38;
  id v13 = v11;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  v20 = v21;
  id v15 = v8;
  id v19 = v15;
  [(REObserverStore *)observers enumerateObserversWithBlock:v16];
  dispatch_group_notify(v13, (dispatch_queue_t)self->_queue, v10);

  _Block_object_dispose(v21, 8);
}

void __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke_2;
  v8[3] = &unk_2644BCC10;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v10 = v7;
  id v9 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v4, v8);
}

void __96__RETrainingSimulationServer__safelyEnumerateObserversWithBlock_observerAccessBlock_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1[6] + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  (*(void (**)(void))(a1[5] + 16))();

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  uint64_t v5 = a1[4];
  dispatch_group_leave(v5);
}

- (void)availableRelevanceEngines:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke;
  v11[3] = &unk_2644BCC60;
  id v12 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_4;
  v8[3] = &unk_2644BCCD0;
  id v9 = v12;
  id v10 = v4;
  id v6 = v12;
  id v7 = v4;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v11 observerAccessBlock:&__block_literal_global_16 completion:v8];
}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_3;
  v6[3] = &unk_2644BCCA8;
  id v7 = v4;
  id v5 = v4;
  [a2 availableRelevanceEngines:v6];
}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__RETrainingSimulationServer_availableRelevanceEngines___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  void v16[4] = __Block_byref_object_dispose__1;
  id v17 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke;
  v15[3] = &unk_2644BCCF8;
  v15[4] = v16;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_2;
  v13[3] = &unk_2644BCD20;
  id v8 = v6;
  id v14 = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_4;
  v10[3] = &unk_2644BCD48;
  id v9 = v7;
  id v11 = v9;
  id v12 = v16;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v15 observerAccessBlock:v13 completion:v10];

  _Block_object_dispose(v16, 8);
}

uint64_t __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7)
  {
    id v9 = v4;
    objc_storeStrong(v6, a2);
    id v4 = v9;
  }
  return MEMORY[0x270F9A758](v6, v4);
}

void __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_2644BCCA8;
  id v9 = v5;
  id v7 = v5;
  [a2 fetchAllElementIdentifiersInRelevanceEngine:v6 completion:v8];
}

uint64_t __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__RETrainingSimulationServer_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  void v16[4] = __Block_byref_object_dispose__1;
  id v17 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke;
  v15[3] = &unk_2644BCCF8;
  v15[4] = v16;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_2;
  v13[3] = &unk_2644BCD20;
  id v8 = v6;
  id v14 = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_4;
  v10[3] = &unk_2644BCD48;
  id v9 = v7;
  id v11 = v9;
  id v12 = v16;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v15 observerAccessBlock:v13 completion:v10];

  _Block_object_dispose(v16, 8);
}

uint64_t __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7)
  {
    id v9 = v4;
    objc_storeStrong(v6, a2);
    id v4 = v9;
  }
  return MEMORY[0x270F9A758](v6, v4);
}

void __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_2644BCCA8;
  id v9 = v5;
  id v7 = v5;
  [a2 fetchAllElementsInRelevanceEngine:v6 completion:v8];
}

uint64_t __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__RETrainingSimulationServer_fetchAllElementsInRelevanceEngine_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  id v18 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke;
  v16[3] = &unk_2644BCD70;
  void v16[4] = v19;
  void v16[5] = v17;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_2;
  v14[3] = &unk_2644BCD20;
  id v8 = v6;
  id v15 = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_4;
  v10[3] = &unk_2644BCDC0;
  id v9 = v7;
  id v11 = v9;
  id v12 = v19;
  id v13 = v17;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v16 observerAccessBlock:v14 completion:v10];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t isKindOfClass = a2;
  uint64_t v5 = isKindOfClass;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v11 = (void *)isKindOfClass;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
    }
    else
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v5 = (uint64_t)v11;
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = v11;
      id v7 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }

    uint64_t v5 = (uint64_t)v11;
  }
LABEL_7:
  return MEMORY[0x270F9A758](isKindOfClass, v5);
}

void __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_3;
  v8[3] = &unk_2644BCD98;
  id v9 = v5;
  id v7 = v5;
  [a2 gatherDiagnosticLogsForRelevanceEngine:v6 completion:v8];
}

uint64_t __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a2) {
    a2 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __80__RETrainingSimulationServer_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke;
  v20[3] = &unk_2644BCCF8;
  void v20[4] = v21;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2;
  v17[3] = &unk_2644BCE10;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_4;
  v14[3] = &unk_2644BCD48;
  id v13 = v10;
  id v15 = v13;
  id v16 = v21;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v20 observerAccessBlock:v17 completion:v14];

  _Block_object_dispose(v21, 8);
}

uint64_t __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 BOOLValue];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

void __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3;
  v9[3] = &unk_2644BCDE8;
  id v10 = v5;
  id v8 = v5;
  [a2 relevanceEngine:v7 runActionOfElementWithDescription1:v6 completion:v9];
}

void __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __92__RETrainingSimulationServer_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  void v21[3] = __Block_byref_object_copy__1;
  void v21[4] = __Block_byref_object_dispose__1;
  id v22 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke;
  v20[3] = &unk_2644BCCF8;
  void v20[4] = v21;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_2;
  v17[3] = &unk_2644BCE10;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_3;
  v14[3] = &unk_2644BCD48;
  id v13 = v10;
  id v15 = v13;
  id v16 = v21;
  [(RETrainingSimulationServer *)self _safelyEnumerateObserversWithBlock:v20 observerAccessBlock:v17 completion:v14];

  _Block_object_dispose(v21, 8);
}

uint64_t __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7)
  {
    id v9 = v4;
    objc_storeStrong(v6, a2);
    id v4 = v9;
  }
  return MEMORY[0x270F9A758](v6, v4);
}

uint64_t __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 relevanceEngine:*(void *)(a1 + 32) encodedObjectAtPath:*(void *)(a1 + 40) completion:a3];
}

uint64_t __77__RETrainingSimulationServer_relevanceEngine_encodedObjectAtPath_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = RETrainingSimulationClientInterface();
  [v7 setRemoteObjectInterface:v8];

  id v9 = RETrainingSimulationServerInterface();
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2644BC688;
  void block[4] = self;
  id v11 = v7;
  id v17 = v11;
  dispatch_async(queue, block);
  objc_initWeak(&location, v11);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_2644BCE60;
  void v13[4] = self;
  objc_copyWeak(&v14, &location);
  [v11 setInvalidationHandler:v13];
  [v11 resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

uint64_t __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v3[3] = &unk_2644BCE38;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

uint64_t __65__RETrainingSimulationServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)[*(id *)(*(void *)(a1 + 32) + 8) removeObject:WeakRetained];
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

void __64__RETrainingSimulationServer_availableRelevanceEnginesDidChange__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to access remote object: %@", (uint8_t *)&v2, 0xCu);
}

@end