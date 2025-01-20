@interface MRV2NowPlayingController
- (BOOL)endpointChanged;
- (BOOL)endpointInvalidated;
- (BOOL)isLoading;
- (BOOL)needsImmediateReload;
- (BOOL)playerPathInvalidated;
- (BOOL)registeredForEndpointChanges;
- (BOOL)registeredForEndpointInvalidations;
- (BOOL)registeredForNotifications;
- (BOOL)registeredForPlayerPathInvalidations;
- (BOOL)requestingQueue;
- (BOOL)shouldDeferArtworkRequestForConfiguration:(id)a3;
- (BOOL)shouldObserveInvalidations;
- (BOOL)updateLoadingEnabled;
- (MRAVEndpointObserver)endpointObserver;
- (MRNowPlayingControllerConfiguration)configuration;
- (MRNowPlayingControllerDestination)destination;
- (MRNowPlayingControllerDestination)pendingDestination;
- (MRNowPlayingControllerHelper)helper;
- (MRV2NowPlayingController)initWithConfiguration:(id)a3;
- (MRV2NowPlayingControllerOperationQueue)cancelableOperations;
- (MSVVariableIntervalTimer)loadRetryTimer;
- (NSMutableArray)deferredContentItemsToMerge;
- (NSString)debugDescription;
- (NSString)label;
- (NSString)needsImmediateReloadReason;
- (OS_dispatch_queue)queue;
- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4;
- (id)effectivePlaybackQueueRequest;
- (id)playerPathInvalidationObserver;
- (int)incrementingRequestID;
- (void)_configureReloadTimerForError:(id)a3;
- (void)_createUnresolvedPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
- (void)_handleActiveSystemEndpointChangedNotification:(id)a3;
- (void)_handleClientStateDidChange:(id)a3;
- (void)_handleEndpointChanged;
- (void)_handleEndpointChangedToEndpoint:(id)a3;
- (void)_handleEndpointInvalidated;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3;
- (void)_handlePlaybackStateChangedNotification:(id)a3;
- (void)_handlePlayerPathInvalidatedWithPlayerPath:(id)a3;
- (void)_handleRetryTimerElapsed;
- (void)_handleSupportedCommandsChangedNotification:(id)a3;
- (void)_loadNowPlayingStateForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5;
- (void)_loadNowPlayingStateForResolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5;
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
- (void)_onQueue_clearAllState;
- (void)_onQueue_clearStateForEndpoint;
- (void)_onQueue_clearStateForOutputDeviceUID;
- (void)_onQueue_clearStateForResolvedPlayerPath;
- (void)_onQueue_clearStateForUnresolvedPlayerPath;
- (void)_onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4;
- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4;
- (void)_registerForEndpointChangesForOutputDeviceUID:(id)a3;
- (void)_registerForEndpointInvalidations:(id)a3;
- (void)_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3;
- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3;
- (void)_reloadWithReason:(id)a3;
- (void)_requestClientPropertiesForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlaybackQueueArtworkForIdentifiers:(id)a3 operationQueue:(id)a4;
- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_resolveForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5;
- (void)_resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)_resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)_resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)_resolveForUnresolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5;
- (void)_resolvePlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5;
- (void)_unregisterForEndpointChanges;
- (void)_unregisterForEndpointInvalidations;
- (void)_unregisterForPlayerPathInvalidations;
- (void)_unregisterNotificationHandlers;
- (void)beginLoadingUpdates;
- (void)dealloc;
- (void)destinationWithCompletion:(id)a3;
- (void)onQueue_setResolvedPlayerPath:(id)a3;
- (void)setCancelableOperations:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeferredContentItemsToMerge:(id)a3;
- (void)setDestination:(id)a3;
- (void)setEndpointChanged:(BOOL)a3;
- (void)setEndpointInvalidated:(BOOL)a3;
- (void)setEndpointObserver:(id)a3;
- (void)setHelper:(id)a3;
- (void)setIncrementingRequestID:(int)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadRetryTimer:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setPendingDestination:(id)a3;
- (void)setPlayerPathInvalidated:(BOOL)a3;
- (void)setPlayerPathInvalidationObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredForEndpointChanges:(BOOL)a3;
- (void)setRegisteredForEndpointInvalidations:(BOOL)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3;
- (void)setRequestingQueue:(BOOL)a3;
- (void)setUpdateLoadingEnabled:(BOOL)a3;
@end

@implementation MRV2NowPlayingController

- (MRV2NowPlayingController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MRV2NowPlayingController;
  v5 = [(MRV2NowPlayingController *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    v8 = [[MRNowPlayingControllerDestination alloc] initWithConfiguration:v4];
    destination = v5->_destination;
    v5->_destination = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v10;

    id v12 = [NSString alloc];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v4 label];
    v15 = (void *)v14;
    v16 = &stru_1EE60E7D8;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    uint64_t v17 = [v12 initWithFormat:@"%@<%p>:%@", v13, v5, v16];
    label = v5->_label;
    v5->_label = (NSString *)v17;

    if (initWithConfiguration____onceToken != -1) {
      dispatch_once(&initWithConfiguration____onceToken, &__block_literal_global_36);
    }
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRV2NowPlayingController.queue", v19, (dispatch_queue_t)initWithConfiguration____globalQueue);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v20;
  }
  return v5;
}

void __50__MRV2NowPlayingController_initWithConfiguration___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.globalQueue", v2);
  v1 = (void *)initWithConfiguration____globalQueue;
  initWithConfiguration____globalQueue = (uint64_t)v0;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_updateLoadingEnabled)
  {
    v3 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> End loading updates", buf, 0xCu);
    }
  }
  id v4 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  helper = self->_helper;
  self->_helper = 0;

  [(MRV2NowPlayingController *)self setQueue:0];
  [(MRV2NowPlayingController *)self _onQueue_clearAllState];
  v6.receiver = self;
  v6.super_class = (Class)MRV2NowPlayingController;
  [(MRV2NowPlayingController *)&v6 dealloc];
}

- (void)beginLoadingUpdates
{
  id v4 = [(MRV2NowPlayingController *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRV2NowPlayingController_beginLoadingUpdates__block_invoke;
  v5[3] = &unk_1E57D2098;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __47__MRV2NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 20))
  {
    uint64_t v1 = result;
    v2 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Begin loading updates", buf, 0xCu);
    }

    if ([*(id *)(v1 + 32) isLoading])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:*(void *)(v1 + 40), *(void *)(v1 + 32), @"MRV2NowPlayingController.m", 137, @"Invalid parameter not satisfying: %@", @"!self.isLoading" object file lineNumber description];
    }
    return [*(id *)(v1 + 32) _reloadWithReason:@"Begin"];
  }
  return result;
}

- (void)destinationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MRV2NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MRV2NowPlayingController_destinationWithCompletion___block_invoke;
  v7[3] = &unk_1E57D03B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__MRV2NowPlayingController_destinationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 configuration];
  [v2 _resolveForConfiguration:v3 requestID:@"destinationWithCompletion" completion:*(void *)(a1 + 40)];
}

- (MRNowPlayingControllerDestination)destination
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  id v3 = [(MRV2NowPlayingController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MRV2NowPlayingController_destination__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingControllerDestination *)v4;
}

uint64_t __39__MRV2NowPlayingController_destination__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSString)debugDescription
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  id v3 = [(MRV2NowPlayingController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MRV2NowPlayingController_debugDescription__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __44__MRV2NowPlayingController_debugDescription__block_invoke(uint64_t a1)
{
  id v19 = [NSString alloc];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v3 + 32);
  uint64_t v18 = v2;
  uint64_t v16 = *(unsigned __int8 *)(v3 + 20);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 24);
  dispatch_queue_t v20 = [(id)v3 endpointObserver];
  v5 = [*(id *)(a1 + 32) playerPathInvalidationObserver];
  unsigned int v6 = [*(id *)(a1 + 32) registeredForNotifications];
  uint64_t v7 = [*(id *)(a1 + 32) needsImmediateReloadReason];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"None";
  }
  v10 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(void *)(a1 + 32) + 72));
  v11 = [*(id *)(*(void *)(a1 + 32) + 80) remainingIntervals];
  id v12 = MRCreateIndentedDebugDescriptionFromObject(v11);
  uint64_t v13 = [v19 initWithFormat:@"<%@ %p {\n   currentDestination=%@\n   updateLoadingEnabled=%u\n   loading=%u\n   endpointObserver=%@\n   playerPathInvalidationHandler=%@\n   registeredForNotifications=%u\n   needsImmediateReloadReason=%@\n   pendingDestination=%@\n   loadRetryTimer = %@}>\n", v18, v3, v17, v16, v4, v20, v5, v6, v9, v10, v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (void)_reloadWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [NSString alloc];
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  uint64_t v9 = (self->_incrementingRequestID + 1);
  self->_incrementingRequestID = v9;
  v10 = (void *)[v6 initWithFormat:@"%@-%d", v8, v9];

  v11 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ reloading<%@> for reason %@", buf, 0x20u);
  }

  [(MRV2NowPlayingController *)self _notifyDelegateOfInvalidation];
  id v12 = [(MRV2NowPlayingController *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__MRV2NowPlayingController__reloadWithReason___block_invoke;
  v13[3] = &unk_1E57D2110;
  v13[4] = self;
  [(MRV2NowPlayingController *)self _loadNowPlayingStateForConfiguration:v12 requestID:v10 completion:v13];
}

void __46__MRV2NowPlayingController__reloadWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v8 = [v7 cancelableOperations];
    [v8 invalidate];

    [*(id *)(a1 + 32) _configureReloadTimerForError:v5];
    [*(id *)(a1 + 32) _notifyDelegateOfError:v5];
  }
  else
  {
    uint64_t v9 = (void *)v7[10];
    v7[10] = 0;

    [v10 setDestination:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(a1 + 32) _notifyDelegateOfNewResponse:v10];
  }
}

- (void)_loadNowPlayingStateForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v12);

  if ([(MRV2NowPlayingController *)self isLoading])
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"MRV2NowPlayingController.m", 217, @"Invalid parameter not satisfying: %@", @"!self.isLoading" object file lineNumber description];
  }
  [(MRV2NowPlayingController *)self setIsLoading:1];
  uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@.LoadForConfiguration<%p>", objc_opt_class(), self];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  v15 = [MRBlockGuard alloc];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke;
  v43[3] = &unk_1E57D1810;
  id v16 = v13;
  id v44 = v16;
  id v17 = v10;
  id v45 = v17;
  __int16 v18 = [(MRBlockGuard *)v15 initWithTimeout:v16 reason:v43 handler:60.0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53;
  v35[3] = &unk_1E57D3318;
  id v19 = v9;
  id v36 = v19;
  id v20 = v16;
  id v37 = v20;
  id v21 = v17;
  id v38 = v21;
  id v22 = v14;
  id v39 = v22;
  objc_super v23 = v18;
  v40 = v23;
  id v24 = v11;
  v41 = self;
  id v42 = v24;
  v25 = (void *)MEMORY[0x1997190F0](v35);
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v20, v21];
  v27 = v26;
  if (v19) {
    [v26 appendFormat:@" for %@", v19];
  }
  v28 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v27;
    _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_67;
  v32[3] = &unk_1E57D3340;
  id v33 = v21;
  id v34 = v25;
  v32[4] = self;
  id v29 = v21;
  id v30 = v25;
  [(MRV2NowPlayingController *)self _resolveForConfiguration:v19 requestID:v29 completion:v32];
}

void __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    id v10 = @"Its been 60 seconds and still waiting for response..";
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }
}

void __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    __int16 v7 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>", objc_opt_class(), v5];
  }
  else {
    __int16 v7 = 0;
  }
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>", objc_opt_class(), *(void *)(a1 + 32)];
  __int16 v9 = _MRLogForCategory(0xAuLL);
  id v10 = v9;
  if (!v6 && v7)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v34 = v12;
        __int16 v35 = 2114;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        id v38 = v7;
        __int16 v39 = 2114;
        v40 = v8;
        __int16 v41 = 2048;
        uint64_t v42 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v10;
        uint32_t v18 = 52;
LABEL_19:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_20;
      }
      goto LABEL_25;
    }
    if (!v11) {
      goto LABEL_25;
    }
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 48);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = v27;
    __int16 v35 = 2114;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v7;
    __int16 v39 = 2048;
    v40 = v29;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_18:
    id v17 = v10;
    uint32_t v18 = 42;
    goto LABEL_19;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v19)
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        id v38 = v6;
        __int16 v39 = 2114;
        v40 = v8;
        __int16 v41 = 2048;
        uint64_t v42 = v22;
        _os_log_error_impl(&dword_194F3C000, v10, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

        goto LABEL_25;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v10);
    }
    goto LABEL_25;
  }
  BOOL v23 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v23) {
      goto LABEL_25;
    }
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v30;
    __int16 v35 = 2114;
    uint64_t v36 = v31;
    __int16 v37 = 2048;
    id v38 = v32;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v10;
    uint32_t v18 = 32;
    goto LABEL_19;
  }
  if (v23)
  {
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = v24;
    __int16 v35 = 2114;
    uint64_t v36 = v25;
    __int16 v37 = 2114;
    id v38 = v8;
    __int16 v39 = 2048;
    v40 = v26;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_18;
  }
LABEL_25:

  [*(id *)(a1 + 64) disarm];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  [*(id *)(a1 + 72) setIsLoading:0];
}

uint64_t __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_67(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _loadNowPlayingStateForResolvedPlayerPath:a2 requestID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)_resolveForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)[[NSString alloc] initWithFormat:@"%@.resolveForConfiguration<%p>", objc_opt_class(), self];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v13 = [MRBlockGuard alloc];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke;
  v78[3] = &unk_1E57D1810;
  id v14 = v11;
  id v79 = v14;
  id v15 = v9;
  id v80 = v15;
  id v16 = [(MRBlockGuard *)v13 initWithTimeout:v14 reason:v78 handler:60.0];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke_72;
  v72[3] = &unk_1E57D3368;
  v72[4] = self;
  id v17 = v14;
  id v73 = v17;
  id v18 = v15;
  id v74 = v18;
  id v19 = v12;
  id v75 = v19;
  v71 = v16;
  v76 = v71;
  id v20 = v10;
  uint64_t v21 = v8;
  id v22 = v20;
  id v77 = v20;
  BOOL v23 = (void (**)(void, void, void))MEMORY[0x1997190F0](v72);
  id v24 = [NSString alloc];
  uint64_t v25 = [v21 destination];
  v26 = (void *)[v24 initWithFormat:@"%@->%@", v25, self->_destination];

  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v17, v18];
  uint64_t v28 = v27;
  if (v26) {
    [v27 appendFormat:@" for %@", v26];
  }
  id v29 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v82 = v28;
    _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v30 = [(MRNowPlayingControllerDestination *)self->_destination resolvedPlayerPath];

  if (!v30)
  {
    v32 = [(MRNowPlayingControllerDestination *)self->_destination unresolvedPlayerPath];

    destination = self->_destination;
    if (v32)
    {
      uint64_t v31 = [(MRNowPlayingControllerDestination *)destination unresolvedPlayerPath];
      [(MRV2NowPlayingController *)self _resolveForUnresolvedPlayerPath:v31 requestID:v18 completion:v23];
      goto LABEL_22;
    }
    id v70 = v22;
    uint64_t v34 = [(MRDestination *)destination endpoint];

    __int16 v35 = self->_destination;
    if (v34)
    {
      uint64_t v31 = [(MRDestination *)v35 endpoint];
      v64 = [(MRV2NowPlayingController *)self configuration];
      v62 = [v64 destination];
      v58 = [v62 playerPath];
      v57 = [v58 client];
      uint64_t v36 = [(MRV2NowPlayingController *)self configuration];
      [v36 destination];
      __int16 v37 = v68 = v19;
      [v37 playerPath];
      id v38 = v66 = v21;
      __int16 v39 = [v38 player];
      [(MRV2NowPlayingController *)self _resolveForEndpoint:v31 client:v57 player:v39 requestID:v18 completion:v23];

      uint64_t v21 = v66;
      id v19 = v68;

LABEL_21:
      id v22 = v70;
      goto LABEL_22;
    }
    if ([(MRNowPlayingControllerDestination *)v35 isEndpointSet])
    {
      uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:24 description:@"endpoint observer returned a nil endpoint"];
      ((void (**)(void, void, void *))v23)[2](v23, 0, v31);
      goto LABEL_21;
    }
    id v69 = v19;
    v40 = [v21 destination];
    __int16 v41 = [v40 outputDeviceUID];

    uint64_t v42 = [v21 destination];
    uint64_t v31 = v42;
    v67 = v21;
    if (v41)
    {
      uint64_t v59 = [v42 outputDeviceUID];
      v65 = [v21 destination];
      v63 = [v65 playerPath];
      uint64_t v43 = [v63 client];
      id v44 = [v21 destination];
      id v45 = [v44 playerPath];
      v46 = [v45 player];
      v47 = self;
      uint64_t v48 = (void *)v59;
      [(MRV2NowPlayingController *)v47 _resolveForOutputDeviceUID:v59 client:v43 player:v46 requestID:v18 completion:v23];
    }
    else
    {
      v49 = [v42 outputContextUID];

      v50 = [v21 destination];
      uint64_t v31 = v50;
      if (v49)
      {
        uint64_t v60 = [v50 outputContextUID];
        v65 = [v21 destination];
        v63 = [v65 playerPath];
        uint64_t v43 = [v63 client];
        id v44 = [v21 destination];
        id v45 = [v44 playerPath];
        v46 = [v45 player];
        v51 = self;
        uint64_t v48 = (void *)v60;
        [(MRV2NowPlayingController *)v51 _resolveForOutputContextUID:v60 client:v43 player:v46 requestID:v18 completion:v23];
      }
      else
      {
        v52 = [v50 endpoint];

        v53 = [v21 destination];
        uint64_t v31 = v53;
        if (!v52)
        {
          v55 = [v53 playerPath];

          if (v55)
          {
            uint64_t v31 = [v21 destination];
            v56 = [v31 playerPath];
            [(MRV2NowPlayingController *)self _resolveForUnresolvedPlayerPath:v56 requestID:v18 completion:v23];
          }
          else
          {
            uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"no destination information in configuration"];
            ((void (**)(void, void, void *))v23)[2](v23, 0, v31);
          }
          goto LABEL_20;
        }
        uint64_t v61 = [v53 endpoint];
        v65 = [v21 destination];
        v63 = [v65 playerPath];
        uint64_t v43 = [v63 client];
        id v44 = [v21 destination];
        id v45 = [v44 playerPath];
        v46 = [v45 player];
        v54 = self;
        uint64_t v48 = (void *)v61;
        [(MRV2NowPlayingController *)v54 _resolveForEndpoint:v61 client:v43 player:v46 requestID:v18 completion:v23];
      }
    }

    uint64_t v21 = v67;
LABEL_20:
    id v19 = v69;
    goto LABEL_21;
  }
  uint64_t v31 = [(MRNowPlayingControllerDestination *)self->_destination resolvedPlayerPath];
  ((void (**)(void, void *, void))v23)[2](v23, v31, 0);
LABEL_22:
}

void __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    id v10 = @"Its been 60 seconds and still waiting for response..";
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }
}

void __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  __int16 v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v35 = 138544386;
        uint64_t v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = v11;
        __int16 v39 = 2112;
        id v40 = v5;
        __int16 v41 = 2114;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        uint64_t v44 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v35 = 138544130;
    uint64_t v36 = v29;
    __int16 v37 = 2114;
    uint64_t v38 = v30;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2048;
    uint64_t v42 = v31;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 32);
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v35 = 138544386;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = *(void *)(a1 + 40);
    uint64_t v33 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v35 = 138543874;
    uint64_t v36 = v32;
    __int16 v37 = 2114;
    uint64_t v38 = v33;
    __int16 v39 = 2048;
    id v40 = v34;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v27 = *(void **)(*(void *)(a1 + 32) + 32);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v35 = 138544130;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    uint64_t v38 = v25;
    __int16 v39 = 2114;
    id v40 = v27;
    __int16 v41 = 2048;
    uint64_t v42 = v28;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  [*(id *)(a1 + 64) disarm];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v17);

  uint32_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@.resolveForOutputDevice<%p>", objc_opt_class(), self];
  BOOL v19 = [MEMORY[0x1E4F1C9C8] now];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke;
  v41[3] = &unk_1E57D2610;
  id v31 = v16;
  id v42 = v31;
  uint64_t v20 = (void *)MEMORY[0x1997190F0](v41);
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v18, v15];
  uint64_t v22 = v21;
  if (v12) {
    [v21 appendFormat:@" for %@", v12];
  }
  uint64_t v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke_86;
  v32[3] = &unk_1E57D3390;
  id v33 = v12;
  id v34 = v18;
  id v35 = v15;
  id v36 = v19;
  __int16 v37 = self;
  id v38 = v13;
  id v39 = v14;
  id v40 = v20;
  id v24 = v20;
  id v25 = v14;
  id v26 = v13;
  id v27 = v19;
  id v28 = v15;
  id v29 = v18;
  id v30 = v12;
  [(MRV2NowPlayingController *)self _onQueue_retrieveEndpointForUID:v30 completion:v32];
}

uint64_t __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        id v13 = [v5 debugName];
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544386;
        uint64_t v40 = v18;
        __int16 v41 = 2114;
        uint64_t v42 = v19;
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 2114;
        uint64_t v46 = v20;
        __int16 v47 = 2048;
        uint64_t v48 = v22;
        uint64_t v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 48);
        id v13 = [v5 debugName];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544130;
        uint64_t v40 = v33;
        __int16 v41 = 2114;
        uint64_t v42 = v34;
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 2048;
        uint64_t v46 = v35;
        uint64_t v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 42;
      }
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 48);
        id v28 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544130;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        uint64_t v42 = v26;
        __int16 v43 = 2114;
        id v44 = v28;
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        id v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 40);
        uint64_t v37 = *(void *)(a1 + 48);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138543874;
        uint64_t v40 = v36;
        __int16 v41 = 2114;
        uint64_t v42 = v37;
        __int16 v43 = 2048;
        id v44 = v38;
        id v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v39 = 138544386;
    uint64_t v40 = v11;
    __int16 v41 = 2114;
    uint64_t v42 = v10;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    uint64_t v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v8);
  }
LABEL_21:

  [*(id *)(*(void *)(a1 + 64) + 32) setEndpoint:v5];
  [*(id *)(a1 + 64) _registerForEndpointChangesForOutputDeviceUID:*(void *)(a1 + 32)];
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else {
    [*(id *)(a1 + 64) _resolveForEndpoint:v5 client:*(void *)(a1 + 72) player:*(void *)(a1 + 80) requestID:*(void *)(a1 + 48) completion:*(void *)(a1 + 88)];
  }
}

- (void)_resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@.resolveForOutputContextUID<%p>", objc_opt_class(), self];
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __91__MRV2NowPlayingController__resolveForOutputContextUID_client_player_requestID_completion___block_invoke;
  v31[3] = &unk_1E57D3390;
  id v20 = v12;
  id v32 = v20;
  id v21 = v18;
  id v33 = v21;
  id v22 = v15;
  id v34 = v22;
  id v23 = v19;
  id v35 = v23;
  uint64_t v36 = self;
  id v30 = v13;
  id v37 = v30;
  id v24 = v14;
  id v38 = v24;
  id v25 = v16;
  id v39 = v25;
  uint64_t v26 = (void *)MEMORY[0x1997190F0](v31);
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v21, v22];
  id v28 = v27;
  if (v20) {
    [v27 appendFormat:@" for %@", v20];
  }
  uint64_t v29 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v41 = v28;
    _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  [(MRV2NowPlayingController *)self _onQueue_retrieveEndpointForContextUID:v20 completion:v26];
}

void __91__MRV2NowPlayingController__resolveForOutputContextUID_client_player_requestID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v15 = [v5 debugName];

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        id v13 = [v5 debugName];
        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544386;
        uint64_t v40 = v18;
        __int16 v41 = 2114;
        uint64_t v42 = v19;
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 2114;
        uint64_t v46 = v20;
        __int16 v47 = 2048;
        uint64_t v48 = v22;
        id v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 48);
        id v13 = [v5 debugName];
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544130;
        uint64_t v40 = v33;
        __int16 v41 = 2114;
        uint64_t v42 = v34;
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 2048;
        uint64_t v46 = v35;
        id v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v24 = v8;
        uint32_t v25 = 42;
      }
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 48);
        id v28 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138544130;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        uint64_t v42 = v26;
        __int16 v43 = 2114;
        id v44 = v28;
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        id v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = *(void *)(a1 + 40);
        uint64_t v37 = *(void *)(a1 + 48);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v39 = 138543874;
        uint64_t v40 = v36;
        __int16 v41 = 2114;
        uint64_t v42 = v37;
        __int16 v43 = 2048;
        id v44 = v38;
        id v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v39 = 138544386;
    uint64_t v40 = v11;
    __int16 v41 = 2114;
    uint64_t v42 = v10;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    uint64_t v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v8);
  }
LABEL_21:

  if (v5) {
    [*(id *)(a1 + 64) _resolveForEndpoint:v5 client:*(void *)(a1 + 72) player:*(void *)(a1 + 80) requestID:*(void *)(a1 + 48) completion:*(void *)(a1 + 88)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

- (void)_resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v35 = a5;
  id v34 = a4;
  id v15 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v15);

  uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"%@.resolveForEndpoint<%p>", objc_opt_class(), self];
  BOOL v17 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v18 = [MRBlockGuard alloc];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke;
  v46[3] = &unk_1E57D1810;
  id v19 = v16;
  id v47 = v19;
  id v20 = v13;
  id v48 = v20;
  id v21 = [(MRBlockGuard *)v18 initWithTimeout:v19 reason:v46 handler:60.0];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_94;
  v43[3] = &unk_1E57D21B0;
  uint64_t v22 = v21;
  id v44 = v22;
  id v23 = v14;
  id v45 = v23;
  id v24 = (void *)MEMORY[0x1997190F0](v43);
  uint32_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v19, v20];
  uint64_t v26 = [v12 debugName];

  if (v26)
  {
    uint64_t v27 = [v12 debugName];
    [v25 appendFormat:@" for %@", v27];
  }
  id v28 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v25;
    _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_95;
  v36[3] = &unk_1E57D3368;
  id v37 = v12;
  id v38 = v19;
  id v39 = v20;
  id v40 = v17;
  __int16 v41 = self;
  id v42 = v24;
  id v29 = v24;
  id v30 = v17;
  id v31 = v20;
  id v32 = v19;
  id v33 = v12;
  [(MRV2NowPlayingController *)self _createUnresolvedPlayerPathForEndpoint:v33 client:v34 player:v35 completion:v36];
}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = @"Its been 60 seconds and still waiting for response..";
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }
}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 disarm];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) debugName];

  uint64_t v8 = _MRLogForCategory(0xAuLL);
  __int16 v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10) {
        goto LABEL_25;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      id v13 = [*(id *)(a1 + 32) debugName];
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v40 = 138544386;
      uint64_t v41 = v12;
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      __int16 v44 = 2112;
      id v45 = v5;
      __int16 v46 = 2114;
      id v47 = v13;
      __int16 v48 = 2048;
      uint64_t v49 = v15;
      uint64_t v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      BOOL v17 = v9;
      uint32_t v18 = 52;
LABEL_13:
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v40, v18);

LABEL_24:
LABEL_25:

      [*(id *)(*(void *)(a1 + 64) + 32) setUnresolvedPlayerPath:v5];
      [*(id *)(a1 + 64) _registerForEndpointInvalidations:*(void *)(a1 + 32)];
      if ([*(id *)(a1 + 32) isConnected])
      {
        [*(id *)(a1 + 64) _resolveForUnresolvedPlayerPath:v5 requestID:*(void *)(a1 + 48) completion:*(void *)(a1 + 72)];
      }
      else
      {
        uint64_t v38 = *(void *)(a1 + 72);
        id v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121 description:@"connection succeded but then shortly after disconnected"];
        (*(void (**)(uint64_t, void, void *))(v38 + 16))(v38, 0, v39);
      }
      goto LABEL_28;
    }
    if (!v10) {
      goto LABEL_25;
    }
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v40 = 138544130;
    uint64_t v41 = v29;
    __int16 v42 = 2114;
    uint64_t v43 = v30;
    __int16 v44 = 2112;
    id v45 = v5;
    __int16 v46 = 2048;
    id v47 = v31;
    id v32 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v33 = v9;
    uint32_t v34 = 42;
    goto LABEL_23;
  }
  if (!v6)
  {
    BOOL v25 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v25) {
        goto LABEL_25;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v26 = *(void *)(a1 + 48);
      id v13 = [*(id *)(a1 + 32) debugName];
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v40 = 138544130;
      uint64_t v41 = v27;
      __int16 v42 = 2114;
      uint64_t v43 = v26;
      __int16 v44 = 2114;
      id v45 = v13;
      __int16 v46 = 2048;
      id v47 = v28;
      uint64_t v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      BOOL v17 = v9;
      uint32_t v18 = 42;
      goto LABEL_13;
    }
    if (!v25) {
      goto LABEL_25;
    }
    uint64_t v35 = *(void *)(a1 + 40);
    uint64_t v36 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v40 = 138543874;
    uint64_t v41 = v35;
    __int16 v42 = 2114;
    uint64_t v43 = v36;
    __int16 v44 = 2048;
    id v45 = v37;
    id v32 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v33 = v9;
    uint32_t v34 = 32;
LABEL_23:
    _os_log_impl(&dword_194F3C000, v33, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v40, v34);
    goto LABEL_24;
  }
  BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v19)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v22 = [*(id *)(a1 + 32) debugName];
      id v23 = [MEMORY[0x1E4F1C9C8] date];
      [v23 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v40 = 138544386;
      uint64_t v41 = v21;
      __int16 v42 = 2114;
      uint64_t v43 = v20;
      __int16 v44 = 2114;
      id v45 = v6;
      __int16 v46 = 2114;
      id v47 = v22;
      __int16 v48 = 2048;
      uint64_t v49 = v24;
      _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v40, 0x34u);
    }
  }
  else if (v19)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
  }

  [*(id *)(*(void *)(a1 + 64) + 32) setUnresolvedPlayerPath:v5];
  if ([v6 code] == 24) {
    objc_msgSend(*(id *)(a1 + 64), "_onQueue_clearStateForEndpoint");
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_28:
}

- (void)_resolveForUnresolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@.resolveForUnresolvedPlayerPath<%p>", objc_opt_class(), self];
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  id v14 = [MRBlockGuard alloc];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke;
  v39[3] = &unk_1E57D1810;
  id v15 = v12;
  id v40 = v15;
  id v16 = v9;
  id v41 = v16;
  BOOL v17 = [(MRBlockGuard *)v14 initWithTimeout:v15 reason:v39 handler:60.0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_102;
  v36[3] = &unk_1E57D21B0;
  uint32_t v18 = v17;
  id v37 = v18;
  id v19 = v10;
  id v38 = v19;
  uint64_t v20 = (void *)MEMORY[0x1997190F0](v36);
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v15, v16];
  uint64_t v22 = v21;
  if (v8) {
    [v21 appendFormat:@" for %@", v8];
  }
  id v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  [(MRV2NowPlayingController *)self _registerForPlayerPathInvalidationsForUnresolvedPlayerPath:v8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_103;
  v29[3] = &unk_1E57D3368;
  id v30 = v8;
  id v31 = v15;
  id v32 = v16;
  id v33 = v13;
  uint32_t v34 = self;
  id v35 = v20;
  id v24 = v20;
  id v25 = v13;
  id v26 = v16;
  id v27 = v15;
  id v28 = v8;
  [(MRV2NowPlayingController *)self _resolvePlayerPath:v28 requestID:v26 completion:v29];
}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    id v10 = @"Its been 60 seconds and still waiting for response..";
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }
}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 disarm];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  __int16 v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 32);
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
        int v37 = 138544386;
        uint64_t v38 = v12;
        __int16 v39 = 2114;
        uint64_t v40 = v11;
        __int16 v41 = 2112;
        id v42 = v5;
        __int16 v43 = 2114;
        uint64_t v44 = v13;
        __int16 v45 = 2048;
        uint64_t v46 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        BOOL v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, v18);
      }
LABEL_17:

      objc_msgSend(*(id *)(a1 + 64), "onQueue_setResolvedPlayerPath:", v5);
      id v33 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
      goto LABEL_23;
    }
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v37 = 138544130;
    uint64_t v38 = v30;
    __int16 v39 = 2114;
    uint64_t v40 = v31;
    __int16 v41 = 2112;
    id v42 = v5;
    __int16 v43 = 2048;
    uint64_t v44 = v32;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    BOOL v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (!v6)
  {
    BOOL v25 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (!v25) {
        goto LABEL_17;
      }
      uint64_t v34 = *(void *)(a1 + 40);
      uint64_t v35 = *(void *)(a1 + 48);
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v37 = 138543874;
      uint64_t v38 = v34;
      __int16 v39 = 2114;
      uint64_t v40 = v35;
      __int16 v41 = 2048;
      id v42 = v36;
      id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      BOOL v17 = v9;
      uint32_t v18 = 32;
      goto LABEL_16;
    }
    if (!v25) {
      goto LABEL_17;
    }
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    id v28 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v37 = 138544130;
    uint64_t v38 = v27;
    __int16 v39 = 2114;
    uint64_t v40 = v26;
    __int16 v41 = 2114;
    id v42 = v28;
    __int16 v43 = 2048;
    uint64_t v44 = v29;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
  BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v19)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = [MEMORY[0x1E4F1C9C8] date];
      [v23 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v37 = 138544386;
      uint64_t v38 = v21;
      __int16 v39 = 2114;
      uint64_t v40 = v20;
      __int16 v41 = 2114;
      id v42 = v6;
      __int16 v43 = 2114;
      uint64_t v44 = v22;
      __int16 v45 = 2048;
      uint64_t v46 = v24;
      _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);
    }
  }
  else if (v19)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
  }

  if ([v6 code] == 5)
  {
    [*(id *)(a1 + 64) _unregisterForPlayerPathInvalidations];
    objc_msgSend(*(id *)(a1 + 64), "_onQueue_clearStateForUnresolvedPlayerPath");
  }
  id v33 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_23:
  v33();
}

- (void)_loadNowPlayingStateForResolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v12);

  if (([v9 isResolved] & 1) == 0)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"MRV2NowPlayingController.m", 419, @"Invalid parameter not satisfying: %@", @"resolvedPlayerPath.isResolved" object file lineNumber description];
  }
  uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@.LoadForResolvedPlayerPath<%p>", objc_opt_class(), self];
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v15 = [MRBlockGuard alloc];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke;
  v49[3] = &unk_1E57D1810;
  id v16 = v13;
  id v50 = v16;
  id v17 = v10;
  id v51 = v17;
  uint32_t v18 = [(MRBlockGuard *)v15 initWithTimeout:v16 reason:v49 handler:60.0];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_110;
  v42[3] = &unk_1E57D33B8;
  id v19 = v9;
  id v43 = v19;
  id v20 = v16;
  id v44 = v20;
  id v21 = v17;
  id v45 = v21;
  id v22 = v14;
  id v46 = v22;
  id v23 = v18;
  uint64_t v47 = v23;
  id v24 = v11;
  id v48 = v24;
  BOOL v25 = (void (**)(void, void, void))MEMORY[0x1997190F0](v42);
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v20, v21];
  uint64_t v27 = v26;
  if (v19) {
    [v26 appendFormat:@" for %@", v19];
  }
  id v28 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v27;
    _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  [(MRV2NowPlayingController *)self _registerNotificationHandlersForResolvedPlayerPath:v19];
  id v41 = 0;
  uint64_t v29 = [(MRV2NowPlayingController *)self _loadNowPlayingStateForPlayerPath:v19 error:&v41];
  id v30 = v41;
  if (!v30
    && [(MRV2NowPlayingController *)self shouldDeferArtworkRequestForConfiguration:self->_configuration])
  {
    [(MRV2NowPlayingController *)self cancelableOperations];
    v31 = id v36 = v22;
    uint64_t v35 = [(MRV2NowPlayingController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_111;
    block[3] = &unk_1E57D1B18;
    id v38 = v29;
    __int16 v39 = self;
    id v40 = v31;
    id v32 = v31;
    id v22 = v36;
    id v34 = v32;
    dispatch_async(v35, block);
  }
  ((void (**)(void, void *, id))v25)[2](v25, v29, v30);
}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543874;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    id v10 = @"Its been 60 seconds and still waiting for response..";
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }
}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  __int16 v9 = v8;
  if (!v6)
  {
    BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v16) {
        goto LABEL_14;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      id v19 = *(void **)(a1 + 32);
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v27 = 138544130;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      __int16 v31 = 2114;
      id v32 = v19;
      __int16 v33 = 2048;
      uint64_t v34 = v20;
      id v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v22 = v9;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v16) {
        goto LABEL_14;
      }
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v27 = 138543874;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      uint64_t v30 = v25;
      __int16 v31 = 2048;
      id v32 = v26;
      id v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v22 = v9;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, v23);
    goto LABEL_13;
  }
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v27 = 138544386;
      uint64_t v28 = v12;
      __int16 v29 = 2114;
      uint64_t v30 = v11;
      __int16 v31 = 2114;
      id v32 = v6;
      __int16 v33 = 2114;
      uint64_t v34 = v13;
      __int16 v35 = 2048;
      uint64_t v36 = v15;
      _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x34u);
LABEL_13:
    }
  }
  else if (v10)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_53_cold_1(a1, v6, v9);
  }
LABEL_14:

  [*(id *)(a1 + 64) disarm];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_111(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackQueue];
  uint64_t v3 = [v2 contentItems];
  objc_msgSend(v3, "msv_map:", &__block_literal_global_114_0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) _requestPlaybackQueueArtworkForIdentifiers:v4 operationQueue:*(void *)(a1 + 48)];
}

uint64_t __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  int v92 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__10;
  v87 = __Block_byref_object_dispose__10;
  id v88 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  id v80 = __Block_byref_object_copy__10;
  v81 = __Block_byref_object_dispose__10;
  id v82 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  id v74 = __Block_byref_object_copy__10;
  id v75 = __Block_byref_object_dispose__10;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  id v68 = __Block_byref_object_copy__10;
  id v69 = __Block_byref_object_dispose__10;
  id v70 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__10;
  v63 = __Block_byref_object_dispose__10;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__10;
  v57 = __Block_byref_object_dispose__10;
  id v58 = 0;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__10;
  id v51 = __Block_byref_object_dispose__10;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__10;
  id v45 = __Block_byref_object_dispose__10;
  id v46 = 0;
  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.callbackQueue", v8);

  BOOL v10 = [(MRV2NowPlayingController *)self configuration];
  int v11 = [v10 requestSupportedCommands];

  if (v11)
  {
    dispatch_group_enter(v7);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
    v37[3] = &unk_1E57D21D8;
    __int16 v39 = &v71;
    id v40 = &v65;
    id v38 = v7;
    [(MRV2NowPlayingController *)self _requestSupportedCommandsForPlayerPath:v6 queue:v9 completion:v37];
  }
  uint64_t v12 = [(MRV2NowPlayingController *)self configuration];
  int v13 = [v12 requestPlaybackState];

  if (v13)
  {
    dispatch_group_enter(v7);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
    v34[3] = &unk_1E57D2200;
    uint64_t v36 = &v89;
    __int16 v35 = v7;
    MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v34);
  }
  id v14 = [(MRV2NowPlayingController *)self configuration];
  uint64_t v15 = [v14 playbackQueueRequest];

  if (v15)
  {
    dispatch_group_enter(v7);
    BOOL v16 = [(MRV2NowPlayingController *)self effectivePlaybackQueueRequest];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
    v30[3] = &unk_1E57D33E0;
    id v32 = &v83;
    __int16 v33 = &v77;
    __int16 v31 = v7;
    [(MRV2NowPlayingController *)self _requestPlaybackQueueForPlayerPath:v6 request:v16 queue:v9 completion:v30];
  }
  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestLastPlayingDate])
  {
    dispatch_group_enter(v7);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
    v26[3] = &unk_1E57D3408;
    uint64_t v28 = &v59;
    __int16 v29 = &v53;
    int v27 = v7;
    [(MRV2NowPlayingController *)self _requestPlayerLastPlayingDateForPlayerPath:v6 queue:v9 completion:v26];
  }
  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestClientProperties])
  {
    dispatch_group_enter(v7);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
    v22[3] = &unk_1E57D3430;
    uint64_t v24 = &v47;
    uint64_t v25 = &v41;
    uint32_t v23 = v7;
    [(MRV2NowPlayingController *)self _requestClientPropertiesForPlayerPath:v6 queue:v9 completion:v22];
  }
  dispatch_time_t v17 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v7, v17))
  {
    if (a4)
    {
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:26];
LABEL_20:
      uint64_t v20 = 0;
      *a4 = v18;
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v20 = 0;
    goto LABEL_22;
  }
  id v19 = (void *)v78[5];
  if (v19 || (id v19 = (void *)v66[5]) != 0 || (id v19 = (void *)v54[5]) != 0 || (id v19 = (void *)v42[5]) != 0)
  {
    if (a4)
    {
      id v18 = v19;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  uint64_t v20 = objc_alloc_init(MRNowPlayingPlayerResponse);
  [(MRNowPlayingPlayerResponse *)v20 setPlaybackQueue:v84[5]];
  [(MRNowPlayingPlayerResponse *)v20 setPlaybackState:*((unsigned int *)v90 + 6)];
  [(MRNowPlayingPlayerResponse *)v20 setSupportedCommands:v72[5]];
  [(MRNowPlayingPlayerResponse *)v20 setPlayerLastPlayingDate:v60[5]];
  [(MRNowPlayingPlayerResponse *)v20 setClientProperties:v48[5]];
LABEL_22:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);

  return v20;
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(MRV2NowPlayingController *)self setRequestingQueue:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__MRV2NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2278;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v13, v11, v15);
}

void __88__MRV2NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke(uint64_t a1, void *a2)
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
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [[MRPlaybackQueueRequest alloc] initWithIdentifiers:v13];

  long long v15 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];
  [v15 artworkHeight];
  -[MRPlaybackQueueRequest setArtworkHeight:](v14, "setArtworkHeight:");

  long long v16 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];
  [v16 artworkWidth];
  -[MRPlaybackQueueRequest setArtworkWidth:](v14, "setArtworkWidth:");

  id v17 = [NSString alloc];
  id v18 = [(MRV2NowPlayingController *)self label];
  uint64_t v19 = (void *)[v17 initWithFormat:@"artworkRequest<%@>", v18];
  [(MRPlaybackQueueRequest *)v14 setLabel:v19];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__MRV2NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v21[3] = &unk_1E57D2318;
  id v22 = v10;
  id v20 = v10;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v14, v12, v11, v21);
}

uint64_t __86__MRV2NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__MRV2NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E57D1380;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);
}

uint64_t __84__MRV2NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
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
  v12[2] = __88__MRV2NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v12[3] = &unk_1E57D2390;
  id v13 = v7;
  id v11 = v7;
  [(MRNowPlayingRequest *)v10 requestLastPlayingDateOnQueue:v8 completion:v12];
}

uint64_t __88__MRV2NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestClientPropertiesForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 client];
  id v11 = [v9 origin];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__MRV2NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E57D3458;
  id v14 = v7;
  id v12 = v7;
  MRMediaRemoteGetClientProperties((uint64_t)v10, (uint64_t)v11, v8, v13);
}

uint64_t __83__MRV2NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke;
  v18[3] = &unk_1E57D17C0;
  id v19 = v6;
  id v10 = v6;
  id v11 = [(MRV2NowPlayingController *)self label];
  id v12 = [(MRV2NowPlayingController *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke_2;
  v15[3] = &unk_1E57D23E0;
  long long v16 = v9;
  id v17 = v7;
  id v13 = v7;
  id v14 = v9;
  [(MRAVLightweightReconnaissanceSession *)v14 searchEndpointsWithPredicate:v18 timeout:v11 reason:v12 queue:v15 completion:7.0];
}

uint64_t __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 outputDevices];
  id v4 = [v3 firstObject];
  id v5 = [v4 groupContextID];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

void __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(MRNowPlayingControllerConfiguration *)self->_configuration discoveryPredicate];

  if (v9)
  {
    id v10 = [(MRNowPlayingControllerConfiguration *)self->_configuration discoveryPredicate];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v25[3] = &unk_1E57D23E0;
    v25[4] = self;
    id v26 = v7;
    ((void (**)(void, void *))v10)[2](v10, v25);

    id v11 = v26;
  }
  else if ([v6 isEqualToString:@"proactiveEndpoint"])
  {
    id v12 = [(MRV2NowPlayingController *)self queue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
    v23[3] = &unk_1E57D23B8;
    id v24 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v12, v23, 7.0);

    id v11 = v24;
  }
  else
  {
    if (![v6 isEqualToString:@"userSelectedEndpoint"])
    {
      id v14 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      long long v15 = [(MRV2NowPlayingController *)self label];
      long long v16 = [(MRV2NowPlayingController *)self queue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_5;
      v18[3] = &unk_1E57D23E0;
      id v19 = v14;
      id v20 = v7;
      id v17 = v14;
      [(MRAVLightweightReconnaissanceSession *)v17 searchEndpointsForOutputDeviceUID:v6 timeout:v15 reason:v16 queue:v18 completion:7.0];

      goto LABEL_8;
    }
    id v13 = [(MRV2NowPlayingController *)self queue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_4;
    v21[3] = &unk_1E57D23B8;
    id v22 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(0, v13, v21, 7.0);

    id v11 = v22;
  }

LABEL_8:
}

void __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = (void *)[v8 initWithMRError:47 userInfo:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_createUnresolvedPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v25 = @"MREndpointConnectionReasonUserInfoKey";
  id v14 = [(MRV2NowPlayingController *)self label];
  v26[0] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke;
  v20[3] = &unk_1E57D1120;
  id v23 = v12;
  id v24 = v13;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  [v18 connectToExternalDeviceWithUserInfo:v15 completion:v20];
}

void __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E57D2408;
  id v7 = v3;
  id v11 = a1[8];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) origin];
    if (v8)
    {
      id v3 = [MRPlayerPath alloc];
      id v4 = [*(id *)(a1 + 40) origin];
      id v5 = [(MRPlayerPath *)v3 initWithOrigin:v4 client:*(void *)(a1 + 48) player:*(void *)(a1 + 56)];

      id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 64);
      id v5 = (MRPlayerPath *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:5 description:@"Endpoint.Connect succeded with no origin"];
      id v6 = *(void (**)(void))(v7 + 16);
    }
    v6();
  }
}

- (void)_resolvePlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MRV2NowPlayingController *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MRV2NowPlayingController__resolvePlayerPath_requestID_completion___block_invoke;
  v13[3] = &unk_1E57D2610;
  id v14 = v8;
  id v12 = v8;
  MRMediaRemoteNowPlayingResolvePlayerPathWithID(v10, v9, 1, v11, v13);
}

void __68__MRV2NowPlayingController__resolvePlayerPath_requestID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_7;
  }
  if ([v5 isResolved])
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_7:
}

- (void)_onQueue_clearAllState
{
  id v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  loadRetryTimer = self->_loadRetryTimer;
  self->_loadRetryTimer = 0;

  [(MRV2NowPlayingController *)self _onQueue_clearStateForOutputDeviceUID];
}

- (void)_onQueue_clearStateForOutputDeviceUID
{
  id v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  [(MRV2NowPlayingController *)self _unregisterForEndpointChanges];

  [(MRV2NowPlayingController *)self _onQueue_clearStateForEndpoint];
}

- (void)_onQueue_clearStateForEndpoint
{
  id v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  [(MRV2NowPlayingController *)self _unregisterForEndpointInvalidations];
  [(MRV2NowPlayingController *)self _unregisterForPlayerPathInvalidations];
  [(MRNowPlayingControllerDestination *)self->_destination setEndpoint:0];

  [(MRV2NowPlayingController *)self _onQueue_clearStateForUnresolvedPlayerPath];
}

- (void)_onQueue_clearStateForUnresolvedPlayerPath
{
  id v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  [(MRNowPlayingControllerDestination *)self->_destination setUnresolvedPlayerPath:0];

  [(MRV2NowPlayingController *)self _onQueue_clearStateForResolvedPlayerPath];
}

- (void)_onQueue_clearStateForResolvedPlayerPath
{
  id v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  [(MRV2NowPlayingController *)self _unregisterNotificationHandlers];
  [(MRV2NowPlayingController *)self onQueue_setResolvedPlayerPath:0];
  id v5 = [(MRV2NowPlayingController *)self deferredContentItemsToMerge];
  [v5 removeAllObjects];
}

- (void)onQueue_setResolvedPlayerPath:(id)a3
{
  id v8 = a3;
  id v4 = [(MRV2NowPlayingController *)self queue];

  if (v4)
  {
    id v5 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v5);
  }
  id v6 = [(MRDestination *)self->_destination playerPath];
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [v8 isEqual:v6];

    if ((v7 & 1) == 0) {
      [(MRDestination *)self->_destination setPlayerPath:v8];
    }
  }
  [(MRV2NowPlayingController *)self _notifyDelegateOfPlayerPathChange:v8];
}

- (void)setHelper:(id)a3
{
  id v4 = (MRNowPlayingControllerHelper *)a3;
  obj = self;
  objc_sync_enter(obj);
  helper = obj->_helper;
  obj->_helper = v4;

  objc_sync_exit(obj);
}

- (MRNowPlayingControllerHelper)helper
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_helper;
  objc_sync_exit(v2);

  return v3;
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 didLoadResponse];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 playbackStateDidChange];
    v5[2](v5, v3);

    id v4 = v6;
  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 playbackQueueDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 contentItemsDidUpdate];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 contentItemsDidLoadArtwork];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 supportedCommandsDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 playerLastPlayingDateDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 clientPropertiesDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 playerPathDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfInvalidation
{
  uint64_t v2 = [(MRV2NowPlayingController *)self helper];
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = [v2 didInvalidate];
    v3[2]();

    uint64_t v2 = v4;
  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV2NowPlayingController *)self helper];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 didFailWithError];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v8[3] = &unk_1E57D1B18;
  id v9 = v4;
  id v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*((id *)a1[5] + 4) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_11;
    }
  }
  id v7 = +[MRUserSettings currentSettings];
  int v8 = [v7 verboseNowPlayingControllerLogging];
  id v9 = _MRLogForCategory(1uLL);
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_cold_1();
  }

  id v12 = [a1[5] deferredContentItemsToMerge];
  [v12 removeAllObjects];

  id v13 = (id *)a1[5];
  id v14 = [v13[4] resolvedPlayerPath];
  long long v15 = [a1[5] configuration];
  id v16 = [v15 playbackQueueRequest];
  id v17 = [v16 requestByRemovingArtwork];
  id v18 = [a1[5] queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_139;
  v21[3] = &unk_1E57D34A8;
  id v19 = a1[6];
  id v20 = a1[5];
  id v22 = v19;
  id v23 = v20;
  [v13 _requestPlaybackQueueForPlayerPath:v14 request:v17 queue:v18 completion:v21];

LABEL_11:
}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_2;
  v12[3] = &unk_1E57D3480;
  uint64_t v9 = a1 + 32;
  int v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(v9 + 8);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v5;
  id v16 = v8;
  id v10 = v5;
  id v11 = v6;
  [v8 addOperationWithBlock:v12];
}

uint64_t __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    return objc_msgSend(v2, "_notifyDelegateOfError:");
  }
  else
  {
    id v5 = [v2 configuration];
    id v6 = [v5 playbackQueueRequest];
    int v7 = [v6 includeArtwork];

    if (v7)
    {
      int v8 = *(void **)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 48) contentItemIdentifiers];
      [v8 _requestPlaybackQueueArtworkForIdentifiers:v9 operationQueue:*(void *)(a1 + 56)];
    }
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    return [v10 _notifyDelegateOfPlaybackQueueChange:v11];
  }
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = (id *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    int v7 = [v5 isEqual:v3];

    if (!v7) {
      goto LABEL_19;
    }
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v10 = objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_141);
  int v11 = [*(id *)(a1 + 40) requestingQueue];
  id v12 = +[MRUserSettings currentSettings];
  int v13 = [v12 verboseNowPlayingControllerLogging];
  uint64_t v14 = _MRLogForCategory(1uLL);
  id v15 = v14;
  if (v11)
  {
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *v4;
        int v19 = 138412546;
        id v20 = v16;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1();
    }

    id v18 = [*v4 deferredContentItemsToMerge];
    [v18 addObjectsFromArray:v9];
  }
  else
  {
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *v4;
        int v19 = 138412546;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2();
    }

    [*v4 _notifyDelegateOfUpdatedContentItemsWithContentItems:v9];
  }

LABEL_19:
}

uint64_t __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v8[3] = &unk_1E57D1B18;
  id v9 = v4;
  id v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = (uint64_t *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) resolvedPlayerPath];
  id v6 = v5;
  if (v5 == v3)
  {
  }
  else
  {
    char v7 = [v5 isEqual:v3];

    if ((v7 & 1) == 0)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  id v8 = [*(id *)(*v4 + 40) playbackQueueRequest];
  int v9 = [v8 includeArtwork];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) userInfo];
    id v6 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

    id v11 = objc_msgSend(v6, "msv_map:", &__block_literal_global_143);
    id v12 = +[MRUserSettings currentSettings];
    int v13 = [v12 verboseNowPlayingControllerLogging];
    uint64_t v14 = _MRLogForCategory(1uLL);
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *v4;
        int v17 = 138412546;
        uint64_t v18 = v16;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) _requestPlaybackQueueArtworkForIdentifiers:v11 operationQueue:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_requestPlaybackQueueArtworkForIdentifiers:(id)a3 operationQueue:(id)a4
{
  id v6 = a4;
  destination = self->_destination;
  id v8 = a3;
  int v9 = [(MRNowPlayingControllerDestination *)destination resolvedPlayerPath];
  id v10 = [(MRV2NowPlayingController *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke;
  v12[3] = &unk_1E57D34A8;
  id v13 = v6;
  uint64_t v14 = self;
  id v11 = v6;
  [(MRV2NowPlayingController *)self _requestContentItemArtwork:v8 forPlayerPath:v9 queue:v10 completion:v12];
}

void __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke_2;
  v11[3] = &unk_1E57D1B18;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "_notifyDelegateOfError:");
  }
  else
  {
    id v3 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [*(id *)(a1 + 48) contentItems];
      int v8 = 138412546;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v8, 0x16u);
    }
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) contentItems];
    [v6 _notifyDelegateOfUpdatedArtwork:v7];
  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = (uint64_t *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) resolvedPlayerPath];
  if (v5 == v3)
  {
  }
  else
  {
    id v6 = v5;
    int v7 = [v5 isEqual:v3];

    if (!v7) {
      goto LABEL_11;
    }
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];

  __int16 v10 = +[MRUserSettings currentSettings];
  int v11 = [v10 verboseNowPlayingControllerLogging];
  uint64_t v12 = _MRLogForCategory(1uLL);
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *v4;
      id v15 = MRMediaRemoteCopyPlaybackStateDescription([v9 intValue]);
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_cold_1(v4, v9, v13);
  }

  objc_msgSend((id)*v4, "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
LABEL_11:
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v8[3] = &unk_1E57D1B18;
  id v9 = v4;
  __int16 v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*((id *)a1[5] + 4) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_11;
    }
  }
  id v7 = +[MRUserSettings currentSettings];
  int v8 = [v7 verboseNowPlayingControllerLogging];
  id v9 = _MRLogForCategory(1uLL);
  __int16 v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1();
  }

  uint64_t v12 = (id *)a1[5];
  uint64_t v13 = [v12[4] resolvedPlayerPath];
  uint64_t v14 = [a1[5] queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_144;
  v17[3] = &unk_1E57D0568;
  id v15 = a1[6];
  id v16 = a1[5];
  id v18 = v15;
  id v19 = v16;
  [v12 _requestSupportedCommandsForPlayerPath:v13 queue:v14 completion:v17];

LABEL_11:
}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_2;
  v11[3] = &unk_1E57D1B18;
  int v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

uint64_t __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_notifyDelegateOfError:");
  }
  else {
    return [v2 _notifyDelegateOfSupportedCommandsChange:a1[6]];
  }
}

- (void)_handleClientStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self cancelableOperations];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke;
  v8[3] = &unk_1E57D1B18;
  id v9 = v4;
  id v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*((id *)a1[5] + 4) resolvedPlayerPath];
  if (v4 == v3)
  {
  }
  else
  {
    id v5 = v4;
    int v6 = [v4 isEqual:v3];

    if (!v6) {
      goto LABEL_11;
    }
  }
  id v7 = +[MRUserSettings currentSettings];
  int v8 = [v7 verboseNowPlayingControllerLogging];
  id v9 = _MRLogForCategory(1uLL);
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing clientStateDidChange.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_cold_1();
  }

  id v12 = (id *)a1[5];
  uint64_t v13 = [v12[4] resolvedPlayerPath];
  id v14 = [a1[5] queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_145;
  v17[3] = &unk_1E57D34D0;
  id v15 = a1[6];
  id v16 = a1[5];
  id v18 = v15;
  id v19 = v16;
  [v12 _requestClientPropertiesForPlayerPath:v13 queue:v14 completion:v17];

LABEL_11:
}

void __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_2;
  v11[3] = &unk_1E57D1B18;
  int v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

uint64_t __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_notifyDelegateOfError:");
  }
  else {
    return [v2 _notifyDelegateOfUpdatedClientProperties:a1[6]];
  }
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  id v4 = [(MRV2NowPlayingController *)self configuration];
  id v5 = [v4 destination];
  id v6 = [v5 outputDeviceUID];
  if ([v6 isEqualToString:@"proactiveEndpoint"])
  {
  }
  else
  {
    uint64_t v7 = [(MRV2NowPlayingController *)self configuration];
    int v8 = [v7 destination];
    id v9 = [v8 outputDeviceUID];
    int v10 = [v9 isEqualToString:@"userSelectedEndpoint"];

    if (!v10) {
      return;
    }
  }

  [(MRV2NowPlayingController *)self _handleEndpointChanged];
}

- (void)_registerForEndpointChangesForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(MRV2NowPlayingController *)self shouldObserveInvalidations]
    && ![(MRV2NowPlayingController *)self registeredForEndpointChanges])
  {
    if (([v4 isEqualToString:@"proactiveEndpoint"] & 1) != 0
      || [v4 isEqualToString:@"userSelectedEndpoint"])
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:self selector:sel__handleActiveSystemEndpointChangedNotification_ name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v7 = [MRAVEndpointObserver alloc];
      int v8 = [(MRV2NowPlayingController *)self label];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __74__MRV2NowPlayingController__registerForEndpointChangesForOutputDeviceUID___block_invoke;
      id v15 = &unk_1E57D24F0;
      objc_copyWeak(&v16, &location);
      id v9 = [(MRAVEndpointObserver *)v7 initWithOutputDeviceUID:v4 label:v8 callback:&v12];
      endpointObserver = self->_endpointObserver;
      self->_endpointObserver = v9;

      id v11 = [(MRV2NowPlayingController *)self endpointObserver];
      [v11 begin];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    [(MRV2NowPlayingController *)self setRegisteredForEndpointChanges:1];
  }
}

void __74__MRV2NowPlayingController__registerForEndpointChangesForOutputDeviceUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _handleEndpointChangedToEndpoint:a2];
    id WeakRetained = v4;
  }
}

- (void)_unregisterForEndpointChanges
{
  uint64_t v3 = [(MRV2NowPlayingController *)self configuration];
  id v4 = [v3 destination];
  id v5 = [v4 outputDeviceUID];
  if ([v5 isEqualToString:@"proactiveEndpoint"])
  {

LABEL_4:
    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
    goto LABEL_6;
  }
  id v6 = [(MRV2NowPlayingController *)self configuration];
  uint64_t v7 = [v6 destination];
  int v8 = [v7 outputDeviceUID];
  int v9 = [v8 isEqualToString:@"userSelectedEndpoint"];

  if (v9) {
    goto LABEL_4;
  }
  int v10 = [(MRV2NowPlayingController *)self endpointObserver];
  [v10 end];
LABEL_6:

  [(MRV2NowPlayingController *)self setRegisteredForEndpointChanges:0];
}

- (void)_registerForEndpointInvalidations:(id)a3
{
  id v6 = a3;
  id v4 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(MRV2NowPlayingController *)self shouldObserveInvalidations]
    && ![(MRV2NowPlayingController *)self registeredForEndpointInvalidations])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleEndpointDidDisconnectNotification_ name:@"MRAVEndpointDidDisconnectNotification" object:v6];

    [(MRV2NowPlayingController *)self setRegisteredForEndpointInvalidations:1];
  }
}

- (void)_unregisterForEndpointInvalidations
{
  uint64_t v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [(MRDestination *)self->_destination endpoint];
  [v5 removeObserver:self name:@"MRAVEndpointDidDisconnectNotification" object:v6];

  [(MRV2NowPlayingController *)self setRegisteredForEndpointInvalidations:0];
}

- (void)_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(MRV2NowPlayingController *)self shouldObserveInvalidations]
    && ![(MRV2NowPlayingController *)self registeredForPlayerPathInvalidations])
  {
    objc_initWeak(&location, self);
    id v6 = [MRNowPlayingPlayerPathInvalidationHandler alloc];
    uint64_t v7 = [(MRV2NowPlayingController *)self queue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __87__MRV2NowPlayingController__registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke;
    id v14 = &unk_1E57D24C8;
    objc_copyWeak(&v15, &location);
    int v8 = [(MRNowPlayingPlayerPathInvalidationHandler *)v6 initWithPlayerPath:v4 invalidateImmediatlyIfInvalid:0 queue:v7 invalidationCallback:&v11];

    int v9 = +[MRMediaRemoteServiceClient sharedServiceClient];
    int v10 = [v9 addPlayerPathInvalidationHandler:v8];
    [(MRV2NowPlayingController *)self setPlayerPathInvalidationObserver:v10];

    [(MRV2NowPlayingController *)self setRegisteredForPlayerPathInvalidations:1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __87__MRV2NowPlayingController__registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _handlePlayerPathInvalidatedWithPlayerPath:a2];
    id WeakRetained = v4;
  }
}

- (void)_unregisterForPlayerPathInvalidations
{
  uint64_t v3 = [(MRV2NowPlayingController *)self queue];

  if (v3)
  {
    id v4 = [(MRV2NowPlayingController *)self queue];
    dispatch_assert_queue_V2(v4);
  }
  id v5 = [(MRV2NowPlayingController *)self playerPathInvalidationObserver];

  if (v5)
  {
    id v6 = [(MRV2NowPlayingController *)self playerPathInvalidationObserver];
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v6);

    [(MRV2NowPlayingController *)self setPlayerPathInvalidationObserver:0];
  }

  [(MRV2NowPlayingController *)self setRegisteredForPlayerPathInvalidations:0];
}

- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3
{
  id v24 = a3;
  id v4 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = self;
  objc_sync_enter(v5);
  [(MRV2NowPlayingControllerOperationQueue *)v5->_cancelableOperations invalidate];
  id v6 = [MRV2NowPlayingControllerOperationQueue alloc];
  uint64_t v7 = [(MRV2NowPlayingController *)v5 queue];
  uint64_t v8 = [(MRV2NowPlayingControllerOperationQueue *)v6 initWithQueue:v7];
  cancelableOperations = v5->_cancelableOperations;
  v5->_cancelableOperations = (MRV2NowPlayingControllerOperationQueue *)v8;

  objc_sync_exit(v5);
  if ([(MRV2NowPlayingController *)v5 shouldObserveInvalidations]
    && ![(MRV2NowPlayingController *)v5 registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1);
    int v10 = [(MRV2NowPlayingController *)v5 configuration];
    uint64_t v11 = [v10 playbackQueueRequest];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:v5 selector:sel__handlePlaybackQueueChangedNotification_ name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:v5 selector:sel__handlePlaybackQueueContentItemsChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

      id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:v5 selector:sel__handlePlaybackQueueContentItemsArtworkChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];
    }
    id v15 = [(MRV2NowPlayingController *)v5 configuration];
    int v16 = [v15 requestPlaybackState];

    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v5 selector:sel__handlePlaybackStateChangedNotification_ name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];
    }
    id v18 = [(MRV2NowPlayingController *)v5 configuration];
    int v19 = [v18 requestSupportedCommands];

    if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v5 selector:sel__handleSupportedCommandsChangedNotification_ name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];
    }
    id v21 = [(MRV2NowPlayingController *)v5 configuration];
    int v22 = [v21 requestClientProperties];

    if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 addObserver:v5 selector:sel__handleClientStateDidChange_ name:@"kMRMediaRemoteApplicationClientStateDidChange" object:0];
    }
    [(MRV2NowPlayingController *)v5 setRegisteredForNotifications:1];
  }
}

- (void)_unregisterNotificationHandlers
{
  if ([(MRV2NowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0);
    uint64_t v3 = self;
    objc_sync_enter(v3);
    [(MRV2NowPlayingControllerOperationQueue *)v3->_cancelableOperations invalidate];
    cancelableOperations = v3->_cancelableOperations;
    v3->_cancelableOperations = 0;

    objc_sync_exit(v3);
    id v5 = [(MRV2NowPlayingController *)v3 configuration];
    id v6 = [v5 playbackQueueRequest];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:v3 name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

      uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:v3 name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

      int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:v3 name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];
    }
    int v10 = [(MRV2NowPlayingController *)v3 configuration];
    int v11 = [v10 requestPlaybackState];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 removeObserver:v3 name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];
    }
    uint64_t v13 = [(MRV2NowPlayingController *)v3 configuration];
    int v14 = [v13 requestSupportedCommands];

    if (v14)
    {
      id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 removeObserver:v3 name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];
    }
    int v16 = [(MRV2NowPlayingController *)v3 configuration];
    int v17 = [v16 requestClientProperties];

    if (v17)
    {
      id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 removeObserver:v3 name:@"kMRMediaRemoteApplicationClientStateDidChange" object:0];
    }
    [(MRV2NowPlayingController *)v3 setRegisteredForNotifications:0];
  }
}

- (void)_handleEndpointChanged
{
  uint64_t v2 = [(MRV2NowPlayingController *)self queue];
  msv_dispatch_async_on_queue();
}

uint64_t __50__MRV2NowPlayingController__handleEndpointChanged__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  if ([*(id *)(a1 + 32) isLoading])
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint change", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) pendingDestination];
    [v6 setEndpoint:0];

    return [*(id *)(a1 + 32) setEndpointChanged:1];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 _reloadWithReason:@"endpoint Change"];
  }
}

- (void)_handleEndpointChangedToEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRV2NowPlayingController *)self queue];
  id v6 = v4;
  msv_dispatch_async_on_queue();
}

void __61__MRV2NowPlayingController__handleEndpointChangedToEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v15 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) endpoint];
  id v3 = [v2 uniqueIdentifier];
  if (v15 == v3)
  {
  }
  else
  {
    char v4 = [v15 isEqual:v3];

    if (v4) {
      return;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = 0;

    if ([*(id *)(a1 + 40) isLoading])
    {
      uint64_t v7 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = [*(id *)(a1 + 32) debugName];
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        int v19 = v9;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint change to %@", buf, 0x16u);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [*(id *)(a1 + 40) pendingDestination];
      [v11 setEndpoint:v10];

      uint64_t v12 = [*(id *)(a1 + 40) pendingDestination];
      [v12 setIsEndpointSet:1];

      [*(id *)(a1 + 40) setEndpointChanged:1];
      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_clearStateForEndpoint");
    [*(id *)(*(void *)(a1 + 40) + 32) setEndpoint:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 32) setIsEndpointSet:1];
    id v13 = [NSString alloc];
    int v14 = [*(id *)(a1 + 32) debugName];
    id v15 = (id)[v13 initWithFormat:@"endpoint change top %@", v14];

    [*(id *)(a1 + 40) _reloadWithReason:v15];
  }
}

- (void)_handleEndpointInvalidated
{
  uint64_t v2 = [(MRV2NowPlayingController *)self queue];
  msv_dispatch_async_on_queue();
}

void __54__MRV2NowPlayingController__handleEndpointInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  char v4 = [*(id *)(*(void *)(a1 + 32) + 32) endpoint];

  if (v4)
  {
    if ([*(id *)(a1 + 32) isLoading])
    {
      uint64_t v5 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint invalidation", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v7 = [*(id *)(a1 + 32) pendingDestination];
      [v7 setEndpoint:0];

      [*(id *)(a1 + 32) setEndpointInvalidated:1];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
      uint64_t v8 = *(void **)(a1 + 32);
      [v8 _reloadWithReason:@"endpoint Invalidation"];
    }
  }
}

- (void)_handlePlayerPathInvalidatedWithPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRV2NowPlayingController *)self queue];
  id v6 = v4;
  msv_dispatch_async_on_queue();
}

uint64_t __71__MRV2NowPlayingController__handlePlayerPathInvalidatedWithPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  if ([*(id *)(a1 + 32) isLoading])
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing playerPath invalidation to %@", (uint8_t *)&v11, 0x16u);
    }

    if ([*(id *)(a1 + 40) isResolved]) {
      uint64_t v7 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v10 = [*(id *)(a1 + 32) pendingDestination];
    [v10 setResolvedPlayerPath:v7];

    return [*(id *)(a1 + 32) setPlayerPathInvalidated:1];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForUnresolvedPlayerPath");
    if ([*(id *)(a1 + 40) isResolved]) {
      [*(id *)(*(void *)(a1 + 32) + 32) setResolvedPlayerPath:*(void *)(a1 + 40)];
    }
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 _reloadWithReason:@"playerPath Invalidation"];
  }
}

- (void)_handleRetryTimerElapsed
{
  uint64_t v2 = [(MRV2NowPlayingController *)self queue];
  msv_dispatch_async_on_queue();
}

void __52__MRV2NowPlayingController__handleRetryTimerElapsed__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isLoading] & 1) == 0)
  {
    id v2 = [NSString alloc];
    id v3 = [*(id *)(a1 + 32) loadRetryTimer];
    [v3 currentInterval];
    id v5 = (id)objc_msgSend(v2, "initWithFormat:", @"LoadRetryTimer fired after %lf total seconds", v4);

    [*(id *)(a1 + 32) _reloadWithReason:v5];
  }
}

- (void)_configureReloadTimerForError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_configureReloadTimerForError__onceToken != -1) {
    dispatch_once(&_configureReloadTimerForError__onceToken, &__block_literal_global_183);
  }
  uint64_t v5 = _configureReloadTimerForError____ignorableErrorsForReload;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [(MRV2NowPlayingController *)self loadRetryTimer];

    if (v7)
    {
      uint64_t v8 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [(MRV2NowPlayingController *)self loadRetryTimer];
        [v9 timeUntilNextInterval];
        *(_DWORD *)buf = 138412546;
        id v24 = self;
        __int16 v25 = 2048;
        uint64_t v26 = v10;
        _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> LoadRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x16u);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController.loadRetryTimer<%p>", self);
      id v12 = objc_alloc(MEMORY[0x1E4F77A38]);
      __int16 v13 = +[MRUserSettings currentSettings];
      uint64_t v14 = [v13 destinationResolverReconRetryIntervals];
      uint64_t v15 = [(MRV2NowPlayingController *)self queue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke_191;
      v20[3] = &unk_1E57D12D0;
      objc_copyWeak(&v21, &location);
      int v16 = (void *)[v12 initWithIntervals:v14 name:v11 queue:v15 block:v20];
      [(MRV2NowPlayingController *)self setLoadRetryTimer:v16];

      uint64_t v17 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = [(MRV2NowPlayingController *)self loadRetryTimer];
        [v18 timeUntilNextInterval];
        *(_DWORD *)buf = 138412546;
        id v24 = self;
        __int16 v25 = 2048;
        uint64_t v26 = v19;
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Starting LoadRetryTimer to fire in %lf seconds", buf, 0x16u);
      }
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
  }
}

uint64_t __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke()
{
  _configureReloadTimerForError____ignorableErrorsForReload = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EE66F330];

  return MEMORY[0x1F41817F8]();
}

void __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke_191(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRetryTimerElapsed];
}

- (NSString)needsImmediateReloadReason
{
  if ([(MRV2NowPlayingController *)self needsImmediateReload])
  {
    if ([(MRV2NowPlayingController *)self endpointChanged])
    {
      id v3 = [&stru_1EE60E7D8 stringByAppendingString:@"|endpoint changed"];
    }
    else
    {
      id v3 = &stru_1EE60E7D8;
    }
    if ([(MRV2NowPlayingController *)self endpointInvalidated])
    {
      uint64_t v4 = [(__CFString *)v3 stringByAppendingString:@"|endpoint invalidation"];

      id v3 = (__CFString *)v4;
    }
    if ([(MRV2NowPlayingController *)self playerPathInvalidated])
    {
      uint64_t v5 = [(__CFString *)v3 stringByAppendingString:@"|playerPath invalidation"];

      id v3 = (__CFString *)v5;
    }
  }
  else
  {
    id v3 = &stru_1EE60E7D8;
  }

  return (NSString *)v3;
}

- (void)setIsLoading:(BOOL)a3
{
  id v3 = [(MRV2NowPlayingController *)self queue];
  msv_dispatch_sync_on_queue();
}

void __41__MRV2NowPlayingController_setIsLoading___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = v1;
    uint64_t v4 = *(unsigned char **)(a1 + 32);
    if (!v4[24])
    {
      if ([v4 needsImmediateReload])
      {
        id v9 = [*(id *)(a1 + 32) needsImmediateReloadReason];
        if ([*(id *)(a1 + 32) endpointChanged])
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
          [*(id *)(a1 + 32) setEndpointChanged:0];
        }
        if ([*(id *)(a1 + 32) endpointInvalidated])
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
          [*(id *)(a1 + 32) setEndpointInvalidated:0];
        }
        if ([*(id *)(a1 + 32) playerPathInvalidated])
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForUnresolvedPlayerPath");
          [*(id *)(a1 + 32) setPlayerPathInvalidated:0];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(a1 + 32) + 72));
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = 0;

        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"Previous %@", v9];
        [v7 _reloadWithReason:v8];
      }
    }
  }
}

- (BOOL)isLoading
{
  id v3 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_loading;
}

- (MRNowPlayingControllerDestination)pendingDestination
{
  id v3 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  pendingDestination = self->_pendingDestination;
  if (!pendingDestination)
  {
    uint64_t v5 = (MRNowPlayingControllerDestination *)[(MRNowPlayingControllerDestination *)self->_destination copy];
    uint64_t v6 = self->_pendingDestination;
    self->_pendingDestination = v5;

    pendingDestination = self->_pendingDestination;
  }

  return pendingDestination;
}

- (BOOL)shouldObserveInvalidations
{
  uint64_t v2 = [(MRV2NowPlayingController *)self configuration];
  char v3 = [v2 isSingleShot] ^ 1;

  return v3;
}

- (BOOL)needsImmediateReload
{
  char v3 = [(MRV2NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(MRV2NowPlayingController *)self endpointChanged]
    || [(MRV2NowPlayingController *)self endpointInvalidated])
  {
    return 1;
  }

  return [(MRV2NowPlayingController *)self playerPathInvalidated];
}

- (BOOL)updateLoadingEnabled
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(MRV2NowPlayingController *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRV2NowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __48__MRV2NowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (BOOL)shouldDeferArtworkRequestForConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 isSingleShot])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 playbackQueueRequest];
    char v4 = [v5 includeArtwork];
  }
  return v4;
}

- (id)effectivePlaybackQueueRequest
{
  id v3 = [(MRV2NowPlayingController *)self configuration];
  BOOL v4 = [(MRV2NowPlayingController *)self shouldDeferArtworkRequestForConfiguration:v3];
  uint64_t v5 = [v3 playbackQueueRequest];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 requestByRemovingArtwork];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (MRV2NowPlayingControllerOperationQueue)cancelableOperations
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_cancelableOperations;
  objc_sync_exit(v2);

  return v3;
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

- (BOOL)registeredForEndpointInvalidations
{
  return self->_registeredForEndpointInvalidations;
}

- (void)setRegisteredForEndpointInvalidations:(BOOL)a3
{
  self->_registeredForEndpointInvalidations = a3;
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

- (BOOL)endpointChanged
{
  return self->_endpointChanged;
}

- (void)setEndpointChanged:(BOOL)a3
{
  self->_endpointChanged = a3;
}

- (BOOL)endpointInvalidated
{
  return self->_endpointInvalidated;
}

- (void)setEndpointInvalidated:(BOOL)a3
{
  self->_endpointInvalidated = a3;
}

- (BOOL)playerPathInvalidated
{
  return self->_playerPathInvalidated;
}

- (void)setPlayerPathInvalidated:(BOOL)a3
{
  self->_playerPathInvalidated = a3;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (void)setPendingDestination:(id)a3
{
}

- (MSVVariableIntervalTimer)loadRetryTimer
{
  return self->_loadRetryTimer;
}

- (void)setLoadRetryTimer:(id)a3
{
}

- (int)incrementingRequestID
{
  return self->_incrementingRequestID;
}

- (void)setIncrementingRequestID:(int)a3
{
  self->_incrementingRequestID = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setCancelableOperations:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_cancelableOperations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loadRetryTimer, 0);
  objc_storeStrong((id *)&self->_pendingDestination, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", v2, v3, v4, v5, 2u);
}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.");
}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.");
}

void __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.");
}

void __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = MRMediaRemoteCopyPlaybackStateDescription([a2 intValue]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  char v9 = v5;
  _os_log_debug_impl(&dword_194F3C000, a3, OS_LOG_TYPE_DEBUG, "[MRV2NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", (uint8_t *)&v6, 0x16u);
}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", v2, v3, v4, v5, 2u);
}

void __56__MRV2NowPlayingController__handleClientStateDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_9(&dword_194F3C000, v0, v1, "[MRV2NowPlayingController] <%@> processing clientStateDidChange.", v2, v3, v4, v5, 2u);
}

@end