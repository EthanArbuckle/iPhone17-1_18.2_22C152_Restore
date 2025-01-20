@interface PGBackgroundPIPService
- (BOOL)hasAcquiredAuthorizationForActivitySessionWithIdentifier:(id)a3 appBundleIdentifier:(id)a4;
- (NSSet)identifiersForAuthorizedActivitySessions;
- (PGBackgroundPIPService)init;
- (PGBackgroundPIPServiceDelegate)delegate;
- (id)_targetForIdentifier:(id)a3;
- (void)_handleInvalidatedTarget:(id)a3;
- (void)backgroundPIPTargetRequestsAuthorization:(id)a3;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)pipDidStartForRemoteObject:(id)a3;
- (void)pipDidStopForRemoteObject:(id)a3;
- (void)revokeAuthorizationActivitySessionWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListener;
@end

@implementation PGBackgroundPIPService

- (PGBackgroundPIPService)init
{
  v19.receiver = self;
  v19.super_class = (Class)PGBackgroundPIPService;
  v2 = [(PGBackgroundPIPService *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    lock_targets = v3->_lock_targets;
    v3->_lock_targets = (NSMutableSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    lock_targetsByActivitySessionIdentifier = v3->_lock_targetsByActivitySessionIdentifier;
    v3->_lock_targetsByActivitySessionIdentifier = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    mutableIdentifiersForAuthorizedActivitySessions = v3->_mutableIdentifiersForAuthorizedActivitySessions;
    v3->_mutableIdentifiersForAuthorizedActivitySessions = (NSMutableSet *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.pegasus.PGBackgroundPIPService", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E4F628A0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __30__PGBackgroundPIPService_init__block_invoke;
    v17[3] = &unk_1E610D380;
    v13 = v3;
    v18 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v17];
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;
  }
  return v3;
}

void __30__PGBackgroundPIPService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = +[PGBackgroundPIPServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)startListener
{
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PGBackgroundPIPService;
  [(PGBackgroundPIPService *)&v3 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (_PGBackgroundPIPServiceConnectionTarget *)a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(_PGBackgroundPIPServiceConnectionTarget *)v9 remoteProcess];
  v12 = [v11 auditToken];
  int v13 = [v12 hasEntitlement:@"com.apple.pegasus.backgroundPIPServiceEntitlement"];

  if (v13)
  {
    uint64_t v14 = [[_PGBackgroundPIPServiceConnectionTarget alloc] initWithConnection:v9 delegate:self];
    v15 = PGLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      __int16 v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1B5645000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableSet *)self->_lock_targets addObject:v14];
    os_unfair_lock_unlock(&self->_lock);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke;
    v19[3] = &unk_1E610D3F8;
    v16 = v14;
    v20 = v16;
    v21 = self;
    [(_PGBackgroundPIPServiceConnectionTarget *)v9 configureConnection:v19];
    v17 = PGLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      __int16 v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1B5645000, v17, OS_LOG_TYPE_DEFAULT, "%s Activating connection %{public}@", buf, 0x16u);
    }

    [(_PGBackgroundPIPServiceConnectionTarget *)v9 activate];
  }
  else
  {
    v18 = PGLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      __int16 v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1B5645000, v18, OS_LOG_TYPE_DEFAULT, "%s Invalidating unvalidated client %{public}@", buf, 0x16u);
    }

    [(_PGBackgroundPIPServiceConnectionTarget *)v9 invalidate];
  }
  objc_destroyWeak(&location);
}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PGBackgroundPIPServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[PGBackgroundPIPServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_2;
  v11[3] = &unk_1E610D3A8;
  id v12 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v11];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_16;
  v9 = &unk_1E610D3D0;
  id v10 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 40) + 16), v6, v7, v8, v9);
}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]_block_invoke_2";
    __int16 v8 = 2114;
    id v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s Activated connection %{public}@ for target %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s Invalidated connection %{public}@ for target: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)_handleInvalidatedTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  int v6 = [v4 activitySessionIdentifier];
  [v4 transitionToStateIfPossible:5];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_lock_targets removeObject:v4];
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_lock_targetsByActivitySessionIdentifier objectForKeyedSubscript:v6];
    __int16 v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]";
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s existingTargetForIdentifier %{public}@", buf, 0x16u);
    }

    if ([v7 isEqual:v4])
    {
      id v9 = v6;
      [(NSMutableDictionary *)self->_lock_targetsByActivitySessionIdentifier setObject:0 forKeyedSubscript:v9];
    }
    else
    {
      id v9 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      id v10 = v9;
      BSDispatchMain();
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __51__PGBackgroundPIPService__handleInvalidatedTarget___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;

    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 136315394;
      id v9 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]_block_invoke";
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s BackgroundPIP: Revoking authorization for identifier %{public}@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 backgroundPIPService:*(void *)(a1 + 32) didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)backgroundPIPTargetRequestsAuthorization:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[PGBackgroundPIPService backgroundPIPTargetRequestsAuthorization:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  uint64_t v6 = [v4 activitySessionIdentifier];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [(NSMutableDictionary *)self->_lock_targetsByActivitySessionIdentifier objectForKeyedSubscript:v6];
  if (!v7)
  {
    [(NSMutableDictionary *)self->_lock_targetsByActivitySessionIdentifier setObject:v4 forKeyedSubscript:v6];
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (![v7 isConnectionActive]
    || [v7 state] == 4
    || [v7 state] == 5)
  {
    [v7 invalidate];
LABEL_9:
    id v9 = v4;
    id v10 = v6;
    BSDispatchMain();

    goto LABEL_10;
  }
  int v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = (const char *)v6;
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "Refusing authorization for %{public}@ because an authorization request (%{public}@) for this activitySessionIdentifier already exists %{public}@ and has not yet been revoked.", buf, 0x20u);
  }

  [v4 transitionToStateIfPossible:4];
LABEL_10:
}

void __67__PGBackgroundPIPService_backgroundPIPTargetRequestsAuthorization___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) activitySessionIdentifier];
  uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
  LODWORD(v3) = [v2 backgroundPIPService:v3 canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:v4 appBundleIdentifier:v5];

  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 48)];
    uint64_t v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v14 = 136315394;
      __int16 v15 = "-[PGBackgroundPIPService backgroundPIPTargetRequestsAuthorization:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s BackgroundPIP: Authorizing identifier %{public}@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    [*(id *)(a1 + 40) transitionToStateIfPossible:2];
    uint64_t v11 = [*(id *)(a1 + 32) delegate];
    [v11 backgroundPIPService:*(void *)(a1 + 32) didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v12 = PGLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = *(const char **)(a1 + 48);
      int v14 = 138543362;
      __int16 v15 = v13;
      _os_log_impl(&dword_1B5645000, v12, OS_LOG_TYPE_DEFAULT, "Refusing authorization for %{public}@ because delegate didn't allow it.", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 40) transitionToStateIfPossible:4];
  }
}

- (void)pipDidStartForRemoteObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pictureInPictureApplication];
  id v10 = [v5 bundleIdentifier];

  uint64_t v6 = [v4 activitySessionIdentifier];

  uint64_t v7 = [(PGBackgroundPIPService *)self _targetForIdentifier:v6];
  uint64_t v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:v10];

  if (v9) {
    [v7 transitionToStateIfPossible:3];
  }
}

- (void)pipDidStopForRemoteObject:(id)a3
{
  id v13 = a3;
  id v4 = [v13 activitySessionIdentifier];
  uint64_t v5 = [(PGBackgroundPIPService *)self _targetForIdentifier:v4];
  uint64_t v6 = [v5 bundleIdentifier];
  uint64_t v7 = [v13 pictureInPictureApplication];
  uint64_t v8 = [v7 bundleIdentifier];
  if ([v6 isEqualToString:v8])
  {
    uint64_t v9 = [v5 state];

    if (v9 == 3)
    {
      if ([v13 isVideoCall])
      {
        id v10 = [v13 pictureInPictureApplication];
        uint64_t v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:@"com.apple.InCallService"];

        if (v12) {
          [v5 invalidate];
        }
      }
    }
  }
  else
  {
  }
}

- (BOOL)hasAcquiredAuthorizationForActivitySessionWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (-[PGBackgroundPIPService identifiersForAuthorizedActivitySessions](self, "identifiersForAuthorizedActivitySessions"), uint64_t v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 containsObject:v6], v8, v9))
  {
    id v10 = [(PGBackgroundPIPService *)self _targetForIdentifier:v6];
    if ([v10 isConnectionActive])
    {
      uint64_t v11 = [v10 bundleIdentifier];
      char v12 = [v7 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)revokeAuthorizationActivitySessionWithIdentifier:(id)a3
{
  if (a3)
  {
    -[PGBackgroundPIPService _targetForIdentifier:](self, "_targetForIdentifier:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 invalidate];
  }
}

- (id)_targetForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_lock_targetsByActivitySessionIdentifier objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (PGBackgroundPIPServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGBackgroundPIPServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)identifiersForAuthorizedActivitySessions
{
  return self->_identifiersForAuthorizedActivitySessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersForAuthorizedActivitySessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_targetsByActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_targets, 0);
  objc_storeStrong((id *)&self->_mutableIdentifiersForAuthorizedActivitySessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end