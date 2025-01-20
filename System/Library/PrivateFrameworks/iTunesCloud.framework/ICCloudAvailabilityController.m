@interface ICCloudAvailabilityController
+ (id)sharedController;
- (BOOL)_isAutoDownloadOnCellularAllowed;
- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed;
- (BOOL)_uncachedIsShowingAllMusic;
- (BOOL)_uncachedIsShowingAllVideo;
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)isNetworkReachable;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (ICCloudAvailabilityController)init;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3;
- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3;
- (void)_onQueue_updateIsCellularDataRestrictedForMusic;
- (void)_registerPerAppNetworkDataAccessPolicyChangedNotification;
- (void)_unregisterPerAppNetworkDataAccessPolicyChangedNotification;
- (void)_wifiStateDidChangeNotification:(id)a3;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)internetConnectionStateChanged:(id)a3;
@end

@implementation ICCloudAvailabilityController

uint64_t __50__ICCloudAvailabilityController_canShowCloudVideo__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 29);
  return result;
}

uint64_t __50__ICCloudAvailabilityController_canShowCloudMusic__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 28);
  return result;
}

uint64_t __75__ICCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)canShowCloudVideo
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICCloudAvailabilityController_canShowCloudVideo__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canShowCloudMusic
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICCloudAvailabilityController_canShowCloudMusic__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __85__ICCloudAvailabilityController_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 27)) {
    BOOL v2 = (unint64_t)(*(void *)(v1 + 40) - 1) <= 0x1F2 && *(unsigned char *)(v1 + 20) != 0;
  }
  else {
    BOOL v2 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ICCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__ICCloudAvailabilityController_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)sharedController
{
  if (sharedController___once != -1) {
    dispatch_once(&sharedController___once, &__block_literal_global_29560);
  }
  BOOL v2 = (void *)sharedController___sharedController;

  return v2;
}

uint64_t __65__ICCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  int v3 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v2 + 24) != v3 || *(unsigned __int8 *)(v2 + 25) != *(unsigned __int8 *)(result + 41))
  {
    *(unsigned char *)(v2 + 24) = v3;
    *(unsigned char *)(*(void *)(result + 32) + 25) = *(unsigned char *)(result + 41);
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    v4 = *(void **)(v1 + 32);
    return objc_msgSend(v4, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)_wifiStateDidChangeNotification:(id)a3
{
  id v4 = +[ICWiFiManager sharedWiFiManager];
  char v5 = [v4 isWiFiEnabled];

  id v6 = +[ICWiFiManager sharedWiFiManager];
  char v7 = [v6 isWiFiAssociated];

  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ICCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke;
  v9[3] = &unk_1E5ACAD58;
  v9[4] = self;
  char v10 = v5;
  char v11 = v7;
  dispatch_async(accessQueue, v9);
}

void __37__ICCloudAvailabilityController_init__block_invoke_37(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setDelegate:");
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = [*(id *)(*(void *)(a1 + 32) + 48) airplaneMode];
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = [*(id *)(a1 + 32) _uncachedIsAutoDownloadOnCellularAllowed];
  id v10 = +[ICEnvironmentMonitor sharedMonitor];
  [v10 registerObserver:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = [v10 isEthernetWired];
  *(unsigned char *)(*(void *)(a1 + 32) + 27) = [v10 isRemoteServerLikelyReachable];
  *(void *)(*(void *)(a1 + 32) + 40) = [v10 networkType];
  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = +[ICWiFiManager sharedWiFiManager];
  [v5 addObserver:v6 selector:sel__wifiStateDidChangeNotification_ name:@"ICWiFiManagerWiFiDidChangeNotification" object:v7];

  id v8 = +[ICWiFiManager sharedWiFiManager];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = [v8 isWiFiEnabled];

  char v9 = +[ICWiFiManager sharedWiFiManager];
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = [v9 isWiFiAssociated];

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
}

uint64_t __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRemoteServerLikelyReachable];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 27) != result)
  {
    *(unsigned char *)(v3 + 27) = result;
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_1E5ACD750;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v4, block);

    objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (void)_onQueue_updateIsCellularDataRestrictedForMusic
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    *(void *)theDict = 0;
    _CTServerConnectionCopyCellularUsagePolicy();
  }
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
    *(_DWORD *)theDict = 134218240;
    *(void *)&theDict[4] = self;
    __int16 v6 = 1024;
    BOOL v7 = isCellularDataRestrictedForMusic;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> Music restrict cellular data: %d", theDict, 0x12u);
  }
}

- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3
{
  BOOL isNetworkReachable = self->_isNetworkReachable;
  if (self->_isNetworkReachable)
  {
    BOOL isShowingAllMusic = self->_isShowingAllMusic;
    BOOL isShowingAllVideo = self->_isShowingAllVideo;
  }
  else
  {
    BOOL isShowingAllMusic = 0;
    BOOL isShowingAllVideo = 0;
  }
  if (self->_canShowCloudMusic == isShowingAllMusic && self->_canShowCloudVideo == isShowingAllVideo)
  {
    if (self->_hasProperNetworkConditionsToShowCloudMedia != isNetworkReachable)
    {
      self->_hasProperNetworkConditionsToShowCloudMedia = isNetworkReachable;
      if (a3)
      {
        BOOL v7 = dispatch_get_global_queue(0, 0);
LABEL_12:
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2;
        v9[3] = &unk_1E5ACD750;
        v9[4] = self;
        dispatch_async(v7, v9);
      }
    }
  }
  else
  {
    self->_canShowCloudMusic = isShowingAllMusic;
    self->_canShowCloudVideo = isShowingAllVideo;
    if (a3)
    {
      BOOL v7 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke;
      block[3] = &unk_1E5ACD750;
      block[4] = self;
      dispatch_async(v7, block);

      BOOL v8 = self->_isNetworkReachable;
      if (self->_hasProperNetworkConditionsToShowCloudMedia == v8) {
        return;
      }
      self->_hasProperNetworkConditionsToShowCloudMedia = v8;
      goto LABEL_12;
    }
    if (self->_hasProperNetworkConditionsToShowCloudMedia != isNetworkReachable) {
      self->_hasProperNetworkConditionsToShowCloudMedia = isNetworkReachable;
    }
  }
}

- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3
{
  BOOL isNetworkReachable = self->_isNetworkReachable;
  if (self->_canShowCloudDownloadButtons != isNetworkReachable)
  {
    self->_canShowCloudDownloadButtons = isNetworkReachable;
    if (a3)
    {
      char v5 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__ICCloudAvailabilityController__onQueue_updateCanShowCloudDownloadButtonsWithNotification___block_invoke;
      block[3] = &unk_1E5ACD750;
      block[4] = self;
      dispatch_async(v5, block);
    }
  }
}

- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

uint64_t __49__ICCloudAvailabilityController_sharedController__block_invoke()
{
  sharedController___sharedController = objc_alloc_init(ICCloudAvailabilityController);

  return MEMORY[0x1F41817F8]();
}

void __65__ICCloudAvailabilityController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _registerPerAppNetworkDataAccessPolicyChangedNotification];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(v3 + 19);
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 41);
    int v7 = *(unsigned __int8 *)(v3 + 20);
    int v10 = 134219008;
    uint64_t v11 = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> _isCellularDataActive=%{BOOL}u, cellularDataRestrictedForMusic=%{BOOL}u, newIsCellularDataActive=%{BOOL}u, newCellularDataRestrictedForMusic=%{BOOL}u", (uint8_t *)&v10, 0x24u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned __int8 *)(v8 + 19) != v9 || *(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(v8 + 20))
  {
    *(unsigned char *)(v8 + 19) = v9;
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
  BOOL isCellularDataActive = self->_isCellularDataActive;
  int v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    telephonyClient = self->_telephonyClient;
    *(_DWORD *)buf = 134218240;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    v22 = telephonyClient;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> getting CTDataConnectionStatus from _telephonyClient <CoreTelephonyClient %p>", buf, 0x16u);
  }

  uint64_t v8 = self->_telephonyClient;
  id v18 = 0;
  int v9 = [(CoreTelephonyClient *)v8 getInternetConnectionStateSync:&v18];
  int v10 = (CoreTelephonyClient *)v18;
  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "<ICCloudAvailabilityController %p> _applicationWillEnterForeground [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0x16u);
    }

    BOOL v12 = isCellularDataActive;
  }
  else
  {
    BOOL v12 = [v9 state] == 2;
    int v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      uint64_t v20 = self;
      __int16 v21 = 2113;
      v22 = (CoreTelephonyClient *)v9;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> received _telephonyClient CTDataConnectionStatus.state=%{private}@", buf, 0x16u);
    }
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICCloudAvailabilityController__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E5ACAD58;
  block[4] = self;
  BOOL v16 = isCellularDataRestrictedForMusic;
  BOOL v17 = v12;
  dispatch_async(accessQueue, block);
}

- (ICCloudAvailabilityController)init
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)ICCloudAvailabilityController;
  id v2 = [(ICCloudAvailabilityController *)&v28 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudAvailabilityController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_BOOL isShowingAllMusic = [(ICCloudAvailabilityController *)v2 _uncachedIsShowingAllMusic];
    v2->_BOOL isShowingAllVideo = [(ICCloudAvailabilityController *)v2 _uncachedIsShowingAllVideo];
    int v5 = +[ICDeviceInfo currentDeviceInfo];
    int v6 = [v5 hasCellularDataCapability];

    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_accessQueue];
      telephonyClient = v2->_telephonyClient;
      v2->_telephonyClient = (CoreTelephonyClient *)v7;

      int v9 = v2->_telephonyClient;
      id v27 = 0;
      int v10 = [(CoreTelephonyClient *)v9 getInternetConnectionStateSync:&v27];
      id v11 = v27;
      if (v11)
      {
        BOOL v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "<ICCloudAvailabilityController %p> init [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0x16u);
        }

        v2->_BOOL isCellularDataActive = 0;
      }
      else
      {
        v2->_BOOL isCellularDataActive = [v10 state] == 2;
      }
      [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v30 = __Block_byref_object_copy__29545;
    v31 = __Block_byref_object_dispose__29546;
    int v13 = v2;
    v32 = v13;
    __int16 v14 = v2->_accessQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__ICCloudAvailabilityController_init__block_invoke;
    handler[3] = &unk_1E5ACACE0;
    handler[4] = buf;
    v13->_preferencesChangedNotifyTokenIsValid = notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v13->_preferencesChangedNotifyToken, v14, handler) == 0;
    int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];

    BOOL v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v13 selector:sel__applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __37__ICCloudAvailabilityController_init__block_invoke_2;
    v24 = &unk_1E5ACAD08;
    v25 = buf;
    v13->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    [(ICCloudAvailabilityController *)v13 _registerPerAppNetworkDataAccessPolicyChangedNotification];
    v13->_BOOL isCellularDataRestrictedForMusic = 1;
    BOOL v17 = v2->_accessQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__ICCloudAvailabilityController_init__block_invoke_37;
    v19[3] = &unk_1E5ACD750;
    uint64_t v20 = v13;
    dispatch_async(v17, v19);

    _Block_object_dispose(buf, 8);
  }
  return v2;
}

- (void)_registerPerAppNetworkDataAccessPolicyChangedNotification
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    uint64_t v3 = _CTServerConnectionRegisterForNotification();
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    int v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134218496;
        id v11 = self;
        __int16 v12 = 1024;
        int v13 = v3;
        __int16 v14 = 1024;
        int v15 = HIDWORD(v3);
        int v6 = "<ICCloudAvailabilityController %p> Error (domain %d, code %d) registering for PerAppNetworkDataAccessPolicy"
             "ChangedNotification";
        uint64_t v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        uint32_t v9 = 24;
LABEL_7:
        _os_log_impl(&dword_1A2D01000, v7, v8, v6, (uint8_t *)&v10, v9);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = self;
      int v6 = "<ICCloudAvailabilityController %p> _registerPerAppNetworkDataAccessPolicyChangedNotificationfor CTPerAppNetwo"
           "rkDataAccessPolicyChangedNotification";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }
}

- (BOOL)_uncachedIsShowingAllVideo
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"VideosShowCloudMediaEnabledSetting", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (BOOL)_uncachedIsShowingAllMusic
{
  return 1;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  if (!self->_isNetworkReachable) {
    return 1;
  }
  if ((unint64_t)(self->_networkType - 1) > 0x1F2) {
    return 0;
  }
  return [(ICCloudAvailabilityController *)self isCellularDataRestrictedForVideos];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)internetConnectionStateChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 state] == 2;
  if (self->_isCellularDataActive != v4)
  {
    int v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isCellularDataActive = self->_isCellularDataActive;
      int v7 = 134218496;
      os_log_type_t v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = isCellularDataActive;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> CoreTelephonyClientDataDelegate internetConnectionStateChanged: _isCellularDataActive=%{BOOL}u, newIsCellularDataActive=%{BOOL}u", (uint8_t *)&v7, 0x18u);
    }

    self->_BOOL isCellularDataActive = v4;
    [(ICCloudAvailabilityController *)self _onQueue_updateCanShowCloudDownloadButtonsWithNotification:1];
    [(ICCloudAvailabilityController *)self _onQueue_updateCanShowCloudTracksWithNotification:1];
  }
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __72__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) networkType];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 40);
  if (v4 != result)
  {
    char v5 = ((unint64_t)(v4 - 1) < 0x1F3) ^ ((unint64_t)(result - 1) < 0x1F3);
    BOOL v6 = v4 > 1999;
    *(void *)(v3 + 40) = result;
    *(unsigned char *)(*(void *)(a1 + 40) + 26) = result == 2000;
    if ((v5 & 1) != 0 || v6 != result > 1999)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      int v7 = *(void **)(a1 + 40);
      return objc_msgSend(v7, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
    }
  }
  return result;
}

void __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerHasProperNetworkConditionsToShowCloudMediaDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __92__ICCloudAvailabilityController__onQueue_updateCanShowCloudDownloadButtonsWithNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_unregisterPerAppNetworkDataAccessPolicyChangedNotification
{
  if (self->_ctServerConnection) {
    MEMORY[0x1F40DF238]();
  }
}

- (BOOL)_isAutoDownloadOnCellularAllowed
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ICCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__ICCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ICCloudAvailabilityController__applicationDidEnterBackground___block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __64__ICCloudAvailabilityController__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterPerAppNetworkDataAccessPolicyChangedNotification];
}

- (void)airplaneModeChanged
{
  char v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICCloudAvailabilityController_airplaneModeChanged__block_invoke;
  v5[3] = &unk_1E5ACAD30;
  v5[4] = self;
  char v6 = v3;
  dispatch_async(accessQueue, v5);
}

uint64_t __52__ICCloudAvailabilityController_airplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 17) = v2;
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    uint64_t v4 = *(void **)(v3 + 32);
    return objc_msgSend(v4, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ICCloudAvailabilityController_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__ICCloudAvailabilityController_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 27);
  return result;
}

- (BOOL)canShowCloudDownloadButtons
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ICCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__ICCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 30);
  return result;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  if (!self->_isNetworkReachable) {
    return 1;
  }
  if ((unint64_t)(self->_networkType - 1) > 0x1F2) {
    return 0;
  }
  return [(ICCloudAvailabilityController *)self isCellularDataRestrictedForStoreApps];
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218240;
    uint64_t v6 = self;
    __int16 v7 = 1024;
    int v8 = 1;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> StoreApps allow cellular data: %d", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = +[ICNetworkConstraints constraintsForSystemApplicationType:1];
  int v4 = [v3 shouldAllowDataForCellularNetworkTypes];
  int v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    int v8 = self;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> Videos allow cellular data: %d", (uint8_t *)&v7, 0x12u);
  }

  return v4 ^ 1;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ICCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__ICCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  if (!self->_isNetworkReachable) {
    return 0;
  }
  if ((unint64_t)(self->_networkType - 1) > 0x1F2) {
    return 1;
  }
  return self->_isAutoDownloadOnCellularAllowed;
}

- (void)dealloc
{
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  [(RadiosPreferences *)self->_radiosPreferences setDelegate:0];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];

  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIApplicationDidEnterBackgroundNotification" object:0];

  if (self->_preferencesChangedNotifyTokenIsValid) {
    notify_cancel(self->_preferencesChangedNotifyToken);
  }
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = +[ICWiFiManager sharedWiFiManager];
  [v5 removeObserver:self name:@"ICWiFiManagerWiFiDidChangeNotification" object:v6];

  if (self->_ctServerConnection)
  {
    [(ICCloudAvailabilityController *)self _unregisterPerAppNetworkDataAccessPolicyChangedNotification];
    CFRelease(self->_ctServerConnection);
  }
  v7.receiver = self;
  v7.super_class = (Class)ICCloudAvailabilityController;
  [(ICCloudAvailabilityController *)&v7 dealloc];
}

uint64_t __37__ICCloudAvailabilityController_init__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    int v5 = v1;
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    int v2 = [v5 _uncachedIsShowingAllMusic];
    int v3 = [v5 _uncachedIsShowingAllVideo];
    if (v5[21] != v2 || v5[22] != v3)
    {
      v5[21] = v2;
      v5[22] = v3;
      objc_msgSend(v5, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(v5, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __37__ICCloudAvailabilityController_init__block_invoke_2(uint64_t a1, const __CFString *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (CFEqual(a2, (CFStringRef)*MEMORY[0x1E4F23E88]))
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      id v6 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p>  Received kCTPerAppNetworkDataAccessPolicyChangedNotification. Updating cellular data restrictions", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "_onQueue_updateIsCellularDataRestrictedForMusic");
  }
}

@end