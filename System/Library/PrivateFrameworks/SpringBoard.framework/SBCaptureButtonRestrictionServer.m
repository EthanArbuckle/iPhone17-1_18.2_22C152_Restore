@interface SBCaptureButtonRestrictionServer
- (SBCaptureButtonRestrictionServer)initWithDelegate:(id)a3;
- (id)_authorizedClientBundleIdentifiers;
- (uint64_t)_remoteProcessIsAuthorizedClient:(uint64_t)a1;
- (void)_addCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1;
- (void)_removeCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1;
- (void)_removeCaptureButtonInhibitActionAssertionForVersionedPID:(void *)a3 reason:;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setCaptureButtonActionInhibited:(id)a3;
@end

@implementation SBCaptureButtonRestrictionServer

- (SBCaptureButtonRestrictionServer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBCaptureButtonRestrictionServer;
  v5 = [(SBCaptureButtonRestrictionServer *)&v18 init];
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v5->_isValid = 1;
    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v5->_connections;
    v5->_connections = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E4F628A0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__SBCaptureButtonRestrictionServer_initWithDelegate___block_invoke;
    v16[3] = &unk_1E6AF58F0;
    v12 = v5;
    v17 = v12;
    uint64_t v13 = [v11 listenerWithConfigurator:v16];
    id v14 = v12[5];
    v12[5] = (id)v13;

    [v12[5] activate];
  }

  return v5;
}

void __53__SBCaptureButtonRestrictionServer_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6A48] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBCaptureButtonRestrictionServer.m";
  __int16 v16 = 1024;
  int v17 = 78;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_isValid)
  {
    self->_isValid = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = [(NSMutableDictionary *)self->_versionedPIDToRemoteAssertion allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) wrappedAssertion];
          [v8 invalidate];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    versionedPIDToRemoteAssertion = self->_versionedPIDToRemoteAssertion;
    self->_versionedPIDToRemoteAssertion = 0;

    [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  }
}

- (id)_authorizedClientBundleIdentifiers
{
  if (a1)
  {
    if (_authorizedClientBundleIdentifiers_onceToken != -1) {
      dispatch_once(&_authorizedClientBundleIdentifiers_onceToken, &__block_literal_global_313);
    }
    a1 = (id)_authorizedClientBundleIdentifiers_authorizedBundleIdentifiers;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __70__SBCaptureButtonRestrictionServer__authorizedClientBundleIdentifiers__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.Diagnostics", @"com.apple.Mica-Player", @"com.apple.Preferences", @"com.apple.purplebuddy", @"com.apple.VoiceOver", 0);
  uint64_t v1 = (void *)_authorizedClientBundleIdentifiers_authorizedBundleIdentifiers;
  _authorizedClientBundleIdentifiers_authorizedBundleIdentifiers = v0;
}

- (uint64_t)_remoteProcessIsAuthorizedClient:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 auditToken];
    if (([v5 hasEntitlement:@"com.apple.springboard.capture-button-restriction"] & 1) != 0
      || [v5 hasEntitlement:@"com.apple.springboard.126E27E0-D025-4A46-B2F1-AF49D4E0B105"])
    {
      uint64_t v6 = [v4 bundleIdentifier];
      v7 = -[SBCaptureButtonRestrictionServer _authorizedClientBundleIdentifiers]((id)a1);
      a1 = [v7 containsObject:v6];

      if ((a1 & 1) == 0)
      {
        int v8 = SBLogCameraCaptureRestriction();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(SBCaptureButtonRestrictionServer *)(uint64_t)v4 _remoteProcessIsAuthorizedClient:v8];
        }
      }
    }
    else
    {
      if (([v5 hasEntitlement:@"com.apple.springboard.capture-button-restriction-internal"] & 1) != 0
        || [v5 hasEntitlement:@"com.apple.springboard.8CFFD00F-D62F-43B2-AA10-427657A783F4"])
      {
        if (os_variant_has_internal_content())
        {
          a1 = 1;
LABEL_18:

          goto LABEL_19;
        }
        uint64_t v6 = SBLogCameraCaptureRestriction();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:]((uint64_t)v4, v6);
        }
      }
      else
      {
        uint64_t v6 = SBLogCameraCaptureRestriction();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:]((uint64_t)v4, v6);
        }
      }
      a1 = 0;
    }

    goto LABEL_18;
  }
LABEL_19:

  return a1;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogCameraCaptureRestriction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer received connection %{public}@", buf, 0xCu);
  }

  int v8 = [v6 remoteProcess];
  uint64_t v9 = [v8 auditToken];
  uint64_t v10 = [v9 versionedPID];

  LODWORD(v9) = [v8 pid];
  if (v9 == getpid()
    || !-[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:]((uint64_t)self, v8))
  {
    [v6 invalidate];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_1E6B09B90;
    v11[4] = self;
    v11[5] = v10;
    [v6 configureConnection:v11];
    os_unfair_lock_lock(&self->_clientServiceCollectionLock);
    [(NSMutableSet *)self->_connections addObject:v6];
    os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
    [v6 activate];
  }
}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FA6A48] serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = [MEMORY[0x1E4FA6A48] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6B09B68;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)(a1 + 40);
  id v6 = (void *)MEMORY[0x1D948C7A0](v9);
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_4;
  v7[3] = &unk_1E6AF7BA0;
  objc_copyWeak(&v8, &location);
  [v3 setActivationHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  [*((id *)WeakRetained + 2) removeObject:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  id v5 = WeakRetained;
  BSDispatchMain();
}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForVersionedPID:reason:](v2, *(void *)(a1 + 40), @"connection interrupted");
  }
}

- (void)_removeCaptureButtonInhibitActionAssertionForVersionedPID:(void *)a3 reason:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v6 = [NSNumber numberWithLongLong:a2];
    v7 = [*(id *)(a1 + 24) objectForKey:v6];
    if (v7)
    {
      id v8 = SBLogCameraCaptureRestriction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = NSStringFromBSVersionedPID();
        int v11 = 138543618;
        long long v12 = v9;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer invalidate remote assertion for %{public}@ for reason %{public}@", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v10 = [v7 wrappedAssertion];
      [v10 invalidate];

      [*(id *)(a1 + 24) removeObjectForKey:v6];
    }
  }
}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(WeakRetained[4]);
  id v5 = SBLogCameraCaptureRestriction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer activated connection %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_removeCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 remoteProcess];
    id v4 = [v3 auditToken];

    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForVersionedPID:reason:](a1, [v4 versionedPID], @"remote request");
  }
}

- (void)_addCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 remoteProcess];
    id v16 = [v4 auditToken];

    uint64_t v5 = [v16 versionedPID];
    int v6 = [NSNumber numberWithLongLong:v5];
    id v7 = objc_alloc_init(_SBCaptureButtonRestrictionServerAssertionWrapper);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = NSString;
    uint64_t v10 = NSStringFromBSVersionedPID();
    int v11 = [v9 stringWithFormat:@"request from process %@", v10];
    long long v12 = [WeakRetained inhibitCaptureButtonActionAssertionWithReason:v11];

    [(_SBCaptureButtonRestrictionServerAssertionWrapper *)v7 setWrappedAssertion:v12];
    [(_SBCaptureButtonRestrictionServerAssertionWrapper *)v7 setAssociatedConnection:v3];

    __int16 v13 = *(void **)(a1 + 24);
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v15 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v14;

      __int16 v13 = *(void **)(a1 + 24);
    }
    [v13 setObject:v7 forKey:v6];
  }
}

- (void)setCaptureButtonActionInhibited:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F62880] currentContext];
  v7 = int v6 = v3;
  id v4 = v7;
  id v5 = v3;
  BSDispatchMain();
}

void __68__SBCaptureButtonRestrictionServer_setCaptureButtonActionInhibited___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  if (v2)
  {
    -[SBCaptureButtonRestrictionServer _addCaptureButtonInhibitActionAssertionForConnection:](v3, v4);
  }
  else
  {
    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForConnection:](v3, v4);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_versionedPIDToRemoteAssertion, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)_remoteProcessIsAuthorizedClient:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBCaptureButtonRestrictionServer: process is not authorized to suppress the capture button %{public}@ -- %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_remoteProcessIsAuthorizedClient:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBCaptureButtonRestrictionServer: process is not authorized to suppress the capture button on prod devices %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_remoteProcessIsAuthorizedClient:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBCaptureButtonRestrictionServer: process is missing required entitlement %{public}@", (uint8_t *)&v2, 0xCu);
}

@end