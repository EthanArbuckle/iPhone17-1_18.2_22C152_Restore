@interface SBSystemApertureRestrictionServer
- (SBSystemApertureRestrictionServer)initWithDelegate:(id)a3;
- (id)acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason:(id)a3;
- (id)acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason:(id)a3;
- (id)acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason:(id)a3;
- (void)invalidate;
- (void)invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier:(id)a3;
- (void)invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier:(id)a3;
- (void)invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation SBSystemApertureRestrictionServer

- (SBSystemApertureRestrictionServer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSystemApertureRestrictionServer;
  v5 = [(SBSystemApertureRestrictionServer *)&v18 init];
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v5->_isValid = 1;
    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    connections = v5->_connections;
    v5->_connections = (NSMutableArray *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E4F628A0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__SBSystemApertureRestrictionServer_initWithDelegate___block_invoke;
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

void __54__SBSystemApertureRestrictionServer_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6C38] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  self->_isValid = 0;
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer received connection %@", buf, 0xCu);
  }

  v8 = [v6 remoteProcess];
  int v9 = [v8 pid];
  if (v9 != getpid())
  {
    v11 = [v6 remoteProcess];
    v12 = [v11 auditToken];
    if (([v12 hasEntitlement:@"com.apple.springboard.system-component-restriction"] & 1) == 0)
    {
      uint64_t v13 = [v6 remoteProcess];
      id v14 = [v13 auditToken];
      if (([v14 hasEntitlement:@"com.apple.springboard.system-component-complete-suppression"] & 1) == 0)
      {
        v15 = [v6 remoteProcess];
        v16 = [v15 auditToken];
        char v17 = [v16 hasEntitlement:@"com.apple.springboard.system-component-suppress-hide-empty-clone"];

        if ((v17 & 1) == 0) {
          goto LABEL_5;
        }
LABEL_12:
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke;
        v18[3] = &unk_1E6AF7470;
        v18[4] = self;
        [v6 configureConnection:v18];
        os_unfair_lock_lock(&self->_clientServiceCollectionLock);
        [(NSMutableArray *)self->_connections addObject:v6];
        os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
        [v6 activate];
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }

LABEL_5:
  v10 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
  }

  [v6 invalidate];
LABEL_13:
}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA6C38] serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = [MEMORY[0x1E4FA6C38] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6AF7420;
  objc_copyWeak(&v10, &location);
  id v6 = (void *)MEMORY[0x1D948C7A0](v9);
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E6AF7BA0;
  objc_copyWeak(&v8, &location);
  [v3 setActivationHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  v5 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer interrupted/invalidated connection %@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  [*((id *)WeakRetained + 2) removeObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  id v8 = WeakRetained;
  int v9 = v3;
  id v6 = v3;
  id v7 = WeakRetained;
  BSDispatchMain();
}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_30(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(v1 + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2_31;
    v13[3] = &unk_1E6AF7B78;
    id v14 = *(id *)(a1 + 40);
    id v3 = objc_msgSend(v2, "bs_filter:", v13);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 setInvalidationReason:@"connection invalidated"];
          [v8 invalidate];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

BOOL __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2_31(uint64_t a1, void *a2)
{
  id v3 = [a2 associatedConnection];
  if (v3) {
    BOOL v4 = v3 == *(void **)(a1 + 32);
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(WeakRetained[4]);
  uint64_t v5 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer activated connection %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v5 = [v4 remoteProcess];
  int v6 = [v5 auditToken];

  if ([v6 hasEntitlement:@"com.apple.springboard.system-component-restriction"])
  {
    id v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = NSString;
    long long v9 = [v7 UUIDString];
    long long v10 = [v8 stringWithFormat:@"%@: %@", v9, v3];

    long long v11 = [_SBSystemApertureRestrictionServerAssertionWrapper alloc];
    long long v12 = [v7 UUIDString];
    uint64_t v13 = [(BSSimpleAssertion *)v11 initWithIdentifier:v12 forReason:v10 invalidationBlock:&__block_literal_global_20];

    id v14 = [MEMORY[0x1E4F62880] currentContext];
    [(_SBSystemApertureRestrictionServerAssertionWrapper *)v13 setAssociatedConnection:v14];

    id v3 = v10;
    v15 = v13;
    BSDispatchMain();
  }
  else
  {
    v15 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v18 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  BSDispatchMain();
}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) wrappedAssertion];
  [*(id *)(a1 + 32) setWrappedAssertion:0];
  id v2 = [*(id *)(a1 + 32) invalidationReason];
  [v3 invalidateWithReason:v2];
}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = [WeakRetained restrictSystemApertureToInertWithReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setWrappedAssertion:v3];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_4;
  v8[3] = &unk_1E6AF7BE8;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 48);
  [v3 addInvalidationBlock:v8];
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v4 addObject:*(void *)(a1 + 48)];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke_2;
  v3[3] = &unk_1E6AF7B78;
  id v4 = *(id *)(a1 + 40);
  id v2 = objc_msgSend(v1, "bs_firstObjectPassingTest:", v3);
  [v2 setInvalidationReason:@"restriction server client request"];
  [v2 invalidate];
}

uint64_t __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v5 = [v4 remoteProcess];
  uint64_t v6 = [v5 auditToken];

  if ([v6 hasEntitlement:@"com.apple.springboard.system-component-complete-suppression"])
  {
    id v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = NSString;
    id v9 = [v7 UUIDString];
    id v10 = [v8 stringWithFormat:@"%@: %@", v9, v3];

    long long v11 = [_SBSystemApertureRestrictionServerAssertionWrapper alloc];
    long long v12 = [v7 UUIDString];
    uint64_t v13 = [(BSSimpleAssertion *)v11 initWithIdentifier:v12 forReason:v10 invalidationBlock:&__block_literal_global_53];

    id v14 = [MEMORY[0x1E4F62880] currentContext];
    [(_SBSystemApertureRestrictionServerAssertionWrapper *)v13 setAssociatedConnection:v14];

    id v3 = v10;
    v15 = v13;
    BSDispatchMain();
  }
  else
  {
    v15 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v18 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  BSDispatchMain();
}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) wrappedAssertion];
  [*(id *)(a1 + 32) setWrappedAssertion:0];
  id v2 = [*(id *)(a1 + 32) invalidationReason];
  [v3 invalidateWithReason:v2];
}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = [WeakRetained suppressSystemApertureCompletelyWithReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setWrappedAssertion:v3];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_4;
  v8[3] = &unk_1E6AF7BE8;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 48);
  [v3 addInvalidationBlock:v8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v4 addObject:*(void *)(a1 + 48)];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke_2;
  v3[3] = &unk_1E6AF7B78;
  id v4 = *(id *)(a1 + 40);
  id v2 = objc_msgSend(v1, "bs_firstObjectPassingTest:", v3);
  [v2 setInvalidationReason:@"restriction server client request"];
  [v2 invalidate];
}

uint64_t __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v5 = [v4 remoteProcess];
  uint64_t v6 = [v5 auditToken];

  if ([v6 hasEntitlement:@"com.apple.springboard.system-component-suppress-hide-empty-clone"])
  {
    id v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = NSString;
    id v9 = [v7 UUIDString];
    id v10 = [v8 stringWithFormat:@"%@: %@", v9, v3];

    long long v11 = [_SBSystemApertureRestrictionServerAssertionWrapper alloc];
    long long v12 = [v7 UUIDString];
    uint64_t v13 = [(BSSimpleAssertion *)v11 initWithIdentifier:v12 forReason:v10 invalidationBlock:&__block_literal_global_55];

    id v14 = [MEMORY[0x1E4F62880] currentContext];
    [(_SBSystemApertureRestrictionServerAssertionWrapper *)v13 setAssociatedConnection:v14];

    id v3 = v10;
    v15 = v13;
    BSDispatchMain();
  }
  else
  {
    v15 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v18 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

void __123__SBSystemApertureRestrictionServer_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  BSDispatchMain();
}

void __123__SBSystemApertureRestrictionServer_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) wrappedAssertion];
  [*(id *)(a1 + 32) setWrappedAssertion:0];
  id v2 = [*(id *)(a1 + 32) invalidationReason];
  [v3 invalidateWithReason:v2];
}

void __123__SBSystemApertureRestrictionServer_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = [WeakRetained suppressHidingOfEmptySystemApertureOnClonedDisplaysWithReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setWrappedAssertion:v3];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __123__SBSystemApertureRestrictionServer_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason___block_invoke_4;
  v8[3] = &unk_1E6AF7BE8;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 48);
  [v3 addInvalidationBlock:v8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v4 addObject:*(void *)(a1 + 48)];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __123__SBSystemApertureRestrictionServer_acquireSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionIdentifierWithReason___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __120__SBSystemApertureRestrictionServer_invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __120__SBSystemApertureRestrictionServer_invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier___block_invoke_2;
  v3[3] = &unk_1E6AF7B78;
  id v4 = *(id *)(a1 + 40);
  id v2 = objc_msgSend(v1, "bs_firstObjectPassingTest:", v3);
  [v2 setInvalidationReason:@"restriction server client request"];
  [v2 invalidate];
}

uint64_t __120__SBSystemApertureRestrictionServer_invalidateSuppressHidingEmptySystemApertureOnClonedDisplaysAssertionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_remoteAssertions, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end