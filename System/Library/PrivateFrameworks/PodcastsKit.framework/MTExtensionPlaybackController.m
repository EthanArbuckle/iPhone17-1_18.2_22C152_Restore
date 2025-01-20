@interface MTExtensionPlaybackController
+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5;
+ (void)_setPlaybackQueueWithIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 playerID:(id)a8 mrCompletion:(id)a9;
+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 assetInfo:(id)a4 requesterSharedUserId:(id)a5 sharedUserIdFromPlayableITunesAccount:(id)a6 mrCompletion:(id)a7;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 mrCompletion:(id)a8;
- (MTExtensionPlaybackController)init;
- (NSMutableArray)magicMomentCompletionHandlers;
- (void)_getNowPlayingInfoAndCallPendingCompletions;
- (void)_playbackQueueChangedNotification:(id)a3;
- (void)populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4;
- (void)setMagicMomentCompletionHandlers:(id)a3;
@end

@implementation MTExtensionPlaybackController

- (MTExtensionPlaybackController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTExtensionPlaybackController;
  v2 = [(MTExtensionPlaybackController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__playbackQueueChangedNotification_ name:*MEMORY[0x263F54E60] object:0];

    uint64_t v4 = objc_opt_new();
    magicMomentCompletionHandlers = v2->_magicMomentCompletionHandlers;
    v2->_magicMomentCompletionHandlers = (NSMutableArray *)v4;
  }
  return v2;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __166__MTExtensionPlaybackController_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_completion___block_invoke;
  v16[3] = &unk_265055DC8;
  id v17 = v14;
  id v15 = v14;
  [a1 setQueueWithPlaybackRequestIdentifier:a3 startPlayback:v11 assetInfo:a5 requesterSharedUserId:a6 sharedUserIdFromPlayableITunesAccount:a7 mrCompletion:v16];
}

uint64_t __166__MTExtensionPlaybackController_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_completion___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a3 | a2) == 0);
  }
  return result;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 assetInfo:(id)a4 requesterSharedUserId:(id)a5 sharedUserIdFromPlayableITunesAccount:(id)a6 mrCompletion:(id)a7
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 mrCompletion:(id)a8
{
}

- (void)populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  id v23 = _Block_copy(v7);
  id v8 = [(MTExtensionPlaybackController *)self magicMomentCompletionHandlers];
  objc_sync_enter(v8);
  v9 = (const void *)v19[5];
  if (v9)
  {
    v10 = _Block_copy(v9);
    [v8 addObject:v10];
  }
  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v8);

  BOOL v11 = objc_opt_class();
  uint64_t v12 = *MEMORY[0x263F5EBB8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke;
  v14[3] = &unk_265055DF0;
  id v13 = v8;
  v16 = self;
  id v17 = &v18;
  id v15 = v13;
  [v11 _setPlaybackQueueWithIdentifier:v6 startPlayback:1 assetInfo:0 requesterSharedUserId:0 sharedUserIdFromPlayableITunesAccount:0 playerID:v12 mrCompletion:v14];

  _Block_object_dispose(&v18, 8);
}

void __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 | a2)
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v7 + 16))(v7, a2, a3, 0);
      id v8 = *(void **)(a1 + 32);
      v9 = _Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [v8 removeObject:v9];
    }
    objc_sync_exit(v6);
  }
  dispatch_time_t v10 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke_2;
  block[3] = &unk_265055830;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
}

void __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) magicMomentCompletionHandlers];
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) magicMomentCompletionHandlers];
  uint64_t v4 = [v3 count];

  objc_sync_exit(v2);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 _getNowPlayingInfoAndCallPendingCompletions];
  }
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [v4 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  MRNowPlayingPlayerPathGetPlayer();
  MRNowPlayingPlayerGetIdentifier();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:*MEMORY[0x263F5EBB8]]) {
    [(MTExtensionPlaybackController *)self _getNowPlayingInfoAndCallPendingCompletions];
  }
}

- (void)_getNowPlayingInfoAndCallPendingCompletions
{
  objc_initWeak(&location, self);
  v2 = objc_opt_class();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__MTExtensionPlaybackController__getNowPlayingInfoAndCallPendingCompletions__block_invoke;
  v3[3] = &unk_265055E18;
  objc_copyWeak(&v4, &location);
  [v2 getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __76__MTExtensionPlaybackController__getNowPlayingInfoAndCallPendingCompletions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained magicMomentCompletionHandlers];

  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_loadWeakRetained(v4);
  id v8 = objc_msgSend(v7, "magicMomentCompletionHandlers", 0);

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  id v12 = objc_loadWeakRetained(v4);
  id v13 = [v12 magicMomentCompletionHandlers];
  [v13 removeAllObjects];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v6);
}

+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  MRMediaRemoteGetLocalOrigin();
  id v5 = (const void *)MRNowPlayingClientCreate();
  id v6 = (const void *)MRNowPlayingPlayerCreate();
  uint64_t v7 = MRNowPlayingPlayerPathCreate();
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v8 = MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__MTExtensionPlaybackController_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion___block_invoke;
  v10[3] = &unk_265055E40;
  id v11 = v3;
  id v9 = v3;
  MEMORY[0x2455C3AD0](v8, v7, v4, v10);
}

uint64_t __89__MTExtensionPlaybackController_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion___block_invoke(uint64_t a1)
{
  MRPlaybackQueueGetContentItemAtOffset();
  MRContentItemCopyNowPlayingInfo();
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

+ (void)_setPlaybackQueueWithIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 playerID:(id)a8 mrCompletion:(id)a9
{
  BOOL v13 = a4;
  v34[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 length])
  {
    [a1 playbackQueueForIdentifier:v15 startPlayback:v13 assetInfo:v16];
    v21 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    v22 = v21;
    if (v17) {
      [v21 setObject:v17 forKey:@"requesterUserId"];
    }
    id v30 = v17;
    id v23 = v16;
    if (v18) {
      [v22 setObject:v18 forKey:@"sharedUserId"];
    }
    MRSystemAppPlaybackQueueSetUserInfo();
    v24 = dispatch_get_global_queue(0, 0);
    MRMediaRemoteGetLocalOrigin();
    v25 = (const void *)MRNowPlayingClientCreate();
    id v29 = v19;
    v26 = (const void *)MRNowPlayingPlayerCreate();
    MRNowPlayingPlayerPathCreate();
    if (v25) {
      CFRelease(v25);
    }
    id v16 = v23;
    if (v26) {
      CFRelease(v26);
    }
    uint64_t v33 = *MEMORY[0x263F54C70];
    v34[0] = &unk_26F2D29B0;
    v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v31 = v20;
    MRMediaRemoteSetAppPlaybackQueueForPlayer();

    id v19 = v29;
    id v17 = v30;
  }
  else
  {
    v28 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F08F000, v28, OS_LOG_TYPE_ERROR, "Failed to set playback queue: empty playback request identifier provided", buf, 2u);
    }

    if (v20) {
      (*((void (**)(id, uint64_t, uint64_t))v20 + 2))(v20, 2, 7);
    }
  }
}

void __171__MTExtensionPlaybackController__setPlaybackQueueWithIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_playerID_mrCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v5 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      uint64_t v11 = a2;
      _os_log_impl(&dword_23F08F000, v5, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRSendCommandError: %ld", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, 2, a2);
    }
  }
  else
  {
    uint64_t v7 = [a3 firstObject];
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8)
    {
      id v9 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134217984;
        uint64_t v11 = v8;
        _os_log_impl(&dword_23F08F000, v9, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRMediaRemoteCommandHandlerStatus: %ld", (uint8_t *)&v10, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v11 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  [v7 arrayWithObjects:&v11 count:1];

  id v9 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  if (objc_msgSend(v6, "length", v11, v12)) {
    MRSystemAppPlaybackQueueSetSiriAssetInfo();
  }

  return v9;
}

- (NSMutableArray)magicMomentCompletionHandlers
{
  return self->_magicMomentCompletionHandlers;
}

- (void)setMagicMomentCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end