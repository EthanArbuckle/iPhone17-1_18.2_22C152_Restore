@interface SBCaptureIntentService
- (OS_dispatch_queue)queue;
- (SBCaptureIntentService)init;
- (id)_captureApplication;
- (id)captureIntentContext;
- (void)captureIntentContext;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setCaptureIntentContext:(id)a3;
@end

@implementation SBCaptureIntentService

- (SBCaptureIntentService)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureIntentService;
  v2 = [(SBCaptureIntentService *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[SBCaptureApplicationCenter sharedInstance];
    applicationProvider = v2->_applicationProvider;
    v2->_applicationProvider = (SBFCaptureApplicationProviding *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v9 = (void *)MEMORY[0x1E4F628A0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __30__SBCaptureIntentService_init__block_invoke;
    v14[3] = &unk_1E6AF58F0;
    v10 = v2;
    v15 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:v14];
    id v12 = v10[1];
    v10[1] = (id)v11;

    [v10[1] activate];
  }
  return v2;
}

void __30__SBCaptureIntentService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6A50] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "SBCaptureIntentService: received connection: %{public}@", buf, 0xCu);
  }

  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
    char v8 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  }
  else {
    char v8 = 0;
  }
  if (LCSFeatureEnabled() & 1) != 0 || (v8)
  {
    v10 = [(SBCaptureIntentService *)self queue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke;
    v15 = &unk_1E6AF5290;
    id v11 = v6;
    id v16 = v11;
    v17 = self;
    dispatch_sync(v10, &v12);

    objc_msgSend(v11, "activate", v12, v13, v14, v15);
  }
  else
  {
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureIntentService listener:didReceiveConnection:withContext:](v6, v9);
    }

    [v6 invalidate];
  }
}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke(int8x16_t *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_2;
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
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "SBCaptureIntentService: adding connection: %{public}@", buf, 0xCu);
  }

  [*(id *)(a1[2].i64[1] + 16) addObject:a1[2].i64[0]];
}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6A50];
  id v4 = a2;
  uint64_t v5 = [v3 interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  int8x16_t v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v4 setServiceQuality:v6];

  v7 = [*(id *)(a1 + 32) queue];
  [v4 setTargetQueue:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_3;
  v10[3] = &unk_1E6AFD8D0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v4 setInvalidationHandler:v10];
}

void __68__SBCaptureIntentService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) remoteProcess];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBCaptureIntentService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) removeObject:v3];
  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v3];
}

- (id)_captureApplication
{
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  uint64_t v5 = [v4 bundleIdentifier];

  int v6 = [(SBFCaptureApplicationProviding *)self->_applicationProvider captureApplicationForBundleIdentifier:v5];
  if (!v6)
  {
    int v6 = [(SBFCaptureApplicationProviding *)self->_applicationProvider captureApplicationForExtensionIdentifier:v5];
  }

  return v6;
}

- (id)captureIntentContext
{
  v2 = [(SBCaptureIntentService *)self _captureApplication];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 captureIntentContext];
  }
  else
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureIntentService captureIntentContext](v5);
    }

    id v4 = 0;
  }

  return v4;
}

- (void)setCaptureIntentContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 <= 0x1000)
  {
    uint64_t v8 = [(SBCaptureIntentService *)self _captureApplication];
    v7 = v8;
    if (v8)
    {
      [v8 setCaptureIntentContext:v4];
    }
    else
    {
      uint64_t v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBCaptureIntentService setCaptureIntentContext:](v9);
      }
    }
  }
  else
  {
    uint64_t v6 = v5;
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureIntentService setCaptureIntentContext:](v6, v7);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 remoteToken];
  v4[0] = 67109120;
  v4[1] = [v3 pid];
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBCaptureIntentService: Invalidating connection from pid %i - Feature is not enabled", (uint8_t *)v4, 8u);
}

- (void)captureIntentContext
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Remote target is not capture eligible to retrieve a capture intent context", v1, 2u);
}

- (void)setCaptureIntentContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBCaptureIntentService: Capture intent size (%lu) is larger than expected. Not setting it.", (uint8_t *)&v2, 0xCu);
}

- (void)setCaptureIntentContext:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Remote target is not capture eligible to set a capture intent context", v1, 2u);
}

@end