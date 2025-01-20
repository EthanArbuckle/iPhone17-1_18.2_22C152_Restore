@interface SBSAccessibilityWindowHostingController
- (SBSAccessibilityWindowHostingController)init;
- (id)_connectionQueue_connection;
- (void)_connectionQueue_handleInterruption;
- (void)invalidate;
- (void)registerWindowWithContextID:(unsigned int)a3 atLevel:(double)a4;
- (void)unregisterWindowWithContextID:(unsigned int)a3;
@end

@implementation SBSAccessibilityWindowHostingController

- (SBSAccessibilityWindowHostingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSAccessibilityWindowHostingController;
  v2 = [(SBSAccessibilityWindowHostingController *)&v6 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

- (void)registerWindowWithContextID:(unsigned int)a3 atLevel:(double)a4
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBSAccessibilityWindowHostingController_registerWindowWithContextID_atLevel___block_invoke;
  block[3] = &unk_1E566C258;
  block[4] = self;
  *(double *)&block[5] = a4;
  unsigned int v6 = a3;
  dispatch_sync(connectionQueue, block);
}

void __79__SBSAccessibilityWindowHostingController_registerWindowWithContextID_atLevel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  unsigned int v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v6 forKey:v7];

  [*(id *)(a1 + 32) _connectionQueue_connection];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [v11 remoteTarget];
  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v8 registerWindowWithContextID:v9 atLevel:v10];
}

- (void)unregisterWindowWithContextID:(unsigned int)a3
{
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__SBSAccessibilityWindowHostingController_unregisterWindowWithContextID___block_invoke;
  v4[3] = &unk_1E566C280;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(connectionQueue, v4);
}

void __73__SBSAccessibilityWindowHostingController_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v2 removeObjectForKey:v3];

  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned int v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
  [*(id *)(a1 + 32) _connectionQueue_connection];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = [v8 remoteTarget];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v6 unregisterWindowWithContextID:v7];
}

- (void)invalidate
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SBSAccessibilityWindowHostingController_invalidate__block_invoke;
  block[3] = &unk_1E566BCE8;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __53__SBSAccessibilityWindowHostingController_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (id)_connectionQueue_connection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F50BB8];
    unsigned int v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    unsigned int v6 = +[SBSAccessibilityWindowHostingSpecification identifier];
    v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    id v8 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
    v9 = self->_connection;
    self->_connection = v8;

    v10 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke;
    v14[3] = &unk_1E566B118;
    v14[4] = self;
    [(BSServiceConnection *)v10 configureConnection:v14];
    id v11 = SBLogAccessibilityWindowHosting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_connection;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_18FBC5000, v11, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
    }

    [(BSServiceConnection *)self->_connection activate];
    connection = self->_connection;
  }
  return connection;
}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SBSAccessibilityWindowHostingSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  unsigned int v5 = +[SBSAccessibilityWindowHostingSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setActivationHandler:&__block_literal_global_25];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_7;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_8;
  v6[3] = &unk_1E566B0F0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogAccessibilityWindowHosting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = SBLogAccessibilityWindowHosting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _connectionQueue_handleInterruption];
  }
}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = SBLogAccessibilityWindowHosting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 1) == v3)
  {
    *((void *)WeakRetained + 1) = 0;
  }
}

- (void)_connectionQueue_handleInterruption
{
  [(BSServiceConnection *)self->_connection activate];
  registeredWindowContextIDsToLevel = self->_registeredWindowContextIDsToLevel;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBSAccessibilityWindowHostingController__connectionQueue_handleInterruption__block_invoke;
  v4[3] = &unk_1E566C2A8;
  v4[4] = self;
  [(NSMutableDictionary *)registeredWindowContextIDsToLevel enumerateKeysAndObjectsUsingBlock:v4];
}

void __78__SBSAccessibilityWindowHostingController__connectionQueue_handleInterruption__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 remoteTarget];
  [v7 registerWindowWithContextID:v6 atLevel:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredWindowContextIDsToLevel, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end