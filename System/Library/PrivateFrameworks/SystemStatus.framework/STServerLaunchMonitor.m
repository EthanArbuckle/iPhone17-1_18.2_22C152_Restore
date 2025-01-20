@interface STServerLaunchMonitor
+ (id)sharedInstance;
- (STServerLaunchMonitor)init;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation STServerLaunchMonitor

+ (id)sharedInstance
{
  if (qword_1EB5A3528 != -1) {
    dispatch_once(&qword_1EB5A3528, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_4;

  return v2;
}

uint64_t __39__STServerLaunchMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(STServerLaunchMonitor);
  uint64_t v1 = _MergedGlobals_4;
  _MergedGlobals_4 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (STServerLaunchMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)STServerLaunchMonitor;
  v2 = [(STServerLaunchMonitor *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v7 = BSDispatchQueueCreateSerial();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v7;

    v2->_notifyToken = -1;
    objc_initWeak(&location, v2);
    v9 = v2->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__STServerLaunchMonitor_init__block_invoke;
    block[3] = &unk_1E6B633C0;
    v12 = v2;
    objc_copyWeak(&v13, &location);
    dispatch_sync(v9, block);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__STServerLaunchMonitor_init__block_invoke(uint64_t a1)
{
  v2 = *(int **)(a1 + 32);
  uint64_t v3 = v2 + 2;
  if (v2) {
    v2 = (int *)*((void *)v2 + 3);
  }
  v4 = v2;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__STServerLaunchMonitor_init__block_invoke_2;
  handler[3] = &unk_1E6B63398;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  notify_register_dispatch("com.apple.systemstatus.server-launch", v3, v4, handler);

  objc_destroyWeak(&v6);
}

void __29__STServerLaunchMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)[*((id *)WeakRetained + 2) copy];
    v4 = v2[4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__STServerLaunchMonitor_init__block_invoke_3;
    v6[3] = &unk_1E6B63080;
    id v7 = v3;
    v8 = v2;
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

void __29__STServerLaunchMonitor_init__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "didObserveServerLaunch:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)invalidate
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__STServerLaunchMonitor_invalidate__block_invoke;
  block[3] = &unk_1E6B633E8;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __35__STServerLaunchMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 8);
  if (v3 != -1)
  {
    notify_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__STServerLaunchMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __37__STServerLaunchMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[2];
  }
  return [v1 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__STServerLaunchMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __40__STServerLaunchMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[2];
  }
  return [v1 removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end