@interface SBAccessibilityWindowHostingControllerServer
- (SBAccessibilityWindowHostingControllerServer)init;
- (void)_beginHostingWindowWithContextID:(unsigned int)a3 atLevel:(double)a4;
- (void)_endHostingWindowWithContextID:(unsigned int)a3;
- (void)_handleDisconnectForServiceConnection:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4;
- (void)unregisterWindowWithContextID:(id)a3;
@end

@implementation SBAccessibilityWindowHostingControllerServer

- (SBAccessibilityWindowHostingControllerServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBAccessibilityWindowHostingControllerServer;
  v2 = [(SBAccessibilityWindowHostingControllerServer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.accessibility-window-hosting"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v7 = (void *)MEMORY[0x1E4F628A0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__SBAccessibilityWindowHostingControllerServer_init__block_invoke;
    v12[3] = &unk_1E6AF58F0;
    v8 = v2;
    v13 = v8;
    uint64_t v9 = [v7 listenerWithConfigurator:v12];
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;
  }
  return v2;
}

void __52__SBAccessibilityWindowHostingControllerServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  uint64_t v3 = [MEMORY[0x1E4FA6978] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke;
  v19[3] = &unk_1E6AFD478;
  id v7 = v6;
  id v20 = v7;
  v21 = self;
  [v7 configureConnection:v19];
  clientAuthenticator = self->_clientAuthenticator;
  uint64_t v9 = [v7 remoteProcess];
  v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_11;
    v16 = &unk_1E6AF5290;
    v17 = self;
    id v12 = v7;
    id v18 = v12;
    dispatch_barrier_async(queue, &v13);
    objc_msgSend(v12, "activate", v13, v14, v15, v16, v17);
  }
  else
  {
    [v7 invalidate];
  }
}

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6978] interface];
  [v3 setInterface:v4];

  v5 = [[_SBAccessibilityWindowHostingControllerServerTarget alloc] initWithConnection:*(void *)(a1 + 32) proxyInterface:*(void *)(a1 + 40)];
  [v3 setInterfaceTarget:v5];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 48)];
  id v6 = [MEMORY[0x1E4FA6978] serviceQuality];
  [v3 setServiceQuality:v6];

  objc_initWeak(&location, *(id *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6AF7420;
  objc_copyWeak(&v10, &location);
  [v3 setInterruptionHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_9;
  v7[3] = &unk_1E6AF7420;
  objc_copyWeak(&v8, &location);
  [v3 setInvalidationHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = SBLogAccessibilityWindowHosting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

void __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = SBLogAccessibilityWindowHosting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

uint64_t __90__SBAccessibilityWindowHostingControllerServer_listener_didReceiveConnection_withContext___block_invoke_11(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_SBAccessibilityWindowHostingControllerServerTarget currentTarget];
  uint64_t v9 = [v8 connection];

  if (v9)
  {
    id v10 = [(NSMapTable *)self->_connectionToHostedContextIDs objectForKey:v9];
    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    }
    connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
    if (!connectionToHostedContextIDs)
    {
      id v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v13 = self->_connectionToHostedContextIDs;
      self->_connectionToHostedContextIDs = v12;

      connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
    }
    [(NSMapTable *)connectionToHostedContextIDs setObject:v10 forKey:v9];
    if ([v10 containsObject:v6])
    {
    }
    else
    {
      [v10 addObject:v6];

      id v14 = v6;
      id v15 = v7;
      BSDispatchMain();
    }
  }
}

uint64_t __84__SBAccessibilityWindowHostingControllerServer_registerWindowWithContextID_atLevel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) unsignedIntValue];
  [*(id *)(a1 + 48) doubleValue];
  return objc_msgSend(v2, "_beginHostingWindowWithContextID:atLevel:", v3);
}

- (void)unregisterWindowWithContextID:(id)a3
{
  id v4 = a3;
  v5 = +[_SBAccessibilityWindowHostingControllerServerTarget currentTarget];
  id v6 = [v5 connection];

  if (v6)
  {
    id v7 = [(NSMapTable *)self->_connectionToHostedContextIDs objectForKey:v6];
    if ([v7 containsObject:v4])
    {
      [v7 removeObject:v4];
      if (![v7 count]) {
        [(NSMapTable *)self->_connectionToHostedContextIDs removeObjectForKey:v6];
      }

      id v8 = v4;
      BSDispatchMain();
    }
    else
    {
    }
  }
}

uint64_t __78__SBAccessibilityWindowHostingControllerServer_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) unsignedIntValue];
  return [v1 _endHostingWindowWithContextID:v2];
}

- (void)activate
{
}

- (void)_beginHostingWindowWithContextID:(unsigned int)a3 atLevel:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = [MEMORY[0x1E4F43078] specification];
  id v8 = objc_alloc_init((Class)[v7 clientSettingsClass]);
  double v9 = a4;
  if (a4 < 0.0)
  {
    id v10 = SBLogAccessibilityWindowHosting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBAccessibilityWindowHostingControllerServer _beginHostingWindowWithContextID:atLevel:](v10, a4);
    }

    double v9 = 0.0;
  }
  v11 = [MEMORY[0x1E4F62420] mainConfiguration];
  id v12 = objc_msgSend((id)objc_msgSend(v7, "settingsClass"), "settings");
  uint64_t v13 = (void *)[v12 mutableCopy];

  [v13 setDisplayConfiguration:v11];
  [v11 bounds];
  objc_msgSend(v13, "setFrame:");
  [v13 setLevel:v9];
  [v13 setInterfaceOrientation:1];
  [v13 setForeground:1];
  id v14 = [MEMORY[0x1E4F629B8] parametersForSpecification:v7];
  [v14 setSettings:v13];
  v31 = v8;
  [v14 setClientSettings:v8];
  id v15 = NSString;
  v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v16 UUIDString];
  id v18 = [v15 stringWithFormat:@"Accessibility-%@", v17];

  v19 = [MEMORY[0x1E4F629B0] definition];
  id v20 = [MEMORY[0x1E4F62A60] identityForIdentifier:v18 workspaceIdentifier:@"AccessibilitySceneWorkspace"];
  [v19 setIdentity:v20];

  v21 = [FBSSceneClientIdentity localIdentity];
  [v19 setClientIdentity:v21];

  [v19 setSpecification:v7];
  v22 = [MEMORY[0x1E4F62490] sharedInstance];
  v23 = [v22 createSceneWithDefinition:v19 initialParameters:v14];

  if (v23)
  {
    contextIDToScene = self->_contextIDToScene;
    if (!contextIDToScene)
    {
      v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v26 = self->_contextIDToScene;
      self->_contextIDToScene = v25;

      contextIDToScene = self->_contextIDToScene;
    }
    v27 = [NSNumber numberWithUnsignedInt:v5];
    [(NSMutableDictionary *)contextIDToScene setObject:v23 forKey:v27];

    v28 = [MEMORY[0x1E4F62430] sharedInstance];
    v29 = [v28 fbsSceneForScene:v23];

    if (v29)
    {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F62908]) initWithCAContextID:v5 level:a4];
      [v29 attachSceneContext:v30];
    }
  }
}

- (void)_endHostingWindowWithContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  contextIDToScene = self->_contextIDToScene;
  id v6 = [NSNumber numberWithUnsignedInt:v3];
  id v13 = [(NSMutableDictionary *)contextIDToScene objectForKey:v6];

  id v7 = v13;
  if (v13)
  {
    id v8 = self->_contextIDToScene;
    double v9 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    if (![(NSMutableDictionary *)self->_contextIDToScene count])
    {
      id v10 = self->_contextIDToScene;
      self->_contextIDToScene = 0;
    }
    v11 = [MEMORY[0x1E4F62490] sharedInstance];
    id v12 = [v13 identifier];
    [v11 destroyScene:v12 withTransitionContext:0];

    id v7 = v13;
  }
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_activeConnections removeObject:v4];
  if (![(NSMutableArray *)self->_activeConnections count])
  {
    activeConnections = self->_activeConnections;
    self->_activeConnections = 0;
  }
  id v6 = [(NSMapTable *)self->_connectionToHostedContextIDs objectForKey:v4];
  id v7 = (void *)[v6 copy];

  if (v7)
  {
    [(NSMapTable *)self->_connectionToHostedContextIDs removeObjectForKey:v4];
    if (![(NSMapTable *)self->_connectionToHostedContextIDs count])
    {
      connectionToHostedContextIDs = self->_connectionToHostedContextIDs;
      self->_connectionToHostedContextIDs = 0;
    }
  }
  id v9 = v7;
  BSDispatchMain();
}

void __86__SBAccessibilityWindowHostingControllerServer__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_endHostingWindowWithContextID:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "unsignedIntValue", (void)v7));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextIDToScene, 0);
  objc_storeStrong((id *)&self->_connectionToHostedContextIDs, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
}

- (void)_beginHostingWindowWithContextID:(os_log_t)log atLevel:(double)a2 .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "preferred scene level %f is out of bounds; setting level to default, preferredLevel",
    (uint8_t *)&v2,
    0xCu);
}

@end