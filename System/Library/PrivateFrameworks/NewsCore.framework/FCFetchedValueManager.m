@interface FCFetchedValueManager
- (FCBoostableOperationThrottler)operationThrottler;
- (FCFetchedValueDescriptor)descriptor;
- (FCFetchedValueManager)init;
- (FCFetchedValueManager)initWithDescriptor:(id)a3;
- (FCFetchedValueObservable)observable;
- (NFCopying)value;
- (id)_updateDependentManagersPromiseWithQualityOfService:(int64_t)a3;
- (id)valuePromiseWithQualityOfService:(int64_t)a3;
- (unint64_t)_cachePolicyForOptions:(unint64_t)a3;
- (unint64_t)_optionsForCachePolicy:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)fetchValueWithQualityOfService:(int64_t)a3 completion:(id)a4;
- (void)fetchedObjectManager:(id)a3 valueDidChange:(id)a4;
- (void)fetchedValueDescriptorValueIsDirty:(id)a3;
- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation FCFetchedValueManager

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDependentManagersPromiseWithQualityOfService:*(void *)(a1 + 40)];
}

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_updateDependentManagersPromiseWithQualityOfService:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

uint64_t __44__FCFetchedValueManager_initWithDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) isValue:a2 equalToValue:a3];
}

uint64_t __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 observable];
  [v4 setValue:v3];

  return 0;
}

void __79__FCFetchedValueManager_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observable];
  id v5 = 0;
  id v3 = [v2 valueWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (FCFetchedValueManager)initWithDescriptor:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "descriptor");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCFetchedValueManager initWithDescriptor:]";
    __int16 v32 = 2080;
    v33 = "FCFetchedValueManager.m";
    __int16 v34 = 1024;
    int v35 = 43;
    __int16 v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v28.receiver = self;
  v28.super_class = (Class)FCFetchedValueManager;
  id v5 = [(FCFetchedValueManager *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    descriptor = v5->_descriptor;
    v5->_descriptor = (FCFetchedValueDescriptor *)v6;

    v8 = [[FCBoostableOperationThrottler alloc] initWithDelegate:v5];
    operationThrottler = v5->_operationThrottler;
    v5->_operationThrottler = v8;

    v10 = [FCFetchedValueObservable alloc];
    v11 = [v4 fastCachedValue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__FCFetchedValueManager_initWithDescriptor___block_invoke;
    v26[3] = &unk_1E5B55330;
    id v12 = v4;
    id v27 = v12;
    uint64_t v13 = [(FCFetchedValueObservable *)v10 initWithManager:v5 initialValue:v11 equalityTest:v26];
    observable = v5->_observable;
    v5->_observable = (FCFetchedValueObservable *)v13;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v15 = [v12 inputManagers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) addObserver:v5];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v17);
    }

    [v12 setObserver:v5];
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueManager addObserver:]";
    __int16 v9 = 2080;
    v10 = "FCFetchedValueManager.m";
    __int16 v11 = 1024;
    int v12 = 97;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCFetchedValueManager *)self observable];
  [v5 addObserver:v4];
}

- (NFCopying)value
{
  v2 = [(FCFetchedValueManager *)self observable];
  id v3 = [v2 value];

  return (NFCopying *)v3;
}

- (FCFetchedValueObservable)observable
{
  return self->_observable;
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 48)];
  id v4 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v4);
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v27 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = dispatch_group_create();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v7 = [*(id *)(a1 + 32) descriptor];
  v8 = [v7 inputManagers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v13 removeObserver:*(void *)(a1 + 32)];
        dispatch_group_enter(v6);
        uint64_t v14 = *(void *)(a1 + 40);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_2;
        v37[3] = &unk_1E5B553D0;
        id v38 = v5;
        v39 = v13;
        uint64_t v40 = *(void *)(a1 + 32);
        v41 = v6;
        [v13 fetchValueWithQualityOfService:v14 completion:v37];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v10);
  }

  if (FCDispatchGroupIsEmpty(v6))
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3;
    v33[3] = &unk_1E5B4E150;
    uint64_t v15 = &v34;
    uint64_t v16 = &v35;
    uint64_t v18 = v27;
    uint64_t v17 = v28;
    __int16 v34 = v5;
    id v35 = v27;
    v19 = &v36;
    id v36 = v28;
    id v20 = v28;
    id v21 = v27;
    id v22 = v5;
    __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3((uint64_t)v33);
  }
  else
  {
    long long v23 = FCDispatchQueueForQualityOfService(*(void *)(a1 + 40));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_4;
    block[3] = &unk_1E5B4E150;
    uint64_t v15 = &v30;
    uint64_t v16 = &v31;
    uint64_t v18 = v27;
    uint64_t v17 = v28;
    v30 = v5;
    id v31 = v27;
    v19 = &v32;
    id v32 = v28;
    id v24 = v28;
    id v25 = v27;
    id v26 = v5;
    dispatch_group_notify(v6, v23, block);
  }
}

id __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachePolicyForOptions:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) descriptor];
  id v4 = [v3 valuePromiseWithCachePolicy:v2 qualityOfService:*(void *)(a1 + 48)];

  return v4;
}

- (FCFetchedValueDescriptor)descriptor
{
  return self->_descriptor;
}

- (unint64_t)_cachePolicyForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (void)fetchValueWithQualityOfService:(int64_t)a3 completion:(id)a4
{
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(FCFetchedValueManager *)self _optionsForCachePolicy:a3];
  uint64_t v10 = [(FCFetchedValueManager *)self operationThrottler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__FCFetchedValueManager_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  v12[3] = &unk_1E5B4CC80;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 tickleWithQualityOfService:a4 data:v9 completion:v12];
}

- (unint64_t)_optionsForCachePolicy:(unint64_t)a3
{
  return 2 * (a3 == 1);
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCFetchedValueManager removeObserver:]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCFetchedValueManager.m";
    __int16 v11 = 1024;
    int v12 = 103;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCFetchedValueManager *)self observable];
  [v5 removeObserver:v4];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(FCFetchedValueManager *)self operationThrottler];
  uint64_t v9 = [v8 mergedData];

  uint64_t v10 = [MEMORY[0x1E4F81BF0] asVoid];
  if ((v9 & 1) == 0)
  {
    __int16 v11 = zalgo();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke;
    v27[3] = &unk_1E5B55358;
    v27[4] = self;
    v27[5] = a4;
    uint64_t v12 = [v10 thenOn:v11 then:v27];

    uint64_t v10 = (void *)v12;
  }
  __int16 v13 = zalgo();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_2;
  v26[3] = &unk_1E5B55380;
  void v26[4] = self;
  v26[5] = v9;
  v26[6] = a4;
  uint64_t v14 = [v10 thenOn:v13 then:v26];

  uint64_t v15 = zalgo();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_3;
  v25[3] = &unk_1E5B553A8;
  v25[4] = self;
  uint64_t v16 = [v14 thenOn:v15 then:v25];
  uint64_t v17 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_4;
  v24[3] = &unk_1E5B4FD28;
  v24[4] = self;
  uint64_t v18 = [v16 errorOn:v17 error:v24];
  v19 = zalgo();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_5;
  v22[3] = &unk_1E5B4CA88;
  id v23 = v7;
  id v20 = v7;
  id v21 = (id)[v18 alwaysOn:v19 always:v22];
}

- (FCBoostableOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) readOnlyArray];
  if ([v3 count])
  {
    if ([v3 count] == 1) {
      [v3 firstObject];
    }
    else {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:16 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_operationThrottler, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

void __77__FCFetchedValueManager__updateDependentManagersPromiseWithQualityOfService___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) readOnlyArray];
  if ([v3 count])
  {
    if ([v3 count] == 1) {
      [v3 firstObject];
    }
    else {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:16 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (FCFetchedValueManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCFetchedValueManager init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCFetchedValueManager.m";
    __int16 v11 = 1024;
    int v12 = 38;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFetchedValueManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)fetchedValueDescriptorValueIsDirty:(id)a3
{
  id v3 = [(FCFetchedValueManager *)self operationThrottler];
  [v3 tickleWithQualityOfService:17 data:1 completion:0];
}

- (void)fetchedObjectManager:(id)a3 valueDidChange:(id)a4
{
  id v4 = [(FCFetchedValueManager *)self operationThrottler];
  [v4 tickleWithQualityOfService:17 data:1 completion:0];
}

void __97__FCFetchedValueManager_operationThrottler_performAsyncOperationWithQualityOfService_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 observable];
  [v4 handleError:v3];
}

- (id)valuePromiseWithQualityOfService:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke;
  v8[3] = &unk_1E5B553F8;
  v8[4] = self;
  v8[5] = a3;
  id v6 = (void *)[v5 initWithResolver:v8];
  return v6;
}

void __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke_2;
  v11[3] = &unk_1E5B55420;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 fetchValueWithQualityOfService:v7 completion:v11];
}

uint64_t __67__FCFetchedValueManager_Promise__valuePromiseWithQualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end