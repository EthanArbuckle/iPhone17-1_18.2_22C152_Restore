@interface SBMultitaskingApplicationShortcutService
- (SBMultitaskingApplicationShortcutService)init;
- (int64_t)_switcherShortcutActionForRequestedAction:(int64_t)a3;
- (void)_handleDisconnectForServiceConnection:(id)a3;
- (void)fetchSupportedShortcutActionsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)performShortcutAction:(id)a3 forBundleIdentifier:(id)a4;
- (void)stopObservingUpdatesForBundleIdentifier:(id)a3;
- (void)updateSupportedShortcutsForInterestedClients;
@end

@implementation SBMultitaskingApplicationShortcutService

- (SBMultitaskingApplicationShortcutService)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBMultitaskingApplicationShortcutService;
  v2 = [(SBMultitaskingApplicationShortcutService *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.multitaskingshortcut.performAction"];
    serviceClientAuthenticator = v2->_serviceClientAuthenticator;
    v2->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v3;

    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F628A0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__SBMultitaskingApplicationShortcutService_init__block_invoke;
    v12[3] = &unk_1E6AF58F0;
    v8 = v2;
    v13 = v8;
    uint64_t v9 = [v7 listenerWithConfigurator:v12];
    id v10 = v8[1];
    v8[1] = (id)v9;

    [v8[1] activate];
  }
  return v2;
}

void __48__SBMultitaskingApplicationShortcutService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6B50] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)updateSupportedShortcutsForInterestedClients
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_spotlightInterestedBundleIDs count])
  {
    uint64_t v3 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = self;
    id v4 = self->_spotlightInterestedBundleIDs;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
          id v10 = +[SBIconController sharedInstance];
          uint64_t v11 = [v10 supportedMultitaskingShortcutActionsForBundleIdentifier:v9];

          v12 = [NSNumber numberWithUnsignedInteger:v11];
          [v3 setObject:v12 forKey:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    serviceQueue = v15->_serviceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__SBMultitaskingApplicationShortcutService_updateSupportedShortcutsForInterestedClients__block_invoke;
    block[3] = &unk_1E6AF5290;
    block[4] = v15;
    id v17 = v3;
    id v14 = v3;
    dispatch_async(serviceQueue, block);
  }
}

void __88__SBMultitaskingApplicationShortcutService_updateSupportedShortcutsForInterestedClients__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    id v3 = [v2 remoteTarget];
    [v3 updateSupportedShortcutActionsForBundleIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)performShortcutAction:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

void __86__SBMultitaskingApplicationShortcutService_performShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = [(id)SBApp windowSceneManager];
  id v5 = [v2 activeDisplayWindowScene];

  id v3 = [v5 switcherController];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_switcherShortcutActionForRequestedAction:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if ([v3 canPerformKeyboardShortcutAction:v4 forBundleIdentifier:*(void *)(a1 + 48)]) {
    [v3 performKeyboardShortcutAction:v4 forBundleIdentifier:*(void *)(a1 + 48)];
  }
}

- (void)fetchSupportedShortcutActionsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnectionHost *)self->_spotlightConnection remoteProcess];
  [v8 pid];
  uint64_t v9 = [MEMORY[0x1E4F62880] currentContext];
  id v10 = [v9 remoteProcess];
  [v10 pid];

  v13 = v6;
  id v11 = v7;
  id v12 = v6;
  BSDispatchMain();
}

void __115__SBMultitaskingApplicationShortcutService_fetchSupportedShortcutActionsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 40);
    if (!v2)
    {
      uint64_t v3 = objc_opt_new();
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      v2 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    [v2 addObject:*(void *)(a1 + 40)];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = NSNumber;
  id v9 = +[SBIconController sharedInstance];
  id v8 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "supportedMultitaskingShortcutActionsForBundleIdentifier:", *(void *)(a1 + 40)));
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v8, 0);
}

- (void)stopObservingUpdatesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnectionHost *)self->_spotlightConnection remoteProcess];
  int v6 = [v5 pid];
  id v7 = [MEMORY[0x1E4F62880] currentContext];
  id v8 = [v7 remoteProcess];
  int v9 = [v8 pid];

  if (v6 == v9)
  {
    id v10 = v4;
    BSDispatchMain();
  }
}

uint64_t __84__SBMultitaskingApplicationShortcutService_stopObservingUpdatesForBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  id v8 = [v6 remoteProcess];
  int v9 = [v8 auditToken];
  id v23 = 0;
  char v10 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v9 error:&v23];
  id v11 = v23;

  if (v10)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke;
    v22[3] = &unk_1E6AF7470;
    v22[4] = self;
    [v6 configureConnection:v22];
    id v12 = [v6 remoteProcess];
    v13 = [v12 bundleIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.Spotlight"];

    if (v14)
    {
      serviceQueue = self->_serviceQueue;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      long long v18 = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_4;
      long long v19 = &unk_1E6AF5290;
      long long v20 = self;
      id v21 = v6;
      dispatch_async(serviceQueue, &v16);
    }
    objc_msgSend(v6, "activate", v16, v17, v18, v19, v20);
  }
  else
  {
    [v6 invalidate];
  }
}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6B50] interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  id v5 = [MEMORY[0x1E4FA6B50] serviceQuality];
  [v3 setServiceQuality:v5];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6AF7420;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E6AF7420;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleDisconnectForServiceConnection:v5];
  }
}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleDisconnectForServiceConnection:v5];
  }
}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  id v6 = [v5 remoteProcess];

  id v7 = [v6 bundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.Spotlight"];

  if (v8)
  {
    spotlightConnection = self->_spotlightConnection;
    self->_spotlightConnection = 0;

    BSDispatchMain();
  }
}

uint64_t __82__SBMultitaskingApplicationShortcutService__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

- (int64_t)_switcherShortcutActionForRequestedAction:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_1D8FD23A0[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightInterestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_spotlightConnection, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end