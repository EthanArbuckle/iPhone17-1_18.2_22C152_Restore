@interface MRV1NowPlayingController
- (BOOL)registeredForEndpointChanges;
- (BOOL)registeredForNotifications;
- (BOOL)registeredForPlayerPathInvalidations;
- (BOOL)requestingQueue;
- (BOOL)updateLoadingEnabled;
- (MRAVEndpointObserver)endpointObserver;
- (MRNowPlayingControllerConfiguration)configuration;
- (MRNowPlayingControllerDestination)destination;
- (MRNowPlayingControllerHelper)helper;
- (MRNowPlayingPlayerResponse)response;
- (MRV1NowPlayingController)initWithConfiguration:(id)a3;
- (MSVVariableIntervalTimer)retryTimer;
- (NSMutableArray)deferredContentItemsToMerge;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)endpointObserverGroupUID;
- (OS_dispatch_queue)queue;
- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4;
- (id)playerPathInvalidationObserver;
- (void)_createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
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
- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3;
- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3;
- (void)_notifyDelegateOfPlayerPathChange:(id)a3;
- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3;
- (void)_notifyDelegateOfUpdatedArtwork:(id)a3;
- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3;
- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3;
- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3;
- (void)_onQueue_clearState;
- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4;
- (void)_registerForEndpointChangesIfNeeded;
- (void)_registerForPlayerPathInvalidationsIfNeeded;
- (void)_registerNotificationHandlersIfNeeded;
- (void)_reloadForCompleteInvalidation;
- (void)_reloadForPlayerPathInvalidation;
- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_resolvePlayerPath:(id)a3 completion:(id)a4;
- (void)_unregisterForEndpointChanges;
- (void)_unregisterForPlayerPathInvalidations;
- (void)_unregisterNotificationHandlers;
- (void)beginLoadingUpdates;
- (void)dealloc;
- (void)endLoadingUpdates;
- (void)setConfiguration:(id)a3;
- (void)setDeferredContentItemsToMerge:(id)a3;
- (void)setDestination:(id)a3;
- (void)setEndpointObserver:(id)a3;
- (void)setEndpointObserverGroupUID:(id)a3;
- (void)setHelper:(id)a3;
- (void)setPlayerPathInvalidationObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredForEndpointChanges:(BOOL)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3;
- (void)setRequestingQueue:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setUpdateLoadingEnabled:(BOOL)a3;
@end

@implementation MRV1NowPlayingController

void __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (MRV1NowPlayingController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRV1NowPlayingController;
  v5 = [(MRV1NowPlayingController *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v8;

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.queue", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  [(MRV1NowPlayingController *)self _unregisterForPlayerPathInvalidations];
  v4.receiver = self;
  v4.super_class = (Class)MRV1NowPlayingController;
  [(MRV1NowPlayingController *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRV1NowPlayingController *)self configuration];
  uint64_t v6 = [v5 destination];
  uint64_t v7 = [v6 outputDeviceUID];
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@ %p : %@>", v4, self, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRV1NowPlayingController *)self endpointObserver];
  uint64_t v6 = [(MRV1NowPlayingController *)self endpointObserverGroupUID];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@ %p {   endpointObserver=%@\n   endpointObserverGroupID=%@\n}>\n", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)beginLoadingUpdates
{
  id v3 = [(MRV1NowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin loading updates.", buf, 0xCu);
    }

    uint64_t v4 = *(void **)(a1 + 32);
    v15 = [v4 configuration];
    objc_super v14 = [v15 destination];
    v13 = [v14 outputDeviceUID];
    v5 = [*(id *)(a1 + 32) configuration];
    uint64_t v6 = [v5 destination];
    uint64_t v7 = [v6 playerPath];
    uint64_t v8 = [v7 client];
    uint64_t v9 = [*(id *)(a1 + 32) configuration];
    uint64_t v10 = [v9 destination];
    dispatch_queue_t v11 = [v10 playerPath];
    uint64_t v12 = [v11 player];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke_14;
    v16[3] = &unk_1E57D2110;
    v16[4] = *(void *)(a1 + 32);
    [v4 _loadNowPlayingStateForUID:v13 client:v8 player:v12 completion:v16];
  }
}

void __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setUpdateLoadingEnabled:1];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 _notifyDelegateOfError:v5];
  }
  else {
    [v6 _notifyDelegateOfNewResponse:v7];
  }
}

- (void)endLoadingUpdates
{
  uint64_t v3 = [(MRV1NowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MRV1NowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __45__MRV1NowPlayingController_endLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 11))
  {
    uint64_t v1 = result;
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> End loading updates.", (uint8_t *)&v4, 0xCu);
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
  uint64_t v3 = [(MRV1NowPlayingController *)self configuration];
  int v4 = [v3 destination];
  uint64_t v5 = [v4 outputDeviceUID];
  uint64_t v6 = [(MRV1NowPlayingController *)self configuration];
  id v7 = [v6 destination];
  uint64_t v8 = [v7 client];
  uint64_t v9 = [(MRV1NowPlayingController *)self configuration];
  uint64_t v10 = [v9 destination];
  dispatch_queue_t v11 = [v10 player];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__MRV1NowPlayingController__reloadForCompleteInvalidation__block_invoke;
  v12[3] = &unk_1E57D2110;
  v12[4] = self;
  [(MRV1NowPlayingController *)self _loadNowPlayingStateForUID:v5 client:v8 player:v11 completion:v12];
}

uint64_t __58__MRV1NowPlayingController__reloadForCompleteInvalidation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfNewResponse:a2];
  }
}

- (void)_reloadForPlayerPathInvalidation
{
  [(MRV1NowPlayingController *)self _unregisterForPlayerPathInvalidations];
  uint64_t v3 = [(MRV1NowPlayingController *)self destination];
  int v4 = [v3 endpoint];
  uint64_t v5 = [(MRV1NowPlayingController *)self configuration];
  uint64_t v6 = [v5 destination];
  id v7 = [v6 client];
  uint64_t v8 = [(MRV1NowPlayingController *)self configuration];
  uint64_t v9 = [v8 destination];
  uint64_t v10 = [v9 player];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MRV1NowPlayingController__reloadForPlayerPathInvalidation__block_invoke;
  v11[3] = &unk_1E57D2110;
  v11[4] = self;
  [(MRV1NowPlayingController *)self _loadNowPlayingStateForEndpoint:v4 client:v7 player:v10 completion:v11];
}

uint64_t __60__MRV1NowPlayingController__reloadForPlayerPathInvalidation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfNewResponse:a2];
  }
}

- (void)_loadNowPlayingStateForUID:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = [(MRV1NowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke;
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

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearState");
  v2 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin resolving endpoint.", buf, 0xCu);
  }

  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_17;
  v6[3] = &unk_1E57D7520;
  v6[4] = v4;
  id v9 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_onQueue_retrieveEndpointForUID:completion:", v5, v6);
}

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _registerForEndpointChangesIfNeeded];
  id v7 = _MRLogForCategory(1uLL);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_17_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Resolved to Endpoint: %@.", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) _loadNowPlayingStateForEndpoint:v5 client:*(void *)(a1 + 40) player:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)_loadNowPlayingStateForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 debugName];
    *(_DWORD *)buf = 138412546;
    id v22 = self;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin resolving player path for endpoint %@.", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke;
  v18[3] = &unk_1E57D2188;
  id v19 = v10;
  id v20 = v11;
  v18[4] = self;
  id v16 = v10;
  id v17 = v11;
  [(MRV1NowPlayingController *)self _createPlayerPathForEndpoint:v16 client:v13 player:v12 completion:v18];
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v8 = a1 + 4;
  id v7 = a1[4];
  uint64_t v9 = (void *)v7[11];
  if (v6)
  {
    if (v9)
    {
      if ([v9 isValid])
      {
        id v10 = [NSString alloc];
        [*((id *)*v8 + 11) timeUntilNextInterval];
        id v12 = (__CFString *)objc_msgSend(v10, "initWithFormat:", @"Already attempting retry in %lf more seconds", v11);
      }
      else
      {
        __int16 v23 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1();
        }

        id v12 = @"Exhausted all retry attempts. Controller likely will not function properly until the destination device makes a signficant change";
      }
    }
    else
    {
      id v14 = [NSString alloc];
      id v15 = [&unk_1EE66F408 firstObject];
      [v15 doubleValue];
      id v12 = (__CFString *)objc_msgSend(v14, "initWithFormat:", @"Will attempt retry in %lf seconds", v16);

      id v17 = (objc_class *)MEMORY[0x1E4F77A38];
      id v18 = *v8;
      id v19 = [v17 alloc];
      id v20 = [*v8 queue];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_37;
      v30[3] = &unk_1E57D0518;
      v30[4] = v18;
      uint64_t v21 = [v19 initWithIntervals:&unk_1EE66F408 name:@"NowPlayingController.retryTimer" queue:v20 block:v30];
      id v22 = (void *)*((void *)*v8 + 11);
      *((void *)*v8 + 11) = v21;
    }
    v24 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = *v8;
      *(_DWORD *)buf = 138412802;
      id v32 = v25;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      v36 = v12;
      _os_log_error_impl(&dword_194F3C000, v24, OS_LOG_TYPE_ERROR, "[MRV1NowPlayingController] <%@> Error creating player path %@. %@", buf, 0x20u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v7[11] = 0;

    id v13 = a1[4];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44;
    v26[3] = &unk_1E57D0F70;
    v26[4] = v13;
    id v27 = a1[5];
    id v28 = v5;
    id v29 = a1[6];
    [v13 _resolvePlayerPath:v28 completion:v26];
  }
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_37(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)*(id *)(a1 + 32);
  if (v1)
  {
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      [v1[11] currentInterval];
      int v4 = 138412546;
      id v5 = v1;
      __int16 v6 = 2048;
      uint64_t v7 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Attempting retry after already waiting %lf seconds", (uint8_t *)&v4, 0x16u);
    }

    [v1 _reloadForCompleteInvalidation];
  }
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isResolved])
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = (id *)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 32) destination];
    [v9 setEndpoint:v8];

    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 32) destination];
    [v11 setUnresolvedPlayerPath:v10];

    id v12 = [*(id *)(a1 + 32) destination];
    [v12 setResolvedPlayerPath:v5];

    id v13 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *v7;
      *(_DWORD *)buf = 138412546;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Resolved to player path: %@.", buf, 0x16u);
    }

    [*v7 _registerNotificationHandlersIfNeeded];
    [*v7 _registerForPlayerPathInvalidationsIfNeeded];
    id v15 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *v7;
      *(_DWORD *)buf = 138412290;
      id v32 = v16;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin loading data.", buf, 0xCu);
    }

    id v17 = *v7;
    id v30 = 0;
    id v18 = [v17 _loadNowPlayingStateForPlayerPath:v5 error:&v30];
    id v19 = v30;
    id v20 = _MRLogForCategory(1uLL);
    uint64_t v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44_cold_1();
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = *v7;
      *(_DWORD *)buf = 138412546;
      id v32 = v28;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> End loading data. Response: %@.", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v22 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44_cold_2();
    }

    [*(id *)(a1 + 32) setResponse:0];
    uint64_t v23 = *(void *)(a1 + 40);
    v24 = [*(id *)(a1 + 32) destination];
    [v24 setEndpoint:v23];

    uint64_t v25 = *(void *)(a1 + 48);
    v26 = [*(id *)(a1 + 32) destination];
    [v26 setUnresolvedPlayerPath:v25];

    [*(id *)(a1 + 32) _registerForPlayerPathInvalidationsIfNeeded];
    uint64_t v27 = *(void *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0, v6);
    }
    else
    {
      id v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:42];
      (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v29);
    }
  }
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  int v70 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__31;
  v65 = __Block_byref_object_dispose__31;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__31;
  v59 = __Block_byref_object_dispose__31;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__31;
  v53 = __Block_byref_object_dispose__31;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__31;
  v47 = __Block_byref_object_dispose__31;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__31;
  v41 = __Block_byref_object_dispose__31;
  id v42 = 0;
  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingController.callbackQueue", v8);

  dispatch_group_enter(v7);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
  v33[3] = &unk_1E57D21D8;
  uint64_t v35 = &v49;
  v36 = &v43;
  uint64_t v10 = v7;
  id v34 = v10;
  [(MRV1NowPlayingController *)self _requestSupportedCommandsForPlayerPath:v6 queue:v9 completion:v33];
  dispatch_group_enter(v10);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
  v30[3] = &unk_1E57D2200;
  id v32 = &v67;
  uint64_t v11 = v10;
  v31 = v11;
  MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v30);
  dispatch_group_enter(v11);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
  v26[3] = &unk_1E57D33E0;
  id v28 = &v61;
  id v29 = &v55;
  id v12 = v11;
  uint64_t v27 = v12;
  [(MRV1NowPlayingController *)self _requestPlaybackQueueForPlayerPath:v6 includeArtwork:1 queue:v9 completion:v26];
  dispatch_group_enter(v12);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
  uint64_t v23 = &unk_1E57D2250;
  uint64_t v25 = &v37;
  id v13 = v12;
  v24 = v13;
  [(MRV1NowPlayingController *)self _requestPlayerLastPlayingDateForPlayerPath:v6 queue:v9 completion:&v20];
  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v13, v14))
  {
    if (a4)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v16 = (id)objc_msgSend(v15, "initWithMRError:", 26, v20, v21, v22, v23);
LABEL_8:
      id v18 = 0;
      *a4 = v16;
      goto LABEL_10;
    }
LABEL_9:
    id v18 = 0;
    goto LABEL_10;
  }
  id v17 = (void *)v56[5];
  if (v17 || (id v17 = (void *)v44[5]) != 0)
  {
    if (a4)
    {
      id v16 = v17;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v18 = objc_alloc_init(MRNowPlayingPlayerResponse);
  -[MRNowPlayingPlayerResponse setPlaybackQueue:](v18, "setPlaybackQueue:", v62[5], v20, v21, v22, v23);
  [(MRNowPlayingPlayerResponse *)v18 setPlaybackState:*((unsigned int *)v68 + 6)];
  [(MRNowPlayingPlayerResponse *)v18 setSupportedCommands:v50[5]];
  [(MRNowPlayingPlayerResponse *)v18 setDeviceLastPlayingDate:0];
  [(MRNowPlayingPlayerResponse *)v18 setPlayerLastPlayingDate:v38[5]];
LABEL_10:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v18;
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(MRV1NowPlayingController *)self setRequestingQueue:1];
  id v13 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  [v13 setCachingPolicy:2];
  if (v8)
  {
    [v13 setArtworkHeight:600.0];
    [v13 setArtworkWidth:600.0];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__MRV1NowPlayingController__requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2278;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v10, v11, v15);
}

void __95__MRV1NowPlayingController__requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke(uint64_t a1, void *a2)
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

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[MRPlaybackQueueRequest alloc] initWithIdentifiers:v12];

  [(MRPlaybackQueueRequest *)v13 setArtworkHeight:600.0];
  [(MRPlaybackQueueRequest *)v13 setArtworkWidth:600.0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__MRV1NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2318;
  id v16 = v9;
  id v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);
}

uint64_t __86__MRV1NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__MRV1NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E57D1380;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);
}

uint64_t __84__MRV1NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
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
  v12[2] = __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v12[3] = &unk_1E57D2390;
  id v13 = v7;
  id v11 = v7;
  [(MRNowPlayingRequest *)v10 requestLastPlayingDateOnQueue:v8 completion:v12];
}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRV1NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([v6 isEqualToString:@"proactiveEndpoint"])
  {
    id v9 = [(MRV1NowPlayingController *)self queue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v23[3] = &unk_1E57D23B8;
    id v24 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v9, v23, 7.0);

    id v10 = v24;
  }
  else
  {
    id v10 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];
    id v11 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    id v12 = [(MRV1NowPlayingController *)self endpointObserverGroupUID];

    if (v12)
    {
      id v13 = [(MRV1NowPlayingController *)self endpointObserverGroupUID];
      id v14 = [(MRV1NowPlayingController *)self queue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
      v20[3] = &unk_1E57D23E0;
      long long v15 = (id *)&v21;
      uint64_t v21 = v11;
      id v16 = &v22;
      id v22 = v7;
      [(MRAVLightweightReconnaissanceSession *)v11 searchEndpointsForGroupUID:v13 timeout:v10 reason:v14 queue:v20 completion:7.0];
    }
    else
    {
      id v13 = [(MRV1NowPlayingController *)self queue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
      v17[3] = &unk_1E57D23E0;
      long long v15 = (id *)&v18;
      id v18 = v11;
      id v16 = &v19;
      id v19 = v7;
      [(MRAVLightweightReconnaissanceSession *)v11 searchEndpointsForOutputDeviceUID:v6 timeout:v10 reason:v13 queue:v17 completion:7.0];
    }
  }
}

uint64_t __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

void __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)_createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = @"MREndpointConnectionReasonUserInfoKey";
  v25[0] = @"MRNowPlayingController";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke;
  v19[3] = &unk_1E57D1120;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [v17 connectToExternalDeviceWithUserInfo:v14 completion:v19];
}

void __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E57D2408;
  id v7 = v3;
  id v11 = a1[8];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
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
  id v8 = [(MRV1NowPlayingController *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__MRV1NowPlayingController__resolvePlayerPath_completion___block_invoke;
  v10[3] = &unk_1E57D2318;
  id v11 = v6;
  id v9 = v6;
  MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, v10);
}

uint64_t __58__MRV1NowPlayingController__resolvePlayerPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueue_clearState
{
  id v3 = [(MRV1NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MRV1NowPlayingController *)self _unregisterForPlayerPathInvalidations];
  [(MRV1NowPlayingController *)self _unregisterForEndpointChanges];
  id v4 = [(MRV1NowPlayingController *)self destination];
  [v4 setEndpoint:0];

  id v5 = [(MRV1NowPlayingController *)self destination];
  [v5 setUnresolvedPlayerPath:0];

  id v6 = [(MRV1NowPlayingController *)self destination];
  [v6 setResolvedPlayerPath:0];

  id v7 = [(MRV1NowPlayingController *)self deferredContentItemsToMerge];
  [v7 removeAllObjects];
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 didLoadResponse];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MRV1NowPlayingController *)self helper];

  if (v5)
  {
    id v7 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v7 playbackStateDidChange];
    v6[2](v6, v3);
  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 playbackQueueDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 contentItemsDidUpdate];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 contentItemsDidLoadArtwork];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 supportedCommandsDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 playerLastPlayingDateDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 clientPropertiesDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 playerPathDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfInvalidation
{
  uint64_t v3 = [(MRV1NowPlayingController *)self helper];

  if (v3)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v4 = [v5 didInvalidate];
    v4[2]();
  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV1NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV1NowPlayingController *)self helper];
    id v6 = [v5 didFailWithError];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_registerNotificationHandlersIfNeeded
{
  if (![(MRV1NowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__handlePlaybackQueueChangedNotification_ name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__handlePlaybackQueueContentItemsChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handlePlaybackQueueContentItemsArtworkChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__handlePlaybackStateChangedNotification_ name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__handleSupportedCommandsChangedNotification_ name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];

    [(MRV1NowPlayingController *)self setRegisteredForNotifications:1];
  }
}

- (void)_unregisterNotificationHandlers
{
  if ([(MRV1NowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    [(MRV1NowPlayingController *)self setRegisteredForNotifications:0];
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV1NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v8 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
  }

  id v10 = [*(id *)(a1 + 40) deferredContentItemsToMerge];
  [v10 removeAllObjects];

  id v11 = *(void **)(a1 + 40);
  id v12 = [v11 destination];
  id v13 = [v12 resolvedPlayerPath];
  id v14 = [*(id *)(a1 + 40) queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_81;
  v15[3] = &unk_1E57D2430;
  void v15[4] = *(void *)(a1 + 40);
  [v11 _requestPlaybackQueueForPlayerPath:v13 includeArtwork:1 queue:v14 completion:v15];

LABEL_8:
}

uint64_t __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_81(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfPlaybackQueueChange:a2];
  }
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV1NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v10 = objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_82);
  int v11 = [*(id *)(a1 + 40) requestingQueue];
  id v12 = _MRLogForCategory(1uLL);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v17 = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v17, 0x16u);
    }

    id v15 = [*(id *)(a1 + 40) deferredContentItemsToMerge];
    [v15 addObjectsFromArray:v9];
  }
  else
  {
    if (v13)
    {
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> updated content items %@.", (uint8_t *)&v17, 0x16u);
    }

    [*(id *)(a1 + 40) _notifyDelegateOfUpdatedContentItemsWithContentItems:v10];
  }

LABEL_13:
}

uint64_t __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV1NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v10 = objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_84_0);
  int v11 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", buf, 0x16u);
  }

  BOOL v13 = *(void **)(a1 + 40);
  uint64_t v14 = [v13 destination];
  id v15 = [v14 resolvedPlayerPath];
  uint64_t v16 = [*(id *)(a1 + 40) queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_85;
  v17[3] = &unk_1E57D2430;
  void v17[4] = *(void *)(a1 + 40);
  [v13 _requestContentItemArtwork:v10 forPlayerPath:v15 queue:v16 completion:v17];

LABEL_8:
}

uint64_t __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_85(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _notifyDelegateOfError:a3];
  }
  else
  {
    id v6 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v5 contentItems];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v5 contentItems];
    [v9 _notifyDelegateOfUpdatedArtwork:v10];
  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV1NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];

  id v10 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = MRMediaRemoteCopyPlaybackStateDescription([v9 intValue]);
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);
  }

  int v12 = [*(id *)(*(void *)(a1 + 40) + 40) playbackState];
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
  BOOL IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(v12);
  if (IsAdvancing != MRMediaRemotePlaybackStateIsAdvancing([v9 intValue]))
  {
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = [v14 destination];
    uint64_t v16 = [v15 resolvedPlayerPath];
    int v17 = [*(id *)(a1 + 40) queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_86;
    v18[3] = &unk_1E57D2478;
    v18[4] = *(void *)(a1 + 40);
    [v14 _requestPlayerLastPlayingDateForPlayerPath:v16 queue:v17 completion:v18];
  }
LABEL_10:
}

uint64_t __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_86(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedPlayerLastPlayingDate:a2];
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV1NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v8 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);
  }

  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v10 destination];
  int v12 = [v11 resolvedPlayerPath];
  __int16 v13 = [*(id *)(a1 + 40) queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_87;
  v14[3] = &unk_1E57D24A0;
  v14[4] = *(void *)(a1 + 40);
  [v10 _requestSupportedCommandsForPlayerPath:v12 queue:v13 completion:v14];

LABEL_8:
}

uint64_t __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_87(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfSupportedCommandsChange:a2];
  }
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [(MRV1NowPlayingController *)self configuration];
  id v5 = [v4 destination];
  id v6 = [v5 outputDeviceUID];
  int v7 = [v6 isEqualToString:@"proactiveEndpoint"];

  if (v7)
  {
    id v8 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to ASE change.", (uint8_t *)&v9, 0xCu);
    }

    [(MRV1NowPlayingController *)self _notifyDelegateOfInvalidation];
    [(MRV1NowPlayingController *)self _reloadForCompleteInvalidation];
  }
}

- (void)_registerForPlayerPathInvalidationsIfNeeded
{
  if (![(MRV1NowPlayingController *)self registeredForPlayerPathInvalidations])
  {
    objc_initWeak(&location, self);
    id v3 = [(MRV1NowPlayingController *)self destination];
    id v4 = [v3 unresolvedPlayerPath];

    id v5 = [(MRV1NowPlayingController *)self queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__MRV1NowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke;
    v8[3] = &unk_1E57D7548;
    objc_copyWeak(&v10, &location);
    id v6 = v4;
    id v9 = v6;
    int v7 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)v6, v5, v8);
    [(MRV1NowPlayingController *)self setPlayerPathInvalidationObserver:v7];

    [(MRV1NowPlayingController *)self setRegisteredForPlayerPathInvalidations:1];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

void __71__MRV1NowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = a2;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to player path invalidation %@ -> %@.", (uint8_t *)&v7, 0x20u);
    }

    [WeakRetained _notifyDelegateOfInvalidation];
    [WeakRetained _reloadForPlayerPathInvalidation];
  }
}

- (void)_unregisterForPlayerPathInvalidations
{
  id v3 = [(MRV1NowPlayingController *)self playerPathInvalidationObserver];

  if (v3)
  {
    id v4 = [(MRV1NowPlayingController *)self playerPathInvalidationObserver];
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v4);

    [(MRV1NowPlayingController *)self setPlayerPathInvalidationObserver:0];
  }

  [(MRV1NowPlayingController *)self setRegisteredForPlayerPathInvalidations:0];
}

- (void)_registerForEndpointChangesIfNeeded
{
  if (![(MRV1NowPlayingController *)self registeredForEndpointChanges])
  {
    id v3 = [(MRV1NowPlayingController *)self destination];
    id v4 = [v3 outputDeviceUID];
    int v5 = [v4 isEqualToString:@"proactiveEndpoint"];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:self selector:sel__handleActiveSystemEndpointChangedNotification_ name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
    }
    else
    {
      objc_initWeak(&location, self);
      endpointObserver = self->_endpointObserver;
      if (!endpointObserver)
      {
        id v8 = [MRAVEndpointObserver alloc];
        __int16 v9 = [(MRV1NowPlayingController *)self configuration];
        uint64_t v10 = [v9 destination];
        __int16 v11 = [v10 outputDeviceUID];
        id v12 = [NSString alloc];
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = [(MRV1NowPlayingController *)self configuration];
        uint64_t v15 = [v14 destination];
        uint64_t v16 = [v15 outputDeviceUID];
        uint64_t v17 = (void *)[v12 initWithFormat:@"%@:%@", v13, v16];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __63__MRV1NowPlayingController__registerForEndpointChangesIfNeeded__block_invoke;
        v20[3] = &unk_1E57D24F0;
        objc_copyWeak(&v21, &location);
        uint64_t v18 = [(MRAVEndpointObserver *)v8 initWithOutputDeviceUID:v11 label:v17 callback:v20];
        uint64_t v19 = self->_endpointObserver;
        self->_endpointObserver = v18;

        objc_destroyWeak(&v21);
        endpointObserver = self->_endpointObserver;
      }
      [(MRAVEndpointObserver *)endpointObserver begin];
      objc_destroyWeak(&location);
    }
    [(MRV1NowPlayingController *)self setRegisteredForEndpointChanges:1];
  }
}

void __63__MRV1NowPlayingController__registerForEndpointChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = a2;
    int v5 = [WeakRetained destination];
    uint64_t v6 = [v5 endpoint];
    id v7 = [v6 uniqueIdentifier];
    id v8 = [v4 uniqueIdentifier];
    if (v7 == v8)
    {
    }
    else
    {
      __int16 v9 = v8;
      char v10 = [v7 isEqual:v8];

      if ((v10 & 1) == 0)
      {
        __int16 v11 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [WeakRetained destination];
          uint64_t v13 = [v12 endpoint];
          int v17 = 138412802;
          id v18 = WeakRetained;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          __int16 v21 = 2112;
          id v22 = v4;
          _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to change in endpoint. Current endpoint: %@. New endpoint: %@.", (uint8_t *)&v17, 0x20u);
        }
        uint64_t v14 = [v4 outputDevices];
        uint64_t v15 = [v14 firstObject];
        uint64_t v16 = [v15 groupID];
        [WeakRetained setEndpointObserverGroupUID:v16];

        [WeakRetained _notifyDelegateOfInvalidation];
        [WeakRetained _reloadForCompleteInvalidation];
      }
    }
  }
}

- (void)_unregisterForEndpointChanges
{
  id v3 = [(MRV1NowPlayingController *)self configuration];
  id v4 = [v3 destination];
  int v5 = [v4 outputDeviceUID];
  int v6 = [v5 isEqualToString:@"proactiveEndpoint"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
  }
  else
  {
    [(MRAVEndpointObserver *)self->_endpointObserver end];
  }

  [(MRV1NowPlayingController *)self setRegisteredForEndpointChanges:0];
}

- (BOOL)updateLoadingEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MRV1NowPlayingController *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRV1NowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __48__MRV1NowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 11);
  return result;
}

- (MRNowPlayingPlayerResponse)response
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__31;
  __int16 v11 = __Block_byref_object_dispose__31;
  id v12 = 0;
  id v3 = [(MRV1NowPlayingController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MRV1NowPlayingController_response__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

uint64_t __36__MRV1NowPlayingController_response__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (MRNowPlayingControllerHelper)helper
{
  return self->helper;
}

- (void)setHelper:(id)a3
{
}

- (MRNowPlayingControllerDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (MRNowPlayingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
}

- (MRAVEndpointObserver)endpointObserver
{
  return self->_endpointObserver;
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

- (MSVVariableIntervalTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->helper, 0);
}

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRV1NowPlayingController] %@ Unable to discover endpoint.", v2, v3, v4, v5, v6);
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_8();
  _os_log_fault_impl(&dword_194F3C000, v0, OS_LOG_TYPE_FAULT, "Exhausted all retry attempts %@", v1, 0xCu);
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_194F3C000, v1, OS_LOG_TYPE_ERROR, "[MRV1NowPlayingController] <%@> Error loading data %@.", v2, 0x16u);
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_44_cold_2()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRV1NowPlayingController] <%@> Player path is not resolved. There may be no now playing application.", v2, v3, v4, v5, v6);
}

void __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end