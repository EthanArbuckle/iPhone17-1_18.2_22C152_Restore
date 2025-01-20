@interface SBCaptureApplicationService
+ (SBCaptureApplicationService)sharedInstance;
- (OS_dispatch_queue)queue;
- (SBCaptureApplicationService)initWithCaptureApplicationProvider:(id)a3;
- (id)_captureApplication;
- (void)addObserver:(id)a3;
- (void)applicationDidCompleteTransition;
- (void)beginDelayingAppearance;
- (void)endDelayingAppearance;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation SBCaptureApplicationService

+ (SBCaptureApplicationService)sharedInstance
{
  if (sharedInstance_onceToken_44 != -1) {
    dispatch_once(&sharedInstance_onceToken_44, &__block_literal_global_303);
  }
  v2 = (void *)sharedInstance___result_2;
  return (SBCaptureApplicationService *)v2;
}

void __45__SBCaptureApplicationService_sharedInstance__block_invoke()
{
  v0 = [SBCaptureApplicationService alloc];
  id v3 = +[SBCaptureApplicationCenter sharedInstance];
  uint64_t v1 = [(SBCaptureApplicationService *)v0 initWithCaptureApplicationProvider:v3];
  v2 = (void *)sharedInstance___result_2;
  sharedInstance___result_2 = v1;
}

- (SBCaptureApplicationService)initWithCaptureApplicationProvider:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBCaptureApplicationService;
  v6 = [(SBCaptureApplicationService *)&v20 init];
  if (v6)
  {
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBCaptureApplicationService: init", buf, 2u);
    }

    objc_storeStrong((id *)&v6->_applicationProvider, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    connections = v6->_connections;
    v6->_connections = (NSMutableSet *)v8;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)Serial;

    v12 = (void *)MEMORY[0x1E4F628A0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SBCaptureApplicationService_initWithCaptureApplicationProvider___block_invoke;
    v17[3] = &unk_1E6AF58F0;
    v13 = v6;
    v18 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v17];
    id v15 = v13[1];
    v13[1] = (id)v14;

    [v13[1] activate];
  }

  return v6;
}

void __66__SBCaptureApplicationService_initWithCaptureApplicationProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  id v3 = [MEMORY[0x1E4FA6A30] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "SBCaptureApplicationService: received connection: %{public}@", buf, 0xCu);
  }

  if (LCSFeatureEnabled())
  {
    uint64_t v8 = [(SBCaptureApplicationService *)self queue];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke;
    v16 = &unk_1E6AF5290;
    id v9 = v6;
    id v17 = v9;
    v18 = self;
    dispatch_sync(v8, &v13);

    objc_msgSend(v9, "activate", v13, v14, v15, v16);
  }
  else
  {
    v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v6 remoteToken];
      int v12 = [v11 pid];
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBCaptureApplicationService: Invalidating connection from pid %i - Feature is not enabled", buf, 8u);
    }
    [v6 invalidate];
  }
}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke(int8x16_t *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_2;
  v5[3] = &unk_1E6AFD478;
  int8x16_t v4 = a1[2];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  [(id)v4.i64[0] configureConnection:v5];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "SBCaptureApplicationService: adding connection: %{public}@", buf, 0xCu);
  }

  [*(id *)(a1[2].i64[1] + 16) addObject:a1[2].i64[0]];
}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6A30];
  id v4 = a2;
  id v5 = [v3 interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  int8x16_t v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v4 setServiceQuality:v6];

  v7 = [*(id *)(a1 + 32) queue];
  [v4 setTargetQueue:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_3;
  v10[3] = &unk_1E6AFD8D0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v4 setInvalidationHandler:v10];
}

void __73__SBCaptureApplicationService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) remoteProcess];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBCaptureApplicationService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) removeObject:v3];
  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v3];
}

- (id)_captureApplication
{
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  id v5 = [v4 bundleIdentifier];

  int v6 = [(SBFCaptureApplicationProviding *)self->_applicationProvider captureApplicationForBundleIdentifier:v5];

  return v6;
}

- (void)applicationDidCompleteTransition
{
}

- (void)beginDelayingAppearance
{
}

- (void)endDelayingAppearance
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end