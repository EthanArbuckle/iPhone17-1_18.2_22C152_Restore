@interface MRQHONowPlayingController
+ (id)localRouteController;
+ (id)proactiveEndpointController;
- (BOOL)registeredForEndpointChanges;
- (BOOL)registeredForNotifications;
- (BOOL)registeredForPlayerPathInvalidations;
- (BOOL)requestingQueue;
- (BOOL)updateLoadingEnabled;
- (MRAVEndpoint)endpoint;
- (MRAVEndpointObserver)endpointObserver;
- (MRArtwork)cachedNowPlayingArtwork;
- (MRClient)client;
- (MRNowPlayingPlayerResponse)response;
- (MRPlayer)player;
- (MRPlayerPath)resolvedPlayerPath;
- (MRPlayerPath)unresolvedPlayerPath;
- (MRQHONowPlayingController)initWithUID:(id)a3;
- (MRQHONowPlayingController)initWithUID:(id)a3 client:(id)a4 player:(id)a5;
- (MRQHONowPlayingControllerDelegate)delegate;
- (NSMutableArray)deferredContentItemsToMerge;
- (NSString)cachedNowPlayingArtworkIdentifier;
- (NSString)endpointObserverGroupUID;
- (NSString)uid;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4;
- (id)_onQueue_updateByMergingContentItemChanges:(id)a3;
- (id)playerPathInvalidationObserver;
- (void)_createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
- (void)_downloadContentItemArtwork:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_handleActiveSystemEndpointChangedNotification:(id)a3;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3;
- (void)_handlePlaybackStateChangedNotification:(id)a3;
- (void)_handleSupportedCommandsChangedNotification:(id)a3;
- (void)_loadNowPlayingStateForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
- (void)_loadNowPlayingStateForUID:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
- (void)_notifyDelegateOfError:(id)a3;
- (void)_notifyDelegateOfInvalidation;
- (void)_notifyDelegateOfNewResponse:(id)a3;
- (void)_notifyDelegateOfPlaybackQueueChangeFromOldQueue:(id)a3 toNewQueue:(id)a4;
- (void)_notifyDelegateOfPlaybackStateChangeFromOldState:(unsigned int)a3 toNewState:(unsigned int)a4;
- (void)_notifyDelegateOfSupportedCommandsChangeFromOldCommands:(id)a3 toNewCommands:(id)a4;
- (void)_notifyDelegateOfUpdatedArtwork:(id)a3;
- (void)_notifyDelegateOfUpdatedContentItems:(id)a3;
- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3;
- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3;
- (void)_onQueue_clearState;
- (void)_onQueue_requestAndUpdateArtworkForContentItems:(id)a3 forPlayerPath:(id)a4 withReason:(id)a5;
- (void)_onQueue_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6;
- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4;
- (void)_onQueue_updateByReplacingWithNewResponse:(id)a3;
- (void)_onQueue_updateWithNewDeviceLastPlayingDate:(id)a3;
- (void)_onQueue_updateWithNewPlaybackQueue:(id)a3;
- (void)_onQueue_updateWithNewPlaybackState:(unsigned int)a3;
- (void)_onQueue_updateWithNewPlayerLastPlayingDate:(id)a3;
- (void)_onQueue_updateWithNewSupportedCommands:(id)a3;
- (void)_registerForEndpointChangesIfNeeded;
- (void)_registerForPlayerPathInvalidationsIfNeeded;
- (void)_registerNotificationHandlersIfNeeded;
- (void)_reloadForCompleteInvalidation;
- (void)_reloadForPlayerPathInvalidation;
- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_resolvePlayerPath:(id)a3 completion:(id)a4;
- (void)_unregisterForEndpointChanges;
- (void)_unregisterForPlayerPathInvalidations;
- (void)_unregisterNotificationHandlers;
- (void)beginLoadingUpdates;
- (void)dealloc;
- (void)endLoadingUpdates;
- (void)setCachedNowPlayingArtwork:(id)a3;
- (void)setCachedNowPlayingArtworkIdentifier:(id)a3;
- (void)setDeferredContentItemsToMerge:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setEndpointObserver:(id)a3;
- (void)setEndpointObserverGroupUID:(id)a3;
- (void)setPlayerPathInvalidationObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredForEndpointChanges:(BOOL)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3;
- (void)setRequestingQueue:(BOOL)a3;
- (void)setResolvedPlayerPath:(id)a3;
- (void)setResponse:(id)a3;
- (void)setUnresolvedPlayerPath:(id)a3;
- (void)setUpdateLoadingEnabled:(BOOL)a3;
@end

@implementation MRQHONowPlayingController

+ (id)localRouteController
{
  v2 = [MRQHONowPlayingController alloc];
  v3 = (void *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity();
  v4 = [(MRQHONowPlayingController *)v2 initWithUID:v3];

  return v4;
}

+ (id)proactiveEndpointController
{
  v2 = [[MRQHONowPlayingController alloc] initWithUID:@"proactiveEndpoint"];

  return v2;
}

- (MRQHONowPlayingController)initWithUID:(id)a3
{
  return [(MRQHONowPlayingController *)self initWithUID:a3 client:0 player:0];
}

- (MRQHONowPlayingController)initWithUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MRQHONowPlayingController;
  v11 = [(MRQHONowPlayingController *)&v31 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uid = v11->_uid;
    v11->_uid = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    client = v11->_client;
    v11->_client = (MRClient *)v14;

    uint64_t v16 = [v10 copy];
    player = v11->_player;
    v11->_player = (MRPlayer *)v16;

    *(_DWORD *)&v11->_registeredForNotifications = 0;
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredContentItemsToMerge = v11->_deferredContentItemsToMerge;
    v11->_deferredContentItemsToMerge = v18;

    id v20 = [NSString stringWithFormat:@"com.apple.MediaRemote.MRQHONowPlayingController:%@|queue", v8];
    v21 = (const char *)[v20 UTF8String];
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v23;

    id v25 = [NSString stringWithFormat:@"com.apple.MediaRemote.MRQHONowPlayingController:%@|delegateQueue", v8];
    v26 = (const char *)[v25 UTF8String];
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
    delegateQueue = v11->_delegateQueue;
    v11->_delegateQueue = (OS_dispatch_queue *)v28;
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRQHONowPlayingController *)self uid];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Deallocating.", buf, 0xCu);
  }
  [(MRQHONowPlayingController *)self _unregisterForPlayerPathInvalidations];
  v5.receiver = self;
  v5.super_class = (Class)MRQHONowPlayingController;
  [(MRQHONowPlayingController *)&v5 dealloc];
}

- (void)beginLoadingUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(MRQHONowPlayingController *)self updateLoadingEnabled])
  {
    v3 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(MRQHONowPlayingController *)self uid];
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin loading updates.", buf, 0xCu);
    }
    objc_super v5 = [(MRQHONowPlayingController *)self uid];
    v6 = [(MRQHONowPlayingController *)self client];
    v7 = [(MRQHONowPlayingController *)self player];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__MRQHONowPlayingController_beginLoadingUpdates__block_invoke;
    v8[3] = &unk_1E57D2110;
    v8[4] = self;
    [(MRQHONowPlayingController *)self _loadNowPlayingStateForUID:v5 client:v6 player:v7 completion:v8];
  }
}

void __48__MRQHONowPlayingController_beginLoadingUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setUpdateLoadingEnabled:1];
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    [*(id *)(a1 + 32) _notifyDelegateOfError:v5];
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    [*(id *)(a1 + 32) _notifyDelegateOfNewResponse:v7];
  }
}

- (void)endLoadingUpdates
{
  v3 = [(MRQHONowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRQHONowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__MRQHONowPlayingController_endLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 11))
  {
    uint64_t v1 = result;
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(v1 + 32) uid];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> End loading updates.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(v1 + 32) _unregisterForEndpointChanges];
    [*(id *)(v1 + 32) _unregisterForPlayerPathInvalidations];
    [*(id *)(v1 + 32) _unregisterNotificationHandlers];
    objc_msgSend(*(id *)(v1 + 32), "_onQueue_clearState");
    [*(id *)(v1 + 32) setEndpointObserverGroupUID:0];
    return [*(id *)(v1 + 32) setUpdateLoadingEnabled:0];
  }
  return result;
}

- (void)_reloadForCompleteInvalidation
{
  v3 = [(MRQHONowPlayingController *)self uid];
  int v4 = [(MRQHONowPlayingController *)self client];
  id v5 = [(MRQHONowPlayingController *)self player];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MRQHONowPlayingController__reloadForCompleteInvalidation__block_invoke;
  v6[3] = &unk_1E57D2110;
  v6[4] = self;
  [(MRQHONowPlayingController *)self _loadNowPlayingStateForUID:v3 client:v4 player:v5 completion:v6];
}

void __59__MRQHONowPlayingController__reloadForCompleteInvalidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    [*(id *)(a1 + 32) _notifyDelegateOfError:v5];
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    [*(id *)(a1 + 32) _notifyDelegateOfNewResponse:v7];
  }
}

- (void)_reloadForPlayerPathInvalidation
{
  [(MRQHONowPlayingController *)self _unregisterForPlayerPathInvalidations];
  v3 = [(MRQHONowPlayingController *)self endpoint];
  int v4 = [(MRQHONowPlayingController *)self client];
  id v5 = [(MRQHONowPlayingController *)self player];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__MRQHONowPlayingController__reloadForPlayerPathInvalidation__block_invoke;
  v6[3] = &unk_1E57D2110;
  v6[4] = self;
  [(MRQHONowPlayingController *)self _loadNowPlayingStateForEndpoint:v3 client:v4 player:v5 completion:v6];
}

void __61__MRQHONowPlayingController__reloadForPlayerPathInvalidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    [*(id *)(a1 + 32) _notifyDelegateOfError:v5];
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    [*(id *)(a1 + 32) _notifyDelegateOfNewResponse:v7];
  }
}

- (void)_loadNowPlayingStateForUID:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(MRQHONowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke;
  block[3] = &unk_1E57D2160;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearState");
  v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin resolving endpoint.", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_16;
  v8[3] = &unk_1E57D2138;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v13 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_onQueue_retrieveEndpointForUID:completion:", v6, v8);
}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _MRLogForCategory(1uLL);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_16_cold_1(a1, v8);
    }

    [*(id *)(a1 + 40) _registerForEndpointChangesIfNeeded];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 40) uid];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Resolved to Endpoint: %@.", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) setEndpoint:v5];
    [*(id *)(a1 + 40) _loadNowPlayingStateForEndpoint:v5 client:*(void *)(a1 + 48) player:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

- (void)_loadNowPlayingStateForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(MRQHONowPlayingController *)self uid];
    *(_DWORD *)buf = 138412546;
    id v20 = v15;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin resolving player path for endpoint %@.", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke;
  v17[3] = &unk_1E57D21B0;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  [(MRQHONowPlayingController *)self _createPlayerPathForEndpoint:v10 client:v13 player:v12 completion:v17];
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18;
    v9[3] = &unk_1E57D2188;
    v9[4] = v8;
    id v11 = *(id *)(a1 + 40);
    id v10 = v5;
    [v8 _resolvePlayerPath:v10 completion:v9];
  }
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([v5 isResolved])
  {
    uint64_t v8 = (id *)(a1 + 32);
    [*(id *)(a1 + 32) setUnresolvedPlayerPath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setResolvedPlayerPath:v5];
    id v9 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*v8 uid];
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Resolved to player path: %@.", buf, 0x16u);
    }
    [*v8 _registerNotificationHandlersIfNeeded];
    [*v8 _registerForPlayerPathInvalidationsIfNeeded];
    [*v8 _registerForEndpointChangesIfNeeded];
    id v11 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*v8 uid];
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin loading data.", buf, 0xCu);
    }
    id v13 = *v8;
    id v22 = 0;
    uint64_t v14 = [v13 _loadNowPlayingStateForPlayerPath:v5 error:&v22];
    id v15 = v22;
    id v16 = _MRLogForCategory(1uLL);
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_1();
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = [*v8 uid];
      *(_DWORD *)buf = 138412546;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> End loading data. Response: %@.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v18 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_2(a1, v18);
    }

    [*(id *)(a1 + 32) setResponse:0];
    [*(id *)(a1 + 32) setUnresolvedPlayerPath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _registerForPlayerPathInvalidationsIfNeeded];
    [*(id *)(a1 + 32) _registerForEndpointChangesIfNeeded];
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:42];
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
  }
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  int v75 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__6;
  v70 = __Block_byref_object_dispose__6;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__6;
  v64 = __Block_byref_object_dispose__6;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__6;
  v58 = __Block_byref_object_dispose__6;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__6;
  v52 = __Block_byref_object_dispose__6;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  id v47 = 0;
  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MRQHONowPlayingController.callbackQueue", v8);

  dispatch_group_enter(v7);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
  v38[3] = &unk_1E57D21D8;
  v40 = &v54;
  v41 = &v48;
  id v10 = v7;
  v39 = v10;
  [(MRQHONowPlayingController *)self _requestSupportedCommandsForPlayerPath:v6 queue:v9 completion:v38];
  dispatch_group_enter(v10);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
  v35[3] = &unk_1E57D2200;
  v37 = &v72;
  id v11 = v10;
  v36 = v11;
  MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v35);
  dispatch_group_enter(v11);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
  v29[3] = &unk_1E57D2228;
  v33 = &v66;
  v34 = &v60;
  id v12 = v11;
  v30 = v12;
  objc_super v31 = self;
  id v13 = v6;
  id v32 = v13;
  [(MRQHONowPlayingController *)self _onQueue_requestPlaybackQueueForPlayerPath:v13 includeArtwork:1 queue:v9 completion:v29];
  dispatch_group_enter(v12);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  __int16 v25 = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
  id v26 = &unk_1E57D2250;
  dispatch_queue_t v28 = &v42;
  uint64_t v14 = v12;
  uint64_t v27 = v14;
  [(MRQHONowPlayingController *)self _requestPlayerLastPlayingDateForPlayerPath:v13 queue:v9 completion:&v23];
  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v14, v15))
  {
    if (a4)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v17 = (id)objc_msgSend(v16, "initWithMRError:", 26, v23, v24, v25, v26);
LABEL_8:
      uint64_t v19 = 0;
      *a4 = v17;
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  id v18 = (void *)v61[5];
  if (v18 || (id v18 = (void *)v49[5]) != 0)
  {
    if (a4)
    {
      id v17 = v18;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v19 = objc_alloc_init(MRNowPlayingPlayerResponse);
  __int16 v21 = [MRDestination alloc];
  id v22 = -[MRDestination initWithPlayerPath:](v21, "initWithPlayerPath:", v13, v23, v24, v25, v26);
  [(MRNowPlayingPlayerResponse *)v19 setDestination:v22];

  [(MRNowPlayingPlayerResponse *)v19 setPlaybackQueue:v67[5]];
  [(MRNowPlayingPlayerResponse *)v19 setPlaybackState:*((unsigned int *)v73 + 6)];
  [(MRNowPlayingPlayerResponse *)v19 setSupportedCommands:v55[5]];
  [(MRNowPlayingPlayerResponse *)v19 setDeviceLastPlayingDate:0];
  [(MRNowPlayingPlayerResponse *)v19 setPlayerLastPlayingDate:v43[5]];
LABEL_10:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  return v19;
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v13 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v14 = [v9 contentItems];
  dispatch_time_t v15 = (void *)[v13 initWithArray:v14 copyItems:1];

  id v16 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
  block[3] = &unk_1E57D1B18;
  id v17 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v20 = v15;
  id v21 = v17;
  id v18 = v15;
  dispatch_async(v16, block);
}

uint64_t __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", *(void *)(a1 + 40), *(void *)(a1 + 48), @"Initial load");
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_onQueue_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  [(MRQHONowPlayingController *)self setRequestingQueue:1];
  id v12 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__MRQHONowPlayingController__onQueue_requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke;
  v14[3] = &unk_1E57D2278;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v11, v10, v14);
}

void __104__MRQHONowPlayingController__onQueue_requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRequestingQueue:0];
  id v4 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier];
        id v12 = [v4 contentItemForIdentifier:v11];

        [v12 mergeFrom:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v13 = [*(id *)(a1 + 32) deferredContentItemsToMerge];
  [v13 removeAllObjects];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_onQueue_requestAndUpdateArtworkForContentItems:(id)a3 forPlayerPath:(id)a4 withReason:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v80 = a4;
  id v79 = a5;
  id v9 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(MRQHONowPlayingController *)self uid];
    *(_DWORD *)buf = 138412546;
    v101 = v11;
    __int16 v102 = 2112;
    id v103 = v79;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> _requestAndUpdateArtworkForContentItems because %@.", buf, 0x16u);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v8;
  uint64_t v85 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v96;
    v82 = self;
    do
    {
      for (uint64_t i = 0; i != v85; ++i)
      {
        if (*(void *)v96 != v84) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        long long v14 = [(MRNowPlayingPlayerResponse *)self->_response playbackQueue];
        long long v15 = [v13 identifier];
        long long v16 = [v14 contentItemForIdentifier:v15];
        long long v17 = (void *)[v16 copy];

        if (v17)
        {
          id v18 = [v17 metadata];
          if ([v18 artworkAvailable])
          {
            BOOL v86 = 1;
          }
          else
          {
            uint64_t v19 = [v17 metadata];
            id v20 = [v19 artworkURL];
            if (v20)
            {
              BOOL v86 = 1;
            }
            else
            {
              id v21 = [v17 metadata];
              id v22 = [v21 artworkIdentifier];
              BOOL v86 = v22 != 0;
            }
          }
          uint64_t v88 = i;

          uint64_t v23 = [v17 artwork];
          uint64_t v24 = [v23 imageData];

          __int16 v25 = [v13 metadata];
          id v26 = [v25 artworkIdentifier];
          if (v26)
          {
            uint64_t v27 = [v13 metadata];
            dispatch_queue_t v28 = [v27 artworkIdentifier];
            v29 = [v17 metadata];
            [v29 artworkIdentifier];
            objc_super v31 = v30 = v13;
            int v32 = [v28 isEqual:v31] ^ 1;

            id v13 = v30;
          }
          else
          {
            int v32 = 0;
          }

          v33 = [v13 metadata];
          v34 = [v33 artworkURL];
          if (v34)
          {
            v35 = [v13 metadata];
            [v35 artworkURL];
            v36 = v83 = v13;
            v37 = [v17 metadata];
            [v37 artworkURL];
            v38 = v24;
            int v39 = v32;
            v41 = v40 = v17;
            int v42 = [v36 isEqual:v41];

            long long v17 = v40;
            int v32 = v39;
            uint64_t v24 = v38;

            id v13 = v83;
          }
          else
          {
            int v42 = 0;
          }
          uint64_t i = v88;

          int v43 = v24 ? v32 : 1;
          self = v82;
          if ((v86 & (v43 | v42)) == 1)
          {
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke;
            v93[3] = &unk_1E57D22A0;
            v93[4] = v82;
            v87 = v17;
            id v44 = v17;
            id v94 = v44;
            v45 = (void (**)(void, void, void))MEMORY[0x1997190F0](v93);
            uint64_t v46 = [(MRQHONowPlayingController *)v82 cachedNowPlayingArtwork];
            if (!v46) {
              goto LABEL_28;
            }
            id v47 = (void *)v46;
            uint64_t v48 = [v44 metadata];
            id v49 = [v48 artworkIdentifier];
            id v50 = [(MRQHONowPlayingController *)v82 cachedNowPlayingArtworkIdentifier];
            if (v49 == v50)
            {
            }
            else
            {
              v51 = v50;
              char v52 = [v49 isEqual:v50];

              if ((v52 & 1) == 0)
              {
LABEL_28:
                id v53 = [v80 origin];
                if ([v53 isLocal])
                {

                  goto LABEL_34;
                }
                uint64_t v54 = [v13 metadata];
                v55 = [v54 artworkURL];

                if (v55)
                {
                  uint64_t v56 = _MRLogForCategory(1uLL);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    v57 = [(MRQHONowPlayingController *)v82 uid];
                    v58 = [v44 identifier];
                    id v59 = [v44 metadata];
                    [v59 artworkIdentifier];
                    v61 = uint64_t v60 = v13;
                    *(_DWORD *)buf = 138412802;
                    v101 = v57;
                    __int16 v102 = 2112;
                    id v103 = v58;
                    __int16 v104 = 2112;
                    v105 = v61;
                    _os_log_impl(&dword_194F3C000, v56, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> downloading artwork for content item %@, artwork %@.", buf, 0x20u);

                    id v13 = v60;
                    uint64_t i = v88;
                  }
                  uint64_t v62 = [(MRQHONowPlayingController *)v82 queue];
                  v91[0] = MEMORY[0x1E4F143A8];
                  v91[1] = 3221225472;
                  v91[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_36;
                  v91[3] = &unk_1E57D22C8;
                  v92 = v45;
                  [(MRQHONowPlayingController *)v82 _downloadContentItemArtwork:v13 queue:v62 completion:v91];

                  v63 = v92;
                }
                else
                {
LABEL_34:
                  v64 = _MRLogForCategory(1uLL);
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    id v65 = [(MRQHONowPlayingController *)v82 uid];
                    uint64_t v66 = [v44 identifier];
                    v67 = [v44 metadata];
                    [v67 artworkIdentifier];
                    v69 = uint64_t v68 = v13;
                    *(_DWORD *)buf = 138412802;
                    v101 = v65;
                    __int16 v102 = 2112;
                    id v103 = v66;
                    __int16 v104 = 2112;
                    v105 = v69;
                    _os_log_impl(&dword_194F3C000, v64, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> requesting artwork for content item %@, artwork %@.", buf, 0x20u);

                    id v13 = v68;
                    uint64_t i = v88;
                  }
                  v70 = [v13 identifier];
                  v99 = v70;
                  id v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
                  uint64_t v72 = [(MRQHONowPlayingController *)v82 queue];
                  v89[0] = MEMORY[0x1E4F143A8];
                  v89[1] = 3221225472;
                  v89[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_37;
                  v89[3] = &unk_1E57D22F0;
                  v73 = v45;
                  v89[4] = v13;
                  id v90 = v73;
                  [(MRQHONowPlayingController *)v82 _requestContentItemArtwork:v71 forPlayerPath:v80 queue:v72 completion:v89];

                  v63 = v90;
                }
LABEL_41:

                long long v17 = v87;
                goto LABEL_42;
              }
            }
            uint64_t v74 = _MRLogForCategory(1uLL);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              int v75 = [(MRQHONowPlayingController *)v82 uid];
              v76 = [v44 identifier];
              v77 = [v44 metadata];
              v78 = [v77 artworkIdentifier];
              *(_DWORD *)buf = 138412802;
              v101 = v75;
              __int16 v102 = 2112;
              id v103 = v76;
              __int16 v104 = 2112;
              v105 = v78;
              _os_log_impl(&dword_194F3C000, v74, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Artwork cache hit for content item %@, artwork %@.", buf, 0x20u);
            }
            v63 = [(MRQHONowPlayingController *)v82 cachedNowPlayingArtwork];
            ((void (**)(void, void *, void))v45)[2](v45, v63, 0);
            goto LABEL_41;
          }
        }
LABEL_42:
      }
      uint64_t v85 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v85);
  }
}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    id v8 = [*(id *)(a1 + 40) identifier];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 48) playbackQueue];
    id v10 = [v9 contentItemWithOffset:0];
    id v11 = [v10 identifier];
    int v12 = [v8 isEqualToString:v11];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 40) metadata];
      id v14 = [v13 artworkIdentifier];
      id v15 = [*(id *)(a1 + 32) cachedNowPlayingArtworkIdentifier];
      if (v14 == v15)
      {

LABEL_13:
        goto LABEL_14;
      }
      long long v16 = v15;
      char v17 = [v14 isEqual:v15];

      if ((v17 & 1) == 0)
      {
        id v18 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [*(id *)(a1 + 32) uid];
          id v20 = [*(id *)(a1 + 40) metadata];
          id v21 = [v20 artworkIdentifier];
          *(_DWORD *)buf = 138412546;
          int v32 = v19;
          __int16 v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated artwork cache with %@.", buf, 0x16u);
        }
        [*(id *)(a1 + 32) setCachedNowPlayingArtwork:v5];
        id v13 = [*(id *)(a1 + 40) metadata];
        id v14 = [v13 artworkIdentifier];
        [*(id *)(a1 + 32) setCachedNowPlayingArtworkIdentifier:v14];
        goto LABEL_13;
      }
    }
LABEL_14:
    id v22 = [MRContentItem alloc];
    uint64_t v23 = [*(id *)(a1 + 40) identifier];
    uint64_t v24 = [(MRContentItem *)v22 initWithIdentifier:v23];

    [(MRContentItem *)v24 setArtwork:v5];
    __int16 v25 = *(void **)(a1 + 32);
    v30 = v24;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    uint64_t v27 = objc_msgSend(v25, "_onQueue_updateByMergingContentItemChanges:", v26);

    if ([v27 count])
    {
      dispatch_queue_t v28 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [*(id *)(a1 + 32) uid];
        *(_DWORD *)buf = 138412546;
        int v32 = v29;
        __int16 v33 = 2112;
        v34 = v27;
        _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated artwork for content items %@.", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _notifyDelegateOfUpdatedArtwork:v27];
    }
  }
}

uint64_t __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 identifier];
  id v8 = [v7 contentItemForIdentifier:v10];

  id v9 = [v8 artwork];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v6);
}

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[MRPlaybackQueueRequest alloc] initWithIdentifiers:v12];

  [(MRPlaybackQueueRequest *)v13 setArtworkHeight:1200.0];
  [(MRPlaybackQueueRequest *)v13 setArtworkWidth:1200.0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__MRQHONowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2318;
  id v16 = v9;
  id v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);
}

uint64_t __87__MRQHONowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_downloadContentItemArtwork:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F18DC0] sharedSession];
  id v11 = [v7 metadata];
  id v12 = [v11 artworkURL];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke;
  v17[3] = &unk_1E57D2368;
  id v18 = v8;
  id v19 = v7;
  id v20 = v9;
  id v13 = v9;
  id v14 = v7;
  id v15 = v8;
  id v16 = [v10 dataTaskWithURL:v12 completionHandler:v17];
  [v16 resume];
}

void __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke_2;
  v12[3] = &unk_1E57D2340;
  id v13 = v7;
  id v8 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v8, v12);
}

void __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke_2(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *MEMORY[0x1E4F28A50];
    v12[0] = *(void *)(a1 + 32);
    uint64_t v3 = *MEMORY[0x1E4F28588];
    v11[0] = v2;
    v11[1] = v3;
    uint64_t v4 = NSString;
    id v5 = [*(id *)(a1 + 40) identifier];
    id v6 = [v4 stringWithFormat:@"Failed to download artwork for content item %@", v5];
    v12[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 userInfo:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [[MRArtwork alloc] initWithImageData:*(void *)(a1 + 48) height:0 width:0];
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__MRQHONowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E57D1380;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);
}

uint64_t __85__MRQHONowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[MRNowPlayingRequest alloc] initWithPlayerPath:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  void v12[3] = &unk_1E57D2390;
  id v13 = v7;
  id v11 = v7;
  [(MRNowPlayingRequest *)v10 requestLastPlayingDateOnQueue:v8 completion:v12];
}

void __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1((uint64_t)v4, v5);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_onQueue_updateByReplacingWithNewResponse:(id)a3
{
  id v4 = (MRNowPlayingPlayerResponse *)a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  response = self->_response;
  self->_response = v4;
}

- (void)_onQueue_updateWithNewPlaybackState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  response = self->_response;

  [(MRNowPlayingPlayerResponse *)response setPlaybackState:v3];
}

- (void)_onQueue_updateWithNewDeviceLastPlayingDate:(id)a3
{
  id v5 = a3;
  id v4 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  [(MRNowPlayingPlayerResponse *)self->_response setDeviceLastPlayingDate:v5];
}

- (void)_onQueue_updateWithNewPlayerLastPlayingDate:(id)a3
{
  id v5 = a3;
  id v4 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  [(MRNowPlayingPlayerResponse *)self->_response setPlayerLastPlayingDate:v5];
}

- (void)_onQueue_updateWithNewSupportedCommands:(id)a3
{
  id v5 = a3;
  id v4 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  [(MRNowPlayingPlayerResponse *)self->_response setSupportedCommands:v5];
}

- (void)_onQueue_updateWithNewPlaybackQueue:(id)a3
{
  id v5 = a3;
  id v4 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  [(MRNowPlayingPlayerResponse *)self->_response setPlaybackQueue:v5];
}

- (id)_onQueue_updateByMergingContentItemChanges:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    v41 = self;
    uint64_t v42 = *(void *)v49;
    do
    {
      uint64_t v9 = 0;
      uint64_t v43 = v7;
      do
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
        id v11 = [(MRNowPlayingPlayerResponse *)self->_response playbackQueue];
        id v12 = [v10 identifier];
        id v13 = [v11 contentItemForIdentifier:v12];

        if (v13)
        {
          id v14 = [v10 metadata];
          if ([v14 artworkAvailable])
          {
            id v15 = [v13 metadata];
            char v16 = [v15 artworkAvailable];

            if ((v16 & 1) == 0)
            {
LABEL_17:
              [v40 addObject:v10];
              goto LABEL_20;
            }
          }
          else
          {
          }
          char v17 = [v10 metadata];
          uint64_t v18 = [v17 artworkURL];
          if (v18)
          {
            id v19 = (void *)v18;
            id v20 = [v10 metadata];
            id v21 = [v20 artworkURL];
            id v22 = [v13 metadata];
            uint64_t v23 = [v22 artworkURL];
            char v24 = [v21 isEqual:v23];

            uint64_t v7 = v43;
            uint64_t v8 = v42;

            if ((v24 & 1) == 0)
            {
              [v40 addObject:v10];
              goto LABEL_19;
            }
          }
          else
          {
          }
          __int16 v25 = [v10 metadata];
          uint64_t v26 = [v25 artworkIdentifier];
          if (v26)
          {
            uint64_t v27 = (void *)v26;
            dispatch_queue_t v28 = [v10 metadata];
            v29 = [v28 artworkIdentifier];
            v30 = [v13 metadata];
            objc_super v31 = [v30 artworkIdentifier];
            char v32 = [v29 isEqual:v31];

            uint64_t v7 = v43;
            uint64_t v8 = v42;

            self = v41;
            if ((v32 & 1) == 0) {
              goto LABEL_17;
            }
LABEL_20:
            [v13 mergeFrom:v10];
            __int16 v33 = [v13 identifier];
            [v45 addObject:v33];

            goto LABEL_21;
          }

LABEL_19:
          self = v41;
          goto LABEL_20;
        }
LABEL_21:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v7);
  }

  if ([v40 count])
  {
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v40 copyItems:1];
    uint64_t v35 = [(MRQHONowPlayingController *)self queue];
    v36 = self;
    v37 = v35;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MRQHONowPlayingController__onQueue_updateByMergingContentItemChanges___block_invoke;
    block[3] = &unk_1E57D0790;
    block[4] = v36;
    id v47 = v34;
    id v38 = v34;
    dispatch_async(v37, block);
  }

  return v45;
}

void __72__MRQHONowPlayingController__onQueue_updateByMergingContentItemChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 resolvedPlayerPath];
  objc_msgSend(v1, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v2, v3, @"Artwork added on update");
}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([v6 isEqualToString:@"proactiveEndpoint"])
  {
    uint64_t v9 = [(MRQHONowPlayingController *)self queue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v22[3] = &unk_1E57D23B8;
    uint64_t v23 = (MRAVLightweightReconnaissanceSession *)v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v9, v22, 7.0);

    id v10 = v23;
  }
  else
  {
    id v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    id v11 = [(MRQHONowPlayingController *)self endpointObserverGroupUID];

    if (v11)
    {
      id v12 = [(MRQHONowPlayingController *)self endpointObserverGroupUID];
      id v13 = [(MRQHONowPlayingController *)self queue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
      v19[3] = &unk_1E57D23E0;
      id v14 = (id *)&v20;
      id v20 = v10;
      id v15 = &v21;
      id v21 = v7;
      [(MRAVLightweightReconnaissanceSession *)v10 searchEndpointsForGroupUID:v12 timeout:@"MRQHONowPlayingController-search" reason:v13 queue:v19 completion:7.0];
    }
    else
    {
      id v12 = [(MRQHONowPlayingController *)self queue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
      v16[3] = &unk_1E57D23E0;
      id v14 = (id *)&v17;
      char v17 = v10;
      id v15 = &v18;
      id v18 = v7;
      [(MRAVLightweightReconnaissanceSession *)v10 searchEndpointsForOutputDeviceUID:v6 timeout:@"MRQHONowPlayingController-search" reason:v12 queue:v16 completion:7.0];
    }
  }
}

uint64_t __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

void __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)_createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = NSString;
  id v15 = [(MRQHONowPlayingController *)self uid];
  char v16 = [v14 stringWithFormat:@"MRQHONowPlayingController-%@", v15];

  uint64_t v27 = @"MREndpointConnectionReasonUserInfoKey";
  v28[0] = v16;
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke;
  v22[3] = &unk_1E57D1120;
  id v25 = v12;
  id v26 = v13;
  void v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v13;
  [v20 connectToExternalDeviceWithUserInfo:v17 completion:v22];
}

void __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E57D2408;
  id v7 = v3;
  id v11 = a1[8];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = [MRPlayerPath alloc];
    id v4 = [*(id *)(a1 + 40) origin];
    id v5 = [(MRPlayerPath *)v3 initWithOrigin:v4 client:*(void *)(a1 + 48) player:*(void *)(a1 + 56)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_resolvePlayerPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MRQHONowPlayingController *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__MRQHONowPlayingController__resolvePlayerPath_completion___block_invoke;
  v10[3] = &unk_1E57D2318;
  id v11 = v6;
  id v9 = v6;
  MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, v10);
}

uint64_t __59__MRQHONowPlayingController__resolvePlayerPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueue_clearState
{
  id v3 = [(MRQHONowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MRQHONowPlayingController *)self _unregisterForPlayerPathInvalidations];
  [(MRQHONowPlayingController *)self _unregisterForEndpointChanges];
  [(MRQHONowPlayingController *)self setEndpoint:0];
  [(MRQHONowPlayingController *)self setUnresolvedPlayerPath:0];
  [(MRQHONowPlayingController *)self setResolvedPlayerPath:0];
  id v4 = [(MRQHONowPlayingController *)self deferredContentItemsToMerge];
  [v4 removeAllObjects];
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__MRQHONowPlayingController__notifyDelegateOfNewResponse___block_invoke;
    v8[3] = &unk_1E57D0790;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __58__MRQHONowPlayingController__notifyDelegateOfNewResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didLoadResponse:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfPlaybackStateChangeFromOldState:(unsigned int)a3 toNewState:(unsigned int)a4
{
  id v7 = [(MRQHONowPlayingController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke;
    block[3] = &unk_1E57D2098;
    void block[4] = self;
    unsigned int v15 = a3;
    unsigned int v16 = a4;
    dispatch_async(v9, block);
  }
  id v10 = [(MRQHONowPlayingController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(MRQHONowPlayingController *)self delegateQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke_2;
    v13[3] = &unk_1E57D0518;
    v13[4] = self;
    dispatch_async(v12, v13);
  }
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) playbackStateDidChangeFrom:*(unsigned int *)(a1 + 40) to:*(unsigned int *)(a1 + 44)];
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfPlaybackQueueChangeFromOldQueue:(id)a3 toNewQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke;
    block[3] = &unk_1E57D1B18;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  char v11 = [(MRQHONowPlayingController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(MRQHONowPlayingController *)self delegateQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke_2;
    v14[3] = &unk_1E57D0518;
    v14[4] = self;
    dispatch_async(v13, v14);
  }
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) playbackQueueDidChangeFrom:*(void *)(a1 + 40) to:*(void *)(a1 + 48)];
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfUpdatedContentItems:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke;
    block[3] = &unk_1E57D0790;
    void block[4] = self;
    id v13 = v4;
    dispatch_async(v7, block);
  }
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke_2;
    v11[3] = &unk_1E57D0518;
    v11[4] = self;
    dispatch_async(v10, v11);
  }
}

void __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) contentItemsDidUpdate:*(void *)(a1 + 40)];
}

void __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke;
    block[3] = &unk_1E57D0790;
    void block[4] = self;
    id v13 = v4;
    dispatch_async(v7, block);
  }
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke_2;
    v11[3] = &unk_1E57D0518;
    v11[4] = self;
    dispatch_async(v10, v11);
  }
}

void __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didLoadArtworkForContentItems:*(void *)(a1 + 40)];
}

void __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfSupportedCommandsChangeFromOldCommands:(id)a3 toNewCommands:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke;
    block[3] = &unk_1E57D1B18;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  char v11 = [(MRQHONowPlayingController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(MRQHONowPlayingController *)self delegateQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke_2;
    v14[3] = &unk_1E57D0518;
    v14[4] = self;
    dispatch_async(v13, v14);
  }
}

void __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) supportedCommandsDidChangeFrom:*(void *)(a1 + 40) to:*(void *)(a1 + 48)];
}

void __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke;
    block[3] = &unk_1E57D0790;
    void block[4] = self;
    id v13 = v4;
    dispatch_async(v7, block);
  }
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke_2;
    v11[3] = &unk_1E57D0518;
    v11[4] = self;
    dispatch_async(v10, v11);
  }
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) deviceLastPlayingDateDidChange:*(void *)(a1 + 40)];
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke;
    block[3] = &unk_1E57D0790;
    void block[4] = self;
    id v13 = v4;
    dispatch_async(v7, block);
  }
  char v8 = [(MRQHONowPlayingController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MRQHONowPlayingController *)self delegateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke_2;
    v11[3] = &unk_1E57D0518;
    v11[4] = self;
    dispatch_async(v10, v11);
  }
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) playerLastPlayingDateDidChange:*(void *)(a1 + 40)];
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 response];
  [v4 controller:v2 didUpdateResponse:v3];
}

- (void)_notifyDelegateOfError:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MRQHONowPlayingController *)self delegateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__MRQHONowPlayingController__notifyDelegateOfError___block_invoke;
    v8[3] = &unk_1E57D0790;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __52__MRQHONowPlayingController__notifyDelegateOfError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfInvalidation
{
  id v3 = [(MRQHONowPlayingController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRQHONowPlayingController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MRQHONowPlayingController__notifyDelegateOfInvalidation__block_invoke;
    block[3] = &unk_1E57D0518;
    void block[4] = self;
    dispatch_async(v5, block);
  }
}

void __58__MRQHONowPlayingController__notifyDelegateOfInvalidation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerWillReloadForInvalidation:*(void *)(a1 + 32)];
}

- (void)_registerNotificationHandlersIfNeeded
{
  if (![(MRQHONowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__handlePlaybackQueueChangedNotification_ name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

    char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__handlePlaybackQueueContentItemsChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handlePlaybackQueueContentItemsArtworkChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];

    char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__handlePlaybackStateChangedNotification_ name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__handleSupportedCommandsChangedNotification_ name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];

    [(MRQHONowPlayingController *)self setRegisteredForNotifications:1];
  }
}

- (void)_unregisterNotificationHandlers
{
  if ([(MRQHONowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    [(MRQHONowPlayingController *)self setRegisteredForNotifications:0];
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_8;
    }
  }
  id v7 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 40) uid];
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@ : %p> processing PlaybackQueueDidChangeNotification.", buf, 0x16u);
  }
  id v10 = [*(id *)(a1 + 40) deferredContentItemsToMerge];
  [v10 removeAllObjects];

  char v11 = *(void **)(a1 + 40);
  char v12 = [v11 resolvedPlayerPath];
  id v13 = [*(id *)(a1 + 40) queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_95;
  v14[3] = &unk_1E57D2430;
  v14[4] = *(void *)(a1 + 40);
  objc_msgSend(v11, "_onQueue_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:", v12, 1, v13, v14);

LABEL_8:
}

void __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_95(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  id v5 = *(id **)(a1 + 32);
  if (a3)
  {
    [v5 _notifyDelegateOfError:a3];
  }
  else
  {
    id v6 = [v5[6] playbackQueue];
    id v7 = v6;
    if (v6 == v14)
    {
    }
    else
    {
      char v8 = objc_msgSend(v6, "isEqual:");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateWithNewPlaybackQueue:", v14);
        [*(id *)(a1 + 32) _notifyDelegateOfPlaybackQueueChangeFromOldQueue:v7 toNewQueue:v14];
      }
    }
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v10 = [v14 contentItems];
  char v11 = (void *)[v9 initWithArray:v10 copyItems:1];

  char v12 = *(void **)(a1 + 32);
  id v13 = [v12 resolvedPlayerPath];
  objc_msgSend(v12, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v11, v13, @"PlaybackQueueDidChangeNotification");
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_16;
    }
  }
  id v7 = [*(id *)(a1 + 32) userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v9 = objc_msgSend(v8, "mr_compactMap:", &__block_literal_global_22);
  int v10 = [*(id *)(a1 + 40) requestingQueue];
  char v11 = _MRLogForCategory(1uLL);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [*(id *)(a1 + 40) uid];
      int v18 = 138412546;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v18, 0x16u);
    }
    id v14 = [*(id *)(a1 + 40) deferredContentItemsToMerge];
    [v14 addObjectsFromArray:v8];
  }
  else
  {
    if (v12)
    {
      unsigned int v15 = [*(id *)(a1 + 40) uid];
      int v18 = 138412546;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.", (uint8_t *)&v18, 0x16u);
    }
    id v14 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateByMergingContentItemChanges:", v8);
    if ([v14 count])
    {
      id v16 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [*(id *)(a1 + 40) uid];
        int v18 = 138412546;
        uint64_t v19 = v17;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated content items %@.", (uint8_t *)&v18, 0x16u);
      }
      [*(id *)(a1 + 40) _notifyDelegateOfUpdatedContentItems:v14];
    }
  }

LABEL_16:
}

uint64_t __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_12;
    }
  }
  id v7 = [*(id *)(a1 + 32) userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v9 = objc_msgSend(v8, "mr_compactMap:", &__block_literal_global_101);
  int v10 = [*(id *)(a1 + 40) requestingQueue];
  char v11 = _MRLogForCategory(1uLL);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [*(id *)(a1 + 40) uid];
      int v16 = 138412546;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> ignoring PlaybackQueueContentItemsArtworkChangedNotification for content items %@ ", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      id v14 = [*(id *)(a1 + 40) uid];
      int v16 = 138412546;
      __int16 v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", (uint8_t *)&v16, 0x16u);
    }
    unsigned int v15 = *(void **)(a1 + 40);
    char v11 = [v15 resolvedPlayerPath];
    objc_msgSend(v15, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v8, v11, @"PlaybackQueueContentItemsArtworkChangedNotification");
  }

LABEL_12:
}

uint64_t __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_10;
    }
  }
  id v7 = [*(id *)(a1 + 32) userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];

  id v9 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [*(id *)(a1 + 40) uid];
    *(_DWORD *)buf = 138412546;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = MRMediaRemoteCopyPlaybackStateDescription([v8 intValue]);
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);
  }
  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 48) playbackState];
  objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateWithNewPlaybackState:", objc_msgSend(v8, "intValue"));
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChangeFromOldState:toNewState:", v11, objc_msgSend(v8, "intValue"));
  LODWORD(v11) = MRMediaRemotePlaybackStateIsAdvancing(v11);
  if (v11 != MRMediaRemotePlaybackStateIsAdvancing([v8 intValue]))
  {
    BOOL v12 = *(void **)(a1 + 40);
    id v13 = [v12 resolvedPlayerPath];
    id v14 = [*(id *)(a1 + 40) queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke_105;
    v15[3] = &unk_1E57D2478;
    void v15[4] = *(void *)(a1 + 40);
    [v12 _requestPlayerLastPlayingDateForPlayerPath:v13 queue:v14 completion:v15];
  }
LABEL_10:
}

void __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_onQueue_updateWithNewPlayerLastPlayingDate:", v4);
  [*(id *)(a1 + 32) _notifyDelegateOfUpdatedPlayerLastPlayingDate:v4];
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRQHONowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_8;
    }
  }
  id v7 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 40) uid];
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);
  }
  id v9 = *(void **)(a1 + 40);
  int v10 = [v9 resolvedPlayerPath];
  uint64_t v11 = [*(id *)(a1 + 40) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_106;
  void v12[3] = &unk_1E57D24A0;
  void v12[4] = *(void *)(a1 + 40);
  [v9 _requestSupportedCommandsForPlayerPath:v10 queue:v11 completion:v12];

LABEL_8:
}

void __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_106(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = *(id **)(a1 + 32);
  if (a3)
  {
    [v5 _notifyDelegateOfError:a3];
  }
  else
  {
    int v6 = [v5[6] supportedCommands];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateWithNewSupportedCommands:", v7);
    [*(id *)(a1 + 32) _notifyDelegateOfSupportedCommandsChangeFromOldCommands:v6 toNewCommands:v7];
  }
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemoteActiveEndpointTypeUserInfoKey"];
  int v6 = [v5 intValue];

  id v7 = [(MRQHONowPlayingController *)self uid];
  LODWORD(v5) = [v7 isEqualToString:@"proactiveEndpoint"];

  if (v5 && v6 == 1)
  {
    id v8 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(MRQHONowPlayingController *)self uid];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to ASE change.", (uint8_t *)&v10, 0xCu);
    }
    [(MRQHONowPlayingController *)self _notifyDelegateOfInvalidation];
    [(MRQHONowPlayingController *)self _reloadForCompleteInvalidation];
  }
}

- (void)_registerForPlayerPathInvalidationsIfNeeded
{
  if (![(MRQHONowPlayingController *)self registeredForPlayerPathInvalidations])
  {
    objc_initWeak(&location, self);
    id v3 = [(MRQHONowPlayingController *)self unresolvedPlayerPath];
    id v4 = [(MRQHONowPlayingController *)self queue];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __72__MRQHONowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke;
    id v9 = &unk_1E57D24C8;
    objc_copyWeak(&v10, &location);
    id v5 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)v3, v4, &v6);
    -[MRQHONowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v5, v6, v7, v8, v9);

    [(MRQHONowPlayingController *)self setRegisteredForPlayerPathInvalidations:1];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __72__MRQHONowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [WeakRetained uid];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to player path invalidation.", (uint8_t *)&v4, 0xCu);
    }
    [WeakRetained _notifyDelegateOfInvalidation];
    [WeakRetained _reloadForPlayerPathInvalidation];
  }
}

- (void)_unregisterForPlayerPathInvalidations
{
  id v3 = [(MRQHONowPlayingController *)self playerPathInvalidationObserver];

  if (v3)
  {
    int v4 = [(MRQHONowPlayingController *)self playerPathInvalidationObserver];
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v4);

    [(MRQHONowPlayingController *)self setPlayerPathInvalidationObserver:0];
  }

  [(MRQHONowPlayingController *)self setRegisteredForPlayerPathInvalidations:0];
}

- (void)_registerForEndpointChangesIfNeeded
{
  if (![(MRQHONowPlayingController *)self registeredForEndpointChanges])
  {
    id v3 = [(MRQHONowPlayingController *)self uid];
    int v4 = [v3 isEqualToString:@"proactiveEndpoint"];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__handleActiveSystemEndpointChangedNotification_ name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v8 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v9, &location);
      uint64_t v6 = [(MRQHONowPlayingController *)self endpointObserver];
      [v6 setEndpointChangedCallback:&v8];

      uint64_t v7 = [(MRQHONowPlayingController *)self endpointObserver];
      [v7 begin];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    [(MRQHONowPlayingController *)self setRegisteredForEndpointChanges:1];
  }
}

void __64__MRQHONowPlayingController__registerForEndpointChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = a2;
    id v5 = [WeakRetained endpoint];
    uint64_t v6 = [v5 uniqueIdentifier];
    uint64_t v7 = [v4 uniqueIdentifier];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [WeakRetained uid];
        uint64_t v11 = [WeakRetained endpoint];
        int v15 = 138412802;
        int v16 = v10;
        __int16 v17 = 2112;
        __int16 v18 = v11;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to change in endpoint. Current endpoint: %@. New endpoint: %@.", (uint8_t *)&v15, 0x20u);
      }
      uint64_t v12 = [v4 outputDevices];
      id v13 = [v12 firstObject];
      id v14 = [v13 groupID];
      [WeakRetained setEndpointObserverGroupUID:v14];

      [WeakRetained _notifyDelegateOfInvalidation];
      [WeakRetained _reloadForCompleteInvalidation];
    }
  }
}

- (void)_unregisterForEndpointChanges
{
  id v3 = [(MRQHONowPlayingController *)self uid];
  int v4 = [v3 isEqualToString:@"proactiveEndpoint"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
  }
  else
  {
    uint64_t v6 = [(MRQHONowPlayingController *)self endpointObserver];
    [v6 end];

    id v5 = [(MRQHONowPlayingController *)self endpointObserver];
    [v5 setEndpointChangedCallback:0];
  }

  [(MRQHONowPlayingController *)self setRegisteredForEndpointChanges:0];
}

- (BOOL)updateLoadingEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MRQHONowPlayingController *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRQHONowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__MRQHONowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 11);
  return result;
}

- (MRNowPlayingPlayerResponse)response
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v3 = [(MRQHONowPlayingController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MRQHONowPlayingController_response__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

uint64_t __37__MRQHONowPlayingController_response__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (MRAVEndpointObserver)endpointObserver
{
  endpointObserver = self->_endpointObserver;
  if (!endpointObserver)
  {
    id v4 = [MRAVEndpointObserver alloc];
    id v5 = [(MRQHONowPlayingController *)self uid];
    uint64_t v6 = [(MRAVEndpointObserver *)v4 initWithOutputDeviceUID:v5];
    uint64_t v7 = self->_endpointObserver;
    self->_endpointObserver = v6;

    endpointObserver = self->_endpointObserver;
  }

  return endpointObserver;
}

- (NSString)uid
{
  return self->_uid;
}

- (MRClient)client
{
  return self->_client;
}

- (MRPlayer)player
{
  return self->_player;
}

- (MRQHONowPlayingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRQHONowPlayingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (void)setUnresolvedPlayerPath:(id)a3
{
}

- (MRPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (void)setResolvedPlayerPath:(id)a3
{
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
}

- (void)setEndpointObserver:(id)a3
{
}

- (NSString)endpointObserverGroupUID
{
  return self->_endpointObserverGroupUID;
}

- (void)setEndpointObserverGroupUID:(id)a3
{
}

- (NSMutableArray)deferredContentItemsToMerge
{
  return self->_deferredContentItemsToMerge;
}

- (void)setDeferredContentItemsToMerge:(id)a3
{
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)registeredForEndpointChanges
{
  return self->_registeredForEndpointChanges;
}

- (void)setRegisteredForEndpointChanges:(BOOL)a3
{
  self->_registeredForEndpointChanges = a3;
}

- (BOOL)registeredForPlayerPathInvalidations
{
  return self->_registeredForPlayerPathInvalidations;
}

- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3
{
  self->_registeredForPlayerPathInvalidations = a3;
}

- (void)setUpdateLoadingEnabled:(BOOL)a3
{
  self->_updateLoadingEnabled = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSString)cachedNowPlayingArtworkIdentifier
{
  return self->_cachedNowPlayingArtworkIdentifier;
}

- (void)setCachedNowPlayingArtworkIdentifier:(id)a3
{
}

- (MRArtwork)cachedNowPlayingArtwork
{
  return self->_cachedNowPlayingArtwork;
}

- (void)setCachedNowPlayingArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNowPlayingArtwork, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_uid, 0);
}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRQHONPC] %@ Unable to discover endpoint.", (uint8_t *)&v3, 0xCu);
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = [*(id *)(v0 + 32) uid];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v2, v3, "[MRQHONPC] <%@> Error creating player path %@.", v4, v5, v6, v7, v8);
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = [*v0 uid];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v2, v3, "[MRQHONPC] <%@> Error loading data %@.", v4, v5, v6, v7, v8);
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) uid];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRQHONPC] <%@> Player path is not resolved. There may be no now playing application.", (uint8_t *)&v4, 0xCu);
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_18_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = [*(id *)(v0 + 32) uid];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v2, v3, "[MRQHONPC] <%@> Error resolving player path %@.", v4, v5, v6, v7, v8);
}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v2;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(v2 + 32) uid];
  uint64_t v5 = [*(id *)(v3 + 40) identifier];
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v1;
  _os_log_error_impl(&dword_194F3C000, v0, OS_LOG_TYPE_ERROR, "[MRQHONPC] <%@> Error fetching artwork for content item %@. Error: %@.", (uint8_t *)&v6, 0x20u);
}

void __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRQHONPC] Failed to retrieve player last playing date with error: %@", (uint8_t *)&v2, 0xCu);
}

@end