@interface SBSystemApertureLayoutMonitorServer
- (SBSystemApertureLayoutMonitorServer)init;
- (void)_notifyConnectedListenersOfUpdatedFrames;
- (void)_systemApertureLayoutDidChange:(id)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation SBSystemApertureLayoutMonitorServer

- (SBSystemApertureLayoutMonitorServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBSystemApertureLayoutMonitorServer;
  v2 = [(SBSystemApertureLayoutMonitorServer *)&v16 init];
  if (v2)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v2->_isValid = 1;
    *(void *)&v2->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)MEMORY[0x1E4F628A0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__SBSystemApertureLayoutMonitorServer_init__block_invoke;
    v14[3] = &unk_1E6AF58F0;
    v9 = v2;
    v15 = v9;
    uint64_t v10 = [v8 listenerWithConfigurator:v14];
    id v11 = v9[4];
    v9[4] = (id)v10;

    [v9[4] activate];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel__systemApertureLayoutDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
  }
  return v2;
}

void __43__SBSystemApertureLayoutMonitorServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6C28] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)_systemApertureLayoutDidChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [v4 userInfo];

  id v8 = [v5 objectForKey:@"SBSystemApertureFrames"];

  if (v8)
  {
    os_unfair_lock_lock(&self->_framesCollectionLock);
    uint64_t v6 = (NSArray *)[v8 copy];
    frames = self->_frames;
    self->_frames = v6;

    os_unfair_lock_unlock(&self->_framesCollectionLock);
    [(SBSystemApertureLayoutMonitorServer *)self _notifyConnectedListenersOfUpdatedFrames];
  }
}

- (void)invalidate
{
  self->_isValid = 0;
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer received connection %@", buf, 0xCu);
  }

  id v8 = [v6 remoteProcess];
  int v9 = [v8 pid];
  if (v9 == getpid())
  {
  }
  else
  {
    uint64_t v10 = [v6 remoteProcess];
    id v11 = [v10 auditToken];
    int v12 = [v11 hasEntitlement:@"com.apple.springboard.system-component-layout-monitoring"];

    if (v12)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke;
      v14[3] = &unk_1E6AF7470;
      void v14[4] = self;
      [v6 configureConnection:v14];
      os_unfair_lock_lock(&self->_clientServiceCollectionLock);
      [(NSMutableArray *)self->_connections addObject:v6];
      os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
      [v6 activate];
      goto LABEL_10;
    }
  }
  v13 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
  }

  [v6 invalidate];
LABEL_10:
}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6C28] serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = [MEMORY[0x1E4FA6C28] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6AF7420;
  objc_copyWeak(&v10, &location);
  id v6 = (void *)MEMORY[0x1D948C7A0](v9);
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9;
  v7[3] = &unk_1E6AF7448;
  objc_copyWeak(&v8, &location);
  v7[4] = *(void *)(a1 + 32);
  [v3 setActivationHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 3));
  v5 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer interrupted/invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  [*((id *)WeakRetained + 2) removeObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
}

void __81__SBSystemApertureLayoutMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[3]);
  v5 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureLayoutMonitorServer activated connection %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    int v6 = [v3 remoteTarget];
    [v6 systemApertureLayoutDidChange:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
}

- (void)_notifyConnectedListenersOfUpdatedFrames
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_framesCollectionLock);
  id v3 = (void *)[(NSArray *)self->_frames copy];
  os_unfair_lock_unlock(&self->_framesCollectionLock);
  connectionQueue = self->_connectionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__SBSystemApertureLayoutMonitorServer__notifyConnectedListenersOfUpdatedFrames__block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(connectionQueue, v6);
}

void __79__SBSystemApertureLayoutMonitorServer__notifyConnectedListenersOfUpdatedFrames__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "remoteTarget", (void)v9);
        [v8 systemApertureLayoutDidChange:*(void *)(a1 + 40)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end