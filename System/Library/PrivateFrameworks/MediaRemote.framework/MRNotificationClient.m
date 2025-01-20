@interface MRNotificationClient
+ (id)nowPlayingNotifications;
- (BOOL)_postNotification:(id)a3 userInfo:(id)a4 object:(id)a5 withHandler:(id)a6;
- (BOOL)_processAlwaysNeedsNowPlayingNotifications;
- (BOOL)isRegisteredForNowPlayingNotifications;
- (BOOL)postNotification:(id)a3 userInfo:(id)a4 object:(id)a5;
- (BOOL)receivesExternalScreenTypeChangedNotifications;
- (BOOL)receivesOriginChangedNotifications;
- (BOOL)receivesPlaybackErrorNotifications;
- (BOOL)receivesRoutesChangedNotifications;
- (BOOL)receivesSupportedCommandsNotifications;
- (BOOL)receivesVoiceInputRecordingStateNotifications;
- (BOOL)receivesVolumeControlNotifications;
- (MRNotificationClient)init;
- (OS_dispatch_queue)notificationQueue;
- (id)debugDescription;
- (void)_syncWakingPlayerPathsWithReplyQueue:(id)a3 completion:(id)a4;
- (void)dispatchNotification:(id)a3 userInfo:(id)a4 object:(id)a5;
- (void)registerForNowPlayingNotificationsWithQueue:(id)a3;
- (void)registerForNowPlayingNotificationsWithQueue:(id)a3 force:(BOOL)a4;
- (void)registerForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5;
- (void)restoreNowPlayingClientState;
- (void)setReceivesExternalScreenTypeChangedNotifications:(BOOL)a3;
- (void)setReceivesOriginChangedNotifications:(BOOL)a3;
- (void)setReceivesPlaybackErrorNotifications:(BOOL)a3;
- (void)setReceivesRoutesChangedNotifications:(BOOL)a3;
- (void)setReceivesSupportedCommandsNotifications:(BOOL)a3;
- (void)setReceivesVoiceInputRecordingStateNotifications:(BOOL)a3;
- (void)setReceivesVolumeControlNotifications:(BOOL)a3;
- (void)unregisterForNowPlayingNotifications;
- (void)unregisterForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5;
@end

@implementation MRNotificationClient

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [v5 conformsToProtocol:&unk_1EE670E40];
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = [v5 copy];

    id v5 = (id)v8;
  }
  [v7 setObject:v5 forKey:v9];
}

void __41__MRNotificationClient_notificationQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (!v2) {
    v2 = *(void **)(v1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (BOOL)postNotification:(id)a3 userInfo:(id)a4 object:(id)a5
{
  return a3
      && [(MRNotificationClient *)self _postNotification:a3 userInfo:a4 object:a5 withHandler:&__block_literal_global_73_0];
}

- (BOOL)_postNotification:(id)a3 userInfo:(id)a4 object:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id, id, id))a6;
  kdebug_trace();
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke;
  v30[3] = &unk_1E57D48B0;
  id v15 = v14;
  id v31 = v15;
  [v11 enumerateKeysAndObjectsUsingBlock:v30];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2;
  block[3] = &unk_1E57D56D0;
  id v17 = v10;
  id v22 = v17;
  id v18 = v15;
  id v23 = v18;
  v24 = self;
  v25 = &v26;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v27 + 24))
  {
    v13[2](v13, v17, v18, v12);
    BOOL v19 = *((unsigned char *)v27 + 24) != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v19;
}

void __57__MRNotificationClient_postNotification_userInfo_object___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = a3;
  id v9 = _MRLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __57__MRNotificationClient_postNotification_userInfo_object___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:v6 object:v7 userInfo:v8];
}

uint64_t __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2(void *a1)
{
  v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_2((uint64_t)a1, v2, v3, v4, v5, v6, v7, v8);
  }

  id v9 = _MRLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_1((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t result = MRProcessIsMediaRemoteDaemon();
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1[6] + 40) containsObject:a1[4]];
    uint64_t v17 = a1[6];
    if (result)
    {
      char v18 = *(void *)(v17 + 8) != 0;
LABEL_20:
      uint64_t v25 = a1[7];
LABEL_21:
      *(unsigned char *)(*(void *)(v25 + 8) + 24) = v18;
      return result;
    }
    uint64_t result = [*(id *)(v17 + 48) containsObject:a1[4]];
    uint64_t v19 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v19 + 114);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v19 + 56) containsObject:a1[4]];
    uint64_t v20 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v20 + 115);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v20 + 64) containsObject:a1[4]];
    uint64_t v21 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v21 + 112);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v21 + 72) containsObject:a1[4]];
    uint64_t v22 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v22 + 116);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v22 + 80) containsObject:a1[4]];
    uint64_t v23 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v23 + 113);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v23 + 96) containsObject:a1[4]];
    uint64_t v24 = a1[6];
    if (result)
    {
      char v18 = *(unsigned char *)(v24 + 117);
      goto LABEL_20;
    }
    uint64_t result = [*(id *)(v24 + 88) containsObject:a1[4]];
    if (result)
    {
      uint64_t v25 = a1[7];
      char v18 = *(unsigned char *)(a1[6] + 118);
      goto LABEL_21;
    }
  }
  return result;
}

- (OS_dispatch_queue)notificationQueue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__25;
  uint64_t v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRNotificationClient_notificationQueue__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (OS_dispatch_queue *)v3;
}

uint64_t __61__MRNotificationClient_dispatchNotification_userInfo_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotification:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) object:*(void *)(a1 + 56)];
}

- (void)setReceivesSupportedCommandsNotifications:(BOOL)a3
{
  self->_receivesSupportedCommandsNotifications = a3;
}

- (MRNotificationClient)init
{
  v42[58] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)MRNotificationClient;
  v2 = [(MRNotificationClient *)&v34 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient.notificationQueue", v6);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v42[0] = @"kMRMediaRemoteNowPlayingInfoDidChangeNotification";
    v42[1] = @"kMRMediaRemoteOriginNowPlayingInfoDidChangeNotification";
    v42[2] = @"kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification";
    v42[3] = @"kMRMediaRemoteNowPlayingApplicationDidChangeNotification";
    v42[4] = @"kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification";
    v42[5] = @"kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification";
    v42[6] = @"kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification";
    v42[7] = @"kMRMediaRemotePlayerIsPlayingDidChangeNotification";
    v42[8] = @"kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification";
    v42[9] = @"kMRMediaRemoteOriginNowPlayingApplicationPlaybackStateDidChangeNotification";
    v42[10] = @"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification";
    v42[11] = @"kMRMediaRemoteNowPlayingApplicationDisplayNameDidChangeNotification";
    v42[12] = @"kMRMediaRemoteOriginNowPlayingApplicationDisplayNameDidChangeNotification";
    v42[13] = @"kMRMediaRemoteApplicationDisplayNameDidChangeNotification";
    v42[14] = @"kMRMediaRemoteNowPlayingPlayerDidChange";
    v42[15] = @"kMRMediaRemoteOriginNowPlayingPlayerDidChange";
    v42[16] = @"kMRMediaRemoteActivePlayerDidChange";
    v42[17] = @"kMRMediaRemotePlayerPictureInPictureDidChange";
    v42[18] = @"kMRMediaRemoteActivePlayerPathsDidChange";
    v42[19] = @"kMRMediaRemoteAudioFormatContentInfoDidChange";
    v42[20] = @"kMRMediaRemoteNowPlayingApplicationDidRegister";
    v42[21] = @"kMRMediaRemoteNowPlayingApplicationDidUnregister";
    v42[22] = @"kMRMediaRemoteNowPlayingApplicationClientStateDidChange";
    v42[23] = @"kMRMediaRemoteOriginNowPlayingApplicationClientStateDidChange";
    v42[24] = @"kMRMediaRemoteApplicationClientStateDidChange";
    v42[25] = @"kMRMediaRemoteNowPlayingPlayerStateDidChange";
    v42[26] = @"kMRMediaRemoteOriginNowPlayingPlayerStateDidChange";
    v42[27] = @"kMRMediaRemotePlayerStateDidChange";
    v42[28] = @"kMRMediaRemoteNowPlayingPlayerDidRegister";
    v42[29] = @"kMRMediaRemoteNowPlayingPlayerDidUnregister";
    v42[30] = @"kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying";
    v42[31] = @"kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying";
    v42[32] = @"kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification";
    v42[33] = @"com.apple.MediaRemote.nowPlayingApplicationIsPlayingDidChange";
    v42[34] = @"com.apple.MediaRemote.nowPlayingActivePlayersIsPlayingDidChange";
    v42[35] = @"kMRNowPlayingPlaybackQueueChangedNotification";
    v42[36] = @"kMROriginNowPlayingPlaybackQueueChangedNotification";
    v42[37] = @"kMRPlayerPlaybackQueueChangedNotification";
    v42[38] = @"kMRPlaybackQueueContentItemsChangedNotification";
    v42[39] = @"kMROriginPlaybackQueueContentItemsChangedNotification";
    v42[40] = @"kMRPlayerPlaybackQueueContentItemsChangedNotification";
    v42[41] = @"kMRPlaybackQueueContentItemArtworkChangedNotification";
    v42[42] = @"kMROriginPlaybackQueueContentItemArtworkChangedNotification";
    v42[43] = @"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification";
    v42[44] = @"kMRMediaRemoteApplicationDidForeground";
    v42[45] = @"kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification";
    v42[46] = @"kMRMediaRemoteNowPlayingApplicationDidForegroundNotification";
    v42[47] = @"kMRMediaRemoteElectedPlayerDidChangeNotification";
    v42[48] = @"kMRMediaRemoteLockScreenControlsPlayerPathDidChangeNotification";
    v42[49] = @"kMRMediaRemoteLockScreenControlsDidActivateNotification";
    v42[50] = @"kMRMediaRemoteLockScreenControlsDidDeactivateNotification";
    v42[51] = @"kMRMediaRemoteLockScreenControlsDidAppearNotification";
    v42[52] = @"kMRMediaRemoteLockScreenControlsDidDisappearNotification";
    v42[53] = @"kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying";
    v42[54] = @"kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying";
    v42[55] = @"MRNowPlayingPlaybackQueueNowPlayingItemChangedNotification";
    v42[56] = @"MROriginNowPlayingPlaybackQueueNowPlayingItemChangedNotification";
    v42[57] = @"MRPlayerPlaybackQueueNowPlayingItemChangedNotification";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:58];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v9];
    nowPlayingNotifications = v2->_nowPlayingNotifications;
    v2->_nowPlayingNotifications = (NSOrderedSet *)v10;

    v41[0] = @"kMRMediaRemoteWillPresentRouteAuthenticationPromptNotification";
    v41[1] = @"kMRMediaRemotePickableRoutesDidChangeNotification";
    v41[2] = @"kMRMediaRemotePairingHandlerNotification";
    v41[3] = @"_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification";
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v12];
    routesChangedNotifications = v2->_routesChangedNotifications;
    v2->_routesChangedNotifications = (NSOrderedSet *)v13;

    v40 = @"kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v15];
    volumeControlNotifications = v2->_volumeControlNotifications;
    v2->_volumeControlNotifications = (NSOrderedSet *)v16;

    v39 = @"kMRMediaRemoteExternalScreenTypeDidChangeNotification";
    char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v18];
    externalScreenNotifications = v2->_externalScreenNotifications;
    v2->_externalScreenNotifications = (NSOrderedSet *)v19;

    v38[0] = @"kMRMediaRemoteActiveOriginDidChangeNotification";
    v38[1] = @"kMRMediaRemoteAvailableOriginsDidChangeNotification";
    v38[2] = @"kMRMediaRemoteOriginDidRegisterNotification";
    v38[3] = @"kMRMediaRemoteOriginDidUnregisterNotification";
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v21];
    originNotifications = v2->_originNotifications;
    v2->_originNotifications = (NSOrderedSet *)v22;

    v37[0] = @"kMRMediaRemoteSupportedCommandsDidChangeNotification";
    v37[1] = @"kMRMediaRemoteOriginSupportedCommandsDidChangeNotification";
    v37[2] = @"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification";
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v24];
    supportedCommandsNotifications = v2->_supportedCommandsNotifications;
    v2->_supportedCommandsNotifications = (NSOrderedSet *)v25;

    v36 = @"kMRVirtualVoiceInputRecordingStateDidChangeNotification";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v27];
    voiceInputNotifications = v2->_voiceInputNotifications;
    v2->_voiceInputNotifications = (NSOrderedSet *)v28;

    v35 = @"kMRMediaRemoteApplicationDidReportPlaybackErrorNotification";
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v30];
    errorNotifications = v2->_errorNotifications;
    v2->_errorNotifications = (NSOrderedSet *)v31;
  }
  return v2;
}

- (void)dispatchNotification:(id)a3 userInfo:(id)a4 object:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MRNotificationClient *)self notificationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__MRNotificationClient_dispatchNotification_userInfo_object___block_invoke;
  v16[3] = &unk_1E57D3480;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = MRCreateDonatedQosBlock(v16);
  dispatch_async(v11, v15);
}

- (void)registerForNowPlayingNotificationsWithQueue:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MRNotificationClient_registerForNowPlayingNotificationsWithQueue_force___block_invoke;
  block[3] = &unk_1E57D2048;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setReceivesVolumeControlNotifications:(BOOL)a3
{
  self->_receivesVolumeControlNotifications = a3;
}

- (void)setReceivesExternalScreenTypeChangedNotifications:(BOOL)a3
{
  self->_receivesExternalScreenTypeChangedNotifications = a3;
}

void __74__MRNotificationClient_registerForNowPlayingNotificationsWithQueue_force___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48) || !*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = *(NSObject **)(a1 + 40);
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (v2) {
      dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRNotificationClient/nowPlayingNotifications", v3, v2);
    }
    else {
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.MRNotificationClient/nowPlayingNotifications", v3);
    }
    dispatch_queue_t v5 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v4);
  }
  ++*(void *)(*(void *)(a1 + 32) + 8);
  id v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "%lu clients have now registered for Now Playing Notifications", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_syncWakingPlayerPathsWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[MRMediaRemoteServiceClient sharedServiceClient];
  int v8 = [v9 service];
  MRMediaRemoteServiceSetWakingPlayerPaths(v8, self->_subscribedWakingPlayerPaths, v7, v6);
}

void __66__MRNotificationClient__processAlwaysNeedsNowPlayingNotifications__block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v2 = [v0 processName];

  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EE66F378];
  _processAlwaysNeedsNowPlayingNotifications_allowed = [v1 containsObject:v2];
}

- (id)debugDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@:%p { \n", objc_opt_class(), self];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MRNotificationClient_debugDescription__block_invoke;
  block[3] = &unk_1E57D0790;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  dispatch_sync(serialQueue, block);
  id v6 = v5;

  return v6;
}

uint64_t __40__MRNotificationClient_debugDescription__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"    nowPlayingObservers = %lu\n", *(void *)(*(void *)(a1 + 40) + 8));
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 113))
  {
    [*(id *)(a1 + 32) appendFormat:@"    supportedCommandNotifications = %@\n", @"YES"];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v2 + 115))
  {
    [*(id *)(a1 + 32) appendFormat:@"    volumeControlNotifications = %@\n", @"YES"];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v2 + 116))
  {
    [*(id *)(a1 + 32) appendFormat:@"    originNotifications = %@\n", @"YES"];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"    customNotificationQueue = %s\n", dispatch_queue_get_label(v3));
    uint64_t v2 = *(void *)(a1 + 40);
  }
  dispatch_queue_t v4 = *(void **)(v2 + 104);
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = MRCreateIndentedDebugDescriptionFromArray(v4);
    [v5 appendFormat:@"    subscribedWakingPlayerPaths = %@\n", v6];
  }
  id v7 = *(void **)(a1 + 32);

  return [v7 appendString:@"}\n"];
}

- (void)registerForNowPlayingNotificationsWithQueue:(id)a3
{
}

- (void)unregisterForNowPlayingNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRNotificationClient_unregisterForNowPlayingNotifications__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __60__MRNotificationClient_unregisterForNowPlayingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  BOOL v4 = v3 != 0;
  uint64_t v5 = v3 - 1;
  if (!v4) {
    uint64_t v5 = 0;
  }
  *(void *)(v2 + 8) = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 8))
  {
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0;
  }
  int v8 = _MRLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "%lu clients have now registered for Now Playing Notifications", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)isRegisteredForNowPlayingNotifications
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MRNotificationClient_isRegisteredForNowPlayingNotifications__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__MRNotificationClient_isRegisteredForNowPlayingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [v2 _processAlwaysNeedsNowPlayingNotifications];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_processAlwaysNeedsNowPlayingNotifications
{
  if (_processAlwaysNeedsNowPlayingNotifications_onceToken != -1) {
    dispatch_once(&_processAlwaysNeedsNowPlayingNotifications_onceToken, &__block_literal_global_59);
  }
  return _processAlwaysNeedsNowPlayingNotifications_allowed;
}

- (void)registerForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];

  id v13 = [MEMORY[0x1E4F1C9C8] now];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"registerForWakingNowPlayingNotificationsForPlayerPath", v12];
  uint64_t v15 = v14;
  if (v8) {
    [v14 appendFormat:@" for %@", v8];
  }
  uint64_t v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke;
  v31[3] = &unk_1E57D5660;
  id v17 = v8;
  id v32 = v17;
  v33 = @"registerForWakingNowPlayingNotificationsForPlayerPath";
  id v34 = v12;
  id v35 = v13;
  id v37 = v10;
  id v18 = v9;
  id v36 = v18;
  id v19 = v10;
  id v20 = v13;
  id v21 = v12;
  uint64_t v22 = (void *)MEMORY[0x1997190F0](v31);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D5688;
  void block[4] = self;
  id v28 = v17;
  id v29 = v18;
  id v30 = v22;
  id v24 = v22;
  id v25 = v18;
  id v26 = v17;
  dispatch_sync(serialQueue, block);
}

void __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  uint64_t v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      uint64_t v16 = (void *)a1[4];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      id v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = v17;
      id v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v21 = a1[5];
      uint64_t v22 = a1[6];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v21;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      __int16 v31 = 2048;
      id v32 = v23;
      id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v9 = a1[5];
    uint64_t v8 = a1[6];
    uint64_t v10 = a1[4];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v28 = v9;
    __int16 v29 = 2114;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    id v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v10;
    __int16 v35 = 2048;
    uint64_t v36 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1((uint64_t)a1);
  }
LABEL_14:

  id v24 = (void *)a1[9];
  if (v24)
  {
    id v26 = v24;
    id v25 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __100__MRNotificationClient_registerForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 104);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    uint64_t v2 = *(void **)(a1[4] + 104);
  }
  char v6 = [v2 containsObject:a1[5]];
  [*(id *)(a1[4] + 104) addObject:a1[5]];
  if (v6)
  {
    BOOL v7 = *(uint64_t (**)(void))(a1[7] + 16);
    return v7();
  }
  else
  {
    uint64_t v9 = (void *)a1[4];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    return [v9 _syncWakingPlayerPathsWithReplyQueue:v10 completion:v11];
  }
}

- (void)unregisterForWakingNowPlayingNotificationsForPlayerPath:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];

  BOOL v13 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"unregisterForWakingNowPlayingNotificationsForPlayerPath", v12];
  uint64_t v15 = v14;
  if (v8) {
    [v14 appendFormat:@" for %@", v8];
  }
  uint64_t v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke;
  v31[3] = &unk_1E57D5660;
  id v17 = v8;
  id v32 = v17;
  __int16 v33 = @"unregisterForWakingNowPlayingNotificationsForPlayerPath";
  id v34 = v12;
  id v35 = v13;
  id v37 = v10;
  id v18 = v9;
  id v36 = v18;
  id v19 = v10;
  id v20 = v13;
  id v21 = v12;
  uint64_t v22 = (void *)MEMORY[0x1997190F0](v31);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D5688;
  void block[4] = self;
  id v28 = v17;
  id v29 = v18;
  id v30 = v22;
  id v24 = v22;
  id v25 = v18;
  id v26 = v17;
  dispatch_sync(serialQueue, block);
}

void __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  char v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      uint64_t v16 = (void *)a1[4];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      id v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = v17;
      id v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v21 = a1[5];
      uint64_t v22 = a1[6];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v21;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      __int16 v31 = 2048;
      id v32 = v23;
      id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v9 = a1[5];
    uint64_t v8 = a1[6];
    uint64_t v10 = a1[4];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v28 = v9;
    __int16 v29 = 2114;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    id v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v10;
    __int16 v35 = 2048;
    uint64_t v36 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1((uint64_t)a1);
  }
LABEL_14:

  id v24 = (void *)a1[9];
  if (v24)
  {
    id v26 = v24;
    id v25 = v3;
    msv_dispatch_async_on_queue();
  }
}

uint64_t __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __102__MRNotificationClient_unregisterForWakingNowPlayingNotificationsForPlayerPath_replyQueue_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) indexOfObject:a1[5]];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 format:@"Client was not previously registered for waking now playing notifications for specificed playerPath"];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    [*(id *)(a1[4] + 104) removeObjectAtIndex:v2];
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    [v3 _syncWakingPlayerPathsWithReplyQueue:v4 completion:v5];
  }
}

- (void)restoreNowPlayingClientState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRNotificationClient_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __52__MRNotificationClient_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) count];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _syncWakingPlayerPathsWithReplyQueue:0 completion:0];
  }
  return result;
}

+ (id)nowPlayingNotifications
{
  if (nowPlayingNotifications___once != -1) {
    dispatch_once(&nowPlayingNotifications___once, &__block_literal_global_79);
  }
  uint64_t v2 = (void *)nowPlayingNotifications_nowPlayingNotifications;

  return v2;
}

void __47__MRNotificationClient_nowPlayingNotifications__block_invoke()
{
  uint64_t v8 = objc_alloc_init(MRNotificationClient);
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  nowPlayingNotifications_nowPlayingNotifications = (uint64_t)v0;

  uint64_t v2 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  id v3 = [(NSOrderedSet *)v8->_nowPlayingNotifications array];
  [v2 addObjectsFromArray:v3];

  uint64_t v4 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  uint64_t v5 = [(NSOrderedSet *)v8->_supportedCommandsNotifications array];
  [v4 addObjectsFromArray:v5];

  id v6 = (void *)nowPlayingNotifications_nowPlayingNotifications;
  BOOL v7 = [(NSOrderedSet *)v8->_originNotifications array];
  [v6 addObjectsFromArray:v7];
}

- (BOOL)receivesExternalScreenTypeChangedNotifications
{
  return self->_receivesExternalScreenTypeChangedNotifications;
}

- (BOOL)receivesSupportedCommandsNotifications
{
  return self->_receivesSupportedCommandsNotifications;
}

- (BOOL)receivesRoutesChangedNotifications
{
  return self->_receivesRoutesChangedNotifications;
}

- (void)setReceivesRoutesChangedNotifications:(BOOL)a3
{
  self->_receivesRoutesChangedNotifications = a3;
}

- (BOOL)receivesVolumeControlNotifications
{
  return self->_receivesVolumeControlNotifications;
}

- (BOOL)receivesOriginChangedNotifications
{
  return self->_receivesOriginChangedNotifications;
}

- (void)setReceivesOriginChangedNotifications:(BOOL)a3
{
  self->_receivesOriginChangedNotifications = a3;
}

- (BOOL)receivesPlaybackErrorNotifications
{
  return self->_receivesPlaybackErrorNotifications;
}

- (void)setReceivesPlaybackErrorNotifications:(BOOL)a3
{
  self->_receivesPlaybackErrorNotifications = a3;
}

- (BOOL)receivesVoiceInputRecordingStateNotifications
{
  return self->_receivesVoiceInputRecordingStateNotifications;
}

- (void)setReceivesVoiceInputRecordingStateNotifications:(BOOL)a3
{
  self->_receivesVoiceInputRecordingStateNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedWakingPlayerPaths, 0);
  objc_storeStrong((id *)&self->_errorNotifications, 0);
  objc_storeStrong((id *)&self->_voiceInputNotifications, 0);
  objc_storeStrong((id *)&self->_supportedCommandsNotifications, 0);
  objc_storeStrong((id *)&self->_originNotifications, 0);
  objc_storeStrong((id *)&self->_externalScreenNotifications, 0);
  objc_storeStrong((id *)&self->_volumeControlNotifications, 0);
  objc_storeStrong((id *)&self->_routesChangedNotifications, 0);
  objc_storeStrong((id *)&self->_nowPlayingNotifications, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_customNotificationsQueue, 0);
}

void __57__MRNotificationClient_postNotification_userInfo_object___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__MRNotificationClient__postNotification_userInfo_object_withHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end