@interface SBFocusModesHomeScreenSettingsServer
- (BSServiceConnectionListener)listener;
- (FBServiceClientAuthenticator)authenticator;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (SBFocusModesHomeScreenSettingsServer)init;
- (SBFocusModesHomeScreenSettingsServerDelegate)delegate;
- (void)activate;
- (void)addSuggestedHomeScreenPageWithRequest:(id)a3;
- (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4;
- (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3;
@end

@implementation SBFocusModesHomeScreenSettingsServer

- (SBFocusModesHomeScreenSettingsServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBFocusModesHomeScreenSettingsServer;
  v2 = [(SBFocusModesHomeScreenSettingsServer *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.focus-modes-home-screen-settings"];
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SpringBoard.SBSFocusModesHomeScreenSettingsService.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v7;

    v9 = (void *)MEMORY[0x1E4F628A0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__SBFocusModesHomeScreenSettingsServer_init__block_invoke;
    v14[3] = &unk_1E6AF58F0;
    v10 = v2;
    v15 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:v14];
    listener = v10->_listener;
    v10->_listener = (BSServiceConnectionListener *)v11;
  }
  return v2;
}

void __44__SBFocusModesHomeScreenSettingsServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6A98] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)activate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogFocusModes();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  v8 = [(SBFocusModesHomeScreenSettingsServer *)self authenticator];
  v9 = [v6 remoteProcess];
  v10 = [v9 auditToken];
  if ([v8 authenticateAuditToken:v10])
  {
    uint64_t v11 = [(SBFocusModesHomeScreenSettingsServer *)self queue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    objc_super v16 = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke;
    v17 = &unk_1E6AF5290;
    id v12 = v6;
    id v18 = v12;
    v19 = self;
    dispatch_sync(v11, &v14);
    objc_msgSend(v12, "activate", v14, v15, v16, v17);
  }
  else
  {
    v13 = SBLogFocusModes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v13);
    }

    [v6 invalidate];
  }
}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E6AF7470;
  v6[4] = *(void *)(a1 + 40);
  [v2 configureConnection:v6];
  uint64_t v3 = SBLogFocusModes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", buf, 0xCu);
  }

  dispatch_queue_t v5 = [*(id *)(a1 + 40) connections];
  [v5 addObject:*(void *)(a1 + 32)];
}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6A98] serviceQuality];
  [v3 setServiceQuality:v4];

  dispatch_queue_t v5 = [MEMORY[0x1E4FA6A98] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v10 = &unk_1E6AF7420;
  objc_copyWeak(&v11, &location);
  [v3 setInvalidationHandler:&v7];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "queue", v7, v8, v9, v10);
  [v3 setTargetQueue:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogFocusModes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained connections];
    [v7 removeObject:v3];
  }
}

- (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(SBFocusModesHomeScreenSettingsServer *)self delegate];
  int v8 = v7;
  if (v7) {
    [v7 settingsServer:self homeScreenSnapshotsWithRequest:v9 completion:v6];
  }
}

- (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(SBFocusModesHomeScreenSettingsServer *)self delegate];
  int v8 = v7;
  if (v7) {
    [v7 settingsServer:self homeScreenSnapshotsForSuggestedPagesWithRequest:v9 completion:v6];
  }
}

- (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBFocusModesHomeScreenSettingsServer *)self delegate];
  dispatch_queue_t v5 = v4;
  if (v4) {
    [v4 settingsServer:self updateFocusModeHomeScreenSettingsWithRequest:v6];
  }
}

- (void)addSuggestedHomeScreenPageWithRequest:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBFocusModesHomeScreenSettingsServer *)self delegate];
  dispatch_queue_t v5 = v4;
  if (v4) {
    [v4 settingsServer:self addSuggestedHomeScreenPageWithRequest:v6];
  }
}

- (SBFocusModesHomeScreenSettingsServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFocusModesHomeScreenSettingsServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBServiceClientAuthenticator)authenticator
{
  return self->_authenticator;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end