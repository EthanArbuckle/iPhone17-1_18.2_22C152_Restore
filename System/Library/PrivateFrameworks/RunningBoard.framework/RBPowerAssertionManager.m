@interface RBPowerAssertionManager
- (BOOL)_unitTest_hasPowerAssertionForProcess:(id)a3;
- (BOOL)_unitTest_hasSystemPowerAssertion;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBPowerAssertionManager)init;
- (RBPowerAssertionManagerDelegate)delegate;
- (id)_unitTest_nameOfPowerAssertionForProcess:(id)a3;
- (id)_unitTest_nameOfPowerAssertionForSystem;
- (uint64_t)_queue_invalidateAssertion:(uint64_t)result;
- (void)_queue_didAcquireAssertion;
- (void)_queue_updateProcessAssertion:(void *)a3 withState:;
- (void)_queue_willInvalidateAssertion;
- (void)addProcess:(id)a3;
- (void)applySystemState:(id)a3;
- (void)dealloc;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeProcess:(id)a3;
- (void)removeStateForProcessIdentity:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RBPowerAssertionManager

- (void)didUpdateProcessStates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RBPowerAssertionManager_didUpdateProcessStates___block_invoke;
  v7[3] = &unk_2647C7B98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__RBPowerAssertionManager_didUpdateProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "identity", (void)v13);
        v9 = [v7 updatedState];
        id v10 = (id)[*(id *)(*(void *)(a1 + 40) + 8) setValue:v9 forIdentity:v8];
        uint64_t v11 = *(void *)(a1 + 40);
        v12 = [*(id *)(v11 + 16) valueForIdentity:v8];
        -[RBPowerAssertionManager _queue_updateProcessAssertion:withState:](v11, v12, v9);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)_queue_updateProcessAssertion:(void *)a3 withState:
{
  if (a1)
  {
    if (a2)
    {
      id v5 = a2;
      objc_setProperty_nonatomic_copy(v5, v6, a3, 48);
      void v7[4] = a1;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke;
      v8[3] = &unk_2647C7CC8;
      v8[4] = a1;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke_2;
      v7[3] = &unk_2647C7CC8;
      -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:]((uint64_t)v5, v8, v7);
    }
  }
}

void __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke(uint64_t a1)
{
}

- (void)_queue_didAcquireAssertion
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v2 + 1;
    if (!v2)
    {
      uint64_t v3 = rbs_power_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_DEFAULT, "Acquired first power assertion", v5, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained powerAssertionManagerDidPreventIdleSleep:a1];
    }
  }
}

void __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke_2(uint64_t a1)
{
}

- (void)_queue_willInvalidateAssertion
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2)
    {
      SEL v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:sel__queue_willInvalidateAssertion object:a1 file:@"RBPowerAssertionManager.m" lineNumber:461 description:@"Unbalanced attempt to release a power assertion"];

      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v3 = v2 - 1;
    *(void *)(a1 + 32) = v3;
    if (!v3)
    {
      uint64_t v4 = rbs_power_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "Released last power assertion", v7, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained powerAssertionManagerDidAllowIdleSleep:a1];
    }
  }
}

- (void)addProcess:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__RBPowerAssertionManager_addProcess___block_invoke;
  v7[3] = &unk_2647C7B98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__RBPowerAssertionManager_removeStateForProcessIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(v2 + 16) valueForIdentity:*(void *)(a1 + 40)];
  -[RBPowerAssertionManager _queue_invalidateAssertion:](v2, (uint64_t)v3);

  [*(id *)(*(void *)(a1 + 32) + 16) removeIdentity:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v5 removeIdentity:v4];
}

void __41__RBPowerAssertionManager_removeProcess___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identity];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__RBPowerAssertionManager_removeProcess___block_invoke_2;
  v5[3] = &unk_2647C7CF0;
  id v6 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 removeValueForIdentity:v2 withPredicate:v5];
  -[RBPowerAssertionManager _queue_invalidateAssertion:](*(void *)(a1 + 40), (uint64_t)v4);
}

void __38__RBPowerAssertionManager_addProcess___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) identity];
  uint64_t v2 = -[RBProcessPowerAssertion initWithProcess:]((id *)[RBProcessPowerAssertion alloc], *(void **)(a1 + 32));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 16) setValue:v2 forIdentity:v6];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(v4 + 8) valueForIdentity:v6];
  -[RBPowerAssertionManager _queue_updateProcessAssertion:withState:](v4, v2, v5);

  -[RBPowerAssertionManager _queue_invalidateAssertion:](*(void *)(a1 + 40), (uint64_t)v3);
}

- (uint64_t)_queue_invalidateAssertion:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      v2[0] = MEMORY[0x263EF8330];
      v2[1] = 3221225472;
      v2[2] = __54__RBPowerAssertionManager__queue_invalidateAssertion___block_invoke;
      v2[3] = &unk_2647C7CC8;
      v2[4] = result;
      return -[RBPowerAssertion invalidateWithHandler:](a2, v2);
    }
  }
  return result;
}

BOOL __41__RBPowerAssertionManager_removeProcess___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 56);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 == *(void *)(a1 + 32);
}

- (void)removeStateForProcessIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__RBPowerAssertionManager_removeStateForProcessIdentity___block_invoke;
  v7[3] = &unk_2647C7B98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeProcess:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__RBPowerAssertionManager_removeProcess___block_invoke;
  v7[3] = &unk_2647C7B98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (RBPowerAssertionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)RBPowerAssertionManager;
  uint64_t v2 = [(RBPowerAssertionManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F64650] createBackgroundQueue:@"RBPowerAssertionManager"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc_init(RBProcessMap);
    stateMap = v2->_stateMap;
    v2->_stateMap = v5;

    v7 = objc_alloc_init(RBProcessMap);
    assertionMap = v2->_assertionMap;
    v2->_assertionMap = v7;

    v9 = objc_alloc_init(RBSystemPowerAssertion);
    systemAssertion = v2->_systemAssertion;
    v2->_systemAssertion = v9;
  }
  return v2;
}

- (void)dealloc
{
  -[RBPowerAssertion invalidateWithHandler:]((uint64_t)self->_systemAssertion, 0);
  [(RBProcessMap *)self->_assertionMap enumerateWithBlock:&__block_literal_global_80];
  [(RBProcessMap *)self->_assertionMap removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)RBPowerAssertionManager;
  [(RBPowerAssertionManager *)&v3 dealloc];
}

uint64_t __34__RBPowerAssertionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[RBPowerAssertion invalidateWithHandler:](a3, 0);
}

- (NSString)debugDescription
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__RBPowerAssertionManager_debugDescription__block_invoke;
  block[3] = &unk_2647C7CA0;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  block[7] = &v22;
  dispatch_sync(queue, block);
  id v4 = [NSString alloc];
  uint64_t v5 = [(id)objc_opt_class() description];
  id v6 = (void *)v5;
  v7 = @"system=";
  id v8 = &stru_26DA9D688;
  if (*((unsigned char *)v19 + 24)) {
    id v8 = (__CFString *)v13[5];
  }
  else {
    v7 = &stru_26DA9D688;
  }
  v9 = (void *)[v4 initWithFormat:@"<%@| assertiond:[\n\t%@%@%@\n\t]>", v5, v7, v8, v23[5]];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return (NSString *)v9;
}

uint64_t __43__RBPowerAssertionManager_debugDescription__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 24);
  if (v2) {
    LOBYTE(v2) = *(_DWORD *)(v2 + 8) != 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  objc_super v3 = *(void **)(a1[4] + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__RBPowerAssertionManager_debugDescription__block_invoke_2;
  v5[3] = &unk_2647C7C78;
  void v5[4] = a1[7];
  return [v3 enumerateWithBlock:v5];
}

void __43__RBPowerAssertionManager_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4 && *((_DWORD *)v4 + 2))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v4;
    id v6 = v4[7];
    v7 = [v6 description];
    [v5 appendFormat:@"%@=%@\n\t", v7, v8];

    id v4 = v8;
  }
}

- (void)applySystemState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke;
  v7[3] = &unk_2647C7B98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__RBPowerAssertionManager_applySystemState___block_invoke(uint64_t a1)
{
  uint64_t v2 = rbs_power_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_INFO, "Received a system state change", buf, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v3, *(id *)(a1 + 40), 48);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
  }
  v6[4] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke_91;
  v7[3] = &unk_2647C7CC8;
  void v7[4] = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke_2;
  v6[3] = &unk_2647C7CC8;
  -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:]((uint64_t)v5, v7, v6);
}

void __44__RBPowerAssertionManager_applySystemState___block_invoke_91(uint64_t a1)
{
}

void __44__RBPowerAssertionManager_applySystemState___block_invoke_2(uint64_t a1)
{
}

- (NSString)stateCaptureTitle
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __54__RBPowerAssertionManager__queue_invalidateAssertion___block_invoke(uint64_t a1)
{
}

- (BOOL)_unitTest_hasSystemPowerAssertion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__RBPowerAssertionManager__unitTest_hasSystemPowerAssertion__block_invoke;
  v5[3] = &unk_2647C7D18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__RBPowerAssertionManager__unitTest_hasSystemPowerAssertion__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 24);
  if (v1) {
    LOBYTE(v1) = *(_DWORD *)(v1 + 8) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (BOOL)_unitTest_hasPowerAssertionForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__RBPowerAssertionManager__unitTest_hasPowerAssertionForProcess___block_invoke;
  block[3] = &unk_2647C7D40;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __65__RBPowerAssertionManager__unitTest_hasPowerAssertionForProcess___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [*(id *)(a1 + 40) identity];
  objc_msgSend(v2, "valueForIdentity:");
  char v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    BOOL v4 = v3[2] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (id)_unitTest_nameOfPowerAssertionForSystem
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForSystem__block_invoke;
  v5[3] = &unk_2647C7D18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForSystem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (id)_unitTest_nameOfPowerAssertionForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForProcess___block_invoke;
  block[3] = &unk_2647C7D40;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForProcess___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [*(id *)(a1 + 40) identity];
  uint64_t v3 = objc_msgSend(v2, "valueForIdentity:");
  id v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 24);
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
}

- (RBPowerAssertionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RBPowerAssertionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemAssertion, 0);
  objc_storeStrong((id *)&self->_assertionMap, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end