@interface MRMediaRemoteServiceClient
+ (id)sharedServiceClient;
- (MRMediaRemoteService)service;
- (MRMediaRemoteServiceClient)init;
- (MRNotificationClient)notificationClient;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)currentSessionPlayerPath;
- (NSArray)registeredOrigins;
- (OS_dispatch_queue)playbackQueueDispatchQueue;
- (OS_dispatch_queue)workerQueue;
- (id)addPlayerPathInvalidationHandler:(id)a3;
- (id)debugDescription;
- (void)_callInvalidationHandler:(uint64_t)a1;
- (void)_initializeConnectionWithCompletion:(void *)a1;
- (void)_invalidateConnection;
- (void)_onQueue_processPlayerPathInvalidationHandlersWithBlock:(uint64_t)a1;
- (void)_registerCallbacks;
- (void)_restoreConnection;
- (void)_restoreRestrictedCommandClientsState;
- (void)_resumeConnection;
- (void)addDiscoverySession:(id)a3;
- (void)addDistantEndpoint:(id)a3;
- (void)addDistantExternalDevice:(id)a3;
- (void)addEndpointObserver:(id)a3;
- (void)addNowPlayingController:(id)a3;
- (void)dealloc;
- (void)fetchPickableRoutesWithCategory:(id)a3 completion:(id)a4;
- (void)processPlayerPathInvalidationHandlersWithBlock:(id)a3;
- (void)processPlayerPathInvalidationHandlersWithInvalidOrigin:(id)a3;
- (void)removeDiscoverySession:(id)a3;
- (void)removeDistantEndpoint:(id)a3;
- (void)removeDistantExternalDevice:(id)a3;
- (void)removeEndpointObserver:(id)a3;
- (void)removeInvalidationHandler:(id)a3;
- (void)removeNowPlayingController:(id)a3;
- (void)setActivePlayerPath:(id)a3;
- (void)setCurrentSessionPlayerPath:(id)a3;
- (void)setPlaybackQueueDispatchQueue:(id)a3;
@end

@implementation MRMediaRemoteServiceClient

uint64_t __50__MRMediaRemoteServiceClient_setActivePlayerPath___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    *(void *)(v1 + 24) = [*(id *)(result + 40) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void __77__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithBlock___block_invoke(uint64_t a1)
{
}

- (MRNotificationClient)notificationClient
{
  return self->_notificationClient;
}

- (void)setActivePlayerPath:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MRMediaRemoteServiceClient_setActivePlayerPath___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_onQueue_processPlayerPathInvalidationHandlersWithBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__MRMediaRemoteServiceClient__onQueue_processPlayerPathInvalidationHandlersWithBlock___block_invoke;
    v5[3] = &unk_1E57D5388;
    v5[4] = a1;
    id v6 = v3;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (OS_dispatch_queue)workerQueue
{
  return (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
}

- (void)processPlayerPathInvalidationHandlersWithBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithBlock___block_invoke;
  v7[3] = &unk_1E57D03B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __86__MRMediaRemoteServiceClient__onQueue_processPlayerPathInvalidationHandlersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  if (!v4
    || ([v3 playerPath],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5),
        v5,
        v7 = v8,
        v6))
  {
    -[MRMediaRemoteServiceClient _callInvalidationHandler:](*(void *)(a1 + 32), v8);
    v7 = v8;
  }
}

void __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  if (*(id *)(a1 + 32) != v5) {
    [*(id *)(a1 + 40) setActivePlayerPath:v5];
  }
  [*(id *)(a1 + 40) processPlayerPathInvalidationHandlersWithBlock:&__block_literal_global_41];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (void)removeDistantEndpoint:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_weakEndpoints;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakEndpoints removeObject:v5];
  objc_sync_exit(v4);
}

- (id)addPlayerPathInvalidationHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _MRLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 playerPath];
    *(_DWORD *)buf = 134218242;
    id v15 = v4;
    __int16 v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Added PlayerPathInvalidationHandler %p for %{public}@", buf, 0x16u);
  }
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke;
  v12[3] = &unk_1E57D0790;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  dispatch_async(accessQueue, v12);
  v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __49__MRMediaRemoteServiceClient_sharedServiceClient__block_invoke()
{
  sharedServiceClient___sharedServiceClient = objc_alloc_init(MRMediaRemoteServiceClient);

  return MEMORY[0x1F41817F8]();
}

- (MRMediaRemoteServiceClient)init
{
  v33.receiver = self;
  v33.super_class = (Class)MRMediaRemoteServiceClient;
  id v2 = [(MRMediaRemoteServiceClient *)&v33 init];
  if (v2)
  {
    id v3 = MRMediaRemoteServiceCreate();
    id v4 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaRemote.MRMediaRemoteServiceClient.accessQueue", v5);
    id v7 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v6;

    id v8 = [[MRAVRoutingClientController alloc] initWithMediaRemoteService:*((void *)v2 + 13)];
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    id v10 = [[MRNotificationServiceClient alloc] initWithServiceClient:v2];
    v11 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v10;

    v12 = objc_alloc_init(MRNotificationClient);
    id v13 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v12;

    v14 = [[MRNowPlayingSessionServiceClient alloc] initWithService:v2];
    id v15 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v17 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v19 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v18;

    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v21 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v20;

    uint64_t v22 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v23 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v22;

    uint64_t v24 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v25 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.MediaRemote.PlaybackQueue.serialQueue", v26);
    [v2 setPlaybackQueueDispatchQueue:v27];

    qword_1EB46F630 = (uint64_t)v2;
    MRMediaRemoteServiceSetClientModule(*((void *)v2 + 13), (uint64_t)init___clientModule);
    -[MRMediaRemoteServiceClient _registerCallbacks]((void **)v2);
    objc_initWeak(&location, v2);
    v28 = (void *)*((void *)v2 + 13);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __34__MRMediaRemoteServiceClient_init__block_invoke;
    v30[3] = &unk_1E57D12D0;
    objc_copyWeak(&v31, &location);
    MRMediaRemoteServiceStart(v28, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return (MRMediaRemoteServiceClient *)v2;
}

- (void)_registerCallbacks
{
  if (val)
  {
    objc_initWeak(&location, val);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke;
    v16[3] = &unk_1E57D12D0;
    objc_copyWeak(&v17, &location);
    id v2 = (void *)MEMORY[0x1997190F0](v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_2;
    v14[3] = &unk_1E57D12D0;
    objc_copyWeak(&v15, &location);
    id v3 = (void *)MEMORY[0x1997190F0](v14);
    MRMediaRemoteServiceSetInvalidationHandler(val[13], v2);
    MRMediaRemoteServiceSetResumeHandler(val[13], v3);
    id v4 = [val[13] mrXPCConnection];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_3;
    v12 = &unk_1E57D52A0;
    objc_copyWeak(&v13, &location);
    [v4 addCustomXPCHandler:&v9 forKey:0x700000000000009];

    id v5 = objc_msgSend(val[13], "mrXPCConnection", v9, v10, v11, v12);
    [v5 addCustomXPCHandler:&__block_literal_global_26 forKey:0x20000000000002FLL];

    dispatch_queue_t v6 = [val[13] mrXPCConnection];
    [v6 addCustomXPCHandler:&__block_literal_global_30 forKey:0x400000000000007];

    id v7 = [val[13] mrXPCConnection];
    [v7 addCustomXPCHandler:&__block_literal_global_34 forKey:0x400000000000008];

    id v8 = [val[13] mrXPCConnection];
    [v8 addCustomXPCHandler:&__block_literal_global_38 forKey:0x400000000000009];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __34__MRMediaRemoteServiceClient_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _initializeConnectionWithCompletion:](WeakRetained, 0);
}

- (void)_initializeConnectionWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "MediaRemote server initializing", buf, 2u);
    }

    id v5 = [a1 activePlayerPath];
    dispatch_queue_t v6 = (void *)[v5 copy];

    id v7 = (void *)a1[13];
    id v8 = [a1 workerQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke;
    v10[3] = &unk_1E57D5310;
    id v11 = v6;
    v12 = a1;
    id v13 = v3;
    id v9 = v6;
    MRMediaRemoteServiceResolvePlayerPath(v7, 0, v8, v10);
  }
}

- (MRPlayerPath)activePlayerPath
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__23;
  id v8 = __Block_byref_object_dispose__23;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlayerPath *)v2;
}

- (void)setPlaybackQueueDispatchQueue:(id)a3
{
}

+ (id)sharedServiceClient
{
  if (sharedServiceClient___once != -1) {
    dispatch_once(&sharedServiceClient___once, &__block_literal_global_55);
  }
  id v2 = (void *)sharedServiceClient___sharedServiceClient;

  return v2;
}

- (MRMediaRemoteService)service
{
  return self->_service;
}

- (OS_dispatch_queue)playbackQueueDispatchQueue
{
  return self->_playbackQueueDispatchQueue;
}

uint64_t __46__MRMediaRemoteServiceClient_activePlayerPath__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)addDiscoverySession:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_weakDiscoverySessions;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakDiscoverySessions addObject:v5];
  objc_sync_exit(v4);
}

void __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = [*(id *)(a1 + 40) playerPath];
  uint64_t v6 = [v5 origin];

  if (v6
    && ([v6 isLocal] & 1) == 0
    && [*(id *)(a1 + 40) invalidateImmediatlyIfInvalid])
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v7 = [*(id *)(a1 + 40) playerPath];
    id v8 = [*(id *)(a1 + 32) workerQueue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke_2;
    v14 = &unk_1E57D5338;
    objc_copyWeak(&v17, &location);
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v16 = v10;
    MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, &v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", *(void *)(a1 + 40), v11, v12, v13, v14);
}

- (void)fetchPickableRoutesWithCategory:(id)a3 completion:(id)a4
{
}

- (void)dealloc
{
  MRMediaRemoteServiceDestroy(self->_service);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRMediaRemoteServiceClient;
  [(MRMediaRemoteServiceClient *)&v4 dealloc];
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _invalidateConnection](WeakRetained);
}

- (void)_invalidateConnection
{
  if (a1 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    id v2 = _MRLogForCategory(8uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "MediaRemote server disconnected", buf, 2u);
    }

    uint64_t v3 = a1[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MRMediaRemoteServiceClient__invalidateConnection__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = a1;
    dispatch_async(v3, block);
    objc_super v4 = [a1 notificationClient];
    [v4 dispatchNotification:@"kMRMediaRemoteAvailableOriginsDidChangeNotification" userInfo:0 object:0];

    id v5 = [a1 notificationClient];
    [v5 dispatchNotification:@"MRMediaRemoteServiceDidInvalidateNotification" userInfo:0 object:0];
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _resumeConnection](WeakRetained);
}

- (void)_resumeConnection
{
  if (a1 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    id v2 = _MRLogForCategory(8uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "MediaRemote server restarted", buf, 2u);
    }

    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke;
    v3[3] = &unk_1E57D1148;
    v3[4] = a1;
    -[MRMediaRemoteServiceClient _initializeConnectionWithCompletion:](a1, v3);
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained processPlayerPathInvalidationHandlersWithBlock:0];
    id WeakRetained = v2;
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_5;
  v8[3] = &unk_1E57D2738;
  id v9 = v2;
  id v3 = v2;
  objc_super v4 = (void *)MEMORY[0x1997190F0](v8);
  id v5 = MRCreateProtobufFromXPCMessage(v3);
  uint64_t v6 = [v5 playerPath];
  id v7 = [v5 request];
  MRServiceClientPlaybackSessionCallback((uint64_t)v6, (uint64_t)v7, v4);
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    connection = v6;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v8 = [[MRPlaybackSessionResponseMessage alloc] initWithPlaybackSession:a2];
      [(MRProtocolMessage *)v8 setError:a3];
      MRAddProtobufToXPCMessage(reply, v8);
      xpc_connection_send_message(connection, reply);
    }
    uint64_t v6 = connection;
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_7;
  v9[3] = &unk_1E57D52C8;
  id v10 = v2;
  id v3 = v2;
  objc_super v4 = (void *)MEMORY[0x1997190F0](v9);
  id v5 = MRCreatePlayerPathFromXPCMessage(v3);
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v3);
  id v7 = [v6 playbackSession];
  id v8 = [v6 request];
  MRServiceClientPlaybackSessionMigrateRequestCallback(v5, v7, v8, v4);
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v8 = [[MRPlaybackSessionMigrateResponseMessage alloc] initWithRequest:v9];
      [(MRProtocolMessage *)v8 setError:v5];
      MRAddProtobufToXPCMessage(reply, v8);
      xpc_connection_send_message(v6, reply);
    }
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = MRCreateProtobufFromXPCMessage(v2);
  objc_super v4 = [v3 playerPath];
  id v5 = [v3 request];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_9;
  v7[3] = &unk_1E57D1148;
  id v8 = v2;
  id v6 = v2;
  MRServiceClientPlaybackSessionMigrateBeginCallback(v4, v5, v7);
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_9(uint64_t a1, void *a2)
{
  id v6 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v5 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:v6];
      MRAddProtobufToXPCMessage(reply, v5);

      xpc_connection_send_message(v3, reply);
    }
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = MRCreateProtobufFromXPCMessage(v2);
  objc_super v4 = [v3 playerPath];
  id v5 = [v3 error];
  id v6 = [v3 request];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_11;
  v8[3] = &unk_1E57D1148;
  id v9 = v2;
  id v7 = v2;
  MRServiceClientPlaybackSessionMigrateEndCallback(v4, v5, v6, v8);
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_11(uint64_t a1, void *a2)
{
  id v6 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v5 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:v6];
      MRAddProtobufToXPCMessage(reply, v5);

      xpc_connection_send_message(v3, reply);
    }
  }
}

uint64_t __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke_2()
{
  return 1;
}

void __51__MRMediaRemoteServiceClient__invalidateConnection__block_invoke(uint64_t a1)
{
  id v2 = [MRPlayerPath alloc];
  id v3 = +[MROrigin localOrigin];
  id v8 = [(MRPlayerPath *)v2 initWithOrigin:v3 client:0 player:0];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = [(MRPlayerPath *)v8 copy];
    id v6 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v5;

    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
  }
  -[MRMediaRemoteServiceClient _onQueue_processPlayerPathInvalidationHandlersWithBlock:](v7, 0);
}

void __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _MRLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_cold_1((uint64_t)v3, v4);
    }

    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_44;
    block[3] = &unk_1E57D0518;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
  else
  {
    -[MRMediaRemoteServiceClient _restoreConnection](*(id **)(a1 + 32));
  }
}

- (void)_restoreConnection
{
  if (a1)
  {
    [a1[14] restoreNowPlayingClientState];
    id v2 = +[MRNowPlayingOriginClientManager sharedManager];
    [v2 clearActiveSystemEndpoints];

    id v3 = +[MRNowPlayingOriginClientManager sharedManager];
    [v3 restoreNowPlayingClientState];

    uint64_t v4 = +[MRGroupSessionRequestManager sharedManager];
    [v4 restoreState];

    -[MRMediaRemoteServiceClient _restoreRestrictedCommandClientsState]((uint64_t)a1);
    id v9 = [a1 currentSessionPlayerPath];
    if (v9)
    {
      dispatch_time_t v5 = MRCreateXPCMessage(0x30000000000002DuLL);
      MRAddPlayerPathToXPCMessage(v5, v9);
      id v6 = [a1 service];
      uint64_t v7 = [v6 mrXPCConnection];
      [v7 sendMessage:v5 queue:0 reply:0];
    }
    id v8 = [a1 notificationClient];
    [v8 dispatchNotification:@"kMRMediaRemoteServiceClientDidRestoreConnectionNotification" userInfo:0 object:0];
  }
}

uint64_t __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_44(uint64_t a1)
{
  return -[MRMediaRemoteServiceClient _resumeConnection](*(void *)(a1 + 32));
}

- (void)_restoreRestrictedCommandClientsState
{
  if (a1 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    id v1 = +[MRRestrictedCommandClientsManager sharedManager];
    [v1 republishStateIfNeeded];
  }
}

- (id)debugDescription
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __46__MRMediaRemoteServiceClient_debugDescription__block_invoke;
  v39 = &unk_1E57D0790;
  v40 = self;
  id v4 = v3;
  id v41 = v4;
  msv_dispatch_sync_on_queue();
  dispatch_time_t v5 = self->_weakEndpointObservers;
  objc_sync_enter(v5);
  id v6 = [(NSHashTable *)self->_weakEndpointObservers allObjects];
  if ([v6 count])
  {
    uint64_t v7 = MRCreateIndentedDebugDescriptionFromArray(v6);
    [v4 appendFormat:@"endpointObservers = %@\n", v7];
  }
  objc_sync_exit(v5);

  id v8 = self->_weakNowPlayingControllers;
  objc_sync_enter(v8);
  id v9 = [(NSHashTable *)self->_weakNowPlayingControllers allObjects];
  if ([(NSHashTable *)self->_weakNowPlayingControllers count])
  {
    id v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
    [v4 appendFormat:@"nowPlayingControllers = %@\n", v10];
  }
  objc_sync_exit(v8);

  uint64_t v11 = self->_weakDiscoverySessions;
  objc_sync_enter(v11);
  uint64_t v12 = [(NSHashTable *)self->_weakDiscoverySessions allObjects];
  objc_sync_exit(v11);

  if ([v12 count])
  {
    id v13 = objc_msgSend(v12, "mr_formattedDebugDescription");
    [v4 appendFormat:@"discoverySessions = %@\n", v13];
  }
  v14 = self->_weakEndpoints;
  objc_sync_enter(v14);
  id v15 = [(NSHashTable *)self->_weakEndpoints allObjects];
  objc_sync_exit(v14);

  uint64_t v16 = self->_weakExternalDevices;
  objc_sync_enter(v16);
  id v17 = [(NSHashTable *)self->_weakExternalDevices allObjects];
  uint64_t v18 = (void *)[v17 mutableCopy];

  objc_sync_exit(v16);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = [*(id *)(*((void *)&v32 + 1) + 8 * v22) externalDevice];
        [v18 removeObject:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v20);
  }

  if ([v19 count])
  {
    uint64_t v24 = objc_msgSend(v19, "mr_formattedDebugDescription");
    [v4 appendFormat:@"distantEndpoints = %@\n", v24];
  }
  if ([v18 count])
  {
    v25 = objc_msgSend(v18, "mr_formattedDebugDescription");
    [v4 appendFormat:@"remaining distantExternalDevices = %@\n", v25];
  }
  v26 = +[MRAVDistantEndpoint externalDeviceFactory];
  [v4 appendFormat:@"external device cache = %@\n", v26];

  dispatch_queue_t v27 = [(MRNotificationClient *)self->_notificationClient debugDescription];
  [v4 appendString:v27];

  v28 = +[MRNowPlayingOriginClientManager sharedManager];
  v29 = [v28 debugDescription];
  [v4 appendString:v29];

  id v30 = v4;
  return v30;
}

uint64_t __46__MRMediaRemoteServiceClient_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    [*(id *)(a1 + 40) appendFormat:@"activePlayerPath = %@\n", *(void *)(v2 + 24)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v2 + 40) count]) {
    [*(id *)(a1 + 40) appendFormat:@"playerPathInvalidationHandlers = %@\n", *(void *)(*(void *)(a1 + 32) + 40)];
  }
  return [*(id *)(a1 + 40) appendFormat:@"currentSessionPlayerPath = %@\n", *(void *)(*(void *)(a1 + 32) + 32)];
}

- (MRPlayerPath)currentSessionPlayerPath
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  id v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRMediaRemoteServiceClient_currentSessionPlayerPath__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

uint64_t __54__MRMediaRemoteServiceClient_currentSessionPlayerPath__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setCurrentSessionPlayerPath:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__MRMediaRemoteServiceClient_setCurrentSessionPlayerPath___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __58__MRMediaRemoteServiceClient_setCurrentSessionPlayerPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    dispatch_time_t v5 = *(void **)(a1 + 32);
    id v8 = WeakRetained;
    id v6 = [a2 origin];
    LOBYTE(v5) = [v5 isEqual:v6];

    if ((v5 & 1) == 0) {
      -[MRMediaRemoteServiceClient _callInvalidationHandler:](*(void *)(a1 + 40), v8);
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_callInvalidationHandler:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [NSString stringWithUTF8String:"-[MRMediaRemoteServiceClient _callInvalidationHandler:]"];
      [v10 handleFailureInFunction:v11, @"MRMediaRemoteServiceClient.m", 522, @"Invalid parameter not satisfying: %@", @"invalidationHandler" file lineNumber description];
    }
    dispatch_time_t v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 playerPath];
      *(_DWORD *)buf = 134218242;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Calling PlayerPathInvalidationHandler %p for %{public}@", buf, 0x16u);
    }
    uint64_t v7 = [v4 queue];
    if (v7)
    {
      id v8 = [v4 queue];
    }
    else
    {
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MRMediaRemoteServiceClient__callInvalidationHandler___block_invoke;
    block[3] = &unk_1E57D0518;
    id v13 = v4;
    dispatch_async(v8, block);
  }
}

- (void)removeInvalidationHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MRMediaRemoteServiceClient_removeInvalidationHandler___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __56__MRMediaRemoteServiceClient_removeInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(*(void *)(a1 + 40) + 40) containsObject:v2])
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 playerPath];
      int v5 = 134218242;
      id v6 = v2;
      __int16 v7 = 2114;
      id v8 = v4;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "Removing PlayerPathInvalidationHandler %p for %{public}@", (uint8_t *)&v5, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 40) removeObject:v2];
  }
}

- (void)processPlayerPathInvalidationHandlersWithInvalidOrigin:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithInvalidOrigin___block_invoke;
  v6[3] = &unk_1E57D5360;
  id v7 = v4;
  id v5 = v4;
  [(MRMediaRemoteServiceClient *)self processPlayerPathInvalidationHandlersWithBlock:v6];
}

uint64_t __85__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithInvalidOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 origin];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 origin];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __55__MRMediaRemoteServiceClient__callInvalidationHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callback];
  id v2 = [*(id *)(a1 + 32) playerPath];
  v3[2](v3, v2);
}

- (void)addEndpointObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakEndpointObservers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakEndpointObservers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeEndpointObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakEndpointObservers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakEndpointObservers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addNowPlayingController:(id)a3
{
  id v8 = a3;
  id v4 = self->_weakNowPlayingControllers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakNowPlayingControllers addObject:v8];
  if ((addNowPlayingController__captured & 1) == 0
    && [(NSHashTable *)self->_weakNowPlayingControllers count] == 100)
  {
    id v5 = +[MRUserSettings currentSettings];
    int v6 = [v5 excessiveNowPlayingControllersABC];

    if (v6)
    {
      uint64_t v7 = dispatch_get_global_queue(-2, 0);
      dispatch_async(v7, &__block_literal_global_92_0);

      addNowPlayingController__captured = 1;
    }
  }
  objc_sync_exit(v4);
}

uint64_t __54__MRMediaRemoteServiceClient_addNowPlayingController___block_invoke()
{
  return [MEMORY[0x1E4F77950] snapshotWithDomain:@"MediaRemote" type:@"NowPlayingController" subType:@"Power" context:@"Excessive Controllers" triggerThresholdValues:0 events:0 completion:0];
}

- (void)removeNowPlayingController:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakNowPlayingControllers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakNowPlayingControllers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDiscoverySession:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakDiscoverySessions;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakDiscoverySessions removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addDistantEndpoint:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakEndpoints;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakEndpoints addObject:v5];
  objc_sync_exit(v4);
}

- (void)addDistantExternalDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakExternalDevices;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakExternalDevices addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDistantExternalDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_weakExternalDevices;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_weakExternalDevices removeObject:v5];
  objc_sync_exit(v4);
}

- (NSArray)registeredOrigins
{
  return self->_registeredOrigins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueDispatchQueue, 0);
  objc_storeStrong((id *)&self->_registeredOrigins, 0);
  objc_storeStrong((id *)&self->_notificationClient, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_nowPlayingSessionService, 0);
  objc_storeStrong((id *)&self->_notificationService, 0);
  objc_storeStrong((id *)&self->_weakExternalDevices, 0);
  objc_storeStrong((id *)&self->_weakEndpoints, 0);
  objc_storeStrong((id *)&self->_weakDiscoverySessions, 0);
  objc_storeStrong((id *)&self->_weakNowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_weakEndpointObservers, 0);
  objc_storeStrong((id *)&self->_playerPathInvalidationHandlers, 0);
  objc_storeStrong((id *)&self->_currentSessionPlayerPath, 0);
  objc_storeStrong((id *)&self->_activePlayerPath, 0);
  objc_storeStrong((id *)&self->_routingClientController, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "Error %@ initializing Connection. Trying again...", (uint8_t *)&v2, 0xCu);
}

@end