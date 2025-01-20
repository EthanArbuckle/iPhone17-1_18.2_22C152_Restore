@interface SBWidgetMetricsServer
- (BSServiceConnectionListener)listener;
- (FBServiceClientAuthenticator)authenticator;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (SBSWidgetMetricsProviding)ambientMetricsProvider;
- (SBSWidgetMetricsProviding)lockScreenMetricsProvider;
- (SBSWidgetMetricsProviding)systemMetricsProvider;
- (SBWidgetMetricsServer)init;
- (SBWidgetMetricsServer)initWithSystemMetricsProvider:(id)a3 lockScreenMetricsProvider:(id)a4 ambientMetricsProvider:(id)a5;
- (id)_defaultMetricsProviderForWidget:(id)a3;
- (id)_metricsProviderForHostingEnvironment:(id)a3;
- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)systemMetricsForWidget:(id)a3;
- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation SBWidgetMetricsServer

- (SBWidgetMetricsServer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBWidgetMetricsServer.m" lineNumber:43 description:@"Use initWithMetricsProvider:"];

  return 0;
}

- (SBWidgetMetricsServer)initWithSystemMetricsProvider:(id)a3 lockScreenMetricsProvider:(id)a4 ambientMetricsProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBWidgetMetricsServer;
  v11 = [(SBWidgetMetricsServer *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_systemMetricsProvider, v8);
    objc_storeWeak((id *)&v12->_lockScreenMetricsProvider, v9);
    objc_storeWeak((id *)&v12->_ambientMetricsProvider, v10);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    connections = v12->_connections;
    v12->_connections = (NSMutableArray *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.widget-metrics"];
    authenticator = v12->_authenticator;
    v12->_authenticator = (FBServiceClientAuthenticator *)v15;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)Serial;

    v19 = (void *)MEMORY[0x1E4F628A0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __104__SBWidgetMetricsServer_initWithSystemMetricsProvider_lockScreenMetricsProvider_ambientMetricsProvider___block_invoke;
    v24[3] = &unk_1E6AF58F0;
    v20 = v12;
    v25 = v20;
    uint64_t v21 = [v19 listenerWithConfigurator:v24];
    id v22 = v20[3];
    v20[3] = (id)v21;

    [v20[3] activate];
  }

  return v12;
}

void __104__SBWidgetMetricsServer_initWithSystemMetricsProvider_lockScreenMetricsProvider_ambientMetricsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6CD0] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  v3 = [(SBWidgetMetricsServer *)self listener];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBWidgetMetricsServer;
  [(SBWidgetMetricsServer *)&v4 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: received connection: %{public}@", buf, 0xCu);
  }

  id v8 = [(SBWidgetMetricsServer *)self authenticator];
  id v9 = [v6 remoteProcess];
  id v10 = [v9 auditToken];
  int v11 = [v8 authenticateAuditToken:v10];

  if (v11)
  {
    v12 = [(SBWidgetMetricsServer *)self queue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke;
    v18 = &unk_1E6AF5290;
    id v13 = v6;
    id v19 = v13;
    v20 = self;
    dispatch_sync(v12, &v15);

    objc_msgSend(v13, "activate", v15, v16, v17, v18);
  }
  else
  {
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBWidgetMetricsServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v14);
    }

    [v6 invalidate];
  }
}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E6AF7470;
  v6[4] = *(void *)(a1 + 40);
  [v2 configureConnection:v6];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: adding connection: %{public}@", buf, 0xCu);
  }

  v5 = [*(id *)(a1 + 40) connections];
  [v5 addObject:*(void *)(a1 + 32)];
}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6CD0] serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = [MEMORY[0x1E4FA6CD0] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_3;
  id v10 = &unk_1E6AF7420;
  objc_copyWeak(&v11, &location);
  [v3 setInvalidationHandler:&v7];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "queue", v7, v8, v9, v10);
  [v3 setTargetQueue:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__SBWidgetMetricsServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "SBWidgetMetricsServer: received connection invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained connections];
    [v7 removeObject:v3];
  }
}

- (id)_defaultMetricsProviderForWidget:(id)a3
{
  unint64_t v4 = [a3 family];
  if (v4 <= 0xC && ((1 << v4) & 0x1C20) != 0)
  {
    v5 = [(SBWidgetMetricsServer *)self lockScreenMetricsProvider];
  }
  else
  {
    v5 = [(SBWidgetMetricsServer *)self systemMetricsProvider];
  }
  return v5;
}

- (id)_metricsProviderForHostingEnvironment:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FA7258]])
  {
    uint64_t v5 = [(SBWidgetMetricsServer *)self lockScreenMetricsProvider];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4FA7248]]) {
      [(SBWidgetMetricsServer *)self ambientMetricsProvider];
    }
    else {
    uint64_t v5 = [(SBWidgetMetricsServer *)self systemMetricsProvider];
    }
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)systemMetricsForWidget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWidgetMetricsServer *)self _defaultMetricsProviderForWidget:v4];
  id v6 = [v5 systemMetricsForWidget:v4];

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWidgetMetricsServer *)self systemMetricsProvider];
  id v6 = [v5 previewMetricsSpecificationForBundleIdentifier:v4];

  uint64_t v7 = [(SBWidgetMetricsServer *)self lockScreenMetricsProvider];
  int v8 = [v7 previewMetricsSpecificationForBundleIdentifier:v4];

  id v9 = objc_alloc_init(MEMORY[0x1E4F58D60]);
  uint64_t v10 = [v6 metricsForFamily:1];
  [v9 setMetrics:v10 forFamily:1];

  id v11 = [v6 metricsForFamily:2];
  [v9 setMetrics:v11 forFamily:2];

  v12 = [v6 metricsForFamily:3];
  [v9 setMetrics:v12 forFamily:3];

  id v13 = [v6 metricsForFamily:4];
  [v9 setMetrics:v13 forFamily:4];

  v14 = [v8 metricsForFamily:5];
  [v9 setMetrics:v14 forFamily:5];

  uint64_t v15 = [v8 metricsForFamily:10];
  [v9 setMetrics:v15 forFamily:10];

  uint64_t v16 = [v8 metricsForFamily:11];
  [v9 setMetrics:v16 forFamily:11];

  v17 = [v8 metricsForFamily:12];
  [v9 setMetrics:v17 forFamily:12];

  return v9;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBWidgetMetricsServer *)self systemMetricsProvider];
  v12 = [v11 previewMetricsSpecificationForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  id v13 = [(SBWidgetMetricsServer *)self lockScreenMetricsProvider];
  v14 = [v13 previewMetricsSpecificationForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  id v15 = objc_alloc_init(MEMORY[0x1E4F58D60]);
  uint64_t v16 = [v12 metricsForFamily:1];
  [v15 setMetrics:v16 forFamily:1];

  v17 = [v12 metricsForFamily:2];
  [v15 setMetrics:v17 forFamily:2];

  v18 = [v12 metricsForFamily:3];
  [v15 setMetrics:v18 forFamily:3];

  id v19 = [v12 metricsForFamily:4];
  [v15 setMetrics:v19 forFamily:4];

  v20 = [v14 metricsForFamily:5];
  [v15 setMetrics:v20 forFamily:5];

  uint64_t v21 = [v14 metricsForFamily:10];
  [v15 setMetrics:v21 forFamily:10];

  id v22 = [v14 metricsForFamily:11];
  [v15 setMetrics:v22 forFamily:11];

  uint64_t v23 = [v14 metricsForFamily:12];
  [v15 setMetrics:v23 forFamily:12];

  return v15;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:a4];
  id v8 = [v7 systemMetricsForWidget:v6];

  return v8;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FA7250];
  id v5 = a3;
  id v6 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:v4];
  uint64_t v7 = [v6 previewMetricsSpecificationForBundleIdentifier:v5];

  uint64_t v8 = *MEMORY[0x1E4FA7258];
  id v9 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:*MEMORY[0x1E4FA7258]];
  id v10 = [v9 previewMetricsSpecificationForBundleIdentifier:v5];

  uint64_t v11 = *MEMORY[0x1E4FA7248];
  v12 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:*MEMORY[0x1E4FA7248]];
  id v13 = [v12 previewMetricsSpecificationForBundleIdentifier:v5];

  v16[0] = v4;
  v16[1] = v8;
  v17[0] = v7;
  v17[1] = v10;
  v16[2] = v11;
  v17[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v14;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  v23[3] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FA7250];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:v8];
  id v13 = [v12 previewMetricsSpecificationForDeviceContext:v11 displayContext:v10 bundleIdentifier:v9];

  uint64_t v14 = *MEMORY[0x1E4FA7258];
  id v15 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:*MEMORY[0x1E4FA7258]];
  uint64_t v16 = [v15 previewMetricsSpecificationForDeviceContext:v11 displayContext:v10 bundleIdentifier:v9];

  uint64_t v17 = *MEMORY[0x1E4FA7248];
  v18 = [(SBWidgetMetricsServer *)self _metricsProviderForHostingEnvironment:*MEMORY[0x1E4FA7248]];
  id v19 = [v18 previewMetricsSpecificationForDeviceContext:v11 displayContext:v10 bundleIdentifier:v9];

  v22[0] = v8;
  v22[1] = v14;
  v23[0] = v13;
  v23[1] = v16;
  v22[2] = v17;
  v23[2] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  return v20;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (FBServiceClientAuthenticator)authenticator
{
  return self->_authenticator;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SBSWidgetMetricsProviding)systemMetricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemMetricsProvider);
  return (SBSWidgetMetricsProviding *)WeakRetained;
}

- (SBSWidgetMetricsProviding)lockScreenMetricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenMetricsProvider);
  return (SBSWidgetMetricsProviding *)WeakRetained;
}

- (SBSWidgetMetricsProviding)ambientMetricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientMetricsProvider);
  return (SBSWidgetMetricsProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientMetricsProvider);
  objc_destroyWeak((id *)&self->_lockScreenMetricsProvider);
  objc_destroyWeak((id *)&self->_systemMetricsProvider);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBWidgetMetricsServer: connection did not pass entitlement validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end