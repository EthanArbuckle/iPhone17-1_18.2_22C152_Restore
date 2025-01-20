@interface WBTabGroupSyncAgentProxy
+ (WBTabGroupSyncAgentProxy)sharedProxy;
- (BOOL)_shouldAttemptToReconnect;
- (WBTabGroupSyncAgentProxy)init;
- (id)_remoteObjectProxy;
- (id)emptyChangeSetCompletionHandler;
- (id)emptyCompletionHandler;
- (void)_enumerateSyncObserversUsingBlock:(id)a3;
- (void)_setUpConnection;
- (void)_setUpConnectionIfNeeded;
- (void)_setUpSyncObserverIfNeeded;
- (void)acceptShareForURL:(id)a3 invitationTokenData:(id)a4 completionHandler:(id)a5;
- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3;
- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3;
- (void)addSyncObserver:(id)a3;
- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didAddTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)didChangeBackgroundImageInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4;
- (void)didChangeScopedFavoritesInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4;
- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4;
- (void)didNavigateInTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)didRemoveTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)movePresenceForParticipantToTabWithUUID:(id)a3;
- (void)participants:(id)a3 didJoinSharedTabGroupWithUUID:(id)a4;
- (void)participants:(id)a3 didLeaveSharedTabGroupWithUUID:(id)a4;
- (void)removeSyncObserver:(id)a3;
- (void)scheduleSyncIfNeeded;
- (void)sentinelDidDeallocateWithContext:(id)a3;
- (void)shareDidUpdateForTabGroupWithUUID:(id)a3;
- (void)userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation WBTabGroupSyncAgentProxy

- (void)addSyncObserver:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__0;
  v7[4] = __Block_byref_object_dispose__0;
  id v8 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke;
  v6[3] = &unk_2643D9BB8;
  v6[4] = self;
  v6[5] = v7;
  id v5 = v8;
  dispatch_async(syncObserverQueue, v6);
  _Block_object_dispose(v7, 8);
}

uint64_t __39__WBTabGroupSyncAgentProxy_sharedProxy__block_invoke()
{
  v0 = objc_alloc_init(WBTabGroupSyncAgentProxy);
  uint64_t v1 = sharedProxy_sharedProxy;
  sharedProxy_sharedProxy = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WBTabGroupSyncAgentProxy)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBTabGroupSyncAgentProxy;
  v2 = [(WBTabGroupSyncAgentProxy *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    syncObservers = v3->_syncObservers;
    v3->_syncObservers = (NSHashTable *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = [NSString stringWithFormat:@"com.apple.WebBookmarks.WBTabGroupSyncAgentProxy.%@.%p._syncObserverQueue", objc_opt_class(), v3];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v6);
    syncObserverQueue = v3->_syncObserverQueue;
    v3->_syncObserverQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x263F087C8] defaultCenter];
    [v10 addObserver:v3 selector:sel__syncAgentDidLaunch_ name:*MEMORY[0x263F66510] object:0];

    [(WBTabGroupSyncAgentProxy *)v3 _setUpConnectionIfNeeded];
    v11 = v3;
  }
  return v3;
}

void __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke(uint64_t a1)
{
  id v16 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  char v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "safari_isEmpty");
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v16];
  objc_msgSend(v16, "safari_setDeallocationSentinelForObserver:", *(void *)(a1 + 32));
  if (v4)
  {
    id v5 = *(os_unfair_lock_s **)(a1 + 32);
    v6 = v5 + 2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    objc_super v13 = __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_2;
    v14 = &unk_2643D9B48;
    v15 = v5;
    id v7 = v12;
    os_unfair_lock_lock(v6);
    v13((uint64_t)v7);

    os_unfair_lock_unlock(v6);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 8));
    if (v9)
    {
      v10 = [*(id *)(a1 + 32) _remoteObjectProxy];
      [v10 addSyncObserver:*(void *)(a1 + 32)];
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_cold_1(v11);
      }
    }
  }
  WBSReleaseOnMainQueueImpl();
}

- (void)scheduleSyncIfNeeded
{
  id v2 = [(WBTabGroupSyncAgentProxy *)self _remoteObjectProxy];
  [v2 scheduleSyncIfNeeded];
}

- (id)_remoteObjectProxy
{
  [(WBTabGroupSyncAgentProxy *)self _setUpConnectionIfNeeded];
  connection = self->_connection;
  return [(NSXPCConnection *)connection remoteObjectProxy];
}

- (void)_setUpConnectionIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    [(WBTabGroupSyncAgentProxy *)self _setUpConnection];
    [(WBTabGroupSyncAgentProxy *)self _setUpSyncObserverIfNeeded];
  }
  os_unfair_lock_unlock(p_lock);
}

void *__44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return (void *)[result _setUpConnection];
  }
  return result;
}

- (void)_setUpSyncObserverIfNeeded
{
  syncObserverQueue = self->_syncObserverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke;
  block[3] = &unk_2643D9B48;
  block[4] = self;
  dispatch_async(syncObserverQueue, block);
}

- (void)_setUpConnection
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  char v4 = (NSXPCConnection *)[v3 initWithMachServiceName:*MEMORY[0x263F66518] options:0];
  connection = self->_connection;
  self->_connection = v4;

  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC4AA20];
  WBSetupTabGroupSyncAgentProtocolInterface(v6);
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke;
  v17[3] = &unk_2643D9D58;
  objc_copyWeak(&v18, &location);
  id v7 = (void *)MEMORY[0x21D4A1230](v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2;
  v15[3] = &unk_2643D9D80;
  id v8 = v7;
  id v16 = v8;
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v15];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68;
  objc_super v13 = &unk_2643D9D80;
  id v9 = v8;
  id v14 = v9;
  [(NSXPCConnection *)self->_connection setInvalidationHandler:&v10];
  [(NSXPCConnection *)self->_connection resume];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

+ (WBTabGroupSyncAgentProxy)sharedProxy
{
  if (sharedProxy_onceToken != -1) {
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)sharedProxy_sharedProxy;
  return (WBTabGroupSyncAgentProxy *)v2;
}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    objc_super v13 = __Block_byref_object_copy__0;
    id v14 = __Block_byref_object_dispose__0;
    id v15 = 0;
    id v2 = *(os_unfair_lock_s **)(a1 + 32);
    id v3 = v2 + 2;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v6 = __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_75;
    id v7 = &unk_2643D9DE8;
    id v8 = v2;
    id v9 = &v10;
    char v4 = v5;
    os_unfair_lock_lock(v3);
    v6((uint64_t)v4);

    os_unfair_lock_unlock(v3);
    [(id)v11[5] addSyncObserver:*(void *)(a1 + 32)];
    _Block_object_dispose(&v10, 8);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBTabGroupSyncAgentProxy;
  [(WBTabGroupSyncAgentProxy *)&v3 dealloc];
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained + 2;
    char v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    objc_super v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(void *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    [(os_unfair_lock_s *)v4 _setUpSyncObserverIfNeeded];
    WeakRetained = v4;
  }
}

uint64_t __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2_cold_1(v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68_cold_1(v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)emptyCompletionHandler
{
  return &__block_literal_global_71;
}

- (id)emptyChangeSetCompletionHandler
{
  return &__block_literal_global_74;
}

- (BOOL)_shouldAttemptToReconnect
{
  os_unfair_lock_assert_owner(&self->_lock);
  firstReconnectionAttemptDate = self->_firstReconnectionAttemptDate;
  if (!firstReconnectionAttemptDate) {
    return 1;
  }
  [(NSDate *)firstReconnectionAttemptDate timeIntervalSinceNow];
  if (v4 < -20.0)
  {
    id v5 = self->_firstReconnectionAttemptDate;
    self->_firstReconnectionAttemptDate = 0;

    return 1;
  }
  return self->_numberOfReconnectionAttempts < 5;
}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_75(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 32;
  id v2 = *(id **)(a1 + 32);
  if (v2[2])
  {
    uint64_t v4 = [v2[2] remoteObjectProxy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    *(void *)(*(void *)(a1 + 32) + 48) = 0;
  }
  else
  {
    char v9 = [v2 _shouldAttemptToReconnect];
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Will attempt to add sync observer again after connection ended", (uint8_t *)&v20, 2u);
      }
      if (!*(void *)(*(void *)v3 + 40))
      {
        uint64_t v12 = [MEMORY[0x263EFF910] now];
        objc_super v13 = *(void **)(*(void *)v3 + 40);
        *(void *)(*(void *)v3 + 40) = v12;

        *(void *)(*(void *)v3 + 48) = 0;
      }
      id v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(*(void *)v3 + 40);
        uint64_t v16 = *(void *)(*(void *)v3 + 48);
        int v20 = 134218242;
        uint64_t v21 = v16;
        __int16 v22 = 2114;
        uint64_t v23 = v15;
        _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "Will attempt to reconnect after %ld retries since %{public}@", (uint8_t *)&v20, 0x16u);
      }
      ++*(void *)(*(void *)(a1 + 32) + 48);
      [*(id *)(a1 + 32) _setUpConnection];
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_75_cold_1(v3, v11);
    }
  }
}

- (void)_enumerateSyncObserversUsingBlock:(id)a3
{
  id v4 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke;
  v7[3] = &unk_2643D9E38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(syncObserverQueue, v7);
}

void __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  objc_super v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v2 = (void *)MEMORY[0x21D4A0FE0]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) setRepresentation];
  id v4 = (void *)v11[5];
  v11[5] = v3;

  uint64_t v5 = [(id)v11[5] count];
  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) _remoteObjectProxy];
    [v6 removeSyncObserver:*(void *)(a1 + 32)];
  }
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke_2;
    v7[3] = &unk_2643D9E10;
    char v9 = &v10;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  _Block_object_dispose(&v10, 8);
}

void __62__WBTabGroupSyncAgentProxy__enumerateSyncObserversUsingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
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
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)removeSyncObserver:(id)a3
{
  id v4 = a3;
  syncObserverQueue = self->_syncObserverQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WBTabGroupSyncAgentProxy_removeSyncObserver___block_invoke;
  v7[3] = &unk_2643D9CF8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(syncObserverQueue, v7);
}

void __47__WBTabGroupSyncAgentProxy_removeSyncObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_removeDeallocationSentinelForObserver:", *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 32)];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "safari_isEmpty"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(v2 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) _remoteObjectProxy];
      [v4 removeSyncObserver:*(void *)(a1 + 40)];
    }
  }
}

- (void)userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WBTabGroupSyncAgentProxy *)self _remoteObjectProxy];
  [v11 userDidAcceptTabGroupShareWithMetadata:v10 inProfileWithIdentifier:v9 completionHandler:v8];
}

- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WBTabGroupSyncAgentProxy *)self _setUpConnectionIfNeeded];
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__WBTabGroupSyncAgentProxy_beginSharingTabGroupWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_2643D9E60;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 beginSharingTabGroupWithUUID:v7 completionHandler:v9];
}

uint64_t __75__WBTabGroupSyncAgentProxy_beginSharingTabGroupWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)movePresenceForParticipantToTabWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabGroupSyncAgentProxy *)self _remoteObjectProxy];
  [v5 movePresenceForParticipantToTabWithUUID:v4];
}

- (void)acceptShareForURL:(id)a3 invitationTokenData:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WBTabGroupSyncAgentProxy *)self _remoteObjectProxy];
  [v11 acceptShareForURL:v10 invitationTokenData:v9 completionHandler:v8];
}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  syncObserverQueue = self->_syncObserverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__WBTabGroupSyncAgentProxy_sentinelDidDeallocateWithContext___block_invoke;
  block[3] = &unk_2643D9B48;
  block[4] = self;
  dispatch_async(syncObserverQueue, block);
}

void __61__WBTabGroupSyncAgentProxy_sentinelDidDeallocateWithContext___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "safari_isEmpty"))
  {
    id v2 = [*(id *)(a1 + 32) _remoteObjectProxy];
    [v2 removeSyncObserver:*(void *)(a1 + 32)];
  }
}

- (void)shareDidUpdateForTabGroupWithUUID:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__WBTabGroupSyncAgentProxy_shareDidUpdateForTabGroupWithUUID___block_invoke;
  v7[3] = &unk_2643D9E88;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v7];
}

void __62__WBTabGroupSyncAgentProxy_shareDidUpdateForTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 shareDidUpdateForTabGroupWithUUID:*(void *)(a1 + 32)];
  }
}

- (void)participants:(id)a3 didJoinSharedTabGroupWithUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__WBTabGroupSyncAgentProxy_participants_didJoinSharedTabGroupWithUUID___block_invoke;
  v11[3] = &unk_2643D9EB0;
  id v13 = v8;
  SEL v14 = a2;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v11];
}

void __71__WBTabGroupSyncAgentProxy_participants_didJoinSharedTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 participants:*(void *)(a1 + 32) didJoinSharedTabGroupWithUUID:*(void *)(a1 + 40)];
  }
}

- (void)participants:(id)a3 didLeaveSharedTabGroupWithUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__WBTabGroupSyncAgentProxy_participants_didLeaveSharedTabGroupWithUUID___block_invoke;
  v11[3] = &unk_2643D9EB0;
  id v13 = v8;
  SEL v14 = a2;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v11];
}

void __72__WBTabGroupSyncAgentProxy_participants_didLeaveSharedTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 participants:*(void *)(a1 + 32) didLeaveSharedTabGroupWithUUID:*(void *)(a1 + 40)];
  }
}

- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabGroupWithUUID___block_invoke;
  v7[3] = &unk_2643D9E88;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v7];
}

void __74__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 activeParticipantsDidUpdateInTabGroupWithUUID:*(void *)(a1 + 32)];
  }
}

- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabWithUUID___block_invoke;
  v7[3] = &unk_2643D9E88;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v7];
}

void __69__WBTabGroupSyncAgentProxy_activeParticipantsDidUpdateInTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 activeParticipantsDidUpdateInTabWithUUID:*(void *)(a1 + 32)];
  }
}

- (void)didAddTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__WBTabGroupSyncAgentProxy_didAddTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_2643D9ED8;
  id v23 = v14;
  SEL v24 = a2;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v19];
}

void __103__WBTabGroupSyncAgentProxy_didAddTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didAddTabWithUUID:a1[4] title:a1[5] inSharedTabGroupWithUUID:a1[6] byParticipantWithRecordID:a1[7]];
  }
}

- (void)didNavigateInTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __110__WBTabGroupSyncAgentProxy_didNavigateInTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_2643D9ED8;
  id v23 = v14;
  SEL v24 = a2;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v19];
}

void __110__WBTabGroupSyncAgentProxy_didNavigateInTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didNavigateInTabWithUUID:a1[4] title:a1[5] inSharedTabGroupWithUUID:a1[6] byParticipantWithRecordID:a1[7]];
  }
}

- (void)didRemoveTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__WBTabGroupSyncAgentProxy_didRemoveTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v19[3] = &unk_2643D9ED8;
  id v23 = v14;
  SEL v24 = a2;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v19];
}

void __106__WBTabGroupSyncAgentProxy_didRemoveTabWithUUID_title_inSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveTabWithUUID:a1[4] title:a1[5] inSharedTabGroupWithUUID:a1[6] byParticipantWithRecordID:a1[7]];
  }
}

- (void)didChangeScopedFavoritesInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__WBTabGroupSyncAgentProxy_didChangeScopedFavoritesInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v11[3] = &unk_2643D9EB0;
  id v13 = v8;
  SEL v14 = a2;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v11];
}

void __103__WBTabGroupSyncAgentProxy_didChangeScopedFavoritesInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didChangeScopedFavoritesInSharedTabGroupWithUUID:*(void *)(a1 + 32) byParticipantWithRecordID:*(void *)(a1 + 40)];
  }
}

- (void)didChangeBackgroundImageInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__WBTabGroupSyncAgentProxy_didChangeBackgroundImageInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke;
  v11[3] = &unk_2643D9EB0;
  id v13 = v8;
  SEL v14 = a2;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v11];
}

void __103__WBTabGroupSyncAgentProxy_didChangeBackgroundImageInSharedTabGroupWithUUID_byParticipantWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didChangeBackgroundImageInSharedTabGroupWithUUID:*(void *)(a1 + 32) byParticipantWithRecordID:*(void *)(a1 + 40)];
  }
}

- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__WBTabGroupSyncAgentProxy_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke;
  v11[3] = &unk_2643D9EB0;
  id v13 = v8;
  SEL v14 = a2;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(WBTabGroupSyncAgentProxy *)self _enumerateSyncObserversUsingBlock:v11];
}

void __93__WBTabGroupSyncAgentProxy_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didFetchRecentlyAcceptedSharedTabGroupWithUUID:*(void *)(a1 + 32) acceptedShareDate:*(void *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstReconnectionAttemptDate, 0);
  objc_storeStrong((id *)&self->_syncObservers, 0);
  objc_storeStrong((id *)&self->_syncObserverQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Connection to TabGroups sync agent was interrupted", v1, 2u);
}

void __44__WBTabGroupSyncAgentProxy__setUpConnection__block_invoke_68_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Connection to TabGroups sync agent was invalidated", v1, 2u);
}

void __54__WBTabGroupSyncAgentProxy__setUpSyncObserverIfNeeded__block_invoke_75_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_21C043000, a2, OS_LOG_TYPE_FAULT, "Failed to reconnect too many times to sync agent since %{public}@, stopping.", (uint8_t *)&v3, 0xCu);
}

void __44__WBTabGroupSyncAgentProxy_addSyncObserver___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_21C043000, log, OS_LOG_TYPE_FAULT, "Unable to establish connection to sync agent, giving up.", v1, 2u);
}

@end