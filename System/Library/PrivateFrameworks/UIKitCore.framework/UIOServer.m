@interface UIOServer
+ (UIOServer)sharedInstance;
+ (id)_identifierForSceneType:(int64_t)a3 spaceIdentifier:(id)a4;
+ (id)displayDelegateIdentifierForScene:(id)a3;
- (UIOServer)init;
- (id)displayDelegateForAction:(id)a3;
- (id)displayDelegateForAction:(id)a3 sceneType:(int64_t)a4;
- (id)displayDelegateForIdentifier:(id)a3;
- (void)_fulfillAwaitingDisplayDelegate:(id)a3 forIdentifier:(id)a4;
- (void)activate;
- (void)awaitDisplayDelegateForAction:(id)a3 sceneType:(int64_t)a4 timeout:(double)a5 completion:(id)a6;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)registerDisplayDelegate:(id)a3 forIdentifier:(id)a4;
- (void)unregisterDisplayDelegateForIdentifier:(id)a3;
@end

@implementation UIOServer

+ (UIOServer)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__UIOServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1223 != -1) {
    dispatch_once(&_MergedGlobals_1223, block);
  }
  v2 = (void *)qword_1EB262ED8;
  return (UIOServer *)v2;
}

void __27__UIOServer_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1EB262ED8;
  qword_1EB262ED8 = (uint64_t)v0;
}

+ (id)_identifierForSceneType:(int64_t)a3 spaceIdentifier:(id)a4
{
  v4 = @"Unknown";
  if (a3 == 1) {
    v4 = @"Overlay";
  }
  if (a3 == 2) {
    v4 = @"Subterranean";
  }
  return (id)[NSString stringWithFormat:@"%@:%@", v4, a4];
}

+ (id)displayDelegateIdentifierForScene:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 systemShellHostingEnvironment];
  v6 = [v5 systemShellHostingSpaceIdentifier];

  if (!v6)
  {
    v7 = UIOLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2050;
      id v15 = v4;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Could not find a systemShellHostingSpaceIdentifier for scene: <%{public}@: %{public}p>", (uint8_t *)&v12, 0x16u);
    }
    v6 = @"Unspecified";
  }
  v10 = objc_msgSend(a1, "_identifierForSceneType:spaceIdentifier:", objc_msgSend((id)objc_opt_class(), "_UIO_sceneType"), v6);

  return v10;
}

- (UIOServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)UIOServer;
  v3 = [(UIOServer *)&v22 init];
  if (v3)
  {
    if ((_UIApplicationProcessIsOverlayUI() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v3 file:@"UIOServer.m" lineNumber:87 description:@"Fatal error: a UIOServer instance was initialized outside of OverlayUI"];
    }
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.UIKit.OverlayUI.service_queue", 0);
    serviceQueue = v3->_serviceQueue;
    v3->_serviceQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v3->_connections;
    v3->_connections = v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    displayDelegateTable = v3->_displayDelegateTable;
    v3->_displayDelegateTable = (NSMapTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    awaitingDisplayDelegateRequests = v3->_awaitingDisplayDelegateRequests;
    v3->_awaitingDisplayDelegateRequests = v10;

    int v12 = UIOLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "Starting uioverlayd service connection listener…", buf, 2u);
    }

    v13 = (void *)MEMORY[0x1E4F628A0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __17__UIOServer_init__block_invoke;
    v19[3] = &unk_1E5305928;
    __int16 v14 = v3;
    v20 = v14;
    uint64_t v15 = [v13 listenerWithConfigurator:v19];
    connectionListener = v14->_connectionListener;
    v14->_connectionListener = (BSServiceConnectionListener *)v15;
  }
  return v3;
}

void __17__UIOServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:0x1ED14C420];
  v3 = +[_UIOverlayServiceInterfaceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  serviceQueue = self->_serviceQueue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke;
  int v12 = &unk_1E52D9F98;
  id v13 = v6;
  __int16 v14 = self;
  id v8 = v6;
  dispatch_sync(serviceQueue, &v9);
  objc_msgSend(v8, "activate", v9, v10, v11, v12);
}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  v2 = +[_UIOServiceConnection connectionWithBSServiceConnection:*(void *)(a1 + 32) toServer:*(void *)(a1 + 40)];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_2;
  uint64_t v9 = &unk_1E5305978;
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = v2;
  uint64_t v11 = v3;
  id v5 = v2;
  [v4 configureConnection:&v6];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "addObject:", v5, v6, v7, v8, v9);
}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:MEMORY[0x1E4F14428]];
  id v4 = +[_UIOverlayServiceInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[_UIOverlayServiceInterfaceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v8[3] = &unk_1E5305950;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  [v3 setInvalidationHandler:v8];
}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_4;
  block[3] = &unk_1E52D9F70;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_5;
  v4[3] = &unk_1E52D9F98;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(v3, v4);
}

uint64_t __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceConnectionDidInvalidate];
}

uint64_t __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)activate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    [(BSServiceConnectionListener *)self->_connectionListener activate];
  }
}

- (void)invalidate
{
  if (self->_activated)
  {
    [(BSServiceConnectionListener *)self->_connectionListener invalidate];
    self->_activated = 0;
  }
}

- (void)registerDisplayDelegate:(id)a3 forIdentifier:(id)a4
{
  id v7 = a4;
  id v9 = a3;
  if (pthread_main_np() != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIOServer.m" lineNumber:151 description:@"Call must be made on main thread"];
  }
  [(NSMapTable *)self->_displayDelegateTable setObject:v9 forKey:v7];
  [(UIOServer *)self _fulfillAwaitingDisplayDelegate:v9 forIdentifier:v7];
}

- (void)unregisterDisplayDelegateForIdentifier:(id)a3
{
  id v6 = a3;
  if (pthread_main_np() != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIOServer.m" lineNumber:158 description:@"Call must be made on main thread"];
  }
  [(NSMapTable *)self->_displayDelegateTable removeObjectForKey:v6];
}

- (id)displayDelegateForIdentifier:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIOServer.m" lineNumber:164 description:@"Call must be made on main thread"];
  }
  id v6 = [(NSMapTable *)self->_displayDelegateTable objectForKey:v5];

  return v6;
}

- (id)displayDelegateForAction:(id)a3
{
  return [(UIOServer *)self displayDelegateForAction:a3 sceneType:1];
}

- (id)displayDelegateForAction:(id)a3 sceneType:(int64_t)a4
{
  id v6 = [a3 originContext];
  id v7 = [v6 spaceIdentifier];

  id v8 = [(id)objc_opt_class() _identifierForSceneType:a4 spaceIdentifier:v7];
  id v9 = [(UIOServer *)self displayDelegateForIdentifier:v8];

  return v9;
}

- (void)awaitDisplayDelegateForAction:(id)a3 sceneType:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v11 = a3;
  int v12 = (void (**)(id, void *))a6;
  if (pthread_main_np() != 1)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"UIOServer.m" lineNumber:182 description:@"Call must be made on main thread"];
  }
  id v13 = [(UIOServer *)self displayDelegateForAction:v11 sceneType:a4];
  if (v13)
  {
    __int16 v14 = UIOLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: returning existing display delegate", (uint8_t *)location, 2u);
    }

    v12[2](v12, v13);
  }
  else
  {
    uint64_t v15 = (void *)[v12 copy];
    uint64_t v16 = [v11 originContext];
    v17 = [v16 spaceIdentifier];

    v18 = [(id)objc_opt_class() _identifierForSceneType:a4 spaceIdentifier:v17];
    v19 = UIOLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: waiting for display delegate to become available for identifier %{public}@", (uint8_t *)location, 0xCu);
    }

    v20 = [(NSMutableDictionary *)self->_awaitingDisplayDelegateRequests objectForKey:v18];
    if (v20)
    {
      v21 = _Block_copy(v15);
      [v20 addObject:v21];
    }
    else
    {
      objc_super v22 = (void *)MEMORY[0x1E4F1CA48];
      v23 = _Block_copy(v15);
      v20 = [v22 arrayWithObject:v23];

      [(NSMutableDictionary *)self->_awaitingDisplayDelegateRequests setObject:v20 forKey:v18];
    }
    objc_initWeak(location, self);
    v24 = (void *)MEMORY[0x1E4F1CB00];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __72__UIOServer_awaitDisplayDelegateForAction_sceneType_timeout_completion___block_invoke;
    v29[3] = &unk_1E53059A0;
    objc_copyWeak(&v32, location);
    id v25 = v18;
    id v30 = v25;
    id v26 = v15;
    id v31 = v26;
    id v27 = (id)[v24 scheduledTimerWithTimeInterval:0 repeats:v29 block:a5];

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
}

void __72__UIOServer_awaitDisplayDelegateForAction_sceneType_timeout_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[6] objectForKey:*(void *)(a1 + 32)];
    id v5 = _Block_copy(*(const void **)(a1 + 40));
    int v6 = [v4 containsObject:v5];

    if (v6)
    {
      id v7 = UIOLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9[0] = 0;
        _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: timed out waiting for display delegate", (uint8_t *)v9, 2u);
      }

      id v8 = _Block_copy(*(const void **)(a1 + 40));
      [v4 removeObject:v8];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)_fulfillAwaitingDisplayDelegate:(id)a3 forIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UIOLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v7;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "Fulfilling awaiting display delegates for identifier %{public}@", buf, 0xCu);
  }

  id v9 = [(NSMutableDictionary *)self->_awaitingDisplayDelegateRequests objectForKey:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
  [v9 removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awaitingDisplayDelegateRequests, 0);
  objc_storeStrong((id *)&self->_displayDelegateTable, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end