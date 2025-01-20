@interface HKSPObserverSet
- (BOOL)containsObserver:(id)a3;
- (HKSPObserverSet)init;
- (HKSPObserverSet)initWithCallbackScheduler:(id)a3;
- (NAScheduler)callbackScheduler;
- (NSMapTable)observerRecords;
- (id)description;
- (id)enumerateObserversWithFutureBlock:(id)a3;
- (os_unfair_lock_s)observersLock;
- (unint64_t)count;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 callbackScheduler:(id)a4;
- (void)addObserver:(id)a3 callbackScheduler:(id)a4 wasFirst:(BOOL *)a5;
- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4;
@end

@implementation HKSPObserverSet

- (HKSPObserverSet)init
{
  v3 = [MEMORY[0x1E4F7A0F0] hkspMainThreadScheduler];
  v4 = [(HKSPObserverSet *)self initWithCallbackScheduler:v3];

  return v4;
}

- (HKSPObserverSet)initWithCallbackScheduler:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSPObserverSet;
  v5 = [(HKSPObserverSet *)&v15 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (NAScheduler *)v4;
      callbackScheduler = v6->_callbackScheduler;
      v6->_callbackScheduler = v7;
    }
    else
    {
      callbackScheduler = HKSPDispatchQueueName(v5, 0);
      uint64_t v9 = HKSPSerialQueueBackedSchedulerWithQoS(callbackScheduler, QOS_CLASS_UNSPECIFIED);
      v10 = v6->_callbackScheduler;
      v6->_callbackScheduler = (NAScheduler *)v9;
    }
    uint64_t v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observerRecords = v6->_observerRecords;
    v6->_observerRecords = (NSMapTable *)v11;

    v6->_observersLock._os_unfair_lock_opaque = 0;
    v13 = v6;
  }

  return v6;
}

- (void)addObserver:(id)a3 callbackScheduler:(id)a4 wasFirst:(BOOL *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPObserverSet.m" lineNumber:63 description:@"observer cannot be nil"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HKSPObserverSet_addObserver_callbackScheduler_wasFirst___block_invoke;
  v14[3] = &unk_1E5D32080;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  v17 = a5;
  id v11 = v10;
  id v12 = v9;
  [(HKSPObserverSet *)self _withLock:v14];
}

- (void)_withLock:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_observersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_observersLock);
}

void __58__HKSPObserverSet_addObserver_callbackScheduler_wasFirst___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3 = [[_HKSPObserverRecord alloc] initWithObserver:*(void *)(a1 + 40) callbackScheduler:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 56)) {
    **(unsigned char **)(a1 + 56) = [*(id *)(*(void *)(a1 + 32) + 24) count] == 1;
  }
}

- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4
{
}

- (void)addObserver:(id)a3
{
}

- (void)addObserver:(id)a3 callbackScheduler:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKSPObserverSet.m" lineNumber:78 description:@"observer cannot be nil"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HKSPObserverSet_removeObserver_wasLast___block_invoke;
  v10[3] = &unk_1E5D320A8;
  v10[4] = self;
  id v11 = v7;
  id v12 = a4;
  id v8 = v7;
  [(HKSPObserverSet *)self _withLock:v10];
}

uint64_t __42__HKSPObserverSet_removeObserver_wasLast___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
    **(unsigned char **)(a1 + 48) = result == 0;
  }
  return result;
}

- (void)removeAllObservers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__HKSPObserverSet_removeAllObservers__block_invoke;
  v2[3] = &unk_1E5D32170;
  v2[4] = self;
  [(HKSPObserverSet *)self _withLock:v2];
}

uint64_t __37__HKSPObserverSet_removeAllObservers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HKSPObserverSet_enumerateObserversWithBlock___block_invoke;
  v7[3] = &unk_1E5D320D0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(HKSPObserverSet *)self enumerateObserversWithFutureBlock:v7];
}

uint64_t __47__HKSPObserverSet_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  return [v1 futureWithNoResult];
}

- (id)enumerateObserversWithFutureBlock:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke;
  v27[3] = &unk_1E5D320F8;
  v27[4] = self;
  v27[5] = &v28;
  v19 = self;
  [(HKSPObserverSet *)self _withLock:v27];
  id v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = (id)v29[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 observer];

        if (v11)
        {
          id v12 = [v10 callbackScheduler];
          callbackScheduler = v12;
          if (!v12) {
            callbackScheduler = v19->_callbackScheduler;
          }
          v14 = callbackScheduler;

          id v15 = objc_opt_new();
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke_2;
          v20[3] = &unk_1E5D32120;
          id v22 = v4;
          v20[4] = v10;
          id v16 = v15;
          id v21 = v16;
          [(NAScheduler *)v14 performBlock:v20];
          [v5 addObject:v16];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v7);
  }

  v17 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v5];

  _Block_object_dispose(&v28, 8);
  return v17;
}

void __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  v2 = [v6 allObjects];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __53__HKSPObserverSet_enumerateObserversWithFutureBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) observer];
  uint64_t v3 = (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  uint64_t v4 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v5 = (id)[v3 addCompletionBlock:v4];
}

- (BOOL)containsObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKSPObserverSet.m" lineNumber:125 description:@"observer cannot be nil"];
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__HKSPObserverSet_containsObserver___block_invoke;
  v10[3] = &unk_1E5D32148;
  id v12 = &v13;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [(HKSPObserverSet *)self _withLock:v10];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __36__HKSPObserverSet_containsObserver___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__HKSPObserverSet_count__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPObserverSet *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__HKSPObserverSet_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)description
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__HKSPObserverSet_description__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPObserverSet *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __30__HKSPObserverSet_description__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) dictionaryRepresentation];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (NSMapTable)observerRecords
{
  return self->_observerRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerRecords, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

@end