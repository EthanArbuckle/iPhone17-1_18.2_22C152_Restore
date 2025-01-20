@interface MTObserverStore
- (BOOL)containsObserver:(id)a3;
- (MTObserverStore)init;
- (MTObserverStore)initWithCallbackScheduler:(id)a3;
- (NAScheduler)callbackScheduler;
- (NSHashTable)observers;
- (id)currentObservers;
- (os_unfair_lock_s)observersLock;
- (unint64_t)count;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4;
- (void)setCallbackScheduler:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObserversLock:(os_unfair_lock_s)a3;
@end

@implementation MTObserverStore

void __47__MTObserverStore_enumerateObserversWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v7 + 1) + 8 * v6)) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTObserverStore.m" lineNumber:49 description:@"observer cannot be nil"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MTObserverStore_addObserver_wasFirst___block_invoke;
  v10[3] = &unk_1E5915258;
  v10[4] = self;
  id v11 = v7;
  uint64_t v12 = a4;
  id v8 = v7;
  [(MTObserverStore *)self _withLock:v10];
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__11;
  v11[4] = __Block_byref_object_dispose__11;
  id v12 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MTObserverStore_enumerateObserversWithBlock___block_invoke;
  v10[3] = &unk_1E5915340;
  v10[4] = self;
  void v10[5] = v11;
  [(MTObserverStore *)self _withLock:v10];
  callbackScheduler = self->_callbackScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MTObserverStore_enumerateObserversWithBlock___block_invoke_2;
  v7[3] = &unk_1E5917588;
  long long v9 = v11;
  id v6 = v4;
  id v8 = v6;
  [(NAScheduler *)callbackScheduler performBlock:v7];

  _Block_object_dispose(v11, 8);
}

- (void)_withLock:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_observersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_observersLock);
}

uint64_t __47__MTObserverStore_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  return MEMORY[0x1F41817F8]();
}

uint64_t __40__MTObserverStore_addObserver_wasFirst___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
    if (result == 1) {
      **(unsigned char **)(a1 + 48) = 1;
    }
  }
  return result;
}

- (MTObserverStore)init
{
  uint64_t v3 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  id v4 = [(MTObserverStore *)self initWithCallbackScheduler:v3];

  return v4;
}

- (MTObserverStore)initWithCallbackScheduler:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTObserverStore;
  id v6 = [(MTObserverStore *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackScheduler, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v7->_observersLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)removeObserver:(id)a3
{
}

- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTObserverStore.m" lineNumber:63 description:@"observer cannot be nil"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__MTObserverStore_removeObserver_wasLast___block_invoke;
  v10[3] = &unk_1E5915258;
  v10[4] = self;
  id v11 = v7;
  id v12 = a4;
  id v8 = v7;
  [(MTObserverStore *)self _withLock:v10];
}

uint64_t __42__MTObserverStore_removeObserver_wasLast___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
    if (!result) {
      **(unsigned char **)(a1 + 48) = 1;
    }
  }
  return result;
}

- (BOOL)containsObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTObserverStore.m" lineNumber:88 description:@"observer cannot be nil"];
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__MTObserverStore_containsObserver___block_invoke;
  v10[3] = &unk_1E59150F8;
  id v12 = &v13;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [(MTObserverStore *)self _withLock:v10];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __36__MTObserverStore_containsObserver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__MTObserverStore_count__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTObserverStore *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__MTObserverStore_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)currentObservers
{
  return [(NSHashTable *)self->_observers allObjects];
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (void)setCallbackScheduler:(id)a3
{
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

@end