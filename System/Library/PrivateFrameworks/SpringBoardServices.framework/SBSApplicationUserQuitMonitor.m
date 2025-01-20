@interface SBSApplicationUserQuitMonitor
- (SBSApplicationUserQuitMonitor)initWithDelegate:(id)a3;
- (void)_connectionQueue_invalidate;
- (void)_connectionQueue_setupAndActivate;
- (void)invalidate;
- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3;
@end

@implementation SBSApplicationUserQuitMonitor

- (SBSApplicationUserQuitMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationUserQuitMonitor;
  v5 = [(SBSApplicationUserQuitMonitor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x1E4F4F730] serial];
    uint64_t v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = v6->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SBSApplicationUserQuitMonitor_initWithDelegate___block_invoke;
    block[3] = &unk_1E566BCE8;
    v13 = v6;
    dispatch_async(v10, block);
  }
  return v6;
}

uint64_t __50__SBSApplicationUserQuitMonitor_initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionQueue_setupAndActivate];
}

- (void)invalidate
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SBSApplicationUserQuitMonitor_invalidate__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __43__SBSApplicationUserQuitMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionQueue_invalidate];
}

- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained quitMonitor:self userClosedLastSceneOfApplicationWithBundleID:v5];
}

- (void)_connectionQueue_setupAndActivate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F50BB8];
  id v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  id v5 = +[SBSApplicationUserQuitMonitorSessionSpecification identifier];
  v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

  v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
  connection = self->_connection;
  self->_connection = v7;

  v9 = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke;
  v12[3] = &unk_1E566B118;
  v12[4] = self;
  [(BSServiceConnection *)v9 configureConnection:v12];
  v10 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_connection;
    *(_DWORD *)buf = 138543362;
    objc_super v14 = v11;
    _os_log_impl(&dword_18FBC5000, v10, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
  }

  [(BSServiceConnection *)self->_connection activate];
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[SBSApplicationUserQuitMonitorSessionSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  id v4 = +[SBSApplicationUserQuitMonitorSessionSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  [v5 setActivationHandler:&__block_literal_global_48];
  [v5 setInterruptionHandler:&__block_literal_global_8];
  [v5 setInvalidationHandler:&__block_literal_global_11];
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = SBLogAppQuitMonitor();
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
  v3 = SBLogAppQuitMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    int v6 = 138543362;
    v7 = connection;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "Invalidating Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(BSServiceConnection *)self->_connection invalidate];
  id v5 = self->_connection;
  self->_connection = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end