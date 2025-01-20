@interface MRV3NowPlayingController
- (BOOL)isResolving;
- (BOOL)isUpdating;
- (BOOL)registeredForNotifications;
- (BOOL)requestingQueue;
- (MRDestinationResolver)destinationResolver;
- (MRNowPlayingControllerConfiguration)configuration;
- (MRNowPlayingControllerDestination)destination;
- (MRNowPlayingControllerHelper)helper;
- (MRNowPlayingPlayerResponse)response;
- (MRV3NowPlayingController)initWithConfiguration:(id)a3;
- (MSVVariableIntervalTimer)loadRetryTimer;
- (NSDate)lastQueueRequestDate;
- (NSMutableArray)deferredContentItemsToMerge;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4;
- (void)_handleClientPropertiesDidChange:(id)a3;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3;
- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3;
- (void)_handlePlaybackStateChangedNotification:(id)a3;
- (void)_handleSupportedCommandsChangedNotification:(id)a3;
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
- (void)_onQueue_clearStateForResolvedPlayerPath;
- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3;
- (void)_reloadWithReason:(id)a3;
- (void)_requestClientPropertiesForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_unregisterNotificationHandlers;
- (void)beginLoadingUpdates;
- (void)beginResolving;
- (void)dealloc;
- (void)destinationResolver:(id)a3 didFailWithError:(id)a4;
- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4;
- (void)destinationResolverDestinationDidInvalidate:(id)a3;
- (void)destinationWithCompletion:(id)a3;
- (void)endLoadingUpdates;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6;
- (void)setConfiguration:(id)a3;
- (void)setDeferredContentItemsToMerge:(id)a3;
- (void)setDestinationResolver:(id)a3;
- (void)setHelper:(id)a3;
- (void)setIsResolving:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setLastQueueRequestDate:(id)a3;
- (void)setLoadRetryTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setRequestingQueue:(BOOL)a3;
- (void)setResponse:(id)a3;
@end

@implementation MRV3NowPlayingController

- (MRV3NowPlayingController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRV3NowPlayingController;
  v5 = [(MRV3NowPlayingController *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaRemote.MRV3NowPlayingController.queue", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  id v4 = [(MRV3NowPlayingController *)self queue];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __35__MRV3NowPlayingController_dealloc__block_invoke;
  v9 = &unk_1E57D0518;
  v10 = self;
  msv_dispatch_sync_on_queue();

  v5.receiver = self;
  v5.super_class = (Class)MRV3NowPlayingController;
  [(MRV3NowPlayingController *)&v5 dealloc];
}

uint64_t __35__MRV3NowPlayingController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(MRV3NowPlayingController *)self destinationResolver];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v14 = [NSString alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MRV3NowPlayingController *)self destinationResolver];
  objc_super v5 = MRCreateIndentedDebugDescriptionFromObject(v4);
  if ([(MRV3NowPlayingController *)self isResolving]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(MRV3NowPlayingController *)self isUpdating]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = [(MSVVariableIntervalTimer *)self->_loadRetryTimer remainingIntervals];
  v9 = MRCreateIndentedDebugDescriptionFromObject(v8);
  v10 = [(MRV3NowPlayingController *)self response];
  dispatch_queue_t v11 = MRCreateIndentedDebugDescriptionFromObject(v10);
  v12 = (void *)[v14 initWithFormat:@"<%@ %p {\n   resolver=%@\n   resolving=%@\n    updating=%@\n   loadRetryTimer = %@\n   response=%@\n}>\n", v3, self, v5, v6, v7, v9, v11];

  return (NSString *)v12;
}

- (void)beginResolving
{
  v2 = [(MRV3NowPlayingController *)self queue];
  msv_dispatch_sync_on_queue();
}

void __42__MRV3NowPlayingController_beginResolving__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 18))
  {
    *(unsigned char *)(v1 + 18) = 1;
    uint64_t v3 = [MRDestinationResolver alloc];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 40) destination];
    objc_super v5 = (void *)[[NSString alloc] initWithFormat:@"%@<%p>", objc_opt_class(), *(void *)(a1 + 32)];
    uint64_t v6 = [(MRDestinationResolver *)v3 initWithDestination:v4 label:v5];
    [*(id *)(a1 + 32) setDestinationResolver:v6];

    uint64_t v7 = *(void **)(a1 + 32);
    v8 = [v7 destinationResolver];
    [v8 setDelegate:v7];

    id v9 = [*(id *)(a1 + 32) destinationResolver];
    [v9 beginResolving];
  }
}

- (void)beginLoadingUpdates
{
  v2 = [(MRV3NowPlayingController *)self queue];
  msv_dispatch_sync_on_queue();
}

uint64_t __47__MRV3NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 17))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 17) = 1;
    [*(id *)(result + 32) beginResolving];
    uint64_t v3 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Begin loading updates", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(v2 + 32) _reloadWithReason:@"Begin"];
  }
  return result;
}

- (void)endLoadingUpdates
{
  uint64_t v3 = [(MRV3NowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MRV3NowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__MRV3NowPlayingController_endLoadingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 17))
  {
    *(unsigned char *)(v2 + 17) = 0;
    [*(id *)(a1 + 32) setLoadRetryTimer:0];
    uint64_t v3 = [*(id *)(a1 + 32) destinationResolver];
    [v3 setDelegate:0];

    [*(id *)(a1 + 32) setDestinationResolver:0];
    uint64_t v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> End loading updates", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
  }
  else
  {
    uint64_t v6 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Unbalanced calls to endLoadingUpdates", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  [(MRV3NowPlayingController *)self beginResolving];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke;
  v25[3] = &unk_1E57D4DB8;
  id v26 = v11;
  id v12 = v11;
  uint64_t v13 = (void *)MEMORY[0x1997190F0](v25);
  id v14 = [(MRV3NowPlayingController *)self destination];
  v15 = [v14 playerPath];
  if ([v15 isResolved])
  {
    v16 = [(MRV3NowPlayingController *)self destination];
  }
  else
  {
    v17 = [(MRV3NowPlayingController *)self configuration];
    v16 = [v17 destination];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2;
  v20[3] = &unk_1E57D9828;
  id v21 = v10;
  id v22 = v13;
  v20[4] = self;
  unsigned int v23 = a3;
  unsigned int v24 = a5;
  id v18 = v10;
  id v19 = v13;
  +[MRDestinationResolver resolvePartialDestination:v16 level:2 timeout:v20 completion:15.0];
}

uint64_t __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 origin];

  if (v4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v3 playerPath];
    uint64_t v8 = *(unsigned int *)(a1 + 60);
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    MRMediaRemoteSendCommandToPlayerWithResult(v5, v6, v7, v8, v9, *(void **)(a1 + 48));
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_3;
    block[3] = &unk_1E57D0FC0;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v10, block);
  }
}

void __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MRCommandResult commandResultWithSendError:6];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)destinationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRV3NowPlayingController *)self destination];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MRV3NowPlayingController_destinationWithCompletion___block_invoke;
  v7[3] = &unk_1E57D40F8;
  id v8 = v4;
  id v6 = v4;
  +[MRDestinationResolver resolvePartialDestination:v5 level:2 timeout:v7 completion:15.0];
}

void __54__MRV3NowPlayingController_destinationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 playerPath];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (MRNowPlayingControllerDestination)destination
{
  id v2 = [(MRV3NowPlayingController *)self destinationResolver];
  id v3 = [v2 destination];

  return (MRNowPlayingControllerDestination *)v3;
}

- (void)_reloadWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MRV3NowPlayingController__reloadWithReason___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) destination];
  id v4 = [v3 playerPath];

  if ([v4 isResolved])
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v35 = v6;
      __int16 v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> reloading for reason %@", buf, 0x16u);
    }

    [*v2 _registerNotificationHandlersForResolvedPlayerPath:v4];
    id v8 = *v2;
    id v33 = 0;
    uint64_t v9 = [v8 _loadNowPlayingStateForPlayerPath:v4 error:&v33];
    id v10 = v33;
    id v11 = _MRLogForCategory(1uLL);
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __46__MRV3NowPlayingController__reloadWithReason___block_invoke_cold_1();
      }

      uint64_t v13 = [*v2 loadRetryTimer];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        id v26 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = *v2;
          v28 = [*v2 loadRetryTimer];
          [v28 timeUntilNextInterval];
          *(_DWORD *)buf = 138412546;
          id v35 = v27;
          __int16 v36 = 2048;
          v37 = v29;
          _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> LoadetryTimer is already scheduled to retry in %lf more seconds", buf, 0x16u);
        }
      }
      else
      {
        objc_initWeak(&location, *v2);
        v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController.loadRetryTimer<%p>", *v2);
        id v16 = objc_alloc(MEMORY[0x1E4F77A38]);
        v17 = +[MRUserSettings currentSettings];
        id v18 = [v17 destinationResolverReconRetryIntervals];
        id v19 = [*v2 queue];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __46__MRV3NowPlayingController__reloadWithReason___block_invoke_36;
        v30[3] = &unk_1E57D12D0;
        objc_copyWeak(&v31, &location);
        v20 = (void *)[v16 initWithIntervals:v18 name:v15 queue:v19 block:v30];
        [*v2 setLoadRetryTimer:v20];

        id v21 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = *v2;
          unsigned int v23 = [*v2 loadRetryTimer];
          [v23 timeUntilNextInterval];
          *(_DWORD *)buf = 138412546;
          id v35 = v22;
          __int16 v36 = 2048;
          v37 = v24;
          _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Starting ReconRetryTimer to fire in %lf seconds", buf, 0x16u);
        }
        [*v2 _notifyDelegateOfError:v10];
        objc_destroyWeak(&v31);

        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = *v2;
        *(_DWORD *)buf = 138412546;
        id v35 = v25;
        __int16 v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> End loading data. Response: %@.", buf, 0x16u);
      }

      [*v2 setLoadRetryTimer:0];
      [*v2 _notifyDelegateOfNewResponse:v9];
    }
  }
}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [NSString alloc];
    id v2 = [WeakRetained loadRetryTimer];
    [v2 currentInterval];
    id v4 = objc_msgSend(v1, "initWithFormat:", @"LoadRetryTimer fired after %lf total seconds", v3);

    [WeakRetained _reloadWithReason:v4];
  }
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__46;
  v68 = __Block_byref_object_dispose__46;
  id v69 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__46;
  v62 = __Block_byref_object_dispose__46;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__46;
  v56 = __Block_byref_object_dispose__46;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__46;
  v50 = __Block_byref_object_dispose__46;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__46;
  v44 = __Block_byref_object_dispose__46;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__46;
  uint64_t v38 = __Block_byref_object_dispose__46;
  id v39 = 0;
  uint64_t v7 = dispatch_group_create();
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.MRV3NowPlayingController.callbackQueue", v8);

  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestSupportedCommands])
  {
    dispatch_group_enter(v7);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
    v30[3] = &unk_1E57D21D8;
    v32 = &v52;
    id v33 = &v46;
    id v31 = v7;
    [(MRV3NowPlayingController *)self _requestSupportedCommandsForPlayerPath:v6 queue:v9 completion:v30];
  }
  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestPlaybackState])
  {
    dispatch_group_enter(v7);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
    v27[3] = &unk_1E57D2200;
    v29 = &v70;
    v28 = v7;
    MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v27);
  }
  id v10 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];

  if (v10)
  {
    dispatch_group_enter(v7);
    id v11 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
    v23[3] = &unk_1E57D33E0;
    id v25 = &v64;
    id v26 = &v58;
    unsigned int v24 = v7;
    [(MRV3NowPlayingController *)self _requestPlaybackQueueForPlayerPath:v6 request:v11 queue:v9 completion:v23];
  }
  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestLastPlayingDate])
  {
    dispatch_group_enter(v7);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
    v20[3] = &unk_1E57D2250;
    id v22 = &v40;
    id v21 = v7;
    [(MRV3NowPlayingController *)self _requestPlayerLastPlayingDateForPlayerPath:v6 queue:v9 completion:v20];
  }
  if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestClientProperties])
  {
    dispatch_group_enter(v7);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
    v17[3] = &unk_1E57D9850;
    id v19 = &v34;
    id v18 = v7;
    [(MRV3NowPlayingController *)self _requestClientPropertiesForPlayerPath:v6 queue:v9 completion:v17];
  }
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v7, v12))
  {
    if (a4)
    {
      id v13 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:26];
LABEL_18:
      v15 = 0;
      *a4 = v13;
      goto LABEL_20;
    }
LABEL_19:
    v15 = 0;
    goto LABEL_20;
  }
  BOOL v14 = (void *)v59[5];
  if (v14 || (BOOL v14 = (void *)v47[5]) != 0)
  {
    if (a4)
    {
      id v13 = v14;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v15 = objc_alloc_init(MRNowPlayingPlayerResponse);
  [(MRNowPlayingPlayerResponse *)v15 setPlaybackQueue:v65[5]];
  [(MRNowPlayingPlayerResponse *)v15 setPlaybackState:*((unsigned int *)v71 + 6)];
  [(MRNowPlayingPlayerResponse *)v15 setSupportedCommands:v53[5]];
  [(MRNowPlayingPlayerResponse *)v15 setPlayerLastPlayingDate:v41[5]];
  [(MRNowPlayingPlayerResponse *)v15 setClientProperties:v35[5]];
LABEL_20:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);

  return v15;
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(MRV3NowPlayingController *)self setRequestingQueue:1];
  BOOL v14 = (void *)[v12 copy];
  [v14 setCachingPolicy:2];
  v15 = [MEMORY[0x1E4F1C9C8] date];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__MRV3NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke;
  v18[3] = &unk_1E57D5310;
  v18[4] = self;
  id v19 = v15;
  id v20 = v10;
  id v16 = v10;
  id v17 = v15;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v13, v11, v18);
}

void __88__MRV3NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) lastQueueRequestDate];
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = (void *)v4;
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) lastQueueRequestDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 >= 0.0)
  {
LABEL_3:
    [*(id *)(a1 + 32) setRequestingQueue:0];
    [*(id *)(a1 + 32) setLastQueueRequestDate:*(void *)(a1 + 40)];
    id v10 = a2;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v17 = [v16 identifier];
          id v18 = [v10 contentItemForIdentifier:v17];

          [v18 mergeFrom:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v19 = [*(id *)(a1 + 32) deferredContentItemsToMerge];
    [v19 removeAllObjects];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[MRPlaybackQueueRequest alloc] initWithIdentifiers:v12];

  [(MRPlaybackQueueRequest *)v13 setArtworkHeight:600.0];
  [(MRPlaybackQueueRequest *)v13 setArtworkWidth:600.0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__MRV3NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2318;
  id v16 = v9;
  id v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);
}

uint64_t __86__MRV3NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__MRV3NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E57D1380;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);
}

uint64_t __84__MRV3NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[MRNowPlayingRequest alloc] initWithPlayerPath:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E57D3EF0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(MRNowPlayingRequest *)v11 requestLastPlayingDateOnQueue:v9 completion:v13];
}

void __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
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
  v13[2] = __83__MRV3NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E57D3458;
  id v14 = v7;
  id v12 = v7;
  MRMediaRemoteGetClientProperties((uint64_t)v10, (uint64_t)v11, v8, v13);
}

uint64_t __83__MRV3NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)destinationResolverDestinationDidInvalidate:(id)a3
{
  id v4 = [(MRV3NowPlayingController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MRV3NowPlayingController_destinationResolverDestinationDidInvalidate___block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __72__MRV3NowPlayingController_destinationResolverDestinationDidInvalidate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
  id v2 = *(void **)(a1 + 32);

  return [v2 _notifyDelegateOfInvalidation];
}

- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4
{
  id v5 = [a3 destination];
  uint64_t v6 = [v5 playerPath];
  [(MRV3NowPlayingController *)self _notifyDelegateOfPlayerPathChange:v6];

  [(MRV3NowPlayingController *)self _reloadWithReason:@"playerPath Invalidation"];
}

- (void)destinationResolver:(id)a3 didFailWithError:(id)a4
{
}

- (void)_onQueue_clearStateForResolvedPlayerPath
{
  uint64_t v3 = [(MRV3NowPlayingController *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MRV3NowPlayingController *)self _unregisterNotificationHandlers];
  id v4 = [(MRV3NowPlayingController *)self deferredContentItemsToMerge];
  [v4 removeAllObjects];
}

- (MRNowPlayingControllerHelper)helper
{
  if ([(MRV3NowPlayingController *)self isUpdating]) {
    helper = self->_helper;
  }
  else {
    helper = 0;
  }

  return helper;
}

- (void)setHelper:(id)a3
{
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 didLoadResponse];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MRV3NowPlayingController *)self helper];

  if (v5)
  {
    id v7 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v7 playbackStateDidChange];
    v6[2](v6, v3);
  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 playbackQueueDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 contentItemsDidUpdate];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 contentItemsDidLoadArtwork];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 supportedCommandsDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 playerLastPlayingDateDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 clientPropertiesDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 playerPathDidChange];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_notifyDelegateOfInvalidation
{
  uint64_t v3 = [(MRV3NowPlayingController *)self helper];

  if (v3)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    id v4 = [v5 didInvalidate];
    v4[2]();
  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  id v7 = a3;
  id v4 = [(MRV3NowPlayingController *)self helper];

  if (v4)
  {
    id v5 = [(MRV3NowPlayingController *)self helper];
    uint64_t v6 = [v5 didFailWithError];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 playerPath];
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
    uint64_t v19 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
  }

  id v10 = [*(id *)(a1 + 40) deferredContentItemsToMerge];
  [v10 removeAllObjects];

  id v11 = [*(id *)(*(void *)(a1 + 40) + 40) playbackQueueRequest];
  id v12 = (void *)[v11 copy];

  [v12 setArtworkWidth:0.0];
  [v12 setArtworkHeight:0.0];
  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = [v13 destination];
  v15 = [v14 playerPath];
  id v16 = [*(id *)(a1 + 40) queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_58;
  v17[3] = &unk_1E57D2430;
  void v17[4] = *(void *)(a1 + 40);
  [v13 _requestPlaybackQueueForPlayerPath:v15 request:v12 queue:v16 completion:v17];

LABEL_8:
}

uint64_t __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_58(uint64_t a1, uint64_t a2, uint64_t a3)
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
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = (id *)(a1 + 40);
  id v5 = [*(id *)(a1 + 40) destination];
  id v6 = [v5 playerPath];
  if (v6 == v3)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [v6 isEqual:v3];

    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v11 = objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_101);
  int v12 = [*(id *)(a1 + 40) requestingQueue];
  uint64_t v13 = _MRLogForCategory(1uLL);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1();
    }

    v15 = [*v4 deferredContentItemsToMerge];
    [v15 addObjectsFromArray:v10];
  }
  else
  {
    if (v14) {
      __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2();
    }

    [*v4 _notifyDelegateOfUpdatedContentItemsWithContentItems:v10];
  }

LABEL_13:
}

uint64_t __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = (id *)(a1 + 40);
  id v5 = [*(id *)(a1 + 40) destination];
  id v6 = [v5 playerPath];
  if (v6 == v3)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [v6 isEqual:v3];

    if ((v8 & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  id v11 = objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_61_0);
  int v12 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1();
  }

  id v13 = *v4;
  BOOL v14 = [*v4 destination];
  v15 = [v14 playerPath];
  id v16 = [*v4 queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_62;
  v17[3] = &unk_1E57D2430;
  void v17[4] = *v4;
  [v13 _requestContentItemArtwork:v11 forPlayerPath:v15 queue:v16 completion:v17];

LABEL_8:
}

uint64_t __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_62(uint64_t a1, void *a2, uint64_t a3)
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
      char v8 = [v5 contentItems];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      BOOL v14 = v8;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v5 contentItems];
    [v9 _notifyDelegateOfUpdatedArtwork:v10];
  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v4 = [*(id *)(a1 + 40) destination];
  id v5 = [v4 playerPath];
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
    long long v22 = MRMediaRemoteCopyPlaybackStateDescription([v9 intValue]);
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);
  }

  int v12 = [*(id *)(*(void *)(a1 + 40) + 32) playbackState];
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
  BOOL IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(v12);
  if (IsAdvancing != MRMediaRemotePlaybackStateIsAdvancing([v9 intValue]))
  {
    BOOL v14 = *(void **)(a1 + 40);
    uint64_t v15 = [v14 destination];
    id v16 = [v15 playerPath];
    id v17 = [*(id *)(a1 + 40) queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_63;
    v18[3] = &unk_1E57D2478;
    v18[4] = *(void *)(a1 + 40);
    [v14 _requestPlayerLastPlayingDateForPlayerPath:v16 queue:v17 completion:v18];
  }
LABEL_10:
}

uint64_t __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedPlayerLastPlayingDate:a2];
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRNowPlayingPlayerPathUserInfoKey"];

  id v5 = *(void **)(a1 + 40);
  id v4 = (id *)(a1 + 40);
  id v6 = [v5 destination];
  id v7 = [v6 playerPath];
  if (v7 == v3)
  {
  }
  else
  {
    id v8 = v7;
    char v9 = [v7 isEqual:v3];

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v10 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1();
  }

  id v11 = *v4;
  int v12 = [*v4 destination];
  __int16 v13 = [v12 playerPath];
  BOOL v14 = [*v4 queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_64;
  v15[3] = &unk_1E57D24A0;
  void v15[4] = *v4;
  [v11 _requestSupportedCommandsForPlayerPath:v13 queue:v14 completion:v15];

LABEL_8:
}

uint64_t __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfSupportedCommandsChange:a2];
  }
}

- (void)_handleClientPropertiesDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(MRV3NowPlayingController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke;
  v7[3] = &unk_1E57D0790;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kMRMediaRemoteOriginUserInfoKey"];

  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kMRNowPlayingClientUserInfoKey"];

  id v7 = *(void **)(a1 + 40);
  id v6 = (id *)(a1 + 40);
  id v8 = [v7 destination];
  char v9 = [v8 playerPath];
  id v10 = [v9 origin];
  if ([v10 isEqual:v3])
  {
    id v11 = [*v6 destination];
    int v12 = [v11 playerPath];
    __int16 v13 = [v12 client];
    int v14 = [v13 isEqual:v5];

    if (v14)
    {
      uint64_t v15 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_cold_1();
      }

      id v16 = *v6;
      id v17 = [*v6 destination];
      id v18 = [v17 playerPath];
      uint64_t v19 = [*v6 queue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_65;
      v20[3] = &unk_1E57D49F8;
      void v20[4] = *v6;
      [v16 _requestClientPropertiesForPlayerPath:v18 queue:v19 completion:v20];
    }
  }
  else
  {
  }
}

uint64_t __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_65(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  }
  else {
    return [v3 _notifyDelegateOfUpdatedClientProperties:a2];
  }
}

- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3
{
  if (![(MRV3NowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    id v4 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__handlePlaybackQueueChangedNotification_ name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:self selector:sel__handlePlaybackQueueContentItemsChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:self selector:sel__handlePlaybackQueueContentItemsArtworkChangedNotification_ name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestPlaybackState])
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__handlePlaybackStateChangedNotification_ name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestSupportedCommands])
    {
      char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__handleSupportedCommandsChangedNotification_ name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestClientProperties])
    {
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__handleClientPropertiesDidChange_ name:@"kMRMediaRemoteApplicationClientStateDidChange" object:0];
    }
    [(MRV3NowPlayingController *)self setRegisteredForNotifications:1];
  }
}

- (void)_unregisterNotificationHandlers
{
  if ([(MRV3NowPlayingController *)self registeredForNotifications])
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    id v3 = [(MRNowPlayingControllerConfiguration *)self->_configuration playbackQueueRequest];

    if (v3)
    {
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 removeObserver:self name:@"kMRPlayerPlaybackQueueChangedNotification" object:0];

      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:self name:@"kMRPlayerPlaybackQueueContentItemsChangedNotification" object:0];

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self name:@"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestPlaybackState])
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:@"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestSupportedCommands])
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];
    }
    if ([(MRNowPlayingControllerConfiguration *)self->_configuration requestClientProperties])
    {
      char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:@"kMRMediaRemoteApplicationClientStateDidChange" object:0];
    }
    [(MRV3NowPlayingController *)self setRegisteredForNotifications:0];
  }
}

- (BOOL)isUpdating
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(MRV3NowPlayingController *)self queue];
  msv_dispatch_sync_on_queue();

  char v3 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __38__MRV3NowPlayingController_isUpdating__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (MRNowPlayingPlayerResponse)response
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__46;
  id v11 = __Block_byref_object_dispose__46;
  id v12 = 0;
  char v3 = [(MRV3NowPlayingController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MRV3NowPlayingController_response__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

uint64_t __36__MRV3NowPlayingController_response__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (MRNowPlayingControllerConfiguration)configuration
{
  uint64_t v2 = (void *)[(MRNowPlayingControllerConfiguration *)self->_configuration copy];

  return (MRNowPlayingControllerConfiguration *)v2;
}

- (MRDestinationResolver)destinationResolver
{
  return self->_destinationResolver;
}

- (void)setDestinationResolver:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (void)setConfiguration:(id)a3
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

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isResolving
{
  return self->_isResolving;
}

- (void)setIsResolving:(BOOL)a3
{
  self->_isResolving = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (NSDate)lastQueueRequestDate
{
  return self->_lastQueueRequestDate;
}

- (void)setLastQueueRequestDate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MSVVariableIntervalTimer)loadRetryTimer
{
  return self->_loadRetryTimer;
}

- (void)setLoadRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadRetryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastQueueRequestDate, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_destinationResolver, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[MRV3NowPlayingController] <%@> Error loading data %@.");
}

void __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[MRV3NowPlayingController] <%@> Failed to retrieve player last playing date with error: %@");
}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV3NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.");
}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV3NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.");
}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRV3NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.");
}

void __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_194F3C000, v1, OS_LOG_TYPE_DEBUG, "[MRV3NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", (uint8_t *)&v2, 0xCu);
}

void __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 40);
  int v3 = 138412290;
  uint64_t v4 = v1;
  _os_log_debug_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRV3NowPlayingController] <%@> processing ClientPropertiesDidChangeNotification.", (uint8_t *)&v3, 0xCu);
}

@end