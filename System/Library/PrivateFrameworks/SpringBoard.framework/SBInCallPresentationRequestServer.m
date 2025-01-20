@interface SBInCallPresentationRequestServer
- (SBInCallPresentationRequestServer)init;
- (SBInCallPresentationRequestServerDelegate)delegate;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentWithConfiguration:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBInCallPresentationRequestServer

- (SBInCallPresentationRequestServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBInCallPresentationRequestServer;
  v2 = [(SBInCallPresentationRequestServer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.inCallPresentation"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SpringBoard.SBSInCallPresentationRequestServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F628A0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__SBInCallPresentationRequestServer_init__block_invoke;
    v12[3] = &unk_1E6AF58F0;
    v8 = v2;
    v13 = v8;
    uint64_t v9 = [v7 listenerWithConfigurator:v12];
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;
  }
  return v2;
}

void __41__SBInCallPresentationRequestServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6B08] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogInCallPresentation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  clientAuthenticator = self->_clientAuthenticator;
  uint64_t v9 = [v6 remoteProcess];
  v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke;
    v17 = &unk_1E6AF5290;
    id v12 = v6;
    id v18 = v12;
    v19 = self;
    dispatch_sync(queue, &v14);
    objc_msgSend(v12, "activate", v14, v15, v16, v17);
  }
  else
  {
    v13 = SBLogInCallPresentation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v13);
    }

    [v6 invalidate];
  }
}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [[_SBInCallPresentationRequestServerTarget alloc] initWithConnection:*(void *)(a1 + 32) proxyInterface:*(void *)(a1 + 40)];
  objc_initWeak(&location, v2);
  objc_initWeak(&from, *(id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  uint64_t v15 = &unk_1E6AF9890;
  id v4 = v2;
  v16 = v4;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  uint64_t v17 = *(void *)(a1 + 40);
  [v3 configureConnection:&v12];
  dispatch_queue_t v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", buf, 0xCu);
  }

  v7 = *(void **)(*(void *)(a1 + 40) + 8);
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15, v16);
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;

    v7 = *(void **)(*(void *)(a1 + 40) + 8);
  }
  objc_msgSend(v7, "addObject:", v4, v12, v13, v14, v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6B08] serviceQuality];
  [v3 setServiceQuality:v4];

  dispatch_queue_t v5 = [MEMORY[0x1E4FA6B08] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3;
  uint64_t v9 = &unk_1E6AF9868;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 40) + 32), v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogInCallPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = v6;
  if (WeakRetained && v6)
  {
    [WeakRetained[1] removeObject:v6];
    id v8 = objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v9 = [v7 clientIdentifier];
    [v8 inCallPresentationRequestServer:WeakRetained clientWithIdentifierDidInvalidate:v9];
  }
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = +[_SBInCallPresentationRequestServerTarget currentTarget];
  uint64_t v9 = SBLogInCallPresentation();
  int v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Received presentation request with config: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = [v8 clientIdentifier];
    [WeakRetained inCallPresentationRequestServer:self clientWithIdentifier:v12 requestsPresentationWithConfiguration:v6 completion:v7];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBInCallPresentationRequestServer presentWithConfiguration:completion:](v6, v10);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)activate
{
}

- (SBInCallPresentationRequestServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInCallPresentationRequestServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

- (void)presentWithConfiguration:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 sceneBundleIdentifier];
  int v4 = 138543362;
  dispatch_queue_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Received presentation request for scene bundle identifier: %{public}@, but no target was found.", (uint8_t *)&v4, 0xCu);
}

@end