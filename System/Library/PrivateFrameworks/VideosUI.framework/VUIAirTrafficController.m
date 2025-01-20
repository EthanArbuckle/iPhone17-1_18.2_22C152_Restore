@interface VUIAirTrafficController
+ (id)defaultController;
- (ATConnection)connection;
- (NSMutableSet)observers;
- (OS_dispatch_queue)connectionQueue;
- (VUIAirTrafficController)init;
- (void)_onConnectionQueue_startObservingIfIdle;
- (void)_onConnectionQueue_stopObservingIfIdle;
- (void)addObserver:(id)a3;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation VUIAirTrafficController

+ (id)defaultController
{
  if (defaultController___once != -1) {
    dispatch_once(&defaultController___once, &__block_literal_global_2);
  }
  v2 = (void *)defaultController___defaultController;
  return v2;
}

void __44__VUIAirTrafficController_defaultController__block_invoke()
{
  v0 = objc_alloc_init(VUIAirTrafficController);
  v1 = (void *)defaultController___defaultController;
  defaultController___defaultController = (uint64_t)v0;
}

- (VUIAirTrafficController)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIAirTrafficController;
  v2 = [(VUIAirTrafficController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.videosui.VUIAirTrafficController.ATConnection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v2->_observers;
    v2->_observers = v5;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(VUIAirTrafficController *)self connectionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__VUIAirTrafficController_addObserver___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__VUIAirTrafficController_addObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  dispatch_queue_t v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_onConnectionQueue_startObservingIfIdle");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(VUIAirTrafficController *)self connectionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__VUIAirTrafficController_removeObserver___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__VUIAirTrafficController_removeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];

  dispatch_queue_t v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_onConnectionQueue_stopObservingIfIdle");
}

- (void)removeAllObservers
{
  dispatch_queue_t v3 = [(VUIAirTrafficController *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VUIAirTrafficController_removeAllObservers__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __45__VUIAirTrafficController_removeAllObservers__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_onConnectionQueue_stopObservingIfIdle");
}

- (void)_onConnectionQueue_startObservingIfIdle
{
  dispatch_queue_t v3 = [(VUIAirTrafficController *)self observers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4A2B8]);
    [(VUIAirTrafficController *)self setConnection:v5];
    [v5 setDelegate:self];
    [v5 registerForStatus];
  }
}

- (void)_onConnectionQueue_stopObservingIfIdle
{
  dispatch_queue_t v3 = [(VUIAirTrafficController *)self observers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = [(VUIAirTrafficController *)self connection];
    [(VUIAirTrafficController *)self setConnection:0];
    [v5 setDelegate:0];
    [v5 unregisterForStatus];
  }
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(VUIAirTrafficController *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__VUIAirTrafficController_connection_updatedProgress___block_invoke;
  v10[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__VUIAirTrafficController_connection_updatedProgress___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    dispatch_queue_t v3 = [*(id *)(a1 + 32) observers];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) airTrafficController:WeakRetained proggressDidUpdate:*(void *)(a1 + 40)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (ATConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end