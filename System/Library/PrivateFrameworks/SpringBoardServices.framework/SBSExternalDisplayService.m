@interface SBSExternalDisplayService
- (id)_connection;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)externalDisplayDidConnect:(id)a3;
- (void)externalDisplayDidUpdateProperties:(id)a3;
- (void)externalDisplayWillDisconnect:(id)a3;
- (void)getConnectedDisplayInfoWithCompletionHandler:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4;
- (void)setMirroringEnabled:(BOOL)a3 forDisplay:(id)a4;
- (void)setSettings:(id)a3 forDisplay:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation SBSExternalDisplayService

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSExternalDisplayService;
  [(SBSExternalDisplayService *)&v5 dealloc];
}

- (void)getConnectedDisplayInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBSExternalDisplayService *)self _connection];
  v6 = [v5 remoteTarget];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E566CBE0;
  id v9 = v4;
  id v7 = v4;
  [v6 getConnectedDisplayInfoWithCompletion:v8];
}

void __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = SBLogDisplayControlling();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke_cold_1((uint64_t)v4, v5);
    }

    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBSExternalDisplayService *)self _connection];
  v8 = [v9 remoteTarget];
  [v8 setDisplayArrangement:v7 forDisplay:v6];
}

- (void)setMirroringEnabled:(BOOL)a3 forDisplay:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v9 = [(SBSExternalDisplayService *)self _connection];
  id v7 = [v9 remoteTarget];
  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 setDisplayMirroringEnabled:v8 forDisplay:v6];
}

- (void)setSettings:(id)a3 forDisplay:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v15 = [(SBSExternalDisplayService *)self _connection];
  v13 = [v15 remoteTarget];
  v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
  [v13 setDisplayModeSettings:v12 forDisplay:v11 options:v14 completionHandler:v10];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSExternalDisplayService *)self _connection];
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SBSExternalDisplayService_addObserver___block_invoke;
  v8[3] = &unk_1E566BB08;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);
}

uint64_t __41__SBSExternalDisplayService_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SBSExternalDisplayService_removeObserver___block_invoke;
  v8[3] = &unk_1E566BB08;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x192FC0DF0](v8);
  connectionQueue = self->_connectionQueue;
  if (connectionQueue) {
    dispatch_async(connectionQueue, v6);
  }
  else {
    v6[2](v6);
  }
}

void __44__SBSExternalDisplayService_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;
  }
}

- (void)externalDisplayDidConnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_queue_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 externalDisplayDidConnect:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_queue_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 externalDisplayWillDisconnect:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)externalDisplayDidUpdateProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_queue_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 externalDisplayDidUpdateProperties:v4 withTransitionContext:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (void *)MEMORY[0x1E4F50BB8];
    id v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    uint64_t v6 = +[SBSExternalDisplayServiceSpecification identifier];
    uint64_t v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    uint64_t v8 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v8;

    id v10 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
    long long v11 = self->_connection;
    self->_connection = v10;

    long long v12 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__SBSExternalDisplayService__connection__block_invoke;
    v14[3] = &unk_1E566B118;
    v14[4] = self;
    [(BSServiceConnection *)v12 configureConnection:v14];
    [(BSServiceConnection *)self->_connection activate];

    connection = self->_connection;
  }
  return connection;
}

void __40__SBSExternalDisplayService__connection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSExternalDisplayServiceSpecification interface];
  [v3 setInterface:v4];

  id v5 = +[SBSExternalDisplayServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SBSExternalDisplayService__connection__block_invoke_2;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, &location);
  [v3 setInvalidationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SBSExternalDisplayService__connection__block_invoke_3;
  v6[3] = &unk_1E566B410;
  objc_copyWeak(&v7, &location);
  [v3 setInterruptionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__SBSExternalDisplayService__connection__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

void __40__SBSExternalDisplayService__connection__block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[1] activate];
    WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "got error fetching external displayInfos: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end