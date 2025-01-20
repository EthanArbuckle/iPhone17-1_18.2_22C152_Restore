@interface SBSBackgroundActivityAssertionManager
+ (id)sharedInstance;
- (NSMapTable)assertionsByIdentifier;
- (NSMutableDictionary)acquisitionHandlerEntriesByIdentifier;
- (NSString)description;
- (NSXPCConnection)sbXPCConnection;
- (OS_dispatch_queue)coordinatorCalloutQueue;
- (OS_dispatch_queue)internalQueue;
- (SBSBackgroundActivityAssertionManager)init;
- (SBSBackgroundActivityCoordinator)internalQueue_backgroundActivityCoordinator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleXPCConnectionInvalidation;
- (void)_internalQueue_removeBackgroundActivityAssertionWithIdentifier:(id)a3 invalidate:(BOOL)a4;
- (void)_internalQueue_setupXPCConnectionIfNecessary;
- (void)_internalQueue_updateRegistrationForCoordinator:(id)a3 reply:(id)a4;
- (void)_reactivateAssertions;
- (void)_registerBackgroundActivityCoordinatorAfterInterruption;
- (void)addBackgroundActivityAssertion:(id)a3 withHandler:(id)a4 onQueue:(id)a5;
- (void)invalidateBackgroundActivityAssertionsWithIdentifiers:(id)a3;
- (void)removeBackgroundActivityAssertion:(id)a3;
- (void)setAcquisitionHandlerEntriesByIdentifier:(id)a3;
- (void)setAssertionsByIdentifier:(id)a3;
- (void)setCoordinatorCalloutQueue:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setInternalQueue_backgroundActivityCoordinator:(id)a3;
- (void)setSbXPCConnection:(id)a3;
- (void)statusBarTappedWithContext:(id)a3 reply:(id)a4;
- (void)unregisterCoordinator;
- (void)updateRegistrationForCoordinator:(id)a3 reply:(id)a4;
- (void)updateStatusStringForAssertion:(id)a3;
@end

@implementation SBSBackgroundActivityAssertionManager

- (SBSBackgroundActivityAssertionManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBSBackgroundActivityAssertionManager;
  v2 = [(SBSBackgroundActivityAssertionManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    assertionsByIdentifier = v2->_assertionsByIdentifier;
    v2->_assertionsByIdentifier = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    acquisitionHandlerEntriesByIdentifier = v2->_acquisitionHandlerEntriesByIdentifier;
    v2->_acquisitionHandlerEntriesByIdentifier = (NSMutableDictionary *)v5;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v9 = BSDispatchQueueCreateSerial();
    coordinatorCalloutQueue = v2->_coordinatorCalloutQueue;
    v2->_coordinatorCalloutQueue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v2);
    objc_copyWeak(&v13, &location);
    id v11 = (id)BSLogAddStateCaptureBlockWithTitle();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __45__SBSBackgroundActivityAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_43);
  }
  v2 = (void *)sharedInstance___sharedBackgroundActivityAssertionManager;
  return v2;
}

uint64_t __55__SBSBackgroundActivityAssertionManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedBackgroundActivityAssertionManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!self->_sbXPCConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.springboard.statusbarservices" options:0];
    sbXPCConnection = self->_sbXPCConnection;
    self->_sbXPCConnection = v4;

    v6 = self->_sbXPCConnection;
    v7 = SBSBackgroundActivityAssertionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_sbXPCConnection setExportedObject:self];
    v8 = self->_sbXPCConnection;
    uint64_t v9 = SBBackgroundActivityAssertionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    objc_initWeak(&location, self);
    v10 = self->_sbXPCConnection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke;
    v17[3] = &unk_1E566D410;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v17];
    id v11 = self->_sbXPCConnection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2;
    objc_super v15 = &unk_1E566D7A8;
    v16[1] = (id)a2;
    objc_copyWeak(v16, &location);
    [(NSXPCConnection *)v11 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_sbXPCConnection resume];
    objc_destroyWeak(v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reactivateAssertions];
  [WeakRetained _registerBackgroundActivityCoordinatorAfterInterruption];
}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCConnectionInvalidation];
}

- (void)addBackgroundActivityAssertion:(id)a3 withHandler:(id)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke;
  v15[3] = &unk_1E566D820;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _internalQueue_setupXPCConnectionIfNecessary];
  v2 = [*(id *)(a1 + 40) uniqueIdentifier];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(a1 + 40) forKey:v2];
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;
  if (*(void *)(a1 + 56))
  {
    v6 = [[SBSBackgroundActivityAssertionAcquisitionHandlerEntry alloc] initWithHandler:*(void *)(a1 + 56) queue:v4];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKey:v2];
  }
  v7 = [*(id *)(a1 + 40) assertionData];
  id v8 = SBLogStatusBarish();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to add style override assertion: %{public}@", buf, 0xCu);
  }

  id v9 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_101;
  v13[3] = &unk_1E566D7F8;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v2;
  id v15 = v7;
  id v11 = v7;
  id v12 = v2;
  [v9 activateBackgroundActivityAssertions:v10 reply:v13];
}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_101(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_2;
  v7[3] = &unk_1E566CC30;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  }
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 40)];
    uint64_t v5 = v4;
    if (v4 && [v4 BOOLValue])
    {
      id v6 = SBLogStatusBarish();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v7;
        _os_log_impl(&dword_18FBC5000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added style override assertion: %{public}@", buf, 0xCu);
      }

      char v8 = 1;
      if (!v3) {
        goto LABEL_14;
      }
    }
    else
    {
      id v9 = SBLogStatusBarish();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v10;
        _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_DEFAULT, "Failed to add style override assertion: %{public}@", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
      char v8 = 0;
      if (!v3) {
        goto LABEL_14;
      }
    }
    id v11 = [v3 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_102;
    v12[3] = &unk_1E566D7D0;
    id v13 = v3;
    char v14 = v8;
    dispatch_async(v11, v12);

LABEL_14:
  }
}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_102(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

- (void)removeBackgroundActivityAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uniqueIdentifier];
  id v6 = [v4 assertionData];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBSBackgroundActivityAssertionManager_removeBackgroundActivityAssertion___block_invoke;
  block[3] = &unk_1E566BD88;
  id v11 = v6;
  id v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(internalQueue, block);
}

void __75__SBSBackgroundActivityAssertionManager_removeBackgroundActivityAssertion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to remove style override assertion: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 40) _internalQueue_removeBackgroundActivityAssertionWithIdentifier:*(void *)(a1 + 48) invalidate:0];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 24) remoteObjectProxy];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
  [v4 deactivateBackgroundActivityAssertionsWithIdentifiers:v5];
}

- (void)updateStatusStringForAssertion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBSBackgroundActivityAssertionManager_updateStatusStringForAssertion___block_invoke;
  v7[3] = &unk_1E566BB08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __72__SBSBackgroundActivityAssertionManager_updateStatusStringForAssertion___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  v2 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:];
  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 24) remoteObjectProxy];
    id v4 = [*(id *)(a1 + 32) statusString];
    [v3 setStatusString:v4 forAssertionWithIdentifier:v5];
  }
}

- (void)invalidateBackgroundActivityAssertionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__SBSBackgroundActivityAssertionManager_invalidateBackgroundActivityAssertionsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E566BB08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __95__SBSBackgroundActivityAssertionManager_invalidateBackgroundActivityAssertionsWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "Style override assertions invalidated: %{public}@", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) _internalQueue_removeBackgroundActivityAssertionWithIdentifier:*(void *)(*((void *)&v9 + 1) + 8 * v8++) invalidate:1 (void)v9];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)statusBarTappedWithContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke;
  block[3] = &unk_1E566D848;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_2;
    block[3] = &unk_1E566B6C8;
    id v10 = *(id *)(a1 + 48);
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    dispatch_async(v4, block);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_2(void *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F963F8] identifierWithPid:getpid()];
  id v3 = [MEMORY[0x1E4F96478] targetWithProcessIdentifier:v2];
  id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"SBSBackgroundActivityCoordinatorDelegateCompletionBlock" target:v3 attributes:v5];
  if (([v6 acquireWithError:0] & 1) == 0)
  {
    id v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Could not take process assertion for delivering event to delegate.", buf, 2u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
  id v9 = (void *)a1[4];
  uint64_t v8 = a1[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_118;
  v11[3] = &unk_1E566BCE8;
  id v12 = v6;
  id v10 = v6;
  [v9 _handleStatusBarTapWithContext:v8 withCompletionBlock:v11];
}

uint64_t __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_118(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (NSString)description
{
  return (NSString *)[(SBSBackgroundActivityAssertionManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSBackgroundActivityAssertionManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSBackgroundActivityAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSBackgroundActivityAssertionManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SBSBackgroundActivityAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E566BB08;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __79__SBSBackgroundActivityAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) assertionsByIdentifier];
  v2 = [v4 dictionaryRepresentation];
  id v3 = [v2 allValues];
  [v1 appendArraySection:v3 withName:@"assertions" skipIfEmpty:0];
}

- (void)_internalQueue_removeBackgroundActivityAssertionWithIdentifier:(id)a3 invalidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v7 = [(NSMapTable *)self->_assertionsByIdentifier objectForKey:v6];
  uint64_t v8 = [(NSMutableDictionary *)self->_acquisitionHandlerEntriesByIdentifier objectForKey:v6];
  if (v8)
  {
    [(NSMutableDictionary *)self->_acquisitionHandlerEntriesByIdentifier removeObjectForKey:v6];
    if (v4)
    {
      id v9 = [v8 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke;
      block[3] = &unk_1E566BCE8;
      id v20 = v8;
      dispatch_async(v9, block);
    }
  }
  if (v7)
  {
    id v10 = [v7 invalidationHandler];
    if (v10)
    {
      if (v8 || !v4)
      {
        [v7 setInvalidationHandler:0];
      }
      else
      {
        long long v11 = dispatch_get_global_queue(0, 0);
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        char v14 = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_2;
        uint64_t v15 = &unk_1E566B6C8;
        id v18 = v10;
        uint64_t v16 = self;
        id v17 = v7;
        dispatch_async(v11, &v12);
      }
    }
    -[NSMapTable removeObjectForKey:](self->_assertionsByIdentifier, "removeObjectForKey:", v6, v12, v13, v14, v15, v16);
  }
}

void __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) handler];
  v1[2](v1, 0);
}

void __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_3;
  block[3] = &unk_1E566BCE8;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInvalidationHandler:0];
}

- (void)updateRegistrationForCoordinator:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SBSBackgroundActivityAssertionManager_updateRegistrationForCoordinator_reply___block_invoke;
  block[3] = &unk_1E566D870;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __80__SBSBackgroundActivityAssertionManager_updateRegistrationForCoordinator_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalQueue_updateRegistrationForCoordinator:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_internalQueue_updateRegistrationForCoordinator:(id)a3 reply:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBSBackgroundActivityAssertionManager *)self _internalQueue_setupXPCConnectionIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalQueue_backgroundActivityCoordinator);

  if (WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v33[0] = @"There is already a coordinator registered for this background activity within this process.";
    v32[0] = v10;
    v32[1] = @"SBSBackgroundActivityCoordinatorErrorBackgroundActivityIdentifiersKey";
    long long v11 = [v6 backgroundActivityIdentifiers];
    v33[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v13 = [v9 errorWithDomain:@"SBSBackgroundActivityCoordinatorErrorDomain" code:1 userInfo:v12];

    coordinatorCalloutQueue = self->_coordinatorCalloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke;
    block[3] = &unk_1E566B4B0;
    id v30 = v13;
    id v31 = v7;
    id v15 = v13;
    id v16 = v7;
    dispatch_async(coordinatorCalloutQueue, block);
  }
  else
  {
    sbXPCConnection = self->_sbXPCConnection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_2;
    v25[3] = &unk_1E566D898;
    id v18 = v6;
    id v26 = v18;
    v27 = self;
    id v19 = v7;
    id v28 = v19;
    id v20 = [(NSXPCConnection *)sbXPCConnection remoteObjectProxyWithErrorHandler:v25];
    objc_storeWeak((id *)&self->_internalQueue_backgroundActivityCoordinator, v18);
    v21 = [v18 backgroundActivityIdentifiers];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_4;
    v23[3] = &unk_1E566B930;
    v23[4] = self;
    id v24 = v19;
    id v22 = v19;
    [v20 setRegisteredBackgroundActivityIdentifiers:v21 reply:v23];

    id v15 = v26;
  }
}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_2(uint64_t a1, void *a2)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v17[0] = @"Error getting remote proxy";
  v16[0] = v4;
  v16[1] = @"SBSBackgroundActivityCoordinatorErrorBackgroundActivityIdentifiersKey";
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 backgroundActivityIdentifiers];
  id v16[2] = *MEMORY[0x1E4F28A50];
  v17[1] = v7;
  v17[2] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  id v9 = [v3 errorWithDomain:@"SBSBackgroundActivityCoordinatorErrorDomain" code:3 userInfo:v8];

  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 40) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_3;
  block[3] = &unk_1E566B4B0;
  id v11 = *(id *)(a1 + 48);
  id v14 = v9;
  id v15 = v11;
  id v12 = v9;
  dispatch_async(v10, block);
}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_5;
  block[3] = &unk_1E566D870;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), 0);
  }
  v2 = *(NSObject **)(*(void *)(a1 + 40) + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_6;
  v3[3] = &unk_1E566B4B0;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);
}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_registerBackgroundActivityCoordinatorAfterInterruption
{
  id v3 = SBLogStatusBarish();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: XPC interrupted, registering style override coordinators again", buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), 0);
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2;
    v4[3] = &unk_1E566D8C0;
    v4[4] = v3;
    id v5 = WeakRetained;
    [v3 _internalQueue_updateRegistrationForCoordinator:v5 reply:v4];
  }
}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogStatusBarish();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: re-registering after interruption.", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_128;
  block[3] = &unk_1E566BD88;
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v7 = v3;
  dispatch_async(v6, block);
}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_128(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(NSObject **)(*(void *)(a1 + 40) + 48);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2_129;
    v3[3] = &unk_1E566BB08;
    id v4 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v2, v3);
  }
}

uint64_t __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2_129(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registrationInvalidated:*(void *)(a1 + 40)];
}

- (void)unregisterCoordinator
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxyWithErrorHandler:&__block_literal_global_131];
  id v3 = SBLogStatusBarish();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Cleaning up _BackgroundActivityCoordinator, and cancelling.", v4, 2u);
  }

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), 0);
  [v2 setRegisteredBackgroundActivityIdentifiers:0 reply:&__block_literal_global_134];
}

void __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke_2()
{
  v0 = SBLogStatusBarish();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FBC5000, v0, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Error communicating with SpringBoard.", v1, 2u);
  }
}

- (void)_handleXPCConnectionInvalidation
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBSBackgroundActivityAssertionManager__handleXPCConnectionInvalidation__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __73__SBSBackgroundActivityAssertionManager__handleXPCConnectionInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) keyEnumerator];
  id v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) _internalQueue_removeBackgroundActivityAssertionWithIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v9++) invalidate:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_reactivateAssertions
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v7)];
        uint64_t v9 = v8;
        if (v8)
        {
          long long v10 = [v8 assertionData];
          [v2 addObject:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  long long v11 = SBLogStatusBarish();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FBC5000, v11, OS_LOG_TYPE_DEFAULT, "Re-activating style override assertions after interruption", buf, 2u);
  }

  if ([v2 count])
  {
    long long v12 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_136;
    v13[3] = &unk_1E566D8E8;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v2;
    [v12 activateBackgroundActivityAssertions:v14 reply:v13];
  }
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_136(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_2;
  block[3] = &unk_1E566BD88;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_2(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138543362;
    long long v14 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * v7) uniqueIdentifier:v14];
        uint64_t v9 = [a1[5] objectForKey:v8];
        long long v10 = v9;
        if (v9 && [v9 BOOLValue])
        {
          long long v11 = [*((id *)a1[6] + 2) objectForKey:v8];
          if (v11)
          {
            [*((id *)a1[6] + 2) removeObjectForKey:v8];
            long long v12 = [v11 queue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_3;
            block[3] = &unk_1E566BCE8;
            id v16 = v11;
            dispatch_async(v12, block);
          }
        }
        else
        {
          long long v13 = SBLogStatusBarish();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            id v22 = v8;
            _os_log_impl(&dword_18FBC5000, v13, OS_LOG_TYPE_DEFAULT, "Failed to re-activate style override assertion: %{public}@", buf, 0xCu);
          }

          [a1[6] _internalQueue_removeBackgroundActivityAssertionWithIdentifier:v8 invalidate:1];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) handler];
  v1[2](v1, 1);
}

- (NSMapTable)assertionsByIdentifier
{
  return self->_assertionsByIdentifier;
}

- (void)setAssertionsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)acquisitionHandlerEntriesByIdentifier
{
  return self->_acquisitionHandlerEntriesByIdentifier;
}

- (void)setAcquisitionHandlerEntriesByIdentifier:(id)a3
{
}

- (NSXPCConnection)sbXPCConnection
{
  return self->_sbXPCConnection;
}

- (void)setSbXPCConnection:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (SBSBackgroundActivityCoordinator)internalQueue_backgroundActivityCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalQueue_backgroundActivityCoordinator);
  return (SBSBackgroundActivityCoordinator *)WeakRetained;
}

- (void)setInternalQueue_backgroundActivityCoordinator:(id)a3
{
}

- (OS_dispatch_queue)coordinatorCalloutQueue
{
  return self->_coordinatorCalloutQueue;
}

- (void)setCoordinatorCalloutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorCalloutQueue, 0);
  objc_destroyWeak((id *)&self->_internalQueue_backgroundActivityCoordinator);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sbXPCConnection, 0);
  objc_storeStrong((id *)&self->_acquisitionHandlerEntriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifier, 0);
}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "%{public}@ -- Connection to SpringBoard invalidated", (uint8_t *)&v4, 0xCu);
}

@end