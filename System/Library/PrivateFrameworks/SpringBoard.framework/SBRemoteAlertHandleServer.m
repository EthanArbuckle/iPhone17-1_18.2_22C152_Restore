@interface SBRemoteAlertHandleServer
- (BOOL)_shouldAllowAuditToken:(id)a3 forDefinition:(id)a4;
- (SBRemoteAlertHandleServer)initWithSessionManager:(id)a3;
- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4;
- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5;
- (void)_addConnection:(id)a3 forSession:(id)a4;
- (void)_handleDisconnectForServiceConnection:(id)a3;
- (void)_removeConnection:(id)a3 forSession:(id)a4;
- (void)activate;
- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4;
- (void)dealloc;
- (void)invalidateRemoteAlertHandleWithID:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5;
- (void)remoteTransientOverlaySessionDidActivate:(id)a3;
- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3;
@end

@implementation SBRemoteAlertHandleServer

- (SBRemoteAlertHandleServer)initWithSessionManager:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBRemoteAlertHandleServer;
  v6 = [(SBRemoteAlertHandleServer *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionManager, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.remote-alert" additionalCredentials:1];
    clientAuthenticator = v7->_clientAuthenticator;
    v7->_clientAuthenticator = (FBServiceClientAuthenticator *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.activateRemoteAlert"];
    legacyClientAuthenticator = v7->_legacyClientAuthenticator;
    v7->_legacyClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    uint64_t v12 = BSDispatchQueueCreateWithQualityOfService();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x1E4F628A0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__SBRemoteAlertHandleServer_initWithSessionManager___block_invoke;
    v19[3] = &unk_1E6AF58F0;
    v15 = v7;
    v20 = v15;
    uint64_t v16 = [v14 listenerWithConfigurator:v19];
    connectionListener = v15->_connectionListener;
    v15->_connectionListener = (BSServiceConnectionListener *)v16;
  }
  return v7;
}

void __52__SBRemoteAlertHandleServer_initWithSessionManager___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6BD8] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_sessionToConnections;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeSessionObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBRemoteAlertHandleServer;
  [(SBRemoteAlertHandleServer *)&v8 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_1E6AFD478;
  id v7 = v6;
  id v17 = v7;
  v18 = self;
  [v7 configureConnection:v16];
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_15;
  v13 = &unk_1E6AF5290;
  uint64_t v14 = self;
  id v15 = v7;
  id v9 = v7;
  dispatch_barrier_async(queue, &v10);
  objc_msgSend(v9, "activate", v10, v11, v12, v13, v14);
}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6BD8] interface];
  [v3 setInterface:v4];

  uint64_t v5 = [[_SBRemoteAlertHandleServerTarget alloc] initWithConnection:*(void *)(a1 + 32) proxyInterface:*(void *)(a1 + 40)];
  [v3 setInterfaceTarget:v5];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 40)];
  id v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v3 setServiceQuality:v6];

  objc_initWeak(&location, *(id *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6AF7420;
  objc_copyWeak(&v10, &location);
  [v3 setInterruptionHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_13;
  v7[3] = &unk_1E6AF7420;
  objc_copyWeak(&v8, &location);
  [v3 setInvalidationHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = SBLogTransientOverlay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

void __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = SBLogTransientOverlay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained _handleDisconnectForServiceConnection:v3];
  }
}

uint64_t __71__SBRemoteAlertHandleServer_listener_didReceiveConnection_withContext___block_invoke_15(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F62880] currentContext];
  long long v12 = [v11 remoteProcess];
  v13 = [v12 auditToken];

  if ([(SBRemoteAlertHandleServer *)self _shouldAllowAuditToken:v13 forDefinition:v8])
  {
    uint64_t v14 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager existingSessionsWithDefinition:v8 options:0];
    if (![v14 count] && objc_msgSend(v9, "BOOLValue"))
    {
      id v15 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager createSessionWithDefinition:v8];
      v47[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];

      uint64_t v14 = (void *)v16;
    }
    v34 = v13;
    id v35 = v9;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = 0;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = _SBSRemoteAlertHandleContextFromRemoteTransientOverlaySession(*(void **)(*((void *)&v41 + 1) + 8 * i));
          if (v23)
          {
            if (!v20) {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
            }
            objc_msgSend(v20, "addObject:", v23, v34, v35);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    v26 = +[_SBRemoteAlertHandleServerTarget currentTarget];
    v27 = [v26 connection];

    if (v27)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v28 = v17;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v28);
            }
            -[SBRemoteAlertHandleServer _addConnection:forSession:](self, "_addConnection:forSession:", v27, *(void *)(*((void *)&v37 + 1) + 8 * j), v34, v35);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v30);
      }
    }
    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    }
    v36 = v17;
    id v10 = v10;
    v24 = v17;
    BSDispatchMain();
    id v25 = v20;

    v13 = v34;
    id v9 = v35;
  }
  else
  {
    v24 = SBLogTransientOverlay();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SBRemoteAlertHandleServer remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:]();
    }
    id v25 = 0;
  }

  return v25;
}

void __109__SBRemoteAlertHandleServer_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPrepared", (void)v8) & 1) == 0) {
          [v7 prepareWithConfigurationContext:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [MEMORY[0x1E4F62880] currentContext];
  long long v9 = [v8 remoteProcess];
  long long v10 = [v9 auditToken];

  if ([(SBRemoteAlertHandleServer *)self _shouldAllowAuditToken:v10 forDefinition:v6])
  {
    long long v11 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager createSessionWithDefinition:v6];
    long long v12 = _SBSRemoteAlertHandleContextFromRemoteTransientOverlaySession(v11);
    uint64_t v13 = +[_SBRemoteAlertHandleServerTarget currentTarget];
    uint64_t v14 = [v13 connection];

    if (v14) {
      [(SBRemoteAlertHandleServer *)self _addConnection:v14 forSession:v11];
    }
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    }
    id v7 = v7;
    id v15 = v11;
    BSDispatchMain();
  }
  else
  {
    uint64_t v14 = SBLogTransientOverlay();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBRemoteAlertHandleServer createRemoteAlertHandleContextWithDefinition:configurationContext:]();
    }
    long long v12 = 0;
  }

  return v12;
}

uint64_t __95__SBRemoteAlertHandleServer_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareWithConfigurationContext:*(void *)(a1 + 40)];
}

- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (!v7) {
      id v8 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    }
    long long v9 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager existingSessionWithSessionID:v6 options:0];
    long long v10 = v9;
    if (v9)
    {
      long long v12 = v9;
      id v13 = v8;
      BSDispatchMain();

      long long v11 = v12;
    }
    else
    {
      long long v11 = SBLogTransientOverlay();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SBRemoteAlertHandleServer activateRemoteAlertHandleWithID:activationContext:]((uint64_t)v6, v11);
      }
    }
  }
}

uint64_t __79__SBRemoteAlertHandleServer_activateRemoteAlertHandleWithID_activationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateWithContext:*(void *)(a1 + 40)];
}

- (void)invalidateRemoteAlertHandleWithID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager existingSessionWithSessionID:v4 options:0];
    id v6 = v5;
    if (v5)
    {
      id v8 = v5;
      BSDispatchMain();
      id v7 = v8;
    }
    else
    {
      id v7 = SBLogTransientOverlay();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Unable to invalidate alert handle due to no handle for session ID: %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __63__SBRemoteAlertHandleServer_invalidateRemoteAlertHandleWithID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)activate
{
}

- (void)remoteTransientOverlaySessionDidActivate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogTransientOverlay();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  id v8 = [v5 sessionID];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidActivate___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v13 = v5;
  id v14 = v8;
  id v10 = v8;
  id v11 = v5;
  dispatch_async(queue, block);
}

void __70__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidActivate___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v3 = (void *)[v2 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "remoteTarget", (void)v10);
        [v9 remoteAlertHandleWithIDDidActivate:a1[6]];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogTransientOverlay();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v8 = [v5 sessionID];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidDeactivate___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v13 = v5;
  id v14 = v8;
  id v10 = v8;
  id v11 = v5;
  dispatch_async(queue, block);
}

void __72__SBRemoteAlertHandleServer_remoteTransientOverlaySessionDidDeactivate___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v3 = (void *)[v2 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "remoteTarget", (void)v10);
        [v9 remoteAlertHandleWithIDDidDeactivate:a1[6]];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v11 = SBLogTransientOverlay();
  long long v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v25 = v13;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_error_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@, error: %{public}@", buf, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    id v25 = v13;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    goto LABEL_6;
  }

  id v14 = [v9 sessionID];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SBRemoteAlertHandleServer_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  block[3] = &unk_1E6AF5240;
  block[4] = self;
  id v20 = v9;
  id v22 = v14;
  int64_t v23 = a4;
  id v21 = v10;
  id v16 = v14;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(queue, block);
}

void __89__SBRemoteAlertHandleServer_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v3 = (void *)[v2 copy];

  [*(id *)(a1[4] + 56) removeObjectForKey:a1[5]];
  id v4 = (void *)SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    uint64_t v6 = SBSRemoteAlertHandleInvalidationErrorDescription();
    [v5 setObject:v6 forKey:*MEMORY[0x1E4F28568]];

    uint64_t v7 = a1[6];
    if (v7) {
      [v5 setObject:v7 forKey:*MEMORY[0x1E4F28A50]];
    }
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA7170] code:v4 userInfo:v5];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "remoteTarget", (void)v14);
        [v13 remoteAlertHandleWithID:a1[7] didInvalidateWithError:v4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_addConnection:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMapTable *)self->_sessionToConnections objectForKey:v7];
  if (!v8)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    sessionToConnections = self->_sessionToConnections;
    if (!sessionToConnections)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v11 = self->_sessionToConnections;
      self->_sessionToConnections = v10;

      sessionToConnections = self->_sessionToConnections;
    }
    [(NSMapTable *)sessionToConnections setObject:v8 forKey:v7];
  }
  [v8 addObject:v6];
  if ([v8 count] == 1)
  {
    id v12 = v7;
    BSDispatchMain();
  }
}

uint64_t __55__SBRemoteAlertHandleServer__addConnection_forSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSessionObserver:*(void *)(a1 + 40)];
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)[(NSMapTable *)self->_sessionToConnections copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v6 objectForKey:v12];
        if ([v13 containsObject:v4])
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  if ([v9 count])
  {
    id v14 = v9;
    id v15 = v4;
    BSDispatchMain();
  }
}

void __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke_2;
  block[3] = &unk_1E6AF4E00;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v10;
  dispatch_async(v7, block);
}

void __67__SBRemoteAlertHandleServer__handleDisconnectForServiceConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeConnection:forSession:", *(void *)(a1 + 48), *(void *)(*((void *)&v9 + 1) + 8 * v6++), (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
  if (![*(id *)(*(void *)(a1 + 40) + 8) count])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = 0;
  }
}

- (void)_removeConnection:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMapTable *)self->_sessionToConnections objectForKey:v7];
  if ([v8 containsObject:v6])
  {
    [v8 removeObject:v6];
    if (![v8 count])
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      id v11 = v7;
      BSDispatchMain();
      -[NSMapTable removeObjectForKey:](self->_sessionToConnections, "removeObjectForKey:", v11, v10, 3221225472, __58__SBRemoteAlertHandleServer__removeConnection_forSession___block_invoke, &unk_1E6AF5290);
      if (![(NSMapTable *)self->_sessionToConnections count])
      {
        sessionToConnections = self->_sessionToConnections;
        self->_sessionToConnections = 0;
      }
    }
  }
}

uint64_t __58__SBRemoteAlertHandleServer__removeConnection_forSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSessionObserver:*(void *)(a1 + 40)];
}

- (BOOL)_shouldAllowAuditToken:(id)a3 forDefinition:(id)a4
{
  id v6 = a3;
  if ([a4 isForCarPlay])
  {
    char v7 = 0;
  }
  else if ([(FBServiceClientAuthenticator *)self->_clientAuthenticator authenticateAuditToken:v6])
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [(FBServiceClientAuthenticator *)self->_legacyClientAuthenticator authenticateAuditToken:v6];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToConnections, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_legacyClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
}

- (void)remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Not allowing remoteAlertHandleContexts due to audit token %{public}@ for definition: %{public}@");
}

- (void)createRemoteAlertHandleContextWithDefinition:configurationContext:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Not allowing createRemoteAlertHandle due to audit token %{public}@ for definition: %{public}@");
}

- (void)activateRemoteAlertHandleWithID:(uint64_t)a1 activationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to activate alert handle due to no handle for session ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end