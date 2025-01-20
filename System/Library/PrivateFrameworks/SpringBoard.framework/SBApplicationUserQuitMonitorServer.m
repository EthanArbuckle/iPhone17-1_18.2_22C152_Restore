@interface SBApplicationUserQuitMonitorServer
- (SBApplicationUserQuitMonitorServer)init;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3;
@end

@implementation SBApplicationUserQuitMonitorServer

- (SBApplicationUserQuitMonitorServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBApplicationUserQuitMonitorServer;
  v2 = [(SBApplicationUserQuitMonitorServer *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.monitorAppSwitcherUserQuit"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v5;

    uint64_t v7 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x1E4F628A0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__SBApplicationUserQuitMonitorServer_init__block_invoke;
    v14[3] = &unk_1E6AF58F0;
    v10 = v2;
    v15 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:v14];
    id v12 = v10[2];
    v10[2] = (id)v11;

    [v10[2] activate];
  }
  return v2;
}

void __42__SBApplicationUserQuitMonitorServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6A08] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__SBApplicationUserQuitMonitorServer_userClosedLastSceneOfApplicationWithBundleID___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __83__SBApplicationUserQuitMonitorServer_userClosedLastSceneOfApplicationWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "remoteTarget", (void)v8);
        [v7 userClosedLastSceneOfApplicationWithBundleID:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_1E6AF7470;
  v15[4] = self;
  [v6 configureConnection:v15];
  clientAuthenticator = self->_clientAuthenticator;
  long long v9 = [v6 remoteProcess];
  long long v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    id v12 = v6;
    id v14 = v12;
    dispatch_async(queue, block);
    [v12 activate];
  }
  else
  {
    [v6 invalidate];
  }
}

void __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6A08];
  id v4 = a2;
  uint64_t v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  id v6 = [MEMORY[0x1E4FA6A08] interface];
  [v4 setInterface:v6];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E6B001E8;
  v7[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v7];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
}

void __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections removeObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

@end