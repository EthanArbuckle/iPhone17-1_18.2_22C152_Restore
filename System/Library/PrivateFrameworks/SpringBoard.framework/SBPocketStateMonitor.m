@interface SBPocketStateMonitor
+ (id)sharedInstance;
- (SBPocketStateMonitor)init;
- (SBPocketStateMonitor)initWithCMPocketStateManager:(id)a3 calloutQueue:(id)a4;
- (int64_t)pocketState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBPocketStateMonitor

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBPocketStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_49 != -1) {
    dispatch_once(&sharedInstance_onceToken_49, block);
  }
  v2 = (void *)sharedInstance___result_3;
  return v2;
}

void __38__SBPocketStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = objc_alloc_init(MEMORY[0x1E4F22268]);
  uint64_t v2 = [v1 initWithCMPocketStateManager:v4 calloutQueue:MEMORY[0x1E4F14428]];
  v3 = (void *)sharedInstance___result_3;
  sharedInstance___result_3 = v2;
}

- (SBPocketStateMonitor)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init not supported -- use initWithCMPocketStateManager:calloutQueue:" userInfo:0];
  objc_exception_throw(v2);
}

- (SBPocketStateMonitor)initWithCMPocketStateManager:(id)a3 calloutQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBPocketStateMonitor;
  v9 = [(SBPocketStateMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_pocketState = 0;
    objc_storeStrong((id *)&v9->_calloutQueue, a4);
    if ([(id)objc_opt_class() isPocketStateAvailable])
    {
      objc_storeStrong((id *)&v10->_pocketStateManager, a3);
      [(CMPocketStateManager *)v10->_pocketStateManager setDelegate:v10];
    }
  }

  return v10;
}

- (void)dealloc
{
  [(CMPocketStateManager *)self->_pocketStateManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SBPocketStateMonitor;
  [(SBPocketStateMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  calloutQueue = self->_calloutQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBPocketStateMonitor_pocketStateManager_didUpdateState___block_invoke;
  v5[3] = &unk_1E6AF4A70;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(calloutQueue, v5);
}

void __58__SBPocketStateMonitor_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if ((unint64_t)(v2 - 1) >= 4) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3 != v2)
  {
    *(void *)(v1 + 16) = v2;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "pocketStateMonitor:pocketStateDidChangeFrom:to:", *(void *)(a1 + 32), v3, *(void *)(*(void *)(a1 + 32) + 16), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (int64_t)pocketState
{
  return self->_pocketState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
}

@end