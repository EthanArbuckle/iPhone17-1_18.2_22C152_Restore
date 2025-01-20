@interface PRUISExternallyHostedPosterEditingServer
- (PRUISExternallyHostedPosterEditingServer)init;
- (PRUISExternallyHostedPosterEditingServerDelegate)delegate;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_associateConnection:(id)a3 toEditingRequest:(id)a4;
- (void)_queue_disassociateConnection:(id)a3 fromEditingRequest:(id)a4;
- (void)_queue_removeConnection:(id)a3;
- (void)activate;
- (void)beginEditingWithEntryPointWrapper:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)sendRequestDismissalActionWithEntryPointWrapper:(id)a3;
- (void)sessionWithEditingRequest:(id)a3 didEndEditingWithResponse:(id)a4;
- (void)sessionWithEditingRequest:(id)a3 willEndEditingWithResponse:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PRUISExternallyHostedPosterEditingServer

- (PRUISExternallyHostedPosterEditingServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)PRUISExternallyHostedPosterEditingServer;
  v2 = [(PRUISExternallyHostedPosterEditingServer *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.posterboardui.externalEditing.Server.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x263F3F408];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__PRUISExternallyHostedPosterEditingServer_init__block_invoke;
    v14[3] = &unk_26546C030;
    v6 = v2;
    v15 = v6;
    uint64_t v7 = [v5 listenerWithConfigurator:v14];
    connectionListener = v6->_connectionListener;
    v6->_connectionListener = (BSServiceConnectionListener *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    connections = v6->_connections;
    v6->_connections = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    connectionsByEditingRequest = v6->_connectionsByEditingRequest;
    v6->_connectionsByEditingRequest = (NSMapTable *)v11;
  }
  return v2;
}

void __48__PRUISExternallyHostedPosterEditingServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.posterboardui"];
  dispatch_queue_t v3 = PRUISExternallyHostedPosterEditingServiceInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F29CA0] sharedInstance];
  int v8 = [v7 deviceClass];

  if (v8 != 2)
  {
    v14 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PRUISExternallyHostedPosterEditingServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v14);
    }
    goto LABEL_10;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke;
  v17[3] = &unk_26546C080;
  v17[4] = self;
  [v6 configureConnection:v17];
  uint64_t v9 = [v6 remoteProcess];
  int v10 = [v9 hasEntitlement:@"com.apple.posterboardui.externalEditing"];

  if (!v10)
  {
    v14 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer rejected connection: %{public}@", buf, 0xCu);
    }
LABEL_10:

    [v6 invalidate];
    goto LABEL_11;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_7;
  block[3] = &unk_26546B148;
  block[4] = self;
  id v12 = v6;
  id v16 = v12;
  dispatch_async(queue, block);
  v13 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v12;
    _os_log_impl(&dword_25A03F000, v13, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer received connection: %{public}@", buf, 0xCu);
  }

  [v12 activate];
LABEL_11:
}

void __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PRUISDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  id v5 = PRUISExternallyHostedPosterEditingServiceInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_26546C058;
  v6[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
}

void __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections removeObject:v4];
}

- (void)_queue_associateConnection:(id)a3 toEditingRequest:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMapTable *)self->_connectionsByEditingRequest setObject:v8 forKey:v7];
}

- (void)_queue_disassociateConnection:(id)a3 fromEditingRequest:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  [(NSMapTable *)self->_connectionsByEditingRequest removeObjectForKey:v6];
}

- (void)activate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(BSServiceConnectionListener *)self->_connectionListener activate];
  id v4 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(a2);
    connectionListener = self->_connectionListener;
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    int v10 = connectionListener;
    _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - listener: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)beginEditingWithEntryPointWrapper:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  int v10 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    id v12 = [v9 requestUUID];
    v13 = [v9 entryPoint];
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    __int16 v24 = 2114;
    v25 = v12;
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_25A03F000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@): %{public}@", buf, 0x20u);
  }
  v14 = [(NSMapTable *)self->_connectionsByEditingRequest objectForKey:v9];

  if (!v14)
  {
    v15 = [MEMORY[0x263F3F3F8] currentContext];
    [(PRUISExternallyHostedPosterEditingServer *)self _queue_associateConnection:v15 toEditingRequest:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v20 = v9;
  v21 = v8;
  id v16 = WeakRetained;
  id v17 = v9;
  id v18 = v8;
  BSDispatchMain();
}

void __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_2;
  v4[3] = &unk_26546B6D0;
  id v3 = (void *)a1[7];
  v4[4] = a1[6];
  id v5 = v3;
  [v1 beginExternalPosterEditingSessionWithEditingRequest:v2 completion:v4];
}

void __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_3;
  block[3] = &unk_26546B368;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendRequestDismissalActionWithEntryPointWrapper:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = [v5 requestUUID];
    id v9 = [v5 entryPoint];
    *(_DWORD *)buf = 138543874;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_25A03F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@): %{public}@", buf, 0x20u);
  }
  int v10 = [(NSMapTable *)self->_connectionsByEditingRequest objectForKey:v5];

  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263F3F3F8] currentContext];
    [(PRUISExternallyHostedPosterEditingServer *)self _queue_associateConnection:v11 toEditingRequest:v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = v5;
  id v12 = WeakRetained;
  id v13 = v5;
  BSDispatchMain();
}

uint64_t __92__PRUISExternallyHostedPosterEditingServer_sendRequestDismissalActionWithEntryPointWrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRequestDismissalActionWithEditingRequest:*(void *)(a1 + 40)];
}

- (void)sessionWithEditingRequest:(id)a3 willEndEditingWithResponse:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v7 requestUUID];
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_25A03F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) response: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(NSMapTable *)self->_connectionsByEditingRequest objectForKey:v7];
  id v13 = [v12 remoteTarget];
  [v13 willEndEditingWithResponse:v8];
}

- (void)sessionWithEditingRequest:(id)a3 didEndEditingWithResponse:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v7 requestUUID];
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_25A03F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) response: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(NSMapTable *)self->_connectionsByEditingRequest objectForKey:v7];
  id v13 = [v12 remoteTarget];
  [v13 didEndEditingWithResponse:v8];
}

- (PRUISExternallyHostedPosterEditingServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISExternallyHostedPosterEditingServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionsByEditingRequest, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25A03F000, a2, OS_LOG_TYPE_DEBUG, "PRUISExternallyHostedPosterEditingServer rejecting connections on non-iPads: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end