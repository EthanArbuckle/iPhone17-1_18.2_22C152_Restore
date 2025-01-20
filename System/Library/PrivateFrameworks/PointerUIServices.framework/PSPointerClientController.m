@interface PSPointerClientController
- (BOOL)isClientInteractionEnabled;
- (NSMutableDictionary)hoverRegionOverridingAssertions;
- (NSMutableDictionary)systemPointerInteractionContextIDs;
- (PSPointerClientController)init;
- (PSPointerClientControllerDelegate)delegate;
- (id)_accessQueue_acquireServiceKeepAliveAssertion;
- (id)_connectionQueue_launchingConnection;
- (id)acquireOverridingHoverRegionAssertionForDisplay:(id)a3;
- (id)acquireServiceKeepAliveAssertion;
- (id)persistentlyHidePointerAssertionForReason:(unint64_t)a3;
- (id)persistentlyShowPointerAssertionForReason:(unint64_t)a3;
- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayUUID:(id)a4;
- (int64_t)clientInteractionState;
- (int64_t)pointerVisibilityState;
- (void)_connectionQueue_handleLaunchingConnectionInterruption;
- (void)_connectionQueue_handleNonLaunchingConnectionActivation;
- (void)_connectionQueue_handleNonLaunchingConnectionInterruption;
- (void)_createContentMatchMoveSourcesForDisplay:(id)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)_createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4;
- (void)_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:(id)a3 matchMoveSources:(id)a4;
- (void)adjustedDecelerationTargetPointerPosition:(id)a3 velocity:(id)a4 inContextID:(id)a5 cursorRegionLookupRadius:(id)a6 cursorRegionLookupResolution:(id)a7 lookupConeAngle:(id)a8 completion:(id)a9;
- (void)autohidePointerForReason:(unint64_t)a3;
- (void)clientInteractionStateDidChange:(id)a3;
- (void)createContentMatchMoveSourcesForDisplayUUID:(id)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)createContentMatchMoveSourcesWithCount:(unint64_t)a3 completion:(id)a4;
- (void)createPointerPortalSourceCollectionForDisplayUUID:(id)a3 completion:(id)a4;
- (void)createPointerPortalSourceCollectionWithCompletion:(id)a3;
- (void)invalidate;
- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4;
- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4;
- (void)invalidatedPortalSourceCollections:(id)a3 matchMoveSources:(id)a4;
- (void)pointerVisibilityStateDidChange:(id)a3;
- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHoverRegionOverridingAssertions:(id)a3;
- (void)setSystemCursorInteractionContextID:(unsigned int)a3;
- (void)setSystemPointerInteractionContextIDs:(id)a3;
- (void)sharedInit;
@end

@implementation PSPointerClientController

- (PSPointerClientController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSPointerClientController;
  v2 = [(PSPointerClientController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PSPointerClientController *)v2 sharedInit];
  }
  return v3;
}

- (void)sharedInit
{
  if (dyld_program_sdk_at_least()) {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  }
  v3 = [MEMORY[0x1E4F1CA80] set];
  accessQueue_validPortalSourceCollections = self->_accessQueue_validPortalSourceCollections;
  self->_accessQueue_validPortalSourceCollections = v3;

  objc_super v5 = [MEMORY[0x1E4F1CA80] set];
  accessQueue_validMatchMoveSources = self->_accessQueue_validMatchMoveSources;
  self->_accessQueue_validMatchMoveSources = v5;

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  systemPointerInteractionContextIDs = self->_systemPointerInteractionContextIDs;
  self->_systemPointerInteractionContextIDs = v7;

  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  hoverRegionOverridingAssertions = self->_hoverRegionOverridingAssertions;
  self->_hoverRegionOverridingAssertions = v9;

  Serial = (OS_dispatch_queue *)BSDispatchQueueCreateSerial();
  accessQueue = self->_accessQueue;
  self->_accessQueue = Serial;

  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v14;

  self->_invalidationAndConfigurationLock._os_unfair_lock_opaque = 0;
  v16 = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_sharedInit__block_invoke;
  block[3] = &unk_1E5667A48;
  block[4] = self;
  dispatch_async(v16, block);
}

void __39__PSPointerClientController_sharedInit__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F50BB8];
  v3 = +[PSPointerClientDefaultServiceSpecification machName];
  v4 = +[PSPointerClientDefaultServiceSpecification serviceName];
  objc_super v5 = [v2 endpointForMachName:v3 service:v4 instance:0];

  v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_sharedInit__block_invoke_2;
  block[3] = &unk_1E5667900;
  block[4] = v7;
  id v15 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);
  v10 = +[PSPointerClientDefaultServiceSpecification interface];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PSPointerClientController_sharedInit__block_invoke_3;
  v12[3] = &unk_1E5667900;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __39__PSPointerClientController_sharedInit__block_invoke_2(uint64_t a1)
{
}

void __39__PSPointerClientController_sharedInit__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __39__PSPointerClientController_sharedInit__block_invoke_4;
  v10 = &unk_1E5667A20;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v12 = v4;
  [v2 configureConnection:&v7];
  objc_super v5 = PSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_18FB6C000, v5, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "activate", v7, v8, v9, v10);
}

void __39__PSPointerClientController_sharedInit__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[PSPointerClientDefaultServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 32)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PSPointerClientController_sharedInit__block_invoke_5;
  v9[3] = &unk_1E5667980;
  objc_copyWeak(&v10, &location);
  [v3 setActivationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PSPointerClientController_sharedInit__block_invoke_11;
  v7[3] = &unk_1E5667980;
  objc_copyWeak(&v8, &location);
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PSPointerClientController_sharedInit__block_invoke_12;
  v5[3] = &unk_1E56679F8;
  objc_copyWeak(&v6, &location);
  v5[4] = *(void *)(a1 + 40);
  [v3 setInvalidationHandler:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 64));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__PSPointerClientController_sharedInit__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 2) == v3 && !*((unsigned char *)WeakRetained + 69))
  {
    *((unsigned char *)WeakRetained + 69) = 1;
    objc_msgSend(WeakRetained, "_connectionQueue_handleNonLaunchingConnectionActivation");
  }
}

void __39__PSPointerClientController_sharedInit__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 2) == v3)
  {
    *((unsigned char *)WeakRetained + 69) = 0;
    objc_msgSend(WeakRetained, "_connectionQueue_handleNonLaunchingConnectionInterruption");
  }
}

void __39__PSPointerClientController_sharedInit__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[2] == v3)
  {
    WeakRetained[2] = 0;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy_;
    v13[4] = __Block_byref_object_dispose_;
    id v14 = 0;
    int v7 = v6[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PSPointerClientController_sharedInit__block_invoke_13;
    block[3] = &unk_1E56679A8;
    block[4] = *(void *)(a1 + 32);
    void block[5] = &buf;
    block[6] = v13;
    dispatch_sync(v7, block);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__PSPointerClientController_sharedInit__block_invoke_2_14;
    v8[3] = &unk_1E56679D0;
    uint64_t v9 = v6;
    p_long long buf = &buf;
    id v11 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __39__PSPointerClientController_sharedInit__block_invoke_13(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1[4] + 80) removeAllObjects];
  uint64_t v5 = [*(id *)(a1[4] + 88) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(a1[4] + 88);

  return [v8 removeAllObjects];
}

uint64_t __39__PSPointerClientController_sharedInit__block_invoke_2_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (void)invalidate
{
  p_invalidationAndConfigurationLock = &self->_invalidationAndConfigurationLock;
  os_unfair_lock_lock(&self->_invalidationAndConfigurationLock);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_invalidate__block_invoke;
  block[3] = &unk_1E56679A8;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v6;
  dispatch_sync(accessQueue, block);
  [(id)v13[5] invalidate];
  [(id)v7[5] invalidate];
  os_unfair_lock_unlock(p_invalidationAndConfigurationLock);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __39__PSPointerClientController_invalidate__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = a1[4];
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (void)createPointerPortalSourceCollectionWithCompletion:(id)a3
{
}

- (void)createPointerPortalSourceCollectionForDisplayUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[PSDisplay displayWithHardwareIdentifier:a3];
  [(PSPointerClientController *)self _createPointerPortalSourceCollectionForDisplay:v7 completion:v6];
}

- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke;
  v12[3] = &unk_1E5667AE8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(connectionQueue, v12);
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[69])
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
    uint64_t v4 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2;
    v8[3] = &unk_1E5667A98;
    id v9 = v4;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 48);
    [v3 invalidatePointerPortalSourceCollection:v9 completion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = PSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_cold_1(a1);
    }

    if (*(void *)(a1 + 48))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_20;
      block[3] = &unk_1E5667AC0;
      id v7 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_cold_1((uint64_t)a1, v3, v4);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (a1[4])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = *((void *)WeakRetained + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_17;
      block[3] = &unk_1E5667900;
      void block[4] = WeakRetained;
      id v11 = a1[4];
      dispatch_sync(v6, block);
    }
    goto LABEL_4;
  }
LABEL_5:
  if (a1[5])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_18;
    v7[3] = &unk_1E5667A70;
    id v9 = a1[5];
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_17(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createContentMatchMoveSourcesWithCount:(unint64_t)a3 completion:(id)a4
{
}

- (void)createContentMatchMoveSourcesForDisplayUUID:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = +[PSDisplay displayWithHardwareIdentifier:a3];
  [(PSPointerClientController *)self _createContentMatchMoveSourcesForDisplay:v9 count:a4 completion:v8];
}

- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke;
  v12[3] = &unk_1E5667AE8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(connectionQueue, v12);
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[69])
  {
    objc_initWeak(&location, v2);
    id v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2;
    v8[3] = &unk_1E5667B10;
    objc_copyWeak(&v11, &location);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 invalidateContentMatchMoveSources:v4 completion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = PSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_cold_1(a1);
    }

    if (*(void *)(a1 + 48))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_23;
      block[3] = &unk_1E5667AC0;
      id v7 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_cold_1(v3);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = *((void *)WeakRetained + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_21;
      block[3] = &unk_1E5667900;
      id v11 = a1[4];
      uint64_t v12 = v4;
      dispatch_sync(v6, block);
    }
  }

  if (a1[5])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_22;
    v7[3] = &unk_1E5667A70;
    id v9 = a1[5];
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_21(uint64_t a1)
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke;
  v12[3] = &unk_1E5667AE8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(connectionQueue, v12);
}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_2;
  block[3] = &unk_1E5667B38;
  void block[4] = v2;
  void block[5] = &v17;
  dispatch_sync(v3, block);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 69);
  if (*(unsigned char *)(v4 + 69) && (v18[3] || !*(void *)(a1 + 40)))
  {
    uint64_t v6 = [*(id *)(v4 + 16) remoteTarget];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_3;
    v14[3] = &unk_1E5667B60;
    uint64_t v7 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v6 setActiveHoverRegion:v7 transitionCompletion:v14];

    id v8 = &v15;
LABEL_9:

    goto LABEL_10;
  }
  long long v9 = PSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = PSPointerClientInteractionStateToString(v18[3]);
    *(_DWORD *)long long buf = 138543874;
    id v22 = v10;
    __int16 v23 = 1024;
    int v24 = v5;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_18FB6C000, v9, OS_LOG_TYPE_INFO, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", buf, 0x1Cu);
  }
  if (*(void *)(a1 + 48))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_24;
    v12[3] = &unk_1E5667AC0;
    id v8 = &v13;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v12);
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v17, 8);
}

uint64_t __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104);
  return result;
}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_4;
    v4[3] = &unk_1E5667A70;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PSPointerClientControllerErrorDomain" code:-1003 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)acquireServiceKeepAliveAssertion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PSPointerClientController_acquireServiceKeepAliveAssertion__block_invoke;
  v5[3] = &unk_1E5667B38;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __61__PSPointerClientController_acquireServiceKeepAliveAssertion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_acquireServiceKeepAliveAssertion");

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isClientInteractionEnabled
{
  return self->_clientInteractionState == 1;
}

- (void)autohidePointerForReason:(unint64_t)a3
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PSPointerClientController_autohidePointerForReason___block_invoke;
  block[3] = &unk_1E5667B88;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a2;
  dispatch_async(connectionQueue, block);
}

void __54__PSPointerClientController_autohidePointerForReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 69))
  {
    id v5 = [*(id *)(v2 + 16) remoteTarget];
    id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v5 autohidePointerForReason:v3];
  }
  else
  {
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__PSPointerClientController_autohidePointerForReason___block_invoke_cold_1(a1);
    }
  }
}

- (id)persistentlyHidePointerAssertionForReason:(unint64_t)a3
{
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke;
  v11[3] = &unk_1E5667BD8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  uint64_t v7 = (void *)[v6 initWithIdentifier:@"PSPointerHideAssertion" forReason:v5 invalidationBlock:v11];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_4;
  block[3] = &unk_1E5667BB0;
  void block[4] = self;
  void block[5] = a3;
  dispatch_sync(accessQueue, block);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v7;
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_2;
    v7[3] = &unk_1E5667BB0;
    id v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_sync(v4, v7);
  }
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v2 removeObject:v3];

  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = v7[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_3;
  v10[3] = &unk_1E5667900;
  id v11 = v7;
  id v12 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setPointerPersistentlyHiddenForReasons:*(void *)(a1 + 40)];
  }
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v2 addObject:v6];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_5;
  v11[3] = &unk_1E5667900;
  void v11[4] = v8;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setPointerPersistentlyHiddenForReasons:*(void *)(a1 + 40)];
  }
}

- (id)persistentlyShowPointerAssertionForReason:(unint64_t)a3
{
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke;
  v11[3] = &unk_1E5667BD8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  uint64_t v7 = (void *)[v6 initWithIdentifier:@"PSPointerShowAssertion" forReason:v5 invalidationBlock:v11];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_4;
  block[3] = &unk_1E5667BB0;
  void block[4] = self;
  void block[5] = a3;
  dispatch_sync(accessQueue, block);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v7;
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_2;
    v7[3] = &unk_1E5667BB0;
    id v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_sync(v4, v7);
  }
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v2 removeObject:v3];

  if (![*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = v7[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_3;
  v10[3] = &unk_1E5667900;
  id v11 = v7;
  id v12 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setPointerPersistentlyVisibleForReasons:*(void *)(a1 + 40)];
  }
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v2 addObject:v6];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_5;
  v11[3] = &unk_1E5667900;
  void v11[4] = v8;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setPointerPersistentlyVisibleForReasons:*(void *)(a1 + 40)];
  }
}

- (void)setSystemCursorInteractionContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  systemPointerInteractionContextIDAssertion = self->_systemPointerInteractionContextIDAssertion;
  if (systemPointerInteractionContextIDAssertion)
  {
    [(BSInvalidatable *)systemPointerInteractionContextIDAssertion invalidate];
    uint64_t v6 = self->_systemPointerInteractionContextIDAssertion;
    self->_systemPointerInteractionContextIDAssertion = 0;
  }
  self->_systemPointerInteractionContextIDAssertion = [(PSPointerClientController *)self setSystemPointerInteractionContextID:v3 displayUUID:0];

  MEMORY[0x1F41817F8]();
}

- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayUUID:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke;
  v11[3] = &unk_1E5667C50;
  id v12 = v6;
  id v13 = self;
  unsigned int v15 = a3;
  id v14 = &v16;
  id v8 = v6;
  dispatch_sync(accessQueue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PSDisplay displayWithHardwareIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKeyedSubscript:v2];
  if (v3)
  {
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v15 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)long long buf = 67109634;
      int v22 = v15;
      __int16 v23 = 2114;
      int v24 = v2;
      __int16 v25 = 1024;
      int v26 = [v3 unsignedIntValue];
      _os_log_error_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_ERROR, "Trying to set the systemPointerInteractionContextID to 0x%x for %{public}@ but we aleady have one: 0x%x ", buf, 0x18u);
    }
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v6 = [v2 description];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_43;
    v19[3] = &unk_1E5667C00;
    v19[4] = *(void *)(a1 + 40);
    id v7 = v2;
    id v20 = v7;
    uint64_t v8 = [v5 initWithIdentifier:@"PSSystemPointerInteraction" forReason:v6 invalidationBlock:v19];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 40) + 120) setObject:v11 forKeyedSubscript:v7];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(NSObject **)(v12 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_4;
    block[3] = &unk_1E5667C28;
    void block[4] = v12;
    id v17 = v11;
    id v18 = v7;
    id v14 = v11;
    dispatch_async(v13, block);
  }
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_43(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_2;
  block[3] = &unk_1E5667900;
  void block[4] = v2;
  id v9 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_3;
  v6[3] = &unk_1E5667900;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v5, v6);
}

uint64_t __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(a1 + 40)];
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setSystemPointerInteractionContextID:0 display:*(void *)(a1 + 40)];
  }
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_4(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setSystemPointerInteractionContextID:a1[5] display:a1[6]];
  }
}

- (id)acquireOverridingHoverRegionAssertionForDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke;
  block[3] = &unk_1E5667C78;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke(void *a1)
{
  uint64_t v2 = +[PSDisplay displayWithHardwareIdentifier:a1[4]];
  id v3 = [*(id *)(a1[5] + 128) objectForKeyedSubscript:v2];
  if (v3)
  {
    id v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v6 = [v2 description];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_47;
    v15[3] = &unk_1E5667C00;
    v15[4] = a1[5];
    id v7 = v2;
    id v16 = v7;
    uint64_t v8 = [v5 initWithIdentifier:@"PSHoverRegionOverride" forReason:v6 invalidationBlock:v15];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1[5] + 128) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:v7];
    uint64_t v11 = a1[5];
    uint64_t v12 = *(NSObject **)(v11 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_4;
    v13[3] = &unk_1E5667900;
    v13[4] = v11;
    id v14 = v7;
    dispatch_async(v12, v13);
  }
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_47(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_2;
  block[3] = &unk_1E5667900;
  void block[4] = v2;
  id v9 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_3;
  v6[3] = &unk_1E5667900;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v5, v6);
}

uint64_t __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:*(void *)(a1 + 40)];
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setOverridesHoverRegions:MEMORY[0x1E4F1CC28] display:*(void *)(a1 + 40)];
  }
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 69))
  {
    id v3 = [*(id *)(v1 + 16) remoteTarget];
    [v3 setOverridesHoverRegions:MEMORY[0x1E4F1CC38] display:*(void *)(a1 + 40)];
  }
}

- (void)clientInteractionStateDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 integerValue];
  id v5 = PSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PSPointerClientInteractionStateToString(v4);
    *(_DWORD *)long long buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_18FB6C000, v5, OS_LOG_TYPE_DEFAULT, "clientInteractionStateDidChange: %{public}@", buf, 0xCu);
  }
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke;
  v8[3] = &unk_1E5667BB0;
  void v8[4] = self;
  v8[5] = v4;
  dispatch_sync(accessQueue, v8);
}

void __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 104);
  if (v3 != v2)
  {
    *(void *)(v1 + 104) = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void *)(v4 + 104) == 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke_2;
    v6[3] = &unk_1E5667CA0;
    v6[4] = v4;
    char v7 = (v3 == 1) ^ v5;
    char v8 = 1;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  if (*(unsigned char *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pointerClientControllerClientInteractionEnabledDidChange:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 41) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pointerClientControllerClientInteractionStateDidChange:*(void *)(a1 + 32)];
  }

  return MEMORY[0x1F4181870]();
}

- (void)pointerVisibilityStateDidChange:(id)a3
{
  uint64_t v4 = [a3 integerValue];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke;
  v6[3] = &unk_1E5667BB0;
  v6[4] = self;
  void v6[5] = v4;
  dispatch_sync(accessQueue, v6);
}

void __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 112) != v2)
  {
    *(void *)(v1 + 112) = v2;
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = PSPointerVisibilityStateToString(*(void *)(a1 + 40));
      *(_DWORD *)long long buf = 138543362;
      char v8 = v5;
      _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_DEFAULT, "pointerVisibilityStateDidChange: %{public}@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke_52;
    block[3] = &unk_1E5667A48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained pointerClientControllerPointerVisibilityStateDidChange:*(void *)(a1 + 32)];
  }
}

- (void)adjustedDecelerationTargetPointerPosition:(id)a3 velocity:(id)a4 inContextID:(id)a5 cursorRegionLookupRadius:(id)a6 cursorRegionLookupResolution:(id)a7 lookupConeAngle:(id)a8 completion:(id)a9
{
  id v16 = a9;
  if (v16)
  {
    id v17 = a8;
    id v18 = a7;
    id v19 = a6;
    id v20 = a5;
    id v21 = a4;
    objc_msgSend(a3, "bs_CGPointValue");
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    objc_msgSend(v21, "bs_CGPointValue");
    uint64_t v27 = v26;
    uint64_t v29 = v28;

    int v30 = [v20 unsignedIntValue];
    [v19 doubleValue];
    uint64_t v32 = v31;

    [v18 doubleValue];
    uint64_t v34 = v33;

    [v17 doubleValue];
    uint64_t v36 = v35;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke;
    v37[3] = &unk_1E5667CF0;
    v37[4] = self;
    uint64_t v39 = v23;
    uint64_t v40 = v25;
    uint64_t v41 = v27;
    uint64_t v42 = v29;
    int v46 = v30;
    uint64_t v43 = v32;
    uint64_t v44 = v34;
    uint64_t v45 = v36;
    id v38 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v37);
  }
}

void __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(unsigned int *)(a1 + 104);
    double v4 = *(double *)(a1 + 80);
    double v5 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 96);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke_2;
    v13[3] = &unk_1E5667CC8;
    uint64_t v7 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    objc_msgSend(v2, "pointerClientControllerWillDecelerate:targetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:resultHandler:", v7, v3, v13, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), v4, v5, v6);
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v12 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v2, "pointerClientControllerWillDecelerate:targetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:", *(void *)(a1 + 32), &v12, *(unsigned int *)(a1 + 104), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", v12);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
}

void __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)invalidatedPortalSourceCollections:(id)a3 matchMoveSources:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v22 = [v6 count];
    __int16 v23 = 2048;
    uint64_t v24 = [v7 count];
    _os_log_impl(&dword_18FB6C000, v8, OS_LOG_TYPE_DEFAULT, "server invalidated %lu portalSourceCollections + %lu matchMoveSources", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke;
  block[3] = &unk_1E5667C28;
  id v10 = v6;
  id v18 = v10;
  id v19 = self;
  id v11 = v7;
  id v20 = v11;
  dispatch_sync(accessQueue, block);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke_2;
  v14[3] = &unk_1E5667C28;
  void v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 40) + 80) removeObject:*(void *)(*((void *)&v16 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "removeObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke;
  v12[3] = &unk_1E5667AE8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(connectionQueue, v12);
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2;
  block[3] = &unk_1E5667B38;
  void block[4] = v2;
  void block[5] = &v17;
  dispatch_sync(v3, block);
  uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
  int v5 = v4[69];
  if (v4[69] && v18[3])
  {
    objc_initWeak((id *)location, v4);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
    uint64_t v7 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3;
    v13[3] = &unk_1E5667D40;
    objc_copyWeak(&v15, (id *)location);
    id v14 = *(id *)(a1 + 48);
    [v6 createPointerPortalSourceCollectionForDisplay:v7 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v8 = PSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = PSPointerClientInteractionStateToString(v18[3]);
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v9;
      __int16 v22 = 1024;
      int v23 = v5;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      _os_log_error_impl(&dword_18FB6C000, v8, OS_LOG_TYPE_ERROR, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", location, 0x1Cu);
    }
    if (*(void *)(a1 + 48))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_64;
      v11[3] = &unk_1E5667AC0;
      id v12 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], v11);
    }
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104);
  return result;
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3_cold_1(v6);
    }
  }
  if (v5)
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      id v10 = WeakRetained[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_61;
      block[3] = &unk_1E5667900;
      void block[4] = WeakRetained;
      id v16 = v5;
      dispatch_sync(v10, block);
    }
  }
  if (*(void *)(a1 + 32))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2_62;
    v11[3] = &unk_1E5667D18;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_61(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2_62(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PSPointerClientControllerErrorDomain" code:-1003 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_createContentMatchMoveSourcesForDisplay:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke;
  block[3] = &unk_1E5667D90;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  unint64_t v17 = a4;
  SEL v18 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(connectionQueue, block);
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2;
  block[3] = &unk_1E5667B38;
  void block[4] = v2;
  void block[5] = &v18;
  dispatch_sync(v3, block);
  uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
  int v5 = v4[69];
  if (v4[69] && v19[3])
  {
    objc_initWeak((id *)location, v4);
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 56)];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3;
    v14[3] = &unk_1E5667D68;
    objc_copyWeak(&v16, (id *)location);
    id v15 = *(id *)(a1 + 48);
    [v6 createContentMatchMoveSourcesForDisplay:v7 countValue:v8 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v9 = PSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = PSPointerClientInteractionStateToString(v19[3]);
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v10;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      _os_log_error_impl(&dword_18FB6C000, v9, OS_LOG_TYPE_ERROR, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", location, 0x1Cu);
    }
    if (*(void *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_68;
      v12[3] = &unk_1E5667AC0;
      id v13 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104);
  return result;
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3_cold_1(v6);
    }
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_65;
    block[3] = &unk_1E5667900;
    void block[4] = WeakRetained;
    id v16 = v5;
    dispatch_sync(v10, block);
  }
  if (*(void *)(a1 + 32))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2_66;
    v11[3] = &unk_1E5667D18;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_65(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) addObjectsFromArray:*(void *)(a1 + 40)];
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2_66(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PSPointerClientControllerErrorDomain" code:-1003 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_accessQueue_acquireServiceKeepAliveAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F4F838]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke;
  v11[3] = &unk_1E5667DB8;
  objc_copyWeak(&v12, &location);
  uint64_t v4 = (void *)[v3 initWithIdentifier:@"PSPointerServiceKeepAliveAssertion" forReason:@"ClientRequested" invalidationBlock:v11];
  serviceKeepAliveAssertions = self->_serviceKeepAliveAssertions;
  if (!serviceKeepAliveAssertions)
  {
    id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v7 = self->_serviceKeepAliveAssertions;
    self->_serviceKeepAliveAssertions = v6;

    serviceKeepAliveAssertions = self->_serviceKeepAliveAssertions;
  }
  [(NSMutableArray *)serviceKeepAliveAssertions addObject:v4];
  if ([(NSMutableArray *)self->_serviceKeepAliveAssertions count] == 1)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_4;
    block[3] = &unk_1E5667A48;
    void block[4] = self;
    dispatch_async(connectionQueue, block);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v4;
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_2;
    v7[3] = &unk_1E5667900;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_sync(v6, v7);
  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 56) count])
    {
      id v2 = *(void **)(a1 + 32);
      id v3 = v2[4];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_3;
      block[3] = &unk_1E5667A48;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 68))
  {
    id v2 = [*(id *)(v1 + 24) remoteTarget];
    [v2 setWantsServiceKeepAlive:MEMORY[0x1E4F1CC28]];
  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_launchingConnection");
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 68))
  {
    *(unsigned char *)(v3 + 68) = 1;
    uint64_t v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      uint64_t v7 = v2;
      _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Activating Launching Connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [v2 activate];
  }
  id v5 = [v2 remoteTarget];
  [v5 setWantsServiceKeepAlive:MEMORY[0x1E4F1CC38]];
}

- (void)_connectionQueue_handleNonLaunchingConnectionActivation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  __int16 v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke;
  block[3] = &unk_1E5667DE0;
  void block[4] = self;
  void block[5] = &v24;
  void block[6] = &v18;
  void block[7] = &v12;
  dispatch_sync(accessQueue, block);
  uint64_t v4 = (void *)v19[5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_2;
  v10[3] = &unk_1E5667E08;
  void v10[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  id v5 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_3;
  v9[3] = &unk_1E5667E30;
  void v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  if ([(id)v25[5] count])
  {
    int v6 = [(BSServiceConnection *)self->_nonLaunchingConnection remoteTarget];
    [v6 setPointerPersistentlyHiddenForReasons:v25[5]];
  }
  if ([(NSCountedSet *)self->_persistentPointerShowReasons count])
  {
    uint64_t v7 = [(NSCountedSet *)self->_persistentPointerShowReasons allObjects];
    uint64_t v8 = [(BSServiceConnection *)self->_nonLaunchingConnection remoteTarget];
    [v8 setPointerPersistentlyVisibleForReasons:v7];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
}

uint64_t __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) allObjects];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 120) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 128) copy];

  return MEMORY[0x1F41817F8]();
}

void __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 remoteTarget];
  [v7 setSystemPointerInteractionContextID:v5 display:v6];
}

void __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id v4 = [v2 remoteTarget];
  [v4 setOverridesHoverRegions:MEMORY[0x1E4F1CC38] display:v3];
}

- (void)_connectionQueue_handleNonLaunchingConnectionInterruption
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke;
  block[3] = &unk_1E5667A48;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  [(BSServiceConnection *)self->_nonLaunchingConnection activate];
}

void __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 104);
  if (v3)
  {
    BOOL v4 = v3 == 1;
    *(void *)(v2 + 104) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    BOOL v4 = 0;
  }
  BOOL v5 = v3 != 0;
  id v6 = (void *)[*(id *)(v2 + 80) copy];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke_2;
  v10[3] = &unk_1E5667E58;
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  BOOL v13 = v4;
  BOOL v14 = v5;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  if (*(unsigned char *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pointerClientControllerClientInteractionEnabledDidChange:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 57) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pointerClientControllerClientInteractionStateDidChange:*(void *)(a1 + 32)];
  }

  return MEMORY[0x1F4181870]();
}

- (void)_connectionQueue_handleLaunchingConnectionInterruption
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PSPointerClientController__connectionQueue_handleLaunchingConnectionInterruption__block_invoke;
  v7[3] = &unk_1E5667B38;
  void v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v4 = [(PSPointerClientController *)self _connectionQueue_launchingConnection];
    if (!self->_hasActivatedLaunchingConnection)
    {
      self->_hasActivatedLaunchingConnection = 1;
      BOOL v5 = PSLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        BOOL v13 = v4;
        _os_log_impl(&dword_18FB6C000, v5, OS_LOG_TYPE_INFO, "Activating Launching Connection: %{public}@", buf, 0xCu);
      }

      [v4 activate];
    }
    id v6 = [v4 remoteTarget];
    [v6 setWantsServiceKeepAlive:MEMORY[0x1E4F1CC38]];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __83__PSPointerClientController__connectionQueue_handleLaunchingConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (id)_connectionQueue_launchingConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  launchingConnection = self->_launchingConnection;
  if (!launchingConnection)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F50BB8];
    BOOL v5 = +[PSPointerClientDefaultLaunchingServiceSpecification machName];
    id v6 = +[PSPointerClientDefaultLaunchingServiceSpecification serviceName];
    id v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    uint64_t v8 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
    id v9 = self->_launchingConnection;
    self->_launchingConnection = v8;

    uint64_t v10 = self->_launchingConnection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke;
    v12[3] = &unk_1E5667EA0;
    void v12[4] = self;
    [(BSServiceConnection *)v10 configureConnection:v12];

    launchingConnection = self->_launchingConnection;
  }

  return launchingConnection;
}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[PSPointerClientDefaultLaunchingServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  BOOL v5 = +[PSPointerClientDefaultLaunchingServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  [v3 setActivationHandler:&__block_literal_global_0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_79;
  v8[3] = &unk_1E5667980;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_80;
  v6[3] = &unk_1E5667980;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FB6C000, v3, OS_LOG_TYPE_INFO, "Launching Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Received interruption for launching connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 3) == v3)
  {
    *((unsigned char *)WeakRetained + 68) = 0;
    objc_msgSend(WeakRetained, "_connectionQueue_handleLaunchingConnectionInterruption");
  }
}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18FB6C000, v4, OS_LOG_TYPE_INFO, "Received invalidation for launching connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 3) == v3)
  {
    *((unsigned char *)WeakRetained + 68) = 0;
    *((void *)WeakRetained + 3) = 0;
  }
}

- (void)_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:(id)a3 matchMoveSources:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [(PSPointerClientController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 pointerClientController:self didInvalidatePortalSourceCollections:v6 matchMoveSources:v7];
  }
  else
  {
    uint64_t v29 = 0;
    int v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy_;
    uint64_t v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __133__PSPointerClientController__main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections_matchMoveSources___block_invoke;
    block[3] = &unk_1E56679A8;
    void block[4] = self;
    void block[5] = &v29;
    void block[6] = &v23;
    dispatch_sync(accessQueue, block);
    uint64_t v10 = PSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(id)v30[5] count];
      uint64_t v12 = [(id)v24[5] count];
      *(_DWORD *)long long buf = 134218240;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      _os_log_impl(&dword_18FB6C000, v10, OS_LOG_TYPE_DEFAULT, "delegate doesn't support individual source invalidation, invalidating %lu additional portalSourceCollections + %lu additional matchMoveSources", buf, 0x16u);
    }

    BOOL v13 = [(id)v24[5] allObjects];
    [(PSPointerClientController *)self invalidateContentMatchMoveSources:v13 completion:0];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = (id)v30[5];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          -[PSPointerClientController invalidatePointerPortalSourceCollection:completion:](self, "invalidatePointerPortalSourceCollection:completion:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), 0, (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v35 count:16];
      }
      while (v15);
    }

    if (objc_opt_respondsToSelector()) {
      [v8 pointerClientControllerDidInvalidateRemoteSources:self];
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }
}

uint64_t __133__PSPointerClientController__main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections_matchMoveSources___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1[4] + 80) removeAllObjects];
  uint64_t v5 = [*(id *)(a1[4] + 88) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(a1[4] + 88);

  return [v8 removeAllObjects];
}

- (PSPointerClientControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSPointerClientControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)clientInteractionState
{
  return self->_clientInteractionState;
}

- (int64_t)pointerVisibilityState
{
  return self->_pointerVisibilityState;
}

- (NSMutableDictionary)systemPointerInteractionContextIDs
{
  return self->_systemPointerInteractionContextIDs;
}

- (void)setSystemPointerInteractionContextIDs:(id)a3
{
}

- (NSMutableDictionary)hoverRegionOverridingAssertions
{
  return self->_hoverRegionOverridingAssertions;
}

- (void)setHoverRegionOverridingAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverRegionOverridingAssertions, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionContextIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue_validMatchMoveSources, 0);
  objc_storeStrong((id *)&self->_accessQueue_validPortalSourceCollections, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionContextIDAssertion, 0);
  objc_storeStrong((id *)&self->_serviceKeepAliveAssertions, 0);
  objc_storeStrong((id *)&self->_persistentPointerShowReasons, 0);
  objc_storeStrong((id *)&self->_persistentPointerHideReasons, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_launchingConnection, 0);
  objc_storeStrong((id *)&self->_nonLaunchingConnection, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18FB6C000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 code];
  _os_log_error_impl(&dword_18FB6C000, a3, OS_LOG_TYPE_ERROR, "Failed to invalidate pointer portal source collection %p error: %ld", (uint8_t *)&v5, 0x16u);
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18FB6C000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18FB6C000, v1, v2, "Failed to invalidate match move sources error: %ld", v3, v4, v5, v6, v7);
}

void __54__PSPointerClientController_autohidePointerForReason___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18FB6C000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18FB6C000, v0, OS_LOG_TYPE_ERROR, "Trying to acquire an overriding hover region assertion but we already have one for this display %{public}@, returning the existing assertion.", v1, 0xCu);
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18FB6C000, v1, v2, "Failed to create pointer portal source collection: %ld", v3, v4, v5, v6, v7);
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18FB6C000, v1, v2, "Failed to create match move source: %ld", v3, v4, v5, v6, v7);
}

@end