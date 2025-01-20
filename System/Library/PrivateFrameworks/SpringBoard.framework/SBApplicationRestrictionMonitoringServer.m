@interface SBApplicationRestrictionMonitoringServer
- (BSCompoundAssertion)pendingRestrictionUpdateAssertion;
- (BSInvalidatable)restrictionControllerDidFinishNotifyingObserversAssertion;
- (BSServiceConnectionListener)listener;
- (FBServiceClientAuthenticator)authenticator;
- (NSMutableArray)connections;
- (NSUUID)pendingRestrictionUpdateUUID;
- (OS_dispatch_queue)queue;
- (SBApplicationRestrictionMonitoringServer)init;
- (id)acquireApplicationRestrictionUpdatePendingAssertionForReason:(id)a3;
- (void)_didFinishProcessingAppRestrictionUpdateWithUUID:(uint64_t)a1;
- (void)_postAppRestrictionChangeWithState:(uint64_t)a1;
- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3;
- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeConnection:(uint64_t)a1;
- (void)setPendingRestrictionUpdateAssertion:(id)a3;
- (void)setPendingRestrictionUpdateUUID:(id)a3;
- (void)setRestrictionControllerDidFinishNotifyingObserversAssertion:(id)a3;
@end

@implementation SBApplicationRestrictionMonitoringServer

- (id)acquireApplicationRestrictionUpdatePendingAssertionForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_pendingRestrictionUpdateAssertion acquireForReason:a3];
}

- (SBApplicationRestrictionMonitoringServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBApplicationRestrictionMonitoringServer;
  v2 = [(SBApplicationRestrictionMonitoringServer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.application-restriction-monitoring"];
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.springboard.SBApplicationRestrictionMonitoringServer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v8;

    v10 = (void *)MEMORY[0x1E4F628A0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__SBApplicationRestrictionMonitoringServer_init__block_invoke;
    v15[3] = &unk_1E6AF58F0;
    v11 = v2;
    v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    id v13 = v11[1];
    v11[1] = (id)v12;

    [v11[1] activate];
  }
  return v2;
}

void __48__SBApplicationRestrictionMonitoringServer_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA69A8];
  id v6 = a2;
  v4 = [v3 domain];
  [v6 setDomain:v4];

  v5 = [MEMORY[0x1E4FA69A8] identifier];
  [v6 setService:v5];

  [v6 setDelegate:*(void *)(a1 + 32)];
}

- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 allAllowedAppBundleIdentifiers];
  id v6 = [v4 allRestrictedAppBundleIdentifiers];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FA69B0]) initWithAllowedIdentifiers:v5 restrictedIdentifiers:v6];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateUUID, v8);
  [(BSCompoundAssertion *)self->_pendingRestrictionUpdateAssertion invalidate];
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E4F4F6E8];
  v10 = [NSString stringWithFormat:@"SBApplicationRestrictionMonitoringServer.pendingRestrictionUpdate.%@", v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke;
  v18[3] = &unk_1E6AFFAC0;
  objc_copyWeak(&v22, &location);
  id v11 = v8;
  id v19 = v11;
  v20 = self;
  id v12 = v7;
  id v21 = v12;
  id v13 = [v9 assertionWithIdentifier:v10 stateDidChangeHandler:v18];
  pendingRestrictionUpdateAssertion = self->_pendingRestrictionUpdateAssertion;
  self->_pendingRestrictionUpdateAssertion = v13;

  v15 = [(BSCompoundAssertion *)self->_pendingRestrictionUpdateAssertion acquireForReason:@"Pending application restriction controller app visibility update broadcast"];
  restrictionControllerDidFinishNotifyingObserversAssertion = self->_restrictionControllerDidFinishNotifyingObserversAssertion;
  self->_restrictionControllerDidFinishNotifyingObserversAssertion = v15;

  objc_super v17 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v11;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "App restriction update will occur. Tracking with ID=%@", buf, 0xCu);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isActive] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_2;
    block[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    id v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_3;
    v4[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    id v5 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v9);
  }
}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer _didFinishProcessingAppRestrictionUpdateWithUUID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)_didFinishProcessingAppRestrictionUpdateWithUUID:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if ([*(id *)(a1 + 40) isEqual:v3])
    {
      id v4 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      [*(id *)(a1 + 48) invalidate];
      id v5 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      id v6 = SBLogApplicationRestrictionMonitoring();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Pending restriction update compound assertion with ID=%@ was finally invalidated", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer _postAppRestrictionChangeWithState:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)_postAppRestrictionChangeWithState:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "remoteTarget", (void)v13);
          [v10 observeUpdateWithApplicationRestrictState:v3];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }

    id v11 = SBLogApplicationRestrictionMonitoring();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v5 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Notified %{public}ld active connection(s) of restrictions update", buf, 0xCu);
    }
  }
}

- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(BSInvalidatable *)self->_restrictionControllerDidFinishNotifyingObserversAssertion invalidate];
  restrictionControllerDidFinishNotifyingObserversAssertion = self->_restrictionControllerDidFinishNotifyingObserversAssertion;
  self->_restrictionControllerDidFinishNotifyingObserversAssertion = 0;

  id v5 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    pendingRestrictionUpdateUUID = self->_pendingRestrictionUpdateUUID;
    uint64_t v7 = [(BSCompoundAssertion *)self->_pendingRestrictionUpdateAssertion reasons];
    int v8 = 138412546;
    uint64_t v9 = pendingRestrictionUpdateUUID;
    __int16 v10 = 2048;
    uint64_t v11 = [v7 count];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "App restriction update with ID=%@ was ingested by restriction observers. Now waiting for %lu outstanding assertions…", (uint8_t *)&v8, 0x16u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 remoteProcess];
  uint64_t v12 = [v11 auditToken];

  long long v13 = self->_queue;
  objc_initWeak(&location, self);
  if ([(FBServiceClientAuthenticator *)self->_authenticator authenticateAuditToken:v12])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke;
    block[3] = &unk_1E6AF5968;
    id v14 = v9;
    id v17 = v14;
    uint64_t v18 = self;
    objc_copyWeak(&v20, &location);
    id v19 = v13;
    dispatch_sync(v19, block);
    [v14 activate];

    objc_destroyWeak(&v20);
  }
  else
  {
    long long v15 = SBLogApplicationRestrictionMonitoring();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:]((uint64_t)v9, v15);
    }

    [v9 invalidate];
  }
  objc_destroyWeak(&location);
}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_2;
  id v9 = &unk_1E6AF5940;
  v2 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v11 = *v3;
  id v12 = *(id *)(a1 + 48);
  [v2 configureConnection:&v6];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "addObject:", *(void *)(a1 + 32), v6, v7, v8, v9, v10);
  id v4 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Configured new connection: %{public}@", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA69A8] serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = [MEMORY[0x1E4FA69A8] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_3;
  id v9 = &unk_1E6AF5918;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 40);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(a1 + 48), v6, v7, v8, v9);

  objc_destroyWeak(&v11);
}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Received connection invalidation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer removeConnection:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)removeConnection:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v4 = SBLogApplicationRestrictionMonitoring();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Removing connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) removeObject:v3];
  }
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
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

- (NSUUID)pendingRestrictionUpdateUUID
{
  return self->_pendingRestrictionUpdateUUID;
}

- (void)setPendingRestrictionUpdateUUID:(id)a3
{
}

- (BSCompoundAssertion)pendingRestrictionUpdateAssertion
{
  return self->_pendingRestrictionUpdateAssertion;
}

- (void)setPendingRestrictionUpdateAssertion:(id)a3
{
}

- (BSInvalidatable)restrictionControllerDidFinishNotifyingObserversAssertion
{
  return self->_restrictionControllerDidFinishNotifyingObserversAssertion;
}

- (void)setRestrictionControllerDidFinishNotifyingObserversAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionControllerDidFinishNotifyingObserversAssertion, 0);
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateUUID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end