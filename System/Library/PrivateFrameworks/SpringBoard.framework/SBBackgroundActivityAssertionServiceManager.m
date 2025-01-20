@interface SBBackgroundActivityAssertionServiceManager
- (BOOL)_verifyCoordinatorEntitlementForBackgroundActivityIdentifiers:(id)a3 onConnection:(id)a4;
- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)assertionsByBackgroundActivityIdentifier;
- (NSMapTable)assertionsByIdentifierByClientConnection;
- (NSMapTable)attributionsByAssertion;
- (NSMutableArray)coordinatorConnectionsByBackgroundActivity;
- (NSMutableSet)backgroundActivityIdentifiers;
- (NSMutableSet)exclusiveBackgroundActivityIdentifiers;
- (NSString)description;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)internalQueue;
- (SBBackgroundActivityAssertionServiceManager)init;
- (SBBackgroundActivityAssertionServiceManagerDelegate)delegate;
- (STBackgroundActivitiesStatusDomainPublisher)publisher;
- (id)_internalQueue_backgroundActivityIdentifiersAddedByAddingAssertionData:(id)a3;
- (id)_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:(id)a3;
- (id)_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:(id)a3;
- (id)_internalQueue_coordinatorClientForConnection:(id)a3;
- (id)_internalQueue_coordinatorClientMatchingBackgroundActivityIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)statusStringForBackgroundActivityWithIdentifier:(id)a3 activeAttributions:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4;
- (void)_internalQueue_invalidateBackgroundActivityAssertions:(id)a3;
- (void)_internalQueue_publishAttributionsForAddingAssertionData:(id)a3;
- (void)_internalQueue_publishAttributionsForRemovingAssertionData:(id)a3;
- (void)_invalidateAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4;
- (void)_notifyDelegateAboutStatusStringChange;
- (void)activateBackgroundActivityAssertions:(id)a3 reply:(id)a4;
- (void)deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)invalidateBackgroundActivityAssertions:(id)a3;
- (void)invalidateBackgroundActivityAssertionsForAttributions:(id)a3;
- (void)setAssertionsByBackgroundActivityIdentifier:(id)a3;
- (void)setAssertionsByIdentifierByClientConnection:(id)a3;
- (void)setAttributionsByAssertion:(id)a3;
- (void)setBackgroundActivityIdentifiers:(id)a3;
- (void)setCoordinatorConnectionsByBackgroundActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExclusiveBackgroundActivityIdentifiers:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4;
- (void)setStatusString:(id)a3 forAssertionWithIdentifier:(id)a4;
- (void)setXpcListener:(id)a3;
- (void)unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers:(id)a3;
@end

@implementation SBBackgroundActivityAssertionServiceManager

- (SBBackgroundActivityAssertionServiceManager)init
{
  v29.receiver = self;
  v29.super_class = (Class)SBBackgroundActivityAssertionServiceManager;
  v3 = [(SBBackgroundActivityAssertionServiceManager *)&v29 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    assertionsByIdentifierByClientConnection = v3->_assertionsByIdentifierByClientConnection;
    v3->_assertionsByIdentifierByClientConnection = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    assertionsByBackgroundActivityIdentifier = v3->_assertionsByBackgroundActivityIdentifier;
    v3->_assertionsByBackgroundActivityIdentifier = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    attributionsByAssertion = v3->_attributionsByAssertion;
    v3->_attributionsByAssertion = (NSMapTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    coordinatorConnectionsByBackgroundActivity = v3->_coordinatorConnectionsByBackgroundActivity;
    v3->_coordinatorConnectionsByBackgroundActivity = v10;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.springboard.statusbarservices"];
    xpcListener = v3->_xpcListener;
    v3->_xpcListener = (NSXPCListener *)v14;

    [(NSXPCListener *)v3->_xpcListener setDelegate:v3];
    [(NSXPCListener *)v3->_xpcListener resume];
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    backgroundActivityIdentifiers = v3->_backgroundActivityIdentifiers;
    v3->_backgroundActivityIdentifiers = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    exclusiveBackgroundActivityIdentifiers = v3->_exclusiveBackgroundActivityIdentifiers;
    v3->_exclusiveBackgroundActivityIdentifiers = (NSMutableSet *)v18;

    objc_initWeak(&location, v3);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v27, &location);
    id v20 = (id)BSLogAddStateCaptureBlockWithTitle();
    v21 = objc_msgSend((id)SBApp, "systemStatusServer", v26, 3221225472, __51__SBBackgroundActivityAssertionServiceManager_init__block_invoke, &unk_1E6AF76A8);
    if (!v21)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:v3 file:@"SBBackgroundActivityAssertionServiceManager.m" lineNumber:95 description:@"SBBackgroundActivityAssertionServiceManager is being created before the system status server"];
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FA9338]) initWithServerHandle:v21];
    publisher = v3->_publisher;
    v3->_publisher = (STBackgroundActivitiesStatusDomainPublisher *)v22;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __51__SBBackgroundActivityAssertionServiceManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(STBackgroundActivitiesStatusDomainPublisher *)self->_publisher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundActivityAssertionServiceManager;
  [(SBBackgroundActivityAssertionServiceManager *)&v3 dealloc];
}

- (void)_internalQueue_invalidateBackgroundActivityAssertions:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v27 = v4;
  v31 = (void *)[v4 mutableCopy];
  v34 = [MEMORY[0x1E4F1CA80] set];
  v35 = self;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = self->_assertionsByIdentifierByClientConnection;
  uint64_t v30 = [(NSMapTable *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v45;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v45 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * v5);
      uint64_t v33 = v5;
      uint64_t v6 = -[NSMapTable objectForKey:](v35->_assertionsByIdentifierByClientConnection, "objectForKey:");
      uint64_t v7 = [v31 count];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v9 = v31;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v15 = [v14 uniqueIdentifier];
            uint64_t v16 = [v6 objectForKey:v15];

            if (v16)
            {
              [v8 addObject:v14];
              [v6 removeObjectForKey:v15];
              v17 = [(SBBackgroundActivityAssertionServiceManager *)v35 _internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:v14];
              [v34 unionSet:v17];
              uint64_t v18 = [v8 count];

              if (v18 == v7)
              {

                goto LABEL_17;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      [v9 minusSet:v8];
      if ([v8 count])
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v20 = v8;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [*(id *)(*((void *)&v36 + 1) + 8 * j) uniqueIdentifier];
              [v19 addObject:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v22);
        }

        [(SBBackgroundActivityAssertionServiceManager *)v35 _invalidateAssertionsWithIdentifiers:v19 forClientConnection:v32];
      }
      uint64_t v26 = [v9 count];

      if (!v26) {
        break;
      }
      uint64_t v5 = v33 + 1;
      if (v33 + 1 == v30)
      {
        uint64_t v30 = [(NSMapTable *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v30) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)invalidateBackgroundActivityAssertions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertions___block_invoke;
    v6[3] = &unk_1E6AF5290;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(internalQueue, v6);
  }
}

uint64_t __86__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_invalidateBackgroundActivityAssertions:", *(void *)(a1 + 40));
}

- (void)invalidateBackgroundActivityAssertionsForAttributions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke;
    v6[3] = &unk_1E6AF5290;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(internalQueue, v6);
  }
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 72) dictionaryRepresentation];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2;
  id v8 = &unk_1E6AFC5E0;
  id v9 = *(id *)(a1 + 40);
  id v10 = v2;
  id v4 = v2;
  objc_msgSend(v3, "bs_each:", &v5);

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_invalidateBackgroundActivityAssertions:", v4, v5, v6, v7, v8);
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 setRepresentation];
  if ([v6 isSubsetOfSet:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else if ([v6 intersectsSet:*(void *)(a1 + 32)])
  {
    id v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2_cold_1(v5);
    }
  }
}

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke;
  v12[3] = &unk_1E6AFA860;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientMatchingBackgroundActivityIdentifier:", *(void *)(a1 + 40));
  if (v2)
  {
    objc_super v3 = +[SBLockScreenManager sharedInstance];
    int v4 = [v3 isUILocked];

    if (v4)
    {
      id v5 = objc_alloc_init(SBLockScreenUnlockRequest);
      [(SBLockScreenUnlockRequest *)v5 setName:@"Unlock to send tap to status bar coordinator."];
      [(SBLockScreenUnlockRequest *)v5 setSource:24];
      [(SBLockScreenUnlockRequest *)v5 setIntent:3];
      [(SBLockScreenUnlockRequest *)v5 setWindowScene:*(void *)(a1 + 48)];
      id v6 = +[SBLockScreenManager sharedInstance];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2;
      v10[3] = &unk_1E6AFC608;
      id v11 = v2;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 56);
      id v12 = v7;
      uint64_t v13 = v8;
      [v6 unlockWithRequest:v5 completion:v10];
    }
    else
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA6C08]) initWithBackgroundActivityIdentifier:*(void *)(a1 + 40)];
      [v2 acquireAssertionAndDeliverTapContextToClient:v9];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

void __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    objc_super v3 = (void *)a1[4];
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6C08]) initWithBackgroundActivityIdentifier:a1[5]];
    [v3 acquireAssertionAndDeliverTapContextToClient:v4];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_xpcListener == a3)
  {
    id v9 = [v6 valueForEntitlement:@"com.apple.springboard.statusbarstyleoverrides"];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && [v9 BOOLValue])
    {
      internalQueue = self->_internalQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke;
      v13[3] = &unk_1E6AF5290;
      v13[4] = self;
      id v14 = v7;
      dispatch_async(internalQueue, v13);

      BOOL v8 = 1;
    }
    else
    {
      id v11 = SBLogStatusBarish();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SBBackgroundActivityAssertionServiceManager listener:shouldAcceptNewConnection:](v11);
      }

      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  objc_super v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  int v4 = *(void **)(a1 + 40);
  id v5 = SBBackgroundActivityAssertionServerInterface();
  [v4 setExportedInterface:v5];

  [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  id v7 = SBSBackgroundActivityAssertionClientInterface();
  [v6 setRemoteObjectInterface:v7];

  objc_initWeak(&location, *(id *)(a1 + 40));
  BOOL v8 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v16[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v17, &location);
  [v8 setInterruptionHandler:v16];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_3;
  uint64_t v13 = &unk_1E6AFC630;
  id v9 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  objc_copyWeak(&v15, &location);
  [v9 setInvalidationHandler:&v10];
  objc_msgSend(*(id *)(a1 + 40), "resume", v10, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_4;
  v3[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:WeakRetained];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:forClientConnection:", v4, WeakRetained);
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:WeakRetained];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v11)
  {
    uint64_t v13 = v10;
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  uint64_t v19 = a1;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v21;
  do
  {
    for (uint64_t j = 0; j != v12; ++j)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
      id v17 = [v16 connection];

      if (v17 == WeakRetained)
      {
        id v18 = v16;

        uint64_t v13 = v18;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  }
  while (v12);

  if (v13)
  {
    [*(id *)(*(void *)(v19 + 32) + 80) removeObject:v13];
LABEL_20:
  }
}

- (void)activateBackgroundActivityAssertions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__SBBackgroundActivityAssertionServiceManager_activateBackgroundActivityAssertions_reply___block_invoke;
  v13[3] = &unk_1E6AF4DD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __90__SBBackgroundActivityAssertionServiceManager_activateBackgroundActivityAssertions_reply___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v39 = [MEMORY[0x1E4F1CA80] set];
  v2 = [MEMORY[0x1E4F1CA80] set];
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v47 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (v47)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    objc_super v3 = *(void **)(a1 + 40);
    if (v3) {
      [v3 auditToken];
    }
    int v44 = BSPIDForAuditToken();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = *(id *)(a1 + 48);
    uint64_t v4 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v57;
      uint64_t v37 = a1;
      long long v38 = v2;
      uint64_t v40 = *(void *)v57;
      do
      {
        uint64_t v7 = 0;
        uint64_t v42 = v5;
        do
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v56 + 1) + 8 * v7);
          id v9 = SBLogStatusBarish();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240450;
            int v65 = v44;
            __int16 v66 = 2114;
            v67 = v8;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to activate client (%{public}d) style override assertion: %{public}@", buf, 0x12u);
          }

          id v10 = [v8 uniqueIdentifier];
          id v11 = [v47 objectForKey:v10];

          if (!v11)
          {
            uint64_t v45 = v7;
            long long v46 = v10;
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            if ([v8 isExclusive])
            {
              uint64_t v13 = v12;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v14 = v47;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v63 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v53;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v53 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v19 = [v14 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * i)];
                    long long v20 = [v8 backgroundActivityIdentifiers];
                    long long v21 = [v19 backgroundActivityIdentifiers];
                    int v22 = [v20 intersectsSet:v21];

                    if (v22) {
                      [v13 addObject:v19];
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v63 count:16];
                }
                while (v16);
              }

              a1 = v37;
              v2 = v38;
              id v12 = v13;
LABEL_26:
              id v10 = v46;
              [v47 setObject:v8 forKey:v46];
              long long v25 = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_backgroundActivityIdentifiersAddedByAddingAssertionData:", v8);
              [v39 unionSet:v25];
              [v41 setObject:MEMORY[0x1E4F1CC38] forKey:v46];
              long long v26 = SBLogStatusBarish();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67240450;
                int v65 = v44;
                __int16 v66 = 2114;
                v67 = v8;
                _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Successfully activated client (%{public}d) SBS background activity assertion: %{public}@", buf, 0x12u);
              }
            }
            else
            {
              long long v23 = *(void **)(*(void *)(a1 + 32) + 56);
              long long v24 = [v8 backgroundActivityIdentifiers];
              LODWORD(v23) = [v23 intersectsSet:v24];

              if (!v23) {
                goto LABEL_26;
              }
              id v10 = v46;
              [v41 setObject:MEMORY[0x1E4F1CC28] forKey:v46];
              long long v25 = SBLogStatusBarish();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67240450;
                int v65 = v44;
                __int16 v66 = 2114;
                v67 = v8;
                _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Failed to activate client (%{public}d) SBS background activity assertion: %{public}@", buf, 0x12u);
              }
            }

            if ([v12 count])
            {
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              id v28 = v12;
              id v29 = v12;
              uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v62 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v49;
                do
                {
                  for (uint64_t j = 0; j != v31; ++j)
                  {
                    if (*(void *)v49 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    v34 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                    v35 = [v34 uniqueIdentifier];
                    [v47 removeObjectForKey:v35];
                    long long v36 = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:", v34);
                    [v2 unionSet:v36];
                    [v27 addObject:v35];
                  }
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v62 count:16];
                }
                while (v31);
              }

              [*(id *)(a1 + 32) _invalidateAssertionsWithIdentifiers:v27 forClientConnection:*(void *)(a1 + 40)];
              id v10 = v46;
              id v12 = v28;
            }

            uint64_t v6 = v40;
            uint64_t v5 = v42;
            uint64_t v7 = v45;
          }

          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SBBackgroundActivityAssertionServiceManager_deactivateBackgroundActivityAssertionsWithIdentifiers___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __101__SBBackgroundActivityAssertionServiceManager_deactivateBackgroundActivityAssertionsWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:forClientConnection:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setStatusString:(id)a3 forAssertionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__SBBackgroundActivityAssertionServiceManager_setStatusString_forAssertionWithIdentifier___block_invoke;
  v13[3] = &unk_1E6AF59B8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __90__SBBackgroundActivityAssertionServiceManager_setStatusString_forAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v7 = v2;
    objc_super v3 = [v2 objectForKey:*(void *)(a1 + 48)];
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 statusString];
      char v6 = [v5 isEqualToString:*(void *)(a1 + 56)];

      if ((v6 & 1) == 0)
      {
        [v4 setStatusString:*(void *)(a1 + 56)];
        [*(id *)(a1 + 32) _notifyDelegateAboutStatusStringChange];
      }
    }

    v2 = v7;
  }
}

- (id)statusStringForBackgroundActivityWithIdentifier:(id)a3 activeAttributions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__25;
  long long v21 = __Block_byref_object_dispose__25;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __114__SBBackgroundActivityAssertionServiceManager_statusStringForBackgroundActivityWithIdentifier_activeAttributions___block_invoke;
  v13[3] = &unk_1E6AFA860;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __114__SBBackgroundActivityAssertionServiceManager_statusStringForBackgroundActivityWithIdentifier_activeAttributions___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v3 = objc_msgSend(v2, "allObjects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [*(id *)(a1[4] + 72) objectForKey:v8];
        id v10 = [v9 setRepresentation];
        int v11 = [v10 intersectsSet:a1[6]];

        if (v11)
        {
          uint64_t v12 = [v8 statusString];
          uint64_t v13 = *(void *)(a1[7] + 8);
          id v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDelegateAboutStatusStringChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained assertionServiceDidChangeStatusStringsForAForegroundApp];
  }
}

- (NSString)description
{
  return (NSString *)[(SBBackgroundActivityAssertionServiceManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBBackgroundActivityAssertionServiceManager *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBBackgroundActivityAssertionServiceManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBBackgroundActivityAssertionServiceManager *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assertionsByIdentifierByClientConnection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E6AFC658;
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "bs_each:", v3);
}

void __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [a2 auditToken];
  }
  uint64_t v6 = BSPIDForAuditToken();
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 dictionaryRepresentation];
  id v9 = [v8 allValues];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"client (%d) assertions", v6);
  [v7 appendArraySection:v9 withName:v10 skipIfEmpty:0];
}

- (BOOL)_verifyCoordinatorEntitlementForBackgroundActivityIdentifiers:(id)a3 onConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 valueForEntitlement:@"com.apple.springboard.statusbarstyleoverrides.coordinator"];
  if (v6)
  {
    [MEMORY[0x1E4F42738] _statusBarStyleOverridesForArray:v6];
    id v7 = STUIBackgroundActivityIdentifiersForStyleOverrides();
    if ([v5 isSubsetOfSet:v7])
    {
      BOOL v8 = 1;
    }
    else if ([v5 count])
    {
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = [v7 count] != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_coordinatorConnectionsByBackgroundActivity;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "registeredBackgroundActivityIdentifiers", (void)v13);
        char v11 = BSEqualSets();

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_internalQueue_coordinatorClientMatchingBackgroundActivityIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_coordinatorConnectionsByBackgroundActivity;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "registeredBackgroundActivityIdentifiers", (void)v13);
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_internalQueue_coordinatorClientForConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_coordinatorConnectionsByBackgroundActivity;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "connection", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__SBBackgroundActivityAssertionServiceManager_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke;
  v13[3] = &unk_1E6AF4DD8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(internalQueue, v13);
}

void __96__SBBackgroundActivityAssertionServiceManager_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke(uint64_t a1)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _verifyCoordinatorEntitlementForBackgroundActivityIdentifiers:*(void *)(a1 + 40) onConnection:*(void *)(a1 + 48)])
  {
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForConnection:", *(void *)(a1 + 48));
    v2 = (SBBackgroundActivityCoordinatorClient *)objc_claimAutoreleasedReturnValue();
    id v3 = *(id *)(a1 + 40);
    id v4 = v3;
    if (v2)
    {
      id v5 = (void *)[v3 mutableCopy];
      id v6 = [(SBBackgroundActivityCoordinatorClient *)v2 registeredBackgroundActivityIdentifiers];
      [v5 minusSet:v6];

      id v4 = v5;
    }
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:", v4);

    if (v7)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4FA6EE0];
      v28[0] = *MEMORY[0x1E4F28568];
      v28[1] = v9;
      uint64_t v10 = *MEMORY[0x1E4FA6EE8];
      v29[0] = *MEMORY[0x1E4FA6EF8];
      v29[1] = v4;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      id v12 = [v8 errorWithDomain:v10 code:1 userInfo:v11];

LABEL_17:
      goto LABEL_18;
    }
    uint64_t v18 = [v4 count];
    if (v2)
    {
      if (!v18)
      {
        [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v2];
        goto LABEL_16;
      }
      [(SBBackgroundActivityCoordinatorClient *)v2 setRegisteredBackgroundActivityIdentifiers:v4];
      uint64_t v19 = SBLogStatusBarish();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_16:
        id v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v18)
      {
        id v12 = 0;
        goto LABEL_18;
      }
      v2 = [[SBBackgroundActivityCoordinatorClient alloc] initWithConnection:*(void *)(a1 + 48) andBackgroundActivityIdentifiers:v4];
      [*(id *)(*(void *)(a1 + 32) + 80) addObject:v2];
      uint64_t v19 = SBLogStatusBarish();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
    }
    uint64_t v20 = *(void *)(a1 + 48);
    long long v21 = STBackgroundActivityIdentifiersDescription();
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v20;
    __int16 v26 = 2114;
    id v27 = v21;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Succeeded in registering %@ for coordinator for background activity identifiers: %{public}@", buf, 0x16u);

    goto LABEL_14;
  }
  long long v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4FA6EE8];
  uint64_t v15 = *MEMORY[0x1E4FA6EF0];
  uint64_t v16 = *MEMORY[0x1E4FA6EE0];
  v22[0] = *MEMORY[0x1E4F28568];
  v22[1] = v16;
  uint64_t v17 = *(void *)(a1 + 40);
  v23[0] = v15;
  v23[1] = v17;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v12 = [v13 errorWithDomain:v14 code:0 userInfo:v4];
LABEL_18:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__SBBackgroundActivityAssertionServiceManager_unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __113__SBBackgroundActivityAssertionServiceManager_unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v2];
}

- (void)_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v8 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = [(NSMapTable *)self->_assertionsByIdentifierByClientConnection objectForKey:v7];
  uint64_t v10 = [v9 count];
  id v11 = SBLogStatusBarish();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[8] = 2114;
    *(void *)&buf[10] = v6;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to deactivate assertions (count: %d) %{public}@", buf, 0x12u);
  }

  if (v10)
  {
    memset(buf, 0, sizeof(buf));
    if (v7) {
      [v7 auditToken];
    }
    id v21 = v7;
    int v23 = BSPIDForAuditToken();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v9, "objectForKey:", v17, v21);
          if (v18)
          {
            uint64_t v19 = SBLogStatusBarish();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v28 = 67240450;
              int v29 = v23;
              __int16 v30 = 2114;
              uint64_t v31 = v18;
              _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Deactivating client (%{public}d) style override assertion: %{public}@", v28, 0x12u);
            }

            [v9 removeObjectForKey:v17];
            uint64_t v20 = [(SBBackgroundActivityAssertionServiceManager *)self _internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:v18];
            [v8 unionSet:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v14);
    }

    id v7 = v21;
    id v6 = v22;
  }
}

- (id)_internalQueue_backgroundActivityIdentifiersAddedByAddingAssertionData:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = SBAddBackgroundActivityAssertionDataByIdentifier(v4, self->_assertionsByBackgroundActivityIdentifier);
  int v6 = [v4 isExclusive];
  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 56;
  }
  [*(id *)((char *)&self->super.isa + v7) unionSet:v5];
  [(SBBackgroundActivityAssertionServiceManager *)self _internalQueue_publishAttributionsForAddingAssertionData:v4];

  return v5;
}

- (id)_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = SBRemoveBackgroundActivityAssertionDataByIdentifier(v4, self->_assertionsByBackgroundActivityIdentifier);
  int v6 = [v4 isExclusive];
  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 56;
  }
  [*(id *)((char *)&self->super.isa + v7) minusSet:v5];
  [(SBBackgroundActivityAssertionServiceManager *)self _internalQueue_publishAttributionsForRemovingAssertionData:v4];

  return v5;
}

- (void)_internalQueue_publishAttributionsForAddingAssertionData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = [v4 pid];
  int v6 = [MEMORY[0x1E4F4F7F8] processHandleForPID:v5];
  uint64_t v7 = [v6 auditToken];

  long long v28 = 0u;
  long long v29 = 0u;
  if (v7) {
    [v7 realToken];
  }
  else {
    STActivityAttributionUnsafeAuditTokenForPID();
  }
  v27[0] = v28;
  v27[1] = v29;
  id v8 = objc_msgSend(MEMORY[0x1E4FA9310], "attributionWithAuditToken:", v27, self);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v4 backgroundActivityIdentifiers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9328]), "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", *(void *)(*((void *)&v23 + 1) + 8 * i), v8, objc_msgSend(v4, "showsWhenForeground"));
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    uint64_t v16 = [*(id *)(v19 + 72) objectForKey:v4];
    if (!v16)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:1];
      [*(id *)(v19 + 72) setObject:v16 forKey:v4];
    }
    uint64_t v17 = *(void **)(v19 + 88);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForAddingAssertionData___block_invoke;
    v20[3] = &unk_1E6AFC680;
    id v21 = v9;
    id v22 = v16;
    id v18 = v16;
    [v17 updateVolatileData:v20 completion:0];
  }
}

void __104__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForAddingAssertionData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9, (void)v10);
        [v3 addAttribution:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_internalQueue_publishAttributionsForRemovingAssertionData:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = [(NSMapTable *)self->_attributionsByAssertion objectForKey:v4];
  uint64_t v6 = [v5 allObjects];

  if ([v6 count])
  {
    publisher = self->_publisher;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __106__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForRemovingAssertionData___block_invoke;
    v9[3] = &unk_1E6AFC6A8;
    long long v10 = v6;
    [(STBackgroundActivitiesStatusDomainPublisher *)publisher updateVolatileData:v9 completion:0];
    [(NSMapTable *)self->_attributionsByAssertion removeObjectForKey:v4];
    id v8 = v10;
  }
  else
  {
    id v8 = SBLogStatusBarish();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBBackgroundActivityAssertionServiceManager _internalQueue_publishAttributionsForRemovingAssertionData:]((uint64_t)v4, v8);
    }
  }
}

void __106__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForRemovingAssertionData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        objc_msgSend(v3, "removeAttribution:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v6) {
    [v6 auditToken];
  }
  int v8 = BSPIDForAuditToken();
  long long v9 = SBLogStatusBarish();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    int v17 = v8;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating client (%{public}d) style override assertions with identifiers: %{public}@", buf, 0x12u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke;
  v12[3] = &unk_1E6AFC6D0;
  id v13 = v7;
  id v10 = v7;
  long long v11 = [v10 remoteObjectProxyWithErrorHandler:v12];
  [v11 invalidateBackgroundActivityAssertionsWithIdentifiers:v5];
}

void __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogStatusBarish();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke_cold_1(v3);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSMapTable)assertionsByIdentifierByClientConnection
{
  return self->_assertionsByIdentifierByClientConnection;
}

- (void)setAssertionsByIdentifierByClientConnection:(id)a3
{
}

- (NSMapTable)assertionsByBackgroundActivityIdentifier
{
  return self->_assertionsByBackgroundActivityIdentifier;
}

- (void)setAssertionsByBackgroundActivityIdentifier:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSMutableSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
}

- (NSMutableSet)exclusiveBackgroundActivityIdentifiers
{
  return self->_exclusiveBackgroundActivityIdentifiers;
}

- (void)setExclusiveBackgroundActivityIdentifiers:(id)a3
{
}

- (SBBackgroundActivityAssertionServiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBBackgroundActivityAssertionServiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMapTable)attributionsByAssertion
{
  return self->_attributionsByAssertion;
}

- (void)setAttributionsByAssertion:(id)a3
{
}

- (NSMutableArray)coordinatorConnectionsByBackgroundActivity
{
  return self->_coordinatorConnectionsByBackgroundActivity;
}

- (void)setCoordinatorConnectionsByBackgroundActivity:(id)a3
{
}

- (STBackgroundActivitiesStatusDomainPublisher)publisher
{
  return self->_publisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_coordinatorConnectionsByBackgroundActivity, 0);
  objc_storeStrong((id *)&self->_attributionsByAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exclusiveBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assertionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifierByClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_runningUpdateTransactions, 0);
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 backgroundActivityIdentifiers];
  id v2 = STBackgroundActivityIdentifiersDescription();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v3, v4, "Unable to invalidate background activity assertion with identifiers due to partial match: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Rejecting connection for status bar style overrides because caller isn't entitled", v1, 2u);
}

- (void)_internalQueue_publishAttributionsForRemovingAssertionData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "No attributions to remove for assertion: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Error communicating with client: %{public}@", v4, v5, v6, v7, 2u);
}

@end