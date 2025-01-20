@interface SBSSwitcherDemoCommands
- (BOOL)loadStashedSwitcherModelFromPath:(id)a3;
- (BOOL)setShouldDisableSwitcherModelUpdates:(BOOL)a3;
- (BOOL)stashSwitcherModelToPath:(id)a3;
- (BOOL)updateHiddenApplicationBundleIDs:(id)a3;
- (SBSSwitcherDemoCommands)init;
- (id)_standardizedAbsolutePathForPath:(id)a3;
- (void)_connectionQueue_invalidate;
- (void)_connectionQueue_setupAndActivate;
- (void)invalidate;
@end

@implementation SBSSwitcherDemoCommands

- (SBSSwitcherDemoCommands)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBSSwitcherDemoCommands;
  v2 = [(SBSSwitcherDemoCommands *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4F730] serial];
    uint64_t v4 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__SBSSwitcherDemoCommands_init__block_invoke;
    block[3] = &unk_1E566BCE8;
    v9 = v2;
    dispatch_sync(v6, block);
  }
  return v2;
}

uint64_t __31__SBSSwitcherDemoCommands_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionQueue_setupAndActivate];
}

- (void)invalidate
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBSSwitcherDemoCommands_invalidate__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __37__SBSSwitcherDemoCommands_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionQueue_invalidate];
}

- (BOOL)stashSwitcherModelToPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBSSwitcherDemoCommands_stashSwitcherModelToPath___block_invoke;
  block[3] = &unk_1E566DB18;
  id v9 = v4;
  objc_super v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __52__SBSSwitcherDemoCommands_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
  v2 = [*(id *)(a1 + 32) _standardizedAbsolutePathForPath:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 stashSwitcherModelToPath:v2];
}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBSSwitcherDemoCommands_loadStashedSwitcherModelFromPath___block_invoke;
  block[3] = &unk_1E566DB18;
  id v9 = v4;
  objc_super v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __60__SBSSwitcherDemoCommands_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
  v2 = [*(id *)(a1 + 32) _standardizedAbsolutePathForPath:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 loadStashedSwitcherModelFromPath:v2];
}

- (BOOL)setShouldDisableSwitcherModelUpdates:(BOOL)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBSSwitcherDemoCommands_setShouldDisableSwitcherModelUpdates___block_invoke;
  block[3] = &unk_1E566DB40;
  void block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(connectionQueue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __64__SBSSwitcherDemoCommands_setShouldDisableSwitcherModelUpdates___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
  v2 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 setShouldDisableSwitcherModelUpdates:v2];
}

- (BOOL)updateHiddenApplicationBundleIDs:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBSSwitcherDemoCommands_updateHiddenApplicationBundleIDs___block_invoke;
  block[3] = &unk_1E566DB18;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __60__SBSSwitcherDemoCommands_updateHiddenApplicationBundleIDs___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) remoteTarget];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 updateHiddenApplicationBundleIDs:a1[5]];
}

- (void)_connectionQueue_setupAndActivate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F50BB8];
  id v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v5 = +[SBSSwitcherDemoCommandsSessionSpecification identifier];
  id v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

  BOOL v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
  connection = self->_connection;
  self->_connection = v7;

  id v9 = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke;
  v12[3] = &unk_1E566B118;
  v12[4] = self;
  [(BSServiceConnection *)v9 configureConnection:v12];
  uint64_t v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = self->_connection;
    *(_DWORD *)buf = 138543362;
    char v14 = v11;
    _os_log_impl(&dword_18FBC5000, v10, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
  }

  [(BSServiceConnection *)self->_connection activate];
}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBSSwitcherDemoCommandsSessionSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  id v4 = +[SBSSwitcherDemoCommandsSessionSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  [v5 setActivationHandler:&__block_literal_global_50];
  [v5 setInterruptionHandler:&__block_literal_global_9_0];
  [v5 setInvalidationHandler:&__block_literal_global_12_0];
}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_connectionQueue_invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    int v6 = 138543362;
    BOOL v7 = connection;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Invalidating Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(BSServiceConnection *)self->_connection invalidate];
  id v5 = self->_connection;
  self->_connection = 0;
}

- (id)_standardizedAbsolutePathForPath:(id)a3
{
  id v3 = a3;
  if ([v3 isAbsolutePath])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 currentDirectoryPath];
    id v4 = [v6 stringByAppendingPathComponent:v3];
  }
  BOOL v7 = [v3 stringByStandardizingPath];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end