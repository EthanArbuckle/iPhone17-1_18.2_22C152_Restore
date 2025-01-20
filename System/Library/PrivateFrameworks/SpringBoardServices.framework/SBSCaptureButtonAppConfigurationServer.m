@interface SBSCaptureButtonAppConfigurationServer
- (NSMutableArray)connections;
- (NSSet)eligibleApps;
- (NSString)associatedAppBundleIdentifier;
- (SBSCaptureButtonAppConfigurationServer)initWithAssociatedAppBundleIdentifier:(id)a3 eligibleApps:(id)a4 delegate:(id)a5;
- (SBSCaptureButtonAppConfigurationServerDelegate)delegate;
- (id)_currentConnections;
- (void)_notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:(id)a3;
- (void)_notifyExistingConnectionsDidUpdateEligibleApps:(id)a3;
- (void)_sendInitialStateForNewConnection:(id)a3 associatedAppsBundleIdentifier:(id)a4 eligibleApps:(id)a5;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEligibleApps:(id)a3;
- (void)startServer;
@end

@implementation SBSCaptureButtonAppConfigurationServer

- (SBSCaptureButtonAppConfigurationServer)initWithAssociatedAppBundleIdentifier:(id)a3 eligibleApps:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SBSCaptureButtonAppConfigurationServer *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    lock_connections = v12->_lock_connections;
    v12->_lock_connections = (NSMutableArray *)v13;

    uint64_t v15 = [v8 copy];
    lock_associatedAppBundleIdentifier = v12->_lock_associatedAppBundleIdentifier;
    v12->_lock_associatedAppBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v9 copy];
    lock_eligibleApps = v12->_lock_eligibleApps;
    v12->_lock_eligibleApps = (NSSet *)v17;

    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)startServer
{
  BSDispatchQueueAssertMain();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SBSCaptureButtonAppConfigurationServer_startServer__block_invoke;
  v5[3] = &unk_1E566D910;
  v5[4] = self;
  v3 = [MEMORY[0x1E4F50BC8] listenerWithConfigurator:v5];
  connectionListener = self->_connectionListener;
  self->_connectionListener = v3;

  [(BSServiceConnectionListener *)self->_connectionListener activate];
}

void __53__SBSCaptureButtonAppConfigurationServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = +[SBSCaptureButtonAppConfigurationServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationServer;
  [(SBSCaptureButtonAppConfigurationServer *)&v3 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [v9 remoteProcess];
  v12 = [v11 auditToken];
  if ([v12 hasEntitlement:@"com.apple.springboard.private.capture-button-app-configuration-service"])
  {

LABEL_4:
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke;
    v17[3] = &unk_1E566B438;
    v17[4] = self;
    objc_copyWeak(&v18, &location);
    [v9 configureConnection:v17];
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_lock_connections addObject:v9];
    os_unfair_lock_unlock(&self->_lock);
    [v9 activate];
    objc_destroyWeak(&v18);
    goto LABEL_8;
  }
  uint64_t v13 = [v9 remoteProcess];
  v14 = [v13 auditToken];
  int v15 = [v14 hasEntitlement:@"com.apple.springboard.private.EA0E3FBF-D56E-4897-B807-A3CA8090EE38"];

  if (v15) {
    goto LABEL_4;
  }
  v16 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_18FBC5000, v16, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer invalidating connection because client process is missing required entitlement %@.", buf, 0xCu);
  }

  [v9 invalidate];
LABEL_8:
  objc_destroyWeak(&location);
}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSCaptureButtonAppConfigurationServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[SBSCaptureButtonAppConfigurationServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setInterruptionHandler:&__block_literal_global_55];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_11;
  v8[3] = &unk_1E566B410;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInvalidationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_12;
  v6[3] = &unk_1E566B410;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setActivationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }
}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    [*((id *)WeakRetained + 3) removeObject:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  }
}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer activated connection %@", (uint8_t *)&v8, 0xCu);
  }

  if (WeakRetained)
  {
    int v6 = [WeakRetained associatedAppBundleIdentifier];
    id v7 = [WeakRetained eligibleApps];
    [WeakRetained _sendInitialStateForNewConnection:v3 associatedAppsBundleIdentifier:v6 eligibleApps:v7];
  }
}

- (NSString)associatedAppBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_lock_associatedAppBundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  id v9 = a3;
  int v4 = [(SBSCaptureButtonAppConfigurationServer *)self associatedAppBundleIdentifier];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    int v6 = (NSString *)[v9 copy];
    os_unfair_lock_lock(&self->_lock);
    lock_associatedAppBundleIdentifier = self->_lock_associatedAppBundleIdentifier;
    self->_lock_associatedAppBundleIdentifier = v6;
    int v8 = v6;

    os_unfair_lock_unlock(&self->_lock);
    [(SBSCaptureButtonAppConfigurationServer *)self _notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:v8];
  }
}

- (NSSet)eligibleApps
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_lock_eligibleApps;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEligibleApps:(id)a3
{
  id v9 = a3;
  int v4 = [(SBSCaptureButtonAppConfigurationServer *)self eligibleApps];
  char v5 = BSEqualSets();

  if ((v5 & 1) == 0)
  {
    int v6 = (NSSet *)[v9 copy];
    os_unfair_lock_lock(&self->_lock);
    lock_eligibleApps = self->_lock_eligibleApps;
    self->_lock_eligibleApps = v6;
    int v8 = v6;

    os_unfair_lock_unlock(&self->_lock);
    [(SBSCaptureButtonAppConfigurationServer *)self _notifyExistingConnectionsDidUpdateEligibleApps:v8];
  }
}

- (void)_sendInitialStateForNewConnection:(id)a3 associatedAppsBundleIdentifier:(id)a4 eligibleApps:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 remoteTarget];
  [v10 receiveInitialOrUpdatedAssociatedAppBundleIdentifier:v8];

  id v11 = [v9 remoteTarget];

  [v11 receiveInitialOrUpdatedEligibleApps:v7];
}

- (id)_currentConnections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_lock_connections;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBSCaptureButtonAppConfigurationServer *)self _currentConnections];
  int v6 = (void *)[v5 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) remoteTarget:v13];
        [v12 receiveInitialOrUpdatedAssociatedAppBundleIdentifier:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyExistingConnectionsDidUpdateEligibleApps:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBSCaptureButtonAppConfigurationServer *)self _currentConnections];
  int v6 = (void *)[v5 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) remoteTarget:v13];
        [v12 receiveInitialOrUpdatedEligibleApps:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F50BA0] currentContext];
  char v5 = [v4 remoteProcess];
  int v6 = [v5 bundleIdentifier];

  id v7 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = v3;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer received request to set current active app bundle identifier to %{public}@ from %{public}@", buf, 0x16u);
  }

  id v8 = v3;
  BSDispatchMain();
}

void __87__SBSCaptureButtonAppConfigurationServer_setCurrentAssociatedAppUsingBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 captureButtonAppConfigurationServer:*(void *)(a1 + 32) setCurrentAssociatedAppUsingBundleIdentifier:*(void *)(a1 + 40)];
}

- (NSMutableArray)connections
{
  return self->_lock_connections;
}

- (SBSCaptureButtonAppConfigurationServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSCaptureButtonAppConfigurationServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_eligibleApps, 0);
  objc_storeStrong((id *)&self->_lock_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end