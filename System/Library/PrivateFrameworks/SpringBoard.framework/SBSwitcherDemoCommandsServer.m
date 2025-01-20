@interface SBSwitcherDemoCommandsServer
- (BOOL)loadStashedSwitcherModelFromPath:(id)a3;
- (BOOL)setShouldDisableSwitcherModelUpdates:(id)a3;
- (BOOL)stashSwitcherModelToPath:(id)a3;
- (BOOL)updateHiddenApplicationBundleIDs:(id)a3;
- (SBSwitcherDemoCommandsServer)initWithRecentAppLayouts:(id)a3 demoFilteringController:(id)a4;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation SBSwitcherDemoCommandsServer

- (SBSwitcherDemoCommandsServer)initWithRecentAppLayouts:(id)a3 demoFilteringController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBSwitcherDemoCommandsServer;
  v9 = [(SBSwitcherDemoCommandsServer *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_demoFilteringController, a4);
    objc_storeStrong((id *)&v10->_recents, a3);
    uint64_t v11 = +[SBAppSwitcherDomain rootSettings];
    switcherSettings = v10->_switcherSettings;
    v10->_switcherSettings = (SBAppSwitcherSettings *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    connections = v10->_connections;
    v10->_connections = (NSMutableArray *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.switcherDemoCommands"];
    clientAuthenticator = v10->_clientAuthenticator;
    v10->_clientAuthenticator = (FBServiceClientAuthenticator *)v15;

    uint64_t v17 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v19 = (void *)MEMORY[0x1E4F628A0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__SBSwitcherDemoCommandsServer_initWithRecentAppLayouts_demoFilteringController___block_invoke;
    v24[3] = &unk_1E6AF58F0;
    v20 = v10;
    v25 = v20;
    uint64_t v21 = [v19 listenerWithConfigurator:v24];
    id v22 = v20[3];
    v20[3] = (id)v21;

    [v20[3] activate];
  }

  return v10;
}

void __81__SBSwitcherDemoCommandsServer_initWithRecentAppLayouts_demoFilteringController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6C20] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBSwitcherDemoCommandsServer_loadStashedSwitcherModelFromPath___block_invoke;
  v10[3] = &unk_1E6B01750;
  id v11 = v4;
  v12 = self;
  dispatch_semaphore_t v13 = v5;
  v14 = &v15;
  v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

intptr_t __65__SBSwitcherDemoCommandsServer_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 56) _loadStashedModelAtPath:*(void *)(a1 + 32)];
  }
  v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (BOOL)stashSwitcherModelToPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBSwitcherDemoCommandsServer_stashSwitcherModelToPath___block_invoke;
  v10[3] = &unk_1E6B01750;
  id v11 = v4;
  v12 = self;
  dispatch_semaphore_t v13 = v5;
  v14 = &v15;
  v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

intptr_t __57__SBSwitcherDemoCommandsServer_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 56) _stashModelToPath:*(void *)(a1 + 32)];
  }
  v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (BOOL)setShouldDisableSwitcherModelUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SBSwitcherDemoCommandsServer_setShouldDisableSwitcherModelUpdates___block_invoke;
  v10[3] = &unk_1E6B08790;
  void v10[4] = self;
  id v11 = v4;
  dispatch_semaphore_t v12 = v5;
  dispatch_semaphore_t v13 = &v14;
  v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __69__SBSwitcherDemoCommandsServer_setShouldDisableSwitcherModelUpdates___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setShouldDisableSwitcherModelUpdatesForDemo:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (BOOL)updateHiddenApplicationBundleIDs:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBSwitcherDemoCommandsServer_updateHiddenApplicationBundleIDs___block_invoke;
  v10[3] = &unk_1E6B08790;
  void v10[4] = self;
  id v11 = v4;
  dispatch_semaphore_t v12 = v5;
  dispatch_semaphore_t v13 = &v14;
  v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __65__SBSwitcherDemoCommandsServer_updateHiddenApplicationBundleIDs___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 32) setHiddenApplicationBundleIDs:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  v2 = a1[6];
  return dispatch_semaphore_signal(v2);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_1E6AF7470;
  v15[4] = self;
  [v6 configureConnection:v15];
  clientAuthenticator = self->_clientAuthenticator;
  v9 = [v6 remoteProcess];
  v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_10;
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

void __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FA6C20];
  id v4 = a2;
  dispatch_semaphore_t v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  id v6 = [MEMORY[0x1E4FA6C20] interface];
  [v4 setInterface:v6];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E6B001E8;
  v7[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v7];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 40)];
}

void __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogCommon();
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
  int v5 = SBLogCommon();
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
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_demoFilteringController, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end